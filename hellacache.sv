module L1MetadataArray (
    input logic clock,
    input logic reset,
    output logic [BundleParam::TLPermissions_width-1:0] io_resp[HasL1CacheParameters::nWays],

    DecoupledIF.in io_read,  //L1MetaReadReq
    DecoupledIF.in io_write  //L1MetaWriteReq
);

  logic io_read_fire;
  logic io_write_fire;

  always_comb begin
    io_read_fire = io_read.valid && io_read.ready;
    io_write_fire = io_write.valid && io_write.ready;
  end
  logic [$clog2(HasL1CacheParameters::nSets+1)-1:0] rst_cnt;  //多申请一位
  logic rst;  //当计数器小于nways为1
  assign rst = rst_cnt < HasL1CacheParameters::nWays;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      rst_cnt <= 0;
    end else if (rst) begin
      rst_cnt <= rst_cnt + 1;
    end
  end
  logic [HasL1CacheParameters::idxBits-1:0] waddr;
  logic [BundleParam::TLPermissions_width-1:0] wdata;
  logic [HasL1CacheParameters::nWays-1:0] wmask;
  always_comb begin
    waddr = rst ? rst_cnt : io_write.bits.idx;
    wdata = rst ? 0 : io_write.bits.data;
    wmask = rst ? $signed(-8'sh1) : $signed(io_write.bits.way_en);
  end



  logic wen;
  assign wen = io.write.valid || rst;  //写数据有效或者在技术时有效
  always_comb begin
    io_read.ready = !wen;  //不写了就可以读了
    io_write.ready = !rst;  //计数器小于nway时没有写好
  end
  SyncReadMem #(
      .DEEPTH(HasL1CacheParameters::nSets),
      .DATA_WIDTH(BundleParam::TLPermissions_width),
      .WMASK_WIDTH(HasL1CacheParameters::nWays)
  ) tag_array (
      .clk  (clock),
      .reset(reset),

      .wen  (wen),
      .waddr(waddr),
      .cs   (wmask),
      .wdata(wdata),

      .ren  (io_read_fire),
      .raddr(io_read.bits.idx),
      .rdata(io_resp)
  );
endmodule

// module L1MetadataArray( // @[chipyard.TestHarness.LargeBoomConfig.fir 171257:2]
//   input         clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 171258:4]
//   input         reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 171259:4]
//   output        io_read_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input         io_read_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input  [5:0]  io_read_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output        io_write_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input         io_write_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input  [5:0]  io_write_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input  [7:0]  io_write_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input  [1:0]  io_write_bits_data_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   input  [19:0] io_write_bits_data_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_0_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_0_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_1_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_1_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_2_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_2_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_3_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_3_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_4_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_4_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_5_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_5_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_6_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_6_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [1:0]  io_resp_7_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
//   output [19:0] io_resp_7_tag // @[chipyard.TestHarness.LargeBoomConfig.fir 171260:4]
// );
// `ifdef RANDOMIZE_REG_INIT
//   reg [31:0] _RAND_0;
// `endif // RANDOMIZE_REG_INIT
//   wire [5:0] tag_array_RW0_addr; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_en; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_clk; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmode; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_0; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_1; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_2; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_3; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_4; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_5; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_6; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_wdata_7; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_0; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_1; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_2; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_3; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_4; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_5; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_6; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire [21:0] tag_array_RW0_rdata_7; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_0; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_1; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_2; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_3; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_4; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_5; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_6; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   wire  tag_array_RW0_wmask_7; // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//   reg [6:0] rst_cnt; // @[HellaCache.scala 313:20 chipyard.TestHarness.LargeBoomConfig.fir 171272:4]
//   wire  rst = rst_cnt < 7'h40; // @[HellaCache.scala 314:21 chipyard.TestHarness.LargeBoomConfig.fir 171273:4]
//   wire [6:0] waddr = rst ? rst_cnt : {{1'd0}, io_write_bits_idx}; // @[HellaCache.scala 315:18 chipyard.TestHarness.LargeBoomConfig.fir 171274:4]
//   wire [1:0] _wdata_T_coh_state = rst ? 2'h0 : io_write_bits_data_coh_state; // @[HellaCache.scala 316:18 chipyard.TestHarness.LargeBoomConfig.fir 171275:4]
//   wire [19:0] _wdata_T_tag = rst ? 20'h0 : io_write_bits_data_tag; // @[HellaCache.scala 316:18 chipyard.TestHarness.LargeBoomConfig.fir 171275:4]
//   wire [7:0] _wmask_T_2 = rst ? $signed(-8'sh1) : $signed(io_write_bits_way_en); // @[HellaCache.scala 317:18 chipyard.TestHarness.LargeBoomConfig.fir 171279:4]
//   wire [6:0] _rst_cnt_T_1 = rst_cnt + 7'h1; // @[HellaCache.scala 319:34 chipyard.TestHarness.LargeBoomConfig.fir 171301:6]
//   wire  wen = rst | io_write_valid; // @[HellaCache.scala 323:17 chipyard.TestHarness.LargeBoomConfig.fir 171305:4]
//   wire  _T_1 = io_read_ready & io_read_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 171344:4]
//   wire [21:0] _WIRE_3 = tag_array_RW0_rdata_0; // @[chipyard.TestHarness.LargeBoomConfig.fir 171356:4 chipyard.TestHarness.LargeBoomConfig.fir 171358:4]
//   wire [21:0] _WIRE_5 = tag_array_RW0_rdata_1; // @[chipyard.TestHarness.LargeBoomConfig.fir 171365:4 chipyard.TestHarness.LargeBoomConfig.fir 171367:4]
//   wire [21:0] _WIRE_7 = tag_array_RW0_rdata_2; // @[chipyard.TestHarness.LargeBoomConfig.fir 171374:4 chipyard.TestHarness.LargeBoomConfig.fir 171376:4]
//   wire [21:0] _WIRE_9 = tag_array_RW0_rdata_3; // @[chipyard.TestHarness.LargeBoomConfig.fir 171383:4 chipyard.TestHarness.LargeBoomConfig.fir 171385:4]
//   wire [21:0] _WIRE_11 = tag_array_RW0_rdata_4; // @[chipyard.TestHarness.LargeBoomConfig.fir 171392:4 chipyard.TestHarness.LargeBoomConfig.fir 171394:4]
//   wire [21:0] _WIRE_13 = tag_array_RW0_rdata_5; // @[chipyard.TestHarness.LargeBoomConfig.fir 171401:4 chipyard.TestHarness.LargeBoomConfig.fir 171403:4]
//   wire [21:0] _WIRE_15 = tag_array_RW0_rdata_6; // @[chipyard.TestHarness.LargeBoomConfig.fir 171410:4 chipyard.TestHarness.LargeBoomConfig.fir 171412:4]
//   wire [21:0] _WIRE_17 = tag_array_RW0_rdata_7; // @[chipyard.TestHarness.LargeBoomConfig.fir 171419:4 chipyard.TestHarness.LargeBoomConfig.fir 171421:4]
//   tag_array tag_array ( // @[HellaCache.scala 322:25 chipyard.TestHarness.LargeBoomConfig.fir 171304:4]
//     .RW0_addr(tag_array_RW0_addr),
//     .RW0_en(tag_array_RW0_en),
//     .RW0_clk(tag_array_RW0_clk),
//     .RW0_wmode(tag_array_RW0_wmode),
//     .RW0_wdata_0(tag_array_RW0_wdata_0),
//     .RW0_wdata_1(tag_array_RW0_wdata_1),
//     .RW0_wdata_2(tag_array_RW0_wdata_2),
//     .RW0_wdata_3(tag_array_RW0_wdata_3),
//     .RW0_wdata_4(tag_array_RW0_wdata_4),
//     .RW0_wdata_5(tag_array_RW0_wdata_5),
//     .RW0_wdata_6(tag_array_RW0_wdata_6),
//     .RW0_wdata_7(tag_array_RW0_wdata_7),
//     .RW0_rdata_0(tag_array_RW0_rdata_0),
//     .RW0_rdata_1(tag_array_RW0_rdata_1),
//     .RW0_rdata_2(tag_array_RW0_rdata_2),
//     .RW0_rdata_3(tag_array_RW0_rdata_3),
//     .RW0_rdata_4(tag_array_RW0_rdata_4),
//     .RW0_rdata_5(tag_array_RW0_rdata_5),
//     .RW0_rdata_6(tag_array_RW0_rdata_6),
//     .RW0_rdata_7(tag_array_RW0_rdata_7),
//     .RW0_wmask_0(tag_array_RW0_wmask_0),
//     .RW0_wmask_1(tag_array_RW0_wmask_1),
//     .RW0_wmask_2(tag_array_RW0_wmask_2),
//     .RW0_wmask_3(tag_array_RW0_wmask_3),
//     .RW0_wmask_4(tag_array_RW0_wmask_4),
//     .RW0_wmask_5(tag_array_RW0_wmask_5),
//     .RW0_wmask_6(tag_array_RW0_wmask_6),
//     .RW0_wmask_7(tag_array_RW0_wmask_7)
//   );
//   assign io_read_ready = ~wen; // @[HellaCache.scala 329:20 chipyard.TestHarness.LargeBoomConfig.fir 171434:4]
//   assign io_write_ready = ~rst; // @[HellaCache.scala 330:21 chipyard.TestHarness.LargeBoomConfig.fir 171436:4]
//   assign io_resp_0_coh_state = _WIRE_3[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171361:4]
//   assign io_resp_0_tag = _WIRE_3[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171359:4]
//   assign io_resp_1_coh_state = _WIRE_5[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171370:4]
//   assign io_resp_1_tag = _WIRE_5[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171368:4]
//   assign io_resp_2_coh_state = _WIRE_7[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171379:4]
//   assign io_resp_2_tag = _WIRE_7[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171377:4]
//   assign io_resp_3_coh_state = _WIRE_9[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171388:4]
//   assign io_resp_3_tag = _WIRE_9[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171386:4]
//   assign io_resp_4_coh_state = _WIRE_11[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171397:4]
//   assign io_resp_4_tag = _WIRE_11[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171395:4]
//   assign io_resp_5_coh_state = _WIRE_13[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171406:4]
//   assign io_resp_5_tag = _WIRE_13[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171404:4]
//   assign io_resp_6_coh_state = _WIRE_15[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171415:4]
//   assign io_resp_6_tag = _WIRE_15[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171413:4]
//   assign io_resp_7_coh_state = _WIRE_17[21:20]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171424:4]
//   assign io_resp_7_tag = _WIRE_17[19:0]; // @[HellaCache.scala 327:82 chipyard.TestHarness.LargeBoomConfig.fir 171422:4]
//   assign tag_array_RW0_wdata_0 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_1 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_2 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_3 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_4 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_5 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_6 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wdata_7 = {_wdata_T_coh_state,_wdata_T_tag}; // @[HellaCache.scala 316:52 chipyard.TestHarness.LargeBoomConfig.fir 171276:4]
//   assign tag_array_RW0_wmask_0 = _wmask_T_2[0]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171280:4]
//   assign tag_array_RW0_wmask_1 = _wmask_T_2[1]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171281:4]
//   assign tag_array_RW0_wmask_2 = _wmask_T_2[2]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171282:4]
//   assign tag_array_RW0_wmask_3 = _wmask_T_2[3]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171283:4]
//   assign tag_array_RW0_wmask_4 = _wmask_T_2[4]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171284:4]
//   assign tag_array_RW0_wmask_5 = _wmask_T_2[5]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171285:4]
//   assign tag_array_RW0_wmask_6 = _wmask_T_2[6]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171286:4]
//   assign tag_array_RW0_wmask_7 = _wmask_T_2[7]; // @[HellaCache.scala 317:83 chipyard.TestHarness.LargeBoomConfig.fir 171287:4]
//   assign tag_array_RW0_wmode = rst | io_write_valid; // @[HellaCache.scala 323:17 chipyard.TestHarness.LargeBoomConfig.fir 171305:4]
//   assign tag_array_RW0_clk = clock;
//   assign tag_array_RW0_en = _T_1 | wen;
//   assign tag_array_RW0_addr = wen ? waddr[5:0] : io_read_bits_idx;
//   always @(posedge clock) begin
//     if (reset) begin // @[HellaCache.scala 313:20 chipyard.TestHarness.LargeBoomConfig.fir 171272:4]
//       rst_cnt <= 7'h0; // @[HellaCache.scala 313:20 chipyard.TestHarness.LargeBoomConfig.fir 171272:4]
//     end else if (rst) begin // @[HellaCache.scala 319:14 chipyard.TestHarness.LargeBoomConfig.fir 171299:4]
//       rst_cnt <= _rst_cnt_T_1; // @[HellaCache.scala 319:24 chipyard.TestHarness.LargeBoomConfig.fir 171302:6]
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
//   rst_cnt = _RAND_0[6:0];
// `endif // RANDOMIZE_REG_INIT
//   `endif // RANDOMIZE
// end // initial
// `ifdef FIRRTL_AFTER_INITIAL
// `FIRRTL_AFTER_INITIAL
// `endif
// `endif // SYNTHESIS
// endmodule
