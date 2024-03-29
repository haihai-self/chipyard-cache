module MaxPeriodFibonacciLFSR_1( // @[chipyard.TestHarness.LargeBoomConfig.fir 171867:2]
  input   clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 171868:4]
  input   reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 171869:4]
  input   io_increment, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_1, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_2, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_3, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_4, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_5, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_6, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_7, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_8, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_9, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_10, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_11, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_12, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_13, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_14, // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
  output  io_out_15 // @[chipyard.TestHarness.LargeBoomConfig.fir 171870:4]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_1; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_2; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_3; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_4; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_5; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_6; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_7; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_8; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_9; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_10; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_11; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_12; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_13; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_14; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  reg  state_15; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  wire  _T = state_15 ^ state_13; // @[LFSR.scala 15:41 chipyard.TestHarness.LargeBoomConfig.fir 171891:6]
  wire  _T_1 = _T ^ state_12; // @[LFSR.scala 15:41 chipyard.TestHarness.LargeBoomConfig.fir 171892:6]
  wire  _T_2 = _T_1 ^ state_10; // @[LFSR.scala 15:41 chipyard.TestHarness.LargeBoomConfig.fir 171893:6]
  wire  _GEN_0 = io_increment ? _T_2 : state_0; // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4 PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171894:6 PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
  assign io_out_0 = state_0; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171929:4]
  assign io_out_1 = state_1; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171930:4]
  assign io_out_2 = state_2; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171931:4]
  assign io_out_3 = state_3; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171932:4]
  assign io_out_4 = state_4; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171933:4]
  assign io_out_5 = state_5; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171934:4]
  assign io_out_6 = state_6; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171935:4]
  assign io_out_7 = state_7; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171936:4]
  assign io_out_8 = state_8; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171937:4]
  assign io_out_9 = state_9; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171938:4]
  assign io_out_10 = state_10; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171939:4]
  assign io_out_11 = state_11; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171940:4]
  assign io_out_12 = state_12; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171941:4]
  assign io_out_13 = state_13; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171942:4]
  assign io_out_14 = state_14; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171943:4]
  assign io_out_15 = state_15; // @[PRNG.scala 69:10 chipyard.TestHarness.LargeBoomConfig.fir 171944:4]
  always @(posedge clock) begin
    state_0 <= reset | _GEN_0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4 PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_1 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_1 <= state_0; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171895:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_2 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_2 <= state_1; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171896:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_3 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_3 <= state_2; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171897:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_4 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_4 <= state_3; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171898:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_5 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_5 <= state_4; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171899:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_6 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_6 <= state_5; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171900:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_7 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_7 <= state_6; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171901:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_8 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_8 <= state_7; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171902:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_9 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_9 <= state_8; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171903:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_10 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_10 <= state_9; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171904:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_11 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_11 <= state_10; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171905:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_12 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_12 <= state_11; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171906:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_13 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_13 <= state_12; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171907:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_14 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_14 <= state_13; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171908:6]
    end
    if (reset) begin // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
      state_15 <= 1'h0; // @[PRNG.scala 47:50 chipyard.TestHarness.LargeBoomConfig.fir 171889:4]
    end else if (io_increment) begin // @[PRNG.scala 61:23 chipyard.TestHarness.LargeBoomConfig.fir 171890:4]
      state_15 <= state_14; // @[PRNG.scala 62:11 chipyard.TestHarness.LargeBoomConfig.fir 171909:6]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  state_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  state_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  state_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  state_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  state_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state_15 = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule


module LFSR16 (
    input         clock,
    input         reset,
    input         increment,
    output [15:0] data_out
);
  //assign val repl_way = if (isDM) 0.U else LFSR(16, refill_fire)(log2Ceil(nWays)-1,0)
  wire  repl_way_prng_io_out_0; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_1; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_2; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_3; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_4; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_5; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_6; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_7; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_8; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_9; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_10; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_11; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_12; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_13; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_14; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
  wire  repl_way_prng_io_out_15;

  MaxPeriodFibonacciLFSR_1
      repl_way_prng (  // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 176693:4]
      .clock       (clock),
      .reset       (reset),
      .io_increment(increment),
      .io_out_0    (repl_way_prng_io_out_0),
      .io_out_1    (repl_way_prng_io_out_1),
      .io_out_2    (repl_way_prng_io_out_2),
      .io_out_3    (repl_way_prng_io_out_3),
      .io_out_4    (repl_way_prng_io_out_4),
      .io_out_5    (repl_way_prng_io_out_5),
      .io_out_6    (repl_way_prng_io_out_6),
      .io_out_7    (repl_way_prng_io_out_7),
      .io_out_8    (repl_way_prng_io_out_8),
      .io_out_9    (repl_way_prng_io_out_9),
      .io_out_10   (repl_way_prng_io_out_10),
      .io_out_11   (repl_way_prng_io_out_11),
      .io_out_12   (repl_way_prng_io_out_12),
      .io_out_13   (repl_way_prng_io_out_13),
      .io_out_14   (repl_way_prng_io_out_14),
      .io_out_15   (repl_way_prng_io_out_15)
  );
  wire [7:0] repl_way_lo = {
    repl_way_prng_io_out_7,
    repl_way_prng_io_out_6,
    repl_way_prng_io_out_5,
    repl_way_prng_io_out_4,
    repl_way_prng_io_out_3,
    repl_way_prng_io_out_2,
    repl_way_prng_io_out_1,
    repl_way_prng_io_out_0
  };  // @[PRNG.scala 86:17 chipyard.TestHarness.LargeBoomConfig.fir 176720:4]
  wire [15:0] _repl_way_T = {
    repl_way_prng_io_out_15,
    repl_way_prng_io_out_14,
    repl_way_prng_io_out_13,
    repl_way_prng_io_out_12,
    repl_way_prng_io_out_11,
    repl_way_prng_io_out_10,
    repl_way_prng_io_out_9,
    repl_way_prng_io_out_8,
    repl_way_lo
  };  // @[PRNG.scala 86:17 chipyard.TestHarness.LargeBoomConfig.fir 176728:4]
  assign data_out = _repl_way_T;
endmodule
