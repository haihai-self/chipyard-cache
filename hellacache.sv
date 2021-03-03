
interface L1MetaReadReqIF;
  logic ready, valid;
  logic [5:0] idx;
  logic [7:0] way_en;
  logic [19:0] tag;

  modport WriteBackUnit (
  input ready,
  output valid, idx, tag
  );

  modport ProbeUnit (
  input ready,
  output valid, idx, tag
  );

  modport inputready (
  input ready,
  output valid, idx, way_en, tag
  );
endinterface //L1MetaReadReqIF

typedef struct{
  logic [5:0] idx;
  logic [19:0] tag;
}L1MetaReadReqST;

interface L1MetaWriteReqIF;
  logic ready, valid;
  logic [5:0] idx;
  logic [7:0] way_en;
  logic [1:0] data_coh_state;
  logic [19:0] data_tag;

  modport inputready(
  input ready,
  output idx, way_en, data_coh_state, data_tag
  );

endinterface //L1MetaWriteReqIF


