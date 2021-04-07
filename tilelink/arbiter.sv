

module Arbiter #(
    n = 4,
    type T = MSHRST::LineBufferReadReqST
) (
    output logic                 io_in_ready [n],
    input  logic                 io_in_valid [n],
    input  T                     io_in       [n],
    input  logic                 io_out_ready,
    output logic                 io_out_valid,
    output T                     io_out,
    output       [$clog2(n)-1:0] io_chosen
);

  always_comb begin
    logic grant[n];
    io_out = io_in[n-1];
    for (int i = n-2; i >=0; i = i-1) begin
      if (io_in_valid[i]) begin
        io_chosen = i;
        io_out = io_in_valid[i];
        break;
      end
    end

    grant[0] = 1;
    for (int i = 1; i < n; i++) grant[i] = (grant[i - 1] & ~io_in_valid[i - 1]);
    for (int i = 0; i < n; i++) io_in_ready[i] = grant[i] & io_out_ready;

    io_out_valid = ~grant[n - 1] || io_in_valid[n - 1];
  end


endmodule




