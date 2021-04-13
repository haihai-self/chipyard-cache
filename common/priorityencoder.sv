
//最低位优先
module PriorityEncoderLow #(
    parameter size = 2
) (
    input  logic [        size-1:0] data_in,
    output logic [$clog2(size)-1:0] data_out
);

  always_comb begin
    for (int i = size - 1; i >= 0; i = i - 1) data_out = data_in[i] == 1 ? i : data_out;
  end

endmodule
