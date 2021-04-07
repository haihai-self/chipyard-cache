

interface ValidIF #(
    parameter bits_size = 6
);
  logic valid;
  logic [bits_size-1:0] bits;

  modport out(output valid, bits);
  modport in(input valid, bits);
endinterface  //ValidIF

interface ValidSTIF #(
    type T
);
  logic valid;
  T bits;

  modport out(output valid, bits);
  modport in(input valid, bits);
endinterface  //ValidIF
