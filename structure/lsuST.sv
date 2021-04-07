
package BoomLSUST;
  typedef struct packed {
    Micro::MicroOpST uop;
    logic [63:0] data;
    logic is_hella;
  } BoomDCacheRespST;

endpackage
