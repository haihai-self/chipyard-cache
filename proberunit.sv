

module BoomProbeUnit (
    input  logic                                        clock,
    input  logic                                        reset,
    input  logic [     HasL1CacheParameters::nWays-1:0] io_way_en,
    input  logic                                        io_wb_rdy,
    input  logic                                        io_mshr_rdy,
    output logic                                        io_mshr_wb_rdy,
    input        [BundleParam::TLPermissions_width-1:0] io_block_state,

    DecoupledIF.out io_req,
    DecoupledIF.in  io_rep,
    DecoupledIF.in  io_meta_read,
    DecoupledIF.in  io_meta_write,
    DecoupledIF.in  io_wb_req,
    DecoupledIF.in  io_lsu_release,
    ValidIF.out     io_state
);

  //assign fire
  logic io_req_fire;
  logic io_rep_fire;
  logic io_meta_read_fire;
  logic io_meta_write_fire;
  logic io_wb_req_fire;
  logic io_lsu_release_fire;

  always_comb begin
    io_req_fire = io_req.ready && io_req.valid;
    io_rep_fire = io_rep.ready && io_rep.valid;
    io_meta_read_fire = io_meta_read.ready && io_meta_read.valid;
    io_meta_write_fire = io_meta_write.ready && io_meta_write.valid;
    io_wb_req_fire = io_wb_req.ready && io_wb_req.valid;
    io_lsu_release_fire = io_lsu_release.ready && io_lsu_release.valid;
  end

  typedef enum {
    s_invalid,
    s_meta_read,
    s_meta_resp,
    s_mshr_req,
    s_mshr_resp,
    s_lsu_release,
    s_release,
    s_writeback_req,
    s_writeback_resp,
    s_meta_write,
    s_meta_write_resp
  } probstate;
  probstate states;
  BundleST::TLBundleBST req;

  logic [HasL1CacheParameters::idxBits-1:0] req_idx;
  logic [HasL1CacheParameters::tagBits-1:0] req_tag;

  assign req_idx =
      req.address[HasL1HellaCacheParameters::idxMSB - 1:HasL1HellaCacheParameters::idxLSB - 1];
  assign req_tag = req.address[BundleParam::addressBits - 1:HasL1CacheParameters::untagBits];

  logic [HasL1CacheParameters::nWays-1:0] way_en;
  logic tag_matchs;
  logic [BundleParam::TLPermissions_width-1:0] old_coh;
  logic [BundleParam::TLPermissions_width-1:0] miss_coh;
  logic [BundleParam::TLPermissions_width-1:0] reply_coh;

  assign tag_matchs = |way_en;
  assign miss_coh = BundleParam::Nothing;
  assign reply_coh = tag_matchs ? old_coh : miss_coh;

  logic is_dirty;
  logic [BundleParam::cwidth-1:0] report_param;
  logic [BundleParam::TLPermissions_width-1:0] new_coh;

  assign {is_dirty, report_param, new_coh} = MetaData::onProb(reply_coh, req.param);


  //assign init && output 
  always_comb begin
    io_state.valid = states != s_invalid;
    io_state.bits = {8'b0, req.address};

    io_req.ready = states == s_invalid;

    io_rep.valid = states == s_release;
    io_rep.bits = Edge::ProbeAckST(req, report_param);

    // assert(!io_rep.valid || Edge::hasDataC(io_rep.bits));  //need to compile hasdata

    io_meta_read.valid = states == s_meta_read;
    io_meta_read.bits.idx = req_idx;
    io_meta_read.bits.tag = req_tag;

    io_meta_write.valid = states == s_meta_write;
    io_meta_write.bits.way_en = way_en;
    io_meta_write.bits.idx = req_idx;
    io_meta_write.bits.data.tag = req_tag;
    io_meta_write.bits.data.coh = new_coh;

    io_wb_req.valid = states == s_writeback_req;
    io_wb_req.bits.source = req.source;
    io_wb_req.bits.idx = req_idx;
    io_wb_req.bits.tag = req_tag;
    io_wb_req.bits.param = report_param;
    io_wb_req.bits.way_en = way_en;
    io_wb_req.bits.voluntary = 0;

    io_mshr_wb_rdy = !(states inside {s_release, s_writeback_req, s_writeback_resp, s_meta_write,
                                      s_meta_write_resp});

    io_lsu_release.valid = states == s_lsu_release;
    io_lsu_release.bits = Edge::ProbeAckST(req, report_param);

  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      req <= 0;
      old_coh <= 0;
      way_en = 0;
    end else begin
      if (states == s_invalid) begin
        if (io_req_fire) req <= io_req.bits;
      end else if (states == s_mshr_req) begin
        old_coh <= io_block_state;
        way_en <= io_way_en;
      end
    end

  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) states <= s_invalid;
    else begin
      case (states)
        s_invalid: begin
          if (io_req_fire) begin
            states <= s_meta_read;
          end
        end

        s_meta_read: begin
          if (io_meta_read_fire) states <= s_meta_resp;
        end

        s_meta_resp: begin
          states <= s_mshr_req;
        end

        s_mshr_req: begin
          states <= io_mshr_rdy && io_wb_rdy ? s_mshr_resp : s_meta_read;
        end

        s_mshr_resp: begin
          states <= tag_matchs && is_dirty ? s_writeback_req : s_lsu_release;
        end

        s_lsu_release: begin
          if (io_lsu_release_fire) states <= s_release;
        end

        s_release: begin
          if (io_rep.ready) states <= tag_matchs ? s_meta_write : s_invalid;
        end

        s_writeback_req: begin
          if (io_wb_req_fire) states <= s_writeback_resp;
        end

        s_writeback_resp: begin
          if (io_wb_req.ready) states <= s_meta_write;
        end

        s_meta_write: begin
          if (io_meta_write_fire) states <= s_meta_write_resp;
        end

        s_meta_write_resp: begin
          states <= s_invalid;
        end
        default: begin
          states <= s_invalid;
        end
      endcase
    end

  end
endmodule
