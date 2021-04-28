module bb( // @[chipyard.TestHarness.LargeBoomConfig.fir 172125:2]
  input          clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 172126:4]
  input          reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 172127:4]
  input          auto_out_a_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_a_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_a_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_a_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [3:0]   auto_out_a_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_a_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [31:0]  auto_out_a_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [15:0]  auto_out_a_bits_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [127:0] auto_out_a_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_b_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input          auto_out_b_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [1:0]   auto_out_b_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [3:0]   auto_out_b_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [2:0]   auto_out_b_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [31:0]  auto_out_b_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input          auto_out_c_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_c_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_c_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_c_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [3:0]   auto_out_c_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [2:0]   auto_out_c_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [31:0]  auto_out_c_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [127:0] auto_out_c_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_d_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input          auto_out_d_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [2:0]   auto_out_d_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [1:0]   auto_out_d_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [3:0]   auto_out_d_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [2:0]   auto_out_d_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [3:0]   auto_out_d_bits_sink, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input  [127:0] auto_out_d_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  input          auto_out_e_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         auto_out_e_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output [3:0]   auto_out_e_bits_sink, // @[chipyard.TestHarness.LargeBoomConfig.fir 172128:4]
  output         io_lsu_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [15:0]  io_lsu_req_bits_0_bits_uop_br_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [4:0]   io_lsu_req_bits_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [4:0]   io_lsu_req_bits_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [4:0]   io_lsu_req_bits_0_bits_uop_mem_cmd, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [1:0]   io_lsu_req_bits_0_bits_uop_mem_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_mem_signed, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [39:0]  io_lsu_req_bits_0_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [63:0]  io_lsu_req_bits_0_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_req_bits_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_s1_kill_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_resp_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_resp_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [63:0]  io_lsu_resp_0_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_resp_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_nack_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [4:0]   io_lsu_nack_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_nack_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [15:0]  io_lsu_brupdate_b1_resolve_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input  [15:0]  io_lsu_brupdate_b1_mispredict_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_exception, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_release_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_release_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output [31:0]  io_lsu_release_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  input          io_lsu_force_order, // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
  output         io_lsu_ordered // @[chipyard.TestHarness.LargeBoomConfig.fir 172129:4]
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
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [63:0] _RAND_82;
  reg [63:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [63:0] _RAND_88;
  reg [63:0] _RAND_89;
  reg [31:0] _RAND_90;
`endif // RANDOMIZE_REG_INIT
  wire  wb_clock; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_reset; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_req_ready; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_req_valid; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [19:0] wb_io_req_bits_tag; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [5:0] wb_io_req_bits_idx; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [2:0] wb_io_req_bits_param; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [7:0] wb_io_req_bits_way_en; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_req_bits_voluntary; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_meta_read_ready; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_meta_read_valid; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [5:0] wb_io_meta_read_bits_idx; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [19:0] wb_io_meta_read_bits_tag; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_resp; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_idx_valid; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [5:0] wb_io_idx_bits; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_data_req_ready; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_data_req_valid; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [7:0] wb_io_data_req_bits_way_en; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [11:0] wb_io_data_req_bits_addr; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [127:0] wb_io_data_resp; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_mem_grant; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_release_ready; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_release_valid; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [2:0] wb_io_release_bits_opcode; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [2:0] wb_io_release_bits_param; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [31:0] wb_io_release_bits_address; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [127:0] wb_io_release_bits_data; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_lsu_release_ready; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  wb_io_lsu_release_valid; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire [31:0] wb_io_lsu_release_bits_address; // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
  wire  prober_clock; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_reset; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_req_ready; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_req_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [1:0] prober_io_req_bits_param; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [3:0] prober_io_req_bits_size; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [2:0] prober_io_req_bits_source; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [31:0] prober_io_req_bits_address; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_rep_ready; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_rep_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [2:0] prober_io_rep_bits_opcode; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [2:0] prober_io_rep_bits_param; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [3:0] prober_io_rep_bits_size; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [2:0] prober_io_rep_bits_source; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [31:0] prober_io_rep_bits_address; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_meta_read_ready; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_meta_read_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [5:0] prober_io_meta_read_bits_idx; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [19:0] prober_io_meta_read_bits_tag; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_meta_write_ready; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_meta_write_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [5:0] prober_io_meta_write_bits_idx; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [7:0] prober_io_meta_write_bits_way_en; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [1:0] prober_io_meta_write_bits_data_coh_state; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [19:0] prober_io_meta_write_bits_data_tag; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_wb_req_ready; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_wb_req_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [19:0] prober_io_wb_req_bits_tag; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [5:0] prober_io_wb_req_bits_idx; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [2:0] prober_io_wb_req_bits_param; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [7:0] prober_io_wb_req_bits_way_en; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [7:0] prober_io_way_en; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_wb_rdy; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_mshr_rdy; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_mshr_wb_rdy; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [1:0] prober_io_block_state_state; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_lsu_release_ready; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_lsu_release_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [31:0] prober_io_lsu_release_bits_address; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  prober_io_state_valid; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire [39:0] prober_io_state_bits; // @[dcache.scala 431:22 chipyard.TestHarness.LargeBoomConfig.fir 172141:4]
  wire  mshrs_clock; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_reset; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [15:0] mshrs_io_req_0_bits_uop_br_mask; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_req_0_bits_uop_ldq_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_req_0_bits_uop_stq_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_req_0_bits_uop_mem_cmd; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [1:0] mshrs_io_req_0_bits_uop_mem_size; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_bits_uop_mem_signed; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_bits_uop_is_amo; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_bits_uop_uses_ldq; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_bits_uop_uses_stq; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [39:0] mshrs_io_req_0_bits_addr; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [63:0] mshrs_io_req_0_bits_data; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_bits_is_hella; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_0_bits_tag_match; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [1:0] mshrs_io_req_0_bits_old_meta_coh_state; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [19:0] mshrs_io_req_0_bits_old_meta_tag; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [7:0] mshrs_io_req_0_bits_way_en; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_req_is_probe_0; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_resp_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_resp_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [15:0] mshrs_io_resp_bits_uop_br_mask; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_resp_bits_uop_ldq_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_resp_bits_uop_stq_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_resp_bits_uop_is_amo; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_resp_bits_uop_uses_ldq; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_resp_bits_uop_uses_stq; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [63:0] mshrs_io_resp_bits_data; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_resp_bits_is_hella; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_secondary_miss_0; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_block_hit_0; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [15:0] mshrs_io_brupdate_b1_resolve_mask; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [15:0] mshrs_io_brupdate_b1_mispredict_mask; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_exception; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_mem_acquire_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_mem_acquire_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [2:0] mshrs_io_mem_acquire_bits_opcode; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [2:0] mshrs_io_mem_acquire_bits_param; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [3:0] mshrs_io_mem_acquire_bits_size; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [2:0] mshrs_io_mem_acquire_bits_source; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [31:0] mshrs_io_mem_acquire_bits_address; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [15:0] mshrs_io_mem_acquire_bits_mask; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [127:0] mshrs_io_mem_acquire_bits_data; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_mem_grant_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_mem_grant_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [2:0] mshrs_io_mem_grant_bits_opcode; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [1:0] mshrs_io_mem_grant_bits_param; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [3:0] mshrs_io_mem_grant_bits_size; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [2:0] mshrs_io_mem_grant_bits_source; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [3:0] mshrs_io_mem_grant_bits_sink; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [127:0] mshrs_io_mem_grant_bits_data; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_mem_finish_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_mem_finish_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [3:0] mshrs_io_mem_finish_bits_sink; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_refill_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_refill_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [7:0] mshrs_io_refill_bits_way_en; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [11:0] mshrs_io_refill_bits_addr; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [127:0] mshrs_io_refill_bits_data; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_meta_write_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_meta_write_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [5:0] mshrs_io_meta_write_bits_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [7:0] mshrs_io_meta_write_bits_way_en; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [1:0] mshrs_io_meta_write_bits_data_coh_state; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [19:0] mshrs_io_meta_write_bits_data_tag; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_meta_read_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_meta_read_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [5:0] mshrs_io_meta_read_bits_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [7:0] mshrs_io_meta_read_bits_way_en; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [19:0] mshrs_io_meta_read_bits_tag; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_meta_resp_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [1:0] mshrs_io_meta_resp_bits_coh_state; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [15:0] mshrs_io_replay_bits_uop_br_mask; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_replay_bits_uop_ldq_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_replay_bits_uop_stq_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [4:0] mshrs_io_replay_bits_uop_mem_cmd; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [1:0] mshrs_io_replay_bits_uop_mem_size; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_bits_uop_mem_signed; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_bits_uop_is_amo; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_bits_uop_uses_ldq; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_bits_uop_uses_stq; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [39:0] mshrs_io_replay_bits_addr; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [63:0] mshrs_io_replay_bits_data; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_replay_bits_is_hella; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [7:0] mshrs_io_replay_bits_way_en; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_wb_req_ready; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_wb_req_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [19:0] mshrs_io_wb_req_bits_tag; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [5:0] mshrs_io_wb_req_bits_idx; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [2:0] mshrs_io_wb_req_bits_param; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [7:0] mshrs_io_wb_req_bits_way_en; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_prober_state_valid; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire [39:0] mshrs_io_prober_state_bits; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_clear_all; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_wb_resp; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_fence_rdy; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  mshrs_io_probe_rdy; // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
  wire  meta_0_clock; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire  meta_0_reset; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire  meta_0_io_read_ready; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire  meta_0_io_read_valid; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [5:0] meta_0_io_read_bits_idx; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire  meta_0_io_write_ready; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire  meta_0_io_write_valid; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [5:0] meta_0_io_write_bits_idx; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [7:0] meta_0_io_write_bits_way_en; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_write_bits_data_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_write_bits_data_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_0_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_0_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_1_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_1_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_2_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_2_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_3_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_3_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_4_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_4_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_5_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_5_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_6_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_6_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [1:0] meta_0_io_resp_7_coh_state; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire [19:0] meta_0_io_resp_7_tag; // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
  wire  metaWriteArb_io_in_0_ready; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire  metaWriteArb_io_in_0_valid; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [5:0] metaWriteArb_io_in_0_bits_idx; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [7:0] metaWriteArb_io_in_0_bits_way_en; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [1:0] metaWriteArb_io_in_0_bits_data_coh_state; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [19:0] metaWriteArb_io_in_0_bits_data_tag; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire  metaWriteArb_io_in_1_ready; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire  metaWriteArb_io_in_1_valid; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [5:0] metaWriteArb_io_in_1_bits_idx; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [7:0] metaWriteArb_io_in_1_bits_way_en; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [1:0] metaWriteArb_io_in_1_bits_data_coh_state; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [19:0] metaWriteArb_io_in_1_bits_data_tag; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire  metaWriteArb_io_out_ready; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire  metaWriteArb_io_out_valid; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [5:0] metaWriteArb_io_out_bits_idx; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [7:0] metaWriteArb_io_out_bits_way_en; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [1:0] metaWriteArb_io_out_bits_data_coh_state; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire [19:0] metaWriteArb_io_out_bits_data_tag; // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
  wire  metaReadArb_io_in_0_ready; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_0_valid; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire [5:0] metaReadArb_io_in_0_bits_req_0_idx; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_1_ready; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_1_valid; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire [5:0] metaReadArb_io_in_1_bits_req_0_idx; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_2_ready; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_2_valid; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire [5:0] metaReadArb_io_in_2_bits_req_0_idx; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_3_ready; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_3_valid; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire [5:0] metaReadArb_io_in_3_bits_req_0_idx; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_4_ready; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_in_4_valid; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire [5:0] metaReadArb_io_in_4_bits_req_0_idx; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_out_ready; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  metaReadArb_io_out_valid; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire [5:0] metaReadArb_io_out_bits_req_0_idx; // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
  wire  data_clock; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire  data_io_read_0_valid; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [7:0] data_io_read_0_bits_way_en; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [11:0] data_io_read_0_bits_addr; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire  data_io_write_valid; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [7:0] data_io_write_bits_way_en; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [11:0] data_io_write_bits_addr; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [1:0] data_io_write_bits_wmask; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_write_bits_data; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_0; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_1; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_2; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_3; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_4; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_5; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_6; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire [127:0] data_io_resp_0_7; // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
  wire  dataWriteArb_io_in_0_valid; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [7:0] dataWriteArb_io_in_0_bits_way_en; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [11:0] dataWriteArb_io_in_0_bits_addr; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [1:0] dataWriteArb_io_in_0_bits_wmask; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [127:0] dataWriteArb_io_in_0_bits_data; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire  dataWriteArb_io_in_1_ready; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire  dataWriteArb_io_in_1_valid; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [7:0] dataWriteArb_io_in_1_bits_way_en; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [11:0] dataWriteArb_io_in_1_bits_addr; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [127:0] dataWriteArb_io_in_1_bits_data; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire  dataWriteArb_io_out_ready; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire  dataWriteArb_io_out_valid; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [7:0] dataWriteArb_io_out_bits_way_en; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [11:0] dataWriteArb_io_out_bits_addr; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [1:0] dataWriteArb_io_out_bits_wmask; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire [127:0] dataWriteArb_io_out_bits_data; // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
  wire  dataReadArb_io_in_0_valid; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [7:0] dataReadArb_io_in_0_bits_req_0_way_en; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [11:0] dataReadArb_io_in_0_bits_req_0_addr; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_in_1_ready; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_in_1_valid; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [7:0] dataReadArb_io_in_1_bits_req_0_way_en; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [11:0] dataReadArb_io_in_1_bits_req_0_addr; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_in_2_ready; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_in_2_valid; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [11:0] dataReadArb_io_in_2_bits_req_0_addr; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_in_2_bits_valid_0; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_out_valid; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [7:0] dataReadArb_io_out_bits_req_0_way_en; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire [11:0] dataReadArb_io_out_bits_req_0_addr; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  dataReadArb_io_out_bits_valid_0; // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
  wire  lfsr_prng_clock; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_reset; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_4; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_5; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_6; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_7; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_8; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_9; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_10; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_11; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_12; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_13; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_14; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  lfsr_prng_io_out_15; // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
  wire  wbArb_io_in_0_ready; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  wbArb_io_in_0_valid; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [19:0] wbArb_io_in_0_bits_tag; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [5:0] wbArb_io_in_0_bits_idx; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [2:0] wbArb_io_in_0_bits_param; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [7:0] wbArb_io_in_0_bits_way_en; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  wbArb_io_in_1_ready; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  wbArb_io_in_1_valid; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [19:0] wbArb_io_in_1_bits_tag; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [5:0] wbArb_io_in_1_bits_idx; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [2:0] wbArb_io_in_1_bits_param; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [7:0] wbArb_io_in_1_bits_way_en; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  wbArb_io_out_ready; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  wbArb_io_out_valid; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [19:0] wbArb_io_out_bits_tag; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [5:0] wbArb_io_out_bits_idx; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [2:0] wbArb_io_out_bits_param; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire [7:0] wbArb_io_out_bits_way_en; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  wbArb_io_out_bits_voluntary; // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
  wire  lsu_release_arb_io_in_0_ready; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire  lsu_release_arb_io_in_0_valid; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire [31:0] lsu_release_arb_io_in_0_bits_address; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire  lsu_release_arb_io_in_1_ready; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire  lsu_release_arb_io_in_1_valid; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire [31:0] lsu_release_arb_io_in_1_bits_address; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire  lsu_release_arb_io_out_ready; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire  lsu_release_arb_io_out_valid; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire [31:0] lsu_release_arb_io_out_bits_address; // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
  wire [7:0] amoalu_io_mask; // @[dcache.scala 895:24 chipyard.TestHarness.LargeBoomConfig.fir 176488:4]
  wire [4:0] amoalu_io_cmd; // @[dcache.scala 895:24 chipyard.TestHarness.LargeBoomConfig.fir 176488:4]
  wire [63:0] amoalu_io_lhs; // @[dcache.scala 895:24 chipyard.TestHarness.LargeBoomConfig.fir 176488:4]
  wire [63:0] amoalu_io_rhs; // @[dcache.scala 895:24 chipyard.TestHarness.LargeBoomConfig.fir 176488:4]
  wire [63:0] amoalu_io_out; // @[dcache.scala 895:24 chipyard.TestHarness.LargeBoomConfig.fir 176488:4]
  wire [25:0] _mshr_read_req_0_addr_T = {mshrs_io_meta_read_bits_tag,mshrs_io_meta_read_bits_idx}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 172792:4]
  wire [31:0] _mshr_read_req_0_addr_T_1 = {_mshr_read_req_0_addr_T, 6'h0}; // @[dcache.scala 519:94 chipyard.TestHarness.LargeBoomConfig.fir 172793:4]
  wire  _wb_fire_T = wb_io_meta_read_ready & wb_io_meta_read_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 172802:4]
  wire  _wb_fire_T_1 = wb_io_data_req_ready & wb_io_data_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 172803:4]
  wire  wb_fire = _wb_fire_T & _wb_fire_T_1; // @[dcache.scala 530:40 chipyard.TestHarness.LargeBoomConfig.fir 172804:4]
  wire [31:0] _wb_req_0_addr_T = {wb_io_meta_read_bits_tag,wb_io_data_req_bits_addr}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 173080:4]
  wire  _T_2 = _wb_fire_T ^ _wb_fire_T_1; // @[dcache.scala 547:35 chipyard.TestHarness.LargeBoomConfig.fir 173100:4]
  wire  _T_3 = ~_T_2; // @[dcache.scala 547:10 chipyard.TestHarness.LargeBoomConfig.fir 173101:4]
  wire  _T_5 = _T_3 | reset; // @[dcache.scala 547:9 chipyard.TestHarness.LargeBoomConfig.fir 173103:4]
  wire  _T_6 = ~_T_5; // @[dcache.scala 547:9 chipyard.TestHarness.LargeBoomConfig.fir 173104:4]
  wire  prober_fire = prober_io_meta_read_ready & prober_io_meta_read_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 173109:4]
  wire [25:0] _prober_req_0_addr_T = {prober_io_meta_read_bits_tag,prober_io_meta_read_bits_idx}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 173385:4]
  wire [31:0] _prober_req_0_addr_T_1 = {_prober_req_0_addr_T, 6'h0}; // @[dcache.scala 555:93 chipyard.TestHarness.LargeBoomConfig.fir 173386:4]
  wire  _s0_valid_T = io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 173567:4]
  wire  _s0_valid_T_1 = mshrs_io_replay_ready & mshrs_io_replay_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 173570:4]
  wire  _s0_valid_T_2 = _s0_valid_T_1 | wb_fire; // @[dcache.scala 579:45 chipyard.TestHarness.LargeBoomConfig.fir 173571:4]
  wire  _s0_valid_T_3 = _s0_valid_T_2 | prober_fire; // @[dcache.scala 579:56 chipyard.TestHarness.LargeBoomConfig.fir 173572:4]
  wire  _s0_valid_T_5 = mshrs_io_meta_read_ready & mshrs_io_meta_read_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 173574:4]
  wire  _s0_valid_T_6 = _s0_valid_T_3 | _s0_valid_T_5; // @[dcache.scala 579:88 chipyard.TestHarness.LargeBoomConfig.fir 173575:4]
  wire  s0_valid_0 = _s0_valid_T ? io_lsu_req_bits_0_valid : _s0_valid_T_6; // @[dcache.scala 578:21 chipyard.TestHarness.LargeBoomConfig.fir 173581:4]
  wire [15:0] replay_req_0_uop_br_mask = mshrs_io_replay_bits_uop_br_mask; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172476:4]
  wire [15:0] _s0_req_T_2_0_uop_br_mask = _s0_valid_T_5 ? 16'h0 : replay_req_0_uop_br_mask; // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
  wire [4:0] replay_req_0_uop_ldq_idx = mshrs_io_replay_bits_uop_ldq_idx; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172467:4]
  wire [4:0] replay_req_0_uop_stq_idx = mshrs_io_replay_bits_uop_stq_idx; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172466:4]
  wire [4:0] replay_req_0_uop_mem_cmd = mshrs_io_replay_bits_uop_mem_cmd; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172451:4]
  wire [1:0] replay_req_0_uop_mem_size = mshrs_io_replay_bits_uop_mem_size; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172450:4]
  wire  replay_req_0_uop_mem_signed = mshrs_io_replay_bits_uop_mem_signed; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172449:4]
  wire  replay_req_0_uop_is_amo = mshrs_io_replay_bits_uop_is_amo; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172446:4]
  wire  replay_req_0_uop_uses_ldq = mshrs_io_replay_bits_uop_uses_ldq; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172445:4]
  wire  _s0_req_T_2_0_uop_uses_ldq = _s0_valid_T_5 ? 1'h0 : replay_req_0_uop_uses_ldq; // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
  wire  replay_req_0_uop_uses_stq = mshrs_io_replay_bits_uop_uses_stq; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 497:28 chipyard.TestHarness.LargeBoomConfig.fir 172444:4]
  wire  _s0_req_T_2_0_uop_uses_stq = _s0_valid_T_5 ? 1'h0 : replay_req_0_uop_uses_stq; // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
  wire [39:0] mshr_read_req_0_addr = {{8'd0}, _mshr_read_req_0_addr_T_1}; // @[dcache.scala 516:27 chipyard.TestHarness.LargeBoomConfig.fir 172517:4 dcache.scala 519:29 chipyard.TestHarness.LargeBoomConfig.fir 172794:4]
  wire [39:0] replay_req_0_addr = mshrs_io_replay_bits_addr; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 498:28 chipyard.TestHarness.LargeBoomConfig.fir 172501:4]
  wire [63:0] replay_req_0_data = mshrs_io_replay_bits_data; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 499:28 chipyard.TestHarness.LargeBoomConfig.fir 172502:4]
  wire  replay_req_0_is_hella = mshrs_io_replay_bits_is_hella; // @[dcache.scala 495:24 chipyard.TestHarness.LargeBoomConfig.fir 172339:4 dcache.scala 500:28 chipyard.TestHarness.LargeBoomConfig.fir 172503:4]
  wire [15:0] _s0_req_T_4_0_uop_br_mask = prober_fire ? 16'h0 : _s0_req_T_2_0_uop_br_mask; // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
  wire  _s0_req_T_4_0_uop_uses_ldq = prober_fire ? 1'h0 : _s0_req_T_2_0_uop_uses_ldq; // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
  wire  _s0_req_T_4_0_uop_uses_stq = prober_fire ? 1'h0 : _s0_req_T_2_0_uop_uses_stq; // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
  wire [39:0] prober_req_0_addr = {{8'd0}, _prober_req_0_addr_T_1}; // @[dcache.scala 552:26 chipyard.TestHarness.LargeBoomConfig.fir 173110:4 dcache.scala 555:26 chipyard.TestHarness.LargeBoomConfig.fir 173387:4]
  wire [15:0] _s0_req_T_5_0_uop_br_mask = wb_fire ? 16'h0 : _s0_req_T_4_0_uop_br_mask; // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
  wire  _s0_req_T_5_0_uop_uses_ldq = wb_fire ? 1'h0 : _s0_req_T_4_0_uop_uses_ldq; // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
  wire  _s0_req_T_5_0_uop_uses_stq = wb_fire ? 1'h0 : _s0_req_T_4_0_uop_uses_stq; // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
  wire [39:0] wb_req_0_addr = {{8'd0}, _wb_req_0_addr_T}; // @[dcache.scala 531:20 chipyard.TestHarness.LargeBoomConfig.fir 172805:4 dcache.scala 534:22 chipyard.TestHarness.LargeBoomConfig.fir 173081:4]
  wire [15:0] s0_req_0_uop_br_mask = _s0_valid_T ? io_lsu_req_bits_0_bits_uop_br_mask : _s0_req_T_5_0_uop_br_mask; // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
  wire  s0_req_0_uop_uses_ldq = _s0_valid_T ? io_lsu_req_bits_0_bits_uop_uses_ldq : _s0_req_T_5_0_uop_uses_ldq; // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
  wire  s0_req_0_uop_uses_stq = _s0_valid_T ? io_lsu_req_bits_0_bits_uop_uses_stq : _s0_req_T_5_0_uop_uses_stq; // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
  wire  _s0_send_resp_or_nack_T_2 = mshrs_io_replay_bits_uop_mem_cmd == 5'h0; // @[Consts.scala 81:31 chipyard.TestHarness.LargeBoomConfig.fir 173681:4]
  wire  _s0_send_resp_or_nack_T_3 = mshrs_io_replay_bits_uop_mem_cmd == 5'h6; // @[Consts.scala 81:48 chipyard.TestHarness.LargeBoomConfig.fir 173682:4]
  wire  _s0_send_resp_or_nack_T_4 = _s0_send_resp_or_nack_T_2 | _s0_send_resp_or_nack_T_3; // @[Consts.scala 81:41 chipyard.TestHarness.LargeBoomConfig.fir 173683:4]
  wire  _s0_send_resp_or_nack_T_5 = mshrs_io_replay_bits_uop_mem_cmd == 5'h7; // @[Consts.scala 81:65 chipyard.TestHarness.LargeBoomConfig.fir 173684:4]
  wire  _s0_send_resp_or_nack_T_6 = _s0_send_resp_or_nack_T_4 | _s0_send_resp_or_nack_T_5; // @[Consts.scala 81:58 chipyard.TestHarness.LargeBoomConfig.fir 173685:4]
  wire  _s0_send_resp_or_nack_T_7 = mshrs_io_replay_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173686:4]
  wire  _s0_send_resp_or_nack_T_8 = mshrs_io_replay_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173687:4]
  wire  _s0_send_resp_or_nack_T_9 = mshrs_io_replay_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173688:4]
  wire  _s0_send_resp_or_nack_T_10 = mshrs_io_replay_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173689:4]
  wire  _s0_send_resp_or_nack_T_11 = _s0_send_resp_or_nack_T_7 | _s0_send_resp_or_nack_T_8; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173690:4]
  wire  _s0_send_resp_or_nack_T_12 = _s0_send_resp_or_nack_T_11 | _s0_send_resp_or_nack_T_9; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173691:4]
  wire  _s0_send_resp_or_nack_T_13 = _s0_send_resp_or_nack_T_12 | _s0_send_resp_or_nack_T_10; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173692:4]
  wire  _s0_send_resp_or_nack_T_14 = mshrs_io_replay_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173693:4]
  wire  _s0_send_resp_or_nack_T_15 = mshrs_io_replay_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173694:4]
  wire  _s0_send_resp_or_nack_T_16 = mshrs_io_replay_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173695:4]
  wire  _s0_send_resp_or_nack_T_17 = mshrs_io_replay_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173696:4]
  wire  _s0_send_resp_or_nack_T_18 = mshrs_io_replay_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 173697:4]
  wire  _s0_send_resp_or_nack_T_19 = _s0_send_resp_or_nack_T_14 | _s0_send_resp_or_nack_T_15; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173698:4]
  wire  _s0_send_resp_or_nack_T_20 = _s0_send_resp_or_nack_T_19 | _s0_send_resp_or_nack_T_16; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173699:4]
  wire  _s0_send_resp_or_nack_T_21 = _s0_send_resp_or_nack_T_20 | _s0_send_resp_or_nack_T_17; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173700:4]
  wire  _s0_send_resp_or_nack_T_22 = _s0_send_resp_or_nack_T_21 | _s0_send_resp_or_nack_T_18; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 173701:4]
  wire  _s0_send_resp_or_nack_T_23 = _s0_send_resp_or_nack_T_13 | _s0_send_resp_or_nack_T_22; // @[Consts.scala 79:44 chipyard.TestHarness.LargeBoomConfig.fir 173702:4]
  wire  _s0_send_resp_or_nack_T_24 = _s0_send_resp_or_nack_T_6 | _s0_send_resp_or_nack_T_23; // @[Consts.scala 81:75 chipyard.TestHarness.LargeBoomConfig.fir 173703:4]
  wire  _s0_send_resp_or_nack_T_25 = _s0_valid_T_1 & _s0_send_resp_or_nack_T_24; // @[dcache.scala 596:40 chipyard.TestHarness.LargeBoomConfig.fir 173704:4]
  reg [15:0] s1_req_0_uop_br_mask; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg [4:0] s1_req_0_uop_ldq_idx; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg [4:0] s1_req_0_uop_stq_idx; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg [4:0] s1_req_0_uop_mem_cmd; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg [1:0] s1_req_0_uop_mem_size; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg  s1_req_0_uop_mem_signed; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg  s1_req_0_uop_is_amo; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg  s1_req_0_uop_uses_ldq; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg  s1_req_0_uop_uses_stq; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg [39:0] s1_req_0_addr; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg [63:0] s1_req_0_data; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  reg  s1_req_0_is_hella; // @[dcache.scala 599:32 chipyard.TestHarness.LargeBoomConfig.fir 173710:4]
  wire [15:0] _s1_req_0_uop_br_mask_T = ~io_lsu_brupdate_b1_resolve_mask; // @[util.scala 85:27 chipyard.TestHarness.LargeBoomConfig.fir 173793:4]
  wire [15:0] _s1_valid_T = io_lsu_brupdate_b1_mispredict_mask & s0_req_0_uop_br_mask; // @[util.scala 118:51 chipyard.TestHarness.LargeBoomConfig.fir 173797:4]
  wire  _s1_valid_T_1 = _s1_valid_T != 16'h0; // @[util.scala 118:59 chipyard.TestHarness.LargeBoomConfig.fir 173798:4]
  wire  _s1_valid_T_2 = ~_s1_valid_T_1; // @[dcache.scala 605:26 chipyard.TestHarness.LargeBoomConfig.fir 173799:4]
  wire  _s1_valid_T_3 = s0_valid_0 & _s1_valid_T_2; // @[dcache.scala 604:74 chipyard.TestHarness.LargeBoomConfig.fir 173800:4]
  wire  _s1_valid_T_4 = io_lsu_exception & s0_req_0_uop_uses_ldq; // @[dcache.scala 606:45 chipyard.TestHarness.LargeBoomConfig.fir 173801:4]
  wire  _s1_valid_T_5 = ~_s1_valid_T_4; // @[dcache.scala 606:26 chipyard.TestHarness.LargeBoomConfig.fir 173802:4]
  wire  _s1_valid_T_6 = _s1_valid_T_3 & _s1_valid_T_5; // @[dcache.scala 605:76 chipyard.TestHarness.LargeBoomConfig.fir 173803:4]
  reg  s2_valid_REG; // @[dcache.scala 634:26 chipyard.TestHarness.LargeBoomConfig.fir 174030:4]
  reg [7:0] s2_tag_match_way_0; // @[dcache.scala 642:33 chipyard.TestHarness.LargeBoomConfig.fir 174037:4]
  wire  s2_tag_match_0 = |s2_tag_match_way_0; // @[dcache.scala 643:49 chipyard.TestHarness.LargeBoomConfig.fir 174039:4]
  reg [4:0] s2_req_0_uop_mem_cmd; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  wire  _s2_has_permission_c_cat_T = s2_req_0_uop_mem_cmd == 5'h1; // @[Consts.scala 82:32 chipyard.TestHarness.LargeBoomConfig.fir 174094:4]
  wire  _s2_has_permission_c_cat_T_1 = s2_req_0_uop_mem_cmd == 5'h11; // @[Consts.scala 82:49 chipyard.TestHarness.LargeBoomConfig.fir 174095:4]
  wire  _s2_has_permission_c_cat_T_2 = _s2_has_permission_c_cat_T | _s2_has_permission_c_cat_T_1; // @[Consts.scala 82:42 chipyard.TestHarness.LargeBoomConfig.fir 174096:4]
  wire  _s2_has_permission_c_cat_T_3 = s2_req_0_uop_mem_cmd == 5'h7; // @[Consts.scala 82:66 chipyard.TestHarness.LargeBoomConfig.fir 174097:4]
  wire  _s2_has_permission_c_cat_T_4 = _s2_has_permission_c_cat_T_2 | _s2_has_permission_c_cat_T_3; // @[Consts.scala 82:59 chipyard.TestHarness.LargeBoomConfig.fir 174098:4]
  wire  _s2_has_permission_c_cat_T_5 = s2_req_0_uop_mem_cmd == 5'h4; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174099:4]
  wire  _s2_has_permission_c_cat_T_6 = s2_req_0_uop_mem_cmd == 5'h9; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174100:4]
  wire  _s2_has_permission_c_cat_T_9 = _s2_has_permission_c_cat_T_5 | _s2_has_permission_c_cat_T_6; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174103:4]
  wire  _s2_has_permission_c_cat_T_7 = s2_req_0_uop_mem_cmd == 5'ha; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174101:4]
  wire  _s2_has_permission_c_cat_T_10 = _s2_has_permission_c_cat_T_9 | _s2_has_permission_c_cat_T_7; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174104:4]
  wire  _s2_has_permission_c_cat_T_8 = s2_req_0_uop_mem_cmd == 5'hb; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174102:4]
  wire  _s2_has_permission_c_cat_T_11 = _s2_has_permission_c_cat_T_10 | _s2_has_permission_c_cat_T_8; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174105:4]
  wire  _s2_has_permission_c_cat_T_12 = s2_req_0_uop_mem_cmd == 5'h8; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174106:4]
  wire  _s2_has_permission_c_cat_T_13 = s2_req_0_uop_mem_cmd == 5'hc; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174107:4]
  wire  _s2_has_permission_c_cat_T_17 = _s2_has_permission_c_cat_T_12 | _s2_has_permission_c_cat_T_13; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174111:4]
  wire  _s2_has_permission_c_cat_T_14 = s2_req_0_uop_mem_cmd == 5'hd; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174108:4]
  wire  _s2_has_permission_c_cat_T_18 = _s2_has_permission_c_cat_T_17 | _s2_has_permission_c_cat_T_14; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174112:4]
  wire  _s2_has_permission_c_cat_T_15 = s2_req_0_uop_mem_cmd == 5'he; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174109:4]
  wire  _s2_has_permission_c_cat_T_19 = _s2_has_permission_c_cat_T_18 | _s2_has_permission_c_cat_T_15; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174113:4]
  wire  _s2_has_permission_c_cat_T_16 = s2_req_0_uop_mem_cmd == 5'hf; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174110:4]
  wire  _s2_has_permission_c_cat_T_20 = _s2_has_permission_c_cat_T_19 | _s2_has_permission_c_cat_T_16; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174114:4]
  wire  _s2_has_permission_c_cat_T_21 = _s2_has_permission_c_cat_T_11 | _s2_has_permission_c_cat_T_20; // @[Consts.scala 79:44 chipyard.TestHarness.LargeBoomConfig.fir 174115:4]
  wire  s2_has_permission_c_cat_hi = _s2_has_permission_c_cat_T_4 | _s2_has_permission_c_cat_T_21; // @[Consts.scala 82:76 chipyard.TestHarness.LargeBoomConfig.fir 174116:4]
  wire  _s2_has_permission_c_cat_T_45 = s2_req_0_uop_mem_cmd == 5'h3; // @[Consts.scala 83:54 chipyard.TestHarness.LargeBoomConfig.fir 174140:4]
  wire  _s2_has_permission_c_cat_T_46 = s2_has_permission_c_cat_hi | _s2_has_permission_c_cat_T_45; // @[Consts.scala 83:47 chipyard.TestHarness.LargeBoomConfig.fir 174141:4]
  wire  _s2_has_permission_c_cat_T_47 = s2_req_0_uop_mem_cmd == 5'h6; // @[Consts.scala 83:71 chipyard.TestHarness.LargeBoomConfig.fir 174142:4]
  wire  s2_has_permission_c_cat_lo = _s2_has_permission_c_cat_T_46 | _s2_has_permission_c_cat_T_47; // @[Consts.scala 83:64 chipyard.TestHarness.LargeBoomConfig.fir 174143:4]
  reg [1:0] s2_hit_state_REG_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174040:4]
  wire [1:0] _s2_hit_state_T_8 = s2_tag_match_way_0[0] ? s2_hit_state_REG_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174074:4]
  reg [1:0] s2_hit_state_REG_1_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174042:4]
  wire [1:0] _s2_hit_state_T_9 = s2_tag_match_way_0[1] ? s2_hit_state_REG_1_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174075:4]
  wire [1:0] _s2_hit_state_T_16 = _s2_hit_state_T_8 | _s2_hit_state_T_9; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174082:4]
  reg [1:0] s2_hit_state_REG_2_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174044:4]
  wire [1:0] _s2_hit_state_T_10 = s2_tag_match_way_0[2] ? s2_hit_state_REG_2_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174076:4]
  wire [1:0] _s2_hit_state_T_17 = _s2_hit_state_T_16 | _s2_hit_state_T_10; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174083:4]
  reg [1:0] s2_hit_state_REG_3_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174046:4]
  wire [1:0] _s2_hit_state_T_11 = s2_tag_match_way_0[3] ? s2_hit_state_REG_3_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174077:4]
  wire [1:0] _s2_hit_state_T_18 = _s2_hit_state_T_17 | _s2_hit_state_T_11; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174084:4]
  reg [1:0] s2_hit_state_REG_4_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174048:4]
  wire [1:0] _s2_hit_state_T_12 = s2_tag_match_way_0[4] ? s2_hit_state_REG_4_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174078:4]
  wire [1:0] _s2_hit_state_T_19 = _s2_hit_state_T_18 | _s2_hit_state_T_12; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174085:4]
  reg [1:0] s2_hit_state_REG_5_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174050:4]
  wire [1:0] _s2_hit_state_T_13 = s2_tag_match_way_0[5] ? s2_hit_state_REG_5_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174079:4]
  wire [1:0] _s2_hit_state_T_20 = _s2_hit_state_T_19 | _s2_hit_state_T_13; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174086:4]
  reg [1:0] s2_hit_state_REG_6_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174052:4]
  wire [1:0] _s2_hit_state_T_14 = s2_tag_match_way_0[6] ? s2_hit_state_REG_6_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174080:4]
  wire [1:0] _s2_hit_state_T_21 = _s2_hit_state_T_20 | _s2_hit_state_T_14; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174087:4]
  reg [1:0] s2_hit_state_REG_7_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174054:4]
  wire [1:0] _s2_hit_state_T_15 = s2_tag_match_way_0[7] ? s2_hit_state_REG_7_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174081:4]
  wire [1:0] s2_hit_state_0_state = _s2_hit_state_T_21 | _s2_hit_state_T_15; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174088:4]
  wire [3:0] _s2_has_permission_T = {s2_has_permission_c_cat_hi,s2_has_permission_c_cat_lo,s2_hit_state_0_state}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 174145:4]
  wire  _s2_has_permission_T_46 = 4'h3 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174203:4]
  wire  _s2_has_permission_T_43 = 4'h2 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174200:4]
  wire  _s2_has_permission_T_40 = 4'h1 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174197:4]
  wire  _s2_has_permission_T_37 = 4'h7 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174194:4]
  wire  _s2_has_permission_T_34 = 4'h6 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174191:4]
  wire  _s2_has_permission_T_31 = 4'hf == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174188:4]
  wire  _s2_has_permission_T_28 = 4'he == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174185:4]
  wire  _s2_has_permission_T_25 = 4'h0 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174182:4]
  wire  _s2_has_permission_T_22 = 4'h5 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174179:4]
  wire  _s2_has_permission_T_19 = 4'h4 == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174176:4]
  wire  _s2_has_permission_T_16 = 4'hd == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174173:4]
  wire  _s2_has_permission_T_13 = 4'hc == _s2_has_permission_T; // @[Misc.scala 48:20 chipyard.TestHarness.LargeBoomConfig.fir 174170:4]
  wire  _s2_has_permission_T_32 = _s2_has_permission_T_31 | _s2_has_permission_T_28; // @[Misc.scala 34:9 chipyard.TestHarness.LargeBoomConfig.fir 174189:4]
  wire  _s2_has_permission_T_35 = _s2_has_permission_T_34 | _s2_has_permission_T_32; // @[Misc.scala 34:9 chipyard.TestHarness.LargeBoomConfig.fir 174192:4]
  wire  _s2_has_permission_T_38 = _s2_has_permission_T_37 | _s2_has_permission_T_35; // @[Misc.scala 34:9 chipyard.TestHarness.LargeBoomConfig.fir 174195:4]
  wire  _s2_has_permission_T_41 = _s2_has_permission_T_40 | _s2_has_permission_T_38; // @[Misc.scala 34:9 chipyard.TestHarness.LargeBoomConfig.fir 174198:4]
  wire  _s2_has_permission_T_44 = _s2_has_permission_T_43 | _s2_has_permission_T_41; // @[Misc.scala 34:9 chipyard.TestHarness.LargeBoomConfig.fir 174201:4]
  wire  s2_has_permission_0 = _s2_has_permission_T_46 | _s2_has_permission_T_44; // @[Misc.scala 34:9 chipyard.TestHarness.LargeBoomConfig.fir 174204:4]
  wire  _s2_hit_T = s2_tag_match_0 & s2_has_permission_0; // @[dcache.scala 648:47 chipyard.TestHarness.LargeBoomConfig.fir 174328:4]
  wire [1:0] _s2_new_hit_state_T_15 = _s2_has_permission_T_13 ? 2'h1 : 2'h0; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174289:4]
  wire [1:0] _s2_new_hit_state_T_18 = _s2_has_permission_T_16 ? 2'h2 : _s2_new_hit_state_T_15; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174292:4]
  wire [1:0] _s2_new_hit_state_T_21 = _s2_has_permission_T_19 ? 2'h1 : _s2_new_hit_state_T_18; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174295:4]
  wire [1:0] _s2_new_hit_state_T_24 = _s2_has_permission_T_22 ? 2'h2 : _s2_new_hit_state_T_21; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174298:4]
  wire [1:0] _s2_new_hit_state_T_27 = _s2_has_permission_T_25 ? 2'h0 : _s2_new_hit_state_T_24; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174301:4]
  wire [1:0] _s2_new_hit_state_T_30 = _s2_has_permission_T_28 ? 2'h3 : _s2_new_hit_state_T_27; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174304:4]
  wire [1:0] _s2_new_hit_state_T_33 = _s2_has_permission_T_31 ? 2'h3 : _s2_new_hit_state_T_30; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174307:4]
  wire [1:0] _s2_new_hit_state_T_36 = _s2_has_permission_T_34 ? 2'h2 : _s2_new_hit_state_T_33; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174310:4]
  wire [1:0] _s2_new_hit_state_T_39 = _s2_has_permission_T_37 ? 2'h3 : _s2_new_hit_state_T_36; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174313:4]
  wire [1:0] _s2_new_hit_state_T_42 = _s2_has_permission_T_40 ? 2'h1 : _s2_new_hit_state_T_39; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174316:4]
  wire [1:0] _s2_new_hit_state_T_45 = _s2_has_permission_T_43 ? 2'h2 : _s2_new_hit_state_T_42; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174319:4]
  wire [1:0] s2_new_hit_state_meta_state = _s2_has_permission_T_46 ? 2'h3 : _s2_new_hit_state_T_45; // @[Misc.scala 34:36 chipyard.TestHarness.LargeBoomConfig.fir 174322:4]
  wire  _s2_hit_T_1 = s2_hit_state_0_state == s2_new_hit_state_meta_state; // @[Metadata.scala 45:46 chipyard.TestHarness.LargeBoomConfig.fir 174329:4]
  wire  _s2_hit_T_2 = _s2_hit_T & _s2_hit_T_1; // @[dcache.scala 648:71 chipyard.TestHarness.LargeBoomConfig.fir 174330:4]
  wire  _s2_hit_T_3 = ~mshrs_io_block_hit_0; // @[dcache.scala 648:117 chipyard.TestHarness.LargeBoomConfig.fir 174331:4]
  wire  _s2_hit_T_4 = _s2_hit_T_2 & _s2_hit_T_3; // @[dcache.scala 648:114 chipyard.TestHarness.LargeBoomConfig.fir 174332:4]
  reg [2:0] s2_type; // @[dcache.scala 632:25 chipyard.TestHarness.LargeBoomConfig.fir 174014:4]
  wire  _s2_hit_T_5 = s2_type == 3'h0; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174333:4]
  wire  _s2_hit_T_6 = s2_type == 3'h2; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174334:4]
  wire  _s2_hit_T_7 = _s2_hit_T_5 | _s2_hit_T_6; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174335:4]
  wire  s2_hit_0 = _s2_hit_T_4 | _s2_hit_T_7; // @[dcache.scala 648:141 chipyard.TestHarness.LargeBoomConfig.fir 174336:4]
  wire  _s2_nack_miss_T = ~s2_hit_0; // @[dcache.scala 725:53 chipyard.TestHarness.LargeBoomConfig.fir 174639:4]
  wire  _s2_nack_miss_T_1 = s2_valid_REG & _s2_nack_miss_T; // @[dcache.scala 725:50 chipyard.TestHarness.LargeBoomConfig.fir 174640:4]
  wire  _s2_nack_miss_T_2 = ~mshrs_io_req_0_ready; // @[dcache.scala 725:67 chipyard.TestHarness.LargeBoomConfig.fir 174641:4]
  wire  s2_nack_miss_0 = _s2_nack_miss_T_1 & _s2_nack_miss_T_2; // @[dcache.scala 725:64 chipyard.TestHarness.LargeBoomConfig.fir 174642:4]
  reg  s2_nack_hit_0; // @[dcache.scala 721:31 chipyard.TestHarness.LargeBoomConfig.fir 174633:4]
  wire  _T_56 = s2_nack_miss_0 | s2_nack_hit_0; // @[dcache.scala 731:55 chipyard.TestHarness.LargeBoomConfig.fir 174652:4]
  wire  _s2_nack_victim_T = s2_valid_REG & s2_hit_0; // @[dcache.scala 723:50 chipyard.TestHarness.LargeBoomConfig.fir 174635:4]
  wire  s2_nack_victim_0 = _s2_nack_victim_T & mshrs_io_secondary_miss_0; // @[dcache.scala 723:64 chipyard.TestHarness.LargeBoomConfig.fir 174636:4]
  wire  _T_57 = _T_56 | s2_nack_victim_0; // @[dcache.scala 731:73 chipyard.TestHarness.LargeBoomConfig.fir 174653:4]
  reg  s2_wb_idx_matches_0; // @[dcache.scala 653:34 chipyard.TestHarness.LargeBoomConfig.fir 174362:4]
  wire  s2_nack_wb_0 = _s2_nack_miss_T_1 & s2_wb_idx_matches_0; // @[dcache.scala 729:64 chipyard.TestHarness.LargeBoomConfig.fir 174649:4]
  wire  _T_59 = _T_57 | s2_nack_wb_0; // @[dcache.scala 731:113 chipyard.TestHarness.LargeBoomConfig.fir 174655:4]
  wire  _T_60 = s2_type != 3'h0; // @[dcache.scala 731:142 chipyard.TestHarness.LargeBoomConfig.fir 174656:4]
  wire  s2_nack_0 = _T_59 & _T_60; // @[dcache.scala 731:131 chipyard.TestHarness.LargeBoomConfig.fir 174657:4]
  wire  _s2_store_failed_T = s2_valid_REG & s2_nack_0; // @[dcache.scala 741:34 chipyard.TestHarness.LargeBoomConfig.fir 174733:4]
  reg  s2_send_nack_REG; // @[dcache.scala 734:44 chipyard.TestHarness.LargeBoomConfig.fir 174719:4]
  wire  s2_send_nack_0 = s2_send_nack_REG & s2_nack_0; // @[dcache.scala 734:70 chipyard.TestHarness.LargeBoomConfig.fir 174721:4]
  wire  _s2_store_failed_T_1 = _s2_store_failed_T & s2_send_nack_0; // @[dcache.scala 741:48 chipyard.TestHarness.LargeBoomConfig.fir 174734:4]
  reg  s2_req_0_uop_uses_stq; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  wire  s2_store_failed = _s2_store_failed_T_1 & s2_req_0_uop_uses_stq; // @[dcache.scala 741:67 chipyard.TestHarness.LargeBoomConfig.fir 174735:4]
  wire  _s1_valid_T_8 = s2_store_failed & _s0_valid_T; // @[dcache.scala 607:44 chipyard.TestHarness.LargeBoomConfig.fir 173805:4]
  wire  _s1_valid_T_9 = _s1_valid_T_8 & s0_req_0_uop_uses_stq; // @[dcache.scala 607:65 chipyard.TestHarness.LargeBoomConfig.fir 173806:4]
  wire  _s1_valid_T_10 = ~_s1_valid_T_9; // @[dcache.scala 607:26 chipyard.TestHarness.LargeBoomConfig.fir 173807:4]
  wire  _s1_valid_T_11 = _s1_valid_T_6 & _s1_valid_T_10; // @[dcache.scala 606:74 chipyard.TestHarness.LargeBoomConfig.fir 173808:4]
  reg  s1_valid_REG; // @[dcache.scala 604:25 chipyard.TestHarness.LargeBoomConfig.fir 173809:4]
  reg  REG; // @[dcache.scala 610:43 chipyard.TestHarness.LargeBoomConfig.fir 173814:4]
  wire  _T_8 = ~REG; // @[dcache.scala 610:35 chipyard.TestHarness.LargeBoomConfig.fir 173816:4]
  wire  _T_9 = io_lsu_s1_kill_0 & _T_8; // @[dcache.scala 610:32 chipyard.TestHarness.LargeBoomConfig.fir 173817:4]
  reg  REG_1; // @[dcache.scala 610:74 chipyard.TestHarness.LargeBoomConfig.fir 173818:4]
  wire  _T_10 = ~REG_1; // @[dcache.scala 610:66 chipyard.TestHarness.LargeBoomConfig.fir 173820:4]
  wire  _T_11 = _T_9 & _T_10; // @[dcache.scala 610:63 chipyard.TestHarness.LargeBoomConfig.fir 173821:4]
  wire  _T_12 = ~_T_11; // @[dcache.scala 610:12 chipyard.TestHarness.LargeBoomConfig.fir 173822:4]
  wire  _T_14 = _T_12 | reset; // @[dcache.scala 610:11 chipyard.TestHarness.LargeBoomConfig.fir 173824:4]
  wire  _T_15 = ~_T_14; // @[dcache.scala 610:11 chipyard.TestHarness.LargeBoomConfig.fir 173825:4]
  wire  _s1_nack_T_1 = s1_req_0_addr[11:6] == prober_io_meta_write_bits_idx; // @[dcache.scala 612:59 chipyard.TestHarness.LargeBoomConfig.fir 173831:4]
  wire  _s1_nack_T_2 = ~prober_io_req_ready; // @[dcache.scala 612:96 chipyard.TestHarness.LargeBoomConfig.fir 173832:4]
  reg  s1_send_resp_or_nack_0; // @[dcache.scala 613:37 chipyard.TestHarness.LargeBoomConfig.fir 173834:4]
  reg [2:0] s1_type; // @[dcache.scala 614:32 chipyard.TestHarness.LargeBoomConfig.fir 173836:4]
  reg [7:0] s1_mshr_meta_read_way_en; // @[dcache.scala 616:41 chipyard.TestHarness.LargeBoomConfig.fir 173838:4]
  reg [7:0] s1_replay_way_en; // @[dcache.scala 617:41 chipyard.TestHarness.LargeBoomConfig.fir 173840:4]
  reg [7:0] s1_wb_way_en; // @[dcache.scala 618:41 chipyard.TestHarness.LargeBoomConfig.fir 173842:4]
  wire [27:0] _GEN_110 = {{8'd0}, meta_0_io_resp_0_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173845:4]
  wire  _s1_tag_eq_way_T_1 = _GEN_110 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173845:4]
  wire [27:0] _GEN_111 = {{8'd0}, meta_0_io_resp_1_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173847:4]
  wire  _s1_tag_eq_way_T_3 = _GEN_111 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173847:4]
  wire [27:0] _GEN_112 = {{8'd0}, meta_0_io_resp_2_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173849:4]
  wire  _s1_tag_eq_way_T_5 = _GEN_112 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173849:4]
  wire [27:0] _GEN_113 = {{8'd0}, meta_0_io_resp_3_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173851:4]
  wire  _s1_tag_eq_way_T_7 = _GEN_113 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173851:4]
  wire [27:0] _GEN_114 = {{8'd0}, meta_0_io_resp_4_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173853:4]
  wire  _s1_tag_eq_way_T_9 = _GEN_114 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173853:4]
  wire [27:0] _GEN_115 = {{8'd0}, meta_0_io_resp_5_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173855:4]
  wire  _s1_tag_eq_way_T_11 = _GEN_115 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173855:4]
  wire [27:0] _GEN_116 = {{8'd0}, meta_0_io_resp_6_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173857:4]
  wire  _s1_tag_eq_way_T_13 = _GEN_116 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173857:4]
  wire [27:0] _GEN_117 = {{8'd0}, meta_0_io_resp_7_tag}; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173859:4]
  wire  _s1_tag_eq_way_T_15 = _GEN_117 == s1_req_0_addr[39:12]; // @[dcache.scala 622:79 chipyard.TestHarness.LargeBoomConfig.fir 173859:4]
  wire [7:0] s1_tag_eq_way_0 = {_s1_tag_eq_way_T_15,_s1_tag_eq_way_T_13,_s1_tag_eq_way_T_11,_s1_tag_eq_way_T_9,
    _s1_tag_eq_way_T_7,_s1_tag_eq_way_T_5,_s1_tag_eq_way_T_3,_s1_tag_eq_way_T_1}; // @[dcache.scala 622:110 chipyard.TestHarness.LargeBoomConfig.fir 173875:4]
  wire  _s1_tag_match_way_T = s1_type == 3'h0; // @[dcache.scala 624:38 chipyard.TestHarness.LargeBoomConfig.fir 173878:4]
  wire  _s1_tag_match_way_T_1 = s1_type == 3'h2; // @[dcache.scala 625:38 chipyard.TestHarness.LargeBoomConfig.fir 173879:4]
  wire  _s1_tag_match_way_T_2 = s1_type == 3'h3; // @[dcache.scala 626:38 chipyard.TestHarness.LargeBoomConfig.fir 173880:4]
  wire  _s1_tag_match_way_T_4 = meta_0_io_resp_0_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173882:4]
  wire  _s1_tag_match_way_T_5 = s1_tag_eq_way_0[0] & _s1_tag_match_way_T_4; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173883:4]
  wire  _s1_tag_match_way_T_7 = meta_0_io_resp_1_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173885:4]
  wire  _s1_tag_match_way_T_8 = s1_tag_eq_way_0[1] & _s1_tag_match_way_T_7; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173886:4]
  wire  _s1_tag_match_way_T_10 = meta_0_io_resp_2_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173888:4]
  wire  _s1_tag_match_way_T_11 = s1_tag_eq_way_0[2] & _s1_tag_match_way_T_10; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173889:4]
  wire  _s1_tag_match_way_T_13 = meta_0_io_resp_3_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173891:4]
  wire  _s1_tag_match_way_T_14 = s1_tag_eq_way_0[3] & _s1_tag_match_way_T_13; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173892:4]
  wire  _s1_tag_match_way_T_16 = meta_0_io_resp_4_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173894:4]
  wire  _s1_tag_match_way_T_17 = s1_tag_eq_way_0[4] & _s1_tag_match_way_T_16; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173895:4]
  wire  _s1_tag_match_way_T_19 = meta_0_io_resp_5_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173897:4]
  wire  _s1_tag_match_way_T_20 = s1_tag_eq_way_0[5] & _s1_tag_match_way_T_19; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173898:4]
  wire  _s1_tag_match_way_T_22 = meta_0_io_resp_6_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173900:4]
  wire  _s1_tag_match_way_T_23 = s1_tag_eq_way_0[6] & _s1_tag_match_way_T_22; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173901:4]
  wire  _s1_tag_match_way_T_25 = meta_0_io_resp_7_coh_state > 2'h0; // @[Metadata.scala 49:45 chipyard.TestHarness.LargeBoomConfig.fir 173903:4]
  wire  _s1_tag_match_way_T_26 = s1_tag_eq_way_0[7] & _s1_tag_match_way_T_25; // @[dcache.scala 627:67 chipyard.TestHarness.LargeBoomConfig.fir 173904:4]
  wire [7:0] _s1_tag_match_way_T_27 = {_s1_tag_match_way_T_26,_s1_tag_match_way_T_23,_s1_tag_match_way_T_20,
    _s1_tag_match_way_T_17,_s1_tag_match_way_T_14,_s1_tag_match_way_T_11,_s1_tag_match_way_T_8,_s1_tag_match_way_T_5}; // @[dcache.scala 627:104 chipyard.TestHarness.LargeBoomConfig.fir 173920:4]
  wire  _s1_wb_idx_matches_T_1 = s1_req_0_addr[11:6] == wb_io_idx_bits; // @[dcache.scala 629:79 chipyard.TestHarness.LargeBoomConfig.fir 173927:4]
  reg [15:0] s2_req_0_uop_br_mask; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg [4:0] s2_req_0_uop_ldq_idx; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg [4:0] s2_req_0_uop_stq_idx; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg [1:0] s2_req_0_uop_mem_size; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg  s2_req_0_uop_mem_signed; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg  s2_req_0_uop_is_amo; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg  s2_req_0_uop_uses_ldq; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg [39:0] s2_req_0_addr; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg [63:0] s2_req_0_data; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  reg  s2_req_0_is_hella; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173931:4]
  wire  _s2_valid_T = ~io_lsu_s1_kill_0; // @[dcache.scala 635:26 chipyard.TestHarness.LargeBoomConfig.fir 174016:4]
  wire  _s2_valid_T_1 = s1_valid_REG & _s2_valid_T; // @[dcache.scala 634:39 chipyard.TestHarness.LargeBoomConfig.fir 174017:4]
  wire [15:0] _s2_valid_T_2 = io_lsu_brupdate_b1_mispredict_mask & s1_req_0_uop_br_mask; // @[util.scala 118:51 chipyard.TestHarness.LargeBoomConfig.fir 174018:4]
  wire  _s2_valid_T_3 = _s2_valid_T_2 != 16'h0; // @[util.scala 118:59 chipyard.TestHarness.LargeBoomConfig.fir 174019:4]
  wire  _s2_valid_T_4 = ~_s2_valid_T_3; // @[dcache.scala 636:26 chipyard.TestHarness.LargeBoomConfig.fir 174020:4]
  wire  _s2_valid_T_5 = _s2_valid_T_1 & _s2_valid_T_4; // @[dcache.scala 635:45 chipyard.TestHarness.LargeBoomConfig.fir 174021:4]
  wire  _s2_valid_T_6 = io_lsu_exception & s1_req_0_uop_uses_ldq; // @[dcache.scala 637:45 chipyard.TestHarness.LargeBoomConfig.fir 174022:4]
  wire  _s2_valid_T_7 = ~_s2_valid_T_6; // @[dcache.scala 637:26 chipyard.TestHarness.LargeBoomConfig.fir 174023:4]
  wire  _s2_valid_T_8 = _s2_valid_T_5 & _s2_valid_T_7; // @[dcache.scala 636:76 chipyard.TestHarness.LargeBoomConfig.fir 174024:4]
  wire  _s2_valid_T_9 = s1_type == 3'h4; // @[dcache.scala 638:56 chipyard.TestHarness.LargeBoomConfig.fir 174025:4]
  wire  _s2_valid_T_10 = s2_store_failed & _s2_valid_T_9; // @[dcache.scala 638:44 chipyard.TestHarness.LargeBoomConfig.fir 174026:4]
  wire  _s2_valid_T_11 = _s2_valid_T_10 & s1_req_0_uop_uses_stq; // @[dcache.scala 638:67 chipyard.TestHarness.LargeBoomConfig.fir 174027:4]
  wire  _s2_valid_T_12 = ~_s2_valid_T_11; // @[dcache.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 174028:4]
  wire  _T_18 = _s2_hit_T_5 & _s2_nack_miss_T; // @[dcache.scala 650:33 chipyard.TestHarness.LargeBoomConfig.fir 174342:4]
  wire  _T_19 = ~_T_18; // @[dcache.scala 650:10 chipyard.TestHarness.LargeBoomConfig.fir 174343:4]
  wire  _T_21 = _T_19 | reset; // @[dcache.scala 650:9 chipyard.TestHarness.LargeBoomConfig.fir 174345:4]
  wire  _T_22 = ~_T_21; // @[dcache.scala 650:9 chipyard.TestHarness.LargeBoomConfig.fir 174346:4]
  wire  _T_25 = _s2_hit_T_6 & _s2_nack_miss_T; // @[dcache.scala 651:29 chipyard.TestHarness.LargeBoomConfig.fir 174353:4]
  wire  _T_26 = ~_T_25; // @[dcache.scala 651:10 chipyard.TestHarness.LargeBoomConfig.fir 174354:4]
  wire  _T_28 = _T_26 | reset; // @[dcache.scala 651:9 chipyard.TestHarness.LargeBoomConfig.fir 174356:4]
  wire  _T_29 = ~_T_28; // @[dcache.scala 651:9 chipyard.TestHarness.LargeBoomConfig.fir 174357:4]
  reg [39:0] debug_sc_fail_addr; // @[dcache.scala 656:35 chipyard.TestHarness.LargeBoomConfig.fir 174364:4]
  reg [7:0] debug_sc_fail_cnt; // @[dcache.scala 657:35 chipyard.TestHarness.LargeBoomConfig.fir 174365:4]
  reg [6:0] lrsc_count; // @[dcache.scala 659:27 chipyard.TestHarness.LargeBoomConfig.fir 174366:4]
  wire  lrsc_valid = lrsc_count > 7'h3; // @[dcache.scala 660:31 chipyard.TestHarness.LargeBoomConfig.fir 174367:4]
  reg [33:0] lrsc_addr; // @[dcache.scala 661:23 chipyard.TestHarness.LargeBoomConfig.fir 174368:4]
  reg  s2_lr_REG; // @[dcache.scala 662:59 chipyard.TestHarness.LargeBoomConfig.fir 174370:4]
  wire  _s2_lr_T_1 = ~s2_lr_REG; // @[dcache.scala 662:51 chipyard.TestHarness.LargeBoomConfig.fir 174372:4]
  wire  _s2_lr_T_3 = _s2_lr_T_1 | _s2_hit_T_5; // @[dcache.scala 662:72 chipyard.TestHarness.LargeBoomConfig.fir 174374:4]
  wire  s2_lr = _s2_has_permission_c_cat_T_47 & _s2_lr_T_3; // @[dcache.scala 662:47 chipyard.TestHarness.LargeBoomConfig.fir 174375:4]
  reg  s2_sc_REG; // @[dcache.scala 663:59 chipyard.TestHarness.LargeBoomConfig.fir 174377:4]
  wire  _s2_sc_T_1 = ~s2_sc_REG; // @[dcache.scala 663:51 chipyard.TestHarness.LargeBoomConfig.fir 174379:4]
  wire  _s2_sc_T_3 = _s2_sc_T_1 | _s2_hit_T_5; // @[dcache.scala 663:72 chipyard.TestHarness.LargeBoomConfig.fir 174381:4]
  wire  s2_sc = _s2_has_permission_c_cat_T_3 & _s2_sc_T_3; // @[dcache.scala 663:47 chipyard.TestHarness.LargeBoomConfig.fir 174382:4]
  wire  _s2_lrsc_addr_match_T_1 = lrsc_addr == s2_req_0_addr[39:6]; // @[dcache.scala 664:66 chipyard.TestHarness.LargeBoomConfig.fir 174384:4]
  wire  s2_lrsc_addr_match_0 = lrsc_valid & _s2_lrsc_addr_match_T_1; // @[dcache.scala 664:53 chipyard.TestHarness.LargeBoomConfig.fir 174385:4]
  wire  _s2_sc_fail_T = ~s2_lrsc_addr_match_0; // @[dcache.scala 665:29 chipyard.TestHarness.LargeBoomConfig.fir 174388:4]
  wire  s2_sc_fail = s2_sc & _s2_sc_fail_T; // @[dcache.scala 665:26 chipyard.TestHarness.LargeBoomConfig.fir 174389:4]
  wire  _T_30 = lrsc_count > 7'h0; // @[dcache.scala 666:20 chipyard.TestHarness.LargeBoomConfig.fir 174390:4]
  wire [6:0] _lrsc_count_T_1 = lrsc_count - 7'h1; // @[dcache.scala 666:54 chipyard.TestHarness.LargeBoomConfig.fir 174393:6]
  wire [6:0] _GEN_0 = _T_30 ? _lrsc_count_T_1 : lrsc_count; // @[dcache.scala 666:27 chipyard.TestHarness.LargeBoomConfig.fir 174391:4 dcache.scala 666:40 chipyard.TestHarness.LargeBoomConfig.fir 174394:6 dcache.scala 659:27 chipyard.TestHarness.LargeBoomConfig.fir 174366:4]
  wire  _T_31 = s2_type == 3'h4; // @[dcache.scala 667:34 chipyard.TestHarness.LargeBoomConfig.fir 174396:4]
  wire  _T_32 = _T_31 & s2_hit_0; // @[dcache.scala 667:44 chipyard.TestHarness.LargeBoomConfig.fir 174397:4]
  wire  _T_33 = ~s2_nack_0; // @[dcache.scala 667:60 chipyard.TestHarness.LargeBoomConfig.fir 174398:4]
  wire  _T_34 = _T_32 & _T_33; // @[dcache.scala 667:57 chipyard.TestHarness.LargeBoomConfig.fir 174399:4]
  wire  _T_36 = s2_req_0_uop_mem_cmd != 5'h5; // @[dcache.scala 668:69 chipyard.TestHarness.LargeBoomConfig.fir 174401:4]
  wire  _T_37 = _s2_hit_T_5 & _T_36; // @[dcache.scala 668:44 chipyard.TestHarness.LargeBoomConfig.fir 174402:4]
  wire  _T_38 = _T_34 | _T_37; // @[dcache.scala 667:73 chipyard.TestHarness.LargeBoomConfig.fir 174403:4]
  wire  _T_39 = s2_valid_REG & _T_38; // @[dcache.scala 667:21 chipyard.TestHarness.LargeBoomConfig.fir 174404:4]
  wire [6:0] _GEN_1 = s2_lr ? 7'h4f : _GEN_0; // @[dcache.scala 669:18 chipyard.TestHarness.LargeBoomConfig.fir 174406:6 dcache.scala 670:18 chipyard.TestHarness.LargeBoomConfig.fir 174407:8]
  wire  _T_42 = s2_valid_REG & _T_31; // @[dcache.scala 678:50 chipyard.TestHarness.LargeBoomConfig.fir 174417:4]
  wire  _T_44 = _T_42 & _s2_nack_miss_T; // @[dcache.scala 679:50 chipyard.TestHarness.LargeBoomConfig.fir 174419:4]
  wire  _T_45 = s2_has_permission_0 & s2_tag_match_0; // @[dcache.scala 681:30 chipyard.TestHarness.LargeBoomConfig.fir 174420:4]
  wire  _T_46 = ~_T_45; // @[dcache.scala 681:7 chipyard.TestHarness.LargeBoomConfig.fir 174421:4]
  wire  _T_47 = _T_44 & _T_46; // @[dcache.scala 680:50 chipyard.TestHarness.LargeBoomConfig.fir 174422:4]
  wire  _T_48 = _T_47 & s2_lrsc_addr_match_0; // @[dcache.scala 681:50 chipyard.TestHarness.LargeBoomConfig.fir 174423:4]
  wire  _T_50 = _T_48 & _T_33; // @[dcache.scala 682:50 chipyard.TestHarness.LargeBoomConfig.fir 174425:4]
  wire  _T_51 = s2_req_0_addr == debug_sc_fail_addr; // @[dcache.scala 689:26 chipyard.TestHarness.LargeBoomConfig.fir 174430:6]
  wire [7:0] _debug_sc_fail_cnt_T_1 = debug_sc_fail_cnt + 8'h1; // @[dcache.scala 691:48 chipyard.TestHarness.LargeBoomConfig.fir 174434:10]
  wire [7:0] _GEN_7 = s2_sc ? 8'h0 : debug_sc_fail_cnt; // @[dcache.scala 692:27 chipyard.TestHarness.LargeBoomConfig.fir 174438:10 dcache.scala 693:27 chipyard.TestHarness.LargeBoomConfig.fir 174439:12 dcache.scala 657:35 chipyard.TestHarness.LargeBoomConfig.fir 174365:4]
  wire  _T_52 = debug_sc_fail_cnt < 8'h64; // @[dcache.scala 702:28 chipyard.TestHarness.LargeBoomConfig.fir 174449:4]
  wire  _T_54 = _T_52 | reset; // @[dcache.scala 702:9 chipyard.TestHarness.LargeBoomConfig.fir 174451:4]
  wire  _T_55 = ~_T_54; // @[dcache.scala 702:9 chipyard.TestHarness.LargeBoomConfig.fir 174452:4]
  wire [127:0] s2_data_0_0 = data_io_resp_0_0; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174458:4]
  wire [127:0] _s2_data_muxed_T_8 = s2_tag_match_way_0[0] ? s2_data_0_0 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174474:4]
  wire [127:0] s2_data_0_1 = data_io_resp_0_1; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174459:4]
  wire [127:0] _s2_data_muxed_T_9 = s2_tag_match_way_0[1] ? s2_data_0_1 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174475:4]
  wire [127:0] s2_data_0_2 = data_io_resp_0_2; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174460:4]
  wire [127:0] _s2_data_muxed_T_10 = s2_tag_match_way_0[2] ? s2_data_0_2 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174476:4]
  wire [127:0] s2_data_0_3 = data_io_resp_0_3; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174461:4]
  wire [127:0] _s2_data_muxed_T_11 = s2_tag_match_way_0[3] ? s2_data_0_3 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174477:4]
  wire [127:0] s2_data_0_4 = data_io_resp_0_4; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174462:4]
  wire [127:0] _s2_data_muxed_T_12 = s2_tag_match_way_0[4] ? s2_data_0_4 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174478:4]
  wire [127:0] s2_data_0_5 = data_io_resp_0_5; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174463:4]
  wire [127:0] _s2_data_muxed_T_13 = s2_tag_match_way_0[5] ? s2_data_0_5 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174479:4]
  wire [127:0] s2_data_0_6 = data_io_resp_0_6; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174464:4]
  wire [127:0] _s2_data_muxed_T_14 = s2_tag_match_way_0[6] ? s2_data_0_6 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174480:4]
  wire [127:0] s2_data_0_7 = data_io_resp_0_7; // @[dcache.scala 704:21 chipyard.TestHarness.LargeBoomConfig.fir 174457:4 dcache.scala 707:21 chipyard.TestHarness.LargeBoomConfig.fir 174465:4]
  wire [127:0] _s2_data_muxed_T_15 = s2_tag_match_way_0[7] ? s2_data_0_7 : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174481:4]
  wire [127:0] _s2_data_muxed_T_16 = _s2_data_muxed_T_8 | _s2_data_muxed_T_9; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174482:4]
  wire [127:0] _s2_data_muxed_T_17 = _s2_data_muxed_T_16 | _s2_data_muxed_T_10; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174483:4]
  wire [127:0] _s2_data_muxed_T_18 = _s2_data_muxed_T_17 | _s2_data_muxed_T_11; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174484:4]
  wire [127:0] _s2_data_muxed_T_19 = _s2_data_muxed_T_18 | _s2_data_muxed_T_12; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174485:4]
  wire [127:0] _s2_data_muxed_T_20 = _s2_data_muxed_T_19 | _s2_data_muxed_T_13; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174486:4]
  wire [127:0] _s2_data_muxed_T_21 = _s2_data_muxed_T_20 | _s2_data_muxed_T_14; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174487:4]
  wire [127:0] s2_data_muxed_0 = _s2_data_muxed_T_21 | _s2_data_muxed_T_15; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174488:4]
  wire  s2_word_idx_0 = s2_req_0_addr[3]; // @[dcache.scala 712:79 chipyard.TestHarness.LargeBoomConfig.fir 174493:4]
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 86:17 chipyard.TestHarness.LargeBoomConfig.fir 174525:4]
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo}; // @[PRNG.scala 86:17 chipyard.TestHarness.LargeBoomConfig.fir 174533:4]
  reg [2:0] s2_replaced_way_en_REG; // @[dcache.scala 717:44 chipyard.TestHarness.LargeBoomConfig.fir 174537:4]
  wire [7:0] s2_replaced_way_en = 8'h1 << s2_replaced_way_en_REG; // @[OneHot.scala 58:35 chipyard.TestHarness.LargeBoomConfig.fir 174539:4]
  reg [1:0] s2_repl_meta_REG_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174540:4]
  reg [19:0] s2_repl_meta_REG_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174540:4]
  reg [1:0] s2_repl_meta_REG_1_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174543:4]
  reg [19:0] s2_repl_meta_REG_1_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174543:4]
  reg [1:0] s2_repl_meta_REG_2_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174546:4]
  reg [19:0] s2_repl_meta_REG_2_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174546:4]
  reg [1:0] s2_repl_meta_REG_3_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174549:4]
  reg [19:0] s2_repl_meta_REG_3_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174549:4]
  reg [1:0] s2_repl_meta_REG_4_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174552:4]
  reg [19:0] s2_repl_meta_REG_4_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174552:4]
  reg [1:0] s2_repl_meta_REG_5_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174555:4]
  reg [19:0] s2_repl_meta_REG_5_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174555:4]
  reg [1:0] s2_repl_meta_REG_6_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174558:4]
  reg [19:0] s2_repl_meta_REG_6_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174558:4]
  reg [1:0] s2_repl_meta_REG_7_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174561:4]
  reg [19:0] s2_repl_meta_REG_7_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174561:4]
  wire [19:0] _s2_repl_meta_T_8 = s2_replaced_way_en[0] ? s2_repl_meta_REG_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174590:4]
  wire [19:0] _s2_repl_meta_T_9 = s2_replaced_way_en[1] ? s2_repl_meta_REG_1_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174591:4]
  wire [19:0] _s2_repl_meta_T_10 = s2_replaced_way_en[2] ? s2_repl_meta_REG_2_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174592:4]
  wire [19:0] _s2_repl_meta_T_11 = s2_replaced_way_en[3] ? s2_repl_meta_REG_3_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174593:4]
  wire [19:0] _s2_repl_meta_T_12 = s2_replaced_way_en[4] ? s2_repl_meta_REG_4_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174594:4]
  wire [19:0] _s2_repl_meta_T_13 = s2_replaced_way_en[5] ? s2_repl_meta_REG_5_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174595:4]
  wire [19:0] _s2_repl_meta_T_14 = s2_replaced_way_en[6] ? s2_repl_meta_REG_6_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174596:4]
  wire [19:0] _s2_repl_meta_T_15 = s2_replaced_way_en[7] ? s2_repl_meta_REG_7_tag : 20'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174597:4]
  wire [19:0] _s2_repl_meta_T_16 = _s2_repl_meta_T_8 | _s2_repl_meta_T_9; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174598:4]
  wire [19:0] _s2_repl_meta_T_17 = _s2_repl_meta_T_16 | _s2_repl_meta_T_10; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174599:4]
  wire [19:0] _s2_repl_meta_T_18 = _s2_repl_meta_T_17 | _s2_repl_meta_T_11; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174600:4]
  wire [19:0] _s2_repl_meta_T_19 = _s2_repl_meta_T_18 | _s2_repl_meta_T_12; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174601:4]
  wire [19:0] _s2_repl_meta_T_20 = _s2_repl_meta_T_19 | _s2_repl_meta_T_13; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174602:4]
  wire [19:0] _s2_repl_meta_T_21 = _s2_repl_meta_T_20 | _s2_repl_meta_T_14; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174603:4]
  wire [1:0] _s2_repl_meta_T_23 = s2_replaced_way_en[0] ? s2_repl_meta_REG_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174609:4]
  wire [1:0] _s2_repl_meta_T_24 = s2_replaced_way_en[1] ? s2_repl_meta_REG_1_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174610:4]
  wire [1:0] _s2_repl_meta_T_25 = s2_replaced_way_en[2] ? s2_repl_meta_REG_2_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174611:4]
  wire [1:0] _s2_repl_meta_T_26 = s2_replaced_way_en[3] ? s2_repl_meta_REG_3_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174612:4]
  wire [1:0] _s2_repl_meta_T_27 = s2_replaced_way_en[4] ? s2_repl_meta_REG_4_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174613:4]
  wire [1:0] _s2_repl_meta_T_28 = s2_replaced_way_en[5] ? s2_repl_meta_REG_5_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174614:4]
  wire [1:0] _s2_repl_meta_T_29 = s2_replaced_way_en[6] ? s2_repl_meta_REG_6_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174615:4]
  wire [1:0] _s2_repl_meta_T_30 = s2_replaced_way_en[7] ? s2_repl_meta_REG_7_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174616:4]
  wire [1:0] _s2_repl_meta_T_31 = _s2_repl_meta_T_23 | _s2_repl_meta_T_24; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174617:4]
  wire [1:0] _s2_repl_meta_T_32 = _s2_repl_meta_T_31 | _s2_repl_meta_T_25; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174618:4]
  wire [1:0] _s2_repl_meta_T_33 = _s2_repl_meta_T_32 | _s2_repl_meta_T_26; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174619:4]
  wire [1:0] _s2_repl_meta_T_34 = _s2_repl_meta_T_33 | _s2_repl_meta_T_27; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174620:4]
  wire [1:0] _s2_repl_meta_T_35 = _s2_repl_meta_T_34 | _s2_repl_meta_T_28; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174621:4]
  wire [1:0] _s2_repl_meta_T_36 = _s2_repl_meta_T_35 | _s2_repl_meta_T_29; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174622:4]
  wire [1:0] s2_repl_meta_0_coh_state = _s2_repl_meta_T_36 | _s2_repl_meta_T_30; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174623:4]
  reg  s2_send_resp_REG; // @[dcache.scala 732:44 chipyard.TestHarness.LargeBoomConfig.fir 174661:4]
  wire  _s2_send_resp_T_1 = s2_send_resp_REG & _T_33; // @[dcache.scala 732:70 chipyard.TestHarness.LargeBoomConfig.fir 174664:4]
  wire  _s2_send_resp_T_2 = mshrs_io_req_0_ready & mshrs_io_req_0_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 174665:4]
  wire  _s2_send_resp_T_26 = _s2_send_resp_T_2 & s2_has_permission_c_cat_hi; // @[dcache.scala 733:61 chipyard.TestHarness.LargeBoomConfig.fir 174689:4]
  wire  _s2_send_resp_T_27 = s2_req_0_uop_mem_cmd == 5'h0; // @[Consts.scala 81:31 chipyard.TestHarness.LargeBoomConfig.fir 174690:4]
  wire  _s2_send_resp_T_29 = _s2_send_resp_T_27 | _s2_has_permission_c_cat_T_47; // @[Consts.scala 81:41 chipyard.TestHarness.LargeBoomConfig.fir 174692:4]
  wire  _s2_send_resp_T_31 = _s2_send_resp_T_29 | _s2_has_permission_c_cat_T_3; // @[Consts.scala 81:58 chipyard.TestHarness.LargeBoomConfig.fir 174694:4]
  wire  _s2_send_resp_T_49 = _s2_send_resp_T_31 | _s2_has_permission_c_cat_T_21; // @[Consts.scala 81:75 chipyard.TestHarness.LargeBoomConfig.fir 174712:4]
  wire  _s2_send_resp_T_50 = ~_s2_send_resp_T_49; // @[dcache.scala 733:98 chipyard.TestHarness.LargeBoomConfig.fir 174713:4]
  wire  _s2_send_resp_T_51 = _s2_send_resp_T_26 & _s2_send_resp_T_50; // @[dcache.scala 733:95 chipyard.TestHarness.LargeBoomConfig.fir 174714:4]
  wire  _s2_send_resp_T_52 = s2_hit_0 | _s2_send_resp_T_51; // @[dcache.scala 733:34 chipyard.TestHarness.LargeBoomConfig.fir 174715:4]
  wire  s2_send_resp_0 = _s2_send_resp_T_1 & _s2_send_resp_T_52; // @[dcache.scala 732:85 chipyard.TestHarness.LargeBoomConfig.fir 174716:4]
  wire  _T_62 = s2_send_resp_0 & s2_send_nack_0; // @[dcache.scala 736:30 chipyard.TestHarness.LargeBoomConfig.fir 174724:4]
  wire  _T_63 = ~_T_62; // @[dcache.scala 736:12 chipyard.TestHarness.LargeBoomConfig.fir 174725:4]
  wire  _T_65 = _T_63 | reset; // @[dcache.scala 736:11 chipyard.TestHarness.LargeBoomConfig.fir 174727:4]
  wire  _T_66 = ~_T_65; // @[dcache.scala 736:11 chipyard.TestHarness.LargeBoomConfig.fir 174728:4]
  wire  _mshrs_io_req_0_valid_T_2 = ~s2_nack_hit_0; // @[dcache.scala 747:29 chipyard.TestHarness.LargeBoomConfig.fir 174739:4]
  wire  _mshrs_io_req_0_valid_T_3 = _s2_nack_miss_T_1 & _mshrs_io_req_0_valid_T_2; // @[dcache.scala 746:51 chipyard.TestHarness.LargeBoomConfig.fir 174740:4]
  wire  _mshrs_io_req_0_valid_T_4 = ~s2_nack_victim_0; // @[dcache.scala 748:29 chipyard.TestHarness.LargeBoomConfig.fir 174741:4]
  wire  _mshrs_io_req_0_valid_T_5 = _mshrs_io_req_0_valid_T_3 & _mshrs_io_req_0_valid_T_4; // @[dcache.scala 747:51 chipyard.TestHarness.LargeBoomConfig.fir 174742:4]
  wire  _mshrs_io_req_0_valid_T_8 = ~s2_nack_wb_0; // @[dcache.scala 750:29 chipyard.TestHarness.LargeBoomConfig.fir 174745:4]
  wire  _mshrs_io_req_0_valid_T_9 = _mshrs_io_req_0_valid_T_5 & _mshrs_io_req_0_valid_T_8; // @[dcache.scala 749:51 chipyard.TestHarness.LargeBoomConfig.fir 174746:4]
  wire  _mshrs_io_req_0_valid_T_11 = s2_type == 3'h5; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 174748:4]
  wire  _mshrs_io_req_0_valid_T_12 = _T_31 | _mshrs_io_req_0_valid_T_11; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 174749:4]
  wire  _mshrs_io_req_0_valid_T_13 = _mshrs_io_req_0_valid_T_9 & _mshrs_io_req_0_valid_T_12; // @[dcache.scala 750:51 chipyard.TestHarness.LargeBoomConfig.fir 174750:4]
  wire [15:0] _mshrs_io_req_0_valid_T_14 = io_lsu_brupdate_b1_mispredict_mask & s2_req_0_uop_br_mask; // @[util.scala 118:51 chipyard.TestHarness.LargeBoomConfig.fir 174751:4]
  wire  _mshrs_io_req_0_valid_T_15 = _mshrs_io_req_0_valid_T_14 != 16'h0; // @[util.scala 118:59 chipyard.TestHarness.LargeBoomConfig.fir 174752:4]
  wire  _mshrs_io_req_0_valid_T_16 = ~_mshrs_io_req_0_valid_T_15; // @[dcache.scala 752:29 chipyard.TestHarness.LargeBoomConfig.fir 174753:4]
  wire  _mshrs_io_req_0_valid_T_17 = _mshrs_io_req_0_valid_T_13 & _mshrs_io_req_0_valid_T_16; // @[dcache.scala 751:77 chipyard.TestHarness.LargeBoomConfig.fir 174754:4]
  wire  _mshrs_io_req_0_valid_T_18 = io_lsu_exception & s2_req_0_uop_uses_ldq; // @[dcache.scala 753:48 chipyard.TestHarness.LargeBoomConfig.fir 174755:4]
  wire  _mshrs_io_req_0_valid_T_19 = ~_mshrs_io_req_0_valid_T_18; // @[dcache.scala 753:29 chipyard.TestHarness.LargeBoomConfig.fir 174756:4]
  wire  _mshrs_io_req_0_valid_T_20 = _mshrs_io_req_0_valid_T_17 & _mshrs_io_req_0_valid_T_19; // @[dcache.scala 752:79 chipyard.TestHarness.LargeBoomConfig.fir 174757:4]
  wire  _mshrs_io_req_0_valid_T_21 = s2_req_0_uop_mem_cmd == 5'h2; // @[Consts.scala 80:35 chipyard.TestHarness.LargeBoomConfig.fir 174758:4]
  wire  _mshrs_io_req_0_valid_T_23 = _mshrs_io_req_0_valid_T_21 | _s2_has_permission_c_cat_T_45; // @[Consts.scala 80:45 chipyard.TestHarness.LargeBoomConfig.fir 174760:4]
  wire  _mshrs_io_req_0_valid_T_47 = _mshrs_io_req_0_valid_T_23 | _s2_send_resp_T_49; // @[dcache.scala 754:65 chipyard.TestHarness.LargeBoomConfig.fir 174784:4]
  wire  _mshrs_io_req_0_valid_T_71 = _mshrs_io_req_0_valid_T_47 | s2_has_permission_c_cat_hi; // @[dcache.scala 755:65 chipyard.TestHarness.LargeBoomConfig.fir 174808:4]
  wire  _T_68 = mshrs_io_req_0_valid & _s2_hit_T_5; // @[dcache.scala 757:36 chipyard.TestHarness.LargeBoomConfig.fir 174812:4]
  wire  _T_69 = ~_T_68; // @[dcache.scala 757:12 chipyard.TestHarness.LargeBoomConfig.fir 174813:4]
  wire  _T_71 = _T_69 | reset; // @[dcache.scala 757:11 chipyard.TestHarness.LargeBoomConfig.fir 174815:4]
  wire  _T_72 = ~_T_71; // @[dcache.scala 757:11 chipyard.TestHarness.LargeBoomConfig.fir 174816:4]
  wire  _mshrs_io_req_is_probe_0_T = s2_type == 3'h1; // @[dcache.scala 768:49 chipyard.TestHarness.LargeBoomConfig.fir 175003:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_0_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_1_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_2_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_3_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_4_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_5_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_6_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  reg [1:0] mshrs_io_meta_resp_bits_REG_7_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175009:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_23 = s2_tag_match_way_0[0] ? mshrs_io_meta_resp_bits_REG_0_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175054:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_24 = s2_tag_match_way_0[1] ? mshrs_io_meta_resp_bits_REG_1_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175055:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_25 = s2_tag_match_way_0[2] ? mshrs_io_meta_resp_bits_REG_2_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175056:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_26 = s2_tag_match_way_0[3] ? mshrs_io_meta_resp_bits_REG_3_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175057:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_27 = s2_tag_match_way_0[4] ? mshrs_io_meta_resp_bits_REG_4_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175058:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_28 = s2_tag_match_way_0[5] ? mshrs_io_meta_resp_bits_REG_5_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175059:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_29 = s2_tag_match_way_0[6] ? mshrs_io_meta_resp_bits_REG_6_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175060:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_30 = s2_tag_match_way_0[7] ? mshrs_io_meta_resp_bits_REG_7_coh_state : 2'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175061:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_31 = _mshrs_io_meta_resp_bits_T_23 | _mshrs_io_meta_resp_bits_T_24; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175062:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_32 = _mshrs_io_meta_resp_bits_T_31 | _mshrs_io_meta_resp_bits_T_25; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175063:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_33 = _mshrs_io_meta_resp_bits_T_32 | _mshrs_io_meta_resp_bits_T_26; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175064:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_34 = _mshrs_io_meta_resp_bits_T_33 | _mshrs_io_meta_resp_bits_T_27; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175065:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_35 = _mshrs_io_meta_resp_bits_T_34 | _mshrs_io_meta_resp_bits_T_28; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175066:4]
  wire [1:0] _mshrs_io_meta_resp_bits_T_36 = _mshrs_io_meta_resp_bits_T_35 | _mshrs_io_meta_resp_bits_T_29; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175067:4]
  wire  _prober_io_req_valid_T = ~lrsc_valid; // @[dcache.scala 777:46 chipyard.TestHarness.LargeBoomConfig.fir 175082:4]
  wire  _prober_io_wb_rdy_T = prober_io_meta_write_bits_idx != wb_io_idx_bits; // @[dcache.scala 784:59 chipyard.TestHarness.LargeBoomConfig.fir 175102:4]
  wire  _prober_io_wb_rdy_T_1 = ~wb_io_idx_valid; // @[dcache.scala 784:82 chipyard.TestHarness.LargeBoomConfig.fir 175103:4]
  wire  _T_74 = auto_out_d_bits_source == 3'h4; // @[dcache.scala 788:30 chipyard.TestHarness.LargeBoomConfig.fir 175108:4]
  wire  tl_out_d_ready = _T_74 | mshrs_io_mem_grant_ready; // @[dcache.scala 788:48 chipyard.TestHarness.LargeBoomConfig.fir 175109:4 dcache.scala 790:20 chipyard.TestHarness.LargeBoomConfig.fir 175110:6 dcache.scala 795:24 chipyard.TestHarness.LargeBoomConfig.fir 175124:6]
  wire  _wb_io_mem_grant_T = tl_out_d_ready & auto_out_d_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 175149:4]
  wire  opdata = wb_io_release_bits_opcode[0]; // @[Edges.scala 101:36 chipyard.TestHarness.LargeBoomConfig.fir 175170:4]
  reg [7:0] beatsLeft; // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 175202:4]
  wire  idle = beatsLeft == 8'h0; // @[Arbiter.scala 88:28 chipyard.TestHarness.LargeBoomConfig.fir 175203:4]
  wire  latch = idle & auto_out_c_ready; // @[Arbiter.scala 89:24 chipyard.TestHarness.LargeBoomConfig.fir 175204:4]
  wire  out_earlyValid = wb_io_release_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175180:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 175181:4]
  wire  out_1_earlyValid = prober_io_rep_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175191:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 175192:4]
  wire [1:0] _readys_T = {out_1_earlyValid,out_earlyValid}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 175209:4]
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48 chipyard.TestHarness.LargeBoomConfig.fir 175210:4]
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0]; // @[package.scala 244:43 chipyard.TestHarness.LargeBoomConfig.fir 175212:4]
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0}; // @[Arbiter.scala 16:78 chipyard.TestHarness.LargeBoomConfig.fir 175214:4]
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0]; // @[Arbiter.scala 16:61 chipyard.TestHarness.LargeBoomConfig.fir 175216:4]
  wire  readys_0 = _readys_T_7[0]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 175217:4]
  wire  readys_1 = _readys_T_7[1]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 175218:4]
  wire  earlyWinner_0 = readys_0 & out_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 175222:4]
  wire  earlyWinner_1 = readys_1 & out_1_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 175223:4]
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 175233:4]
  wire  _T_78 = ~earlyWinner_0; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 175235:4]
  wire  _T_81 = ~earlyWinner_1; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 175238:4]
  wire  _T_82 = _T_78 | _T_81; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 175239:4]
  wire  _T_85 = _T_82 | reset; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 175242:4]
  wire  _T_86 = ~_T_85; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 175243:4]
  wire  _T_87 = out_earlyValid | out_1_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 175248:4]
  wire  _T_88 = ~_T_87; // @[Arbiter.scala 107:15 chipyard.TestHarness.LargeBoomConfig.fir 175249:4]
  wire  _T_90 = _T_88 | _prefixOR_T; // @[Arbiter.scala 107:41 chipyard.TestHarness.LargeBoomConfig.fir 175251:4]
  wire  _T_92 = _T_90 | reset; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 175253:4]
  wire  _T_93 = ~_T_92; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 175254:4]
  wire  _T_97 = _T_88 | _T_87; // @[Arbiter.scala 108:41 chipyard.TestHarness.LargeBoomConfig.fir 175262:4]
  wire  _T_99 = _T_97 | reset; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 175264:4]
  wire  _T_100 = ~_T_99; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 175265:4]
  reg  state_0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 175283:4]
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 175284:4]
  reg  state_1; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 175283:4]
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 175284:4]
  wire  _sink_ACancel_earlyValid_T_1 = state_0 & out_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175294:4]
  wire  _sink_ACancel_earlyValid_T_2 = state_1 & out_1_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175295:4]
  wire  _sink_ACancel_earlyValid_T_3 = _sink_ACancel_earlyValid_T_1 | _sink_ACancel_earlyValid_T_2; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175296:4]
  wire  sink_ACancel_earlyValid = idle ? _T_87 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29 chipyard.TestHarness.LargeBoomConfig.fir 175299:4]
  wire  _beatsLeft_T_2 = auto_out_c_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 50:33 chipyard.TestHarness.LargeBoomConfig.fir 175275:4]
  wire [7:0] _GEN_118 = {{7'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52 chipyard.TestHarness.LargeBoomConfig.fir 175276:4]
  wire [7:0] _beatsLeft_T_4 = beatsLeft - _GEN_118; // @[Arbiter.scala 113:52 chipyard.TestHarness.LargeBoomConfig.fir 175277:4]
  wire  allowed_0 = idle ? readys_0 : state_0; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 175288:4]
  wire  allowed_1 = idle ? readys_1 : state_1; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 175288:4]
  wire [127:0] out_bits_data = wb_io_release_bits_data; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175180:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175184:4]
  wire [31:0] out_bits_address = wb_io_release_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175180:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175185:4]
  wire [31:0] _T_107 = muxStateEarly_0 ? out_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175322:4]
  wire [31:0] out_1_bits_address = prober_io_rep_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175191:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175196:4]
  wire [31:0] _T_108 = muxStateEarly_1 ? out_1_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175323:4]
  wire [2:0] _T_110 = muxStateEarly_0 ? 3'h4 : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175328:4]
  wire [2:0] out_1_bits_source = prober_io_rep_bits_source; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175191:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175197:4]
  wire [2:0] _T_111 = muxStateEarly_1 ? out_1_bits_source : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175329:4]
  wire [3:0] _T_113 = muxStateEarly_0 ? 4'h6 : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175334:4]
  wire [3:0] out_1_bits_size = prober_io_rep_bits_size; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175191:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175198:4]
  wire [3:0] _T_114 = muxStateEarly_1 ? out_1_bits_size : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175335:4]
  wire [2:0] out_bits_param = wb_io_release_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175180:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175188:4]
  wire [2:0] _T_116 = muxStateEarly_0 ? out_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175340:4]
  wire [2:0] out_1_bits_param = prober_io_rep_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175191:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175199:4]
  wire [2:0] _T_117 = muxStateEarly_1 ? out_1_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175341:4]
  wire [2:0] out_bits_opcode = wb_io_release_bits_opcode; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 175180:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 175189:4]
  wire [2:0] _T_119 = muxStateEarly_0 ? out_bits_opcode : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175346:4]
  wire [2:0] _T_120 = muxStateEarly_1 ? 3'h4 : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175347:4]
  wire [6:0] _s2_data_word_prebypass_T = {s2_word_idx_0,6'h0}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 175427:4]
  wire [127:0] s2_data_word_prebypass_0 = s2_data_muxed_0 >> _s2_data_word_prebypass_T; // @[dcache.scala 824:63 chipyard.TestHarness.LargeBoomConfig.fir 175428:4]
  wire  cache_resp_0_valid = s2_valid_REG & s2_send_resp_0; // @[dcache.scala 834:48 chipyard.TestHarness.LargeBoomConfig.fir 175435:4]
  reg  s3_valid; // @[dcache.scala 870:25 chipyard.TestHarness.LargeBoomConfig.fir 176294:4]
  reg [39:0] s3_req_addr; // @[dcache.scala 869:25 chipyard.TestHarness.LargeBoomConfig.fir 176181:4]
  wire  _s3_bypass_T_2 = s2_req_0_addr[39:3] == s3_req_addr[39:3]; // @[dcache.scala 884:78 chipyard.TestHarness.LargeBoomConfig.fir 176468:4]
  wire  s3_bypass_0 = s3_valid & _s3_bypass_T_2; // @[dcache.scala 884:42 chipyard.TestHarness.LargeBoomConfig.fir 176469:4]
  reg [63:0] s3_req_data; // @[dcache.scala 869:25 chipyard.TestHarness.LargeBoomConfig.fir 176181:4]
  reg  s4_valid; // @[dcache.scala 880:25 chipyard.TestHarness.LargeBoomConfig.fir 176379:4]
  reg [39:0] s4_req_addr; // @[dcache.scala 879:25 chipyard.TestHarness.LargeBoomConfig.fir 176296:4]
  wire  _s4_bypass_T_2 = s2_req_0_addr[39:3] == s4_req_addr[39:3]; // @[dcache.scala 885:78 chipyard.TestHarness.LargeBoomConfig.fir 176474:4]
  wire  s4_bypass_0 = s4_valid & _s4_bypass_T_2; // @[dcache.scala 885:42 chipyard.TestHarness.LargeBoomConfig.fir 176475:4]
  reg [63:0] s4_req_data; // @[dcache.scala 879:25 chipyard.TestHarness.LargeBoomConfig.fir 176296:4]
  reg  s5_valid; // @[dcache.scala 882:25 chipyard.TestHarness.LargeBoomConfig.fir 176464:4]
  reg [39:0] s5_req_addr; // @[dcache.scala 881:25 chipyard.TestHarness.LargeBoomConfig.fir 176381:4]
  wire  _s5_bypass_T_2 = s2_req_0_addr[39:3] == s5_req_addr[39:3]; // @[dcache.scala 886:78 chipyard.TestHarness.LargeBoomConfig.fir 176480:4]
  wire  s5_bypass_0 = s5_valid & _s5_bypass_T_2; // @[dcache.scala 886:42 chipyard.TestHarness.LargeBoomConfig.fir 176481:4]
  reg [63:0] s5_req_data; // @[dcache.scala 881:25 chipyard.TestHarness.LargeBoomConfig.fir 176381:4]
  wire [127:0] _s2_data_word_0_T = s5_bypass_0 ? {{64'd0}, s5_req_data} : s2_data_word_prebypass_0; // @[dcache.scala 892:27 chipyard.TestHarness.LargeBoomConfig.fir 176484:4]
  wire [127:0] _s2_data_word_0_T_1 = s4_bypass_0 ? {{64'd0}, s4_req_data} : _s2_data_word_0_T; // @[dcache.scala 891:27 chipyard.TestHarness.LargeBoomConfig.fir 176485:4]
  wire [127:0] s2_data_word_0 = s3_bypass_0 ? {{64'd0}, s3_req_data} : _s2_data_word_0_T_1; // @[dcache.scala 890:27 chipyard.TestHarness.LargeBoomConfig.fir 176486:4]
  wire [31:0] cache_resp_0_bits_data_shifted = s2_req_0_addr[2] ? s2_data_word_0[63:32] : s2_data_word_0[31:0]; // @[AMOALU.scala 39:24 chipyard.TestHarness.LargeBoomConfig.fir 175519:4]
  wire  _cache_resp_0_bits_data_T = s2_req_0_uop_mem_size == 2'h2; // @[AMOALU.scala 42:26 chipyard.TestHarness.LargeBoomConfig.fir 175522:4]
  wire  _cache_resp_0_bits_data_T_3 = s2_req_0_uop_mem_signed & cache_resp_0_bits_data_shifted[31]; // @[AMOALU.scala 42:76 chipyard.TestHarness.LargeBoomConfig.fir 175525:4]
  wire [31:0] _cache_resp_0_bits_data_T_5 = _cache_resp_0_bits_data_T_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12 chipyard.TestHarness.LargeBoomConfig.fir 175527:4]
  wire [31:0] cache_resp_0_bits_data_hi = _cache_resp_0_bits_data_T ? _cache_resp_0_bits_data_T_5 : s2_data_word_0[63:32
    ]; // @[AMOALU.scala 42:20 chipyard.TestHarness.LargeBoomConfig.fir 175529:4]
  wire [63:0] _cache_resp_0_bits_data_T_7 = {cache_resp_0_bits_data_hi,cache_resp_0_bits_data_shifted}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 175530:4]
  wire [15:0] cache_resp_0_bits_data_shifted_1 = s2_req_0_addr[1] ? _cache_resp_0_bits_data_T_7[31:16] :
    _cache_resp_0_bits_data_T_7[15:0]; // @[AMOALU.scala 39:24 chipyard.TestHarness.LargeBoomConfig.fir 175534:4]
  wire  _cache_resp_0_bits_data_T_8 = s2_req_0_uop_mem_size == 2'h1; // @[AMOALU.scala 42:26 chipyard.TestHarness.LargeBoomConfig.fir 175537:4]
  wire  _cache_resp_0_bits_data_T_11 = s2_req_0_uop_mem_signed & cache_resp_0_bits_data_shifted_1[15]; // @[AMOALU.scala 42:76 chipyard.TestHarness.LargeBoomConfig.fir 175540:4]
  wire [47:0] _cache_resp_0_bits_data_T_13 = _cache_resp_0_bits_data_T_11 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12 chipyard.TestHarness.LargeBoomConfig.fir 175542:4]
  wire [47:0] cache_resp_0_bits_data_hi_1 = _cache_resp_0_bits_data_T_8 ? _cache_resp_0_bits_data_T_13 :
    _cache_resp_0_bits_data_T_7[63:16]; // @[AMOALU.scala 42:20 chipyard.TestHarness.LargeBoomConfig.fir 175544:4]
  wire [63:0] _cache_resp_0_bits_data_T_15 = {cache_resp_0_bits_data_hi_1,cache_resp_0_bits_data_shifted_1}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 175545:4]
  wire [7:0] cache_resp_0_bits_data_shifted_2 = s2_req_0_addr[0] ? _cache_resp_0_bits_data_T_15[15:8] :
    _cache_resp_0_bits_data_T_15[7:0]; // @[AMOALU.scala 39:24 chipyard.TestHarness.LargeBoomConfig.fir 175549:4]
  wire [7:0] cache_resp_0_bits_data_lo_2 = s2_sc ? 8'h0 : cache_resp_0_bits_data_shifted_2; // @[AMOALU.scala 41:23 chipyard.TestHarness.LargeBoomConfig.fir 175551:4]
  wire  _cache_resp_0_bits_data_T_16 = s2_req_0_uop_mem_size == 2'h0; // @[AMOALU.scala 42:26 chipyard.TestHarness.LargeBoomConfig.fir 175552:4]
  wire  _cache_resp_0_bits_data_T_17 = _cache_resp_0_bits_data_T_16 | s2_sc; // @[AMOALU.scala 42:38 chipyard.TestHarness.LargeBoomConfig.fir 175553:4]
  wire  _cache_resp_0_bits_data_T_19 = s2_req_0_uop_mem_signed & cache_resp_0_bits_data_lo_2[7]; // @[AMOALU.scala 42:76 chipyard.TestHarness.LargeBoomConfig.fir 175555:4]
  wire [55:0] _cache_resp_0_bits_data_T_21 = _cache_resp_0_bits_data_T_19 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12 chipyard.TestHarness.LargeBoomConfig.fir 175557:4]
  wire [55:0] cache_resp_0_bits_data_hi_2 = _cache_resp_0_bits_data_T_17 ? _cache_resp_0_bits_data_T_21 :
    _cache_resp_0_bits_data_T_15[63:8]; // @[AMOALU.scala 42:20 chipyard.TestHarness.LargeBoomConfig.fir 175559:4]
  wire [63:0] _cache_resp_0_bits_data_T_23 = {cache_resp_0_bits_data_hi_2,cache_resp_0_bits_data_lo_2}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 175560:4]
  wire [63:0] _GEN_119 = {{63'd0}, s2_sc_fail}; // @[dcache.scala 836:52 chipyard.TestHarness.LargeBoomConfig.fir 175561:4]
  wire [63:0] cache_resp_0_bits_data = _cache_resp_0_bits_data_T_23 | _GEN_119; // @[dcache.scala 836:52 chipyard.TestHarness.LargeBoomConfig.fir 175561:4]
  wire  _mshrs_io_resp_ready_T = ~cache_resp_0_valid; // @[dcache.scala 843:26 chipyard.TestHarness.LargeBoomConfig.fir 175647:4]
  wire  uncache_resp_bits_is_hella = mshrs_io_resp_bits_is_hella; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175565:4]
  wire [63:0] uncache_resp_bits_data = mshrs_io_resp_bits_data; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175566:4]
  wire  uncache_resp_bits_uop_uses_stq = mshrs_io_resp_bits_uop_uses_stq; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175589:4]
  wire  uncache_resp_bits_uop_uses_ldq = mshrs_io_resp_bits_uop_uses_ldq; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175590:4]
  wire  resp_0_bits_uop_uses_ldq = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_uses_ldq : s2_req_0_uop_uses_ldq; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175761:6 chipyard.TestHarness.LargeBoomConfig.fir 175675:4]
  wire  uncache_resp_bits_uop_is_amo = mshrs_io_resp_bits_uop_is_amo; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175591:4]
  wire [4:0] uncache_resp_bits_uop_stq_idx = mshrs_io_resp_bits_uop_stq_idx; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175611:4]
  wire [4:0] uncache_resp_bits_uop_ldq_idx = mshrs_io_resp_bits_uop_ldq_idx; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175612:4]
  wire [15:0] uncache_resp_bits_uop_br_mask = mshrs_io_resp_bits_uop_br_mask; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 841:25 chipyard.TestHarness.LargeBoomConfig.fir 175621:4]
  wire [15:0] resp_0_bits_uop_br_mask = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_br_mask : s2_req_0_uop_br_mask; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175792:6 chipyard.TestHarness.LargeBoomConfig.fir 175706:4]
  wire  uncache_resp_valid = mshrs_io_resp_valid; // @[dcache.scala 840:26 chipyard.TestHarness.LargeBoomConfig.fir 175564:4 dcache.scala 842:25 chipyard.TestHarness.LargeBoomConfig.fir 175646:4]
  wire  resp_0_valid = _mshrs_io_resp_ready_T ? uncache_resp_valid : cache_resp_0_valid; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175817:6 chipyard.TestHarness.LargeBoomConfig.fir 175731:4]
  wire  _io_lsu_resp_0_valid_T = io_lsu_exception & resp_0_bits_uop_uses_ldq; // @[dcache.scala 857:48 chipyard.TestHarness.LargeBoomConfig.fir 175820:4]
  wire  _io_lsu_resp_0_valid_T_1 = ~_io_lsu_resp_0_valid_T; // @[dcache.scala 857:29 chipyard.TestHarness.LargeBoomConfig.fir 175821:4]
  wire  _io_lsu_resp_0_valid_T_2 = resp_0_valid & _io_lsu_resp_0_valid_T_1; // @[dcache.scala 856:43 chipyard.TestHarness.LargeBoomConfig.fir 175822:4]
  wire [15:0] _io_lsu_resp_0_valid_T_3 = io_lsu_brupdate_b1_mispredict_mask & resp_0_bits_uop_br_mask; // @[util.scala 118:51 chipyard.TestHarness.LargeBoomConfig.fir 175823:4]
  wire  _io_lsu_resp_0_valid_T_4 = _io_lsu_resp_0_valid_T_3 != 16'h0; // @[util.scala 118:59 chipyard.TestHarness.LargeBoomConfig.fir 175824:4]
  wire  _io_lsu_resp_0_valid_T_5 = ~_io_lsu_resp_0_valid_T_4; // @[dcache.scala 858:29 chipyard.TestHarness.LargeBoomConfig.fir 175825:4]
  wire  _io_lsu_nack_0_valid_T = s2_valid_REG & s2_send_nack_0; // @[dcache.scala 861:41 chipyard.TestHarness.LargeBoomConfig.fir 175994:4]
  wire  _io_lsu_nack_0_valid_T_3 = _io_lsu_nack_0_valid_T & _mshrs_io_req_0_valid_T_19; // @[dcache.scala 861:60 chipyard.TestHarness.LargeBoomConfig.fir 175997:4]
  wire  _T_123 = s2_type != 3'h4; // @[dcache.scala 865:46 chipyard.TestHarness.LargeBoomConfig.fir 176171:4]
  wire  _T_124 = io_lsu_nack_0_valid & _T_123; // @[dcache.scala 865:35 chipyard.TestHarness.LargeBoomConfig.fir 176172:4]
  wire  _T_125 = ~_T_124; // @[dcache.scala 865:12 chipyard.TestHarness.LargeBoomConfig.fir 176173:4]
  wire  _T_127 = _T_125 | reset; // @[dcache.scala 865:11 chipyard.TestHarness.LargeBoomConfig.fir 176175:4]
  wire  _T_128 = ~_T_127; // @[dcache.scala 865:11 chipyard.TestHarness.LargeBoomConfig.fir 176176:4]
  wire  _s3_valid_T_24 = _s2_nack_victim_T & s2_has_permission_c_cat_hi; // @[dcache.scala 870:51 chipyard.TestHarness.LargeBoomConfig.fir 176288:4]
  wire  _s3_valid_T_25 = ~s2_sc_fail; // @[dcache.scala 871:26 chipyard.TestHarness.LargeBoomConfig.fir 176289:4]
  wire  _s3_valid_T_26 = _s3_valid_T_24 & _s3_valid_T_25; // @[dcache.scala 870:85 chipyard.TestHarness.LargeBoomConfig.fir 176290:4]
  wire  _s3_valid_T_27 = s2_send_nack_0 & s2_nack_0; // @[dcache.scala 871:59 chipyard.TestHarness.LargeBoomConfig.fir 176291:4]
  wire  _s3_valid_T_28 = ~_s3_valid_T_27; // @[dcache.scala 871:41 chipyard.TestHarness.LargeBoomConfig.fir 176292:4]
  wire  _amoalu_io_mask_upper_T_2 = s2_req_0_uop_mem_size >= 2'h1; // @[AMOALU.scala 17:57 chipyard.TestHarness.LargeBoomConfig.fir 176494:4]
  wire  amoalu_io_mask_hi = s2_req_0_addr[0] | _amoalu_io_mask_upper_T_2; // @[AMOALU.scala 17:46 chipyard.TestHarness.LargeBoomConfig.fir 176496:4]
  wire  amoalu_io_mask_lo = s2_req_0_addr[0] ? 1'h0 : 1'h1; // @[AMOALU.scala 18:22 chipyard.TestHarness.LargeBoomConfig.fir 176498:4]
  wire [1:0] _amoalu_io_mask_T = {amoalu_io_mask_hi,amoalu_io_mask_lo}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 176499:4]
  wire [1:0] _amoalu_io_mask_upper_T_5 = s2_req_0_addr[1] ? _amoalu_io_mask_T : 2'h0; // @[AMOALU.scala 17:22 chipyard.TestHarness.LargeBoomConfig.fir 176501:4]
  wire  _amoalu_io_mask_upper_T_6 = s2_req_0_uop_mem_size >= 2'h2; // @[AMOALU.scala 17:57 chipyard.TestHarness.LargeBoomConfig.fir 176502:4]
  wire [1:0] _amoalu_io_mask_upper_T_7 = _amoalu_io_mask_upper_T_6 ? 2'h3 : 2'h0; // @[AMOALU.scala 17:51 chipyard.TestHarness.LargeBoomConfig.fir 176503:4]
  wire [1:0] amoalu_io_mask_hi_1 = _amoalu_io_mask_upper_T_5 | _amoalu_io_mask_upper_T_7; // @[AMOALU.scala 17:46 chipyard.TestHarness.LargeBoomConfig.fir 176504:4]
  wire [1:0] amoalu_io_mask_lo_1 = s2_req_0_addr[1] ? 2'h0 : _amoalu_io_mask_T; // @[AMOALU.scala 18:22 chipyard.TestHarness.LargeBoomConfig.fir 176506:4]
  wire [3:0] _amoalu_io_mask_T_1 = {amoalu_io_mask_hi_1,amoalu_io_mask_lo_1}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 176507:4]
  wire [3:0] _amoalu_io_mask_upper_T_9 = s2_req_0_addr[2] ? _amoalu_io_mask_T_1 : 4'h0; // @[AMOALU.scala 17:22 chipyard.TestHarness.LargeBoomConfig.fir 176509:4]
  wire  _amoalu_io_mask_upper_T_10 = s2_req_0_uop_mem_size >= 2'h3; // @[AMOALU.scala 17:57 chipyard.TestHarness.LargeBoomConfig.fir 176510:4]
  wire [3:0] _amoalu_io_mask_upper_T_11 = _amoalu_io_mask_upper_T_10 ? 4'hf : 4'h0; // @[AMOALU.scala 17:51 chipyard.TestHarness.LargeBoomConfig.fir 176511:4]
  wire [3:0] amoalu_io_mask_hi_2 = _amoalu_io_mask_upper_T_9 | _amoalu_io_mask_upper_T_11; // @[AMOALU.scala 17:46 chipyard.TestHarness.LargeBoomConfig.fir 176512:4]
  wire [3:0] amoalu_io_mask_lo_2 = s2_req_0_addr[2] ? 4'h0 : _amoalu_io_mask_T_1; // @[AMOALU.scala 18:22 chipyard.TestHarness.LargeBoomConfig.fir 176514:4]
  reg [7:0] s3_way; // @[dcache.scala 903:25 chipyard.TestHarness.LargeBoomConfig.fir 176521:4]
  wire  _io_lsu_ordered_T = ~s1_valid_REG; // @[dcache.scala 912:43 chipyard.TestHarness.LargeBoomConfig.fir 176531:4]
  wire  _io_lsu_ordered_T_1 = mshrs_io_fence_rdy & _io_lsu_ordered_T; // @[dcache.scala 912:40 chipyard.TestHarness.LargeBoomConfig.fir 176532:4]
  wire  _io_lsu_ordered_T_2 = ~s2_valid_REG; // @[dcache.scala 912:69 chipyard.TestHarness.LargeBoomConfig.fir 176533:4]
  


  // DecoupledIF #(.T(NBDcacheST::WriteBackReqST)) wb_io_req();
  // DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) wb_io_meta_read();
  // ValidIF #(.bits_size(6)) wb_io_idx();
  // DecoupledIF #(.T(NBDcacheST::L1DataReadReqST)) wb_io_data_req();
  // DecoupledIF #(.T(BundleST::TLBundleCST)) wb_io_release();
  // DecoupledIF #(.T(BundleST::TLBundleCST)) wb_io_lsu_release();

  // NBDcacheST::WriteBackReqST wb_io_req_bits_st;
  // NBDcacheST::L1DataReadReqST wb_io_data_req_bits_st;
  // HellaCacheST::L1MetaReadReqST wb_io_meta_read_bits_st;
  // BundleST::TLBundleCST wb_io_release_bits_st;
  // BundleST::TLBundleCST wb_io_lsu_release_bits_st;

  // assign wb_io_req_bits_st.tag = wb_io_req_bits_tag;
  // assign wb_io_req_bits_st.idx = wb_io_req_bits_idx;
  // assign wb_io_req_bits_st.param = wb_io_req_bits_param;
  // assign wb_io_req_bits_st.way_en = wb_io_req_bits_way_en;
  // assign wb_io_req_bits_st.voluntary = wb_io_req_bits_voluntary;
  // assign wb_io_req_ready = wb_io_req.ready;
  // assign wb_io_req.valid = wb_io_req_valid;
  // assign wb_io_req.bits = wb_io_req_bits_st;

  // assign wb_io_meta_read_bits_idx = wb_io_meta_read_bits_st.idx;
  // assign wb_io_meta_read_bits_tag = wb_io_meta_read_bits_st.tag;
  // assign wb_io_meta_read.ready = wb_io_meta_read_ready;
  // assign wb_io_meta_read_valid = wb_io_meta_read.valid;
  // assign wb_io_meta_read_bits_st = wb_io_meta_read.bits;


  // assign wb_io_idx_valid = wb_io_idx.valid;
  // assign wb_io_idx_bits = wb_io_idx.bits;


  // assign wb_io_data_req_bits_way_en = wb_io_data_req_bits_st.way_en;
  // assign wb_io_data_req_bits_addr = wb_io_data_req_bits_st.addr;
  // assign wb_io_data_req.ready = wb_io_data_req_ready;
  // assign wb_io_data_req_valid = wb_io_data_req.valid;
  // assign wb_io_data_req_bits_st = wb_io_data_req.bits;

  // assign wb_io_release_bits_opcode = wb_io_release_bits_st.opcode;
  // assign wb_io_release_bits_param = wb_io_release_bits_st.param;
  // assign wb_io_release_bits_address = wb_io_release_bits_st.address;
  // assign wb_io_release_bits_data = wb_io_release_bits_st.data;
  // assign wb_io_release.ready = wb_io_release_ready;
  // assign wb_io_release_valid = wb_io_release.valid;
  // assign wb_io_release_bits_st = wb_io_release.bits;

  // assign wb_io_lsu_release_bits_address = wb_io_lsu_release_bits_st.address;
  // assign wb_io_lsu_release.ready = wb_io_lsu_release_ready;
  // assign wb_io_lsu_release_valid = wb_io_lsu_release.valid;
  // assign wb_io_lsu_release_bits_st = wb_io_lsu_release.bits;

  // BoomWriteBackUnit wb(
  //   .clock(wb_clock),
  //   .reset(wb_reset),
  //   .io_req(wb_io_req),
  //   .io_meta_read(wb_io_meta_read),
  //   .io_resp(wb_io_resp),
  //   .io_idx(wb_io_idx),
  //   .io_data_req(wb_io_data_req),
  //   .io_data_resp(wb_io_data_resp),
  //   .io_mem_grant(wb_io_mem_grant),
  //   .io_release(wb_io_release),
  //   .io_lsu_release(wb_io_lsu_release)
  // );


  DecoupledIF #(.T(BundleST::TLBundleBST)) prober_io_req();
  DecoupledIF #(.T(BundleST::TLBundleCST)) prober_io_rep();
  DecoupledIF #(.T(HellaCacheST::L1MetaReadReqST)) prober_io_meta_read();
  DecoupledIF #(.T(HellaCacheST::L1MetaWriteReqST)) prober_io_meta_write();
  DecoupledIF #(.T(NBDcacheST::WriteBackReqST)) prober_io_wb_req();
  DecoupledIF #(.T(BundleST::TLBundleCST)) prober_io_lsu_release();
  ValidIF #(.bits_size(`coreMaxAddrBits)) prober_io_state();

  BundleST::TLBundleBST prober_io_req_bits_st;
  BundleST::TLBundleCST prober_io_rep_bits_st;
  HellaCacheST::L1MetaReadReqST prober_io_meta_read_bits_st;
  HellaCacheST::L1MetaWriteReqST prober_io_meta_write_bits_st;
  NBDcacheST::WriteBackReqST prober_io_wb_req_bits_st;
  BundleST::TLBundleCST prober_io_lsu_release_bits_st;


  assign prober_io_req_ready = prober_io_req.ready;
  assign prober_io_req.valid = prober_io_req_valid;
  assign prober_io_req.bits = prober_io_req_bits_st;
  assign prober_io_req_bits_st.param = prober_io_req_bits_param;
  assign prober_io_req_bits_st.size = prober_io_req_bits_size;
  assign prober_io_req_bits_st.source = prober_io_req_bits_source;
  assign prober_io_req_bits_st.address = prober_io_req_bits_address;

  assign prober_io_rep.ready = prober_io_rep_ready;
  assign prober_io_rep_valid = prober_io_rep.valid;
  assign prober_io_rep_bits_st = prober_io_rep.bits;
  assign prober_io_rep_bits_opcode = prober_io_rep_bits_st.opcode;
  assign prober_io_rep_bits_param = prober_io_rep_bits_st.param;
  assign prober_io_rep_bits_size = prober_io_rep_bits_st.size;
  assign prober_io_rep_bits_source = prober_io_rep_bits_st.source;
  assign prober_io_rep_bits_address = prober_io_rep_bits_st.address;

  assign prober_io_meta_read.ready = prober_io_meta_read_ready;
  assign prober_io_meta_read_valid = prober_io_meta_read.valid;
  assign prober_io_meta_read_bits_st = prober_io_meta_read.bits;
  assign prober_io_meta_read_bits_idx = prober_io_meta_read_bits_st.idx;
  assign prober_io_meta_read_bits_tag = prober_io_meta_read_bits_st.tag;

  assign prober_io_meta_write.ready = prober_io_meta_write_ready;
  assign prober_io_meta_write_valid = prober_io_meta_write.valid;
  assign prober_io_meta_write_bits_st = prober_io_meta_write.bits;
  assign prober_io_meta_write_bits_idx = prober_io_meta_write_bits_st.idx;
  assign prober_io_meta_write_bits_way_en = prober_io_meta_write_bits_st.way_en;
  assign prober_io_meta_write_bits_data_coh_state = prober_io_meta_write_bits_st.data.coh;
  assign prober_io_meta_write_bits_data_tag= prober_io_meta_write_bits_st.data.tag;

  assign prober_io_wb_req.ready = prober_io_wb_req_ready;
  assign prober_io_wb_req_valid = prober_io_wb_req.valid;
  assign prober_io_wb_req_bits_st = prober_io_wb_req.bits;
  assign prober_io_wb_req_bits_tag = prober_io_wb_req_bits_st.tag;
  assign prober_io_wb_req_bits_idx = prober_io_wb_req_bits_st.idx;
  assign prober_io_wb_req_bits_param = prober_io_wb_req_bits_st.param;
  assign prober_io_wb_req_bits_way_en = prober_io_wb_req_bits_st.way_en;

  assign prober_io_lsu_release.ready = prober_io_lsu_release_ready;
  assign prober_io_lsu_release_valid = prober_io_lsu_release.valid;
  assign prober_io_lsu_release_bits_st = prober_io_lsu_release.bits;
  assign prober_io_lsu_release_bits_address = prober_io_lsu_release_bits_st.address;

  assign prober_io_state_valid = prober_io_state.valid;
  assign prober_io_state_bits = prober_io_state.bits;

  BoomProbeUnit prober(
    .clock(prober_clock),
    .reset(prober_reset),
    .io_req(prober_io_req),
    .io_rep(prober_io_rep),
    .io_meta_read(prober_io_meta_read),
    .io_meta_write(prober_io_meta_write),
    .io_wb_req(prober_io_wb_req),
    .io_way_en(prober_io_way_en),
    .io_wb_rdy(prober_io_wb_rdy),
    .io_mshr_rdy(prober_io_mshr_rdy),
    .io_mshr_wb_rdy(prober_io_mshr_wb_rdy),
    .io_block_state(prober_io_block_state_state),
    .io_lsu_release(prober_io_lsu_release),
    .io_state(prober_io_state)
  );

//  BoomWritebackUnit wb ( // @[dcache.scala 430:18 chipyard.TestHarness.LargeBoomConfig.fir 172138:4]
//     .clock(wb_clock),
//     .reset(wb_reset),
//     .io_req_ready(wb_io_req_ready),
//     .io_req_valid(wb_io_req_valid),
//     .io_req_bits_tag(wb_io_req_bits_tag),
//     .io_req_bits_idx(wb_io_req_bits_idx),
//     .io_req_bits_param(wb_io_req_bits_param),
//     .io_req_bits_way_en(wb_io_req_bits_way_en),
//     .io_req_bits_voluntary(wb_io_req_bits_voluntary),
//     .io_meta_read_ready(wb_io_meta_read_ready),
//     .io_meta_read_valid(wb_io_meta_read_valid),
//     .io_meta_read_bits_idx(wb_io_meta_read_bits_idx),
//     .io_meta_read_bits_tag(wb_io_meta_read_bits_tag),
//     .io_resp(wb_io_resp),
//     .io_idx_valid(wb_io_idx_valid),
//     .io_idx_bits(wb_io_idx_bits),
//     .io_data_req_ready(wb_io_data_req_ready),
//     .io_data_req_valid(wb_io_data_req_valid),
//     .io_data_req_bits_way_en(wb_io_data_req_bits_way_en),
//     .io_data_req_bits_addr(wb_io_data_req_bits_addr),
//     .io_data_resp(wb_io_data_resp),
//     .io_mem_grant(wb_io_mem_grant),
//     .io_release_ready(wb_io_release_ready),
//     .io_release_valid(wb_io_release_valid),
//     .io_release_bits_opcode(wb_io_release_bits_opcode),
//     .io_release_bits_param(wb_io_release_bits_param),
//     .io_release_bits_address(wb_io_release_bits_address),
//     .io_release_bits_data(wb_io_release_bits_data),
//     .io_lsu_release_ready(wb_io_lsu_release_ready),
//     .io_lsu_release_valid(wb_io_lsu_release_valid),
//     .io_lsu_release_bits_address(wb_io_lsu_release_bits_address)
//   );

  BoomMSHRFile mshrs ( // @[dcache.scala 432:21 chipyard.TestHarness.LargeBoomConfig.fir 172144:4]
    .clock(mshrs_clock),
    .reset(mshrs_reset),
    .io_req_0_ready(mshrs_io_req_0_ready),
    .io_req_0_valid(mshrs_io_req_0_valid),
    .io_req_0_bits_uop_br_mask(mshrs_io_req_0_bits_uop_br_mask),
    .io_req_0_bits_uop_ldq_idx(mshrs_io_req_0_bits_uop_ldq_idx),
    .io_req_0_bits_uop_stq_idx(mshrs_io_req_0_bits_uop_stq_idx),
    .io_req_0_bits_uop_mem_cmd(mshrs_io_req_0_bits_uop_mem_cmd),
    .io_req_0_bits_uop_mem_size(mshrs_io_req_0_bits_uop_mem_size),
    .io_req_0_bits_uop_mem_signed(mshrs_io_req_0_bits_uop_mem_signed),
    .io_req_0_bits_uop_is_amo(mshrs_io_req_0_bits_uop_is_amo),
    .io_req_0_bits_uop_uses_ldq(mshrs_io_req_0_bits_uop_uses_ldq),
    .io_req_0_bits_uop_uses_stq(mshrs_io_req_0_bits_uop_uses_stq),
    .io_req_0_bits_addr(mshrs_io_req_0_bits_addr),
    .io_req_0_bits_data(mshrs_io_req_0_bits_data),
    .io_req_0_bits_is_hella(mshrs_io_req_0_bits_is_hella),
    .io_req_0_bits_tag_match(mshrs_io_req_0_bits_tag_match),
    .io_req_0_bits_old_meta_coh_state(mshrs_io_req_0_bits_old_meta_coh_state),
    .io_req_0_bits_old_meta_tag(mshrs_io_req_0_bits_old_meta_tag),
    .io_req_0_bits_way_en(mshrs_io_req_0_bits_way_en),
    .io_req_is_probe_0(mshrs_io_req_is_probe_0),
    .io_resp_ready(mshrs_io_resp_ready),
    .io_resp_valid(mshrs_io_resp_valid),
    .io_resp_bits_uop_br_mask(mshrs_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx(mshrs_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo(mshrs_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data(mshrs_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_io_resp_bits_is_hella),
    .io_secondary_miss_0(mshrs_io_secondary_miss_0),
    .io_block_hit_0(mshrs_io_block_hit_0),
    .io_brupdate_b1_resolve_mask(mshrs_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_io_brupdate_b1_mispredict_mask),
    .io_exception(mshrs_io_exception),
    .io_mem_acquire_ready(mshrs_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_io_mem_acquire_valid),
    .io_mem_acquire_bits_opcode(mshrs_io_mem_acquire_bits_opcode),
    .io_mem_acquire_bits_param(mshrs_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_size(mshrs_io_mem_acquire_bits_size),
    .io_mem_acquire_bits_source(mshrs_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_io_mem_acquire_bits_address),
    .io_mem_acquire_bits_mask(mshrs_io_mem_acquire_bits_mask),
    .io_mem_acquire_bits_data(mshrs_io_mem_acquire_bits_data),
    .io_mem_grant_ready(mshrs_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_io_mem_grant_bits_size),
    .io_mem_grant_bits_source(mshrs_io_mem_grant_bits_source),
    .io_mem_grant_bits_sink(mshrs_io_mem_grant_bits_sink),
    .io_mem_grant_bits_data(mshrs_io_mem_grant_bits_data),
    .io_mem_finish_ready(mshrs_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_io_mem_finish_bits_sink),
    .io_refill_ready(mshrs_io_refill_ready),
    .io_refill_valid(mshrs_io_refill_valid),
    .io_refill_bits_way_en(mshrs_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_io_refill_bits_addr),
    .io_refill_bits_data(mshrs_io_refill_bits_data),
    .io_meta_write_ready(mshrs_io_meta_write_ready),
    .io_meta_write_valid(mshrs_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state(mshrs_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_io_meta_read_ready),
    .io_meta_read_valid(mshrs_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_io_meta_resp_bits_coh_state),
    .io_replay_ready(mshrs_io_replay_ready),
    .io_replay_valid(mshrs_io_replay_valid),
    .io_replay_bits_uop_br_mask(mshrs_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_ldq_idx(mshrs_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_mem_cmd(mshrs_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_amo(mshrs_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_io_replay_bits_uop_uses_stq),
    .io_replay_bits_addr(mshrs_io_replay_bits_addr),
    .io_replay_bits_data(mshrs_io_replay_bits_data),
    .io_replay_bits_is_hella(mshrs_io_replay_bits_is_hella),
    .io_replay_bits_way_en(mshrs_io_replay_bits_way_en),
    .io_wb_req_ready(mshrs_io_wb_req_ready),
    .io_wb_req_valid(mshrs_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_io_wb_req_bits_idx),
    .io_wb_req_bits_param(mshrs_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_io_wb_req_bits_way_en),
    .io_prober_state_valid(mshrs_io_prober_state_valid),
    .io_prober_state_bits(mshrs_io_prober_state_bits),
    .io_clear_all(mshrs_io_clear_all),
    .io_wb_resp(mshrs_io_wb_resp),
    .io_fence_rdy(mshrs_io_fence_rdy),
    .io_probe_rdy(mshrs_io_probe_rdy)
  );
  L1MetadataArray meta_0 ( // @[dcache.scala 441:41 chipyard.TestHarness.LargeBoomConfig.fir 172239:4]
    .clock(meta_0_clock),
    .reset(meta_0_reset),
    .io_read_ready(meta_0_io_read_ready),
    .io_read_valid(meta_0_io_read_valid),
    .io_read_bits_idx(meta_0_io_read_bits_idx),
    .io_write_ready(meta_0_io_write_ready),
    .io_write_valid(meta_0_io_write_valid),
    .io_write_bits_idx(meta_0_io_write_bits_idx),
    .io_write_bits_way_en(meta_0_io_write_bits_way_en),
    .io_write_bits_data_coh_state(meta_0_io_write_bits_data_coh_state),
    .io_write_bits_data_tag(meta_0_io_write_bits_data_tag),
    .io_resp_0_coh_state(meta_0_io_resp_0_coh_state),
    .io_resp_0_tag(meta_0_io_resp_0_tag),
    .io_resp_1_coh_state(meta_0_io_resp_1_coh_state),
    .io_resp_1_tag(meta_0_io_resp_1_tag),
    .io_resp_2_coh_state(meta_0_io_resp_2_coh_state),
    .io_resp_2_tag(meta_0_io_resp_2_tag),
    .io_resp_3_coh_state(meta_0_io_resp_3_coh_state),
    .io_resp_3_tag(meta_0_io_resp_3_tag),
    .io_resp_4_coh_state(meta_0_io_resp_4_coh_state),
    .io_resp_4_tag(meta_0_io_resp_4_tag),
    .io_resp_5_coh_state(meta_0_io_resp_5_coh_state),
    .io_resp_5_tag(meta_0_io_resp_5_tag),
    .io_resp_6_coh_state(meta_0_io_resp_6_coh_state),
    .io_resp_6_tag(meta_0_io_resp_6_tag),
    .io_resp_7_coh_state(meta_0_io_resp_7_coh_state),
    .io_resp_7_tag(meta_0_io_resp_7_tag)
  );
  Arbiter_9 metaWriteArb ( // @[dcache.scala 442:28 chipyard.TestHarness.LargeBoomConfig.fir 172242:4]
    .io_in_0_ready(metaWriteArb_io_in_0_ready),
    .io_in_0_valid(metaWriteArb_io_in_0_valid),
    .io_in_0_bits_idx(metaWriteArb_io_in_0_bits_idx),
    .io_in_0_bits_way_en(metaWriteArb_io_in_0_bits_way_en),
    .io_in_0_bits_data_coh_state(metaWriteArb_io_in_0_bits_data_coh_state),
    .io_in_0_bits_data_tag(metaWriteArb_io_in_0_bits_data_tag),
    .io_in_1_ready(metaWriteArb_io_in_1_ready),
    .io_in_1_valid(metaWriteArb_io_in_1_valid),
    .io_in_1_bits_idx(metaWriteArb_io_in_1_bits_idx),
    .io_in_1_bits_way_en(metaWriteArb_io_in_1_bits_way_en),
    .io_in_1_bits_data_coh_state(metaWriteArb_io_in_1_bits_data_coh_state),
    .io_in_1_bits_data_tag(metaWriteArb_io_in_1_bits_data_tag),
    .io_out_ready(metaWriteArb_io_out_ready),
    .io_out_valid(metaWriteArb_io_out_valid),
    .io_out_bits_idx(metaWriteArb_io_out_bits_idx),
    .io_out_bits_way_en(metaWriteArb_io_out_bits_way_en),
    .io_out_bits_data_coh_state(metaWriteArb_io_out_bits_data_coh_state),
    .io_out_bits_data_tag(metaWriteArb_io_out_bits_data_tag)
  );
  Arbiter_10 metaReadArb ( // @[dcache.scala 444:27 chipyard.TestHarness.LargeBoomConfig.fir 172245:4]
    .io_in_0_ready(metaReadArb_io_in_0_ready),
    .io_in_0_valid(metaReadArb_io_in_0_valid),
    .io_in_0_bits_req_0_idx(metaReadArb_io_in_0_bits_req_0_idx),
    .io_in_1_ready(metaReadArb_io_in_1_ready),
    .io_in_1_valid(metaReadArb_io_in_1_valid),
    .io_in_1_bits_req_0_idx(metaReadArb_io_in_1_bits_req_0_idx),
    .io_in_2_ready(metaReadArb_io_in_2_ready),
    .io_in_2_valid(metaReadArb_io_in_2_valid),
    .io_in_2_bits_req_0_idx(metaReadArb_io_in_2_bits_req_0_idx),
    .io_in_3_ready(metaReadArb_io_in_3_ready),
    .io_in_3_valid(metaReadArb_io_in_3_valid),
    .io_in_3_bits_req_0_idx(metaReadArb_io_in_3_bits_req_0_idx),
    .io_in_4_ready(metaReadArb_io_in_4_ready),
    .io_in_4_valid(metaReadArb_io_in_4_valid),
    .io_in_4_bits_req_0_idx(metaReadArb_io_in_4_bits_req_0_idx),
    .io_out_ready(metaReadArb_io_out_ready),
    .io_out_valid(metaReadArb_io_out_valid),
    .io_out_bits_req_0_idx(metaReadArb_io_out_bits_req_0_idx)
  );
  BoomDuplicatedDataArray data ( // @[dcache.scala 459:20 chipyard.TestHarness.LargeBoomConfig.fir 172291:4]
    .clock(data_clock),
    .io_read_0_valid(data_io_read_0_valid),
    .io_read_0_bits_way_en(data_io_read_0_bits_way_en),
    .io_read_0_bits_addr(data_io_read_0_bits_addr),
    .io_write_valid(data_io_write_valid),
    .io_write_bits_way_en(data_io_write_bits_way_en),
    .io_write_bits_addr(data_io_write_bits_addr),
    .io_write_bits_wmask(data_io_write_bits_wmask),
    .io_write_bits_data(data_io_write_bits_data),
    .io_resp_0_0(data_io_resp_0_0),
    .io_resp_0_1(data_io_resp_0_1),
    .io_resp_0_2(data_io_resp_0_2),
    .io_resp_0_3(data_io_resp_0_3),
    .io_resp_0_4(data_io_resp_0_4),
    .io_resp_0_5(data_io_resp_0_5),
    .io_resp_0_6(data_io_resp_0_6),
    .io_resp_0_7(data_io_resp_0_7)
  );
  Arbiter_11 dataWriteArb ( // @[dcache.scala 460:28 chipyard.TestHarness.LargeBoomConfig.fir 172294:4]
    .io_in_0_valid(dataWriteArb_io_in_0_valid),
    .io_in_0_bits_way_en(dataWriteArb_io_in_0_bits_way_en),
    .io_in_0_bits_addr(dataWriteArb_io_in_0_bits_addr),
    .io_in_0_bits_wmask(dataWriteArb_io_in_0_bits_wmask),
    .io_in_0_bits_data(dataWriteArb_io_in_0_bits_data),
    .io_in_1_ready(dataWriteArb_io_in_1_ready),
    .io_in_1_valid(dataWriteArb_io_in_1_valid),
    .io_in_1_bits_way_en(dataWriteArb_io_in_1_bits_way_en),
    .io_in_1_bits_addr(dataWriteArb_io_in_1_bits_addr),
    .io_in_1_bits_data(dataWriteArb_io_in_1_bits_data),
    .io_out_ready(dataWriteArb_io_out_ready),
    .io_out_valid(dataWriteArb_io_out_valid),
    .io_out_bits_way_en(dataWriteArb_io_out_bits_way_en),
    .io_out_bits_addr(dataWriteArb_io_out_bits_addr),
    .io_out_bits_wmask(dataWriteArb_io_out_bits_wmask),
    .io_out_bits_data(dataWriteArb_io_out_bits_data)
  );
  Arbiter_12 dataReadArb ( // @[dcache.scala 462:27 chipyard.TestHarness.LargeBoomConfig.fir 172297:4]
    .io_in_0_valid(dataReadArb_io_in_0_valid),
    .io_in_0_bits_req_0_way_en(dataReadArb_io_in_0_bits_req_0_way_en),
    .io_in_0_bits_req_0_addr(dataReadArb_io_in_0_bits_req_0_addr),
    .io_in_1_ready(dataReadArb_io_in_1_ready),
    .io_in_1_valid(dataReadArb_io_in_1_valid),
    .io_in_1_bits_req_0_way_en(dataReadArb_io_in_1_bits_req_0_way_en),
    .io_in_1_bits_req_0_addr(dataReadArb_io_in_1_bits_req_0_addr),
    .io_in_2_ready(dataReadArb_io_in_2_ready),
    .io_in_2_valid(dataReadArb_io_in_2_valid),
    .io_in_2_bits_req_0_addr(dataReadArb_io_in_2_bits_req_0_addr),
    .io_in_2_bits_valid_0(dataReadArb_io_in_2_bits_valid_0),
    .io_out_valid(dataReadArb_io_out_valid),
    .io_out_bits_req_0_way_en(dataReadArb_io_out_bits_req_0_way_en),
    .io_out_bits_req_0_addr(dataReadArb_io_out_bits_req_0_addr),
    .io_out_bits_valid_0(dataReadArb_io_out_bits_valid_0)
  );
  MaxPeriodFibonacciLFSR_1 lfsr_prng ( // @[PRNG.scala 82:22 chipyard.TestHarness.LargeBoomConfig.fir 174498:4]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15)
  );
  Arbiter_13 wbArb ( // @[dcache.scala 804:21 chipyard.TestHarness.LargeBoomConfig.fir 175135:4]
    .io_in_0_ready(wbArb_io_in_0_ready),
    .io_in_0_valid(wbArb_io_in_0_valid),
    .io_in_0_bits_tag(wbArb_io_in_0_bits_tag),
    .io_in_0_bits_idx(wbArb_io_in_0_bits_idx),
    .io_in_0_bits_param(wbArb_io_in_0_bits_param),
    .io_in_0_bits_way_en(wbArb_io_in_0_bits_way_en),
    .io_in_1_ready(wbArb_io_in_1_ready),
    .io_in_1_valid(wbArb_io_in_1_valid),
    .io_in_1_bits_tag(wbArb_io_in_1_bits_tag),
    .io_in_1_bits_idx(wbArb_io_in_1_bits_idx),
    .io_in_1_bits_param(wbArb_io_in_1_bits_param),
    .io_in_1_bits_way_en(wbArb_io_in_1_bits_way_en),
    .io_out_ready(wbArb_io_out_ready),
    .io_out_valid(wbArb_io_out_valid),
    .io_out_bits_tag(wbArb_io_out_bits_tag),
    .io_out_bits_idx(wbArb_io_out_bits_idx),
    .io_out_bits_param(wbArb_io_out_bits_param),
    .io_out_bits_way_en(wbArb_io_out_bits_way_en),
    .io_out_bits_voluntary(wbArb_io_out_bits_voluntary)
  );
  Arbiter_14 lsu_release_arb ( // @[dcache.scala 813:31 chipyard.TestHarness.LargeBoomConfig.fir 175153:4]
    .io_in_0_ready(lsu_release_arb_io_in_0_ready),
    .io_in_0_valid(lsu_release_arb_io_in_0_valid),
    .io_in_0_bits_address(lsu_release_arb_io_in_0_bits_address),
    .io_in_1_ready(lsu_release_arb_io_in_1_ready),
    .io_in_1_valid(lsu_release_arb_io_in_1_valid),
    .io_in_1_bits_address(lsu_release_arb_io_in_1_bits_address),
    .io_out_ready(lsu_release_arb_io_out_ready),
    .io_out_valid(lsu_release_arb_io_out_valid),
    .io_out_bits_address(lsu_release_arb_io_out_bits_address)
  );
  AMOALU amoalu ( // @[dcache.scala 895:24 chipyard.TestHarness.LargeBoomConfig.fir 176488:4]
    .io_mask(amoalu_io_mask),
    .io_cmd(amoalu_io_cmd),
    .io_lhs(amoalu_io_lhs),
    .io_rhs(amoalu_io_rhs),
    .io_out(amoalu_io_out)
  );
  assign auto_out_a_valid = mshrs_io_mem_acquire_valid; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175080:4]
  assign auto_out_a_bits_opcode = mshrs_io_mem_acquire_bits_opcode; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_a_bits_param = mshrs_io_mem_acquire_bits_param; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_a_bits_size = mshrs_io_mem_acquire_bits_size; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_a_bits_source = mshrs_io_mem_acquire_bits_source; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_a_bits_address = mshrs_io_mem_acquire_bits_address; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_a_bits_mask = mshrs_io_mem_acquire_bits_mask; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_a_bits_data = mshrs_io_mem_acquire_bits_data; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 774:12 chipyard.TestHarness.LargeBoomConfig.fir 175079:4]
  assign auto_out_b_ready = prober_io_req_ready & _prober_io_req_valid_T; // @[dcache.scala 778:48 chipyard.TestHarness.LargeBoomConfig.fir 175086:4]
  assign auto_out_c_valid = idle ? _T_87 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29 chipyard.TestHarness.LargeBoomConfig.fir 175299:4]
  assign auto_out_c_bits_opcode = _T_119 | _T_120; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175348:4]
  assign auto_out_c_bits_param = _T_116 | _T_117; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175342:4]
  assign auto_out_c_bits_size = _T_113 | _T_114; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175336:4]
  assign auto_out_c_bits_source = _T_110 | _T_111; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175330:4]
  assign auto_out_c_bits_address = _T_107 | _T_108; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175324:4]
  assign auto_out_c_bits_data = muxStateEarly_0 ? out_bits_data : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175314:4]
  assign auto_out_d_ready = _T_74 | mshrs_io_mem_grant_ready; // @[dcache.scala 788:48 chipyard.TestHarness.LargeBoomConfig.fir 175109:4 dcache.scala 790:20 chipyard.TestHarness.LargeBoomConfig.fir 175110:6 dcache.scala 795:24 chipyard.TestHarness.LargeBoomConfig.fir 175124:6]
  assign auto_out_e_valid = mshrs_io_mem_finish_valid; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 801:12 chipyard.TestHarness.LargeBoomConfig.fir 175133:4]
  assign auto_out_e_bits_sink = mshrs_io_mem_finish_bits_sink; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 dcache.scala 801:12 chipyard.TestHarness.LargeBoomConfig.fir 175132:4]
  assign io_lsu_req_ready = metaReadArb_io_in_4_ready & dataReadArb_io_in_2_ready; // @[dcache.scala 479:50 chipyard.TestHarness.LargeBoomConfig.fir 172327:4]
  assign io_lsu_resp_0_valid = _io_lsu_resp_0_valid_T_2 & _io_lsu_resp_0_valid_T_5; // @[dcache.scala 857:78 chipyard.TestHarness.LargeBoomConfig.fir 175826:4]
  assign io_lsu_resp_0_bits_uop_ldq_idx = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_ldq_idx : s2_req_0_uop_ldq_idx; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175783:6 chipyard.TestHarness.LargeBoomConfig.fir 175697:4]
  assign io_lsu_resp_0_bits_uop_stq_idx = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_stq_idx : s2_req_0_uop_stq_idx; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175782:6 chipyard.TestHarness.LargeBoomConfig.fir 175696:4]
  assign io_lsu_resp_0_bits_uop_is_amo = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_is_amo : s2_req_0_uop_is_amo; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175762:6 chipyard.TestHarness.LargeBoomConfig.fir 175676:4]
  assign io_lsu_resp_0_bits_uop_uses_ldq = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_uses_ldq :
    s2_req_0_uop_uses_ldq; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175761:6 chipyard.TestHarness.LargeBoomConfig.fir 175675:4]
  assign io_lsu_resp_0_bits_uop_uses_stq = _mshrs_io_resp_ready_T ? uncache_resp_bits_uop_uses_stq :
    s2_req_0_uop_uses_stq; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175760:6 chipyard.TestHarness.LargeBoomConfig.fir 175674:4]
  assign io_lsu_resp_0_bits_data = _mshrs_io_resp_ready_T ? uncache_resp_bits_data : cache_resp_0_bits_data; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175737:6 chipyard.TestHarness.LargeBoomConfig.fir 175651:4]
  assign io_lsu_resp_0_bits_is_hella = _mshrs_io_resp_ready_T ? uncache_resp_bits_is_hella : s2_req_0_is_hella; // @[dcache.scala 849:28 chipyard.TestHarness.LargeBoomConfig.fir 175735:4 dcache.scala 850:15 chipyard.TestHarness.LargeBoomConfig.fir 175736:6 chipyard.TestHarness.LargeBoomConfig.fir 175650:4]
  assign io_lsu_nack_0_valid = _io_lsu_nack_0_valid_T_3 & _mshrs_io_req_0_valid_T_16; // @[dcache.scala 862:75 chipyard.TestHarness.LargeBoomConfig.fir 176001:4]
  assign io_lsu_nack_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx; // @[chipyard.TestHarness.LargeBoomConfig.fir 176003:4 chipyard.TestHarness.LargeBoomConfig.fir 176052:4]
  assign io_lsu_nack_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx; // @[chipyard.TestHarness.LargeBoomConfig.fir 176003:4 chipyard.TestHarness.LargeBoomConfig.fir 176051:4]
  assign io_lsu_nack_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq; // @[chipyard.TestHarness.LargeBoomConfig.fir 176003:4 chipyard.TestHarness.LargeBoomConfig.fir 176030:4]
  assign io_lsu_nack_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq; // @[chipyard.TestHarness.LargeBoomConfig.fir 176003:4 chipyard.TestHarness.LargeBoomConfig.fir 176029:4]
  assign io_lsu_nack_0_bits_is_hella = s2_req_0_is_hella; // @[chipyard.TestHarness.LargeBoomConfig.fir 176003:4 chipyard.TestHarness.LargeBoomConfig.fir 176004:4]
  assign io_lsu_release_valid = lsu_release_arb_io_out_valid; // @[dcache.scala 814:18 chipyard.TestHarness.LargeBoomConfig.fir 175157:4]
  assign io_lsu_release_bits_address = lsu_release_arb_io_out_bits_address; // @[dcache.scala 814:18 chipyard.TestHarness.LargeBoomConfig.fir 175156:4]
  assign io_lsu_ordered = _io_lsu_ordered_T_1 & _io_lsu_ordered_T_2; // @[dcache.scala 912:66 chipyard.TestHarness.LargeBoomConfig.fir 176534:4]
  assign wb_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 172139:4]
  assign wb_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 172140:4]
  assign wb_io_req_valid = wbArb_io_out_valid; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175145:4]
  assign wb_io_req_bits_tag = wbArb_io_out_bits_tag; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175144:4]
  assign wb_io_req_bits_idx = wbArb_io_out_bits_idx; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175144:4]
  assign wb_io_req_bits_param = wbArb_io_out_bits_param; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175144:4]
  assign wb_io_req_bits_way_en = wbArb_io_out_bits_way_en; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175144:4]
  assign wb_io_req_bits_voluntary = wbArb_io_out_bits_voluntary; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175144:4]
  assign wb_io_meta_read_ready = metaReadArb_io_in_2_ready & dataReadArb_io_in_1_ready; // @[dcache.scala 541:55 chipyard.TestHarness.LargeBoomConfig.fir 173088:4]
  assign wb_io_data_req_ready = metaReadArb_io_in_2_ready & dataReadArb_io_in_1_ready; // @[dcache.scala 546:55 chipyard.TestHarness.LargeBoomConfig.fir 173096:4]
  assign wb_io_data_resp = _s2_data_muxed_T_21 | _s2_data_muxed_T_15; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174488:4]
  assign wb_io_mem_grant = _wb_io_mem_grant_T & _T_74; // @[dcache.scala 811:44 chipyard.TestHarness.LargeBoomConfig.fir 175151:4]
  assign wb_io_release_ready = auto_out_c_ready & allowed_0; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 175289:4]
  assign wb_io_lsu_release_ready = lsu_release_arb_io_in_0_ready; // @[dcache.scala 815:28 chipyard.TestHarness.LargeBoomConfig.fir 175161:4]
  assign prober_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 172142:4]
  assign prober_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 172143:4]
  assign prober_io_req_valid = auto_out_b_valid & _prober_io_req_valid_T; // @[dcache.scala 777:43 chipyard.TestHarness.LargeBoomConfig.fir 175083:4]
  assign prober_io_req_bits_param = auto_out_b_bits_param; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign prober_io_req_bits_size = auto_out_b_bits_size; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign prober_io_req_bits_source = auto_out_b_bits_source; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign prober_io_req_bits_address = auto_out_b_bits_address; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign prober_io_rep_ready = auto_out_c_ready & allowed_1; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 175291:4]
  assign prober_io_meta_read_ready = metaReadArb_io_in_1_ready; // @[dcache.scala 561:29 chipyard.TestHarness.LargeBoomConfig.fir 173394:4]
  assign prober_io_meta_write_ready = metaWriteArb_io_in_1_ready; // @[dcache.scala 782:25 chipyard.TestHarness.LargeBoomConfig.fir 175100:4]
  assign prober_io_wb_req_ready = wbArb_io_in_0_ready; // @[dcache.scala 806:24 chipyard.TestHarness.LargeBoomConfig.fir 175140:4]
  assign prober_io_way_en = s2_tag_match_way_0; // @[dcache.scala 780:25 chipyard.TestHarness.LargeBoomConfig.fir 175096:4]
  assign prober_io_wb_rdy = _prober_io_wb_rdy_T | _prober_io_wb_rdy_T_1; // @[dcache.scala 784:79 chipyard.TestHarness.LargeBoomConfig.fir 175104:4]
  assign prober_io_mshr_rdy = mshrs_io_probe_rdy; // @[dcache.scala 783:25 chipyard.TestHarness.LargeBoomConfig.fir 175101:4]
  assign prober_io_block_state_state = _s2_hit_state_T_21 | _s2_hit_state_T_15; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174088:4]
  assign prober_io_lsu_release_ready = lsu_release_arb_io_in_1_ready; // @[dcache.scala 816:28 chipyard.TestHarness.LargeBoomConfig.fir 175164:4]
  assign mshrs_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 172145:4]
  assign mshrs_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 172146:4]
  assign mshrs_io_req_0_valid = _mshrs_io_req_0_valid_T_20 & _mshrs_io_req_0_valid_T_71; // @[dcache.scala 753:77 chipyard.TestHarness.LargeBoomConfig.fir 174809:4]
  assign mshrs_io_req_0_bits_uop_br_mask = s2_req_0_uop_br_mask & _s1_req_0_uop_br_mask_T; // @[util.scala 85:25 chipyard.TestHarness.LargeBoomConfig.fir 174988:4]
  assign mshrs_io_req_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174953:4]
  assign mshrs_io_req_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174952:4]
  assign mshrs_io_req_0_bits_uop_mem_cmd = s2_req_0_uop_mem_cmd; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174937:4]
  assign mshrs_io_req_0_bits_uop_mem_size = s2_req_0_uop_mem_size; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174936:4]
  assign mshrs_io_req_0_bits_uop_mem_signed = s2_req_0_uop_mem_signed; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174935:4]
  assign mshrs_io_req_0_bits_uop_is_amo = s2_req_0_uop_is_amo; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174932:4]
  assign mshrs_io_req_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174931:4]
  assign mshrs_io_req_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq; // @[dcache.scala 759:38 chipyard.TestHarness.LargeBoomConfig.fir 174930:4]
  assign mshrs_io_req_0_bits_addr = s2_req_0_addr; // @[dcache.scala 761:38 chipyard.TestHarness.LargeBoomConfig.fir 174990:4]
  assign mshrs_io_req_0_bits_data = s2_req_0_data; // @[dcache.scala 766:38 chipyard.TestHarness.LargeBoomConfig.fir 175001:4]
  assign mshrs_io_req_0_bits_is_hella = s2_req_0_is_hella; // @[dcache.scala 767:38 chipyard.TestHarness.LargeBoomConfig.fir 175002:4]
  assign mshrs_io_req_0_bits_tag_match = |s2_tag_match_way_0; // @[dcache.scala 643:49 chipyard.TestHarness.LargeBoomConfig.fir 174039:4]
  assign mshrs_io_req_0_bits_old_meta_coh_state = s2_tag_match_0 ? s2_hit_state_0_state : s2_repl_meta_0_coh_state; // @[dcache.scala 763:44 chipyard.TestHarness.LargeBoomConfig.fir 174996:4]
  assign mshrs_io_req_0_bits_old_meta_tag = _s2_repl_meta_T_21 | _s2_repl_meta_T_15; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 174604:4]
  assign mshrs_io_req_0_bits_way_en = s2_tag_match_0 ? s2_tag_match_way_0 : s2_replaced_way_en; // @[dcache.scala 764:44 chipyard.TestHarness.LargeBoomConfig.fir 174999:4]
  assign mshrs_io_req_is_probe_0 = _mshrs_io_req_is_probe_0_T & s2_valid_REG; // @[dcache.scala 768:61 chipyard.TestHarness.LargeBoomConfig.fir 175004:4]
  assign mshrs_io_resp_ready = ~cache_resp_0_valid; // @[dcache.scala 843:26 chipyard.TestHarness.LargeBoomConfig.fir 175647:4]
  assign mshrs_io_brupdate_b1_resolve_mask = io_lsu_brupdate_b1_resolve_mask; // @[dcache.scala 434:27 chipyard.TestHarness.LargeBoomConfig.fir 172235:4]
  assign mshrs_io_brupdate_b1_mispredict_mask = io_lsu_brupdate_b1_mispredict_mask; // @[dcache.scala 434:27 chipyard.TestHarness.LargeBoomConfig.fir 172234:4]
  assign mshrs_io_exception = io_lsu_exception; // @[dcache.scala 435:25 chipyard.TestHarness.LargeBoomConfig.fir 172236:4]
  assign mshrs_io_mem_acquire_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_grant_valid = _T_74 ? 1'h0 : auto_out_d_valid; // @[dcache.scala 788:48 chipyard.TestHarness.LargeBoomConfig.fir 175109:4 dcache.scala 791:30 chipyard.TestHarness.LargeBoomConfig.fir 175111:6 dcache.scala 795:24 chipyard.TestHarness.LargeBoomConfig.fir 175123:6]
  assign mshrs_io_mem_grant_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_grant_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_grant_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_grant_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_grant_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_grant_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_mem_finish_ready = auto_out_e_ready; // @[Nodes.scala 1207:84 chipyard.TestHarness.LargeBoomConfig.fir 172135:4 LazyModule.scala 311:12 chipyard.TestHarness.LargeBoomConfig.fir 172137:4]
  assign mshrs_io_refill_ready = dataWriteArb_io_in_1_ready; // @[dcache.scala 798:25 chipyard.TestHarness.LargeBoomConfig.fir 175128:4]
  assign mshrs_io_meta_write_ready = metaWriteArb_io_in_0_ready; // @[dcache.scala 799:25 chipyard.TestHarness.LargeBoomConfig.fir 175131:4]
  assign mshrs_io_meta_read_ready = metaReadArb_io_in_3_ready; // @[dcache.scala 524:36 chipyard.TestHarness.LargeBoomConfig.fir 172801:4]
  assign mshrs_io_meta_resp_valid = _mshrs_io_req_0_valid_T_2 | prober_io_mshr_wb_rdy; // @[dcache.scala 771:52 chipyard.TestHarness.LargeBoomConfig.fir 175007:4]
  assign mshrs_io_meta_resp_bits_coh_state = _mshrs_io_meta_resp_bits_T_36 | _mshrs_io_meta_resp_bits_T_30; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 175068:4]
  assign mshrs_io_replay_ready = metaReadArb_io_in_0_ready; // @[dcache.scala 501:58 chipyard.TestHarness.LargeBoomConfig.fir 172504:4]
  assign mshrs_io_wb_req_ready = wbArb_io_in_1_ready; // @[dcache.scala 807:24 chipyard.TestHarness.LargeBoomConfig.fir 175143:4]
  assign mshrs_io_prober_state_valid = prober_io_state_valid; // @[dcache.scala 785:25 chipyard.TestHarness.LargeBoomConfig.fir 175107:4]
  assign mshrs_io_prober_state_bits = prober_io_state_bits; // @[dcache.scala 785:25 chipyard.TestHarness.LargeBoomConfig.fir 175106:4]
  assign mshrs_io_clear_all = io_lsu_force_order; // @[dcache.scala 433:25 chipyard.TestHarness.LargeBoomConfig.fir 172147:4]
  assign mshrs_io_wb_resp = wb_io_resp; // @[dcache.scala 810:25 chipyard.TestHarness.LargeBoomConfig.fir 175148:4]
  assign meta_0_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 172240:4]
  assign meta_0_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 172241:4]
  assign meta_0_io_read_valid = metaReadArb_io_out_valid; // @[dcache.scala 452:28 chipyard.TestHarness.LargeBoomConfig.fir 172285:4]
  assign meta_0_io_read_bits_idx = metaReadArb_io_out_bits_req_0_idx; // @[dcache.scala 453:28 chipyard.TestHarness.LargeBoomConfig.fir 172288:4]
  assign meta_0_io_write_valid = metaWriteArb_io_out_ready & metaWriteArb_io_out_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 172278:4]
  assign meta_0_io_write_bits_idx = metaWriteArb_io_out_bits_idx; // @[dcache.scala 451:28 chipyard.TestHarness.LargeBoomConfig.fir 172284:4]
  assign meta_0_io_write_bits_way_en = metaWriteArb_io_out_bits_way_en; // @[dcache.scala 451:28 chipyard.TestHarness.LargeBoomConfig.fir 172283:4]
  assign meta_0_io_write_bits_data_coh_state = metaWriteArb_io_out_bits_data_coh_state; // @[dcache.scala 451:28 chipyard.TestHarness.LargeBoomConfig.fir 172281:4]
  assign meta_0_io_write_bits_data_tag = metaWriteArb_io_out_bits_data_tag; // @[dcache.scala 451:28 chipyard.TestHarness.LargeBoomConfig.fir 172280:4]
  assign metaWriteArb_io_in_0_valid = mshrs_io_meta_write_valid; // @[dcache.scala 799:25 chipyard.TestHarness.LargeBoomConfig.fir 175130:4]
  assign metaWriteArb_io_in_0_bits_idx = mshrs_io_meta_write_bits_idx; // @[dcache.scala 799:25 chipyard.TestHarness.LargeBoomConfig.fir 175129:4]
  assign metaWriteArb_io_in_0_bits_way_en = mshrs_io_meta_write_bits_way_en; // @[dcache.scala 799:25 chipyard.TestHarness.LargeBoomConfig.fir 175129:4]
  assign metaWriteArb_io_in_0_bits_data_coh_state = mshrs_io_meta_write_bits_data_coh_state; // @[dcache.scala 799:25 chipyard.TestHarness.LargeBoomConfig.fir 175129:4]
  assign metaWriteArb_io_in_0_bits_data_tag = mshrs_io_meta_write_bits_data_tag; // @[dcache.scala 799:25 chipyard.TestHarness.LargeBoomConfig.fir 175129:4]
  assign metaWriteArb_io_in_1_valid = prober_io_meta_write_valid; // @[dcache.scala 782:25 chipyard.TestHarness.LargeBoomConfig.fir 175099:4]
  assign metaWriteArb_io_in_1_bits_idx = prober_io_meta_write_bits_idx; // @[dcache.scala 782:25 chipyard.TestHarness.LargeBoomConfig.fir 175098:4]
  assign metaWriteArb_io_in_1_bits_way_en = prober_io_meta_write_bits_way_en; // @[dcache.scala 782:25 chipyard.TestHarness.LargeBoomConfig.fir 175098:4]
  assign metaWriteArb_io_in_1_bits_data_coh_state = prober_io_meta_write_bits_data_coh_state; // @[dcache.scala 782:25 chipyard.TestHarness.LargeBoomConfig.fir 175098:4]
  assign metaWriteArb_io_in_1_bits_data_tag = prober_io_meta_write_bits_data_tag; // @[dcache.scala 782:25 chipyard.TestHarness.LargeBoomConfig.fir 175098:4]
  assign metaWriteArb_io_out_ready = meta_0_io_write_ready; // @[dcache.scala 456:29 chipyard.TestHarness.LargeBoomConfig.fir 172290:4]
  assign metaReadArb_io_in_0_valid = mshrs_io_replay_valid; // @[dcache.scala 504:43 chipyard.TestHarness.LargeBoomConfig.fir 172506:4]
  assign metaReadArb_io_in_0_bits_req_0_idx = mshrs_io_replay_bits_addr[11:6]; // @[dcache.scala 505:43 chipyard.TestHarness.LargeBoomConfig.fir 172508:4]
  assign metaReadArb_io_in_1_valid = prober_io_meta_read_valid; // @[dcache.scala 559:36 chipyard.TestHarness.LargeBoomConfig.fir 173390:4]
  assign metaReadArb_io_in_1_bits_req_0_idx = prober_io_meta_read_bits_idx; // @[dcache.scala 560:36 chipyard.TestHarness.LargeBoomConfig.fir 173393:4]
  assign metaReadArb_io_in_2_valid = wb_io_meta_read_valid; // @[dcache.scala 539:37 chipyard.TestHarness.LargeBoomConfig.fir 173084:4]
  assign metaReadArb_io_in_2_bits_req_0_idx = wb_io_meta_read_bits_idx; // @[dcache.scala 540:37 chipyard.TestHarness.LargeBoomConfig.fir 173087:4]
  assign metaReadArb_io_in_3_valid = mshrs_io_meta_read_valid; // @[dcache.scala 522:36 chipyard.TestHarness.LargeBoomConfig.fir 172797:4]
  assign metaReadArb_io_in_3_bits_req_0_idx = mshrs_io_meta_read_bits_idx; // @[dcache.scala 523:36 chipyard.TestHarness.LargeBoomConfig.fir 172800:4]
  assign metaReadArb_io_in_4_valid = io_lsu_req_valid; // @[dcache.scala 480:30 chipyard.TestHarness.LargeBoomConfig.fir 172329:4]
  assign metaReadArb_io_in_4_bits_req_0_idx = io_lsu_req_bits_0_bits_addr[11:6]; // @[dcache.scala 484:45 chipyard.TestHarness.LargeBoomConfig.fir 172332:4]
  assign metaReadArb_io_out_ready = meta_0_io_read_ready; // @[dcache.scala 455:29 chipyard.TestHarness.LargeBoomConfig.fir 172289:4]
  assign data_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 172292:4]
  assign data_io_read_0_valid = dataReadArb_io_out_bits_valid_0 & dataReadArb_io_out_valid; // @[dcache.scala 467:63 chipyard.TestHarness.LargeBoomConfig.fir 172315:4]
  assign data_io_read_0_bits_way_en = dataReadArb_io_out_bits_req_0_way_en; // @[dcache.scala 468:27 chipyard.TestHarness.LargeBoomConfig.fir 172318:4]
  assign data_io_read_0_bits_addr = dataReadArb_io_out_bits_req_0_addr; // @[dcache.scala 468:27 chipyard.TestHarness.LargeBoomConfig.fir 172317:4]
  assign data_io_write_valid = dataWriteArb_io_out_ready & dataWriteArb_io_out_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 172320:4]
  assign data_io_write_bits_way_en = dataWriteArb_io_out_bits_way_en; // @[dcache.scala 473:23 chipyard.TestHarness.LargeBoomConfig.fir 172325:4]
  assign data_io_write_bits_addr = dataWriteArb_io_out_bits_addr; // @[dcache.scala 473:23 chipyard.TestHarness.LargeBoomConfig.fir 172324:4]
  assign data_io_write_bits_wmask = dataWriteArb_io_out_bits_wmask; // @[dcache.scala 473:23 chipyard.TestHarness.LargeBoomConfig.fir 172323:4]
  assign data_io_write_bits_data = dataWriteArb_io_out_bits_data; // @[dcache.scala 473:23 chipyard.TestHarness.LargeBoomConfig.fir 172322:4]
  assign dataWriteArb_io_in_0_valid = s3_valid; // @[dcache.scala 905:37 chipyard.TestHarness.LargeBoomConfig.fir 176523:4]
  assign dataWriteArb_io_in_0_bits_way_en = s3_way; // @[dcache.scala 909:37 chipyard.TestHarness.LargeBoomConfig.fir 176530:4]
  assign dataWriteArb_io_in_0_bits_addr = s3_req_addr[11:0]; // @[dcache.scala 906:37 chipyard.TestHarness.LargeBoomConfig.fir 176524:4]
  assign dataWriteArb_io_in_0_bits_wmask = 2'h1 << s3_req_addr[3]; // @[OneHot.scala 58:35 chipyard.TestHarness.LargeBoomConfig.fir 176526:4]
  assign dataWriteArb_io_in_0_bits_data = {s3_req_data,s3_req_data}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 176528:4]
  assign dataWriteArb_io_in_1_valid = mshrs_io_refill_valid; // @[dcache.scala 798:25 chipyard.TestHarness.LargeBoomConfig.fir 175127:4]
  assign dataWriteArb_io_in_1_bits_way_en = mshrs_io_refill_bits_way_en; // @[dcache.scala 798:25 chipyard.TestHarness.LargeBoomConfig.fir 175126:4]
  assign dataWriteArb_io_in_1_bits_addr = mshrs_io_refill_bits_addr; // @[dcache.scala 798:25 chipyard.TestHarness.LargeBoomConfig.fir 175126:4]
  assign dataWriteArb_io_in_1_bits_data = mshrs_io_refill_bits_data; // @[dcache.scala 798:25 chipyard.TestHarness.LargeBoomConfig.fir 175126:4]
  assign dataWriteArb_io_out_ready = 1'h1; // @[dcache.scala 474:29 chipyard.TestHarness.LargeBoomConfig.fir 172326:4]
  assign dataReadArb_io_in_0_valid = mshrs_io_replay_valid; // @[dcache.scala 509:43 chipyard.TestHarness.LargeBoomConfig.fir 172511:4]
  assign dataReadArb_io_in_0_bits_req_0_way_en = mshrs_io_replay_bits_way_en; // @[dcache.scala 511:43 chipyard.TestHarness.LargeBoomConfig.fir 172513:4]
  assign dataReadArb_io_in_0_bits_req_0_addr = mshrs_io_replay_bits_addr[11:0]; // @[dcache.scala 510:43 chipyard.TestHarness.LargeBoomConfig.fir 172512:4]
  assign dataReadArb_io_in_1_valid = wb_io_data_req_valid; // @[dcache.scala 543:37 chipyard.TestHarness.LargeBoomConfig.fir 173090:4]
  assign dataReadArb_io_in_1_bits_req_0_way_en = wb_io_data_req_bits_way_en; // @[dcache.scala 544:37 chipyard.TestHarness.LargeBoomConfig.fir 173092:4]
  assign dataReadArb_io_in_1_bits_req_0_addr = wb_io_data_req_bits_addr; // @[dcache.scala 544:37 chipyard.TestHarness.LargeBoomConfig.fir 173091:4]
  assign dataReadArb_io_in_2_valid = io_lsu_req_valid; // @[dcache.scala 481:30 chipyard.TestHarness.LargeBoomConfig.fir 172330:4]
  assign dataReadArb_io_in_2_bits_req_0_addr = io_lsu_req_bits_0_bits_addr[11:0]; // @[dcache.scala 489:45 chipyard.TestHarness.LargeBoomConfig.fir 172336:4]
  assign dataReadArb_io_in_2_bits_valid_0 = io_lsu_req_bits_0_valid; // @[dcache.scala 488:45 chipyard.TestHarness.LargeBoomConfig.fir 172335:4]
  assign lfsr_prng_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 174499:4]
  assign lfsr_prng_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 174500:4]
  assign lfsr_prng_io_increment = mshrs_io_req_0_ready & mshrs_io_req_0_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 175075:4]
  assign wbArb_io_in_0_valid = prober_io_wb_req_valid; // @[dcache.scala 806:24 chipyard.TestHarness.LargeBoomConfig.fir 175139:4]
  assign wbArb_io_in_0_bits_tag = prober_io_wb_req_bits_tag; // @[dcache.scala 806:24 chipyard.TestHarness.LargeBoomConfig.fir 175138:4]
  assign wbArb_io_in_0_bits_idx = prober_io_wb_req_bits_idx; // @[dcache.scala 806:24 chipyard.TestHarness.LargeBoomConfig.fir 175138:4]
  assign wbArb_io_in_0_bits_param = prober_io_wb_req_bits_param; // @[dcache.scala 806:24 chipyard.TestHarness.LargeBoomConfig.fir 175138:4]
  assign wbArb_io_in_0_bits_way_en = prober_io_wb_req_bits_way_en; // @[dcache.scala 806:24 chipyard.TestHarness.LargeBoomConfig.fir 175138:4]
  assign wbArb_io_in_1_valid = mshrs_io_wb_req_valid; // @[dcache.scala 807:24 chipyard.TestHarness.LargeBoomConfig.fir 175142:4]
  assign wbArb_io_in_1_bits_tag = mshrs_io_wb_req_bits_tag; // @[dcache.scala 807:24 chipyard.TestHarness.LargeBoomConfig.fir 175141:4]
  assign wbArb_io_in_1_bits_idx = mshrs_io_wb_req_bits_idx; // @[dcache.scala 807:24 chipyard.TestHarness.LargeBoomConfig.fir 175141:4]
  assign wbArb_io_in_1_bits_param = mshrs_io_wb_req_bits_param; // @[dcache.scala 807:24 chipyard.TestHarness.LargeBoomConfig.fir 175141:4]
  assign wbArb_io_in_1_bits_way_en = mshrs_io_wb_req_bits_way_en; // @[dcache.scala 807:24 chipyard.TestHarness.LargeBoomConfig.fir 175141:4]
  assign wbArb_io_out_ready = wb_io_req_ready; // @[dcache.scala 808:24 chipyard.TestHarness.LargeBoomConfig.fir 175146:4]
  assign lsu_release_arb_io_in_0_valid = wb_io_lsu_release_valid; // @[dcache.scala 815:28 chipyard.TestHarness.LargeBoomConfig.fir 175160:4]
  assign lsu_release_arb_io_in_0_bits_address = wb_io_lsu_release_bits_address; // @[dcache.scala 815:28 chipyard.TestHarness.LargeBoomConfig.fir 175159:4]
  assign lsu_release_arb_io_in_1_valid = prober_io_lsu_release_valid; // @[dcache.scala 816:28 chipyard.TestHarness.LargeBoomConfig.fir 175163:4]
  assign lsu_release_arb_io_in_1_bits_address = prober_io_lsu_release_bits_address; // @[dcache.scala 816:28 chipyard.TestHarness.LargeBoomConfig.fir 175162:4]
  assign lsu_release_arb_io_out_ready = io_lsu_release_ready; // @[dcache.scala 814:18 chipyard.TestHarness.LargeBoomConfig.fir 175158:4]
  assign amoalu_io_mask = {amoalu_io_mask_hi_2,amoalu_io_mask_lo_2}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 176515:4]
  assign amoalu_io_cmd = s2_req_0_uop_mem_cmd; // @[dcache.scala 897:18 chipyard.TestHarness.LargeBoomConfig.fir 176517:4]
  assign amoalu_io_lhs = s2_data_word_0[63:0]; // @[dcache.scala 898:18 chipyard.TestHarness.LargeBoomConfig.fir 176518:4]
  assign amoalu_io_rhs = s2_req_0_data; // @[dcache.scala 899:18 chipyard.TestHarness.LargeBoomConfig.fir 176519:4]
  always @(posedge clock) begin
    s1_req_0_uop_br_mask <= s0_req_0_uop_br_mask & _s1_req_0_uop_br_mask_T; // @[util.scala 85:25 chipyard.TestHarness.LargeBoomConfig.fir 173794:4]
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_ldq_idx <= io_lsu_req_bits_0_bits_uop_ldq_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_ldq_idx <= 5'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_ldq_idx <= 5'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_ldq_idx <= 5'h0;
    end else begin
      s1_req_0_uop_ldq_idx <= replay_req_0_uop_ldq_idx;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_stq_idx <= io_lsu_req_bits_0_bits_uop_stq_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_stq_idx <= 5'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_stq_idx <= 5'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_stq_idx <= 5'h0;
    end else begin
      s1_req_0_uop_stq_idx <= replay_req_0_uop_stq_idx;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_mem_cmd <= io_lsu_req_bits_0_bits_uop_mem_cmd;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_mem_cmd <= 5'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_mem_cmd <= 5'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_mem_cmd <= 5'h0;
    end else begin
      s1_req_0_uop_mem_cmd <= replay_req_0_uop_mem_cmd;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_mem_size <= io_lsu_req_bits_0_bits_uop_mem_size;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_mem_size <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_mem_size <= 2'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_mem_size <= 2'h0;
    end else begin
      s1_req_0_uop_mem_size <= replay_req_0_uop_mem_size;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_mem_signed <= io_lsu_req_bits_0_bits_uop_mem_signed;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_mem_signed <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_mem_signed <= 1'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_mem_signed <= 1'h0;
    end else begin
      s1_req_0_uop_mem_signed <= replay_req_0_uop_mem_signed;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_is_amo <= io_lsu_req_bits_0_bits_uop_is_amo;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_is_amo <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_is_amo <= 1'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_is_amo <= 1'h0;
    end else begin
      s1_req_0_uop_is_amo <= replay_req_0_uop_is_amo;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_uses_ldq <= io_lsu_req_bits_0_bits_uop_uses_ldq;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_uses_ldq <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_uses_ldq <= 1'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_uses_ldq <= 1'h0;
    end else begin
      s1_req_0_uop_uses_ldq <= replay_req_0_uop_uses_ldq;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_uop_uses_stq <= io_lsu_req_bits_0_bits_uop_uses_stq;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_uop_uses_stq <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_uop_uses_stq <= 1'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_uop_uses_stq <= 1'h0;
    end else begin
      s1_req_0_uop_uses_stq <= replay_req_0_uop_uses_stq;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_addr <= io_lsu_req_bits_0_bits_addr;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_addr <= wb_req_0_addr;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_addr <= prober_req_0_addr;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_addr <= mshr_read_req_0_addr;
    end else begin
      s1_req_0_addr <= replay_req_0_addr;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_data <= io_lsu_req_bits_0_bits_data;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_data <= 64'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_data <= 64'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_data <= 64'h0;
    end else begin
      s1_req_0_data <= replay_req_0_data;
    end
    if (_s0_valid_T) begin // @[dcache.scala 581:21 chipyard.TestHarness.LargeBoomConfig.fir 173671:4]
      s1_req_0_is_hella <= io_lsu_req_bits_0_bits_is_hella;
    end else if (wb_fire) begin // @[dcache.scala 582:21 chipyard.TestHarness.LargeBoomConfig.fir 173670:4]
      s1_req_0_is_hella <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21 chipyard.TestHarness.LargeBoomConfig.fir 173669:4]
      s1_req_0_is_hella <= 1'h0;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 585:21 chipyard.TestHarness.LargeBoomConfig.fir 173667:4]
      s1_req_0_is_hella <= 1'h0;
    end else begin
      s1_req_0_is_hella <= replay_req_0_is_hella;
    end
    s2_valid_REG <= _s2_valid_T_8 & _s2_valid_T_12; // @[dcache.scala 637:72 chipyard.TestHarness.LargeBoomConfig.fir 174029:4]
    if (_s1_tag_match_way_T) begin // @[dcache.scala 624:29 chipyard.TestHarness.LargeBoomConfig.fir 173923:4]
      s2_tag_match_way_0 <= s1_replay_way_en;
    end else if (_s1_tag_match_way_T_1) begin // @[dcache.scala 625:29 chipyard.TestHarness.LargeBoomConfig.fir 173922:4]
      s2_tag_match_way_0 <= s1_wb_way_en;
    end else if (_s1_tag_match_way_T_2) begin // @[dcache.scala 626:29 chipyard.TestHarness.LargeBoomConfig.fir 173921:4]
      s2_tag_match_way_0 <= s1_mshr_meta_read_way_en;
    end else begin
      s2_tag_match_way_0 <= _s1_tag_match_way_T_27;
    end
    s2_req_0_uop_mem_cmd <= s1_req_0_uop_mem_cmd; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173964:4]
    s2_hit_state_REG_state <= meta_0_io_resp_0_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174041:4]
    s2_hit_state_REG_1_state <= meta_0_io_resp_1_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174043:4]
    s2_hit_state_REG_2_state <= meta_0_io_resp_2_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174045:4]
    s2_hit_state_REG_3_state <= meta_0_io_resp_3_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174047:4]
    s2_hit_state_REG_4_state <= meta_0_io_resp_4_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174049:4]
    s2_hit_state_REG_5_state <= meta_0_io_resp_5_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174051:4]
    s2_hit_state_REG_6_state <= meta_0_io_resp_6_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174053:4]
    s2_hit_state_REG_7_state <= meta_0_io_resp_7_coh_state; // @[dcache.scala 644:93 chipyard.TestHarness.LargeBoomConfig.fir 174055:4]
    s2_type <= s1_type; // @[dcache.scala 632:25 chipyard.TestHarness.LargeBoomConfig.fir 174015:4]
    s2_nack_hit_0 <= _s1_nack_T_1 & _s1_nack_T_2; // @[dcache.scala 612:93 chipyard.TestHarness.LargeBoomConfig.fir 173833:4]
    s2_wb_idx_matches_0 <= _s1_wb_idx_matches_T_1 & wb_io_idx_valid; // @[dcache.scala 629:99 chipyard.TestHarness.LargeBoomConfig.fir 173928:4]
    s2_send_nack_REG <= s1_send_resp_or_nack_0; // @[dcache.scala 734:44 chipyard.TestHarness.LargeBoomConfig.fir 174720:4]
    s2_req_0_uop_uses_stq <= s1_req_0_uop_uses_stq; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173957:4]
    if (reset) begin // @[dcache.scala 604:25 chipyard.TestHarness.LargeBoomConfig.fir 173809:4]
      s1_valid_REG <= 1'h0; // @[dcache.scala 604:25 chipyard.TestHarness.LargeBoomConfig.fir 173809:4]
    end else begin
      s1_valid_REG <= _s1_valid_T_11; // @[dcache.scala 604:25 chipyard.TestHarness.LargeBoomConfig.fir 173810:4]
    end
    REG <= io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 173813:4]
    REG_1 <= io_lsu_req_bits_0_valid; // @[dcache.scala 610:74 chipyard.TestHarness.LargeBoomConfig.fir 173819:4]
    if (_s0_valid_T) begin // @[dcache.scala 595:33 chipyard.TestHarness.LargeBoomConfig.fir 173709:4]
      if (_s0_valid_T) begin // @[dcache.scala 578:21 chipyard.TestHarness.LargeBoomConfig.fir 173581:4]
        s1_send_resp_or_nack_0 <= io_lsu_req_bits_0_valid;
      end else begin
        s1_send_resp_or_nack_0 <= _s0_valid_T_6;
      end
    end else begin
      s1_send_resp_or_nack_0 <= _s0_send_resp_or_nack_T_25;
    end
    if (_s0_valid_T) begin // @[dcache.scala 587:21 chipyard.TestHarness.LargeBoomConfig.fir 173678:4]
      s1_type <= 3'h4;
    end else if (wb_fire) begin // @[dcache.scala 588:21 chipyard.TestHarness.LargeBoomConfig.fir 173677:4]
      s1_type <= 3'h2;
    end else if (prober_fire) begin // @[dcache.scala 589:21 chipyard.TestHarness.LargeBoomConfig.fir 173676:4]
      s1_type <= 3'h1;
    end else if (_s0_valid_T_5) begin // @[dcache.scala 591:21 chipyard.TestHarness.LargeBoomConfig.fir 173674:4]
      s1_type <= 3'h3;
    end else begin
      s1_type <= 3'h0;
    end
    s1_mshr_meta_read_way_en <= mshrs_io_meta_read_bits_way_en; // @[dcache.scala 616:41 chipyard.TestHarness.LargeBoomConfig.fir 173839:4]
    s1_replay_way_en <= mshrs_io_replay_bits_way_en; // @[dcache.scala 617:41 chipyard.TestHarness.LargeBoomConfig.fir 173841:4]
    s1_wb_way_en <= wb_io_data_req_bits_way_en; // @[dcache.scala 618:41 chipyard.TestHarness.LargeBoomConfig.fir 173843:4]
    s2_req_0_uop_br_mask <= s1_req_0_uop_br_mask & _s1_req_0_uop_br_mask_T; // @[util.scala 85:25 chipyard.TestHarness.LargeBoomConfig.fir 174035:4]
    s2_req_0_uop_ldq_idx <= s1_req_0_uop_ldq_idx; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173980:4]
    s2_req_0_uop_stq_idx <= s1_req_0_uop_stq_idx; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173979:4]
    s2_req_0_uop_mem_size <= s1_req_0_uop_mem_size; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173963:4]
    s2_req_0_uop_mem_signed <= s1_req_0_uop_mem_signed; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173962:4]
    s2_req_0_uop_is_amo <= s1_req_0_uop_is_amo; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173959:4]
    s2_req_0_uop_uses_ldq <= s1_req_0_uop_uses_ldq; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173958:4]
    s2_req_0_addr <= s1_req_0_addr; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173934:4]
    s2_req_0_data <= s1_req_0_data; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173933:4]
    s2_req_0_is_hella <= s1_req_0_is_hella; // @[dcache.scala 631:25 chipyard.TestHarness.LargeBoomConfig.fir 173932:4]
    if (reset) begin // @[dcache.scala 656:35 chipyard.TestHarness.LargeBoomConfig.fir 174364:4]
      debug_sc_fail_addr <= 40'h0; // @[dcache.scala 656:35 chipyard.TestHarness.LargeBoomConfig.fir 174364:4]
    end else if (s2_valid_REG) begin // @[dcache.scala 688:22 chipyard.TestHarness.LargeBoomConfig.fir 174429:4]
      if (!(_T_51)) begin // @[dcache.scala 689:50 chipyard.TestHarness.LargeBoomConfig.fir 174431:6]
        if (s2_sc_fail) begin // @[dcache.scala 696:25 chipyard.TestHarness.LargeBoomConfig.fir 174443:8]
          debug_sc_fail_addr <= s2_req_0_addr; // @[dcache.scala 697:28 chipyard.TestHarness.LargeBoomConfig.fir 174444:10]
        end
      end
    end
    if (reset) begin // @[dcache.scala 657:35 chipyard.TestHarness.LargeBoomConfig.fir 174365:4]
      debug_sc_fail_cnt <= 8'h0; // @[dcache.scala 657:35 chipyard.TestHarness.LargeBoomConfig.fir 174365:4]
    end else if (s2_valid_REG) begin // @[dcache.scala 688:22 chipyard.TestHarness.LargeBoomConfig.fir 174429:4]
      if (_T_51) begin // @[dcache.scala 689:50 chipyard.TestHarness.LargeBoomConfig.fir 174431:6]
        if (s2_sc_fail) begin // @[dcache.scala 690:25 chipyard.TestHarness.LargeBoomConfig.fir 174432:8]
          debug_sc_fail_cnt <= _debug_sc_fail_cnt_T_1; // @[dcache.scala 691:27 chipyard.TestHarness.LargeBoomConfig.fir 174435:10]
        end else begin
          debug_sc_fail_cnt <= _GEN_7;
        end
      end else if (s2_sc_fail) begin // @[dcache.scala 696:25 chipyard.TestHarness.LargeBoomConfig.fir 174443:8]
        debug_sc_fail_cnt <= 8'h1; // @[dcache.scala 698:28 chipyard.TestHarness.LargeBoomConfig.fir 174445:10]
      end
    end
    if (reset) begin // @[dcache.scala 659:27 chipyard.TestHarness.LargeBoomConfig.fir 174366:4]
      lrsc_count <= 7'h0; // @[dcache.scala 659:27 chipyard.TestHarness.LargeBoomConfig.fir 174366:4]
    end else if (_T_50) begin // @[dcache.scala 683:20 chipyard.TestHarness.LargeBoomConfig.fir 174426:4]
      lrsc_count <= 7'h0; // @[dcache.scala 684:18 chipyard.TestHarness.LargeBoomConfig.fir 174427:6]
    end else if (_T_39) begin // @[dcache.scala 668:88 chipyard.TestHarness.LargeBoomConfig.fir 174405:4]
      if (_T_30) begin // @[dcache.scala 673:29 chipyard.TestHarness.LargeBoomConfig.fir 174412:6]
        lrsc_count <= 7'h0; // @[dcache.scala 674:18 chipyard.TestHarness.LargeBoomConfig.fir 174413:8]
      end else begin
        lrsc_count <= _GEN_1;
      end
    end else if (_T_30) begin // @[dcache.scala 666:27 chipyard.TestHarness.LargeBoomConfig.fir 174391:4]
      lrsc_count <= _lrsc_count_T_1; // @[dcache.scala 666:40 chipyard.TestHarness.LargeBoomConfig.fir 174394:6]
    end
    if (_T_39) begin // @[dcache.scala 668:88 chipyard.TestHarness.LargeBoomConfig.fir 174405:4]
      if (s2_lr) begin // @[dcache.scala 669:18 chipyard.TestHarness.LargeBoomConfig.fir 174406:6]
        lrsc_addr <= s2_req_0_addr[39:6]; // @[dcache.scala 671:17 chipyard.TestHarness.LargeBoomConfig.fir 174409:8]
      end
    end
    s2_lr_REG <= _s1_nack_T_1 & _s1_nack_T_2; // @[dcache.scala 612:93 chipyard.TestHarness.LargeBoomConfig.fir 173833:4]
    s2_sc_REG <= _s1_nack_T_1 & _s1_nack_T_2; // @[dcache.scala 612:93 chipyard.TestHarness.LargeBoomConfig.fir 173833:4]
    s2_replaced_way_en_REG <= lfsr[2:0]; // @[package.scala 154:13 chipyard.TestHarness.LargeBoomConfig.fir 174536:4]
    s2_repl_meta_REG_coh_state <= meta_0_io_resp_0_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174542:4]
    s2_repl_meta_REG_tag <= meta_0_io_resp_0_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174541:4]
    s2_repl_meta_REG_1_coh_state <= meta_0_io_resp_1_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174545:4]
    s2_repl_meta_REG_1_tag <= meta_0_io_resp_1_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174544:4]
    s2_repl_meta_REG_2_coh_state <= meta_0_io_resp_2_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174548:4]
    s2_repl_meta_REG_2_tag <= meta_0_io_resp_2_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174547:4]
    s2_repl_meta_REG_3_coh_state <= meta_0_io_resp_3_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174551:4]
    s2_repl_meta_REG_3_tag <= meta_0_io_resp_3_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174550:4]
    s2_repl_meta_REG_4_coh_state <= meta_0_io_resp_4_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174554:4]
    s2_repl_meta_REG_4_tag <= meta_0_io_resp_4_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174553:4]
    s2_repl_meta_REG_5_coh_state <= meta_0_io_resp_5_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174557:4]
    s2_repl_meta_REG_5_tag <= meta_0_io_resp_5_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174556:4]
    s2_repl_meta_REG_6_coh_state <= meta_0_io_resp_6_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174560:4]
    s2_repl_meta_REG_6_tag <= meta_0_io_resp_6_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174559:4]
    s2_repl_meta_REG_7_coh_state <= meta_0_io_resp_7_coh_state; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174563:4]
    s2_repl_meta_REG_7_tag <= meta_0_io_resp_7_tag; // @[dcache.scala 718:88 chipyard.TestHarness.LargeBoomConfig.fir 174562:4]
    s2_send_resp_REG <= s1_send_resp_or_nack_0; // @[dcache.scala 732:44 chipyard.TestHarness.LargeBoomConfig.fir 174662:4]
    mshrs_io_meta_resp_bits_REG_0_coh_state <= meta_0_io_resp_0_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175011:4]
    mshrs_io_meta_resp_bits_REG_1_coh_state <= meta_0_io_resp_1_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175013:4]
    mshrs_io_meta_resp_bits_REG_2_coh_state <= meta_0_io_resp_2_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175015:4]
    mshrs_io_meta_resp_bits_REG_3_coh_state <= meta_0_io_resp_3_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175017:4]
    mshrs_io_meta_resp_bits_REG_4_coh_state <= meta_0_io_resp_4_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175019:4]
    mshrs_io_meta_resp_bits_REG_5_coh_state <= meta_0_io_resp_5_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175021:4]
    mshrs_io_meta_resp_bits_REG_6_coh_state <= meta_0_io_resp_6_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175023:4]
    mshrs_io_meta_resp_bits_REG_7_coh_state <= meta_0_io_resp_7_coh_state; // @[dcache.scala 772:70 chipyard.TestHarness.LargeBoomConfig.fir 175025:4]
    if (reset) begin // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 175202:4]
      beatsLeft <= 8'h0; // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 175202:4]
    end else if (latch) begin // @[Arbiter.scala 113:23 chipyard.TestHarness.LargeBoomConfig.fir 175278:4]
      if (earlyWinner_0) begin // @[Arbiter.scala 111:73 chipyard.TestHarness.LargeBoomConfig.fir 175270:4]
        if (opdata) begin // @[Edges.scala 220:14 chipyard.TestHarness.LargeBoomConfig.fir 175171:4]
          beatsLeft <= 8'h3;
        end else begin
          beatsLeft <= 8'h0;
        end
      end else begin
        beatsLeft <= 8'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 175283:4]
      state_0 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 175283:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 175284:4]
      state_0 <= earlyWinner_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 175283:4]
      state_1 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 175283:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 175284:4]
      state_1 <= earlyWinner_1;
    end
    s3_valid <= _s3_valid_T_26 & _s3_valid_T_28; // @[dcache.scala 871:38 chipyard.TestHarness.LargeBoomConfig.fir 176293:4]
    s3_req_addr <= s2_req_0_addr; // @[dcache.scala 869:25 chipyard.TestHarness.LargeBoomConfig.fir 176184:4]
    s3_req_data <= amoalu_io_out; // @[dcache.scala 902:15 chipyard.TestHarness.LargeBoomConfig.fir 176520:4]
    s4_valid <= s3_valid; // @[dcache.scala 880:25 chipyard.TestHarness.LargeBoomConfig.fir 176380:4]
    s4_req_addr <= s3_req_addr; // @[dcache.scala 879:25 chipyard.TestHarness.LargeBoomConfig.fir 176299:4]
    s4_req_data <= s3_req_data; // @[dcache.scala 879:25 chipyard.TestHarness.LargeBoomConfig.fir 176298:4]
    s5_valid <= s4_valid; // @[dcache.scala 882:25 chipyard.TestHarness.LargeBoomConfig.fir 176465:4]
    s5_req_addr <= s4_req_addr; // @[dcache.scala 881:25 chipyard.TestHarness.LargeBoomConfig.fir 176384:4]
    s5_req_data <= s4_req_data; // @[dcache.scala 881:25 chipyard.TestHarness.LargeBoomConfig.fir 176383:4]
    s3_way <= s2_tag_match_way_0; // @[dcache.scala 903:25 chipyard.TestHarness.LargeBoomConfig.fir 176522:4]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:547 assert(!(wb.io.meta_read.fire() ^ wb.io.data_req.fire()))\n"); // @[dcache.scala 547:9 chipyard.TestHarness.LargeBoomConfig.fir 173106:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_6) begin
          $fatal; // @[dcache.scala 547:9 chipyard.TestHarness.LargeBoomConfig.fir 173107:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_15) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:610 assert(!(io.lsu.s1_kill(w) && !RegNext(io.lsu.req.fire()) && !RegNext(io.lsu.req.bits(w).valid)))\n"
            ); // @[dcache.scala 610:11 chipyard.TestHarness.LargeBoomConfig.fir 173827:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_15) begin
          $fatal; // @[dcache.scala 610:11 chipyard.TestHarness.LargeBoomConfig.fir 173828:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_22) begin
          $fwrite(32'h80000002,
            "Assertion failed: Replays should always hit\n    at dcache.scala:650 assert(!(s2_type === t_replay && !s2_hit(0)), \"Replays should always hit\")\n"
            ); // @[dcache.scala 650:9 chipyard.TestHarness.LargeBoomConfig.fir 174348:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_22) begin
          $fatal; // @[dcache.scala 650:9 chipyard.TestHarness.LargeBoomConfig.fir 174349:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29) begin
          $fwrite(32'h80000002,
            "Assertion failed: Writeback should always see data hit\n    at dcache.scala:651 assert(!(s2_type === t_wb && !s2_hit(0)), \"Writeback should always see data hit\")\n"
            ); // @[dcache.scala 651:9 chipyard.TestHarness.LargeBoomConfig.fir 174359:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_29) begin
          $fatal; // @[dcache.scala 651:9 chipyard.TestHarness.LargeBoomConfig.fir 174360:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_55) begin
          $fwrite(32'h80000002,
            "Assertion failed: L1DCache failed too many SCs in a row\n    at dcache.scala:702 assert(debug_sc_fail_cnt < 100.U, \"L1DCache failed too many SCs in a row\")\n"
            ); // @[dcache.scala 702:9 chipyard.TestHarness.LargeBoomConfig.fir 174454:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_55) begin
          $fatal; // @[dcache.scala 702:9 chipyard.TestHarness.LargeBoomConfig.fir 174455:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_66) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:736 assert(!(s2_send_resp(w) && s2_send_nack(w)))\n"); // @[dcache.scala 736:11 chipyard.TestHarness.LargeBoomConfig.fir 174730:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_66) begin
          $fatal; // @[dcache.scala 736:11 chipyard.TestHarness.LargeBoomConfig.fir 174731:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_72) begin
          $fwrite(32'h80000002,
            "Assertion failed: Replays should not need to go back into MSHRs\n    at dcache.scala:757 assert(!(mshrs.io.req(w).valid && s2_type === t_replay), \"Replays should not need to go back into MSHRs\")\n"
            ); // @[dcache.scala 757:11 chipyard.TestHarness.LargeBoomConfig.fir 174818:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_72) begin
          $fatal; // @[dcache.scala 757:11 chipyard.TestHarness.LargeBoomConfig.fir 174819:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_86) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 175245:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_86) begin
          $fatal; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 175246:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_93) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 175256:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_93) begin
          $fatal; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 175257:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_100) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 175267:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_100) begin
          $fatal; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 175268:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_128) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:865 assert(!(io.lsu.nack(w).valid && s2_type =/= t_lsu))\n"); // @[dcache.scala 865:11 chipyard.TestHarness.LargeBoomConfig.fir 176178:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_128) begin
          $fatal; // @[dcache.scala 865:11 chipyard.TestHarness.LargeBoomConfig.fir 176179:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  s1_req_0_uop_br_mask = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  s1_req_0_uop_ldq_idx = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  s1_req_0_uop_stq_idx = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  s1_req_0_uop_mem_cmd = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  s1_req_0_uop_mem_size = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  s1_req_0_uop_mem_signed = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_req_0_uop_is_amo = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_req_0_uop_uses_ldq = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_req_0_uop_uses_stq = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  s1_req_0_addr = _RAND_9[39:0];
  _RAND_10 = {2{`RANDOM}};
  s1_req_0_data = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  s1_req_0_is_hella = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_valid_REG = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_tag_match_way_0 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  s2_req_0_uop_mem_cmd = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  s2_hit_state_REG_state = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  s2_hit_state_REG_1_state = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  s2_hit_state_REG_2_state = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  s2_hit_state_REG_3_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  s2_hit_state_REG_4_state = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  s2_hit_state_REG_5_state = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  s2_hit_state_REG_6_state = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  s2_hit_state_REG_7_state = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  s2_type = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  s2_nack_hit_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  s2_wb_idx_matches_0 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  s2_send_nack_REG = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s2_req_0_uop_uses_stq = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s1_valid_REG = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  REG = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  REG_1 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s1_send_resp_or_nack_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  s1_type = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  s1_mshr_meta_read_way_en = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  s1_replay_way_en = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  s1_wb_way_en = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  s2_req_0_uop_br_mask = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  s2_req_0_uop_ldq_idx = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  s2_req_0_uop_stq_idx = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  s2_req_0_uop_mem_size = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  s2_req_0_uop_mem_signed = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  s2_req_0_uop_is_amo = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  s2_req_0_uop_uses_ldq = _RAND_42[0:0];
  _RAND_43 = {2{`RANDOM}};
  s2_req_0_addr = _RAND_43[39:0];
  _RAND_44 = {2{`RANDOM}};
  s2_req_0_data = _RAND_44[63:0];
  _RAND_45 = {1{`RANDOM}};
  s2_req_0_is_hella = _RAND_45[0:0];
  _RAND_46 = {2{`RANDOM}};
  debug_sc_fail_addr = _RAND_46[39:0];
  _RAND_47 = {1{`RANDOM}};
  debug_sc_fail_cnt = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  lrsc_count = _RAND_48[6:0];
  _RAND_49 = {2{`RANDOM}};
  lrsc_addr = _RAND_49[33:0];
  _RAND_50 = {1{`RANDOM}};
  s2_lr_REG = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  s2_sc_REG = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  s2_replaced_way_en_REG = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  s2_repl_meta_REG_coh_state = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  s2_repl_meta_REG_tag = _RAND_54[19:0];
  _RAND_55 = {1{`RANDOM}};
  s2_repl_meta_REG_1_coh_state = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  s2_repl_meta_REG_1_tag = _RAND_56[19:0];
  _RAND_57 = {1{`RANDOM}};
  s2_repl_meta_REG_2_coh_state = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  s2_repl_meta_REG_2_tag = _RAND_58[19:0];
  _RAND_59 = {1{`RANDOM}};
  s2_repl_meta_REG_3_coh_state = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  s2_repl_meta_REG_3_tag = _RAND_60[19:0];
  _RAND_61 = {1{`RANDOM}};
  s2_repl_meta_REG_4_coh_state = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  s2_repl_meta_REG_4_tag = _RAND_62[19:0];
  _RAND_63 = {1{`RANDOM}};
  s2_repl_meta_REG_5_coh_state = _RAND_63[1:0];
  _RAND_64 = {1{`RANDOM}};
  s2_repl_meta_REG_5_tag = _RAND_64[19:0];
  _RAND_65 = {1{`RANDOM}};
  s2_repl_meta_REG_6_coh_state = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  s2_repl_meta_REG_6_tag = _RAND_66[19:0];
  _RAND_67 = {1{`RANDOM}};
  s2_repl_meta_REG_7_coh_state = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  s2_repl_meta_REG_7_tag = _RAND_68[19:0];
  _RAND_69 = {1{`RANDOM}};
  s2_send_resp_REG = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_0_coh_state = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_1_coh_state = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_2_coh_state = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_3_coh_state = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_4_coh_state = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_5_coh_state = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_6_coh_state = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  mshrs_io_meta_resp_bits_REG_7_coh_state = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  beatsLeft = _RAND_78[7:0];
  _RAND_79 = {1{`RANDOM}};
  state_0 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  state_1 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  s3_valid = _RAND_81[0:0];
  _RAND_82 = {2{`RANDOM}};
  s3_req_addr = _RAND_82[39:0];
  _RAND_83 = {2{`RANDOM}};
  s3_req_data = _RAND_83[63:0];
  _RAND_84 = {1{`RANDOM}};
  s4_valid = _RAND_84[0:0];
  _RAND_85 = {2{`RANDOM}};
  s4_req_addr = _RAND_85[39:0];
  _RAND_86 = {2{`RANDOM}};
  s4_req_data = _RAND_86[63:0];
  _RAND_87 = {1{`RANDOM}};
  s5_valid = _RAND_87[0:0];
  _RAND_88 = {2{`RANDOM}};
  s5_req_addr = _RAND_88[39:0];
  _RAND_89 = {2{`RANDOM}};
  s5_req_data = _RAND_89[63:0];
  _RAND_90 = {1{`RANDOM}};
  s3_way = _RAND_90[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule