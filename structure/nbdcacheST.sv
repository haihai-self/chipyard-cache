package NBDcacheST;

  typedef struct packed {
    logic [HasL1CacheParameters::nWays-1 : 0] way_en;
    logic [HasL1CacheParameters::untagBits-1 : 0] addr;
    logic [HasL1CacheParameters::cacheDataBits-1:0] data;
  } L1DataReadReqST;

  typedef struct packed {
    logic [HasL1CacheParameters::tagBits-1:0] tag;
    logic [HasL1CacheParameters::idxBits-1:0] idx;
    logic [BundleParam::sourceBits-1:0] source;
    logic [BundleParam::cwidth-1 : 0] param;
    logic [HasL1CacheParameters::nWays-1 : 0] way_en;
    logic voluntary;
  } WriteBackReqST;

  typedef struct packed {
    logic [HasL1CacheParameters::nWays-1 : 0] way_en;
    logic [HasL1CacheParameters::untagBits-1 : 0] addr;
    logic [HasL1HellaCacheParameters::encRowBits-1:0] data;
    logic [HasL1HellaCacheParameters::rowWords-1: 0] wmask;
  } L1DataWriteReqST;
endpackage
