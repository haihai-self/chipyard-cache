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
  NBDcacheST::L1DataWriteReqST dataReadArb_io_in[3];

  logic dataReadArb_io_out_ready;
  logic dataReadArb_io_out_valid;
  NBDcacheST::L1DataWriteReqST dataReadArb_io_out;
  
  logic dataReadArb_io_chosen;
  logic dataReadArb_io_out_fire;
  Arbiter #(
    .n(3),
    .T(NBDcacheST::L1DataWriteReqST)
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


endmodule
