package ICacheST;

typedef struct packed {
  logic [`fetchBytes*8-1:0] data;
  logic replay;
  logic ae;
} ICacheRespST;

typedef struct packed {logic [`vaddrBits-1:0] addr;} ICacheReqST;
  
endpackage

