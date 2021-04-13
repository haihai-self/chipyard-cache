module SyncReadMem #(
    parameter DEEPTH = 2048,
    parameter DATA_WIDTH = 2,
    parameter WMASK_WIDTH = 4,
    parameter ADDR_WIDTH = $clog2 (DEEPTH)
) (
    input  logic                     clk,
    // write channel
    input  logic                     wen,
    input  logic [ ADDR_WIDTH-1 : 0] waddr,
    input  logic [WMASK_WIDTH-1 : 0] cs,
    input  logic [ DATA_WIDTH-1 : 0] wdata[WMASK_WIDTH-1 : 0],
    // read channel
    input  logic                     ren,
    input  logic [ ADDR_WIDTH-1 : 0] raddr,
    output logic [ DATA_WIDTH-1 : 0] rdata[WMASK_WIDTH-1 : 0]
);

  logic [DATA_WIDTH-1 : 0] s0_rdata[WMASK_WIDTH-1 : 0];
  logic [DATA_WIDTH-1 : 0] s1_rdata[WMASK_WIDTH-1 : 0];
  logic [DATA_WIDTH-1 : 0] mem[DEEPTH-1 : 0][WMASK_WIDTH-1 : 0];


  generate
    // write channel
    for (genvar i = 0; i < WMASK_WIDTH; i++) begin
      always_ff @(posedge clk)
        if (wen && cs[i]) mem[waddr][i] <= wdata[i];
        else;
    end

    // read channel
    for (genvar i = 0; i < WMASK_WIDTH; i++) begin
      assign s0_rdata[i] = (raddr == waddr && wen && cs[i]) ? wdata[i] : mem[raddr][i];
    end


    always_ff @(posedge clk)
      if (ren) s1_rdata <= s0_rdata;
      else;

    assign rdata = s1_rdata;
  endgenerate


endmodule



