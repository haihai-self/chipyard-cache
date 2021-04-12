
module Mux1Hlogic #(
    parameter n = 4,
    parameter width = 32
) (
    logic [n-1:0] select,

    logic [width-1:0] in [n],
    logic [width-1:0] out
);

  generate
    for (genvar i = 0; i < n; i++) begin
      assign out = select[i] == 1 ? in[i] : out;
    end
  endgenerate

endmodule



module Mux1HST #(
    parameter n = 4,
    type T
) (
    logic [n-1:0] select,

    T in [n],
    T out
);

  generate
    for (genvar i = 0; i < n; i++) begin
      assign out = select[i] == 1 ? in[i] : out;
    end
  endgenerate

endmodule
