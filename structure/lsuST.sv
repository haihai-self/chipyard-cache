
package BoomLSUST;
  typedef struct packed {
    Micro::MicroOpST uop;
    logic [63:0] data;
    logic is_hella;
  } BoomDCacheRespST;


  typedef struct packed {
    logic [`coreMaxAddrBits-1:0] addr;
    logic [`coreDataBits-1:0] data;
    logic is_hella;
  } BoomDCacheReqST;
endpackage
