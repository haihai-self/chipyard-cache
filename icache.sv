

//connect to original module
module ICache( // @[chipyard.TestHarness.LargeBoomConfig.fir 176616:2]
  input          clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 176617:4]
  input          reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 176618:4]
  input  [31:0]  io_s1_paddr, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input          io_s1_kill, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input          io_s2_kill, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input          io_invalidate, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]

  output         io_resp_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  output [127:0] io_resp_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  output         io_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input          io_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input  [38:0]  io_req_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]

  input          auto_master_out_a_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  output         auto_master_out_a_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  output [31:0]  auto_master_out_a_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input          auto_master_out_d_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  [2:0]   auto_master_out_d_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  [3:0]   auto_master_out_d_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  [127:0] auto_master_out_d_bits_data // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
);

  ValidSTIF #(ICacheST::ICacheRespST) io_resp();
  DecoupledIF #(ICacheST::ICacheReqST) io_req();
  DecoupledIF #(BundleST::TLBundleAST) auto_a();
  DecoupledIF #(BundleST::TLBundleDST) auto_d();

  always_comb begin
    io_resp_valid = io_resp.valid;
    io_resp_bits_data = io_resp.bits.data;

    io_req_ready = io_req.ready;
    io_req.valid = io_req_valid;
    io_req.bits.addr = io_req_bits_addr;

    auto_a.ready = auto_master_out_a_ready;
    auto_master_out_a_bits_address = auto_a.bits.address;
    auto_master_out_a_valid = auto_a.valid;

    auto_d.valid = auto_master_out_d_valid;
    auto_d.bits.opcode = auto_master_out_d_bits_opcode;
    auto_d.bits.size = auto_master_out_d_bits_size;
    auto_d.bits.data = auto_master_out_d_bits_data;

  end

  ICacheModule icache (
      .clock(clock),
      .reset(reset),
      .io_s1_paddr(io_s1_paddr),
      .io_s1_kill(io_s1_kill),
      .io_s2_kill(io_s2_kill),
      .io_invalidate(io_invalidate),
      .io_s2_prefetch(0),

      .io_resp(io_resp),
      .io_req(io_req),
      .io_auto_a(auto_a),
      .io_auto_d(auto_d)
  );

endmodule

module ICacheModule (
    input logic                  clock,
    input logic                  reset,
    input logic [`paddrBits-1:0] io_s1_paddr,
    input logic                  io_s1_kill,
    input logic                  io_s2_kill,
    input logic                  io_invalidate,
    input logic                  io_s2_prefetch,

    ValidSTIF.out   io_resp,  //ICacheResp
    DecoupledIF.out io_req,  //ICacheReq
    DecoupledIF.in  io_auto_a,  //TLBundleAST
    DecoupledIF.out io_auto_d  //TLBundleDST
);

  localparam wordBits = `fetchBytes*8;  //16*8
  localparam refillsToOneBank = `fetchBytes * 8 * 2 == wordBits;  //false
  localparam ramDepth = (refillsToOneBank && `nBanks == 2)?
  HasL1CacheParameters::nSets * HasL1CacheParameters::refillCycles / 2:
  HasL1CacheParameters::nSets * HasL1CacheParameters::refillCycles;  //sram 行数

  logic io_req_fire;
  logic io_auto_a_fire;
  logic io_auto_d_fire;

  always_comb begin
    io_req_fire = io_req.valid && io_req.ready;
    io_auto_a_fire = io_auto_a.valid && io_auto_a.ready;
    io_auto_d_fire = io_auto_d.vallid && io_auto_d.ready;
  end
  //reg
  logic s1_valid;
  logic s2_valid;
  logic s2_hit;

  logic invalidated;
  logic refill_valid;
  logic refill_valid_reg;
  logic refill_paddr;
  logic [HasL1CacheParameters::nSets * HasL1CacheParameters::nWays-1:0] vb_array;
  // logic [HasL1CacheParameters::nWays-1:0][HasL1CacheParameters::tagBits]
  //     tag_array[HasL1CacheParameters::nSets];

  



  //wire
  logic s0_valid;
  logic s0_vaddr;
  logic [HasL1CacheParameters::nWays-1:0] s1_tag_hit;
  logic is_hit;

  logic refill_fire;
  logic s2_miss;
  logic [HasL1CacheParameters::tagBits-1:0] refill_tag;
  logic [HasL1CacheParameters::idxBits-1:0] refill_idx;
  logic refill_done;
  logic [$clog2(HasL1CacheParameters::nWays)-1:0] repl_way;
  logic [HasL1CacheParameters::tagBits] tag_rdata[HasL1CacheParameters::nWays-1:0];
  logic [wordBits-1:0] s2_dout[HasL1CacheParameters::nWays-1:0];
  logic s1_bankid;



  always_comb begin
    s0_vaddr = io_req_fire;
    s0_vaddr = io_req.bits.addr;
    is_hit = |s1_tag_hit;

    refill_fire = io_auto_a_fire;
    s2_miss = s2_valid && s2_hit && refill_valid_reg;

    refill_tag = refill_paddr[HasL1CacheParameters::tagBits + HasL1CacheParameters::untagBits - 1:
                              HasL1CacheParameters::untagBits];

    refill_idx = refill_paddr[HasL1CacheParameters::untagBits - 1:`blockOffBits];
    // refill_one_beat = io_auto_d_fire && hasData(io_auto_d.bits);
  end


  // val (_, _, d_done, refill_cnt) = edge_out.count(tl_out.d) need to imps
  wire  refill_one_beat_opdata = io_auto_d.bits_opcode[0]; // @[Edges.scala 105:36 chipyard.TestHarness.LargeBoomConfig.fir 176665:4]
  wire  refill_one_beat = io_auto_d.valid & refill_one_beat_opdata; // @[icache.scala 169:41 chipyard.TestHarness.LargeBoomConfig.fir 176666:4]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << io_auto_d.bits_size; // @[package.scala 234:77 chipyard.TestHarness.LargeBoomConfig.fir 176671:4]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46 chipyard.TestHarness.LargeBoomConfig.fir 176673:4]
  wire [7:0] beats1_decode = _beats1_decode_T_3[11:4]; // @[Edges.scala 219:59 chipyard.TestHarness.LargeBoomConfig.fir 176674:4]
  wire [7:0] beats1 = refill_one_beat_opdata ? beats1_decode : 8'h0; // @[Edges.scala 220:14 chipyard.TestHarness.LargeBoomConfig.fir 176676:4]
  reg [7:0] counter; // @[Edges.scala 228:27 chipyard.TestHarness.LargeBoomConfig.fir 176677:4]
  wire [7:0] counter1 = counter - 8'h1; // @[Edges.scala 229:28 chipyard.TestHarness.LargeBoomConfig.fir 176679:4]
  wire  first = counter == 8'h0; // @[Edges.scala 230:25 chipyard.TestHarness.LargeBoomConfig.fir 176680:4]
  wire  _last_T = counter == 8'h1; // @[Edges.scala 231:25 chipyard.TestHarness.LargeBoomConfig.fir 176681:4]
  wire  _last_T_1 = beats1 == 8'h0; // @[Edges.scala 231:47 chipyard.TestHarness.LargeBoomConfig.fir 176682:4]
  wire  last = _last_T | _last_T_1; // @[Edges.scala 231:37 chipyard.TestHarness.LargeBoomConfig.fir 176683:4]
  wire  d_done = last & io_auto_d.valid; // @[Edges.scala 232:22 chipyard.TestHarness.LargeBoomConfig.fir 176684:4]
  wire [7:0] _count_T = ~counter1; // @[Edges.scala 233:27 chipyard.TestHarness.LargeBoomConfig.fir 176685:4]
  wire [7:0] refill_cnt = beats1 & _count_T; // @[Edges.scala 233:25 chipyard.TestHarness.LargeBoomConfig.fir 176686:4]
  
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 228:27 chipyard.TestHarness.LargeBoomConfig.fir 176677:4]
      counter <= 8'h0; // @[Edges.scala 228:27 chipyard.TestHarness.LargeBoomConfig.fir 176677:4]
    end else if (io_auto_d.valid) begin // @[Edges.scala 234:17 chipyard.TestHarness.LargeBoomConfig.fir 176687:4]
      if (first) begin // @[Edges.scala 235:21 chipyard.TestHarness.LargeBoomConfig.fir 176688:6]
        if (refill_one_beat_opdata) begin // @[Edges.scala 220:14 chipyard.TestHarness.LargeBoomConfig.fir 176676:4]
          counter <= beats1_decode;
        end else begin
          counter <= 8'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
  end


  assign io_req.ready = !refill_one_beat;
  assign refill_done = refill_one_beat && d_done;
  assign auto_d.ready = 1;



  wire  repl_way_prng_io_out_0; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_1; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_2; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_3; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_4; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_5; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_6; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_7; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_8; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_9; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_10; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_11; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_12; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_13; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_14; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_15; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  

  MaxPeriodFibonacciLFSR_1 repl_way_prng ( // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
    .clock(clock),
    .reset(reset),
    .io_increment(refill_fire),
    .io_out_0(repl_way_prng_io_out_0),
    .io_out_1(repl_way_prng_io_out_1),
    .io_out_2(repl_way_prng_io_out_2),
    .io_out_3(repl_way_prng_io_out_3),
    .io_out_4(repl_way_prng_io_out_4),
    .io_out_5(repl_way_prng_io_out_5),
    .io_out_6(repl_way_prng_io_out_6),
    .io_out_7(repl_way_prng_io_out_7),
    .io_out_8(repl_way_prng_io_out_8),
    .io_out_9(repl_way_prng_io_out_9),
    .io_out_10(repl_way_prng_io_out_10),
    .io_out_11(repl_way_prng_io_out_11),
    .io_out_12(repl_way_prng_io_out_12),
    .io_out_13(repl_way_prng_io_out_13),
    .io_out_14(repl_way_prng_io_out_14),
    .io_out_15(repl_way_prng_io_out_15)
  );

  wire [7:0] repl_way_lo = {repl_way_prng_io_out_7,repl_way_prng_io_out_6,repl_way_prng_io_out_5,repl_way_prng_io_out_4,
    repl_way_prng_io_out_3,repl_way_prng_io_out_2,repl_way_prng_io_out_1,repl_way_prng_io_out_0}; // @[PRNG.scala 86:17 chipyard.TestHarness.LargeBoomConfig.fir 176720:4]
  wire [15:0] _repl_way_T = {repl_way_prng_io_out_15,repl_way_prng_io_out_14,repl_way_prng_io_out_13,
    repl_way_prng_io_out_12,repl_way_prng_io_out_11,repl_way_prng_io_out_10,repl_way_prng_io_out_9,
    repl_way_prng_io_out_8,repl_way_lo}; // @[PRNG.scala 86:17 chipyard.TestHarness.LargeBoomConfig.fir 176728:4]
  
  assign repl_way = HasL1CacheParameters::isDM? 0: _repl_way_T[$clog2(HasL1CacheParameters::nWays)-1:0];
  
  logic [HasL1CacheParameters::nWays-1:0] repl_way_1H;
  logic [HasL1CacheParameters::tagBits-1:0] refill_tag_wdata [HasL1CacheParameters::nWays-1:0];


  always_comb begin
    repl_way_1H = 0;
    for (int i = 0; i < HasL1CacheParameters::nWays; i++) begin
      if (i == repl_way)
        repl_way_1H[i] = 1;
      refill_tag_wdata[i] = refill_tag;
    end
  end

  SyncReadMem #(
      .DEEPTH(HasL1CacheParameters::nSets),
      .DATA_WIDTH(HasL1CacheParameters::tagBits),
      .WMASK_WIDTH(HasL1CacheParameters::nWays)
  ) tag_array (
      .clk  (clock),
      .wen  (refill_done),
      .waddr(refill_idx),
      .cs   (repl_way_1H),
      .wdata(refill_tag_wdata),

      .ren  (!refill_done && s0_valid),
      .raddr(s0_vaddr[HasL1CacheParameters::untagBits - 1:`blockOffBits]),
      .rdata(tag_rdata)
  );



  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      vb_array <= 0;
      invalidated <= 0;
      refill_valid <=0;
    end else begin
      if (refill_one_beat) vb_array[{repl_way, refill_idx}] <= refill_done && !invalidated;

      if (io_invalidate) begin
        vb_array <= 0;
        invalidated <= 1;
      end

      
      if (!refill_valid)
        invalidated <= 0;
      
      if (refill_fire)
        refill_valid <= 1;
      
      if (refill_done)
        refill_valid <= 0; 
        
      
    end
  end


  generate
    for (genvar i = 0; i < HasL1CacheParameters::nWays; i++) begin
      logic [HasL1CacheParameters::idxBits-1:0]
          s1_idx = io_s1_paddr[HasL1CacheParameters::untagBits - 1:`blockOffBits];
      logic [HasL1CacheParameters::tagBits-1:0]
          s1_tag = io_s1_paddr[HasL1CacheParameters::tagBits + HasL1CacheParameters::untagBits - 1:
                               HasL1CacheParameters::untagBits];
      logic [$clog2(nWays) + HasL1CacheParameters::idxBits-1:0] s1_vb_index = {i, s1_idx};
      logic s1_vb = vb_array[s1_vb_index];
      logic [HasL1CacheParameters::tagBits-1:0] tag = tag_rdata[i];
      assign s1_tag_hit[i] = s1_vb && tag == s1_tag;
    end
  endgenerate

  
  generate
    for (genvar i = 0; i < HasL1CacheParameters::nWays; i++) begin
      SyncReadMem #(
          .DEEPTH(HasL1CacheParameters::nSets * HasL1CacheParameters::refillCycles),
          .DATA_WIDTH(wordBits),
          .WMASK_WIDTH(1)
      ) data_array0 (
          .clk  (clock),
          .wen  (refill_done),
          .waddr(refill_idx),
          .cs   (repl_way_1H),
          .wdata(refill_tag_wdata),

          .ren  (!refill_done && s0_valid),
          .raddr(s0_vaddr[HasL1CacheParameters::untagBits - 1:`blockOffBits]),
          .rdata(tag_rdata)
      );
      
      SyncReadMem #(
          .DEEPTH(HasL1CacheParameters::nSets * HasL1CacheParameters::refillCycles),
          .DATA_WIDTH(wordBits),
          .WMASK_WIDTH(1)
      ) data_array0 (
          .clk  (clock),
          .wen  (refill_done),
          .waddr(refill_idx),
          .cs   (repl_way_1H),
          .wdata(refill_tag_wdata),

          .ren  (!refill_done && s0_valid),
          .raddr(s0_vaddr[HasL1CacheParameters::untagBits - 1:`blockOffBits]),
          .rdata(tag_rdata)
      );
    end
  endgenerate

endmodule
