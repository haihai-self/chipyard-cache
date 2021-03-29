


module BoomWriteBackUnit (
    input  logic                                                         clock,
    input  logic                                                         reset,
           DecoupledIF.out                                               io_req,
           DecoupledIF.in                                                io_meta_read,
    output logic                                                         io_resp,
           ValidIF.out                                                   io_idx,
           DecoupledIF.in                                                io_data_req,
    input  logic           [HasL1HellaCacheParameters::encRowBits-1 : 0] io_data_resp,
    input  logic                                                         io_mem_grant,
           DecoupledIF.in                                                io_release,
           DecoupledIF.in                                                io_lsu_release
);

  NBDcacheST::WriteBackReqST req;
  typedef enum {
    s_invalid,
    s_fill_buffer,
    s_lsu_release,
    s_active,
    s_grant
  } writebackstates;
  writebackstates states;
  logic r1_data_req_fired;
  logic r2_data_req_fired;
  logic [$clog2(HasL1CacheParameters::refillCycles+1)-1:0] r1_data_req_cnt;
  logic [$clog2(HasL1CacheParameters::refillCycles+1)-1:0] r2_data_req_cnt;
  logic [$clog2(HasL1CacheParameters::refillCycles+1)-1:0] data_req_cnt;

  logic [HasL1HellaCacheParameters::encRowBits-1:0] wb_buffer[HasL1CacheParameters::refillCycles];
  logic acked;

  BundleST::TLBundleCST probeResponse;
  BundleST::TLBundleCST voluntaryRelease;

  logic [BundleParam::addressBits-1:0] r_address;
  assign r_address = {req.tag, req.idx} << `blockOffBits;

  assign probeResponse = Edge::ProbeAck(
  .fromSource(HasL1HellaCacheParameters::nMSHRs),
  .toAddress(r_address),
  .lgSize(HasL1HellaCacheParameters::lgCacheBlockBytes),
  .reportPermissions(req.param),
  .data(wb_buffer[data_req_cnt[$clog2(HasL1CacheParameters::refillCycles) - 1:0]])
  );

  assign voluntaryRelease = Edge::Release(
  .fromSource(HasL1HellaCacheParameters::nMSHRs),
  .toAddress(r_address),
  .lgSize(HasL1HellaCacheParameters::lgCacheBlockBytes),
  .shrinkPermissions(req.param),
  .data(wb_buffer[data_req_cnt[$clog2(HasL1CacheParameters::refillCycles) - 1:0]])
  );

  logic io_req_fire;
  logic io_meta_read_fire;
  logic io_data_req_fire;
  logic io_release_fire;
  logic io_lsu_release_fire;
  always_comb begin
    io_req_fire = io_req.valid && io_req.ready;
    io_meta_read_fire = io_meta_read.valid && io_meta_read.ready;
    io_data_req_fire = io_data_req.valid && io_data_req.ready;
    io_release_fire = io_release.valid && io_release.ready;
    io_lsu_release_fire = io_lsu_release.valid && io_lsu_release.ready;
  end

  //io赋值
  always_comb begin
    /*initial output */

    io_idx.valid = states != s_invalid;
    io_idx.bits = req.idx;
    io_release.valid = 0;
    io_release.bits = 0;
    io_req.ready = 0;
    io_meta_read.valid = 0;
    io_meta_read.bits = 0;
    io_data_req.valid = 0;
    io_data_req.bits = 0;
    io_resp = 0;
    io_lsu_release.valid = 0;
    case (states)
      s_invalid: begin
        io_req.ready <= 1;
      end  //end s_invalid

      s_fill_buffer: begin
        io_meta_read.valid <= data_req_cnt < HasL1CacheParameters::refillCycles;
        io_meta_read.bits.idx <= req.idx;
        io_meta_read.bits.idx <= req.tag;

        io_data_req.valid <= data_req_cnt < HasL1CacheParameters::refillCycles;
        io_data_req.bits.way_en <= req.way_en;
        io_data_req.bits.addr <= ((HasL1CacheParameters::refillCycles > 1) ? {
          req.idx, data_req_cnt[$clog2(HasL1CacheParameters::refillCycles) - 1:0]
        } : req.idx) << HasL1CacheParameters::rowOffBits;

        if (r2_data_req_fired) begin
          if (r2_data_req_cnt == HasL1CacheParameters::refillCycles - 1) begin
            io_resp <= 1;
          end
        end
      end  //edn s_fill_buffer

      s_lsu_release: begin
        io_lsu_release.valid <= 1;
        io_lsu_release.bits <= probeResponse;
      end  //end s_lsu_release

      s_active: begin
        io_release.valid <= data_req_cnt < HasL1CacheParameters::refillCycles;
        io_release.bits <= req.voluntary ? voluntaryRelease : probeResponse;
      end  //end s_activate
    endcase
  end


  //控制信号赋值
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      req <= 0;
      r1_data_req_fired <= 0;
      r2_data_req_fired <= 0;
      r1_data_req_cnt <= 0;
      r2_data_req_cnt <= 0;
      data_req_cnt <= 0;
      for (int i = 0; i < HasL1CacheParameters::refillCycles; i++) begin
        wb_buffer[i] <= 128'b0;
      end
      acked <= 0;

    end else begin
      case (states)
        s_invalid: begin
          if (io_req_fire) begin
            data_req_cnt <= 0;
            req <= io_req.bits;
            acked <= 0;
          end
        end  //end s_invalid

        s_fill_buffer: begin

          r1_data_req_fired <= 0;
          r1_data_req_cnt <= 0;
          r2_data_req_fired <= r1_data_req_fired;
          r2_data_req_cnt <= r1_data_req_cnt;

          if (io_data_req_fire && io_meta_read_fire) begin
            r1_data_req_fired <= 1;
            r1_data_req_cnt <= data_req_cnt;
            data_req_cnt <= data_req_cnt + 1;
          end

          if (r2_data_req_fired) begin
            wb_buffer[r2_data_req_cnt[$clog2(HasL1CacheParameters::refillCycles) - 1:0]] <=
                io_data_resp;
            if (r2_data_req_cnt == HasL1CacheParameters::refillCycles - 1) begin
              data_req_cnt <= 0;
            end
          end
        end  //edn s_fill_buffer

        s_lsu_release: begin

        end  //end s_lsu_release

        s_active: begin
          if (io_mem_grant) acked <= 1;
          if (io_release_fire) data_req_cnt <= data_req_cnt + 1;
        end  //end s_activate

        s_grant: begin
          if (io_mem_grant) acked <= 1;
        end

        default: begin
          req <= 0;
        end
      endcase
    end
  end

  //状态转移
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      states <= s_invalid;
    end else begin
      case (states)
        s_invalid: begin
          if (io_req_fire) begin
            states <= s_fill_buffer;
          end
        end  //end s_invalid

        s_fill_buffer: begin
          if (r2_data_req_fired) begin
            if (r2_data_req_cnt == HasL1CacheParameters::refillCycles - 1) begin
              states <= s_lsu_release;
            end
          end
        end  //edn s_fill_buffer

        s_lsu_release: begin
          if (io_lsu_release_fire) states <= s_active;
        end  //end s_lsu_release

        s_active: begin
          if (data_req_cnt == HasL1CacheParameters::refillCycles - 1 && io_release_fire)
            states <= req.voluntary ? s_grant : s_invalid;
        end  //end s_activate

        s_grant: begin

          if (acked) states <= s_invalid;
        end

        default: begin
          states <= s_invalid;
        end
      endcase
    end
  end

endmodule
