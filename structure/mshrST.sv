package MSHRST;

  typedef struct packed {
    Micro::MicroOpST uop;
    logic [`coreMaxAddrBits:0] addr;
    logic is_hella;
    logic tag_match;
    HellaCacheST::L1MetadataST old_meta;
    logic [HasL1CacheParameters::nWays-1:0] way_en;
    logic [$clog2(DCacheParams::nSDQ)-1:0] sdq_id;
  } BoomDCacheReqInternalST;

    typedef struct packed {
    logic [1:0] id;
    logic [1:0] offset;
    logic [BundleParam::dataBits-1:0] data;
  } LineBufferWriteReqST;

    typedef struct packed {
    logic [1:0] id;
    logic [1:0] offset;
  } LineBufferReadReqST;
    
endpackage