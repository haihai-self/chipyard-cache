
module BoomMSHR (
    input  logic                                             clock,
    input  logic                                             reset,
    input  logic [                                      1:0] io_id,
    input  logic                                             io_req_pri_val,
    input  logic                                             io_req_sec_val,
    input  logic                                             io_clear_prefetch,
    input  logic                                             io_exception,
    input  logic                                             io_req_is_probe,
    input  logic [HasL1HellaCacheParameters::encRowBits-1:0] io_lb_resp,
    input  logic                                             io_wb_resp,
    output logic                                             io_req_pri_rdy,
    output logic                                             io_req_sec_rdy,
    output logic                                             io_probe_rdy,
    output logic                                             io_commit_val,
    output logic [                     `coreMaxAddrBits-1:0] io_commit_addr,
    output logic [     BundleParam::TLPermissions_width-1:0] io_commit_coh,


    input ExuST::BrUpdateInfoST           io_brupdate,
    input MSHRST::BoomDCacheReqInternalST io_req,

    ValidIF.out     io_idx,  //bits_size= 
    ValidIF.out     io_way,  //bits_size= 
    ValidIF.out     io_tag,  //bits_size=
    ValidIF.in      io_prober_state,  //bits_size=coreMaxAddrBits
    ValidSTIF.in    io_meta_resp,  //L1MetadataST
    DecoupledIF.in  io_mem_acquire,  //TLBundleAST
    DecoupledIF.out io_mem_grant,  //TLBundleDST
    DecoupledIF.in  io_mem_finish,  //TLBundleEST
    DecoupledIF.in  io_refill,  //L1DataWriteReqST
    DecoupledIF.in  io_meta_write,  //L1MetaWriteReqST
    DecoupledIF.in  io_meta_read,  //L1MetaReadReqST
    DecoupledIF.in  io_wb_req,  //WritebackReqST
    DecoupledIF.in  io_lb_read,  //LineBufferReadReqST
    DecoupledIF.in  io_lb_write,  //LineBufferWriteReqST
    DecoupledIF.in  io_replay,  //BoomDCacheReqInternalST
    DecoupledIF.in  io_resp  //BoomDCacheRespST
);

  //signal io fire
  logic io_mem_acquire_fire;
  logic io_meta_read_fire;
  logic io_meta_write_fire;
  logic io_wb_req_fire;
  logic io_refill_fire;
  logic io_mem_finish_fire;
  logic io_lb_read_fire;
  logic io_mem_grant_fire;
  logic io_replay_fire;


  always_comb begin
    io_mem_acquire_fire = io_mem_acquire.valid && io_mem_acquire.ready;
    io_meta_read_fire = io_meta_read.valid && io_meta_read.ready;
    io_meta_write_fire = io_meta_write.valid && io_meta_write.ready;
    io_wb_req_fire = io_wb_req.valid && io_wb_req.ready;
    io_refill_fire = io_refill.valid && io_refill.ready;
    io_mem_finish_fire = io_mem_finish.valid && io_mem_finish.ready;
    io_lb_read_fire = io_lb_read.valid && io_lb_read.ready;
    io_mem_grant_fire = io_mem_grant.valid && io_mem_grant.ready;
    io_replay_fire = io_replay.valid && io_replay.ready;

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
  logic [BundleParam::TLPermissions_width-1:0] coh_on_hit_s_drain_rpq;
  logic [BundleParam::TLPermissions_width-1:0] coh_on_hit_s_prefetch;
  logic sec_rdy;
  logic [5:0] on_cache_result;
  logic drain_load;
  logic needs_wb;
  logic is_hit_s_prefetch;
  logic [39:0] rp_addr;
  logic data_word_hi;
  logic [127:0] data_word;



  assign req_idx = req.addr[HasL1CacheParameters::untagBits - 1:`blockOffBits];
  assign req_tag = req.addr >> HasL1CacheParameters::untagBits;
  assign req_block_addr = ((req.addr >> `blockOffBits) << `blockOffBits);

  assign {shrink_param, coh_on_clear} =
      onCacheControl(req.old_meta_coh_state, MemoryOpConstants::M_FLUSH);  // need one bit flag

  assign grow_param = onAccess(new_coh, req.uop.mem_cmd);
  assign coh_on_grant = onGrant(req.uop.mem_cmd, io_mem_grant);

  assign osa = onSecondaryAccess(new_coh, req.uop.mem_cmd, io_req.uop.mem_cmd);

  // generate refill_done and refill_address_inc
  logic refill_done;
  logic [11:0] refill_address_inc;
  logic [7:0] counter;
  wire [26:0] _beats1_decode_T_1 = 27'hfff << io_mem_grant.bits.size;
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0];
  wire [7:0] beats1_decode = _beats1_decode_T_3[11:4];
  wire beats1_opdata = io_mem_grant.bits.opcode[0];
  wire [7:0] beats1 = beats1_opdata ? beats1_decode : 8'h0;
  wire first = counter == 0;
  wire last = counter == 1 || beats1 == 0;
  wire [7:0] counter1 = counter - 1;
  assign refill_done = io_mem_grant_fire && last;
  assign refill_address_inc = {beats1 & counter1, 4'h0};
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      counter <= 0;
    end else begin
      if (io_mem_grant_fire) counter <= first ? beats1 : counter1;
    end
  end

  assign sec_rdy = !osa.needs_second_acq && !io_req_is_probe && (
      states inside {s_invalid, s_meta_write_req, s_mem_finish_1, s_mem_finish_2});

  // connection BranchKillableQueue
  logic rpq_io_empty;
  logic [$clog2(DCacheParams::nRPQ)-1:0] rpq_io_count;
  logic rpq_io_enq_fire;
  logic rpq_io_deq_fire;

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
    rpq_io_deq_fire = rpq_io_deq.valid && rpq_o_deq.ready;

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
        iswriteok :
        assert (isWrite(io_req.uop.mem_cmd))
        else $error("Assertion iswriteok failed!");
        new_coh = coh_on_hit;
        new_state = s_drain_rpq;
      end else begin
        new_coh = old_coh;
        new_state = s_refill_req;
      end
    end else begin
      new_coh = 0;
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

    case (states)

      s_drain_rpq_loads: begin
        drain_load = (isRead(rpq_io_deq.bits.uop.mem_cmd) && !isWrite(rpq_io_deq.bits.uop.mem_cmd)
                      && (rpq_io_deq.bits.mem_cmd != MemoryOpConstants::M_XLR));
        rp_addr = {req_tag, req_idx, rpq_io_deq.bits.addr[`blockOffBits - 1:0]};
        data_word_hi = rp_addr[3];
        data_word = io_lb_resp >> ({data_word_hi, 6'h0});

      end

      s_meta_resp_2: begin
        logic [5:0] temp;
        temp = onCacheControl(io_meta_resp.bits.coh, MemoryOpConstants::M_FLUSH);
        needs_wb = temp[5];
      end

      s_drain_rpq: begin
        if (io_replay_fire && isWrite(rpq_io_deq.bits.uop.mem_cmd)) begin
          logic is_hit_s_drain_rpq;
          logic [2:0] on_access;
          on_access = onAccess(new_coh, rpq_io_deq.bits.uop.mem_cmd);
          is_hit_s_drain_rpq = on_access[2];
          coh_on_hit_s_drain_rpq = on_access[1:0];
          assert (is_hit_s_drain_rpq)
          else $error("Assertion label failed!");
        end
      end

      s_prefetch: begin
        if (io_replay_fire && isWrite(rpq_io_deq.bits.uop.mem_cmd)) begin
          logic [2:0] on_access;
          on_access = onAccess(new_coh, io_req.uop.mem_cmd);
          is_hit_s_prefetch = on_access[2];
          coh_on_hit_s_prefetch = on_access[1:0];
        end

      end
    endcase
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
    case (states)
      s_invalid: begin
        io_req_pri_rdy = 1;
      end

      s_refill_req: begin
        io_mem_acquire.valid = 1;
        io_mem_acquire.bits = AcquireBlock(
        .fromSource(io_id),
        .toAddress({req_tag, req_idx} << `blockOffBits),
        .lgSize(HasL1HellaCacheParameters::lgCacheBlockBytes),
        .growPermissions(grow_param)
        );
      end

      s_refill_resp: begin
        if (hasDataD(io_mem_grant.bits)) begin  //need to imp hasdata
          io_mem_grant.ready = io_lb_write.ready;
          io_lb_write.valid = io_mem_grant.valid;
          io_lb_write.bits.id = io_id;
          io_lb_write.bits.offset = refill_address_inc >> HasL1CacheParameters::rowOffBits;
          io_lb_write.bits.data = io_mem_grant.bits.data;
        end else begin
          io_mem_grant.ready = 1;
        end
      end

      s_drain_rpq_loads: begin
        io_lb_read.valid = rpq_io_deq.valid && drain_load;
        io_lb_read.bits.id = io_id;
        io_lb_read.bits.offset = rpq_io_deq.bits.addr >> HasL1CacheParameters::rowOffBits;

        io_resp.valid = rpq_io_deq.valid && io_lb_read_fire && drain_load;
        io_resp.bits.uop = rpq_io_deq.bits.uop;
        io_resp.bits.data = loadgen_data();
        io_resp.bits.is_hella = rpq_io_deq.bits.is_hella;

        if (rpq_io_empty || (rpq_io_deq.valid && drain_load)) io_commit_val = 1;
      end

      s_meta_read: begin
        io_meta_read.valid = io_prober_state.valid || !grantack_valid || (
            io_prober_state.bits[HasL1CacheParameters::untagBits - 1:`blockOffBits] != req_idx);
        io_meta_read.bits.idx = req_idx;
        io_meta_read.bits.tag = req_tag;
        io_meta_read.bits.way_en = req.way_en;
      end

      s_meta_clear: begin
        io_meta_write.valid = 1;
        io_meta_write.bits.idx = req_idx;
        io_meta_write.bits.data.coh = coh_on_clear;
        io_meta_write.bits.data.tag = req_tag;
        io_meta_write.bits.way_en = req.way_en;
      end

      s_wb_req: begin
        io_wb_req.valid = 1;
        io_wb_req.bits.tag = req.old_meta.tag;
        io_wb_req.bits.idx = req_idx;
        io_wb_req.bits.param = shrink_param;
        io_wb_req.bits.way_en = req.way_en;
        io_wb_req.bits.source = io_id;
        io_wb_req.bits.voluntary = 1;
      end

      s_wb_resp: begin
        io_lb_read.valid = 1;
        io_lb_read.bits.id = io_id;
        io_lb_read.bits.offset = refill_ctr;

        io_refill.valid = io_lb_read_fire;
        io_refill.bits.addr = req_block_addr | (refill_ctr << HasL1CacheParameters::rowOffBits);
        io_refill.bits.way_en = req.way_en;
        io_refill.bits.wmask = 1;
        io_refill.bits.data = io_resp;
      end

      s_drain_rpq: begin
        io_replay.valid = rpq_io_deq.valid;
        io_replay.bits = rpq_io_deq.bits;
        io_replay.bits.way_en = req.way_en;
        io_replay.bits.addr = {req_tag, req_idx, rpq_io_deq.bits.addr[`blockOffBits - 1:0]};
      end

      s_meta_write_req: begin
        io_meta_write.valid = 1;
        io_meta_write.bits.idx = req_idx;
        io_meta_write.bits.data.coh = new_coh;
        io_meta_write.bits.data.tag = req_tag;
        io_meta_write.bits.way_en = req.way_en;
      end

      s_mem_finish_1: begin
        io_mem_finish.valid = grantack_valid;
        io_mem_finish.bits = grantack;
      end

      s_prefetch: begin
        io_req_pri_rdy = 1;
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
        end

        s_refill_resp: begin
          if (io_mem_grant_fire) grant_had_data <= hasDataD(io_mem_grant.bits);

          if (refill_done) begin
            grantack_valid <= isRequeste(io_mem_grant.bits);
            grantack <= GrantAckST(io_mem_grant.bits);
            assert (!(!grant_had_data && req_needs_wb));  //need to check error
            commit_line <= 0;
            new_coh <= coh_on_grant;
          end
        end

        s_drain_rpq_loads: begin
          if (rpq_io_deq_fire) commit_line <= 1;
          else if (rpq_io_empty && !commit_line) begin
            if (rpq_io_enq_fire) finish_to_prefetch <= `enablePrefetching;
          end
        end
        s_commit_line: begin
          if (io_refill_fire) begin
            refill_ctr <= refill_ctr + 1;
          end
        end
        s_drain_rpq: begin
          if (io_replay_fire && isWrite(rpq_io_deq.bits.uop.mem_cmd)) begin
            new_coh <= coh_on_hit_s_drain_rpq;
          end
        end

        s_meta_write_req: begin
          if (io_meta_write_fire) finish_to_prefetch <= 1;
        end

        s_mem_finish_1: begin
          if (io_mem_finish_fire || !grantack_valid) grantack_valid <= 0;
        end

        s_prefetch: begin
          if (io_req_sec_val && io_req_sec_rdy) begin
            if (is_hit_s_prefetch) new_coh <= coh_on_hit_s_prefetch;
            else new_coh <= 0;
          end else if (io_req_pri_val && io_req_pri_rdy) grant_had_data <= 0;
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
          if (is_hit_s_prefetch) states <= s_meta_read;
          else states <= s_refill_req;
        else if (io_req_pri_val && io_req_pri_rdy) states <= handle_pri_req(states);
      endcase
    end
  end
endmodule
