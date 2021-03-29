
package HellaCacheST;

  typedef struct packed {
    logic [HasL1CacheParameters::tagBits-1:0] tag;
    logic [BundleParam::TLPermissions_width-1:0] coh;
  } L1MetadataST;

  typedef struct packed {
    logic [HasL1CacheParameters::idxBits-1:0] idx;
    logic [HasL1CacheParameters::nWays-1:0] way_en;
    logic [HasL1CacheParameters::tagBits-1:0] tag;
  } L1MetaReadReqST;

  typedef struct packed {
    logic [HasL1CacheParameters::idxBits-1:0] idx;
    logic [HasL1CacheParameters::nWays-1:0] way_en;
    logic [HasL1CacheParameters::tagBits-1:0] tag;
    L1MetadataST data;

  } L1MetaWriteReqST;

endpackage
