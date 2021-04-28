


module BoomWriteBackUnit (
    input  logic                                               clock,
    input  logic                                               reset,
    input  logic [HasL1HellaCacheParameters::encRowBits-1 : 0] io_data_resp,
    input  logic                                               io_mem_grant,
    output logic                                               io_resp,  //encRowBits

    ValidIF.out io_idx,  //6

    DecoupledIF.in  io_req,  //WritebackReq
    DecoupledIF.out io_meta_read,  //L1MetaReadReq
    DecoupledIF.out io_data_req,  //L1DataReadReq
    DecoupledIF.out io_release,  //TLBundleC
    DecoupledIF.out io_lsu_release  //TLBundleC
);
  localparam refillCycles = HasL1CacheParameters::refillCycles;


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
  logic [$clog2(refillCycles+1)-1:0] r1_data_req_cnt;
  logic [$clog2(refillCycles+1)-1:0] r2_data_req_cnt;
  logic [$clog2(refillCycles+1)-1:0] data_req_cnt;

  logic [HasL1HellaCacheParameters::encRowBits-1:0] wb_buffer[refillCycles];
  logic acked;

  BundleST::TLBundleCST probeResponse;
  BundleST::TLBundleCST voluntaryRelease;

  logic [BundleParam::addressBits-1:0] r_address;
  assign r_address = {req.tag, req.idx} << `blockOffBits;

  assign probeResponse = Edge::ProbeAck_data(
  .fromSource(4),
  .toAddress(r_address),
  .lgSize(HasL1HellaCacheParameters::lgCacheBlockBytes),
  .reportPermissions(req.param),
  .data(wb_buffer[data_req_cnt[$clog2(refillCycles) - 1:0]])
  );

  assign voluntaryRelease = Edge::Release_data(
  .fromSource(4),
  .toAddress(r_address),
  .lgSize(HasL1HellaCacheParameters::lgCacheBlockBytes),
  .shrinkPermissions(req.param),
  .data(wb_buffer[data_req_cnt[$clog2(refillCycles) - 1:0]])
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
        io_meta_read.valid <= data_req_cnt < refillCycles;
        io_meta_read.bits.idx <= req.idx;
        io_meta_read.bits.idx <= req.tag;

        io_data_req.valid <= data_req_cnt < refillCycles;
        io_data_req.bits.way_en <= req.way_en;
        io_data_req.bits.addr <= ((refillCycles > 1) ? {
          req.idx, data_req_cnt[$clog2(refillCycles) - 1:0]
        } : req.idx) << HasL1CacheParameters::rowOffBits;

        if (r2_data_req_fired) begin
          if (r2_data_req_cnt == refillCycles - 1) begin
            io_resp <= 1;
          end
        end
      end  //edn s_fill_buffer

      s_lsu_release: begin
        io_lsu_release.valid <= 1;
        io_lsu_release.bits <= probeResponse;
      end  //end s_lsu_release

      s_active: begin
        io_release.valid <= data_req_cnt < refillCycles;
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
      for (int i = 0; i < refillCycles; i++) begin
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
            wb_buffer[r2_data_req_cnt] <= io_data_resp;
            if (r2_data_req_cnt == refillCycles - 1) begin
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
            if (r2_data_req_cnt == refillCycles - 1) begin
              states <= s_lsu_release;
            end
          end
        end  //edn s_fill_buffer

        s_lsu_release: begin
          if (io_lsu_release_fire) states <= s_active;
        end  //end s_lsu_release

        s_active: begin
          if ((data_req_cnt == refillCycles - 1) && io_release_fire)
            states <= req.voluntary ? s_grant : s_invalid;
        end  //end s_activate

        s_grant: begin

          if (acked) states <= s_invalid;
        end
      endcase
    end
  end

endmodule



// module BoomWritebackUnit( // @[chipyard.TestHarness.LargeBoomConfig.fir 151196:2]
//   input          clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 151197:4]
//   input          reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 151198:4]
//   output         io_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input  [19:0]  io_req_bits_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input  [5:0]   io_req_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input  [2:0]   io_req_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input  [7:0]   io_req_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_req_bits_voluntary, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_meta_read_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output         io_meta_read_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [5:0]   io_meta_read_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [19:0]  io_meta_read_bits_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output         io_resp, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output         io_idx_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [5:0]   io_idx_bits, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_data_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output         io_data_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [7:0]   io_data_req_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [11:0]  io_data_req_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input  [127:0] io_data_resp, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_mem_grant, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_release_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output         io_release_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [2:0]   io_release_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [2:0]   io_release_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [31:0]  io_release_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [127:0] io_release_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   input          io_lsu_release_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output         io_lsu_release_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
//   output [31:0]  io_lsu_release_bits_address // @[chipyard.TestHarness.LargeBoomConfig.fir 151199:4]
// );
// `ifdef RANDOMIZE_REG_INIT
//   reg [31:0] _RAND_0;
//   reg [31:0] _RAND_1;
//   reg [31:0] _RAND_2;
//   reg [31:0] _RAND_3;
//   reg [31:0] _RAND_4;
//   reg [31:0] _RAND_5;
//   reg [31:0] _RAND_6;
//   reg [31:0] _RAND_7;
//   reg [31:0] _RAND_8;
//   reg [31:0] _RAND_9;
//   reg [31:0] _RAND_10;
//   reg [127:0] _RAND_11;
//   reg [127:0] _RAND_12;
//   reg [127:0] _RAND_13;
//   reg [127:0] _RAND_14;
//   reg [31:0] _RAND_15;
// `endif // RANDOMIZE_REG_INIT
//   reg [19:0] req_tag; // @[dcache.scala 37:16 chipyard.TestHarness.LargeBoomConfig.fir 151204:4]
//   reg [5:0] req_idx; // @[dcache.scala 37:16 chipyard.TestHarness.LargeBoomConfig.fir 151204:4]
//   reg [2:0] req_param; // @[dcache.scala 37:16 chipyard.TestHarness.LargeBoomConfig.fir 151204:4]
//   reg [7:0] req_way_en; // @[dcache.scala 37:16 chipyard.TestHarness.LargeBoomConfig.fir 151204:4]
//   reg  req_voluntary; // @[dcache.scala 37:16 chipyard.TestHarness.LargeBoomConfig.fir 151204:4]
//   reg [2:0] state; // @[dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//   reg  r1_data_req_fired; // @[dcache.scala 40:34 chipyard.TestHarness.LargeBoomConfig.fir 151206:4]
//   reg  r2_data_req_fired; // @[dcache.scala 41:34 chipyard.TestHarness.LargeBoomConfig.fir 151207:4]
//   reg [2:0] r1_data_req_cnt; // @[dcache.scala 42:28 chipyard.TestHarness.LargeBoomConfig.fir 151208:4]
//   reg [2:0] r2_data_req_cnt; // @[dcache.scala 43:28 chipyard.TestHarness.LargeBoomConfig.fir 151209:4]
//   reg [2:0] data_req_cnt; // @[dcache.scala 44:29 chipyard.TestHarness.LargeBoomConfig.fir 151210:4]
//   wire  _T = io_release_ready & io_release_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151211:4]
//   reg [127:0] wb_buffer_0; // @[dcache.scala 46:22 chipyard.TestHarness.LargeBoomConfig.fir 151233:4]
//   reg [127:0] wb_buffer_1; // @[dcache.scala 46:22 chipyard.TestHarness.LargeBoomConfig.fir 151233:4]
//   reg [127:0] wb_buffer_2; // @[dcache.scala 46:22 chipyard.TestHarness.LargeBoomConfig.fir 151233:4]
//   reg [127:0] wb_buffer_3; // @[dcache.scala 46:22 chipyard.TestHarness.LargeBoomConfig.fir 151233:4]
//   reg  acked; // @[dcache.scala 47:22 chipyard.TestHarness.LargeBoomConfig.fir 151234:4]
//   wire [25:0] _r_address_T = {req_tag,req_idx}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 151256:4]
//   wire [127:0] _GEN_2 = 2'h1 == data_req_cnt[1:0] ? wb_buffer_1 : wb_buffer_0; // @[Edges.scala 428:15 chipyard.TestHarness.LargeBoomConfig.fir 151266:4 Edges.scala 428:15 chipyard.TestHarness.LargeBoomConfig.fir 151266:4]
//   wire [127:0] _GEN_3 = 2'h2 == data_req_cnt[1:0] ? wb_buffer_2 : _GEN_2; // @[Edges.scala 428:15 chipyard.TestHarness.LargeBoomConfig.fir 151266:4 Edges.scala 428:15 chipyard.TestHarness.LargeBoomConfig.fir 151266:4]
//   wire [127:0] probeResponse_data = 2'h3 == data_req_cnt[1:0] ? wb_buffer_3 : _GEN_3; // @[Edges.scala 428:15 chipyard.TestHarness.LargeBoomConfig.fir 151266:4 Edges.scala 428:15 chipyard.TestHarness.LargeBoomConfig.fir 151266:4]
//   wire  _T_1 = state == 3'h0; // @[dcache.scala 80:15 chipyard.TestHarness.LargeBoomConfig.fir 151307:4]
//   wire  _T_2 = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151310:6]
//   wire  _T_3 = state == 3'h1; // @[dcache.scala 88:22 chipyard.TestHarness.LargeBoomConfig.fir 151324:6]
//   wire  _io_meta_read_valid_T = data_req_cnt < 3'h4; // @[dcache.scala 89:40 chipyard.TestHarness.LargeBoomConfig.fir 151326:8]
//   wire [7:0] _io_data_req_bits_addr_T = {req_idx,data_req_cnt[1:0]}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 151334:8]
//   wire  _T_4 = io_data_req_ready & io_data_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151341:8]
//   wire  _T_5 = io_meta_read_ready & io_meta_read_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151342:8]
//   wire  _T_6 = _T_4 & _T_5; // @[dcache.scala 103:30 chipyard.TestHarness.LargeBoomConfig.fir 151343:8]
//   wire [2:0] _data_req_cnt_T_1 = data_req_cnt + 3'h1; // @[dcache.scala 106:36 chipyard.TestHarness.LargeBoomConfig.fir 151348:10]
//   wire [2:0] _GEN_20 = _T_6 ? _data_req_cnt_T_1 : data_req_cnt; // @[dcache.scala 103:54 chipyard.TestHarness.LargeBoomConfig.fir 151344:8 dcache.scala 106:20 chipyard.TestHarness.LargeBoomConfig.fir 151349:10 dcache.scala 44:29 chipyard.TestHarness.LargeBoomConfig.fir 151210:4]
//   wire  _T_8 = r2_data_req_cnt == 3'h3; // @[dcache.scala 110:29 chipyard.TestHarness.LargeBoomConfig.fir 151354:10]
//   wire [2:0] _GEN_26 = _T_8 ? 3'h2 : state; // @[dcache.scala 110:53 chipyard.TestHarness.LargeBoomConfig.fir 151355:10 dcache.scala 112:15 chipyard.TestHarness.LargeBoomConfig.fir 151357:12 dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//   wire [2:0] _GEN_27 = _T_8 ? 3'h0 : _GEN_20; // @[dcache.scala 110:53 chipyard.TestHarness.LargeBoomConfig.fir 151355:10 dcache.scala 113:22 chipyard.TestHarness.LargeBoomConfig.fir 151358:12]
//   wire  _GEN_32 = r2_data_req_fired & _T_8; // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8 dcache.scala 58:22 chipyard.TestHarness.LargeBoomConfig.fir 151254:4]
//   wire  _T_9 = state == 3'h2; // @[dcache.scala 116:22 chipyard.TestHarness.LargeBoomConfig.fir 151363:8]
//   wire  _T_10 = io_lsu_release_ready & io_lsu_release_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151373:10]
//   wire [2:0] _GEN_35 = _T_10 ? 3'h3 : state; // @[dcache.scala 119:34 chipyard.TestHarness.LargeBoomConfig.fir 151374:10 dcache.scala 120:12 chipyard.TestHarness.LargeBoomConfig.fir 151375:12 dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//   wire  _T_11 = state == 3'h3; // @[dcache.scala 122:22 chipyard.TestHarness.LargeBoomConfig.fir 151379:10]
//   wire  _GEN_36 = io_mem_grant | acked; // @[dcache.scala 126:25 chipyard.TestHarness.LargeBoomConfig.fir 151391:12 dcache.scala 127:13 chipyard.TestHarness.LargeBoomConfig.fir 151392:14 dcache.scala 47:22 chipyard.TestHarness.LargeBoomConfig.fir 151234:4]
//   wire [2:0] _GEN_37 = _T ? _data_req_cnt_T_1 : data_req_cnt; // @[dcache.scala 129:30 chipyard.TestHarness.LargeBoomConfig.fir 151395:12 dcache.scala 130:20 chipyard.TestHarness.LargeBoomConfig.fir 151398:14 dcache.scala 44:29 chipyard.TestHarness.LargeBoomConfig.fir 151210:4]
//   wire  _T_13 = data_req_cnt == 3'h3; // @[dcache.scala 132:25 chipyard.TestHarness.LargeBoomConfig.fir 151400:12]
//   wire  _T_15 = _T_13 & _T; // @[dcache.scala 132:49 chipyard.TestHarness.LargeBoomConfig.fir 151402:12]
//   wire [2:0] _state_T = req_voluntary ? 3'h4 : 3'h0; // @[dcache.scala 133:19 chipyard.TestHarness.LargeBoomConfig.fir 151404:14]
//   wire [2:0] _GEN_38 = _T_15 ? _state_T : state; // @[dcache.scala 132:71 chipyard.TestHarness.LargeBoomConfig.fir 151403:12 dcache.scala 133:13 chipyard.TestHarness.LargeBoomConfig.fir 151405:14 dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//   wire  _T_16 = state == 3'h4; // @[dcache.scala 135:22 chipyard.TestHarness.LargeBoomConfig.fir 151409:12]
//   wire [2:0] _GEN_39 = acked ? 3'h0 : state; // @[dcache.scala 139:18 chipyard.TestHarness.LargeBoomConfig.fir 151414:14 dcache.scala 140:13 chipyard.TestHarness.LargeBoomConfig.fir 151415:16 dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//   wire  _GEN_40 = _T_16 ? _GEN_36 : acked; // @[dcache.scala 135:35 chipyard.TestHarness.LargeBoomConfig.fir 151410:12 dcache.scala 47:22 chipyard.TestHarness.LargeBoomConfig.fir 151234:4]
//   wire [2:0] _GEN_41 = _T_16 ? _GEN_39 : state; // @[dcache.scala 135:35 chipyard.TestHarness.LargeBoomConfig.fir 151410:12 dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//   wire  _GEN_42 = _T_11 & _io_meta_read_valid_T; // @[dcache.scala 122:36 chipyard.TestHarness.LargeBoomConfig.fir 151380:10 dcache.scala 123:22 chipyard.TestHarness.LargeBoomConfig.fir 151382:12 dcache.scala 51:22 chipyard.TestHarness.LargeBoomConfig.fir 151238:4]
//   wire  _GEN_50 = _T_11 ? _GEN_36 : _GEN_40; // @[dcache.scala 122:36 chipyard.TestHarness.LargeBoomConfig.fir 151380:10]
//   wire [2:0] _GEN_51 = _T_11 ? _GEN_37 : data_req_cnt; // @[dcache.scala 122:36 chipyard.TestHarness.LargeBoomConfig.fir 151380:10 dcache.scala 44:29 chipyard.TestHarness.LargeBoomConfig.fir 151210:4]
//   wire [2:0] _GEN_52 = _T_11 ? _GEN_38 : _GEN_41; // @[dcache.scala 122:36 chipyard.TestHarness.LargeBoomConfig.fir 151380:10]
//   wire  _GEN_62 = _T_9 ? 1'h0 : _GEN_42; // @[dcache.scala 116:41 chipyard.TestHarness.LargeBoomConfig.fir 151364:8 dcache.scala 51:22 chipyard.TestHarness.LargeBoomConfig.fir 151238:4]
//   wire  _GEN_72 = _T_3 & _io_meta_read_valid_T; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 89:24 chipyard.TestHarness.LargeBoomConfig.fir 151327:8 dcache.scala 54:22 chipyard.TestHarness.LargeBoomConfig.fir 151247:4]
//   wire  _GEN_87 = _T_3 & _GEN_32; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 58:22 chipyard.TestHarness.LargeBoomConfig.fir 151254:4]
//   wire  _GEN_89 = _T_3 ? 1'h0 : _T_9; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 59:24 chipyard.TestHarness.LargeBoomConfig.fir 151255:4]
//   wire  _GEN_97 = _T_3 ? 1'h0 : _GEN_62; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 51:22 chipyard.TestHarness.LargeBoomConfig.fir 151238:4]
//   assign io_req_ready = state == 3'h0; // @[dcache.scala 80:15 chipyard.TestHarness.LargeBoomConfig.fir 151307:4]
//   assign io_meta_read_valid = _T_1 ? 1'h0 : _GEN_72; // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4 dcache.scala 54:22 chipyard.TestHarness.LargeBoomConfig.fir 151247:4]
//   assign io_meta_read_bits_idx = req_idx; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 90:27 chipyard.TestHarness.LargeBoomConfig.fir 151328:8]
//   assign io_meta_read_bits_tag = req_tag; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 91:27 chipyard.TestHarness.LargeBoomConfig.fir 151329:8]
//   assign io_resp = _T_1 ? 1'h0 : _GEN_87; // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4 dcache.scala 58:22 chipyard.TestHarness.LargeBoomConfig.fir 151254:4]
//   assign io_idx_valid = state != 3'h0; // @[dcache.scala 49:31 chipyard.TestHarness.LargeBoomConfig.fir 151235:4]
//   assign io_idx_bits = req_idx; // @[dcache.scala 50:22 chipyard.TestHarness.LargeBoomConfig.fir 151237:4]
//   assign io_data_req_valid = _T_1 ? 1'h0 : _GEN_72; // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4 dcache.scala 56:22 chipyard.TestHarness.LargeBoomConfig.fir 151251:4]
//   assign io_data_req_bits_way_en = req_way_en; // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6 dcache.scala 94:29 chipyard.TestHarness.LargeBoomConfig.fir 151332:8]
//   assign io_data_req_bits_addr = {_io_data_req_bits_addr_T, 4'h0}; // @[dcache.scala 97:43 chipyard.TestHarness.LargeBoomConfig.fir 151335:8]
//   assign io_release_valid = _T_1 ? 1'h0 : _GEN_97; // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4 dcache.scala 51:22 chipyard.TestHarness.LargeBoomConfig.fir 151238:4]
//   assign io_release_bits_opcode = req_voluntary ? 3'h7 : 3'h5; // @[dcache.scala 124:27 chipyard.TestHarness.LargeBoomConfig.fir 151383:12]
//   assign io_release_bits_param = req_param; // @[dcache.scala 124:27 chipyard.TestHarness.LargeBoomConfig.fir 151383:12]
//   assign io_release_bits_address = {_r_address_T, 6'h0}; // @[dcache.scala 63:41 chipyard.TestHarness.LargeBoomConfig.fir 151257:4]
//   assign io_release_bits_data = req_voluntary ? probeResponse_data : probeResponse_data; // @[dcache.scala 124:27 chipyard.TestHarness.LargeBoomConfig.fir 151383:12]
//   assign io_lsu_release_valid = _T_1 ? 1'h0 : _GEN_89; // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4 dcache.scala 59:24 chipyard.TestHarness.LargeBoomConfig.fir 151255:4]
//   assign io_lsu_release_bits_address = {_r_address_T, 6'h0}; // @[dcache.scala 63:41 chipyard.TestHarness.LargeBoomConfig.fir 151257:4]
//   always @(posedge clock) begin
//     if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         req_tag <= io_req_bits_tag; // @[dcache.scala 85:11 chipyard.TestHarness.LargeBoomConfig.fir 151319:8]
//       end
//     end
//     if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         req_idx <= io_req_bits_idx; // @[dcache.scala 85:11 chipyard.TestHarness.LargeBoomConfig.fir 151318:8]
//       end
//     end
//     if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         req_param <= io_req_bits_param; // @[dcache.scala 85:11 chipyard.TestHarness.LargeBoomConfig.fir 151316:8]
//       end
//     end
//     if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         req_way_en <= io_req_bits_way_en; // @[dcache.scala 85:11 chipyard.TestHarness.LargeBoomConfig.fir 151315:8]
//       end
//     end
//     if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         req_voluntary <= io_req_bits_voluntary; // @[dcache.scala 85:11 chipyard.TestHarness.LargeBoomConfig.fir 151314:8]
//       end
//     end
//     if (reset) begin // @[dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//       state <= 3'h0; // @[dcache.scala 39:22 chipyard.TestHarness.LargeBoomConfig.fir 151205:4]
//     end else if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         state <= 3'h1; // @[dcache.scala 83:13 chipyard.TestHarness.LargeBoomConfig.fir 151312:8]
//       end
//     end else if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//       if (r2_data_req_fired) begin // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8]
//         state <= _GEN_26;
//       end
//     end else if (_T_9) begin // @[dcache.scala 116:41 chipyard.TestHarness.LargeBoomConfig.fir 151364:8]
//       state <= _GEN_35;
//     end else begin
//       state <= _GEN_52;
//     end
//     if (reset) begin // @[dcache.scala 40:34 chipyard.TestHarness.LargeBoomConfig.fir 151206:4]
//       r1_data_req_fired <= 1'h0; // @[dcache.scala 40:34 chipyard.TestHarness.LargeBoomConfig.fir 151206:4]
//     end else if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         r1_data_req_fired <= _T_6;
//       end
//     end
//     if (reset) begin // @[dcache.scala 41:34 chipyard.TestHarness.LargeBoomConfig.fir 151207:4]
//       r2_data_req_fired <= 1'h0; // @[dcache.scala 41:34 chipyard.TestHarness.LargeBoomConfig.fir 151207:4]
//     end else if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         r2_data_req_fired <= r1_data_req_fired; // @[dcache.scala 101:23 chipyard.TestHarness.LargeBoomConfig.fir 151339:8]
//       end
//     end
//     if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         if (_T_6) begin // @[dcache.scala 103:54 chipyard.TestHarness.LargeBoomConfig.fir 151344:8]
//           r1_data_req_cnt <= data_req_cnt; // @[dcache.scala 105:25 chipyard.TestHarness.LargeBoomConfig.fir 151346:10]
//         end else begin
//           r1_data_req_cnt <= 3'h0; // @[dcache.scala 100:23 chipyard.TestHarness.LargeBoomConfig.fir 151338:8]
//         end
//       end
//     end
//     if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         r2_data_req_cnt <= r1_data_req_cnt; // @[dcache.scala 102:23 chipyard.TestHarness.LargeBoomConfig.fir 151340:8]
//       end
//     end
//     if (reset) begin // @[dcache.scala 44:29 chipyard.TestHarness.LargeBoomConfig.fir 151210:4]
//       data_req_cnt <= 3'h0; // @[dcache.scala 44:29 chipyard.TestHarness.LargeBoomConfig.fir 151210:4]
//     end else if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         data_req_cnt <= 3'h0; // @[dcache.scala 84:20 chipyard.TestHarness.LargeBoomConfig.fir 151313:8]
//       end
//     end else if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//       if (r2_data_req_fired) begin // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8]
//         data_req_cnt <= _GEN_27;
//       end else begin
//         data_req_cnt <= _GEN_20;
//       end
//     end else if (!(_T_9)) begin // @[dcache.scala 116:41 chipyard.TestHarness.LargeBoomConfig.fir 151364:8]
//       data_req_cnt <= _GEN_51;
//     end
//     if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         if (r2_data_req_fired) begin // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8]
//           if (2'h0 == r2_data_req_cnt[1:0]) begin // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//             wb_buffer_0 <= io_data_resp; // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//           end
//         end
//       end
//     end
//     if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         if (r2_data_req_fired) begin // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8]
//           if (2'h1 == r2_data_req_cnt[1:0]) begin // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//             wb_buffer_1 <= io_data_resp; // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//           end
//         end
//       end
//     end
//     if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         if (r2_data_req_fired) begin // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8]
//           if (2'h2 == r2_data_req_cnt[1:0]) begin // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//             wb_buffer_2 <= io_data_resp; // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//           end
//         end
//       end
//     end
//     if (!(_T_1)) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_3) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//         if (r2_data_req_fired) begin // @[dcache.scala 108:30 chipyard.TestHarness.LargeBoomConfig.fir 151351:8]
//           if (2'h3 == r2_data_req_cnt[1:0]) begin // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//             wb_buffer_3 <= io_data_resp; // @[dcache.scala 109:34 chipyard.TestHarness.LargeBoomConfig.fir 151353:10]
//           end
//         end
//       end
//     end
//     if (reset) begin // @[dcache.scala 47:22 chipyard.TestHarness.LargeBoomConfig.fir 151234:4]
//       acked <= 1'h0; // @[dcache.scala 47:22 chipyard.TestHarness.LargeBoomConfig.fir 151234:4]
//     end else if (_T_1) begin // @[dcache.scala 80:30 chipyard.TestHarness.LargeBoomConfig.fir 151308:4]
//       if (_T_2) begin // @[dcache.scala 82:26 chipyard.TestHarness.LargeBoomConfig.fir 151311:6]
//         acked <= 1'h0; // @[dcache.scala 86:13 chipyard.TestHarness.LargeBoomConfig.fir 151320:8]
//       end
//     end else if (!(_T_3)) begin // @[dcache.scala 88:41 chipyard.TestHarness.LargeBoomConfig.fir 151325:6]
//       if (!(_T_9)) begin // @[dcache.scala 116:41 chipyard.TestHarness.LargeBoomConfig.fir 151364:8]
//         acked <= _GEN_50;
//       end
//     end
//   end
// // Register and memory initialization
// `ifdef RANDOMIZE_GARBAGE_ASSIGN
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_INVALID_ASSIGN
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_REG_INIT
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_MEM_INIT
// `define RANDOMIZE
// `endif
// `ifndef RANDOM
// `define RANDOM $random
// `endif
// `ifdef RANDOMIZE_MEM_INIT
//   integer initvar;
// `endif
// `ifndef SYNTHESIS
// `ifdef FIRRTL_BEFORE_INITIAL
// `FIRRTL_BEFORE_INITIAL
// `endif
// initial begin
//   `ifdef RANDOMIZE
//     `ifdef INIT_RANDOM
//       `INIT_RANDOM
//     `endif
//     `ifndef VERILATOR
//       `ifdef RANDOMIZE_DELAY
//         #`RANDOMIZE_DELAY begin end
//       `else
//         #0.002 begin end
//       `endif
//     `endif
// `ifdef RANDOMIZE_REG_INIT
//   _RAND_0 = {1{`RANDOM}};
//   req_tag = _RAND_0[19:0];
//   _RAND_1 = {1{`RANDOM}};
//   req_idx = _RAND_1[5:0];
//   _RAND_2 = {1{`RANDOM}};
//   req_param = _RAND_2[2:0];
//   _RAND_3 = {1{`RANDOM}};
//   req_way_en = _RAND_3[7:0];
//   _RAND_4 = {1{`RANDOM}};
//   req_voluntary = _RAND_4[0:0];
//   _RAND_5 = {1{`RANDOM}};
//   state = _RAND_5[2:0];
//   _RAND_6 = {1{`RANDOM}};
//   r1_data_req_fired = _RAND_6[0:0];
//   _RAND_7 = {1{`RANDOM}};
//   r2_data_req_fired = _RAND_7[0:0];
//   _RAND_8 = {1{`RANDOM}};
//   r1_data_req_cnt = _RAND_8[2:0];
//   _RAND_9 = {1{`RANDOM}};
//   r2_data_req_cnt = _RAND_9[2:0];
//   _RAND_10 = {1{`RANDOM}};
//   data_req_cnt = _RAND_10[2:0];
//   _RAND_11 = {4{`RANDOM}};
//   wb_buffer_0 = _RAND_11[127:0];
//   _RAND_12 = {4{`RANDOM}};
//   wb_buffer_1 = _RAND_12[127:0];
//   _RAND_13 = {4{`RANDOM}};
//   wb_buffer_2 = _RAND_13[127:0];
//   _RAND_14 = {4{`RANDOM}};
//   wb_buffer_3 = _RAND_14[127:0];
//   _RAND_15 = {1{`RANDOM}};
//   acked = _RAND_15[0:0];
// `endif // RANDOMIZE_REG_INIT
//   `endif // RANDOMIZE
// end // initial
// `ifdef FIRRTL_AFTER_INITIAL
// `FIRRTL_AFTER_INITIAL
// `endif
// `endif // SYNTHESIS
// endmodule
