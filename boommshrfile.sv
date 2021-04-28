
module BoomMSHRFile (
    input  logic clock,
    input  logic reset,
    input  logic io_req_is_probe,
    input  logic io_exception,
    input  logic io_rob_pnr_idx,
    input  logic io_clear_all,
    input  logic io_wb_resp,
    output logic io_block_hit,
    output logic io_secondary_miss,
    output logic io_fence_rdy,
    output logic io_probe_rdy,

    input ExuST::BrUpdateInfoST io_brupdate,

    ValidIF.out   io_prober_state,  //coreMaxAddrBits
    ValidSTIF.out io_meta_resp,  // L1Metadata

    Decouple.in io_req,  // BoomDCacheReqInternal
    Decouple.in io_mem_grant,  // TLBundleD
    Decouple.out  io_mem_acquire,  // TLBundleA
    Decouple.out  io_mem_finish,  // TLBundleE
    Decouple.out  io_resp,  // BoomDCacheResp
    Decouple.out  io_refill,  // L1DataWriteReq
    Decouple.out  io_meta_write,  // L1MetaWriteReq
    Decouple.out  io_meta_read,  // L1MetaReadReq
    Decouple.out  io_replay,  // BoomDCacheReqInternal
    Decouple.out  io_prefetch,  // BoomDCacheReq
    Decouple.out  io_wb_req  // WritebackReq
);
  logic io_replay_fire;


  always_comb begin
    io_replay_fire = io_replay.valid && io_replay.ready;
  end

  //reg

  //wire

  MSHRST::BoomDCacheReqInternalST req;
  logic req_ready;
  logic req_valid;
  logic req_fire;
  logic req_is_probe;


  always_comb begin
    req_ready = io_req.ready;
    req_valid = io_req.valid;
    req_fire = req_ready && req_fire;
  end

  logic prefetcher_io_mshr_avail;
  logic prefetcher_io_req_val;
  logic [`coreMaxAddrBits-1:0] prefetcher_io_req_addr;
  logic [BundleParam::TLPermissions_width-1:0] prefetcher_io_req_coh;
  DecoupledIF #(BoomLSUST::BoomDCacheReqST) prefetcher_io_prefetch ();

`ifdef enablePrefetching
  NLPrefetcher prefetcher (
      .clock        (clock),
      .reset        (reset),
      .io_mshr_avail(prefetcher_io_mshr_avail),
      .io_req_val   (prefetcher_io_req_val),
      .io_req_addr  (prefetcher_io_req_addr),
      .io_req_coh   (prefetcher_io_req_coh),
      .io_prefetch  (prefetcher_io_prefetch)
  );
`else
  NullPrefetcher prefetcher (
      .clock        (clock),
      .reset        (reset),
      .io_mshr_avail(prefetcher_io_mshr_avail),
      .io_req_val   (prefetcher_io_req_val),
      .io_req_addr  (prefetcher_io_req_addr),
      .io_req_coh   (prefetcher_io_req_coh),
      .io_prefetch  (prefetcher_io_prefetch)
  );
`endif

  assign io_prefetch.valid = prefetcher_io_prefetch.valid;
  assign io_prefetch.bits = prefetcher_io_prefetch.bits;
  assign prefetcher_io_prefetch.ready = io_prefetch.ready;



  //assign cacheable using supportsAcquireBFast
  wire [39:0] _cacheable_T_15 = io_req.bits.addr ^
      40'h10000000;  // @[Parameters.scala 137:31 chipyard.TestHarness.LargeBoomConfig.fir 168949:4]
  wire [40:0] _cacheable_T_16 = {
    1'b0, $signed(_cacheable_T_15)
  };  // @[Parameters.scala 137:49 chipyard.TestHarness.LargeBoomConfig.fir 168950:4]
  wire [40:0] _cacheable_T_18 = $signed(_cacheable_T_16) & 41'sh96000000
      ;  // @[Parameters.scala 137:52 chipyard.TestHarness.LargeBoomConfig.fir 168952:4]
  wire _cacheable_T_19 = $signed(_cacheable_T_18) ==
      41'sh0;  // @[Parameters.scala 137:67 chipyard.TestHarness.LargeBoomConfig.fir 168953:4]
  wire [39:0] _cacheable_T_20 = io_req.bits.addr ^
      40'h80000000;  // @[Parameters.scala 137:31 chipyard.TestHarness.LargeBoomConfig.fir 168954:4]
  wire [40:0] _cacheable_T_21 = {
    1'b0, $signed(_cacheable_T_20)
  };  // @[Parameters.scala 137:49 chipyard.TestHarness.LargeBoomConfig.fir 168955:4]
  wire [40:0] _cacheable_T_23 = $signed(_cacheable_T_21) & 41'sh90000000
      ;  // @[Parameters.scala 137:52 chipyard.TestHarness.LargeBoomConfig.fir 168957:4]
  wire _cacheable_T_24 = $signed(_cacheable_T_23) ==
      41'sh0;  // @[Parameters.scala 137:67 chipyard.TestHarness.LargeBoomConfig.fir 168958:4]
  wire cacheable = _cacheable_T_19 | _cacheable_T_24
      ;  // @[Parameters.scala 671:42 chipyard.TestHarness.LargeBoomConfig.fir 168959:4]


  logic [DCacheParams::nMSHRs] sdq_val;
  logic [$clog2(DCacheParams::nSDQ)-1:0] sdq_alloc_id;
  logic sdq_rdy;
  logic sdq_enq;
  logic [`coreDataBits-1:0] sdq[DCacheParams::nSDQ-1:0];

  PriorityEncoderLow #(
  .size(DCacheParams::nSDQ)
  ) p1 (
      .data_in (~sdq_val),
      .data_out(sdq_alloc_id)
  );


  assign sdq_rdy = ~(|sdq_val);
  assign sdq_enq = req_fire && cacheable && isWrite(req.uop.mem_cmd);

  always_ff @(posedge clock) begin
    sdq[sdq_alloc_id] <= req.data;
  end

  // --------------------
  // The LineBuffer Data
  // Holds refilling lines, prefetched lines
  logic [HasL1HellaCacheParameters::encRowBits-1]
      lb[HasL1CacheParameters::cacheDataBeats*DCacheParams::nMSHRs-1:0];

  logic [DCacheParams::nMSHRs-1:0] lb_read_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] lb_read_arb_io_in_ready;
  MSHRST::LineBufferReadReqST lb_read_arb_io_in[DCacheParams::nMSHRs];
  logic lb_read_arb_io_out_ready;
  logic lb_read_arb_io_out_valid;
  logic lb_read_arb_io_out_fire;
  MSHRST::LineBufferReadReqST lb_read_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] lb_read_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(MSHRST::LineBufferReadReqST)
  ) lb_read_arb (
      .io_in_valid (lb_read_arb_io_in_valid),
      .io_in_ready (lb_read_arb_io_in_ready),
      .io_in       (lb_read_arb_io_in),
      .io_out_ready(lb_read_arb_io_out_ready),
      .io_out_valid(lb_read_arb_io_out_valid),
      .io_out      (lb_read_arb_io_out),
      .io_chosen   (lb_read_arb_io_chosen)
  );
  assign lb_read_arb_io_out_fire = lb_read_arb_io_out_ready && lb_read_arb_io_out_valid;

  logic [DCacheParams::nMSHRs-1:0] lb_write_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] lb_write_arb_io_in_ready;
  MSHRST::LineBufferReadReqST lb_write_arb_io_in[DCacheParams::nMSHRs];
  logic lb_write_arb_io_out_ready;
  logic lb_write_arb_io_out_valid;
  logic lb_write_arb_io_out_fire;
  MSHRST::LineBufferReadReqST lb_write_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] lb_write_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(MSHRST::LineBufferWriteReqST)
  ) lb_write_arb (
      .io_in_valid (lb_write_arb_io_in_valid),
      .io_in_ready (lb_write_arb_io_in_ready),
      .io_in       (lb_write_arb_io_in),
      .io_out_ready(lb_write_arb_io_out_ready),
      .io_out_valid(lb_write_arb_io_out_valid),
      .io_out      (lb_write_arb_io_out),
      .io_chosen   (lb_write_arb_io_chosen)
  );
  assign lb_write_arb_io_out_fire = lb_write_arb_io_out_ready && lb_write_arb_io_out_valid;

  assign lb_read_arb_io_out_ready = lb_write_arb_io_out_fire ? 0 : 1;
  assign lb_write_arb_io_out_ready = 1;

  always_ff @(posedge clock) begin
    if (lb_write_arb_io_out_fire) lb[lb_write_arb_io_out.lb_addr] = lb_write_arb_io_out.data;
  end

  logic [HasL1HellaCacheParameters::encRowBits-1:0] lb_read_data;
  assign lb_read_data =
      !lb_write_arb_io_out_fire && lb_read_arb_io_out_fire ? lb[lb_read_arb_io_out.lb_addr] : 0;



  logic [DCacheParams::nMSHRs-1:0] idx_matches;
  logic [DCacheParams::nMSHRs-1:0] tag_matches;
  logic [DCacheParams::nMSHRs-1:0] way_matches;

  logic idx_match;
  logic tag_match;
  logic way_match;

  assign idx_match = |idx_matches;

  generate
    for (genvar i = 0; i < DCacheParams::nMSHRs; i++) begin
      assign tag_match = idx_matches[i] == 1 ? tag_matches[i] : 0;
      assign way_match = idx_matches[i] == 1 ? way_matches[i] : 0;
    end
  endgenerate

  logic [HasL1CacheParameters::tagBits] wb_tag_list[DCacheParams::nMSHRs];



  logic [DCacheParams::nMSHRs-1:0] meta_write_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] meta_write_arb_io_in_ready;
  HellaCacheST::L1MetaWriteReqST meta_write_arb_io_in[DCacheParams::nMSHRs];
  logic meta_write_arb_io_out_ready;
  logic meta_write_arb_io_out_valid;
  logic meta_write_arb_io_out_fire;
  HellaCacheST::L1MetaWriteReqST meta_write_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] meta_write_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(HellaCacheST::L1MetaWriteReqST)
  ) meta_write_arb (
      .io_in_valid (meta_write_arb_io_in_valid),
      .io_in_ready (meta_write_arb_io_in_ready),
      .io_in       (meta_write_arb_io_in),
      .io_out_ready(meta_write_arb_io_out_ready),
      .io_out_valid(meta_write_arb_io_out_valid),
      .io_out      (meta_write_arb_io_out),
      .io_chosen   (meta_write_arb_io_chosen)
  );
  assign meta_write_arb_io_out_fire = meta_write_arb_io_out_ready && meta_write_arb_io_out_valid;


  logic [DCacheParams::nMSHRs-1:0] meta_read_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] meta_read_arb_io_in_ready;
  HellaCacheST::L1MetaReadReqST meta_read_arb_io_in[DCacheParams::nMSHRs];
  logic meta_read_arb_io_out_ready;
  logic meta_read_arb_io_out_valid;
  logic meta_read_arb_io_out_fire;
  HellaCacheST::L1MetaReadReqST meta_read_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] meta_read_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(HellaCacheST::L1MetaReadReqST)
  ) meta_read_arb (
      .io_in_valid (meta_read_arb_io_in_valid),
      .io_in_ready (meta_read_arb_io_in_ready),
      .io_in       (meta_read_arb_io_in),
      .io_out_ready(meta_read_arb_io_out_ready),
      .io_out_valid(meta_read_arb_io_out_valid),
      .io_out      (meta_read_arb_io_out),
      .io_chosen   (meta_read_arb_io_chosen)
  );
  assign meta_read_arb_io_out_fire = meta_read_arb_io_out_ready && meta_read_arb_io_out_valid;


  logic [DCacheParams::nMSHRs-1:0] wb_req_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] wb_req_arb_io_in_ready;
  NBDcacheST::WriteBackReqST wb_req_arb_io_in[DCacheParams::nMSHRs];
  logic wb_req_arb_io_out_ready;
  logic wb_req_arb_io_out_valid;
  logic wb_req_arb_io_out_fire;
  NBDcacheST::WriteBackReqST wb_req_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] wb_req_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(NBDcacheST::WriteBackReqST)
  ) wb_req_arb (
      .io_in_valid (wb_req_arb_io_in_valid),
      .io_in_ready (wb_req_arb_io_in_ready),
      .io_in       (wb_req_arb_io_in),
      .io_out_ready(wb_req_arb_io_out_ready),
      .io_out_valid(wb_req_arb_io_out_valid),
      .io_out      (wb_req_arb_io_out),
      .io_chosen   (wb_req_arb_io_chosen)
  );
  assign wb_req_arb_io_out_fire = wb_req_arb_io_out_ready && wb_req_arb_io_out_valid;



  logic [DCacheParams::nMSHRs-1:0] replay_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] replay_arb_io_in_ready;
  MSHRST::BoomDCacheReqInternalST replay_arb_io_in[DCacheParams::nMSHRs];
  logic replay_arb_io_out_ready;
  logic replay_arb_io_out_valid;
  logic replay_arb_io_out_fire;
  MSHRST::BoomDCacheReqInternalST replay_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] replay_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(MSHRST::BoomDCacheReqInternalST)
  ) replay_arb (
      .io_in_valid (replay_arb_io_in_valid),
      .io_in_ready (replay_arb_io_in_ready),
      .io_in       (replay_arb_io_in),

      .io_out_ready(replay_arb_io_out_ready),
      .io_out_valid(replay_arb_io_out_valid),
      .io_out      (replay_arb_io_out),
      
      .io_chosen   (replay_arb_io_chosen)
  );
  assign replay_arb_io_out_fire = replay_arb_io_out_ready && replay_arb_io_out_valid;



  logic [DCacheParams::nMSHRs + DCacheParams::nMMIOs -1:0] resp_arb_io_in_valid;
  logic [DCacheParams::nMSHRs + DCacheParams::nMMIOs -1:0] resp_arb_io_in_ready;
  BoomLSUST::BoomDCacheRespST resp_arb_io_in[DCacheParams::nMSHRs + DCacheParams::nMMIOs];
  logic resp_arb_io_out_ready;
  logic resp_arb_io_out_valid;
  logic resp_arb_io_out_fire;
  BoomLSUST::BoomDCacheRespST resp_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs + DCacheParams::nMMIOs)-1:0] resp_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs + DCacheParams::nMMIOs),
      .T(BoomLSUST::BoomDCacheRespST)
  ) resp_arb (
      .io_in_valid (resp_arb_io_in_valid),
      .io_in_ready (resp_arb_io_in_ready),
      .io_in       (resp_arb_io_in),
      .io_out_ready(resp_arb_io_out_ready),
      .io_out_valid(resp_arb_io_out_valid),
      .io_out      (resp_arb_io_out),
      .io_chosen   (resp_arb_io_chosen)
  );
  assign resp_arb_io_out_fire = resp_arb_io_out_ready && resp_arb_io_out_valid;



  logic [DCacheParams::nMSHRs-1:0] refill_arb_io_in_valid;
  logic [DCacheParams::nMSHRs-1:0] refill_arb_io_in_ready;
  NBDcacheST::L1DataWriteReqST refill_arb_io_in[DCacheParams::nMSHRs];
  logic refill_arb_io_out_ready;
  logic refill_arb_io_out_valid;
  logic refill_arb_io_out_fire;
  NBDcacheST::L1DataWriteReqST refill_arb_io_out;
  logic [$clog2(DCacheParams::nMSHRs)-1:0] refill_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(NBDcacheST::L1DataWriteReqST)
  ) refill_arb (
      .io_in_valid (refill_arb_io_in_valid),
      .io_in_ready (refill_arb_io_in_ready),
      .io_in       (refill_arb_io_in),
      .io_out_ready(refill_arb_io_out_ready),
      .io_out_valid(refill_arb_io_out_valid),
      .io_out      (refill_arb_io_out),
      .io_chosen   (refill_arb_io_chosen)
  );
  assign refill_arb_io_out_fire = refill_arb_io_out_ready && refill_arb_io_out_valid;




  logic [DCacheParams::nMSHRs-1:0] commit_vals;
  logic [`coreMaxAddrBits-1:0] commit_addrs[DCacheParams::nMSHRs];
  logic [BundleParam::TLPermissions_width-1:0] commit_cohs[DCacheParams::nMSHRs];

  logic sec_rdy;
  int mshr_alloc_idx;
  logic pri_rdy;
  logic pri_val;
  assign pri_val = req_valid && sdq_rdy && cacheable && !idx_match;


  generate
    for (genvar i = 0; i < DCacheParams::nMSHRs; i = i + 1) begin
      logic [$clog2(DCacheParams::nMSHRs)-1:0] mshr_io_id;
      logic mshr_io_req_pri_val;
      logic mshr_io_req_pri_rdy;
      logic mshr_io_req_sec_val;
      MSHRST::BoomDCacheReqInternalST mshr_io_req;
      logic mshr_io_req_is_probe;
      logic mshr_io_clear_prefetch;
      logic mshr_io_commit_val;
      logic mshr_io_commit_addr;
      logic mshr_io_commit_coh;
      logic mshr_io_probe_rdy;
      logic mshr_io_req_sec_rdy;


      ValidIF #(.bits_size()) mshr_io_idx ();
      ValidIF #(.bits_size()) mshr_io_tag ();
      ValidIF #(.bits_size()) mshr_io_way ();
      // ValidSTIF #(.T(HellaCacheST::L1MetadataST)) mshr_io_meta_resp();
      DecoupledIF #(.T(BundleST::TLBundleAST)) mshr_io_mem_acquire ();
      DecoupledIF #(.T(BundleST::TLBundleDST)) mshr_io_mem_grant ();
      DecoupledIF #(.T(BundleST::TLBundleEST)) mshr_io_mem_finish ();
      DecoupledIF #(.T(NBDcacheST::L1DataWriteReqST)) mshr_io_refill ();
      DecoupledIF #(.T(HellaCacheST::L1MetaWriteReqST)) mshr_io_meta_write ();
      DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) mshr_io_meta_read ();
      DecoupledIF #(.T(NBDcacheST::WriteBackReqST)) mshr_io_wb_req ();
      DecoupledIF #(.T(MSHRST::LineBufferReadReqST)) mshr_io_lb_read ();
      DecoupledIF #(.T(MSHRST::LineBufferWriteReqST)) mshr_io_lb_write ();
      DecoupledIF #(.T(MSHRST::BoomDCacheReqInternalST)) mshr_io_replay ();
      DecoupledIF #(.T(BoomLSUST::BoomDCacheRespST)) mshr_io_resp ();

      assign mshr_io_meta_write.ready = meta_write_arb_io_in_ready[i];
      assign meta_write_arb_io_in_valid[i] = mshr_io_meta_write.valid;
      assign meta_write_arb_io_in[i] = mshr_io_meta_write.bits;

      assign mshr_io_meta_read.ready = meta_read_arb_io_in_ready[i];
      assign meta_read_arb_io_in_valid[i] = mshr_io_meta_read.valid;
      assign meta_read_arb_io_in[i] = mshr_io_meta_read.bits;

      assign mshr_io_wb_req.ready = wb_req_arb_io_in_ready[i];
      assign wb_req_arb_io_in_valid[i] = mshr_io_wb_req.valid;
      assign wb_req_arb_io_in[i] = mshr_io_wb_req.bits;

      assign mshr_io_replay.ready = replay_arb_io_in_ready;
      assign replay_arb_io_in_valid[i] = mshr_io_replay.valid;
      assign replay_arb_io_in[i] = mshr_io_replay.bits;

      assign mshr_io_refill.ready = refill_arb_io_in_ready[i];
      assign refill_arb_io_in_valid[i] = mshr_io_refill.valid;
      assign refill_arb_io_in[i] = mshr_io_refill.bits;

      assign mshr_io_lb_read.ready = lb_read_arb_io_in_ready[i];
      assign lb_read_arb_io_in_valid[i] = mshr_io_lb_read.valid;
      assign lb_read_arb_io_in[i] = mshr_io_lb_read.bits;

      assign mshr_io_lb_write.ready = lb_write_arb_io_in_ready[i];
      assign lb_write_arb_io_in_valid[i] = mshr_io_lb_write.valid;
      assign lb_write_arb_io_in[i] = mshr_io_lb_write.bits;

      assign mshr_io_mem_grant.valid = 0;
      assign mshr_io_mem_grant.bits = 0;
      if (io_mem_grant.bits.source == i) assign mshr_io_mem_grant = io_mem_grant;

      assign mshr_io_resp.ready = resp_arb_io_in_ready[i];
      assign resp_arb_io_in_valid[i] = mshr_io_resp.valid;
      assign resp_arb_io_in[i] = mshr_io_resp.bits;



      assign mshr_io_id = i;
      assign mshr_io_req_pri_val = (i == mshr_alloc_idx) && pri_val;
      assign pri_rdy = i == mshr_alloc_idx ? mshr_io_req_pri_rdy : 0;
      assign sec_rdy = (sec_rdy || (mshr_io_req_sec_rdy && mshr_io_req_sec_val)) ? 1 : 0;

      assign mshr_io_req_sec_val = req_valid && sdq_rdy && tag_match && idx_matches[i] && cacheable;
      assign mshr_io_req = req;
      assign mshr_io_req_is_probe = req_is_probe;
      assign mshr_io_req.sdq_id = sdq_alloc_id;
      assign mshr_io_clear_prefetch =
          ((io_clear_all && !req_valid) || (req_valid && idx_matches[i] && cacheable && !tag_match
           ) || (req_is_probe && idx_matches[i]));



      BoomMSHR mshr (
          .clock            (clock),
          .reset            (reset),
          .io_id            (mshr_io_id),
          .io_req_pri_val   (mshr_io_req_pri_val),
          .io_req_sec_val   (mshr_io_req_sec_val),
          .io_clear_prefetch(mshr_io_clear_prefetch),
          .io_exception     (io_exception),
          .io_req_is_probe  (mshr_io_req_is_probe),
          .io_lb_resp       (lb_read_data),
          .io_wb_resp       (io_wb_resp),
          .io_req_pri_rdy   (mshr_io_req_pri_rdy),
          .io_req_sec_rdy   (mshr_io_req_sec_rdy),
          .io_probe_rdy     (mshr_io_probe_rdy),
          .io_commit_val    (mshr_io_commit_val),
          .io_commit_addr   (mshr_io_commit_addr),
          .io_commit_coh    (mshr_io_commit_coh),

          .io_brupdate(io_brupdate),
          .io_req     (mshr_io_req),

          .io_idx         (mshr_io_idx),
          .io_way         (mshr_io_way),
          .io_tag         (mshr_io_tag),
          .io_prober_state(io_prober_state),
          .io_meta_resp   (io_meta_resp),
          .io_mem_acquire (),
          .io_mem_grant   (mshr_io_resp),
          .io_mem_finish  (),
          .io_refill      (mshr_io_refill),
          .io_meta_write  (mshr_io_meta_write),
          .io_meta_read   (mshr_io_meta_read),
          .io_wb_req      (mshr_io_wb_req),
          .io_lb_read     (mshr_io_lb_read),
          .io_lb_write    (mshr_io_lb_write),
          .io_replay      (mshr_io_replay),
          .io_resp        (mshr_io_resp)
      );

      assign commit_vals[i] = mshr_io_commit_val;
      assign commit_addrs[i] = mshr_io_commit_addr;
      assign commit_cohs[i] = mshr_io_commit_coh;

      assign idx_matches[i] = mshr_io_idx.valid &&
          mshr_io_idx.bits == io_req.bits.addr[HasL1CacheParameters::untagBits - 1:`blockOffBits];
      assign tag_matches[i] = mshr_io_tag.valid &&
          mshr_io_tag.bits == io_req.bits.addr >> HasL1CacheParameters::untagBits;
      assign way_matches[i] = mshr_io_way.valid && mshr_io_way.bits == io_req.bits.way_en;

      assign wb_tag_list[i] = mshr_io_wb_req.bits.tag;

      assign io_fence_rdy = !mshr_io_req_pri_rdy ? 0 : 1;
      assign io_probe_rdy = !mshr_io_probe_rdy && idx_matches[i] && io_req_is_probe ? 0 : 1;

    end
  endgenerate

  // mshr_alloc_idx    := RegNext(AgePriorityEncoder(mshrs.map(m=>m.io.req_pri_rdy), mshr_head))

  logic [$clog2(DCacheParams::nMSHRs)-1:0] mshr_head;
  always_ff @(posedge clock or posedge reset) begin
    if (reset) mshr_head <= 0;
    else begin
      if (pri_rdy && pri_val) mshr_head <= WrapInc(mshr_head, DCacheParams::nMSHRs);
    end
  end

  always_comb begin
    io_meta_write.bits = meta_write_arb_io_out;
    io_meta_write.valid = meta_write_arb_io_out_valid;
    meta_write_arb_io_out_ready = io_meta_write.ready;

    io_meta_read.bits = meta_read_arb_io_out;
    io_meta_read.valid = meta_read_arb_io_out_valid;
    meta_read_arb_io_out_ready = io_meta_read.ready;

    io_wb_req.bits = wb_req_arb_io_out;
    io_wb_req.valid = wb_req_arb_io_out_valid;
    wb_req_arb_io_out_ready = io_wb_req.ready;

  end


  logic [DCacheParams::nMMIOs-1:0] mmio_alloc_arb_io_in_valid;
  logic [DCacheParams::nMMIOs-1:0] mmio_alloc_arb_io_in_ready;
  logic mmio_alloc_arb_io_in[DCacheParams::nMMIOs];
  logic mmio_alloc_arb_io_out_ready;
  logic mmio_alloc_arb_io_out_valid;
  logic mmio_alloc_arb_io_out_fire;
  logic mmio_alloc_arb_io_out;
  logic [$clog2(DCacheParams::nMMIOs)-1:0] mmio_alloc_arb_io_chosen;
  Arbiter #(
      .n(DCacheParams::nMSHRs),
      .T(logic)
  ) mmio_alloc_arb (
      .io_in_valid (mmio_alloc_arb_io_in_valid),
      .io_in_ready (mmio_alloc_arb_io_in_ready),
      .io_in       (mmio_alloc_arb_io_in),
      .io_out_ready(mmio_alloc_arb_io_out_ready),
      .io_out_valid(mmio_alloc_arb_io_out_valid),
      .io_out      (mmio_alloc_arb_io_out),
      .io_chosen   (mmio_alloc_arb_io_chosen)
  );
  assign mmio_alloc_arb_io_out_fire = mmio_alloc_arb_io_out_ready && mmio_alloc_arb_io_out_valid;
  assign mmio_alloc_arb_io_out_ready = req_valid && !cacheable;

  logic mmio_rdy;

  generate
    for (genvar i = 0; i < DCacheParams::nMMIOs; i++) begin

      int id = DCacheParams::nMMIOs + 1 + i;

      DecoupledIF #(.T(BoomLSUST::BoomDCacheReqST)) mshr_io_req ();
      DecoupledIF #(.T(BoomLSUST::BoomDCacheRespST)) mshr_io_resp ();
      DecoupledIF #(.T(BundleST::TLBundleAST)) mshr_io_mem_access ();
      ValidSTIF #(.T(BundleST::TLBundleDST)) mshr_io_mem_ack ();


      BoomIOMSHR #(
          .id(DCacheParams::nMMIOs + 1 + i)
      ) mshr (
          .clock        (clock),
          .reset        (reset),
          .io_req       (mshr_io_req),
          .io_resp      (mshr_io_resp),
          .io_mem_access(mshr_io_mem_access),
          .io_mem_ack   (mshr_io_mem_ack)
      );

      assign mmio_alloc_arb_io_in_valid[i] = mshr_io_req.ready;
      assign mmio_alloc_arb_io_in[i] = 0;
      assign mshr_io_req.valid = mmio_alloc_arb_io_in_ready[i];
      assign mshr_io_req.bits = mmio_alloc_arb_io_in[i];

      assign mmio_rdy = mmio_rdy || mshr_io_req.ready;

      assign mshr_io_mem_ack.bits = io_mem_grant.bits;
      assign mshr_io_mem_ack.valid = io_mem_grant.valid && io_mem_grant.bits.source == id;
      assign io_mem_grant.ready = (io_mem_grant.bits.source == id) ? 1 : 0;

      assign resp_arb_io_in_ready[DCacheParams::nMSHRs + i] = mshr_io_resp.ready;
      assign mshr_io_resp.valid = resp_arb_io_in_valid[DCacheParams::nMSHRs + i];
      assign mshr_io_resp.bits = resp_arb_io_in[DCacheParams::nMSHRs + i];
      assign io_fence_rdy = (!mshr_io_req.ready) ? 0 : 1;

    end
  endgenerate


  // TLArbiter.lowestFromSeq(edge, io.mem_acquire, mshrs.map(_.io.mem_acquire) ++ mmios.map(_.io.mem_access))  //need to complite
  // TLArbiter.lowestFromSeq(edge, io.mem_finish,  mshrs.map(_.io.mem_finish))




  logic respq_io_empty;
  logic [1:0] respq_io_count;
  DecoupledIF #(.T(BoomLSUST::BoomDCacheRespST)) respq_enq ();
  DecoupledIF #(.T(BoomLSUST::BoomDCacheRespST)) respq_deq ();

  assign respq_enq.valid = resp_arb_io_out_valid;
  assign respq_enq.bits = resp_arb_io_out;
  assign resp_arb_io_out_ready = respq_enq.ready;

  assign io_resp.valid = respq_deq.valid;
  assign io_resp.bits = respq_deq.bits;
  assign respq_deq.ready = io_resp.ready;


  BranchKillableQueue #(
      .T(BoomLSUST::BoomDCacheRespST),
      .entries(4),
      .flow(0)
  ) respq (
      .clock   (clock),
      .reset   (reset),
      .io_flush(io_exception),
      .io_empty(respq_io_empty),
      .io_count(respq_io_count),

      .io_brupdate(io_brupdate),

      .io_enq(respq_enq),
      .io_deq(respq_deq)
  );

  assign io_req.ready = (
      !cacheable ? mmio_rdy : sdq_rdy && (idx_match ? tag_match && sec_rdy : pri_rdy));
  assign io_secondary_miss = idx_match && way_match && !tag_match;
  assign io_block_hit = idx_match && tag_match;

  assign io_refill.valid = refill_arb_io_out_valid;
  assign io_refill.bits = refill_arb_io_out;
  assign refill_arb_io_out_ready = io_refill.ready;

  logic free_sdq;
  assign free_sdq = io_replay_fire && isWrite(io_replay.bits.uop.mem_cmd);

  always_comb begin

    io_replay.valid = replay_arb_io_out_valid;
    io_replay.bits = replay_arb_io_out;
    replay_arb_io_out = io_replay.ready;
    io_replay.bits.data = sdq[replay_arb_io_out.sdq_id];

  end


  always_ff @(posedge clock or posedge reset) begin
    if (reset) sdq_val = 0;
    else begin
      if (io_replay.valid || sdq_enq) sdq_val = sdq_val & 1;  //need to imp
      //   sdq_val := sdq_val & ~(UIntToOH(replay_arb.io.out.bits.sdq_id) & Fill(cfg.nSDQ, free_sdq)) |
      // PriorityEncoderOH(~sdq_val(cfg.nSDQ-1,0)) & Fill(cfg.nSDQ, sdq_enq)

    end
  end

  logic mshr_avail_reg;
  logic req_val_reg;
  logic [`coreMaxAddrBits-1:0] req_addr_reg;
  logic [BundleParam::TLPermissions_width-1:0] req_coh_reg;

  logic [`coreMaxAddrBits-1:0] req_addr_out;
  logic [BundleParam::TLPermissions_width-1:0] commit_cohs_out;

  Mux1Hlogic #(
      .n(DCacheParams::nMSHRs),
      .width(`coreMaxAddrBits)
  ) req_addr (
      .select(commit_vals),
      .in    (commit_addrs),
      .out   (req_addr_out)
  );
  Mux1Hlogic #(
      .n(DCacheParams::nMSHRs),
      .T(BundleParam::TLPermissions_width)
  ) req_coh (
      .select(commit_vals),
      .in    (commit_cohs),
      .out   (commit_cohs_out)
  );

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      mshr_avail_reg <= 0;
      req_val_reg <= 0;
      req_addr_reg <= 0;
      req_coh_reg <= 0;
    end else begin
      mshr_avail_reg <= pri_rdy;
      req_val_reg <= |commit_vals;
      req_addr_reg <= req_addr_out;
      req_coh_reg <= commit_cohs_out;
    end
  end

  always_comb begin
    prefetcher_io_mshr_avail = mshr_avail_reg;
    prefetcher_io_req_val = req_val_reg;
    prefetcher_io_req_addr = req_addr_reg;
    prefetcher_io_req_coh = req_coh_reg;
  end



endmodule  // end BoomMSHRFile


