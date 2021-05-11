

//connect to original module
module ICache( // @[chipyard.TestHarness.LargeBoomConfig.fir 176616:2]
  input  logic         clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 176617:4]
  input  logic         reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 176618:4]
  input  logic         auto_master_out_a_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  logic         auto_master_out_d_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  logic [2:0]   auto_master_out_d_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  logic [3:0]   auto_master_out_d_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  logic [127:0] auto_master_out_d_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  input  logic         io_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input  logic [38:0]  io_req_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input  logic [31:0]  io_s1_paddr, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input  logic         io_s1_kill, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input  logic         io_s2_kill, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  input  logic         io_invalidate, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]

  output logic [31:0]  auto_master_out_a_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  output logic         auto_master_out_a_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176619:4]
  output logic         io_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  output logic         io_resp_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
  output logic [127:0] io_resp_bits_data // @[chipyard.TestHarness.LargeBoomConfig.fir 176620:4]
);

  ValidSTIF #(ICacheST::ICacheRespST) io_resp ();
  DecoupledIF #(ICacheST::ICacheReqST) io_req ();
  DecoupledIF #(BundleST::TLBundleAST) auto_a ();
  DecoupledIF #(BundleST::TLBundleDST) auto_d ();

  always_comb begin
    auto_master_out_a_valid = auto_a.valid;
    auto_master_out_a_bits_address = auto_a.bits.address;
    io_req_ready = io_req.ready;
    io_resp_valid = io_resp.valid;
    io_resp_bits_data = io_resp.bits.data;


    io_req.valid = io_req_valid;
    io_req.bits.addr = io_req_bits_addr;

    auto_a.ready = auto_master_out_a_ready;

    auto_d.valid = auto_master_out_d_valid;
    auto_d.bits.opcode = auto_master_out_d_bits_opcode;
    auto_d.bits.size = auto_master_out_d_bits_size;
    auto_d.bits.data = auto_master_out_d_bits_data;

  end

  ICacheModule cache (
      .clock         (clock),
      .reset         (reset),
      .io_s1_paddr   (io_s1_paddr),
      .io_s1_kill    (io_s1_kill),
      .io_s2_kill    (io_s2_kill),
      .io_invalidate (io_invalidate),
      .io_s2_prefetch(1'b0),
      .io_perf_acquire(),

      .io_resp  (io_resp),
      .io_req   (io_req),
      .io_auto_a(auto_a),
      .io_auto_d(auto_d)
  );

endmodule

module ICacheModule (
    input  logic                  clock,
    input  logic                  reset,
    input  logic [`paddrBits-1:0] io_s1_paddr,    //实地址
    input  logic                  io_s1_kill,     //分支预测中断
    input  logic                  io_s2_kill,     //分支预测中断
    input  logic                  io_invalidate,  //
    input  logic                  io_s2_prefetch, //预取指令
    output logic                  io_perf_acquire,

    DecoupledIF.in io_req,      //ICacheReq  cpu发出的需求数据
    DecoupledIF.in io_auto_d,   //TLBundleDST  总线来的数据
    ValidSTIF.out   io_resp,    //ICacheResp  需要返回给cpu的指令
    DecoupledIF.out  io_auto_a  //TLBundleAST 返回给总线权限请求  
);

  localparam wordBits = `fetchBytes * 8;  //16*8
  localparam refillsToOneBank = `fetchBytes * 8 * 2 == wordBits;  //false
  localparam enableICacheDelay = 0;

  localparam nSets = HasL1CacheParameters::nSets;
  localparam nWays = HasL1CacheParameters::nWays;
  localparam refillCycles = HasL1CacheParameters::refillCycles;
  localparam tagBits = HasL1CacheParameters::tagBits;
  localparam idxBits = HasL1CacheParameters::idxBits;
  localparam untagBits = HasL1CacheParameters::untagBits;
  localparam lgCacheBlockBytes = HasL1HellaCacheParameters::lgCacheBlockBytes;


  localparam ramDepth = (refillsToOneBank && `nBanks == 2) ? nSets * refillCycles / 2 :
      nSets * refillCycles;  //sram 行数

  logic io_req_fire;
  logic io_auto_a_fire;
  logic io_auto_d_fire;

  always_comb begin
    io_req_fire = io_req.valid && io_req.ready;
    io_auto_a_fire = io_auto_a.valid && io_auto_a.ready;
    io_auto_d_fire = io_auto_d.valid && io_auto_d.ready;
  end
  //reg
  logic s1_valid;
  logic s2_valid;
  logic s2_hit;

  logic invalidated;
  logic refill_valid;  //refil_fire 有效设置有效，refill_done 设置无效
  logic refill_valid_reg;
  logic [`paddrBits-1:0] refill_paddr;
  logic [nSets * nWays-1:0] vb_array;
  logic s1_bankid;


  //wire

  //当请求到来 设为第0个周期
  logic s0_valid;  //当cpu请求到来时为1
  logic [`paddrBits-1:0] s0_vaddr; //需要读取的地址
  logic [nWays-1:0] s1_tag_hit;  //判断哪路命中,第0个周期就能完成
  logic s1_hit; //判断是否命中

  logic refill_fire;  // a通道有数据到来设置为true
  logic s2_miss;
  logic [tagBits-1:0] refill_tag;
  logic [idxBits-1:0] refill_idx;
  logic refill_done;  //d通道数据传输完成设置为true
  logic [$clog2(nWays)-1:0] repl_way;
  logic [tagBits-1:0] tag_rdata[nWays-1:0];
  logic [wordBits-1:0] s2_dout[nWays-1:0];



  always_comb begin
    s0_valid = io_req_fire;
    s0_vaddr = io_req.bits.addr;
    s1_hit = |s1_tag_hit;

    refill_fire = io_auto_a_fire;
    s2_miss = s2_valid && !s2_hit && !refill_valid_reg;

    refill_tag = refill_paddr[tagBits + untagBits - 1:untagBits];

    refill_idx = refill_paddr[HasL1CacheParameters::untagBits - 1:`blockOffBits];
  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset)begin
      s1_valid <= 0;
      s2_valid <= 0;
      s2_hit <= 0;
      refill_valid_reg <= 0;
      refill_paddr <= 0;
    end
    else begin
      s1_valid <= s0_valid;
      s2_valid <= s1_valid && !io_s1_kill;
      s2_hit <= s1_hit;
      refill_valid_reg <= refill_valid;

      if (s1_valid && !(refill_valid || s2_miss))begin
        refill_paddr <= io_s1_paddr;
      end
    end
  end


  //assign val (_, _, d_done, refill_cnt) = edge_out.count(tl_out.d)
  wire  refill_one_beat_opdata = io_auto_d.bits.opcode[0]; // @[Edges.scala 105:36 chipyard.TestHarness.LargeBoomConfig.fir 176665:4]
  wire  refill_one_beat = io_auto_d.valid & refill_one_beat_opdata; // @[icache.scala 169:41 chipyard.TestHarness.LargeBoomConfig.fir 176666:4]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << io_auto_d.bits.size; // @[package.scala 234:77 chipyard.TestHarness.LargeBoomConfig.fir 176671:4]
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
    if (reset) begin  // @[Edges.scala 228:27 chipyard.TestHarness.LargeBoomConfig.fir 176677:4]
      counter <= 8'h0;  // @[Edges.scala 228:27 chipyard.TestHarness.LargeBoomConfig.fir 176677:4]
    end else if (io_auto_d.valid
        ) begin  // @[Edges.scala 234:17 chipyard.TestHarness.LargeBoomConfig.fir 176687:4]
      if (first) begin  // @[Edges.scala 235:21 chipyard.TestHarness.LargeBoomConfig.fir 176688:6]
        if (refill_one_beat_opdata
            ) begin  // @[Edges.scala 220:14 chipyard.TestHarness.LargeBoomConfig.fir 176676:4]
          counter <= beats1_decode;
        end else begin
          counter <= 8'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
  end



  assign refill_done = refill_one_beat && d_done;
  

  logic [15:0] LFSR16_out;
  LFSR16 lfsr16_icache(
    .clock(clock), 
    .reset(reset), 
    .increment(refill_fire), 
    .data_out(LFSR16_out));
  assign repl_way = LFSR16_out[$clog2(nWays) - 1:0];


  //tag_array assign 
  logic [nWays-1:0] repl_way_1H;
  logic [tagBits-1:0] refill_tag_wdata[nWays-1:0];

  generate 
    for (genvar i = 0; i < nWays; i++) begin
      assign repl_way_1H[i] = repl_way == i? 1'b1: 1'b0;
      assign refill_tag_wdata[i] = refill_tag ;
    end
  endgenerate

  SyncReadMem #(
      .DEEPTH(HasL1CacheParameters::nSets),
      .DATA_WIDTH(tagBits),
      .WMASK_WIDTH(nWays)
  ) tag_array (
      .clk  (clock),
      .reset (reset),
      .wen  (refill_done),
      .waddr(refill_idx),
      .cs   (repl_way_1H),
      .wdata(refill_tag_wdata),

      .ren  (!refill_done && s0_valid),
      .raddr(s0_vaddr[untagBits - 1:`blockOffBits]),
      .rdata(tag_rdata)
  );



  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      vb_array <= 0;
      invalidated <= 0;
      refill_valid <= 0;
    end else begin
      if (refill_one_beat) vb_array[{repl_way, refill_idx}] <= refill_done && !invalidated;

      if (io_invalidate) begin
        vb_array <= 0;
        invalidated <= 1;
      end


      if (!refill_valid) invalidated <= 0;

      if (refill_fire) refill_valid <= 1;

      if (refill_done) refill_valid <= 0;


    end
  end



  //第1个周期判断哪路命中
  logic [tagBits-1:0] s1_tag;
  logic [idxBits-1:0] s1_idx;
  assign s1_idx = io_s1_paddr[untagBits - 1:`blockOffBits];
  assign s1_tag = io_s1_paddr[tagBits + untagBits - 1:untagBits];
  generate
    for (genvar i = 0; i < nWays; i++) begin
      assign s1_tag_hit[i] = (vb_array[{i, s1_idx}] && tag_rdata[i] == s1_tag);
    end
  endgenerate


  function logic [idxBits + $clog2(refillCycles)-1:0] b0Row(logic [`paddrBits-1:0] addr);
    return addr[untagBits - 1:`blockOffBits - $clog2(refillCycles)] + addr[$clog2(`bankBytes)];
  endfunction

  function logic [idxBits + $clog2(refillCycles)-1:0] b1Row(logic [`paddrBits-1:0] addr);

    return addr[untagBits - 1:`blockOffBits - $clog2(refillCycles)];
  endfunction

  logic [wordBits/2-1:0] bank0_data_out[nWays-1:0];
  logic [wordBits/2-1:0] bank1_data_out[nWays-1:0];
  logic [wordBits/2-1:0] bank0_data_in;
  logic [wordBits/2-1:0] bank1_data_in;
  logic s0_ren;
  logic [nWays-1:0] data_wen;

  logic [idxBits + $clog2(refillCycles)-1:0] mem_idx0;
  logic [idxBits + $clog2(refillCycles)-1:0] mem_idx1;
  logic [nWays-1:0] data_ren;

  assign s0_ren = s0_valid;
  assign bank0_data_in = io_auto_d.bits.data[wordBits/2-1:0];
  assign bank1_data_in = io_auto_d.bits.data[wordBits-1:wordBits/2];
  


  assign mem_idx0 =
      refill_one_beat ? (refill_idx << $clog2(refillCycles)) | refill_cnt : b0Row(s0_vaddr);
  assign mem_idx1 =
      refill_one_beat ? (refill_idx << $clog2(refillCycles)) | refill_cnt : b1Row(s0_vaddr);

  generate
    for (genvar i = 0; i < nWays; i++) begin
      assign data_wen[i] = (refill_one_beat && !invalidated) && repl_way == i;
      assign data_ren[i] = !data_wen[i] && s0_ren;


      SyncReadMemNoVec #(
          .DEEPTH(nSets * refillCycles),
          .DATA_WIDTH(wordBits / 2)
      ) data_array0 (
          .clk  (clock),
          .reset(reset),
          .wen  (data_wen[i]),
          .waddr(mem_idx0),
          .wdata(bank0_data_in),

          .ren  (data_ren[i]),
          .raddr(mem_idx0),
          .rdata(bank0_data_out[i])  //第一个时钟周期数据可用
      );

      SyncReadMemNoVec #(
          .DEEPTH(nSets * refillCycles),
          .DATA_WIDTH(wordBits / 2)
      ) data_array1 (
          .clk  (clock),
          .reset(reset),
          .wen  (data_wen[i]),
          .waddr(mem_idx1),
          .wdata(bank1_data_in),

          .ren  (data_ren[i]),
          .raddr(mem_idx1),
          .rdata(bank1_data_out[i])
      );
      always_ff @(posedge clock or posedge reset) begin
        if (reset)begin
          s2_dout[i] <= 0;
        end else begin
          s2_dout[i] <= {bank1_data_out[i], bank0_data_out[i]}; //读取数据时第二个时钟周期数据可用
        end
      end
    end
  endgenerate


  logic [nWays-1:0] s2_tag_hit;
  logic s2_bankid;


  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      s2_tag_hit <= 0;
      s2_bankid <= 0;
      s1_bankid <=0;

    end else begin
      s1_bankid <= s0_vaddr[$clog2(`bankBytes)];
      s2_tag_hit <= s1_tag_hit;
      s2_bankid <= s1_bankid;

    end
  end

  logic [wordBits-1:0] s2_way_mux;
  logic [wordBits/2 -1:0] s2_bank0_data;
  logic [wordBits/2 -1:0] s2_bank1_data;
  logic [wordBits-1:0] s2_data;


  always_comb begin
    s2_way_mux = 0;
    for (int i = 0; i < nWays; i++) begin
      s2_way_mux = s2_tag_hit[i] ? s2_dout[i] : s2_way_mux;
    end
    s2_bank0_data = s2_way_mux[wordBits / 2 - 1:0];
    s2_bank1_data = s2_way_mux[wordBits - 1:wordBits / 2];

    s2_data = s2_bankid ? {s2_bank0_data, s2_bank1_data} : {s2_bank1_data, s2_bank0_data}; //组合逻辑,第二个时钟周期数据可用
  end

  always_comb begin
    io_req.ready = !refill_one_beat;
    io_auto_d.ready = 1;

    io_resp.bits.data = s2_data;
    io_resp.valid = s2_valid && s2_hit;

    io_auto_a.valid = s2_miss && !refill_valid && !io_s2_kill;
    io_auto_a.bits = Edge::GetA(
    .fromSource(0),
    .toAddress((refill_paddr >> `blockOffBits) << `blockOffBits),
    .lgSize(lgCacheBlockBytes)
    );  //得到refill_paddr的地址返回
    io_perf_acquire = io_auto_a_fire;
  end
endmodule
