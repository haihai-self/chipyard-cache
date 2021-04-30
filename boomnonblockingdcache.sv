typedef struct packed {
  NBDcacheST::L1DataReadReqST req;
  logic valid;
} BoomL1DataReadReqST;

module BoomNonBlockingDCache( // @[chipyard.TestHarness.LargeBoomConfig.fir 172125:2]
  input          clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 172126:4]
  input          reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 172127:4]
  input          auto_out_a_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_a_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_a_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_a_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [3:0]   auto_out_a_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_a_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [31:0]  auto_out_a_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [15:0]  auto_out_a_bits_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [127:0] auto_out_a_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]

  output         auto_out_b_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input          auto_out_b_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [1:0]   auto_out_b_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [3:0]   auto_out_b_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [2:0]   auto_out_b_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [31:0]  auto_out_b_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]

  input          auto_out_c_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_c_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_c_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_c_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [3:0]   auto_out_c_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_c_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [31:0]  auto_out_c_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [127:0] auto_out_c_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]

  output         auto_out_d_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input          auto_out_d_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [2:0]   auto_out_d_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [1:0]   auto_out_d_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [3:0]   auto_out_d_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [2:0]   auto_out_d_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [3:0]   auto_out_d_bits_sink, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [127:0] auto_out_d_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]

  input          auto_out_e_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_e_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [3:0]   auto_out_e_bits_sink, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]

  output         io_lsu_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [15:0]  io_lsu_req_bits_0_bits_uop_br_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [4:0]   io_lsu_req_bits_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [4:0]   io_lsu_req_bits_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [4:0]   io_lsu_req_bits_0_bits_uop_mem_cmd, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [1:0]   io_lsu_req_bits_0_bits_uop_mem_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_mem_signed, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [39:0]  io_lsu_req_bits_0_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [63:0]  io_lsu_req_bits_0_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]

  input          io_lsu_s1_kill_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_resp_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_resp_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [63:0]  io_lsu_resp_0_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]

  output         io_lsu_nack_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_nack_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_nack_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]

  input  [15:0]  io_lsu_brupdate_b1_resolve_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [15:0]  io_lsu_brupdate_b1_mispredict_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_exception, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_release_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_release_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [31:0]  io_lsu_release_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_force_order, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_ordered // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
);
  DecoupledIF #(BundleST::TLBundleAST) io_auto_a();
  DecoupledIF #(BundleST::TLBundleBST) io_auto_b();
  DecoupledIF #(BundleST::TLBundleCST) io_auto_c();
  DecoupledIF #(BundleST::TLBundleDST) io_auto_d();
  DecoupledIF #(BundleST::TLBundleEST) io_auto_e();
  DecoupledIF #(BoomLSUST::BoomDCacheReqValidST) io_lsu_req();
  DecoupledIF #(BundleST::TLBundleCST) io_lsu_release();
  ValidSTIF #(BoomLSUST::BoomDCacheRespST) io_lsu_resp();
  ValidSTIF #(BoomLSUST::BoomDCacheReqST) io_lsu_nack();

  ExuST::BrUpdateInfoST io_lsu_brupdate;



  always_comb begin
    io_auto_a.ready = auto_out_a_ready;
    auto_out_a_valid = io_auto_a.valid;
    auto_out_a_bits_opcode = io_auto_a.bits.opcode;
    auto_out_a_bits_param = io_auto_a.bits.param;
    auto_out_a_bits_size = io_auto_a.bits.size;
    auto_out_a_bits_source = io_auto_a.bits.source;
    auto_out_a_bits_address = io_auto_a.bits.address;
    auto_out_a_bits_mask = io_auto_a.bits.mask;
    auto_out_a_bits_data = io_auto_a.bits.data;

    auto_out_b_ready = io_auto_b.ready;
    io_auto_b.valid = auto_out_b_valid;
    io_auto_b.bits.param = auto_out_b_bits_param;
    io_auto_b.bits.size = auto_out_b_bits_size;
    io_auto_b.bits.source = auto_out_b_bits_source;
    io_auto_b.bits.address = auto_out_b_bits_address;

    io_auto_c.ready = auto_out_c_ready;
    auto_out_c_valid = io_auto_c.valid;
    auto_out_c_bits_opcode = io_auto_c.bits.opcode;
    auto_out_c_bits_param = io_auto_c.bits.param;
    auto_out_c_bits_size = io_auto_c.bits.size;
    auto_out_c_bits_source = io_auto_c.bits.source;
    auto_out_c_bits_address = io_auto_c.bits.address;
    auto_out_c_bits_data = io_auto_c.bits.data;

    auto_out_d_ready = io_auto_d.ready;
    io_auto_d.valid = auto_out_d_valid;
    io_auto_d.bits.opcode = auto_out_d_bits_opcode;
    io_auto_d.bits.param = auto_out_d_bits_param;
    io_auto_d.bits.size = auto_out_d_bits_size;
    io_auto_d.bits.source = auto_out_d_bits_source;
    io_auto_d.bits.sink = auto_out_d_bits_sink;
    io_auto_d.bits.data = auto_out_d_bits_data;

    io_auto_e.ready = auto_out_e_ready;
    auto_out_e_valid = io_auto_e.valid;
    auto_out_e_bits_sink = io_auto_e.bits.sink;


    io_lsu_req_ready = io_lsu_req.ready;
    io_lsu_req.valid = io_lsu_req_valid;
    io_lsu_req.bits.valid = io_lsu_req_bits_0_valid;
    io_lsu_req.bits.uop.br_mask = io_lsu_req_bits_0_bits_uop_br_mask;
    io_lsu_req.bits.uop.ldq_idx = io_lsu_req_bits_0_bits_uop_ldq_idx;
    io_lsu_req.bits.uop.stq_idx = io_lsu_req_bits_0_bits_uop_stq_idx;
    io_lsu_req.bits.uop.mem_cmd = io_lsu_req_bits_0_bits_uop_mem_cmd;
    io_lsu_req.bits.uop.mem_size = io_lsu_req_bits_0_bits_uop_mem_size;
    io_lsu_req.bits.uop.mem_signed = io_lsu_req_bits_0_bits_uop_mem_signed;
    io_lsu_req.bits.uop.is_amo = io_lsu_req_bits_0_bits_uop_is_amo;
    io_lsu_req.bits.uop.uses_ldq = io_lsu_req_bits_0_bits_uop_uses_ldq;
    io_lsu_req.bits.uop.uses_stq = io_lsu_req_bits_0_bits_uop_uses_stq;
    io_lsu_req.bits.addr = io_lsu_req_bits_0_bits_addr;
    io_lsu_req.bits.data = io_lsu_req_bits_0_bits_data;
    io_lsu_req.bits.is_hella = io_lsu_req_bits_0_bits_is_hella;

    io_lsu_resp_0_valid =  io_lsu_resp.valid;
    io_lsu_resp_0_bits_uop_ldq_idx = io_lsu_resp.bits.uop.ldq_idx;
    io_lsu_resp_0_bits_uop_stq_idx = io_lsu_resp.bits.uop.stq_idx;
    io_lsu_resp_0_bits_uop_is_amo = io_lsu_resp.bits.uop.is_amo;
    io_lsu_resp_0_bits_uop_uses_ldq = io_lsu_resp.bits.uop.uses_ldq;
    io_lsu_resp_0_bits_uop_uses_stq = io_lsu_resp.bits.uop.uses_stq;
    io_lsu_resp_0_bits_is_hella = io_lsu_resp.bits.is_hella;

    io_lsu_nack_0_valid = io_lsu_nack.valid;
    io_lsu_nack_0_bits_uop_ldq_idx = io_lsu_nack.bits.uop.ldq_idx;
    io_lsu_nack_0_bits_uop_stq_idx = io_lsu_nack.bits.uop.stq_idx;
    io_lsu_nack_0_bits_uop_uses_ldq = io_lsu_nack.bits.uop.uses_ldq;
    io_lsu_nack_0_bits_uop_uses_stq = io_lsu_nack.bits.uop.uses_stq;
    io_lsu_nack_0_bits_is_hella = io_lsu_nack.bits.is_hella;

    io_lsu_brupdate_b1_mispredict_mask = io_lsu_brupdate.b1.mispredict_mask;
    io_lsu_brupdate_b1_resolve_mask = io_lsu_brupdate.b1.resolve_mask;

    io_lsu_release.ready = io_lsu_release_ready;
    io_lsu_release_valid = io_lsu_release.valid;
    io_lsu_release_bits_address = io_lsu_release.bits.address;



  end

  DcacheModule dcache (
      .clock             (clock),
      .reset             (reset),
      .io_lsu_s1_kill    (io_lsu_s1_kill_0),
      .io_lsu_exception  (io_lsu_exception),
      .io_lsu_force_order(io_lsu_force_order),
      .io_lsu_ordered    (io_lsu_ordered),

      .io_brupdate(io_lsu_brupdate),

      .io_lsu_resp(io_lsu_resp),
      .io_lsu_nack(io_lsu_nack),

      .io_auto_a     (io_auto_a),
      .io_auto_b     (io_auto_b),
      .io_auto_c     (io_auto_c),
      .io_auto_d     (io_auto_d),
      .io_auto_e     (io_auto_e),
      .io_lsu_req    (io_lsu_req),
      .io_lsu_release(io_lsu_release)

  );
endmodule

module DcacheModule (
    input  logic clock,
    input  logic reset,
    input  logic io_lsu_s1_kill,
    input  logic io_lsu_force_order,
    output logic io_lsu_ordered,

    ExuST::BrUpdateInfoST io_lsu_brupdate,  //BrUpdateInfoST

    ValidSTIF.out   io_lsu_resp,  //BoomDCacheResp
    ValidSTIF.out   io_lsu_nack,  //BoomDcacheReq

    DecoupledIF.out io_auto_a,  //TLBundleAST
    DecoupledIF.in  io_auto_b,  //TLBundleBST
    DecoupledIF.out io_auto_c,  //TLBundleCST
    DecoupledIF.in  io_auto_d,  //TLBundleDST
    DecoupledIF.out io_auto_e,  //TLBundleEST
    DecoupledIF.in  io_lsu_req,  //BoomDCacheReqValidST
    DecoupledIF.out io_lsu_release  //TLBundleCST
);

  logic io_lsu_req_fire;
  logic io_lsu_release_fire;
  logic io_auto_a_fire;
  logic io_auto_b_fire;
  logic io_auto_c_fire;
  logic io_auto_d_fire;
  logic io_auto_e_fire;

  always_comb begin
    io_lsu_req_fire = io_lsu_req.valid && io_lsu_req.ready;
    io_lsu_release_fire = io_lsu_release.valid && io_lsu_release.ready;
    io_auto_a_fire = io_auto_a.valid && io_auto_a.ready;
    io_auto_b_fire = io_auto_b.valid && io_auto_b.ready;
    io_auto_c_fire = io_auto_c.valid && io_auto_c.ready;
    io_auto_d_fire = io_auto_d.valid && io_auto_d.ready;
    io_auto_e_fire = io_auto_e.valid && io_auto_e.ready;
  end

  typedef enum {
    t_replay,
    t_probe,
    t_wb,
    t_mshr_meta_read,
    t_lsu,
    t_prefetch
  } state;


  DecoupledIF #(.T(NBDcacheST::WriteBackReqST)) wb_io_req();
  DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) wb_io_meta_read();
  DecoupledIF #(.T(NBDcacheST::L1DataReadReqST)) wb_io_data_req();
  DecoupledIF #(.T(BundleST::TLBundleCST)) wb_io_release();
  DecoupledIF #(.T(BundleST::TLBundleCST)) wb_io_lsu_release();
  
  ValidIF #(.bits_size(6)) wb_io_idx();
  
  BoomWriteBackUnit wb(
    .clock(clock),
    .reset(reset),
    .io_resp(),
    .io_data_resp(),
    .io_mem_grant(),

    .io_idx(wb_io_idx),

    .io_req(wb_io_req),
    .io_meta_read(wb_io_meta_read),
    .io_data_req(wb_io_data_req),
    .io_release(wb_io_release),
    .io_lsu_release(wb_io_lsu_release)
  );
  DecoupledIF #(.T(BundleST::TLBundleBST)) prober_io_req();
  DecoupledIF #(.T(BundleST::TLBundleCST)) prober_io_rep();
  DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) prober_io_meta_read();
  DecoupledIF #(.T(HellaCacheST::L1MetaWriteReqST)) prober_io_meta_write();
  DecoupledIF #(.T(NBDcacheST::WriteBackReqST)) prober_io_wb_req();
  DecoupledIF #(.T(BundleST::TLBundleCST)) prober_io_lsu_release();
  
  ValidIF #(.bits_size(`coreMaxAddrBits)) prober_io_state();


  BoomProbeUnit prober(
    .clock(clock),
    .reset(reset),
    .io_way_en(),
    .io_wb_rdy(),
    .io_mshr_rdy(),
    .io_mshr_wb_rdy(),
    .io_block_state(),

    .io_state(prober_io_state),

    .io_rep(prober_io_rep),
    .io_req(prober_io_req),
    .io_meta_read(prober_io_meta_read),
    .io_meta_write(prober_io_meta_write),
    .io_wb_req(prober_io_wb_req),
    .io_lsu_release(prober_io_lsu_release)
  );  


  ValidIF #(.bits_size(`coreMaxAddrBits)) mshr_io_prober_state();
  ValidSTIF #(.T(HellaCacheST::L1MetadataST)) mshr_io_meta_resp();

  DecoupledIF #(.T(MSHRST::BoomDCacheReqInternalST)) mshr_io_req();
  DecoupledIF #(.T(BundleST::TLBundleDST)) mshr_io_mem_grant();
  DecoupledIF #(.T(BundleST::TLBundleAST)) mshr_io_mem_acquire();
  DecoupledIF #(.T(BundleST::TLBundleEST)) mshr_io_mem_finish();
  DecoupledIF #(.T(BoomLSUST::BoomDCacheRespST)) mshr_io_resp();
  DecoupledIF #(.T(NBDcacheST::L1DataWriteReqST)) mshr_io_refill();
  DecoupledIF #(.T(NBDcacheST::WriteBackReqST)) mshr_io_wb_req();
  DecoupledIF #(.T(HellaCacheST::L1MetaWriteReqST)) mshr_io_meta_write();
  DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) mshr_io_meta_read();
  DecoupledIF #(.T(MSHRST::BoomDCacheReqInternalST)) mshr_io_replay();
  DecoupledIF #(.T(BoomLSUST::BoomDCacheReqST)) mshr_io_prefetch();



  mshrs BoomMSHRFile(
    .clock(clock),
    .reset(reset),
    .io_req_is_probe(),
    .io_exception(io_lsu_exception),
    .io_rob_pnr_idx(),
    .io_clear_all(io_lsu_force_order),
    .io_wb_resp(),
    .io_fence_rdy(),
    .io_secondary_miss(),
    .io_block_hit(),
    .io_probe_rdy(),

    .io_brupdate(io_lsu_brupdate),

    .io_prober_state(mshr_io_prober_state),
    .io_meta_resp(mshr_io_meta_resp),

    .io_req(mshr_io_req),
    .io_resp(mshr_io_resp),
    .io_mem_grant(mshr_io_mem_grant),
    .io_mem_acquire(mshr_io_mem_acquire),
    .io_mem_finish(mshr_io_mem_finish),
    .io_refill(mshr_io_refill),
    .io_meta_write(mshr_io_meta_write),
    .io_meta_read(mshr_io_meta_read),
    .io_replay(mshr_io_replay),
    .io_prefetch(mshr_io_prefetch),
    .io_wb_req(mshr_io_wb_req)
  );
  logic mshr_io_replay_fire;
  logic mshr_io_meta_read_fire;
  logic mshr_io_req_fire;
  
  always_comb begin
    mshr_io_replay_fire = mshr_io_replay.valid && mshr_io_replay.ready;
    mshr_io_meta_read_fire = mshr_io_meta_read.valid && mshr_io_meta_read.ready;
    mshr_io_req_fire = mshr_io_req.valid && mshr_io_req.ready;
  end


  // ------------
  // tags
  DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) meta_io_write();
  DecoupledIF #(.T(HellaCacheST::L1MetaWriteReqST)) meta_io_read();

  logic [BundleParam::TLPermissions_width-1:0] meta_io_resp[HasL1CacheParameters::nWays-1:0];

  L1MetadataArray meta(
    .clock(clock),
    .reset(reset),
    .io_resp(meta_io_resp),
    
    .io_read(meta_io_read),
    .io_write(meta_io_write)
  );


  // 0 goes to MSHR refills, 1 goes to prober
  logic [1:0] metaWriteArb_io_in_valid;
  logic [1:0] metaWriteArb_io_in_ready;
  HellaCacheST::L1MetaReadReqST metaWriteArb_io_in[2];

  logic metaWriteArb_io_out_ready;
  logic metaWriteArb_io_out_valid;
  HellaCacheST::L1MetaReadReqST metaWriteArb_io_out;
  
  logic metaWriteArb_io_chosen;
  logic metaWriteArb_io_out_fire;
  Arbiter #(
    .n(2),
    .T(HellaCacheST::L1MetaWriteReqST)
  ) metaWriteArb(
    .io_in_ready(metaWriteArb_io_out_ready),
    .io_in_valid(metaWriteArb_io_in_valid),
    .io_in(metaWriteArb_io_in),

    .io_out_ready(metaWriteArb_io_out_ready),
    .io_out_valid(metaWriteArb_io_out_valid),
    .io_out(metaWriteArb_io_out),

    .io_chosen(metaWriteArb_io_chosen)
  );
  assign metaWriteArb_io_out_fire = metaWriteArb_io_out_valid && metaWriteArb_io_in_valid;


  // 0 goes to MSHR replays, 1 goes to prober, 2 goes to wb, 3 goes to MSHR meta read,
  // 4 goes to pipeline, 5 goes to prefetcher
  logic [5:0] metaReadArb_io_in_valid;
  logic [5:0] metaReadArb_io_in_ready;
  HellaCacheST::L1MetaReadReqST metaReadArb_io_in[6];

  logic metaReadArb_io_out_ready;
  logic metaReadArb_io_out_valid;
  HellaCacheST::L1MetaReadReqST metaReadArb_io_out;
  
  logic metaReadArb_io_chosen;
  logic metaReadArb_io_out_fire;
  Arbiter #(
    .n(6),
    .T(HellaCacheST::L1MetaReadReqST)
  ) metaReadArb(
    .io_in_ready(metaReadArb_io_in_ready),
    .io_in_valid(metaReadArb_io_in_valid),
    .io_in(metaReadArb_io_in),

    .io_out_ready(metaReadArb_io_out_ready),
    .io_out_valid(metaReadArb_io_out_valid),
    .io_out(metaReadArb_io_out),

    .io_chosen(metaReadArb_io_chosen)
  );


  always_comb begin
    metaReadArb_io_in = 0;
    metaReadArb_io_in_valid = 0;

    meta_io_write.valid = metaWriteArb_io_out_fire;
    meta_io_write.bits = metaWriteArb_io_out;
    meta_io_read.valid = metaWriteArb_io_out_valid;
    meta_io_read.bits = metaWriteArb_io_out;

    metaReadArb_io_out_ready = meta_io_read.ready;
    metaWriteArb_io_out_ready = meta_io_write.valid;
  end

  // ------------
  // data
  
  logic data_io_nack;
  logic [HasL1HellaCacheParameters::encRowBits-1:0] data_io_resp[HasL1CacheParameters::nWays];

  DecoupledIF #(NBDcacheST::L1DataReadReqST) data_io_read();
  DecoupledIF #(NBDcacheST::L1DataWriteReqST) data_io_write();

  BoomDuplicatedDataArray data(
    .colck(clock),
    .reset(reset),

    .io_read(data_io_read),
    .io_write(data_io_write),

    .io_resp(data_io_resp),
    .io_nack(data_io_nack)
  );
  // 0 goes to pipeline, 1 goes to MSHR refills
  logic [1:0] dataWriteArb_io_in_valid;
  logic [1:0] dataWriteArb_io_in_ready;
  NBDcacheST::L1DataReadReqST dataWriteArb_io_in[2];

  logic dataWriteArb_io_out_ready;
  logic dataWriteArb_io_out_valid;
  NBDcacheST::L1DataReadReqST dataWriteArb_io_out;
  
  logic dataWriteArb_io_chosen;
  logic dataWriteArb_io_out_fire;
  Arbiter #(
    .n(2),
    .T(NBDcacheST::L1DataReadReqST)
  ) dataWriteArb(
    .io_in_ready(dataWriteArb_io_out_ready),
    .io_in_valid(dataWriteArb_io_in_valid),
    .io_in(dataWriteArb_io_in),

    .io_out_ready(dataWriteArb_io_out_ready),
    .io_out_valid(dataWriteArb_io_out_valid),
    .io_out(dataWriteArb_io_out),

    .io_chosen(dataWriteArb_io_chosen)
  );
  assign dataWriteArb_io_out_fire = dataWriteArb_io_out_valid && dataWriteArb_io_in_valid;

  // 0 goes to MSHR replays, 1 goes to wb, 2 goes to pipeline
  logic [2:0] dataReadArb_io_in_valid;
  logic [2:0] dataReadArb_io_in_ready;
  BoomL1DataReadReqST dataReadArb_io_in[3];

  logic dataReadArb_io_out_ready;
  logic dataReadArb_io_out_valid;
  BoomL1DataReadReqST dataReadArb_io_out;
  
  logic dataReadArb_io_chosen;
  logic dataReadArb_io_out_fire;
  Arbiter #(
    .n(3),
    .T(BoomL1DataReadReqST)
  ) dataReadArb(
    .io_in_ready(dataReadArb_io_out_ready),
    .io_in_valid(dataReadArb_io_in_valid),
    .io_in(dataReadArb_io_in),

    .io_out_ready(dataReadArb_io_out_ready),
    .io_out_valid(dataReadArb_io_out_valid),
    .io_out(dataReadArb_io_out),

    .io_chosen(dataReadArb_io_chosen)
  );
  assign dataReadArb_io_out_fire = dataReadArb_io_out_valid && dataReadArb_io_in_valid;


  always_comb begin
    dataReadArb_io_in = 0;
    dataReadArb_io_in_valid = 0;

    data_io_read.valid = dataReadArb_io_out_valid;
    data_io_read.bits = dataReadArb_io_out;

    dataReadArb_io_out_ready = 1;

    data_io_write.valid = dataWriteArb_io_out_fire;
    data_io_write.bits = dataWriteArb_io_out;
    
    dataWriteArb_io_out_ready = 1;
  end


  // ------------
  // New requests
  
  always_comb begin
    io_lsu_req.ready = metaReadArb_io_in_ready[4] && dataReadArb_io_in_ready[2];
    metaReadArb_io_in_valid[4] = io_lsu_req.valid;
    dataReadArb_io_in_valid[2] = io_lsu_req.valid;

    // Tag read for new requests
    metaReadArb_io_in[4].idx = io_lsu_req.bits.addr >> `blockOffBits;
    metaReadArb_io_in[4].way_en = 0;
    metaReadArb_io_in[4].tag = 0;

    // Data read for new requests
    dataReadArb_io_in[2].valid = io_lsu_req.valid;
    dataReadArb_io_in[2].req.addr = io_lsu_req.bits.addr >> `blockOffBits;
    dataReadArb_io_in[2].req.way_en = 8'hff;
  end


  // ------------
  // // MSHR Replays
  BoomLSUST::BoomDCacheReqST replay_req;

  always_comb begin
    replay_req = 0;
    replay_req.uop = mshr_io_replay.bits.uop;
    replay_req.addr = mshr_io_replay.bits.addr;
    replay_req.data = mshr_io_replay.bits.data;
    replay_req.is_hella = mshr_io_replay.bits.is_hella;
    mshr_io_replay.ready = metaReadArb_io_in_ready[0] && dataReadArb_io_in_ready[0];
    // Tag read for MSHR replays
    // We don't actually need to read the metadata, for replays we already know our way
    metaReadArb_io_in_valid[0] = mshr_io_replay.valid;
    metaReadArb_io_in[0].idx = mshr_io_replay.bits.addr >> `blockOffBits;
    metaReadArb_io_in[0].way_en = 0;
    metaReadArb_io_in[0].tag = 0;
    // Data read for MSHR replays
    dataReadArb_io_in_valid[0] = mshr_io_replay.valid;
    dataReadArb_io_in[0].req.addr = mshr_io_replay.bits.addr >> `blockOffBits;
    dataReadArb_io_in[0].req.way_en = mshr_io_replay.bits.way_en;
    dataReadArb_io_in[0].req.valid = 0;
  end

  // -----------
  // MSHR Meta read
  BoomLSUST::BoomDCacheReqST mshr_read_req;

  always_comb begin
    mshr_read_req = 0;
    mshr_read_req.uop = 0;
    mshr_read_req.addr = {mshr_io_meta_read.bits.tag, mshr_io_meta_read.bits.idx} << `blockOffBits;
    mshr_read_req.data = 0;
    mshr_read_req.is_hella = 0;

    metaReadArb_io_in_valid[3] = mshr_io_meta_read.valid;
    metaReadArb_io_in[3] = mshr_io_meta_read.bits;
    mshr_io_meta_read.ready = metaReadArb_io_in_ready[3];
  end


  // -----------
  // Write-backs
  logic wb_fire;
  BoomLSUST::BoomDCacheReqST wb_req;
  logic wb_io_data_req_fire;
  logic wb_io_meta_read_fire;
  always_comb begin
    wb_io_meta_read_fire = wb_io_meta_read.valid && wb_io_meta_read.ready;
    wb_io_data_req_fire = wb_io_data_req.valid && wb_io_data_req.ready;
    wb_fire = wb_io_meta_read_fire && wb_io_data_req_fire;
    wb_req = 0;
    wb_req.uop = 0;
    wb_req.addr = {wb_io_meta_read.bits.tag, wb_io_data_req.bits.addr};
    wb_req.data = 0;
    wb_req.is_hella = 0;
    // Couple the two decoupled interfaces of the WBUnit's meta_read and data_read
    // Tag read for write-back
    metaReadArb_io_in_valid[2] = wb_io_meta_read.valid;
    metaReadArb_io_in.req = wb_io_meta_read.bits;
    wb_io_meta_read.ready = metaReadArb_io_in_ready[2] && dataReadArb_io_in_ready[2];
    // Data read for write-back
    dataReadArb_io_in_valid[1] = wb_io_data_req.valid;
    dataReadArb_io_in[1].req = wb_io_data_req.bits;
    dataReadArb_io_in[1].valid = 0;
    wb_io_data_req.ready = metaReadArb_io_in_ready[2] && dataReadArb_io_in_ready[1];
  end
  
  // -------
  // Prober
  logic prober_io_meta_read_fire;
  logic prober_fire;

  BoomLSUST::BoomDCacheReqST prober_req;

  always_comb begin
    prober_io_meta_read_fire = prober_io_meta_read.valid && prober_io_meta_read.ready;
    prober_fire = prober_io_meta_read_fire;

    prober_req = 0;
    prober_req.uop = 0;
    prober_req.addr = {prober_io_meta_read.bits.tag, prober_io_meta_read.bits.idx} << `blockOffBits;
    prober_req.data = 0;
    prober_req.is_hella = 0;
    // Tag read for prober
    metaReadArb_io_in_valid[1] = prober_io_meta_read.valid;
    metaReadArb_io_in[1] = prober_io_meta_read.bits;
    prober_io_meta_read.ready = metaReadArb_io_in_ready[1];


  end
  // Prober does not need to read data array

  // -------
  // Prefetcher
  logic mshr_io_prefetch_fire;
  logic prefetch_fire;
  BoomLSUST::BoomDCacheReqST prefetch_req;
  always_comb begin
    mshr_io_prefetch_fire = mshr_io_prefetch.valid && mshr_io_prefetch.ready;
    prefetch_fire = mshr_io_prefetch_fire;

    prefetch_req = mshr_io_prefetch.bits;

    // Tag read for prefetch
    metaReadArb_io_in_valid[5] = mshr_io_prefetch.valid;
    metaReadArb_io_in[5].idx = mshr_io_prefetch.bits.addr >> `blockOffBits;
    metaReadArb_io_in[5].way_en = 0;
    metaReadArb_io_in[5].tag = 0;
    mshr_io_prefetch.ready = metaReadArb_io_in[5].ready;
    // Prefetch does not need to read data array

  end

  logic reg_s0_valid_1;
  logic reg_s0_valid_0;
  BoomLSUST::BoomDCacheReqST reg_io_lsu_req_bits;
  BoomLSUST::BoomDCacheReqST reg_s0_req;

  logic s0_valid;
  BoomLSUST::BoomDCacheReqST s0_req;
  state s0_type;
  state reg_s0_type;

  always_ff @(posedge clock or posedge reset) begin
    if (reset)begin
      reg_s0_valid_0 <= 0;
      reg_s0_valid_1 <= 0;
    end
    else begin
      reg_s0_valid_1 <= io_lsu_req.valid;
      reg_s0_valid_0 <= (mshr_io_replay_fire  || wb_fire || prober_fire || mshr_io_meta_read_fire)? 1: 0;

      reg_io_lsu_req_bits <= io_lsu_req.bits;
      
      reg_s0_req <= s0_req;
      reg_s0_type <= s0_type;
    end
  end



  always_comb begin
  
    s0_valid <= io_lsu_req_fire? reg_s0_valid_1: reg_s0_valid_0;

    s0_req <= io_lsu_req_fire         ?   reg_io_lsu_req_bits :
              wb_fire                 ?   wb_req              :
              prober_fire             ?   prober_req          :
              prefetch_fire           ?   prefetch_req        :
              mshr_io_meta_read_fire  ?   mshr_read_req       : replay_req;

    
    s0_type <=  io_lsu_req_fire             ?   t_lsu:
                  wb_fire                   ?   t_wb:
                  prober_fire               ?   t_probe:
                  prefetch_fire             ?   t_prefetch:
                  mshr_io_meta_read_fire    ?   t_mshr_meta_read: t_replay; 
  end

  // Does this request need to send a response or nack


  logic s0_send_resp_or_nack;
  logic reg_s0_send_resp_or_nack;
  BoomLSUST::BoomDCacheReqST s1_req;

  logic s2_store_failed;
  logic s1_valid;
  logic reg_s1_valid;
  logic [`coreMaxAddrBits] s1_addr;
  logic s1_nack;
  logic s1_send_resp_or_nack;
  state s1_type;

  logic [HasL1CacheParameters::nWays-1:0] s1_mshr_meta_read_way_en;
  logic [HasL1CacheParameters::nWays-1:0] reg_s1_mshr_meta_read_way_en;

  logic [HasL1CacheParameters::nWays-1:0] s1_replay_way_en;
  logic [HasL1CacheParameters::nWays-1:0] reg_s1_replay_way_en;

  logic [HasL1CacheParameters::nWays-1:0] s1_wb_way_en;
  logic [HasL1CacheParameters::nWays-1:0] reg_s1_wb_way_en;

  always_ff @(posedge clock or posedge reset) begin
    if (reset)begin
      reg_s1_valid <= 0;
    end
    else begin
      
      reg_s1_valid <= s0_valid        &&
                      !isKilledByBranchST(io_lsu_brupdate, s0_req.uop)  &&
                      !(io_lsu_exception && io_lsu_req.uop.uses_ldq)    &&
                      !(s2_store_failed && io_lsu_req_fire && s0_req.uop.uses_stq);
      
      reg_s0_send_resp_or_nack <= mshr_io_replay_fire && isRead(mshr_io_replay.bits.uop.mem_cmd)? 1: 0;


      reg_s1_mshr_meta_read_way_en <= mshr_io_meta_read.bits.way_en;
      reg_s1_replay_way_en <= mshr_io_replay.bits.way_en; // For replays, the metadata isn't written yet
      reg_s1_wb_way_en <= wb_io_data_req.bits.way_en;
    end
  end


  always_comb begin
    s0_send_resp_or_nack =  io_lsu_req_fire    ?   s0_valid: reg_s0_send_resp_or_nack;
                            
    s1_valid = reg_s1_valid;
    s1_req = reg_s0_req;
    s1_req.br_mask = getNewBrMaskST(io_lsu_brupdate, s0_req.uop);

    s1_addr = s1_req.addr;
    s1_nack = (s1_addr[HasL1HellaCacheParameters::idxMSB:HasL1HellaCacheParameters::idxLSB] == prober_io_meta_write.bits.idx) && !prober_io_req.ready;
    s1_send_resp_or_nack = reg_s0_send_resp_or_nack;
    s1_type = reg_s0_type;
    s1_mshr_meta_read_way_en = reg_s1_mshr_meta_read_way_en;
    s1_replay_way_en = reg_s1_replay_way_en;
    s1_wb_way_en = reg_s1_replay_way_en;
  end


  // // tag check
  // def wayMap[T <: Data](f: Int => T) = VecInit((0 until nWays).map(f))
  // val s1_tag_eq_way = widthMap(i => wayMap((w: Int) => meta(i).io.resp(w).tag === (s1_addr(i) >> untagBits)).asUInt)
  // val s1_tag_match_way = widthMap(i =>
  //                        Mux(s1_type === t_replay, s1_replay_way_en,
  //                        Mux(s1_type === t_wb,     s1_wb_way_en,
  //                        Mux(s1_type === t_mshr_meta_read, s1_mshr_meta_read_way_en,
  //                          wayMap((w: Int) => s1_tag_eq_way(i)(w) && meta(i).io.resp(w).coh.isValid()).asUInt))))

  // val s1_wb_idx_matches = widthMap(i => (s1_addr(i)(untagBits-1,blockOffBits) === wb.io.idx.bits) && wb.io.idx.valid)

  // val s2_req   = RegNext(s1_req)
  // val s2_type  = RegNext(s1_type)
  // val s2_valid = widthMap(w =>
  //                 RegNext(s1_valid(w) &&
  //                        !io.lsu.s1_kill(w) &&
  //                        !IsKilledByBranch(io.lsu.brupdate, s1_req(w).uop) &&
  //                        !(io.lsu.exception && s1_req(w).uop.uses_ldq) &&
  //                        !(s2_store_failed && (s1_type === t_lsu) && s1_req(w).uop.uses_stq)))
  // for (w <- 0 until memWidth)
  //   s2_req(w).uop.br_mask := GetNewBrMask(io.lsu.brupdate, s1_req(w).uop)

  // val s2_tag_match_way = RegNext(s1_tag_match_way)
  // val s2_tag_match     = s2_tag_match_way.map(_.orR)
  // val s2_hit_state     = widthMap(i => Mux1H(s2_tag_match_way(i), wayMap((w: Int) => RegNext(meta(i).io.resp(w).coh))))
  // val s2_has_permission = widthMap(w => s2_hit_state(w).onAccess(s2_req(w).uop.mem_cmd)._1)
  // val s2_new_hit_state  = widthMap(w => s2_hit_state(w).onAccess(s2_req(w).uop.mem_cmd)._3)

  // val s2_hit = widthMap(w => (s2_tag_match(w) && s2_has_permission(w) && s2_hit_state(w) === s2_new_hit_state(w) && !mshrs.io.block_hit(w)) || s2_type.isOneOf(t_replay, t_wb))
  // val s2_nack = Wire(Vec(memWidth, Bool()))
  // assert(!(s2_type === t_replay && !s2_hit(0)), "Replays should always hit")
  // assert(!(s2_type === t_wb && !s2_hit(0)), "Writeback should always see data hit")

  // val s2_wb_idx_matches = RegNext(s1_wb_idx_matches)


  // // lr/sc
  // val debug_sc_fail_addr = RegInit(0.U)
  // val debug_sc_fail_cnt  = RegInit(0.U(8.W))

  // val lrsc_count = RegInit(0.U(log2Ceil(lrscCycles).W))
  // val lrsc_valid = lrsc_count > lrscBackoff.U
  // val lrsc_addr  = Reg(UInt())
  // val s2_lr = s2_req(0).uop.mem_cmd === M_XLR && (!RegNext(s1_nack(0)) || s2_type === t_replay)
  // val s2_sc = s2_req(0).uop.mem_cmd === M_XSC && (!RegNext(s1_nack(0)) || s2_type === t_replay)
  // val s2_lrsc_addr_match = widthMap(w => lrsc_valid && lrsc_addr === (s2_req(w).addr >> blockOffBits))
  // val s2_sc_fail = s2_sc && !s2_lrsc_addr_match(0)
  // when (lrsc_count > 0.U) { lrsc_count := lrsc_count - 1.U }
  // when (s2_valid(0) && ((s2_type === t_lsu && s2_hit(0) && !s2_nack(0)) ||
  //                    (s2_type === t_replay && s2_req(0).uop.mem_cmd =/= M_FLUSH_ALL))) {
  //   when (s2_lr) {
  //     lrsc_count := (lrscCycles - 1).U
  //     lrsc_addr := s2_req(0).addr >> blockOffBits
  //   }
  //   when (lrsc_count > 0.U) {
  //     lrsc_count := 0.U
  //   }
  // }
  // for (w <- 0 until memWidth) {
  //   when (s2_valid(w)                            &&
  //     s2_type === t_lsu                          &&
  //     !s2_hit(w)                                 &&
  //     !(s2_has_permission(w) && s2_tag_match(w)) &&
  //     s2_lrsc_addr_match(w)                      &&
  //     !s2_nack(w)) {
  //     lrsc_count := 0.U
  //   }
  // }

  // when (s2_valid(0)) {
  //   when (s2_req(0).addr === debug_sc_fail_addr) {
  //     when (s2_sc_fail) {
  //       debug_sc_fail_cnt := debug_sc_fail_cnt + 1.U
  //     } .elsewhen (s2_sc) {
  //       debug_sc_fail_cnt := 0.U
  //     }
  //   } .otherwise {
  //     when (s2_sc_fail) {
  //       debug_sc_fail_addr := s2_req(0).addr
  //       debug_sc_fail_cnt  := 1.U
  //     }
  //   }
  // }
  // assert(debug_sc_fail_cnt < 100.U, "L1DCache failed too many SCs in a row")

  // val s2_data = Wire(Vec(memWidth, Vec(nWays, UInt(encRowBits.W))))
  // for (i <- 0 until memWidth) {
  //   for (w <- 0 until nWays) {
  //     s2_data(i)(w) := data.io.resp(i)(w)
  //   }
  // }

  // val s2_data_muxed = widthMap(w => Mux1H(s2_tag_match_way(w), s2_data(w)))
  // val s2_word_idx   = widthMap(w => if (rowWords == 1) 0.U else s2_req(w).addr(log2Up(rowWords*wordBytes)-1, log2Up(wordBytes)))

  // // replacement policy
  // val replacer = cacheParams.replacement
  // val s1_replaced_way_en = UIntToOH(replacer.way)
  // val s2_replaced_way_en = UIntToOH(RegNext(replacer.way))
  // val s2_repl_meta = widthMap(i => Mux1H(s2_replaced_way_en, wayMap((w: Int) => RegNext(meta(i).io.resp(w))).toSeq))

  // // nack because of incoming probe
  // val s2_nack_hit    = RegNext(VecInit(s1_nack))
  // // Nack when we hit something currently being evicted
  // val s2_nack_victim = widthMap(w => s2_valid(w) &&  s2_hit(w) && mshrs.io.secondary_miss(w))
  // // MSHRs not ready for request
  // val s2_nack_miss   = widthMap(w => s2_valid(w) && !s2_hit(w) && !mshrs.io.req(w).ready)
  // // Bank conflict on data arrays
  // val s2_nack_data   = widthMap(w => data.io.nacks(w))
  // // Can't allocate MSHR for same set currently being written back
  // val s2_nack_wb     = widthMap(w => s2_valid(w) && !s2_hit(w) && s2_wb_idx_matches(w))

  // s2_nack           := widthMap(w => (s2_nack_miss(w) || s2_nack_hit(w) || s2_nack_victim(w) || s2_nack_data(w) || s2_nack_wb(w)) && s2_type =/= t_replay)
  // val s2_send_resp = widthMap(w => (RegNext(s1_send_resp_or_nack(w)) && !s2_nack(w) &&
  //                     (s2_hit(w) || (mshrs.io.req(w).fire() && isWrite(s2_req(w).uop.mem_cmd) && !isRead(s2_req(w).uop.mem_cmd)))))
  // val s2_send_nack = widthMap(w => (RegNext(s1_send_resp_or_nack(w)) && s2_nack(w)))
  // for (w <- 0 until memWidth)
  //   assert(!(s2_send_resp(w) && s2_send_nack(w)))

  // // hits always send a response
  // // If MSHR is not available, LSU has to replay this request later
  // // If MSHR is available and this is only a store(not a amo), we don't need to wait for resp later
  // s2_store_failed := s2_valid(0) && s2_nack(0) && s2_send_nack(0) && s2_req(0).uop.uses_stq


  // // Miss handling
  // for (w <- 0 until memWidth) {
  //   mshrs.io.req(w).valid := s2_valid(w)          &&
  //                           !s2_hit(w)            &&
  //                           !s2_nack_hit(w)       &&
  //                           !s2_nack_victim(w)    &&
  //                           !s2_nack_data(w)      &&
  //                           !s2_nack_wb(w)        &&
  //                            s2_type.isOneOf(t_lsu, t_prefetch)             &&
  //                           !IsKilledByBranch(io.lsu.brupdate, s2_req(w).uop) &&
  //                           !(io.lsu.exception && s2_req(w).uop.uses_ldq)   &&
  //                            (isPrefetch(s2_req(w).uop.mem_cmd) ||
  //                             isRead(s2_req(w).uop.mem_cmd)     ||
  //                             isWrite(s2_req(w).uop.mem_cmd))
  //   assert(!(mshrs.io.req(w).valid && s2_type === t_replay), "Replays should not need to go back into MSHRs")
  //   mshrs.io.req(w).bits             := DontCare
  //   mshrs.io.req(w).bits.uop         := s2_req(w).uop
  //   mshrs.io.req(w).bits.uop.br_mask := GetNewBrMask(io.lsu.brupdate, s2_req(w).uop)
  //   mshrs.io.req(w).bits.addr        := s2_req(w).addr
  //   mshrs.io.req(w).bits.tag_match   := s2_tag_match(w)
  //   mshrs.io.req(w).bits.old_meta    := Mux(s2_tag_match(w), L1Metadata(s2_repl_meta(w).tag, s2_hit_state(w)), s2_repl_meta(w))
  //   mshrs.io.req(w).bits.way_en      := Mux(s2_tag_match(w), s2_tag_match_way(w), s2_replaced_way_en)

  //   mshrs.io.req(w).bits.data        := s2_req(w).data
  //   mshrs.io.req(w).bits.is_hella    := s2_req(w).is_hella
  //   mshrs.io.req_is_probe(w)         := s2_type === t_probe && s2_valid(w)
  // }

  // mshrs.io.meta_resp.valid      := !s2_nack_hit(0) || prober.io.mshr_wb_rdy
  // mshrs.io.meta_resp.bits       := Mux1H(s2_tag_match_way(0), RegNext(meta(0).io.resp))
  // when (mshrs.io.req.map(_.fire()).reduce(_||_)) { replacer.miss }
  // tl_out.a <> mshrs.io.mem_acquire

  // // probes and releases
  // prober.io.req.valid   := tl_out.b.valid && !lrsc_valid
  // tl_out.b.ready        := prober.io.req.ready && !lrsc_valid
  // prober.io.req.bits    := tl_out.b.bits
  // prober.io.way_en      := s2_tag_match_way(0)
  // prober.io.block_state := s2_hit_state(0)
  // metaWriteArb.io.in(1) <> prober.io.meta_write
  // prober.io.mshr_rdy    := mshrs.io.probe_rdy
  // prober.io.wb_rdy      := (prober.io.meta_write.bits.idx =/= wb.io.idx.bits) || !wb.io.idx.valid
  // mshrs.io.prober_state := prober.io.state

  // // refills
  // when (tl_out.d.bits.source === cfg.nMSHRs.U) {
  //   // This should be ReleaseAck
  //   tl_out.d.ready := true.B
  //   mshrs.io.mem_grant.valid := false.B
  //   mshrs.io.mem_grant.bits  := DontCare
  // } .otherwise {
  //   // This should be GrantData
  //   mshrs.io.mem_grant <> tl_out.d
  // }

  // dataWriteArb.io.in(1) <> mshrs.io.refill
  // metaWriteArb.io.in(0) <> mshrs.io.meta_write

  // tl_out.e <> mshrs.io.mem_finish

  // // writebacks
  // val wbArb = Module(new Arbiter(new WritebackReq(edge.bundle), 2))
  // // 0 goes to prober, 1 goes to MSHR evictions
  // wbArb.io.in(0)       <> prober.io.wb_req
  // wbArb.io.in(1)       <> mshrs.io.wb_req
  // wb.io.req            <> wbArb.io.out
  // wb.io.data_resp       := s2_data_muxed(0)
  // mshrs.io.wb_resp      := wb.io.resp
  // wb.io.mem_grant       := tl_out.d.fire() && tl_out.d.bits.source === cfg.nMSHRs.U

  // val lsu_release_arb = Module(new Arbiter(new TLBundleC(edge.bundle), 2))
  // io.lsu.release <> lsu_release_arb.io.out
  // lsu_release_arb.io.in(0) <> wb.io.lsu_release
  // lsu_release_arb.io.in(1) <> prober.io.lsu_release

  // TLArbiter.lowest(edge, tl_out.c, wb.io.release, prober.io.rep)

  // io.lsu.perf.release := edge.done(tl_out.c)
  // io.lsu.perf.acquire := edge.done(tl_out.a)

  // // load data gen
  // val s2_data_word_prebypass = widthMap(w => s2_data_muxed(w) >> Cat(s2_word_idx(w), 0.U(log2Ceil(coreDataBits).W)))
  // val s2_data_word = Wire(Vec(memWidth, UInt()))

  // val loadgen = (0 until memWidth).map { w =>
  //   new LoadGen(s2_req(w).uop.mem_size, s2_req(w).uop.mem_signed, s2_req(w).addr,
  //               s2_data_word(w), s2_sc && (w == 0).B, wordBytes)
  // }
  // // Mux between cache responses and uncache responses
  // val cache_resp   = Wire(Vec(memWidth, Valid(new BoomDCacheResp)))
  // for (w <- 0 until memWidth) {
  //   cache_resp(w).valid         := s2_valid(w) && s2_send_resp(w)
  //   cache_resp(w).bits.uop      := s2_req(w).uop
  //   cache_resp(w).bits.data     := loadgen(w).data | s2_sc_fail
  //   cache_resp(w).bits.is_hella := s2_req(w).is_hella
  // }

  // val uncache_resp = Wire(Valid(new BoomDCacheResp))
  // uncache_resp.bits     := mshrs.io.resp.bits
  // uncache_resp.valid    := mshrs.io.resp.valid
  // mshrs.io.resp.ready := !(cache_resp.map(_.valid).reduce(_&&_)) // We can backpressure the MSHRs, but not cache hits

  // val resp = WireInit(cache_resp)
  // var uncache_responding = false.B
  // for (w <- 0 until memWidth) {
  //   val uncache_respond = !cache_resp(w).valid && !uncache_responding
  //   when (uncache_respond) {
  //     resp(w) := uncache_resp
  //   }
  //   uncache_responding = uncache_responding || uncache_respond
  // }

  // for (w <- 0 until memWidth) {
  //   io.lsu.resp(w).valid := resp(w).valid &&
  //                           !(io.lsu.exception && resp(w).bits.uop.uses_ldq) &&
  //                           !IsKilledByBranch(io.lsu.brupdate, resp(w).bits.uop)
  //   io.lsu.resp(w).bits  := UpdateBrMask(io.lsu.brupdate, resp(w).bits)

  //   io.lsu.nack(w).valid := s2_valid(w) && s2_send_nack(w) &&
  //                           !(io.lsu.exception && s2_req(w).uop.uses_ldq) &&
  //                           !IsKilledByBranch(io.lsu.brupdate, s2_req(w).uop)
  //   io.lsu.nack(w).bits  := UpdateBrMask(io.lsu.brupdate, s2_req(w))
  //   assert(!(io.lsu.nack(w).valid && s2_type =/= t_lsu))
  // }

  // // Store/amo hits
  // val s3_req   = RegNext(s2_req(0))
  // val s3_valid = RegNext(s2_valid(0) && s2_hit(0) && isWrite(s2_req(0).uop.mem_cmd) &&
  //                        !s2_sc_fail && !(s2_send_nack(0) && s2_nack(0)))
  // for (w <- 1 until memWidth) {
  //   assert(!(s2_valid(w) && s2_hit(w) && isWrite(s2_req(w).uop.mem_cmd) &&
  //                        !s2_sc_fail && !(s2_send_nack(w) && s2_nack(w))),
  //     "Store must go through 0th pipe in L1D")
  // }

  // // For bypassing
  // val s4_req   = RegNext(s3_req)
  // val s4_valid = RegNext(s3_valid)
  // val s5_req   = RegNext(s4_req)
  // val s5_valid = RegNext(s4_valid)

  // val s3_bypass = widthMap(w => s3_valid && ((s2_req(w).addr >> wordOffBits) === (s3_req.addr >> wordOffBits)))
  // val s4_bypass = widthMap(w => s4_valid && ((s2_req(w).addr >> wordOffBits) === (s4_req.addr >> wordOffBits)))
  // val s5_bypass = widthMap(w => s5_valid && ((s2_req(w).addr >> wordOffBits) === (s5_req.addr >> wordOffBits)))

  // // Store -> Load bypassing
  // for (w <- 0 until memWidth) {
  //   s2_data_word(w) := Mux(s3_bypass(w), s3_req.data,
  //                      Mux(s4_bypass(w), s4_req.data,
  //                      Mux(s5_bypass(w), s5_req.data,
  //                                        s2_data_word_prebypass(w))))
  // }
  // val amoalu   = Module(new AMOALU(xLen))
  // amoalu.io.mask := new StoreGen(s2_req(0).uop.mem_size, s2_req(0).addr, 0.U, xLen/8).mask
  // amoalu.io.cmd  := s2_req(0).uop.mem_cmd
  // amoalu.io.lhs  := s2_data_word(0)
  // amoalu.io.rhs  := s2_req(0).data


  // s3_req.data := amoalu.io.out
  // val s3_way   = RegNext(s2_tag_match_way(0))

  // dataWriteArb.io.in(0).valid       := s3_valid
  // dataWriteArb.io.in(0).bits.addr   := s3_req.addr
  // dataWriteArb.io.in(0).bits.wmask  := UIntToOH(s3_req.addr.extract(rowOffBits-1,offsetlsb))
  // dataWriteArb.io.in(0).bits.data   := Fill(rowWords, s3_req.data)
  // dataWriteArb.io.in(0).bits.way_en := s3_way


  // io.lsu.ordered := mshrs.io.fence_rdy && !s1_valid.reduce(_||_) && !s2_valid.reduce(_||_)

endmodule
