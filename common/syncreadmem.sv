module SyncReadMem #(
    parameter DEEPTH = 2048,
    parameter DATA_WIDTH = 2,
    parameter WMASK_WIDTH = 4,
    parameter ADDR_WIDTH = $clog2 (DEEPTH)
) (
    input  logic                     clk,
    input  logic                     reset,
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



  // write channel
  always_ff @(posedge clk or posedge reset)
    if (reset) begin
      $readmemb("tagarray.log", mem);
    end else begin
      for (int i = 0; i < WMASK_WIDTH; i++) begin
        if (wen && cs[i]) mem[waddr][i] <= wdata[i];
      end
    end

  generate

    // read channel
    for (genvar i = 0; i < WMASK_WIDTH; i++) begin
      assign s0_rdata[i] = (raddr == waddr && wen && cs[i]) ? wdata[i] : mem[raddr][i];
    end


    always_ff @(posedge clk or posedge reset) begin
      if (reset) begin
        for (int i = 0; i < WMASK_WIDTH; i = i + 1) begin
          s1_rdata[i] <= 0;
        end
      end else if (ren || wen) s1_rdata <= s0_rdata;
    end

    assign rdata = s1_rdata;
  endgenerate


endmodule



module SyncReadMemNoVec #(
    parameter DEEPTH = 2048,
    parameter DATA_WIDTH = 2,
    parameter ADDR_WIDTH = $clog2 (DEEPTH)
) (
    input  logic                    clk,
    input  logic                    reset,
    // write channel
    input  logic                    wen,
    input  logic [ADDR_WIDTH-1 : 0] waddr,
    input  logic [DATA_WIDTH-1 : 0] wdata,
    // read channel
    input  logic                    ren,
    input  logic [ADDR_WIDTH-1 : 0] raddr,
    output logic [DATA_WIDTH-1 : 0] rdata
);

  logic [DATA_WIDTH-1 : 0] s0_rdata;
  logic [DATA_WIDTH-1 : 0] s1_rdata;
  logic [DATA_WIDTH-1 : 0] mem[DEEPTH-1 : 0];




  // write channel
  always_ff @(posedge clk) begin
    if (reset) begin
      for (int i = 0; i < DEEPTH; i++) mem[i] <= 0;
    end
    if (wen) mem[waddr] <= wdata;

  end

  // read channel
  assign s0_rdata = (raddr == waddr && wen) ? wdata : mem[raddr];


  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      s1_rdata <= 0;
    end else begin
      if (ren) s1_rdata <= s0_rdata;

    end
  end

  assign rdata = s1_rdata;


endmodule



