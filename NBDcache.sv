
localparam TAGLEN = 20;
localparam IDXLEN = 6;
localparam PARAMLEN = 3;
localparam WAYLEN = 8;

interface WriteBackReqIF;
  logic ready, valid;
  logic [19:0] tag;
  logic [5:0] idx;
  logic source;
  logic [2:0] param;
  logic [7:0] way_en;
  logic voluntary;
  

  modport outputready (  //写回单元需要的tag，idx等信息
  input valid, tag, idx, param, way_en, voluntary,
  output ready
  );

  modport inputready (
  input ready,
  output valid, tag, idx, param, way_en
  );
  
endinterface //WriteBackReq

interface L1DataReadReqIF;
  logic ready, valid;
  logic [7:0] way_en;
  logic [11:0] addr;
  logic [127:0] data;

  modport inputready (  //需要读取的地址信息
  input ready,
  output valid, way_en, addr
  );
endinterface //L1DataReadReq





