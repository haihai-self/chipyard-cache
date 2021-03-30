
module BoomMSHR (
    input                                                    clock,
    input                                                    reset,
    input        [                                      1:0] io_id,
    input                                                    io_req_pri_val,
    input                                                    io_req_sec_val,
    input                                                    io_clear_prefetch,
    input                                                    io_exception,
    input                                                    io_req_is_probe,
    input        [HasL1HellaCacheParameters::encRowBits-1:0] io_lb_resp,
    input                                                    io_wb_resp,
    output                                                   io_req_pri_rdy,
    output                                                   io_req_sec_rdy,
    output                                                   io_probe_rdy,
    output logic                                             io_commit_val,
    output logic [                     `coreMaxAddrBits-1:0] io_commit_addr,
    output logic [     BundleParam::TLPermissions_width-1:0] io_commit_coh,


    input ExuST::BrUpdateInfoST           io_brupdate,
    input MSHRST::BoomDCacheReqInternalST io_req,

    ValidIF.out     io_idx,  //bits_size= 
    ValidIF.out     io_way,  //bits_size= 
    ValidIF.out     io_tag,  //bits_size=
    DecoupledIF.in  io_mem_acquire,  //TLBundleA
    DecoupledIF.out io_mem_grant,  //TLBundleD
    DecoupledIF.in  io_mem_finish,  //TLBundleE
    ValidIF.in      io_prober_state,  //bits_size=coreMaxAddrBits
    DecoupledIF.in  io_refill,  //L1DataWriteReq
    DecoupledIF.in  io_meta_write,  //L1MetaWriteReq
    DecoupledIF.in  io_meta_read,  //L1MetaReadReq
    ValidSTIF.in    io_meta_resp,  //L1Metadata
    DecoupledIF.in  wb_req,  //WritebackReq
    DecoupledIF.in  io_lb_read,  //LineBufferReadReq
    DecoupledIF.in  io_lb_write,  //LineBufferWriteReq
    DecoupledIF.in  io_replay,  //BoomDCacheReqInternal
    DecoupledIF.in  io_resp  //BoomDCacheResp
);

  //signal io fire
  logic io_mem_acquire_fire;
  logic io_meta_read_fire;
  logic io_meta_write_fire;
  logic io_wb_req_fire;
  logic io_refill_fire;
  logic io_mem_finish_fire;


  always_comb begin
    io_mem_acquire_fire = io_mem_acquire.valid && io_mem_acquire.ready;
    io_meta_read_fire = io_meta_read.valid && io_meta_read.ready;
    io_meta_write_fire = io_meta_write.valid && io_meta_write.ready;
    io_wb_req_fire = io_wb_req.valid && io_wb_req.ready;
    io_refill_fire = io_refill.valid && io_refill.ready;
    io_mem_finish_fire = io_mem_finish.valid && io_mem_finish.ready;

  end

  typedef enum {
    s_invalid,
    s_refill_req,
    s_refill_resp,
    s_drain_rpq_loads,
    s_meta_read,
    s_meta_resp_1,
    s_meta_resp_2,
    s_meta_clear,
    s_wb_meta_read,
    s_wb_req,
    s_wb_resp,
    s_commit_line,
    s_drain_rpq,
    s_meta_write_req,
    s_mem_finish_1,
    s_mem_finish_2,
    s_prefetched,
    s_prefetch
  } MSHRSStates;
  MSHRSStates states;
  MSHRST::BoomDCacheReqInternalST req;
  logic req_needs_wb;
  logic [BundleParam::TLPermissions_width-1:0] new_coh;
  TileLinkST::onSecondaryAccessST osa;
  logic grantack_valid;
  BundleST::TLBundleAST grantack;
  logic [$clog2(HasL1CacheParameters::cacheDataBeats)-1:0] refill_ctr;
  logic commit_line;
  logic grant_had_data;
  logic finish_to_prefetch;
  logic [1:0] meta_hazard;


  //wire
  logic [`blockOffBits-1:0] req_idx;
  logic [HasL1CacheParameters::tagBits-1:0] req_tag;
  logic [`paddrBits-1:0] req_block_addr;
  logic [BundleParam::cwidth-1:0] shrink_param;
  logic [BundleParam::TLPermissions_width-1:0] coh_on_clear;
  logic [BundleParam::TLPermissions_width-1:0] grow_param;
  logic [BundleParam::TLPermissions_width-1:0] coh_on_grant;
  logic refill_done;
  logic sec_rdy;
  logic [5:0] on_cache_result;
  logic drain_load;
  logic needs_wb;
  logic commit_line;
  logic is_hit;


  assign req_idx = req.addr[HasL1CacheParameters::untagBits - 1:`blockOffBits];
  assign req_tag = req.addr >> HasL1CacheParameters::untagBits;
  assign req_block_addr = ((req.addr >> `blockOffBits) << `blockOffBits);

  assign {shrink_param, coh_on_clear} =
      onCacheControl(req.old_meta_coh_state, MemoryOpConstants::M_FLUSH);  // need one bit flag

  assign grow_param = onAccess(new_coh, req.uop.mem_cmd);
  assign coh_on_grant = onGrant(req.uop.mem_cmd, io_mem_grant);

  assign osa = onSecondaryAccess(new_coh, req.uop.mem_cmd, io_req.uop.mem_cmd);

  // logic refill_done;
  // logic refill_address_inc;
  // ... = edge::addr_inc(io_mem_grant)  // check need to imp addr_inc;

  assign sec_rdy = !osa.needs_second_acq && !io_req_is_probe && (
      states inside {s_invalid, s_meta_write_req, s_mem_finish_1, s_mem_finish_2});

  // connection BranchKillableQueue
  logic rpq_io_empty;
  logic [$clog2(DCacheParams::nRPQ)-1:0] rpq_io_count;
  logic rpq_io_enq_fire;

  DecoupledIF #(.T(MSHRST::BoomDCacheReqInternalST)) rpq_io_deq ();
  DecoupledIF #(.T(MSHRST::BoomDCacheReqInternalST)) rpq_io_enq ();


  BranchKillableQueue #(
      .flow(0),
      .entries(DCacheParams::nRPQ),
      .T(MSHRST::BoomDCacheReqInternalST)
  ) rpq (
      .clock      (clock),
      .reset      (reset),
      .io_enq     (rpq_io_enq),
      .io_deq     (rpq_io_deq),
      .io_brupdate(io_brupdate),
      .io_flush   (io_exception),
      .io_empty   (rpq_io_empty),
      .io_count   (rpq_io_count)
  );

  // assign rpq
  always_comb begin
    rpq_io_enq.valid = (io_req_pri_val && io_req_pri_rdy) || (io_req_sec_val && io_req_sec_rdy) &&
        !isPrefetch(io_req.uop.mem_cmd);

    rpq_io_enq.valid = (io_req_pri_val && io_req_pri_rdy) || (io_req_sec_val && io_req_sec_rdy) &&
        !isPrefetch(io_req.uop.mem_cmd);

    rpq_io_enq.bits = io_req;
    rpq_io_deq.ready = 0;
    rpq_io_enq_fire = rpq_io_enq.valid && rpq_io_enq.ready;

    if (states == s_drain_rpq_loads) begin
      rpq_io_deq.ready = io_resp.ready && io_lb_read.ready && drain_load;
    end
  end

  //function handle_pri_req
  function automatic MSHRSStates handle_pri_req(MSHRSStates old_state);
    logic [BundleParam::TLPermissions_width-1:0] old_coh;
    logic [2:0] on_access;
    MSHRSStates new_state;

    new_state = old_state;
    old_coh = io_req.old_meta.coh;
    if (io_req.tag_match) begin
      logic is_hit;
      logic coh_on_hit;
      on_access = onAccess(old_coh, io_req.uop.mem_cmd);
      is_hit = on_access[2];
      coh_on_hit = on_access[1:0];
      if (is_hit) begin
        assert (isWrite(io_req.uop.mem_cmd));
        new_coh = coh_on_hit;
        new_state = s_drain_rpq;
      end else begin
        new_coh = old_coh;
        new_state = s_refill_req;
      end
    end else begin
      new_coh = BundleParam::Nothing;
      new_state = s_refill_req;
    end

    return new_state;

  endfunction

  function handle_prio_reg();
    grantack.valid <= 0;
    refill_ctr <= 0;
    assert (rpq_io_enq.ready);
    req = io_req;
    req_needs_wb = on_cache_result[5];

  endfunction
  //assign meta_hazard
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      meta_hazard <= 0;
    end else begin
      if (meta_hazard != 0) meta_hazard <= meta_hazard + 1;
      if (io_meta_write_fire) meta_hazard <= 1;
    end
  end

  // init and assign wire
  always_comb begin
    on_cache_result = onCacheControl(io_req.old_meta.coh, MemoryOpConstants::M_FLUSH);

    if (states == s_drain_rpq_loads) begin
      drain_load = (isRead(rpq_io_deq.bits.uop.mem_cmd) && !isWrite(rpq_io_deq.bits.uop.mem_cmd) &&
                    (rpq_io_deq.bits.mem_cmd != MemoryOpConstants::M_XLR));
    end
  end

  // assign io
  always_comb begin
    // init io
    io_probe_rdy = (meta_hazard == 0 && (
                    states inside {s_invalid, s_refill_req, s_refill_resp, s_drain_rpq_loads} || (
                        states == s_meta_read && grantack.valid)));
    io_idx.valid = states != s_invalid;
    io_tag.valid = states != s_invalid;
    io_way.valid = !states inside {s_invalid, s_prefetch};
    io_idx.bits = req_idx;
    io_tag.bits = req_tag;
    io_way.bits = req.way_en;
    io_meta_write.valid = 0;
    io_req_pri_rdy = 0;
    io_req_sec_rdy = sec_rdy && rpq_io_end.ready;
    io_mem_acquire = 0;
    io.refill.valid = 0;
    io_replay.valid = 0;
    io_wb_req.valid = 0;
    io_resp.valid = 0;
    io_commit_val = 0;
    io_commit_addr = req.addr;
    io_commit_coh = coh_on_grant;
    io_meta_read.valid = 0;
    io_mem_finish.valid = 0;
    io_lb_write.valid = 0;
    io_lb_read.valid = 0;

    // assign io
    if (states == s_drain_rpq_loads) begin
      io_lb_read.valid = rpq_io_deq.valid && drain_load;
      io_lb_read.bits.id = io_id;
      io_lb_read.bits.offset = rpq_io_deq.bits.addr >> HasL1CacheParameters::rowOffBits;
    end

    case (states)
      s_invalid: begin
        io_req_pri_rdy = 1;
      end
      default: begin

      end
    endcase

  end

  //assign reg
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      req_needs_wb <= 0;
      new_coh <= 0;

    end else begin
      if (io_req_sec_val && io_req_sec_rdy) begin
        req.uop.mem_cmd <= oas.dirtiest_cmd;
        if (oas.hit_again) new_coh <= oas.dirtiest_state;
      end
      case (states)
        s_invalid: begin
          grant_had_data <= 0;
          if (io_req_pri_val && io_req_sec_rdy) handle_prio_reg();
        end
        default: begin

        end
      endcase
    end
  end

  //assign states
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      states <= s_invalid;
    end else begin
      case (states)
        s_invalid: if (io_req_pri_val && io_req_sec_rdy) states <= handle_pri_req(states);

        s_refill_req: if (io_mem_acquire_fire) states <= s_refill_resp;

        s_refill_resp: if (refill_done) states = grant_had_data ? s_drain_rpq_loads : s_drain_rpq;

        s_drain_rpq_loads:
        if (rpq_io_empty && !commit_line)
          if (rpq_io_enq_fire) states <= s_mem_finish_1;
          else if (rpq_io_empty || (rpq_io_deq.valid && !drain_load)) states <= s_meta_read;

        s_meta_read: if (io_meta_read_fire) states <= s_meta_resp_1;

        s_meta_resp_1: states <= s_meta_resp_2;

        s_meta_resp_2:
        states <= io_meta_resp.valid ? s_meta_read : needs_wb ? s_meta_clear : s_commit_line;

        s_meta_clear: if (io_meta_write_fire) states <= s_wb_req;

        s_wb_req: if (io_wb_req_fire) states <= s_wb_resp;

        s_wb_resp: if (io_wb_resp) states <= s_commit_line;

        s_commit_line:
        if (io_refill_fire)
          if (refill_ctr == (HasL1CacheParameters::cacheDataBeats - 1)) states <= s_drain_rpq;

        s_drain_rpq: if (rpq_io_empty && !rpq_io_enq.valid) states <= s_meta_write_req;

        s_meta_write_req: if (io_meta_write_fire) states <= s_mem_finish_1;

        s_mem_finish_1: if (io_mem_finish_fire || !grantack_valid) states <= s_mem_finish_2;

        s_mem_finish_2: states <= finish_to_prefetch ? s_prefetch : s_invalid;

        s_prefetch:
        if (io_req_sec_val && !io_req_sec_rdy || io_clear_prefetch) states <= s_invalid;
        else if (io_req_sec_val && io_req_sec_rdy)
          if (is_hit) states <= s_meta_read;
          else states <= s_refill_req;
        else if (io_req_pri_val && io_req_pri_rdy) states <= handle_pri_req(states);
      endcase
    end
  end
endmodule
