
//io_resp  从sram中读出的128 * 8位数据
//io_read 读相关信息
//io_write 写相关信息
module BoomDuplicatedDataArray(
  input logic clock,
  input logic reset,

  input NBDcacheST::L1DataReadReqST io_read,
  input NBDcacheST::L1DataWriteReqST io_write,

  output logic [HasL1HellaCacheParameters::encRowBits-1:0] io_resp [HasL1CacheParameters::nWays],
  output logic io_nack

);
  // rowWrod: 2                                                                                                              
  // encDataBits: 64                                                                                                        
  // nset: 64                                                                                                               
  // refillCycles: 4 
  localparam rowWrod = 2;
  localparam encDataBits = 64;
  localparam nSets = HasL1CacheParameters::nSets;
  localparam nWays = HasL1CacheParameters::nWays;
  localparam refillCycles = HasL1CacheParameters::refillCycles;

  logic [$clog2(refillCycles * nSets)-1:0] raddr ;
  logic [$clog2(refillCycles * nSets)-1:0] waddr ;
  logic [nWays-1:0] wen[2];
  logic [HasL1HellaCacheParameters::encRowBits-1:0] data_out[nWays];
  logic [HasL1HellaCacheParameters::encRowBits-1:0] rdata[nWays];

  assign raddr = io_read.bits.addr >> `rowOffBits;
  assign waddr = io_write.bits.addr >> `rowOffBits;
  assign io_nack = 0;
  generate
    for (genvar i = 0; i < nWays; i = i + 1)begin

      wen[i][0] = io_write.bits.wmask[0] && io_write.bits.way_en[i] && io_write.valid;
      wen[i][1] = io_write.bits.wmask[1] && io_write.bits.way_en[i] && io_write.valid;
      SyncReadMemNoVec #(
        .DEEPTH(nSets * refillCycles),
        .DATA_WIDTH(encDataBits)
      ) data_array0 (
        .clk(clock),
        .reset(reset),
        
        .wen(wen[i][0]),
        .waddr(waddr),
        .wdata(io_write.bits.data[encDataBits-1:0]),
        
        .ren(io_read.bits.way_en[i] && io_read.valid),
        .raddr(raddr),
        .rdata(data_out[i][encDataBits-1:0])
      );


      SyncReadMemNoVec #(
        .DEEPTH(nSets * refillCycles),
        .DATA_WIDTH(encDataBits)
      ) data_array1 (
        .clk(clock),
        .reset(reset),
        
        .wen(wen[i][1]),
        .waddr(waddr),
        .wdata(io_write.bits.data[encDataBits*2-1:0]),
        
        .ren(io_read.bits.way_en[i] && io_read.valid),
        .raddr(raddr),
        .rdata(data_out[i][encDataBits*2-1:0])
      )
    end

    always_ff @(posedge clock or posedge reset) begin
      if (reset){
        rdata[i] <= 0;
      }else begin
        rdata[i] <= data_out[i];
      end
    end
    assign io_resp[i] = rdata[i]
  endgenerate
  assign 
endmodule

// module BoomDuplicatedDataArray( // @[chipyard.TestHarness.LargeBoomConfig.fir 171531:2]
//   input          clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 171532:4]
//   input          io_read_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input  [7:0]   io_read_0_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input  [11:0]  io_read_0_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input          io_write_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input  [7:0]   io_write_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input  [11:0]  io_write_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input  [1:0]   io_write_bits_wmask, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   input  [127:0] io_write_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_1, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_2, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_3, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_4, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_5, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_6, // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
//   output [127:0] io_resp_0_7 // @[chipyard.TestHarness.LargeBoomConfig.fir 171534:4]
// );
// `ifdef RANDOMIZE_REG_INIT
//   reg [127:0] _RAND_0;
//   reg [127:0] _RAND_1;
//   reg [127:0] _RAND_2;
//   reg [127:0] _RAND_3;
//   reg [127:0] _RAND_4;
//   reg [127:0] _RAND_5;
//   reg [127:0] _RAND_6;
//   reg [127:0] _RAND_7;
// `endif // RANDOMIZE_REG_INIT
//   wire [7:0] array_0_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire  array_0_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire  array_0_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire [63:0] array_0_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire [63:0] array_0_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire [7:0] array_0_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire  array_0_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire  array_0_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire [63:0] array_0_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire [63:0] array_0_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire  array_0_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire  array_0_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//   wire [7:0] array_1_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire  array_1_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire  array_1_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire [63:0] array_1_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire [63:0] array_1_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire [7:0] array_1_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire  array_1_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire  array_1_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire [63:0] array_1_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire [63:0] array_1_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire  array_1_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire  array_1_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//   wire [7:0] array_2_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire  array_2_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire  array_2_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire [63:0] array_2_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire [63:0] array_2_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire [7:0] array_2_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire  array_2_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire  array_2_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire [63:0] array_2_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire [63:0] array_2_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire  array_2_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire  array_2_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//   wire [7:0] array_3_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire  array_3_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire  array_3_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire [63:0] array_3_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire [63:0] array_3_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire [7:0] array_3_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire  array_3_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire  array_3_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire [63:0] array_3_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire [63:0] array_3_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire  array_3_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire  array_3_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//   wire [7:0] array_4_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire  array_4_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire  array_4_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire [63:0] array_4_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire [63:0] array_4_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire [7:0] array_4_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire  array_4_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire  array_4_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire [63:0] array_4_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire [63:0] array_4_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire  array_4_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire  array_4_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//   wire [7:0] array_5_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire  array_5_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire  array_5_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire [63:0] array_5_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire [63:0] array_5_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire [7:0] array_5_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire  array_5_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire  array_5_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire [63:0] array_5_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire [63:0] array_5_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire  array_5_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire  array_5_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//   wire [7:0] array_6_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire  array_6_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire  array_6_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire [63:0] array_6_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire [63:0] array_6_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire [7:0] array_6_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire  array_6_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire  array_6_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire [63:0] array_6_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire [63:0] array_6_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire  array_6_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire  array_6_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//   wire [7:0] array_7_0_R0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire  array_7_0_R0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire  array_7_0_R0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire [63:0] array_7_0_R0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire [63:0] array_7_0_R0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire [7:0] array_7_0_W0_addr; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire  array_7_0_W0_en; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire  array_7_0_W0_clk; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire [63:0] array_7_0_W0_data_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire [63:0] array_7_0_W0_data_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire  array_7_0_W0_mask_0; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   wire  array_7_0_W0_mask_1; // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//   reg [127:0] io_resp_0_0_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171571:4]
//   reg [127:0] io_resp_0_1_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171604:4]
//   reg [127:0] io_resp_0_2_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171637:4]
//   reg [127:0] io_resp_0_3_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171670:4]
//   reg [127:0] io_resp_0_4_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171703:4]
//   reg [127:0] io_resp_0_5_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171736:4]
//   reg [127:0] io_resp_0_6_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171769:4]
//   reg [127:0] io_resp_0_7_REG; // @[dcache.scala 297:31 chipyard.TestHarness.LargeBoomConfig.fir 171802:4]
//   array_0_0 array_0_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171541:4]
//     .R0_addr(array_0_0_R0_addr),
//     .R0_en(array_0_0_R0_en),
//     .R0_clk(array_0_0_R0_clk),
//     .R0_data_0(array_0_0_R0_data_0),
//     .R0_data_1(array_0_0_R0_data_1),
//     .W0_addr(array_0_0_W0_addr),
//     .W0_en(array_0_0_W0_en),
//     .W0_clk(array_0_0_W0_clk),
//     .W0_data_0(array_0_0_W0_data_0),
//     .W0_data_1(array_0_0_W0_data_1),
//     .W0_mask_0(array_0_0_W0_mask_0),
//     .W0_mask_1(array_0_0_W0_mask_1)
//   );
//   array_0_0 array_1_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171574:4]
//     .R0_addr(array_1_0_R0_addr),
//     .R0_en(array_1_0_R0_en),
//     .R0_clk(array_1_0_R0_clk),
//     .R0_data_0(array_1_0_R0_data_0),
//     .R0_data_1(array_1_0_R0_data_1),
//     .W0_addr(array_1_0_W0_addr),
//     .W0_en(array_1_0_W0_en),
//     .W0_clk(array_1_0_W0_clk),
//     .W0_data_0(array_1_0_W0_data_0),
//     .W0_data_1(array_1_0_W0_data_1),
//     .W0_mask_0(array_1_0_W0_mask_0),
//     .W0_mask_1(array_1_0_W0_mask_1)
//   );
//   array_0_0 array_2_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171607:4]
//     .R0_addr(array_2_0_R0_addr),
//     .R0_en(array_2_0_R0_en),
//     .R0_clk(array_2_0_R0_clk),
//     .R0_data_0(array_2_0_R0_data_0),
//     .R0_data_1(array_2_0_R0_data_1),
//     .W0_addr(array_2_0_W0_addr),
//     .W0_en(array_2_0_W0_en),
//     .W0_clk(array_2_0_W0_clk),
//     .W0_data_0(array_2_0_W0_data_0),
//     .W0_data_1(array_2_0_W0_data_1),
//     .W0_mask_0(array_2_0_W0_mask_0),
//     .W0_mask_1(array_2_0_W0_mask_1)
//   );
//   array_0_0 array_3_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171640:4]
//     .R0_addr(array_3_0_R0_addr),
//     .R0_en(array_3_0_R0_en),
//     .R0_clk(array_3_0_R0_clk),
//     .R0_data_0(array_3_0_R0_data_0),
//     .R0_data_1(array_3_0_R0_data_1),
//     .W0_addr(array_3_0_W0_addr),
//     .W0_en(array_3_0_W0_en),
//     .W0_clk(array_3_0_W0_clk),
//     .W0_data_0(array_3_0_W0_data_0),
//     .W0_data_1(array_3_0_W0_data_1),
//     .W0_mask_0(array_3_0_W0_mask_0),
//     .W0_mask_1(array_3_0_W0_mask_1)
//   );
//   array_0_0 array_4_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171673:4]
//     .R0_addr(array_4_0_R0_addr),
//     .R0_en(array_4_0_R0_en),
//     .R0_clk(array_4_0_R0_clk),
//     .R0_data_0(array_4_0_R0_data_0),
//     .R0_data_1(array_4_0_R0_data_1),
//     .W0_addr(array_4_0_W0_addr),
//     .W0_en(array_4_0_W0_en),
//     .W0_clk(array_4_0_W0_clk),
//     .W0_data_0(array_4_0_W0_data_0),
//     .W0_data_1(array_4_0_W0_data_1),
//     .W0_mask_0(array_4_0_W0_mask_0),
//     .W0_mask_1(array_4_0_W0_mask_1)
//   );
//   array_0_0 array_5_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171706:4]
//     .R0_addr(array_5_0_R0_addr),
//     .R0_en(array_5_0_R0_en),
//     .R0_clk(array_5_0_R0_clk),
//     .R0_data_0(array_5_0_R0_data_0),
//     .R0_data_1(array_5_0_R0_data_1),
//     .W0_addr(array_5_0_W0_addr),
//     .W0_en(array_5_0_W0_en),
//     .W0_clk(array_5_0_W0_clk),
//     .W0_data_0(array_5_0_W0_data_0),
//     .W0_data_1(array_5_0_W0_data_1),
//     .W0_mask_0(array_5_0_W0_mask_0),
//     .W0_mask_1(array_5_0_W0_mask_1)
//   );
//   array_0_0 array_6_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171739:4]
//     .R0_addr(array_6_0_R0_addr),
//     .R0_en(array_6_0_R0_en),
//     .R0_clk(array_6_0_R0_clk),
//     .R0_data_0(array_6_0_R0_data_0),
//     .R0_data_1(array_6_0_R0_data_1),
//     .W0_addr(array_6_0_W0_addr),
//     .W0_en(array_6_0_W0_en),
//     .W0_clk(array_6_0_W0_clk),
//     .W0_data_0(array_6_0_W0_data_0),
//     .W0_data_1(array_6_0_W0_data_1),
//     .W0_mask_0(array_6_0_W0_mask_0),
//     .W0_mask_1(array_6_0_W0_mask_1)
//   );
//   array_0_0 array_7_0 ( // @[DescribedSRAM.scala 19:26 chipyard.TestHarness.LargeBoomConfig.fir 171772:4]
//     .R0_addr(array_7_0_R0_addr),
//     .R0_en(array_7_0_R0_en),
//     .R0_clk(array_7_0_R0_clk),
//     .R0_data_0(array_7_0_R0_data_0),
//     .R0_data_1(array_7_0_R0_data_1),
//     .W0_addr(array_7_0_W0_addr),
//     .W0_en(array_7_0_W0_en),
//     .W0_clk(array_7_0_W0_clk),
//     .W0_data_0(array_7_0_W0_data_0),
//     .W0_data_1(array_7_0_W0_data_1),
//     .W0_mask_0(array_7_0_W0_mask_0),
//     .W0_mask_1(array_7_0_W0_mask_1)
//   );
//   assign io_resp_0_0 = io_resp_0_0_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171573:4]
//   assign io_resp_0_1 = io_resp_0_1_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171606:4]
//   assign io_resp_0_2 = io_resp_0_2_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171639:4]
//   assign io_resp_0_3 = io_resp_0_3_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171672:4]
//   assign io_resp_0_4 = io_resp_0_4_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171705:4]
//   assign io_resp_0_5 = io_resp_0_5_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171738:4]
//   assign io_resp_0_6 = io_resp_0_6_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171771:4]
//   assign io_resp_0_7 = io_resp_0_7_REG; // @[dcache.scala 297:21 chipyard.TestHarness.LargeBoomConfig.fir 171804:4]
//   assign array_0_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_0_0_R0_en = io_read_0_bits_way_en[0] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171561:4]
//   assign array_0_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171564:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171568:6]
//   assign array_0_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_0_0_W0_en = io_write_bits_way_en[0] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171543:4]
//   assign array_0_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171544:4 chipyard.TestHarness.LargeBoomConfig.fir 171552:6]
//   assign array_0_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171545:6]
//   assign array_0_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171546:6]
//   assign array_0_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171550:6]
//   assign array_0_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171551:6]
//   assign array_1_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_1_0_R0_en = io_read_0_bits_way_en[1] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171594:4]
//   assign array_1_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171597:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171601:6]
//   assign array_1_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_1_0_W0_en = io_write_bits_way_en[1] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171576:4]
//   assign array_1_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171577:4 chipyard.TestHarness.LargeBoomConfig.fir 171585:6]
//   assign array_1_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171578:6]
//   assign array_1_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171579:6]
//   assign array_1_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171583:6]
//   assign array_1_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171584:6]
//   assign array_2_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_2_0_R0_en = io_read_0_bits_way_en[2] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171627:4]
//   assign array_2_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171630:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171634:6]
//   assign array_2_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_2_0_W0_en = io_write_bits_way_en[2] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171609:4]
//   assign array_2_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171610:4 chipyard.TestHarness.LargeBoomConfig.fir 171618:6]
//   assign array_2_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171611:6]
//   assign array_2_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171612:6]
//   assign array_2_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171616:6]
//   assign array_2_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171617:6]
//   assign array_3_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_3_0_R0_en = io_read_0_bits_way_en[3] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171660:4]
//   assign array_3_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171663:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171667:6]
//   assign array_3_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_3_0_W0_en = io_write_bits_way_en[3] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171642:4]
//   assign array_3_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171643:4 chipyard.TestHarness.LargeBoomConfig.fir 171651:6]
//   assign array_3_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171644:6]
//   assign array_3_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171645:6]
//   assign array_3_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171649:6]
//   assign array_3_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171650:6]
//   assign array_4_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_4_0_R0_en = io_read_0_bits_way_en[4] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171693:4]
//   assign array_4_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171696:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171700:6]
//   assign array_4_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_4_0_W0_en = io_write_bits_way_en[4] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171675:4]
//   assign array_4_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171676:4 chipyard.TestHarness.LargeBoomConfig.fir 171684:6]
//   assign array_4_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171677:6]
//   assign array_4_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171678:6]
//   assign array_4_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171682:6]
//   assign array_4_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171683:6]
//   assign array_5_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_5_0_R0_en = io_read_0_bits_way_en[5] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171726:4]
//   assign array_5_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171729:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171733:6]
//   assign array_5_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_5_0_W0_en = io_write_bits_way_en[5] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171708:4]
//   assign array_5_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171709:4 chipyard.TestHarness.LargeBoomConfig.fir 171717:6]
//   assign array_5_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171710:6]
//   assign array_5_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171711:6]
//   assign array_5_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171715:6]
//   assign array_5_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171716:6]
//   assign array_6_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_6_0_R0_en = io_read_0_bits_way_en[6] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171759:4]
//   assign array_6_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171762:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171766:6]
//   assign array_6_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_6_0_W0_en = io_write_bits_way_en[6] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171741:4]
//   assign array_6_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171742:4 chipyard.TestHarness.LargeBoomConfig.fir 171750:6]
//   assign array_6_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171743:6]
//   assign array_6_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171744:6]
//   assign array_6_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171748:6]
//   assign array_6_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171749:6]
//   assign array_7_0_R0_addr = io_read_0_bits_addr[11:4]; // @[dcache.scala 285:38 chipyard.TestHarness.LargeBoomConfig.fir 171540:4]
//   assign array_7_0_R0_en = io_read_0_bits_way_en[7] & io_read_0_valid; // @[dcache.scala 297:76 chipyard.TestHarness.LargeBoomConfig.fir 171792:4]
//   assign array_7_0_R0_clk = clock; // @[dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171795:4 dcache.scala 297:42 chipyard.TestHarness.LargeBoomConfig.fir 171799:6]
//   assign array_7_0_W0_addr = io_write_bits_addr[11:4]; // @[dcache.scala 282:34 chipyard.TestHarness.LargeBoomConfig.fir 171539:4]
//   assign array_7_0_W0_en = io_write_bits_way_en[7] & io_write_valid; // @[dcache.scala 293:37 chipyard.TestHarness.LargeBoomConfig.fir 171774:4]
//   assign array_7_0_W0_clk = clock; // @[dcache.scala 293:56 chipyard.TestHarness.LargeBoomConfig.fir 171775:4 chipyard.TestHarness.LargeBoomConfig.fir 171783:6]
//   assign array_7_0_W0_data_0 = io_write_bits_data[63:0]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171776:6]
//   assign array_7_0_W0_data_1 = io_write_bits_data[127:64]; // @[dcache.scala 294:75 chipyard.TestHarness.LargeBoomConfig.fir 171777:6]
//   assign array_7_0_W0_mask_0 = io_write_bits_wmask[0]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171781:6]
//   assign array_7_0_W0_mask_1 = io_write_bits_wmask[1]; // @[dcache.scala 295:54 chipyard.TestHarness.LargeBoomConfig.fir 171782:6]
//   always @(posedge clock) begin
//     io_resp_0_0_REG <= {array_0_0_R0_data_1,array_0_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171570:4]
//     io_resp_0_1_REG <= {array_1_0_R0_data_1,array_1_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171603:4]
//     io_resp_0_2_REG <= {array_2_0_R0_data_1,array_2_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171636:4]
//     io_resp_0_3_REG <= {array_3_0_R0_data_1,array_3_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171669:4]
//     io_resp_0_4_REG <= {array_4_0_R0_data_1,array_4_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171702:4]
//     io_resp_0_5_REG <= {array_5_0_R0_data_1,array_5_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171735:4]
//     io_resp_0_6_REG <= {array_6_0_R0_data_1,array_6_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171768:4]
//     io_resp_0_7_REG <= {array_7_0_R0_data_1,array_7_0_R0_data_0}; // @[dcache.scala 297:97 chipyard.TestHarness.LargeBoomConfig.fir 171801:4]
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
//   _RAND_0 = {4{`RANDOM}};
//   io_resp_0_0_REG = _RAND_0[127:0];
//   _RAND_1 = {4{`RANDOM}};
//   io_resp_0_1_REG = _RAND_1[127:0];
//   _RAND_2 = {4{`RANDOM}};
//   io_resp_0_2_REG = _RAND_2[127:0];
//   _RAND_3 = {4{`RANDOM}};
//   io_resp_0_3_REG = _RAND_3[127:0];
//   _RAND_4 = {4{`RANDOM}};
//   io_resp_0_4_REG = _RAND_4[127:0];
//   _RAND_5 = {4{`RANDOM}};
//   io_resp_0_5_REG = _RAND_5[127:0];
//   _RAND_6 = {4{`RANDOM}};
//   io_resp_0_6_REG = _RAND_6[127:0];
//   _RAND_7 = {4{`RANDOM}};
//   io_resp_0_7_REG = _RAND_7[127:0];
// `endif // RANDOMIZE_REG_INIT
//   `endif // RANDOMIZE
// end // initial
// `ifdef FIRRTL_AFTER_INITIAL
// `FIRRTL_AFTER_INITIAL
// `endif
// `endif // SYNTHESIS
// endmodule