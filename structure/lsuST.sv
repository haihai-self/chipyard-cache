
package BoomLSUST;
  typedef struct packed {
    Micro::MicroOpST uop;
    logic [63:0] data;
    logic is_hella;
  } BoomDCacheRespST;


  typedef struct packed {
    Micro::MicroOpST uop;
    logic [`coreMaxAddrBits-1:0] addr;
    logic [`coreDataBits-1:0] data;
    logic is_hella;
  } BoomDCacheReqST;

  typedef struct packed {
    Micro::MicroOpST uop;
    logic valid;
    logic [`coreMaxAddrBits-1:0] addr;
    logic [`coreDataBits-1:0] data;
    logic is_hella;
  } BoomDCacheReqValidST;
endpackage
