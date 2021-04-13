module BoomMSHRFile( // @[chipyard.TestHarness.LargeBoomConfig.fir 168919:2]
  input          clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 168920:4]
  input          reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 168921:4]
  output         io_req_0_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [15:0]  io_req_0_bits_uop_br_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [4:0]   io_req_0_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [4:0]   io_req_0_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [4:0]   io_req_0_bits_uop_mem_cmd, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [1:0]   io_req_0_bits_uop_mem_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_bits_uop_mem_signed, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [39:0]  io_req_0_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [63:0]  io_req_0_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_0_bits_tag_match, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [1:0]   io_req_0_bits_old_meta_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [19:0]  io_req_0_bits_old_meta_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [7:0]   io_req_0_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_req_is_probe_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_resp_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_resp_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [15:0]  io_resp_bits_uop_br_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [4:0]   io_resp_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [4:0]   io_resp_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_resp_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_resp_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_resp_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [63:0]  io_resp_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_resp_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_secondary_miss_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_block_hit_0, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [15:0]  io_brupdate_b1_resolve_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [15:0]  io_brupdate_b1_mispredict_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_exception, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_mem_acquire_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_mem_acquire_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [2:0]   io_mem_acquire_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [2:0]   io_mem_acquire_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [3:0]   io_mem_acquire_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [2:0]   io_mem_acquire_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [31:0]  io_mem_acquire_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [15:0]  io_mem_acquire_bits_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [127:0] io_mem_acquire_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_mem_grant_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_mem_grant_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [2:0]   io_mem_grant_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [1:0]   io_mem_grant_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [3:0]   io_mem_grant_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [2:0]   io_mem_grant_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [3:0]   io_mem_grant_bits_sink, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [127:0] io_mem_grant_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_mem_finish_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_mem_finish_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [3:0]   io_mem_finish_bits_sink, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_refill_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_refill_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [7:0]   io_refill_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [11:0]  io_refill_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [127:0] io_refill_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_meta_write_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_meta_write_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [5:0]   io_meta_write_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [7:0]   io_meta_write_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [1:0]   io_meta_write_bits_data_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [19:0]  io_meta_write_bits_data_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_meta_read_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_meta_read_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [5:0]   io_meta_read_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [7:0]   io_meta_read_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [19:0]  io_meta_read_bits_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_meta_resp_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [1:0]   io_meta_resp_bits_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_replay_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_replay_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [15:0]  io_replay_bits_uop_br_mask, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [4:0]   io_replay_bits_uop_ldq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [4:0]   io_replay_bits_uop_stq_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [4:0]   io_replay_bits_uop_mem_cmd, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [1:0]   io_replay_bits_uop_mem_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_replay_bits_uop_mem_signed, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_replay_bits_uop_is_amo, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_replay_bits_uop_uses_ldq, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_replay_bits_uop_uses_stq, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [39:0]  io_replay_bits_addr, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [63:0]  io_replay_bits_data, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_replay_bits_is_hella, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [7:0]   io_replay_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_wb_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_wb_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [19:0]  io_wb_req_bits_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [5:0]   io_wb_req_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [2:0]   io_wb_req_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output [7:0]   io_wb_req_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_prober_state_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input  [39:0]  io_prober_state_bits, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_clear_all, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  input          io_wb_resp, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_fence_rdy, // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
  output         io_probe_rdy // @[chipyard.TestHarness.LargeBoomConfig.fir 168922:4]
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [127:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] sdq [0:16]; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  wire [63:0] sdq_io_replay_bits_data_MPORT_data; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  wire [4:0] sdq_io_replay_bits_data_MPORT_addr; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  wire [63:0] sdq_MPORT_data; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  wire [4:0] sdq_MPORT_addr; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  wire  sdq_MPORT_mask; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  wire  sdq_MPORT_en; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  reg [127:0] lb [0:15]; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire [127:0] lb_lb_read_data_MPORT_data; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire [3:0] lb_lb_read_data_MPORT_addr; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire [127:0] lb_MPORT_1_data; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire [3:0] lb_MPORT_1_addr; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire  lb_MPORT_1_mask; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire  lb_MPORT_1_en; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  wire  lb_read_arb_io_in_0_ready; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_0_valid; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_0_bits_id; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_0_bits_offset; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_1_ready; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_1_valid; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_1_bits_id; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_1_bits_offset; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_2_ready; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_2_valid; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_2_bits_id; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_2_bits_offset; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_3_ready; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_in_3_valid; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_3_bits_id; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_in_3_bits_offset; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_out_ready; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_read_arb_io_out_valid; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_out_bits_id; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire [1:0] lb_read_arb_io_out_bits_offset; // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
  wire  lb_write_arb_io_in_0_valid; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_0_bits_id; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_0_bits_offset; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [127:0] lb_write_arb_io_in_0_bits_data; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_in_1_ready; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_in_1_valid; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_1_bits_id; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_1_bits_offset; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [127:0] lb_write_arb_io_in_1_bits_data; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_in_2_ready; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_in_2_valid; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_2_bits_id; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_2_bits_offset; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [127:0] lb_write_arb_io_in_2_bits_data; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_in_3_ready; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_in_3_valid; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_3_bits_id; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_in_3_bits_offset; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [127:0] lb_write_arb_io_in_3_bits_data; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_out_ready; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  lb_write_arb_io_out_valid; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_out_bits_id; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [1:0] lb_write_arb_io_out_bits_offset; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire [127:0] lb_write_arb_io_out_bits_data; // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
  wire  meta_write_arb_io_in_0_ready; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_0_valid; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [5:0] meta_write_arb_io_in_0_bits_idx; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [7:0] meta_write_arb_io_in_0_bits_way_en; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [1:0] meta_write_arb_io_in_0_bits_data_coh_state; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [19:0] meta_write_arb_io_in_0_bits_data_tag; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_1_ready; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_1_valid; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [5:0] meta_write_arb_io_in_1_bits_idx; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [7:0] meta_write_arb_io_in_1_bits_way_en; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [1:0] meta_write_arb_io_in_1_bits_data_coh_state; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [19:0] meta_write_arb_io_in_1_bits_data_tag; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_2_ready; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_2_valid; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [5:0] meta_write_arb_io_in_2_bits_idx; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [7:0] meta_write_arb_io_in_2_bits_way_en; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [1:0] meta_write_arb_io_in_2_bits_data_coh_state; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [19:0] meta_write_arb_io_in_2_bits_data_tag; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_3_ready; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_in_3_valid; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [5:0] meta_write_arb_io_in_3_bits_idx; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [7:0] meta_write_arb_io_in_3_bits_way_en; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [1:0] meta_write_arb_io_in_3_bits_data_coh_state; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [19:0] meta_write_arb_io_in_3_bits_data_tag; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_out_ready; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_write_arb_io_out_valid; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [5:0] meta_write_arb_io_out_bits_idx; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [7:0] meta_write_arb_io_out_bits_way_en; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [1:0] meta_write_arb_io_out_bits_data_coh_state; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire [19:0] meta_write_arb_io_out_bits_data_tag; // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
  wire  meta_read_arb_io_in_0_ready; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_0_valid; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [5:0] meta_read_arb_io_in_0_bits_idx; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [7:0] meta_read_arb_io_in_0_bits_way_en; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [19:0] meta_read_arb_io_in_0_bits_tag; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_1_ready; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_1_valid; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [5:0] meta_read_arb_io_in_1_bits_idx; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [7:0] meta_read_arb_io_in_1_bits_way_en; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [19:0] meta_read_arb_io_in_1_bits_tag; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_2_ready; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_2_valid; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [5:0] meta_read_arb_io_in_2_bits_idx; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [7:0] meta_read_arb_io_in_2_bits_way_en; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [19:0] meta_read_arb_io_in_2_bits_tag; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_3_ready; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_in_3_valid; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [5:0] meta_read_arb_io_in_3_bits_idx; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [7:0] meta_read_arb_io_in_3_bits_way_en; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [19:0] meta_read_arb_io_in_3_bits_tag; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_out_ready; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  meta_read_arb_io_out_valid; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [5:0] meta_read_arb_io_out_bits_idx; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [7:0] meta_read_arb_io_out_bits_way_en; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire [19:0] meta_read_arb_io_out_bits_tag; // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
  wire  wb_req_arb_io_in_0_ready; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_0_valid; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [19:0] wb_req_arb_io_in_0_bits_tag; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [5:0] wb_req_arb_io_in_0_bits_idx; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [2:0] wb_req_arb_io_in_0_bits_param; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [7:0] wb_req_arb_io_in_0_bits_way_en; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_1_ready; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_1_valid; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [19:0] wb_req_arb_io_in_1_bits_tag; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [5:0] wb_req_arb_io_in_1_bits_idx; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [2:0] wb_req_arb_io_in_1_bits_param; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [7:0] wb_req_arb_io_in_1_bits_way_en; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_2_ready; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_2_valid; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [19:0] wb_req_arb_io_in_2_bits_tag; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [5:0] wb_req_arb_io_in_2_bits_idx; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [2:0] wb_req_arb_io_in_2_bits_param; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [7:0] wb_req_arb_io_in_2_bits_way_en; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_3_ready; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_in_3_valid; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [19:0] wb_req_arb_io_in_3_bits_tag; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [5:0] wb_req_arb_io_in_3_bits_idx; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [2:0] wb_req_arb_io_in_3_bits_param; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [7:0] wb_req_arb_io_in_3_bits_way_en; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_out_ready; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  wb_req_arb_io_out_valid; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [19:0] wb_req_arb_io_out_bits_tag; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [5:0] wb_req_arb_io_out_bits_idx; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [2:0] wb_req_arb_io_out_bits_param; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire [7:0] wb_req_arb_io_out_bits_way_en; // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
  wire  replay_arb_io_in_0_ready; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_0_valid; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [15:0] replay_arb_io_in_0_bits_uop_br_mask; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_0_bits_uop_ldq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_0_bits_uop_stq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_0_bits_uop_mem_cmd; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [1:0] replay_arb_io_in_0_bits_uop_mem_size; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_0_bits_uop_mem_signed; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_0_bits_uop_is_amo; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_0_bits_uop_uses_ldq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_0_bits_uop_uses_stq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [39:0] replay_arb_io_in_0_bits_addr; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_0_bits_is_hella; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [7:0] replay_arb_io_in_0_bits_way_en; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_0_bits_sdq_id; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_ready; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_valid; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [15:0] replay_arb_io_in_1_bits_uop_br_mask; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_1_bits_uop_ldq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_1_bits_uop_stq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_1_bits_uop_mem_cmd; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [1:0] replay_arb_io_in_1_bits_uop_mem_size; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_bits_uop_mem_signed; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_bits_uop_is_amo; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_bits_uop_uses_ldq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_bits_uop_uses_stq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [39:0] replay_arb_io_in_1_bits_addr; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_1_bits_is_hella; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [7:0] replay_arb_io_in_1_bits_way_en; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_1_bits_sdq_id; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_ready; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_valid; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [15:0] replay_arb_io_in_2_bits_uop_br_mask; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_2_bits_uop_ldq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_2_bits_uop_stq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_2_bits_uop_mem_cmd; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [1:0] replay_arb_io_in_2_bits_uop_mem_size; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_bits_uop_mem_signed; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_bits_uop_is_amo; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_bits_uop_uses_ldq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_bits_uop_uses_stq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [39:0] replay_arb_io_in_2_bits_addr; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_2_bits_is_hella; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [7:0] replay_arb_io_in_2_bits_way_en; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_2_bits_sdq_id; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_ready; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_valid; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [15:0] replay_arb_io_in_3_bits_uop_br_mask; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_3_bits_uop_ldq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_3_bits_uop_stq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_3_bits_uop_mem_cmd; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [1:0] replay_arb_io_in_3_bits_uop_mem_size; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_bits_uop_mem_signed; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_bits_uop_is_amo; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_bits_uop_uses_ldq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_bits_uop_uses_stq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [39:0] replay_arb_io_in_3_bits_addr; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_in_3_bits_is_hella; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [7:0] replay_arb_io_in_3_bits_way_en; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_in_3_bits_sdq_id; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_ready; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_valid; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [15:0] replay_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_out_bits_uop_mem_cmd; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [1:0] replay_arb_io_out_bits_uop_mem_size; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_bits_uop_mem_signed; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [39:0] replay_arb_io_out_bits_addr; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  replay_arb_io_out_bits_is_hella; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [7:0] replay_arb_io_out_bits_way_en; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire [4:0] replay_arb_io_out_bits_sdq_id; // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
  wire  resp_arb_io_in_0_ready; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_0_valid; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [15:0] resp_arb_io_in_0_bits_uop_br_mask; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_0_bits_uop_ldq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_0_bits_uop_stq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_0_bits_uop_is_amo; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_0_bits_uop_uses_ldq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_0_bits_uop_uses_stq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [63:0] resp_arb_io_in_0_bits_data; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_0_bits_is_hella; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_1_ready; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_1_valid; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [15:0] resp_arb_io_in_1_bits_uop_br_mask; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_1_bits_uop_ldq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_1_bits_uop_stq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_1_bits_uop_is_amo; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_1_bits_uop_uses_ldq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_1_bits_uop_uses_stq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [63:0] resp_arb_io_in_1_bits_data; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_1_bits_is_hella; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_2_ready; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_2_valid; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [15:0] resp_arb_io_in_2_bits_uop_br_mask; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_2_bits_uop_ldq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_2_bits_uop_stq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_2_bits_uop_is_amo; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_2_bits_uop_uses_ldq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_2_bits_uop_uses_stq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [63:0] resp_arb_io_in_2_bits_data; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_2_bits_is_hella; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_3_ready; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_3_valid; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [15:0] resp_arb_io_in_3_bits_uop_br_mask; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_3_bits_uop_ldq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_3_bits_uop_stq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_3_bits_uop_is_amo; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_3_bits_uop_uses_ldq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_3_bits_uop_uses_stq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [63:0] resp_arb_io_in_3_bits_data; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_3_bits_is_hella; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_4_ready; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_4_valid; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [15:0] resp_arb_io_in_4_bits_uop_br_mask; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_4_bits_uop_ldq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_in_4_bits_uop_stq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_4_bits_uop_is_amo; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_4_bits_uop_uses_ldq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_in_4_bits_uop_uses_stq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [63:0] resp_arb_io_in_4_bits_data; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_out_ready; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_out_valid; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [15:0] resp_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [4:0] resp_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire [63:0] resp_arb_io_out_bits_data; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  resp_arb_io_out_bits_is_hella; // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
  wire  refill_arb_io_in_0_ready; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_0_valid; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [7:0] refill_arb_io_in_0_bits_way_en; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [11:0] refill_arb_io_in_0_bits_addr; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [127:0] refill_arb_io_in_0_bits_data; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_1_ready; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_1_valid; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [7:0] refill_arb_io_in_1_bits_way_en; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [11:0] refill_arb_io_in_1_bits_addr; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [127:0] refill_arb_io_in_1_bits_data; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_2_ready; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_2_valid; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [7:0] refill_arb_io_in_2_bits_way_en; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [11:0] refill_arb_io_in_2_bits_addr; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [127:0] refill_arb_io_in_2_bits_data; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_3_ready; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_in_3_valid; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [7:0] refill_arb_io_in_3_bits_way_en; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [11:0] refill_arb_io_in_3_bits_addr; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [127:0] refill_arb_io_in_3_bits_data; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_out_ready; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  refill_arb_io_out_valid; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [7:0] refill_arb_io_out_bits_way_en; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [11:0] refill_arb_io_out_bits_addr; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire [127:0] refill_arb_io_out_bits_data; // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
  wire  mshrs_0_clock; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_reset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_pri_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_pri_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_sec_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_sec_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_clear_prefetch; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [15:0] mshrs_0_io_brupdate_b1_resolve_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [15:0] mshrs_0_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_exception; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [15:0] mshrs_0_io_req_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_req_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_req_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_req_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_req_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [39:0] mshrs_0_io_req_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_tag_match; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_req_old_meta_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [19:0] mshrs_0_io_req_old_meta_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_req_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_req_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_req_is_probe; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_idx_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [5:0] mshrs_0_io_idx_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_way_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_way_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_tag_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [27:0] mshrs_0_io_tag_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_mem_acquire_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_mem_acquire_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [2:0] mshrs_0_io_mem_acquire_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [2:0] mshrs_0_io_mem_acquire_bits_source; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [31:0] mshrs_0_io_mem_acquire_bits_address; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_mem_grant_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_mem_grant_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [2:0] mshrs_0_io_mem_grant_bits_opcode; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_mem_grant_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [3:0] mshrs_0_io_mem_grant_bits_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [3:0] mshrs_0_io_mem_grant_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [127:0] mshrs_0_io_mem_grant_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_mem_finish_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_mem_finish_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [3:0] mshrs_0_io_mem_finish_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_prober_state_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [39:0] mshrs_0_io_prober_state_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_refill_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_refill_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_refill_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [11:0] mshrs_0_io_refill_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [127:0] mshrs_0_io_refill_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_meta_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_meta_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [5:0] mshrs_0_io_meta_write_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_meta_write_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_meta_write_bits_data_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [19:0] mshrs_0_io_meta_write_bits_data_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_meta_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_meta_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [5:0] mshrs_0_io_meta_read_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_meta_read_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [19:0] mshrs_0_io_meta_read_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_meta_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_meta_resp_bits_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_wb_req_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_wb_req_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [19:0] mshrs_0_io_wb_req_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [5:0] mshrs_0_io_wb_req_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [2:0] mshrs_0_io_wb_req_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_wb_req_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_lb_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_lb_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_lb_read_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_lb_read_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [127:0] mshrs_0_io_lb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_lb_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_lb_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_lb_write_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_lb_write_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [127:0] mshrs_0_io_lb_write_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [15:0] mshrs_0_io_replay_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_replay_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [1:0] mshrs_0_io_replay_bits_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_bits_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [39:0] mshrs_0_io_replay_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_replay_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [7:0] mshrs_0_io_replay_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_replay_bits_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_resp_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [15:0] mshrs_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [4:0] mshrs_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire [63:0] mshrs_0_io_resp_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_resp_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_wb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_0_io_probe_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
  wire  mshrs_1_clock; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_reset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_pri_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_pri_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_sec_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_sec_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_clear_prefetch; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [15:0] mshrs_1_io_brupdate_b1_resolve_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [15:0] mshrs_1_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_exception; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [15:0] mshrs_1_io_req_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_req_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_req_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_req_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_req_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [39:0] mshrs_1_io_req_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_tag_match; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_req_old_meta_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [19:0] mshrs_1_io_req_old_meta_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_req_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_req_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_req_is_probe; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_idx_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [5:0] mshrs_1_io_idx_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_way_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_way_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_tag_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [27:0] mshrs_1_io_tag_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_mem_acquire_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_mem_acquire_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [2:0] mshrs_1_io_mem_acquire_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [2:0] mshrs_1_io_mem_acquire_bits_source; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [31:0] mshrs_1_io_mem_acquire_bits_address; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_mem_grant_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_mem_grant_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [2:0] mshrs_1_io_mem_grant_bits_opcode; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_mem_grant_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [3:0] mshrs_1_io_mem_grant_bits_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [3:0] mshrs_1_io_mem_grant_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [127:0] mshrs_1_io_mem_grant_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_mem_finish_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_mem_finish_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [3:0] mshrs_1_io_mem_finish_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_prober_state_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [39:0] mshrs_1_io_prober_state_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_refill_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_refill_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_refill_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [11:0] mshrs_1_io_refill_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [127:0] mshrs_1_io_refill_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_meta_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_meta_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [5:0] mshrs_1_io_meta_write_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_meta_write_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_meta_write_bits_data_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [19:0] mshrs_1_io_meta_write_bits_data_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_meta_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_meta_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [5:0] mshrs_1_io_meta_read_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_meta_read_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [19:0] mshrs_1_io_meta_read_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_meta_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_meta_resp_bits_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_wb_req_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_wb_req_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [19:0] mshrs_1_io_wb_req_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [5:0] mshrs_1_io_wb_req_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [2:0] mshrs_1_io_wb_req_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_wb_req_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_lb_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_lb_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_lb_read_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_lb_read_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [127:0] mshrs_1_io_lb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_lb_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_lb_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_lb_write_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_lb_write_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [127:0] mshrs_1_io_lb_write_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [15:0] mshrs_1_io_replay_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_replay_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [1:0] mshrs_1_io_replay_bits_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_bits_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [39:0] mshrs_1_io_replay_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_replay_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [7:0] mshrs_1_io_replay_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_replay_bits_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_resp_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [15:0] mshrs_1_io_resp_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [4:0] mshrs_1_io_resp_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_resp_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_resp_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire [63:0] mshrs_1_io_resp_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_resp_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_wb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_1_io_probe_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
  wire  mshrs_2_clock; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_reset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_pri_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_pri_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_sec_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_sec_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_clear_prefetch; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [15:0] mshrs_2_io_brupdate_b1_resolve_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [15:0] mshrs_2_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_exception; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [15:0] mshrs_2_io_req_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_req_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_req_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_req_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_req_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [39:0] mshrs_2_io_req_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_tag_match; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_req_old_meta_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [19:0] mshrs_2_io_req_old_meta_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_req_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_req_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_req_is_probe; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_idx_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [5:0] mshrs_2_io_idx_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_way_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_way_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_tag_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [27:0] mshrs_2_io_tag_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_mem_acquire_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_mem_acquire_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [2:0] mshrs_2_io_mem_acquire_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [2:0] mshrs_2_io_mem_acquire_bits_source; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [31:0] mshrs_2_io_mem_acquire_bits_address; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_mem_grant_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_mem_grant_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [2:0] mshrs_2_io_mem_grant_bits_opcode; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_mem_grant_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [3:0] mshrs_2_io_mem_grant_bits_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [3:0] mshrs_2_io_mem_grant_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [127:0] mshrs_2_io_mem_grant_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_mem_finish_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_mem_finish_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [3:0] mshrs_2_io_mem_finish_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_prober_state_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [39:0] mshrs_2_io_prober_state_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_refill_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_refill_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_refill_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [11:0] mshrs_2_io_refill_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [127:0] mshrs_2_io_refill_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_meta_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_meta_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [5:0] mshrs_2_io_meta_write_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_meta_write_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_meta_write_bits_data_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [19:0] mshrs_2_io_meta_write_bits_data_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_meta_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_meta_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [5:0] mshrs_2_io_meta_read_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_meta_read_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [19:0] mshrs_2_io_meta_read_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_meta_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_meta_resp_bits_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_wb_req_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_wb_req_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [19:0] mshrs_2_io_wb_req_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [5:0] mshrs_2_io_wb_req_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [2:0] mshrs_2_io_wb_req_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_wb_req_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_lb_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_lb_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_lb_read_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_lb_read_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [127:0] mshrs_2_io_lb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_lb_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_lb_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_lb_write_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_lb_write_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [127:0] mshrs_2_io_lb_write_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [15:0] mshrs_2_io_replay_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_replay_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [1:0] mshrs_2_io_replay_bits_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_bits_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [39:0] mshrs_2_io_replay_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_replay_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [7:0] mshrs_2_io_replay_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_replay_bits_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_resp_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [15:0] mshrs_2_io_resp_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [4:0] mshrs_2_io_resp_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_resp_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_resp_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire [63:0] mshrs_2_io_resp_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_resp_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_wb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_2_io_probe_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
  wire  mshrs_3_clock; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_reset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_pri_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_pri_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_sec_val; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_sec_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_clear_prefetch; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [15:0] mshrs_3_io_brupdate_b1_resolve_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [15:0] mshrs_3_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_exception; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [15:0] mshrs_3_io_req_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_req_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_req_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_req_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_req_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [39:0] mshrs_3_io_req_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_tag_match; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_req_old_meta_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [19:0] mshrs_3_io_req_old_meta_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_req_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_req_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_req_is_probe; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_idx_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [5:0] mshrs_3_io_idx_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_way_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_way_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_tag_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [27:0] mshrs_3_io_tag_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_mem_acquire_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_mem_acquire_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [2:0] mshrs_3_io_mem_acquire_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [2:0] mshrs_3_io_mem_acquire_bits_source; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [31:0] mshrs_3_io_mem_acquire_bits_address; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_mem_grant_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_mem_grant_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [2:0] mshrs_3_io_mem_grant_bits_opcode; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_mem_grant_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [3:0] mshrs_3_io_mem_grant_bits_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [3:0] mshrs_3_io_mem_grant_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [127:0] mshrs_3_io_mem_grant_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_mem_finish_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_mem_finish_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [3:0] mshrs_3_io_mem_finish_bits_sink; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_prober_state_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [39:0] mshrs_3_io_prober_state_bits; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_refill_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_refill_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_refill_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [11:0] mshrs_3_io_refill_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [127:0] mshrs_3_io_refill_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_meta_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_meta_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [5:0] mshrs_3_io_meta_write_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_meta_write_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_meta_write_bits_data_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [19:0] mshrs_3_io_meta_write_bits_data_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_meta_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_meta_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [5:0] mshrs_3_io_meta_read_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_meta_read_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [19:0] mshrs_3_io_meta_read_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_meta_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_meta_resp_bits_coh_state; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_wb_req_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_wb_req_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [19:0] mshrs_3_io_wb_req_bits_tag; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [5:0] mshrs_3_io_wb_req_bits_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [2:0] mshrs_3_io_wb_req_bits_param; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_wb_req_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_lb_read_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_lb_read_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_lb_read_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_lb_read_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [127:0] mshrs_3_io_lb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_lb_write_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_lb_write_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_lb_write_bits_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_lb_write_bits_offset; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [127:0] mshrs_3_io_lb_write_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [15:0] mshrs_3_io_replay_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_replay_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [1:0] mshrs_3_io_replay_bits_uop_mem_size; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_bits_uop_mem_signed; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [39:0] mshrs_3_io_replay_bits_addr; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_replay_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [7:0] mshrs_3_io_replay_bits_way_en; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_replay_bits_sdq_id; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_resp_ready; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_resp_valid; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [15:0] mshrs_3_io_resp_bits_uop_br_mask; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [4:0] mshrs_3_io_resp_bits_uop_stq_idx; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_resp_bits_uop_is_amo; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_resp_bits_uop_uses_stq; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire [63:0] mshrs_3_io_resp_bits_data; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_resp_bits_is_hella; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_wb_resp; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mshrs_3_io_probe_rdy; // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
  wire  mmio_alloc_arb_io_in_0_ready; // @[mshrs.scala 703:30 chipyard.TestHarness.LargeBoomConfig.fir 170272:4]
  wire  mmio_alloc_arb_io_out_ready; // @[mshrs.scala 703:30 chipyard.TestHarness.LargeBoomConfig.fir 170272:4]
  wire  mmios_0_clock; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_reset; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_req_ready; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_req_valid; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [15:0] mmios_0_io_req_bits_uop_br_mask; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [4:0] mmios_0_io_req_bits_uop_ldq_idx; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [4:0] mmios_0_io_req_bits_uop_stq_idx; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [4:0] mmios_0_io_req_bits_uop_mem_cmd; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [1:0] mmios_0_io_req_bits_uop_mem_size; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_req_bits_uop_mem_signed; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_req_bits_uop_is_amo; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_req_bits_uop_uses_ldq; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_req_bits_uop_uses_stq; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [39:0] mmios_0_io_req_bits_addr; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [63:0] mmios_0_io_req_bits_data; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_resp_ready; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_resp_valid; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [15:0] mmios_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [4:0] mmios_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [4:0] mmios_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [63:0] mmios_0_io_resp_bits_data; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_mem_access_ready; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_mem_access_valid; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [2:0] mmios_0_io_mem_access_bits_opcode; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [2:0] mmios_0_io_mem_access_bits_param; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [3:0] mmios_0_io_mem_access_bits_size; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [2:0] mmios_0_io_mem_access_bits_source; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [31:0] mmios_0_io_mem_access_bits_address; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [15:0] mmios_0_io_mem_access_bits_mask; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [127:0] mmios_0_io_mem_access_bits_data; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  mmios_0_io_mem_ack_valid; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire [127:0] mmios_0_io_mem_ack_bits_data; // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
  wire  respq_clock; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_reset; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_enq_ready; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_enq_valid; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [15:0] respq_io_enq_bits_uop_br_mask; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [4:0] respq_io_enq_bits_uop_ldq_idx; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [4:0] respq_io_enq_bits_uop_stq_idx; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_enq_bits_uop_is_amo; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_enq_bits_uop_uses_ldq; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_enq_bits_uop_uses_stq; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [63:0] respq_io_enq_bits_data; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_enq_bits_is_hella; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_deq_ready; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_deq_valid; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [15:0] respq_io_deq_bits_uop_br_mask; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [4:0] respq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [4:0] respq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_deq_bits_uop_is_amo; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [63:0] respq_io_deq_bits_data; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_deq_bits_is_hella; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [15:0] respq_io_brupdate_b1_resolve_mask; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [15:0] respq_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_flush; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire  respq_io_empty; // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
  wire [39:0] _cacheable_T_15 = io_req_0_bits_addr ^ 40'h10000000; // @[Parameters.scala 137:31 chipyard.TestHarness.LargeBoomConfig.fir 168949:4]
  wire [40:0] _cacheable_T_16 = {1'b0,$signed(_cacheable_T_15)}; // @[Parameters.scala 137:49 chipyard.TestHarness.LargeBoomConfig.fir 168950:4]
  wire [40:0] _cacheable_T_18 = $signed(_cacheable_T_16) & 41'sh96000000; // @[Parameters.scala 137:52 chipyard.TestHarness.LargeBoomConfig.fir 168952:4]
  wire  _cacheable_T_19 = $signed(_cacheable_T_18) == 41'sh0; // @[Parameters.scala 137:67 chipyard.TestHarness.LargeBoomConfig.fir 168953:4]
  wire [39:0] _cacheable_T_20 = io_req_0_bits_addr ^ 40'h80000000; // @[Parameters.scala 137:31 chipyard.TestHarness.LargeBoomConfig.fir 168954:4]
  wire [40:0] _cacheable_T_21 = {1'b0,$signed(_cacheable_T_20)}; // @[Parameters.scala 137:49 chipyard.TestHarness.LargeBoomConfig.fir 168955:4]
  wire [40:0] _cacheable_T_23 = $signed(_cacheable_T_21) & 41'sh90000000; // @[Parameters.scala 137:52 chipyard.TestHarness.LargeBoomConfig.fir 168957:4]
  wire  _cacheable_T_24 = $signed(_cacheable_T_23) == 41'sh0; // @[Parameters.scala 137:67 chipyard.TestHarness.LargeBoomConfig.fir 168958:4]
  wire  cacheable = _cacheable_T_19 | _cacheable_T_24; // @[Parameters.scala 671:42 chipyard.TestHarness.LargeBoomConfig.fir 168959:4]
  reg [16:0] sdq_val; // @[mshrs.scala 555:29 chipyard.TestHarness.LargeBoomConfig.fir 168963:4]
  wire [16:0] _sdq_alloc_id_T_1 = ~sdq_val; // @[mshrs.scala 556:38 chipyard.TestHarness.LargeBoomConfig.fir 168965:4]
  wire [4:0] _sdq_alloc_id_T_19 = _sdq_alloc_id_T_1[15] ? 5'hf : 5'h10; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168983:4]
  wire [4:0] _sdq_alloc_id_T_20 = _sdq_alloc_id_T_1[14] ? 5'he : _sdq_alloc_id_T_19; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168984:4]
  wire [4:0] _sdq_alloc_id_T_21 = _sdq_alloc_id_T_1[13] ? 5'hd : _sdq_alloc_id_T_20; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168985:4]
  wire [4:0] _sdq_alloc_id_T_22 = _sdq_alloc_id_T_1[12] ? 5'hc : _sdq_alloc_id_T_21; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168986:4]
  wire [4:0] _sdq_alloc_id_T_23 = _sdq_alloc_id_T_1[11] ? 5'hb : _sdq_alloc_id_T_22; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168987:4]
  wire [4:0] _sdq_alloc_id_T_24 = _sdq_alloc_id_T_1[10] ? 5'ha : _sdq_alloc_id_T_23; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168988:4]
  wire [4:0] _sdq_alloc_id_T_25 = _sdq_alloc_id_T_1[9] ? 5'h9 : _sdq_alloc_id_T_24; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168989:4]
  wire [4:0] _sdq_alloc_id_T_26 = _sdq_alloc_id_T_1[8] ? 5'h8 : _sdq_alloc_id_T_25; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168990:4]
  wire [4:0] _sdq_alloc_id_T_27 = _sdq_alloc_id_T_1[7] ? 5'h7 : _sdq_alloc_id_T_26; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168991:4]
  wire [4:0] _sdq_alloc_id_T_28 = _sdq_alloc_id_T_1[6] ? 5'h6 : _sdq_alloc_id_T_27; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168992:4]
  wire [4:0] _sdq_alloc_id_T_29 = _sdq_alloc_id_T_1[5] ? 5'h5 : _sdq_alloc_id_T_28; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168993:4]
  wire [4:0] _sdq_alloc_id_T_30 = _sdq_alloc_id_T_1[4] ? 5'h4 : _sdq_alloc_id_T_29; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168994:4]
  wire [4:0] _sdq_alloc_id_T_31 = _sdq_alloc_id_T_1[3] ? 5'h3 : _sdq_alloc_id_T_30; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168995:4]
  wire [4:0] _sdq_alloc_id_T_32 = _sdq_alloc_id_T_1[2] ? 5'h2 : _sdq_alloc_id_T_31; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168996:4]
  wire [4:0] _sdq_alloc_id_T_33 = _sdq_alloc_id_T_1[1] ? 5'h1 : _sdq_alloc_id_T_32; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168997:4]
  wire  _sdq_rdy_T = &sdq_val; // @[mshrs.scala 557:31 chipyard.TestHarness.LargeBoomConfig.fir 168999:4]
  wire  sdq_rdy = ~_sdq_rdy_T; // @[mshrs.scala 557:22 chipyard.TestHarness.LargeBoomConfig.fir 169000:4]
  wire  _sdq_enq_T = io_req_0_ready & io_req_0_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 169001:4]
  wire  _sdq_enq_T_1 = _sdq_enq_T & cacheable; // @[mshrs.scala 558:33 chipyard.TestHarness.LargeBoomConfig.fir 169002:4]
  wire  _sdq_enq_T_2 = io_req_0_bits_uop_mem_cmd == 5'h1; // @[Consts.scala 82:32 chipyard.TestHarness.LargeBoomConfig.fir 169003:4]
  wire  _sdq_enq_T_3 = io_req_0_bits_uop_mem_cmd == 5'h11; // @[Consts.scala 82:49 chipyard.TestHarness.LargeBoomConfig.fir 169004:4]
  wire  _sdq_enq_T_4 = _sdq_enq_T_2 | _sdq_enq_T_3; // @[Consts.scala 82:42 chipyard.TestHarness.LargeBoomConfig.fir 169005:4]
  wire  _sdq_enq_T_5 = io_req_0_bits_uop_mem_cmd == 5'h7; // @[Consts.scala 82:66 chipyard.TestHarness.LargeBoomConfig.fir 169006:4]
  wire  _sdq_enq_T_6 = _sdq_enq_T_4 | _sdq_enq_T_5; // @[Consts.scala 82:59 chipyard.TestHarness.LargeBoomConfig.fir 169007:4]
  wire  _sdq_enq_T_7 = io_req_0_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169008:4]
  wire  _sdq_enq_T_8 = io_req_0_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169009:4]
  wire  _sdq_enq_T_9 = io_req_0_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169010:4]
  wire  _sdq_enq_T_10 = io_req_0_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169011:4]
  wire  _sdq_enq_T_11 = _sdq_enq_T_7 | _sdq_enq_T_8; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169012:4]
  wire  _sdq_enq_T_12 = _sdq_enq_T_11 | _sdq_enq_T_9; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169013:4]
  wire  _sdq_enq_T_13 = _sdq_enq_T_12 | _sdq_enq_T_10; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169014:4]
  wire  _sdq_enq_T_14 = io_req_0_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169015:4]
  wire  _sdq_enq_T_15 = io_req_0_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169016:4]
  wire  _sdq_enq_T_16 = io_req_0_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169017:4]
  wire  _sdq_enq_T_17 = io_req_0_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169018:4]
  wire  _sdq_enq_T_18 = io_req_0_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 169019:4]
  wire  _sdq_enq_T_19 = _sdq_enq_T_14 | _sdq_enq_T_15; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169020:4]
  wire  _sdq_enq_T_20 = _sdq_enq_T_19 | _sdq_enq_T_16; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169021:4]
  wire  _sdq_enq_T_21 = _sdq_enq_T_20 | _sdq_enq_T_17; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169022:4]
  wire  _sdq_enq_T_22 = _sdq_enq_T_21 | _sdq_enq_T_18; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 169023:4]
  wire  _sdq_enq_T_23 = _sdq_enq_T_13 | _sdq_enq_T_22; // @[Consts.scala 79:44 chipyard.TestHarness.LargeBoomConfig.fir 169024:4]
  wire  _sdq_enq_T_24 = _sdq_enq_T_6 | _sdq_enq_T_23; // @[Consts.scala 82:76 chipyard.TestHarness.LargeBoomConfig.fir 169025:4]
  wire  sdq_enq = _sdq_enq_T_1 & _sdq_enq_T_24; // @[mshrs.scala 558:46 chipyard.TestHarness.LargeBoomConfig.fir 169026:4]
  wire  _T = lb_write_arb_io_out_ready & lb_write_arb_io_out_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 169043:4]
  wire  _T_2 = lb_read_arb_io_out_ready & lb_read_arb_io_out_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 169051:6]
  wire [127:0] _GEN_8 = _T_2 ? lb_lb_read_data_MPORT_data : 128'h0; // @[mshrs.scala 580:38 chipyard.TestHarness.LargeBoomConfig.fir 169052:6 mshrs.scala 581:20 chipyard.TestHarness.LargeBoomConfig.fir 169055:8 chipyard.TestHarness.LargeBoomConfig.fir 169042:4]
  wire  _idx_matches_0_0_T_1 = mshrs_0_io_idx_bits == io_req_0_bits_addr[11:6]; // @[mshrs.scala 624:66 chipyard.TestHarness.LargeBoomConfig.fir 169125:4]
  wire  idx_matches_0_0 = mshrs_0_io_idx_valid & _idx_matches_0_0_T_1; // @[mshrs.scala 624:46 chipyard.TestHarness.LargeBoomConfig.fir 169126:4]
  wire  _tag_matches_0_0_T_1 = mshrs_0_io_tag_bits == io_req_0_bits_addr[39:12]; // @[mshrs.scala 625:66 chipyard.TestHarness.LargeBoomConfig.fir 169129:4]
  wire  tag_matches_0_0 = mshrs_0_io_tag_valid & _tag_matches_0_0_T_1; // @[mshrs.scala 625:46 chipyard.TestHarness.LargeBoomConfig.fir 169130:4]
  wire  _tag_match_T = idx_matches_0_0 & tag_matches_0_0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169061:4]
  wire  _idx_matches_0_1_T_1 = mshrs_1_io_idx_bits == io_req_0_bits_addr[11:6]; // @[mshrs.scala 624:66 chipyard.TestHarness.LargeBoomConfig.fir 169404:4]
  wire  idx_matches_0_1 = mshrs_1_io_idx_valid & _idx_matches_0_1_T_1; // @[mshrs.scala 624:46 chipyard.TestHarness.LargeBoomConfig.fir 169405:4]
  wire  _tag_matches_0_1_T_1 = mshrs_1_io_tag_bits == io_req_0_bits_addr[39:12]; // @[mshrs.scala 625:66 chipyard.TestHarness.LargeBoomConfig.fir 169408:4]
  wire  tag_matches_0_1 = mshrs_1_io_tag_valid & _tag_matches_0_1_T_1; // @[mshrs.scala 625:46 chipyard.TestHarness.LargeBoomConfig.fir 169409:4]
  wire  _tag_match_T_1 = idx_matches_0_1 & tag_matches_0_1; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169062:4]
  wire  _idx_matches_0_2_T_1 = mshrs_2_io_idx_bits == io_req_0_bits_addr[11:6]; // @[mshrs.scala 624:66 chipyard.TestHarness.LargeBoomConfig.fir 169683:4]
  wire  idx_matches_0_2 = mshrs_2_io_idx_valid & _idx_matches_0_2_T_1; // @[mshrs.scala 624:46 chipyard.TestHarness.LargeBoomConfig.fir 169684:4]
  wire  _tag_matches_0_2_T_1 = mshrs_2_io_tag_bits == io_req_0_bits_addr[39:12]; // @[mshrs.scala 625:66 chipyard.TestHarness.LargeBoomConfig.fir 169687:4]
  wire  tag_matches_0_2 = mshrs_2_io_tag_valid & _tag_matches_0_2_T_1; // @[mshrs.scala 625:46 chipyard.TestHarness.LargeBoomConfig.fir 169688:4]
  wire  _tag_match_T_2 = idx_matches_0_2 & tag_matches_0_2; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169063:4]
  wire  _idx_matches_0_3_T_1 = mshrs_3_io_idx_bits == io_req_0_bits_addr[11:6]; // @[mshrs.scala 624:66 chipyard.TestHarness.LargeBoomConfig.fir 169962:4]
  wire  idx_matches_0_3 = mshrs_3_io_idx_valid & _idx_matches_0_3_T_1; // @[mshrs.scala 624:46 chipyard.TestHarness.LargeBoomConfig.fir 169963:4]
  wire  _tag_matches_0_3_T_1 = mshrs_3_io_tag_bits == io_req_0_bits_addr[39:12]; // @[mshrs.scala 625:66 chipyard.TestHarness.LargeBoomConfig.fir 169966:4]
  wire  tag_matches_0_3 = mshrs_3_io_tag_valid & _tag_matches_0_3_T_1; // @[mshrs.scala 625:46 chipyard.TestHarness.LargeBoomConfig.fir 169967:4]
  wire  _tag_match_T_3 = idx_matches_0_3 & tag_matches_0_3; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169064:4]
  wire  _tag_match_T_4 = _tag_match_T | _tag_match_T_1; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169065:4]
  wire  _tag_match_T_5 = _tag_match_T_4 | _tag_match_T_2; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169066:4]
  wire  tag_match_0 = _tag_match_T_5 | _tag_match_T_3; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169067:4]
  wire  _idx_match_T = idx_matches_0_0 | idx_matches_0_1; // @[mshrs.scala 594:58 chipyard.TestHarness.LargeBoomConfig.fir 169072:4]
  wire  _idx_match_T_1 = _idx_match_T | idx_matches_0_2; // @[mshrs.scala 594:58 chipyard.TestHarness.LargeBoomConfig.fir 169073:4]
  wire  idx_match_0 = _idx_match_T_1 | idx_matches_0_3; // @[mshrs.scala 594:58 chipyard.TestHarness.LargeBoomConfig.fir 169074:4]
  wire  _way_matches_0_0_T = mshrs_0_io_way_bits == io_req_0_bits_way_en; // @[mshrs.scala 626:66 chipyard.TestHarness.LargeBoomConfig.fir 169132:4]
  wire  way_matches_0_0 = mshrs_0_io_way_valid & _way_matches_0_0_T; // @[mshrs.scala 626:46 chipyard.TestHarness.LargeBoomConfig.fir 169133:4]
  wire  _way_match_T = idx_matches_0_0 & way_matches_0_0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169077:4]
  wire  _way_matches_0_1_T = mshrs_1_io_way_bits == io_req_0_bits_way_en; // @[mshrs.scala 626:66 chipyard.TestHarness.LargeBoomConfig.fir 169411:4]
  wire  way_matches_0_1 = mshrs_1_io_way_valid & _way_matches_0_1_T; // @[mshrs.scala 626:46 chipyard.TestHarness.LargeBoomConfig.fir 169412:4]
  wire  _way_match_T_1 = idx_matches_0_1 & way_matches_0_1; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169078:4]
  wire  _way_matches_0_2_T = mshrs_2_io_way_bits == io_req_0_bits_way_en; // @[mshrs.scala 626:66 chipyard.TestHarness.LargeBoomConfig.fir 169690:4]
  wire  way_matches_0_2 = mshrs_2_io_way_valid & _way_matches_0_2_T; // @[mshrs.scala 626:46 chipyard.TestHarness.LargeBoomConfig.fir 169691:4]
  wire  _way_match_T_2 = idx_matches_0_2 & way_matches_0_2; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169079:4]
  wire  _way_matches_0_3_T = mshrs_3_io_way_bits == io_req_0_bits_way_en; // @[mshrs.scala 626:66 chipyard.TestHarness.LargeBoomConfig.fir 169969:4]
  wire  way_matches_0_3 = mshrs_3_io_way_valid & _way_matches_0_3_T; // @[mshrs.scala 626:46 chipyard.TestHarness.LargeBoomConfig.fir 169970:4]
  wire  _way_match_T_3 = idx_matches_0_3 & way_matches_0_3; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169080:4]
  wire  _way_match_T_4 = _way_match_T | _way_match_T_1; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169081:4]
  wire  _way_match_T_5 = _way_match_T_4 | _way_match_T_2; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169082:4]
  wire  way_match_0 = _way_match_T_5 | _way_match_T_3; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 169083:4]
  wire  _pri_val_T = io_req_0_valid & sdq_rdy; // @[mshrs.scala 618:27 chipyard.TestHarness.LargeBoomConfig.fir 169116:4]
  wire  _pri_val_T_1 = _pri_val_T & cacheable; // @[mshrs.scala 618:38 chipyard.TestHarness.LargeBoomConfig.fir 169117:4]
  wire  _pri_val_T_2 = ~idx_match_0; // @[mshrs.scala 618:54 chipyard.TestHarness.LargeBoomConfig.fir 169118:4]
  wire  pri_val = _pri_val_T_1 & _pri_val_T_2; // @[mshrs.scala 618:51 chipyard.TestHarness.LargeBoomConfig.fir 169119:4]
  reg [1:0] mshr_alloc_idx_REG; // @[mshrs.scala 694:31 chipyard.TestHarness.LargeBoomConfig.fir 170253:4]
  wire  _mshr_io_req_pri_val_T = 2'h0 == mshr_alloc_idx_REG; // @[mshrs.scala 632:34 chipyard.TestHarness.LargeBoomConfig.fir 169136:4]
  wire  _GEN_19 = _mshr_io_req_pri_val_T & mshrs_0_io_req_pri_rdy; // @[mshrs.scala 633:35 chipyard.TestHarness.LargeBoomConfig.fir 169140:4 mshrs.scala 634:15 chipyard.TestHarness.LargeBoomConfig.fir 169141:6 chipyard.TestHarness.LargeBoomConfig.fir 169115:4]
  wire  _mshr_io_req_sec_val_T_1 = _pri_val_T & tag_match_0; // @[mshrs.scala 637:50 chipyard.TestHarness.LargeBoomConfig.fir 169144:4]
  wire  _mshr_io_req_sec_val_T_2 = _mshr_io_req_sec_val_T_1 & idx_matches_0_0; // @[mshrs.scala 637:72 chipyard.TestHarness.LargeBoomConfig.fir 169145:4]
  wire  _mshr_io_clear_prefetch_T = ~io_req_0_valid; // @[mshrs.scala 644:49 chipyard.TestHarness.LargeBoomConfig.fir 169237:4]
  wire  _mshr_io_clear_prefetch_T_1 = io_clear_all & _mshr_io_clear_prefetch_T; // @[mshrs.scala 644:46 chipyard.TestHarness.LargeBoomConfig.fir 169238:4]
  wire  _mshr_io_clear_prefetch_T_2 = io_req_0_valid & idx_matches_0_0; // @[mshrs.scala 645:18 chipyard.TestHarness.LargeBoomConfig.fir 169239:4]
  wire  _mshr_io_clear_prefetch_T_3 = _mshr_io_clear_prefetch_T_2 & cacheable; // @[mshrs.scala 645:45 chipyard.TestHarness.LargeBoomConfig.fir 169240:4]
  wire  _mshr_io_clear_prefetch_T_4 = ~tag_match_0; // @[mshrs.scala 645:61 chipyard.TestHarness.LargeBoomConfig.fir 169241:4]
  wire  _mshr_io_clear_prefetch_T_5 = _mshr_io_clear_prefetch_T_3 & _mshr_io_clear_prefetch_T_4; // @[mshrs.scala 645:58 chipyard.TestHarness.LargeBoomConfig.fir 169242:4]
  wire  _mshr_io_clear_prefetch_T_6 = _mshr_io_clear_prefetch_T_1 | _mshr_io_clear_prefetch_T_5; // @[mshrs.scala 644:60 chipyard.TestHarness.LargeBoomConfig.fir 169243:4]
  wire  _mshr_io_clear_prefetch_T_7 = io_req_is_probe_0 & idx_matches_0_0; // @[mshrs.scala 646:21 chipyard.TestHarness.LargeBoomConfig.fir 169244:4]
  wire  _T_4 = io_mem_grant_bits_source == 3'h0; // @[mshrs.scala 673:36 chipyard.TestHarness.LargeBoomConfig.fir 169378:4]
  wire  _GEN_29 = _T_4 & mshrs_0_io_mem_grant_ready; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169382:6 mshrs.scala 614:22 chipyard.TestHarness.LargeBoomConfig.fir 169112:4]
  wire  _T_5 = mshrs_0_io_req_sec_rdy & mshrs_0_io_req_sec_val; // @[mshrs.scala 677:49 chipyard.TestHarness.LargeBoomConfig.fir 169384:4]
  wire  _T_7 = ~mshrs_0_io_req_pri_rdy; // @[mshrs.scala 680:11 chipyard.TestHarness.LargeBoomConfig.fir 169389:4]
  wire  _GEN_30 = _T_7 ? 1'h0 : 1'h1; // @[mshrs.scala 680:33 chipyard.TestHarness.LargeBoomConfig.fir 169390:4 mshrs.scala 681:20 chipyard.TestHarness.LargeBoomConfig.fir 169391:6 mshrs.scala 612:16 chipyard.TestHarness.LargeBoomConfig.fir 169110:4]
  wire  _T_8 = ~mshrs_0_io_probe_rdy; // @[mshrs.scala 684:13 chipyard.TestHarness.LargeBoomConfig.fir 169393:4]
  wire  _T_9 = _T_8 & idx_matches_0_0; // @[mshrs.scala 684:32 chipyard.TestHarness.LargeBoomConfig.fir 169394:4]
  wire  _T_10 = _T_9 & io_req_is_probe_0; // @[mshrs.scala 684:53 chipyard.TestHarness.LargeBoomConfig.fir 169395:4]
  wire  _GEN_31 = _T_10 ? 1'h0 : 1'h1; // @[mshrs.scala 684:76 chipyard.TestHarness.LargeBoomConfig.fir 169396:4 mshrs.scala 685:22 chipyard.TestHarness.LargeBoomConfig.fir 169397:6 mshrs.scala 613:16 chipyard.TestHarness.LargeBoomConfig.fir 169111:4]
  wire  _mshr_io_req_pri_val_T_2 = 2'h1 == mshr_alloc_idx_REG; // @[mshrs.scala 632:34 chipyard.TestHarness.LargeBoomConfig.fir 169415:4]
  wire  _GEN_32 = _mshr_io_req_pri_val_T_2 ? mshrs_1_io_req_pri_rdy : _GEN_19; // @[mshrs.scala 633:35 chipyard.TestHarness.LargeBoomConfig.fir 169419:4 mshrs.scala 634:15 chipyard.TestHarness.LargeBoomConfig.fir 169420:6]
  wire  _mshr_io_req_sec_val_T_6 = _mshr_io_req_sec_val_T_1 & idx_matches_0_1; // @[mshrs.scala 637:72 chipyard.TestHarness.LargeBoomConfig.fir 169424:4]
  wire  _mshr_io_clear_prefetch_T_11 = io_req_0_valid & idx_matches_0_1; // @[mshrs.scala 645:18 chipyard.TestHarness.LargeBoomConfig.fir 169518:4]
  wire  _mshr_io_clear_prefetch_T_12 = _mshr_io_clear_prefetch_T_11 & cacheable; // @[mshrs.scala 645:45 chipyard.TestHarness.LargeBoomConfig.fir 169519:4]
  wire  _mshr_io_clear_prefetch_T_14 = _mshr_io_clear_prefetch_T_12 & _mshr_io_clear_prefetch_T_4; // @[mshrs.scala 645:58 chipyard.TestHarness.LargeBoomConfig.fir 169521:4]
  wire  _mshr_io_clear_prefetch_T_15 = _mshr_io_clear_prefetch_T_1 | _mshr_io_clear_prefetch_T_14; // @[mshrs.scala 644:60 chipyard.TestHarness.LargeBoomConfig.fir 169522:4]
  wire  _mshr_io_clear_prefetch_T_16 = io_req_is_probe_0 & idx_matches_0_1; // @[mshrs.scala 646:21 chipyard.TestHarness.LargeBoomConfig.fir 169523:4]
  wire  _T_12 = io_mem_grant_bits_source == 3'h1; // @[mshrs.scala 673:36 chipyard.TestHarness.LargeBoomConfig.fir 169657:4]
  wire  _GEN_42 = _T_12 ? mshrs_1_io_mem_grant_ready : _GEN_29; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169661:6]
  wire  _T_13 = mshrs_1_io_req_sec_rdy & mshrs_1_io_req_sec_val; // @[mshrs.scala 677:49 chipyard.TestHarness.LargeBoomConfig.fir 169663:4]
  wire  _T_14 = _T_5 | _T_13; // @[mshrs.scala 677:25 chipyard.TestHarness.LargeBoomConfig.fir 169664:4]
  wire  _T_15 = ~mshrs_1_io_req_pri_rdy; // @[mshrs.scala 680:11 chipyard.TestHarness.LargeBoomConfig.fir 169668:4]
  wire  _GEN_43 = _T_15 ? 1'h0 : _GEN_30; // @[mshrs.scala 680:33 chipyard.TestHarness.LargeBoomConfig.fir 169669:4 mshrs.scala 681:20 chipyard.TestHarness.LargeBoomConfig.fir 169670:6]
  wire  _T_16 = ~mshrs_1_io_probe_rdy; // @[mshrs.scala 684:13 chipyard.TestHarness.LargeBoomConfig.fir 169672:4]
  wire  _T_17 = _T_16 & idx_matches_0_1; // @[mshrs.scala 684:32 chipyard.TestHarness.LargeBoomConfig.fir 169673:4]
  wire  _T_18 = _T_17 & io_req_is_probe_0; // @[mshrs.scala 684:53 chipyard.TestHarness.LargeBoomConfig.fir 169674:4]
  wire  _GEN_44 = _T_18 ? 1'h0 : _GEN_31; // @[mshrs.scala 684:76 chipyard.TestHarness.LargeBoomConfig.fir 169675:4 mshrs.scala 685:22 chipyard.TestHarness.LargeBoomConfig.fir 169676:6]
  wire  _mshr_io_req_pri_val_T_4 = 2'h2 == mshr_alloc_idx_REG; // @[mshrs.scala 632:34 chipyard.TestHarness.LargeBoomConfig.fir 169694:4]
  wire  _GEN_45 = _mshr_io_req_pri_val_T_4 ? mshrs_2_io_req_pri_rdy : _GEN_32; // @[mshrs.scala 633:35 chipyard.TestHarness.LargeBoomConfig.fir 169698:4 mshrs.scala 634:15 chipyard.TestHarness.LargeBoomConfig.fir 169699:6]
  wire  _mshr_io_req_sec_val_T_10 = _mshr_io_req_sec_val_T_1 & idx_matches_0_2; // @[mshrs.scala 637:72 chipyard.TestHarness.LargeBoomConfig.fir 169703:4]
  wire  _mshr_io_clear_prefetch_T_20 = io_req_0_valid & idx_matches_0_2; // @[mshrs.scala 645:18 chipyard.TestHarness.LargeBoomConfig.fir 169797:4]
  wire  _mshr_io_clear_prefetch_T_21 = _mshr_io_clear_prefetch_T_20 & cacheable; // @[mshrs.scala 645:45 chipyard.TestHarness.LargeBoomConfig.fir 169798:4]
  wire  _mshr_io_clear_prefetch_T_23 = _mshr_io_clear_prefetch_T_21 & _mshr_io_clear_prefetch_T_4; // @[mshrs.scala 645:58 chipyard.TestHarness.LargeBoomConfig.fir 169800:4]
  wire  _mshr_io_clear_prefetch_T_24 = _mshr_io_clear_prefetch_T_1 | _mshr_io_clear_prefetch_T_23; // @[mshrs.scala 644:60 chipyard.TestHarness.LargeBoomConfig.fir 169801:4]
  wire  _mshr_io_clear_prefetch_T_25 = io_req_is_probe_0 & idx_matches_0_2; // @[mshrs.scala 646:21 chipyard.TestHarness.LargeBoomConfig.fir 169802:4]
  wire  _T_20 = io_mem_grant_bits_source == 3'h2; // @[mshrs.scala 673:36 chipyard.TestHarness.LargeBoomConfig.fir 169936:4]
  wire  _GEN_55 = _T_20 ? mshrs_2_io_mem_grant_ready : _GEN_42; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169940:6]
  wire  _T_21 = mshrs_2_io_req_sec_rdy & mshrs_2_io_req_sec_val; // @[mshrs.scala 677:49 chipyard.TestHarness.LargeBoomConfig.fir 169942:4]
  wire  _T_22 = _T_14 | _T_21; // @[mshrs.scala 677:25 chipyard.TestHarness.LargeBoomConfig.fir 169943:4]
  wire  _T_23 = ~mshrs_2_io_req_pri_rdy; // @[mshrs.scala 680:11 chipyard.TestHarness.LargeBoomConfig.fir 169947:4]
  wire  _GEN_56 = _T_23 ? 1'h0 : _GEN_43; // @[mshrs.scala 680:33 chipyard.TestHarness.LargeBoomConfig.fir 169948:4 mshrs.scala 681:20 chipyard.TestHarness.LargeBoomConfig.fir 169949:6]
  wire  _T_24 = ~mshrs_2_io_probe_rdy; // @[mshrs.scala 684:13 chipyard.TestHarness.LargeBoomConfig.fir 169951:4]
  wire  _T_25 = _T_24 & idx_matches_0_2; // @[mshrs.scala 684:32 chipyard.TestHarness.LargeBoomConfig.fir 169952:4]
  wire  _T_26 = _T_25 & io_req_is_probe_0; // @[mshrs.scala 684:53 chipyard.TestHarness.LargeBoomConfig.fir 169953:4]
  wire  _GEN_57 = _T_26 ? 1'h0 : _GEN_44; // @[mshrs.scala 684:76 chipyard.TestHarness.LargeBoomConfig.fir 169954:4 mshrs.scala 685:22 chipyard.TestHarness.LargeBoomConfig.fir 169955:6]
  wire  _mshr_io_req_pri_val_T_6 = 2'h3 == mshr_alloc_idx_REG; // @[mshrs.scala 632:34 chipyard.TestHarness.LargeBoomConfig.fir 169973:4]
  wire  pri_rdy = _mshr_io_req_pri_val_T_6 ? mshrs_3_io_req_pri_rdy : _GEN_45; // @[mshrs.scala 633:35 chipyard.TestHarness.LargeBoomConfig.fir 169977:4 mshrs.scala 634:15 chipyard.TestHarness.LargeBoomConfig.fir 169978:6]
  wire  _mshr_io_req_sec_val_T_14 = _mshr_io_req_sec_val_T_1 & idx_matches_0_3; // @[mshrs.scala 637:72 chipyard.TestHarness.LargeBoomConfig.fir 169982:4]
  wire  _mshr_io_clear_prefetch_T_29 = io_req_0_valid & idx_matches_0_3; // @[mshrs.scala 645:18 chipyard.TestHarness.LargeBoomConfig.fir 170076:4]
  wire  _mshr_io_clear_prefetch_T_30 = _mshr_io_clear_prefetch_T_29 & cacheable; // @[mshrs.scala 645:45 chipyard.TestHarness.LargeBoomConfig.fir 170077:4]
  wire  _mshr_io_clear_prefetch_T_32 = _mshr_io_clear_prefetch_T_30 & _mshr_io_clear_prefetch_T_4; // @[mshrs.scala 645:58 chipyard.TestHarness.LargeBoomConfig.fir 170079:4]
  wire  _mshr_io_clear_prefetch_T_33 = _mshr_io_clear_prefetch_T_1 | _mshr_io_clear_prefetch_T_32; // @[mshrs.scala 644:60 chipyard.TestHarness.LargeBoomConfig.fir 170080:4]
  wire  _mshr_io_clear_prefetch_T_34 = io_req_is_probe_0 & idx_matches_0_3; // @[mshrs.scala 646:21 chipyard.TestHarness.LargeBoomConfig.fir 170081:4]
  wire  _T_28 = io_mem_grant_bits_source == 3'h3; // @[mshrs.scala 673:36 chipyard.TestHarness.LargeBoomConfig.fir 170215:4]
  wire  _GEN_68 = _T_28 ? mshrs_3_io_mem_grant_ready : _GEN_55; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170219:6]
  wire  _T_29 = mshrs_3_io_req_sec_rdy & mshrs_3_io_req_sec_val; // @[mshrs.scala 677:49 chipyard.TestHarness.LargeBoomConfig.fir 170221:4]
  wire  sec_rdy = _T_22 | _T_29; // @[mshrs.scala 677:25 chipyard.TestHarness.LargeBoomConfig.fir 170222:4]
  wire  _T_30 = ~mshrs_3_io_req_pri_rdy; // @[mshrs.scala 680:11 chipyard.TestHarness.LargeBoomConfig.fir 170226:4]
  wire  _GEN_69 = _T_30 ? 1'h0 : _GEN_56; // @[mshrs.scala 680:33 chipyard.TestHarness.LargeBoomConfig.fir 170227:4 mshrs.scala 681:20 chipyard.TestHarness.LargeBoomConfig.fir 170228:6]
  wire  _T_31 = ~mshrs_3_io_probe_rdy; // @[mshrs.scala 684:13 chipyard.TestHarness.LargeBoomConfig.fir 170230:4]
  wire  _T_32 = _T_31 & idx_matches_0_3; // @[mshrs.scala 684:32 chipyard.TestHarness.LargeBoomConfig.fir 170231:4]
  wire  _T_33 = _T_32 & io_req_is_probe_0; // @[mshrs.scala 684:53 chipyard.TestHarness.LargeBoomConfig.fir 170232:4]
  reg [1:0] mshr_head; // @[mshrs.scala 693:31 chipyard.TestHarness.LargeBoomConfig.fir 170236:4]
  wire  _mshr_alloc_idx_temp_vec_T = 2'h0 >= mshr_head; // @[util.scala 351:72 chipyard.TestHarness.LargeBoomConfig.fir 170237:4]
  wire  mshr_alloc_idx_temp_vec_0 = mshrs_0_io_req_pri_rdy & _mshr_alloc_idx_temp_vec_T; // @[util.scala 351:65 chipyard.TestHarness.LargeBoomConfig.fir 170238:4]
  wire  _mshr_alloc_idx_temp_vec_T_1 = 2'h1 >= mshr_head; // @[util.scala 351:72 chipyard.TestHarness.LargeBoomConfig.fir 170239:4]
  wire  mshr_alloc_idx_temp_vec_1 = mshrs_1_io_req_pri_rdy & _mshr_alloc_idx_temp_vec_T_1; // @[util.scala 351:65 chipyard.TestHarness.LargeBoomConfig.fir 170240:4]
  wire  _mshr_alloc_idx_temp_vec_T_2 = 2'h2 >= mshr_head; // @[util.scala 351:72 chipyard.TestHarness.LargeBoomConfig.fir 170241:4]
  wire  mshr_alloc_idx_temp_vec_2 = mshrs_2_io_req_pri_rdy & _mshr_alloc_idx_temp_vec_T_2; // @[util.scala 351:65 chipyard.TestHarness.LargeBoomConfig.fir 170242:4]
  wire  mshr_alloc_idx_temp_vec_3 = mshrs_3_io_req_pri_rdy; // @[util.scala 351:65 chipyard.TestHarness.LargeBoomConfig.fir 170244:4]
  wire [2:0] _mshr_alloc_idx_idx_T = mshrs_2_io_req_pri_rdy ? 3'h6 : 3'h7; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170245:4]
  wire [2:0] _mshr_alloc_idx_idx_T_1 = mshrs_1_io_req_pri_rdy ? 3'h5 : _mshr_alloc_idx_idx_T; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170246:4]
  wire [2:0] _mshr_alloc_idx_idx_T_2 = mshrs_0_io_req_pri_rdy ? 3'h4 : _mshr_alloc_idx_idx_T_1; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170247:4]
  wire [2:0] _mshr_alloc_idx_idx_T_3 = mshr_alloc_idx_temp_vec_3 ? 3'h3 : _mshr_alloc_idx_idx_T_2; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170248:4]
  wire [2:0] _mshr_alloc_idx_idx_T_4 = mshr_alloc_idx_temp_vec_2 ? 3'h2 : _mshr_alloc_idx_idx_T_3; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170249:4]
  wire [2:0] _mshr_alloc_idx_idx_T_5 = mshr_alloc_idx_temp_vec_1 ? 3'h1 : _mshr_alloc_idx_idx_T_4; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170250:4]
  wire [2:0] mshr_alloc_idx_idx = mshr_alloc_idx_temp_vec_0 ? 3'h0 : _mshr_alloc_idx_idx_T_5; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 170251:4]
  wire  _T_34 = pri_rdy & pri_val; // @[mshrs.scala 695:17 chipyard.TestHarness.LargeBoomConfig.fir 170256:4]
  wire [1:0] _mshr_head_T_1 = mshr_head + 2'h1; // @[util.scala 203:14 chipyard.TestHarness.LargeBoomConfig.fir 170259:6]
  wire  mmio_rdy = mmios_0_io_req_ready; // @[mshrs.scala 717:25 chipyard.TestHarness.LargeBoomConfig.fir 170363:4]
  wire  _mshr_io_mem_ack_valid_T = io_mem_grant_bits_source == 3'h5; // @[mshrs.scala 720:77 chipyard.TestHarness.LargeBoomConfig.fir 170372:4]
  wire  _T_36 = ~mmios_0_io_req_ready; // @[mshrs.scala 726:11 chipyard.TestHarness.LargeBoomConfig.fir 170382:4]
  wire  _mmio_alloc_arb_io_out_ready_T = ~cacheable; // @[mshrs.scala 732:47 chipyard.TestHarness.LargeBoomConfig.fir 170386:4]
  wire [26:0] _decode_T_17 = 27'hfff << mmios_0_io_mem_access_bits_size; // @[package.scala 234:77 chipyard.TestHarness.LargeBoomConfig.fir 170422:4]
  wire [11:0] _decode_T_19 = ~_decode_T_17[11:0]; // @[package.scala 234:46 chipyard.TestHarness.LargeBoomConfig.fir 170424:4]
  wire [7:0] decode_4 = _decode_T_19[11:4]; // @[Edges.scala 219:59 chipyard.TestHarness.LargeBoomConfig.fir 170425:4]
  wire  opdata_4 = ~mmios_0_io_mem_access_bits_opcode[2]; // @[Edges.scala 91:28 chipyard.TestHarness.LargeBoomConfig.fir 170427:4]
  reg [7:0] beatsLeft; // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 170490:4]
  wire  idle = beatsLeft == 8'h0; // @[Arbiter.scala 88:28 chipyard.TestHarness.LargeBoomConfig.fir 170491:4]
  wire  latch = idle & io_mem_acquire_ready; // @[Arbiter.scala 89:24 chipyard.TestHarness.LargeBoomConfig.fir 170492:4]
  wire  out_earlyValid = mshrs_0_io_mem_acquire_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170430:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170431:4]
  wire  out_1_earlyValid = mshrs_1_io_mem_acquire_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170442:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170443:4]
  wire  out_2_earlyValid = mshrs_2_io_mem_acquire_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170454:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170455:4]
  wire  out_3_earlyValid = mshrs_3_io_mem_acquire_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170466:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170467:4]
  wire  out_4_earlyValid = mmios_0_io_mem_access_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170479:4]
  wire [4:0] _readys_T = {out_4_earlyValid,out_3_earlyValid,out_2_earlyValid,out_1_earlyValid,out_earlyValid}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 170506:4]
  wire [5:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48 chipyard.TestHarness.LargeBoomConfig.fir 170507:4]
  wire [4:0] _readys_T_3 = _readys_T | _readys_T_1[4:0]; // @[package.scala 244:43 chipyard.TestHarness.LargeBoomConfig.fir 170509:4]
  wire [6:0] _readys_T_4 = {_readys_T_3, 2'h0}; // @[package.scala 244:48 chipyard.TestHarness.LargeBoomConfig.fir 170510:4]
  wire [4:0] _readys_T_6 = _readys_T_3 | _readys_T_4[4:0]; // @[package.scala 244:43 chipyard.TestHarness.LargeBoomConfig.fir 170512:4]
  wire [8:0] _readys_T_7 = {_readys_T_6, 4'h0}; // @[package.scala 244:48 chipyard.TestHarness.LargeBoomConfig.fir 170513:4]
  wire [4:0] _readys_T_9 = _readys_T_6 | _readys_T_7[4:0]; // @[package.scala 244:43 chipyard.TestHarness.LargeBoomConfig.fir 170515:4]
  wire [5:0] _readys_T_11 = {_readys_T_9, 1'h0}; // @[Arbiter.scala 16:78 chipyard.TestHarness.LargeBoomConfig.fir 170517:4]
  wire [4:0] _readys_T_13 = ~_readys_T_11[4:0]; // @[Arbiter.scala 16:61 chipyard.TestHarness.LargeBoomConfig.fir 170519:4]
  wire  readys__0 = _readys_T_13[0]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170520:4]
  wire  readys__1 = _readys_T_13[1]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170521:4]
  wire  readys__2 = _readys_T_13[2]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170522:4]
  wire  readys__3 = _readys_T_13[3]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170523:4]
  wire  readys__4 = _readys_T_13[4]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170524:4]
  wire  earlyWinner__0 = readys__0 & out_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170531:4]
  wire  earlyWinner__1 = readys__1 & out_1_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170532:4]
  wire  earlyWinner__2 = readys__2 & out_2_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170533:4]
  wire  earlyWinner__3 = readys__3 & out_3_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170534:4]
  wire  earlyWinner__4 = readys__4 & out_4_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170535:4]
  wire  prefixOR_2 = earlyWinner__0 | earlyWinner__1; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170554:4]
  wire  prefixOR_3 = prefixOR_2 | earlyWinner__2; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170555:4]
  wire  prefixOR_4 = prefixOR_3 | earlyWinner__3; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170556:4]
  wire  _prefixOR_T = prefixOR_4 | earlyWinner__4; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170557:4]
  wire  _T_43 = ~earlyWinner__0; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170559:4]
  wire  _T_46 = ~earlyWinner__1; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170562:4]
  wire  _T_47 = _T_43 | _T_46; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170563:4]
  wire  _T_48 = ~prefixOR_2; // @[Arbiter.scala 105:61 chipyard.TestHarness.LargeBoomConfig.fir 170564:4]
  wire  _T_49 = ~earlyWinner__2; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170565:4]
  wire  _T_50 = _T_48 | _T_49; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170566:4]
  wire  _T_51 = ~prefixOR_3; // @[Arbiter.scala 105:61 chipyard.TestHarness.LargeBoomConfig.fir 170567:4]
  wire  _T_52 = ~earlyWinner__3; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170568:4]
  wire  _T_53 = _T_51 | _T_52; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170569:4]
  wire  _T_54 = ~prefixOR_4; // @[Arbiter.scala 105:61 chipyard.TestHarness.LargeBoomConfig.fir 170570:4]
  wire  _T_55 = ~earlyWinner__4; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170571:4]
  wire  _T_56 = _T_54 | _T_55; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170572:4]
  wire  _T_58 = _T_47 & _T_50; // @[Arbiter.scala 105:82 chipyard.TestHarness.LargeBoomConfig.fir 170574:4]
  wire  _T_59 = _T_58 & _T_53; // @[Arbiter.scala 105:82 chipyard.TestHarness.LargeBoomConfig.fir 170575:4]
  wire  _T_60 = _T_59 & _T_56; // @[Arbiter.scala 105:82 chipyard.TestHarness.LargeBoomConfig.fir 170576:4]
  wire  _T_62 = _T_60 | reset; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170578:4]
  wire  _T_63 = ~_T_62; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170579:4]
  wire  _T_64 = out_earlyValid | out_1_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170584:4]
  wire  _T_65 = _T_64 | out_2_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170585:4]
  wire  _T_66 = _T_65 | out_3_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170586:4]
  wire  _T_67 = _T_66 | out_4_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170587:4]
  wire  _T_68 = ~_T_67; // @[Arbiter.scala 107:15 chipyard.TestHarness.LargeBoomConfig.fir 170588:4]
  wire  _T_73 = _T_68 | _prefixOR_T; // @[Arbiter.scala 107:41 chipyard.TestHarness.LargeBoomConfig.fir 170593:4]
  wire  _T_75 = _T_73 | reset; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170595:4]
  wire  _T_76 = ~_T_75; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170596:4]
  wire  _T_86 = _T_68 | _T_67; // @[Arbiter.scala 108:41 chipyard.TestHarness.LargeBoomConfig.fir 170610:4]
  wire  _T_88 = _T_86 | reset; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170612:4]
  wire  _T_89 = ~_T_88; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170613:4]
  reg  state__0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
  reg  state__1; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
  reg  state__2; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
  wire  muxStateEarly__2 = idle ? earlyWinner__2 : state__2; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
  reg  state__3; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
  wire  muxStateEarly__3 = idle ? earlyWinner__3 : state__3; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
  reg  state__4; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
  wire  muxStateEarly__4 = idle ? earlyWinner__4 : state__4; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
  wire  _sink_ACancel_earlyValid_T_4 = state__0 & out_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170663:4]
  wire  _sink_ACancel_earlyValid_T_5 = state__1 & out_1_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170664:4]
  wire  _sink_ACancel_earlyValid_T_9 = _sink_ACancel_earlyValid_T_4 | _sink_ACancel_earlyValid_T_5; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170668:4]
  wire  _sink_ACancel_earlyValid_T_6 = state__2 & out_2_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170665:4]
  wire  _sink_ACancel_earlyValid_T_10 = _sink_ACancel_earlyValid_T_9 | _sink_ACancel_earlyValid_T_6; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170669:4]
  wire  _sink_ACancel_earlyValid_T_7 = state__3 & out_3_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170666:4]
  wire  _sink_ACancel_earlyValid_T_11 = _sink_ACancel_earlyValid_T_10 | _sink_ACancel_earlyValid_T_7; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170670:4]
  wire  _sink_ACancel_earlyValid_T_8 = state__4 & out_4_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170667:4]
  wire  _sink_ACancel_earlyValid_T_12 = _sink_ACancel_earlyValid_T_11 | _sink_ACancel_earlyValid_T_8; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170671:4]
  wire  sink_ACancel_earlyValid = idle ? _T_67 : _sink_ACancel_earlyValid_T_12; // @[Arbiter.scala 125:29 chipyard.TestHarness.LargeBoomConfig.fir 170674:4]
  wire  _beatsLeft_T_2 = io_mem_acquire_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 50:33 chipyard.TestHarness.LargeBoomConfig.fir 170629:4]
  wire [7:0] _GEN_75 = {{7'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52 chipyard.TestHarness.LargeBoomConfig.fir 170630:4]
  wire [7:0] _beatsLeft_T_4 = beatsLeft - _GEN_75; // @[Arbiter.scala 113:52 chipyard.TestHarness.LargeBoomConfig.fir 170631:4]
  wire  allowed__0 = idle ? readys__0 : state__0; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170648:4]
  wire  allowed__1 = idle ? readys__1 : state__1; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170648:4]
  wire  allowed__2 = idle ? readys__2 : state__2; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170648:4]
  wire  allowed__3 = idle ? readys__3 : state__3; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170648:4]
  wire  allowed__4 = idle ? readys__4 : state__4; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170648:4]
  wire [127:0] out_4_bits_data = mmios_0_io_mem_access_bits_data; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170482:4]
  wire [15:0] _T_108 = muxStateEarly__0 ? 16'hffff : 16'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170713:4]
  wire [15:0] _T_109 = muxStateEarly__1 ? 16'hffff : 16'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170714:4]
  wire [15:0] _T_110 = muxStateEarly__2 ? 16'hffff : 16'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170715:4]
  wire [15:0] _T_111 = muxStateEarly__3 ? 16'hffff : 16'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170716:4]
  wire [15:0] out_4_bits_mask = mmios_0_io_mem_access_bits_mask; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170483:4]
  wire [15:0] _T_112 = muxStateEarly__4 ? out_4_bits_mask : 16'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170717:4]
  wire [15:0] _T_113 = _T_108 | _T_109; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170718:4]
  wire [15:0] _T_114 = _T_113 | _T_110; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170719:4]
  wire [15:0] _T_115 = _T_114 | _T_111; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170720:4]
  wire [31:0] out_bits_address = mshrs_0_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170430:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170436:4]
  wire [31:0] _T_117 = muxStateEarly__0 ? out_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170727:4]
  wire [31:0] out_1_bits_address = mshrs_1_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170442:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170448:4]
  wire [31:0] _T_118 = muxStateEarly__1 ? out_1_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170728:4]
  wire [31:0] out_2_bits_address = mshrs_2_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170454:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170460:4]
  wire [31:0] _T_119 = muxStateEarly__2 ? out_2_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170729:4]
  wire [31:0] out_3_bits_address = mshrs_3_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170466:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170472:4]
  wire [31:0] _T_120 = muxStateEarly__3 ? out_3_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170730:4]
  wire [31:0] out_4_bits_address = mmios_0_io_mem_access_bits_address; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170484:4]
  wire [31:0] _T_121 = muxStateEarly__4 ? out_4_bits_address : 32'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170731:4]
  wire [31:0] _T_122 = _T_117 | _T_118; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170732:4]
  wire [31:0] _T_123 = _T_122 | _T_119; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170733:4]
  wire [31:0] _T_124 = _T_123 | _T_120; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170734:4]
  wire [2:0] out_bits_source = mshrs_0_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170430:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170437:4]
  wire [2:0] _T_126 = muxStateEarly__0 ? out_bits_source : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170739:4]
  wire [2:0] out_1_bits_source = mshrs_1_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170442:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170449:4]
  wire [2:0] _T_127 = muxStateEarly__1 ? out_1_bits_source : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170740:4]
  wire [2:0] out_2_bits_source = mshrs_2_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170454:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170461:4]
  wire [2:0] _T_128 = muxStateEarly__2 ? out_2_bits_source : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170741:4]
  wire [2:0] out_3_bits_source = mshrs_3_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170466:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170473:4]
  wire [2:0] _T_129 = muxStateEarly__3 ? out_3_bits_source : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170742:4]
  wire [2:0] out_4_bits_source = mmios_0_io_mem_access_bits_source; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170485:4]
  wire [2:0] _T_130 = muxStateEarly__4 ? out_4_bits_source : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170743:4]
  wire [2:0] _T_131 = _T_126 | _T_127; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170744:4]
  wire [2:0] _T_132 = _T_131 | _T_128; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170745:4]
  wire [2:0] _T_133 = _T_132 | _T_129; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170746:4]
  wire [3:0] _T_135 = muxStateEarly__0 ? 4'h6 : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170751:4]
  wire [3:0] _T_136 = muxStateEarly__1 ? 4'h6 : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170752:4]
  wire [3:0] _T_137 = muxStateEarly__2 ? 4'h6 : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170753:4]
  wire [3:0] _T_138 = muxStateEarly__3 ? 4'h6 : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170754:4]
  wire [3:0] out_4_bits_size = mmios_0_io_mem_access_bits_size; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170486:4]
  wire [3:0] _T_139 = muxStateEarly__4 ? out_4_bits_size : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170755:4]
  wire [3:0] _T_140 = _T_135 | _T_136; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170756:4]
  wire [3:0] _T_141 = _T_140 | _T_137; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170757:4]
  wire [3:0] _T_142 = _T_141 | _T_138; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170758:4]
  wire [2:0] out_bits_param = mshrs_0_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170430:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170439:4]
  wire [2:0] _T_144 = muxStateEarly__0 ? out_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170763:4]
  wire [2:0] out_1_bits_param = mshrs_1_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170442:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170451:4]
  wire [2:0] _T_145 = muxStateEarly__1 ? out_1_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170764:4]
  wire [2:0] out_2_bits_param = mshrs_2_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170454:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170463:4]
  wire [2:0] _T_146 = muxStateEarly__2 ? out_2_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170765:4]
  wire [2:0] out_3_bits_param = mshrs_3_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170466:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170475:4]
  wire [2:0] _T_147 = muxStateEarly__3 ? out_3_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170766:4]
  wire [2:0] out_4_bits_param = mmios_0_io_mem_access_bits_param; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170487:4]
  wire [2:0] _T_148 = muxStateEarly__4 ? out_4_bits_param : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170767:4]
  wire [2:0] _T_149 = _T_144 | _T_145; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170768:4]
  wire [2:0] _T_150 = _T_149 | _T_146; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170769:4]
  wire [2:0] _T_151 = _T_150 | _T_147; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170770:4]
  wire [2:0] _T_153 = muxStateEarly__0 ? 3'h6 : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170775:4]
  wire [2:0] _T_154 = muxStateEarly__1 ? 3'h6 : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170776:4]
  wire [2:0] _T_155 = muxStateEarly__2 ? 3'h6 : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170777:4]
  wire [2:0] _T_156 = muxStateEarly__3 ? 3'h6 : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170778:4]
  wire [2:0] out_4_bits_opcode = mmios_0_io_mem_access_bits_opcode; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170478:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170488:4]
  wire [2:0] _T_157 = muxStateEarly__4 ? out_4_bits_opcode : 3'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170779:4]
  wire [2:0] _T_158 = _T_153 | _T_154; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170780:4]
  wire [2:0] _T_159 = _T_158 | _T_155; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170781:4]
  wire [2:0] _T_160 = _T_159 | _T_156; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170782:4]
  reg  beatsLeft_1; // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 170839:4]
  wire  idle_1 = ~beatsLeft_1; // @[Arbiter.scala 88:28 chipyard.TestHarness.LargeBoomConfig.fir 170840:4]
  wire  latch_1 = idle_1 & io_mem_finish_ready; // @[Arbiter.scala 89:24 chipyard.TestHarness.LargeBoomConfig.fir 170841:4]
  wire  out_6_earlyValid = mshrs_0_io_mem_finish_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170819:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170820:4]
  wire  out_7_earlyValid = mshrs_1_io_mem_finish_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170824:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170825:4]
  wire  out_8_earlyValid = mshrs_2_io_mem_finish_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170829:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170830:4]
  wire  out_9_earlyValid = mshrs_3_io_mem_finish_valid; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170834:4 ReadyValidCancel.scala 71:20 chipyard.TestHarness.LargeBoomConfig.fir 170835:4]
  wire [3:0] _readys_T_19 = {out_9_earlyValid,out_8_earlyValid,out_7_earlyValid,out_6_earlyValid}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 170852:4]
  wire [4:0] _readys_T_20 = {_readys_T_19, 1'h0}; // @[package.scala 244:48 chipyard.TestHarness.LargeBoomConfig.fir 170853:4]
  wire [3:0] _readys_T_22 = _readys_T_19 | _readys_T_20[3:0]; // @[package.scala 244:43 chipyard.TestHarness.LargeBoomConfig.fir 170855:4]
  wire [5:0] _readys_T_23 = {_readys_T_22, 2'h0}; // @[package.scala 244:48 chipyard.TestHarness.LargeBoomConfig.fir 170856:4]
  wire [3:0] _readys_T_25 = _readys_T_22 | _readys_T_23[3:0]; // @[package.scala 244:43 chipyard.TestHarness.LargeBoomConfig.fir 170858:4]
  wire [4:0] _readys_T_27 = {_readys_T_25, 1'h0}; // @[Arbiter.scala 16:78 chipyard.TestHarness.LargeBoomConfig.fir 170860:4]
  wire [3:0] _readys_T_29 = ~_readys_T_27[3:0]; // @[Arbiter.scala 16:61 chipyard.TestHarness.LargeBoomConfig.fir 170862:4]
  wire  readys_1_0 = _readys_T_29[0]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170863:4]
  wire  readys_1_1 = _readys_T_29[1]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170864:4]
  wire  readys_1_2 = _readys_T_29[2]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170865:4]
  wire  readys_1_3 = _readys_T_29[3]; // @[Arbiter.scala 95:86 chipyard.TestHarness.LargeBoomConfig.fir 170866:4]
  wire  earlyWinner_1_0 = readys_1_0 & out_6_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170872:4]
  wire  earlyWinner_1_1 = readys_1_1 & out_7_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170873:4]
  wire  earlyWinner_1_2 = readys_1_2 & out_8_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170874:4]
  wire  earlyWinner_1_3 = readys_1_3 & out_9_earlyValid; // @[Arbiter.scala 97:79 chipyard.TestHarness.LargeBoomConfig.fir 170875:4]
  wire  prefixOR_2_1 = earlyWinner_1_0 | earlyWinner_1_1; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170891:4]
  wire  prefixOR_3_1 = prefixOR_2_1 | earlyWinner_1_2; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170892:4]
  wire  _prefixOR_T_1 = prefixOR_3_1 | earlyWinner_1_3; // @[Arbiter.scala 104:53 chipyard.TestHarness.LargeBoomConfig.fir 170893:4]
  wire  _T_163 = ~earlyWinner_1_0; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170895:4]
  wire  _T_166 = ~earlyWinner_1_1; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170898:4]
  wire  _T_167 = _T_163 | _T_166; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170899:4]
  wire  _T_168 = ~prefixOR_2_1; // @[Arbiter.scala 105:61 chipyard.TestHarness.LargeBoomConfig.fir 170900:4]
  wire  _T_169 = ~earlyWinner_1_2; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170901:4]
  wire  _T_170 = _T_168 | _T_169; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170902:4]
  wire  _T_171 = ~prefixOR_3_1; // @[Arbiter.scala 105:61 chipyard.TestHarness.LargeBoomConfig.fir 170903:4]
  wire  _T_172 = ~earlyWinner_1_3; // @[Arbiter.scala 105:67 chipyard.TestHarness.LargeBoomConfig.fir 170904:4]
  wire  _T_173 = _T_171 | _T_172; // @[Arbiter.scala 105:64 chipyard.TestHarness.LargeBoomConfig.fir 170905:4]
  wire  _T_175 = _T_167 & _T_170; // @[Arbiter.scala 105:82 chipyard.TestHarness.LargeBoomConfig.fir 170907:4]
  wire  _T_176 = _T_175 & _T_173; // @[Arbiter.scala 105:82 chipyard.TestHarness.LargeBoomConfig.fir 170908:4]
  wire  _T_178 = _T_176 | reset; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170910:4]
  wire  _T_179 = ~_T_178; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170911:4]
  wire  _T_180 = out_6_earlyValid | out_7_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170916:4]
  wire  _T_181 = _T_180 | out_8_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170917:4]
  wire  _T_182 = _T_181 | out_9_earlyValid; // @[Arbiter.scala 107:36 chipyard.TestHarness.LargeBoomConfig.fir 170918:4]
  wire  _T_183 = ~_T_182; // @[Arbiter.scala 107:15 chipyard.TestHarness.LargeBoomConfig.fir 170919:4]
  wire  _T_187 = _T_183 | _prefixOR_T_1; // @[Arbiter.scala 107:41 chipyard.TestHarness.LargeBoomConfig.fir 170923:4]
  wire  _T_189 = _T_187 | reset; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170925:4]
  wire  _T_190 = ~_T_189; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170926:4]
  wire  _T_198 = _T_183 | _T_182; // @[Arbiter.scala 108:41 chipyard.TestHarness.LargeBoomConfig.fir 170938:4]
  wire  _T_200 = _T_198 | reset; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170940:4]
  wire  _T_201 = ~_T_200; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170941:4]
  reg  state_1_0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
  reg  state_1_1; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
  reg  state_1_2; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
  wire  muxStateEarly_1_2 = idle_1 ? earlyWinner_1_2 : state_1_2; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
  reg  state_1_3; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
  wire  muxStateEarly_1_3 = idle_1 ? earlyWinner_1_3 : state_1_3; // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
  wire  _sink_ACancel_earlyValid_T_17 = state_1_0 & out_6_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170984:4]
  wire  _sink_ACancel_earlyValid_T_18 = state_1_1 & out_7_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170985:4]
  wire  _sink_ACancel_earlyValid_T_21 = _sink_ACancel_earlyValid_T_17 | _sink_ACancel_earlyValid_T_18; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170988:4]
  wire  _sink_ACancel_earlyValid_T_19 = state_1_2 & out_8_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170986:4]
  wire  _sink_ACancel_earlyValid_T_22 = _sink_ACancel_earlyValid_T_21 | _sink_ACancel_earlyValid_T_19; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170989:4]
  wire  _sink_ACancel_earlyValid_T_20 = state_1_3 & out_9_earlyValid; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170987:4]
  wire  _sink_ACancel_earlyValid_T_23 = _sink_ACancel_earlyValid_T_22 | _sink_ACancel_earlyValid_T_20; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170990:4]
  wire  sink_ACancel_1_earlyValid = idle_1 ? _T_182 : _sink_ACancel_earlyValid_T_23; // @[Arbiter.scala 125:29 chipyard.TestHarness.LargeBoomConfig.fir 170993:4]
  wire  _beatsLeft_T_8 = io_mem_finish_ready & sink_ACancel_1_earlyValid; // @[ReadyValidCancel.scala 50:33 chipyard.TestHarness.LargeBoomConfig.fir 170955:4]
  wire  _beatsLeft_T_10 = beatsLeft_1 - _beatsLeft_T_8; // @[Arbiter.scala 113:52 chipyard.TestHarness.LargeBoomConfig.fir 170957:4]
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170972:4]
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170972:4]
  wire  allowed_1_2 = idle_1 ? readys_1_2 : state_1_2; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170972:4]
  wire  allowed_1_3 = idle_1 ? readys_1_3 : state_1_3; // @[Arbiter.scala 121:24 chipyard.TestHarness.LargeBoomConfig.fir 170972:4]
  wire [3:0] out_6_bits_sink = mshrs_0_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170819:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170822:4]
  wire [3:0] _T_202 = muxStateEarly_1_0 ? out_6_bits_sink : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171006:4]
  wire [3:0] out_7_bits_sink = mshrs_1_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170824:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170827:4]
  wire [3:0] _T_203 = muxStateEarly_1_1 ? out_7_bits_sink : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171007:4]
  wire [3:0] out_8_bits_sink = mshrs_2_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170829:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170832:4]
  wire [3:0] _T_204 = muxStateEarly_1_2 ? out_8_bits_sink : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171008:4]
  wire [3:0] out_9_bits_sink = mshrs_3_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 70:19 chipyard.TestHarness.LargeBoomConfig.fir 170834:4 ReadyValidCancel.scala 73:14 chipyard.TestHarness.LargeBoomConfig.fir 170837:4]
  wire [3:0] _T_205 = muxStateEarly_1_3 ? out_9_bits_sink : 4'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171009:4]
  wire [3:0] _T_206 = _T_202 | _T_203; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171010:4]
  wire [3:0] _T_207 = _T_206 | _T_204; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171011:4]
  wire  _io_req_0_ready_T_2 = tag_match_0 & sec_rdy; // @[mshrs.scala 745:75 chipyard.TestHarness.LargeBoomConfig.fir 171126:4]
  wire  _io_req_0_ready_T_3 = idx_match_0 ? _io_req_0_ready_T_2 : pri_rdy; // @[mshrs.scala 745:47 chipyard.TestHarness.LargeBoomConfig.fir 171127:4]
  wire  _io_req_0_ready_T_4 = sdq_rdy & _io_req_0_ready_T_3; // @[mshrs.scala 745:41 chipyard.TestHarness.LargeBoomConfig.fir 171128:4]
  wire  _io_secondary_miss_0_T = idx_match_0 & way_match_0; // @[mshrs.scala 746:42 chipyard.TestHarness.LargeBoomConfig.fir 171132:4]
  wire  _free_sdq_T = io_replay_ready & io_replay_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 171141:4]
  wire  _free_sdq_T_1 = io_replay_bits_uop_mem_cmd == 5'h1; // @[Consts.scala 82:32 chipyard.TestHarness.LargeBoomConfig.fir 171142:4]
  wire  _free_sdq_T_2 = io_replay_bits_uop_mem_cmd == 5'h11; // @[Consts.scala 82:49 chipyard.TestHarness.LargeBoomConfig.fir 171143:4]
  wire  _free_sdq_T_3 = _free_sdq_T_1 | _free_sdq_T_2; // @[Consts.scala 82:42 chipyard.TestHarness.LargeBoomConfig.fir 171144:4]
  wire  _free_sdq_T_4 = io_replay_bits_uop_mem_cmd == 5'h7; // @[Consts.scala 82:66 chipyard.TestHarness.LargeBoomConfig.fir 171145:4]
  wire  _free_sdq_T_5 = _free_sdq_T_3 | _free_sdq_T_4; // @[Consts.scala 82:59 chipyard.TestHarness.LargeBoomConfig.fir 171146:4]
  wire  _free_sdq_T_6 = io_replay_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171147:4]
  wire  _free_sdq_T_7 = io_replay_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171148:4]
  wire  _free_sdq_T_8 = io_replay_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171149:4]
  wire  _free_sdq_T_9 = io_replay_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171150:4]
  wire  _free_sdq_T_10 = _free_sdq_T_6 | _free_sdq_T_7; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171151:4]
  wire  _free_sdq_T_11 = _free_sdq_T_10 | _free_sdq_T_8; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171152:4]
  wire  _free_sdq_T_12 = _free_sdq_T_11 | _free_sdq_T_9; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171153:4]
  wire  _free_sdq_T_13 = io_replay_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171154:4]
  wire  _free_sdq_T_14 = io_replay_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171155:4]
  wire  _free_sdq_T_15 = io_replay_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171156:4]
  wire  _free_sdq_T_16 = io_replay_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171157:4]
  wire  _free_sdq_T_17 = io_replay_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 171158:4]
  wire  _free_sdq_T_18 = _free_sdq_T_13 | _free_sdq_T_14; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171159:4]
  wire  _free_sdq_T_19 = _free_sdq_T_18 | _free_sdq_T_15; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171160:4]
  wire  _free_sdq_T_20 = _free_sdq_T_19 | _free_sdq_T_16; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171161:4]
  wire  _free_sdq_T_21 = _free_sdq_T_20 | _free_sdq_T_17; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 171162:4]
  wire  _free_sdq_T_22 = _free_sdq_T_12 | _free_sdq_T_21; // @[Consts.scala 79:44 chipyard.TestHarness.LargeBoomConfig.fir 171163:4]
  wire  _free_sdq_T_23 = _free_sdq_T_5 | _free_sdq_T_22; // @[Consts.scala 82:76 chipyard.TestHarness.LargeBoomConfig.fir 171164:4]
  wire  free_sdq = _free_sdq_T & _free_sdq_T_23; // @[mshrs.scala 751:35 chipyard.TestHarness.LargeBoomConfig.fir 171165:4]
  wire  _T_209 = io_replay_valid | sdq_enq; // @[mshrs.scala 756:25 chipyard.TestHarness.LargeBoomConfig.fir 171171:4]
  wire [31:0] _sdq_val_T = 32'h1 << replay_arb_io_out_bits_sdq_id; // @[OneHot.scala 58:35 chipyard.TestHarness.LargeBoomConfig.fir 171173:6]
  wire [16:0] _sdq_val_T_2 = free_sdq ? 17'h1ffff : 17'h0; // @[Bitwise.scala 72:12 chipyard.TestHarness.LargeBoomConfig.fir 171175:6]
  wire [31:0] _GEN_76 = {{15'd0}, _sdq_val_T_2}; // @[mshrs.scala 757:68 chipyard.TestHarness.LargeBoomConfig.fir 171176:6]
  wire [31:0] _sdq_val_T_3 = _sdq_val_T & _GEN_76; // @[mshrs.scala 757:68 chipyard.TestHarness.LargeBoomConfig.fir 171176:6]
  wire [31:0] _sdq_val_T_4 = ~_sdq_val_T_3; // @[mshrs.scala 757:26 chipyard.TestHarness.LargeBoomConfig.fir 171177:6]
  wire [31:0] _GEN_77 = {{15'd0}, sdq_val}; // @[mshrs.scala 757:24 chipyard.TestHarness.LargeBoomConfig.fir 171178:6]
  wire [31:0] _sdq_val_T_5 = _GEN_77 & _sdq_val_T_4; // @[mshrs.scala 757:24 chipyard.TestHarness.LargeBoomConfig.fir 171178:6]
  wire [16:0] _sdq_val_T_25 = _sdq_alloc_id_T_1[16] ? 17'h10000 : 17'h0; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171198:6]
  wire [16:0] _sdq_val_T_26 = _sdq_alloc_id_T_1[15] ? 17'h8000 : _sdq_val_T_25; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171199:6]
  wire [16:0] _sdq_val_T_27 = _sdq_alloc_id_T_1[14] ? 17'h4000 : _sdq_val_T_26; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171200:6]
  wire [16:0] _sdq_val_T_28 = _sdq_alloc_id_T_1[13] ? 17'h2000 : _sdq_val_T_27; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171201:6]
  wire [16:0] _sdq_val_T_29 = _sdq_alloc_id_T_1[12] ? 17'h1000 : _sdq_val_T_28; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171202:6]
  wire [16:0] _sdq_val_T_30 = _sdq_alloc_id_T_1[11] ? 17'h800 : _sdq_val_T_29; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171203:6]
  wire [16:0] _sdq_val_T_31 = _sdq_alloc_id_T_1[10] ? 17'h400 : _sdq_val_T_30; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171204:6]
  wire [16:0] _sdq_val_T_32 = _sdq_alloc_id_T_1[9] ? 17'h200 : _sdq_val_T_31; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171205:6]
  wire [16:0] _sdq_val_T_33 = _sdq_alloc_id_T_1[8] ? 17'h100 : _sdq_val_T_32; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171206:6]
  wire [16:0] _sdq_val_T_34 = _sdq_alloc_id_T_1[7] ? 17'h80 : _sdq_val_T_33; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171207:6]
  wire [16:0] _sdq_val_T_35 = _sdq_alloc_id_T_1[6] ? 17'h40 : _sdq_val_T_34; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171208:6]
  wire [16:0] _sdq_val_T_36 = _sdq_alloc_id_T_1[5] ? 17'h20 : _sdq_val_T_35; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171209:6]
  wire [16:0] _sdq_val_T_37 = _sdq_alloc_id_T_1[4] ? 17'h10 : _sdq_val_T_36; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171210:6]
  wire [16:0] _sdq_val_T_38 = _sdq_alloc_id_T_1[3] ? 17'h8 : _sdq_val_T_37; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171211:6]
  wire [16:0] _sdq_val_T_39 = _sdq_alloc_id_T_1[2] ? 17'h4 : _sdq_val_T_38; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171212:6]
  wire [16:0] _sdq_val_T_40 = _sdq_alloc_id_T_1[1] ? 17'h2 : _sdq_val_T_39; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171213:6]
  wire [16:0] _sdq_val_T_41 = _sdq_alloc_id_T_1[0] ? 17'h1 : _sdq_val_T_40; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 171214:6]
  wire [16:0] _sdq_val_T_43 = sdq_enq ? 17'h1ffff : 17'h0; // @[Bitwise.scala 72:12 chipyard.TestHarness.LargeBoomConfig.fir 171216:6]
  wire [16:0] _sdq_val_T_44 = _sdq_val_T_41 & _sdq_val_T_43; // @[mshrs.scala 758:49 chipyard.TestHarness.LargeBoomConfig.fir 171217:6]
  wire [31:0] _GEN_78 = {{15'd0}, _sdq_val_T_44}; // @[mshrs.scala 757:96 chipyard.TestHarness.LargeBoomConfig.fir 171218:6]
  wire [31:0] _sdq_val_T_45 = _sdq_val_T_5 | _GEN_78; // @[mshrs.scala 757:96 chipyard.TestHarness.LargeBoomConfig.fir 171218:6]
  wire [31:0] _GEN_74 = _T_209 ? _sdq_val_T_45 : {{15'd0}, sdq_val}; // @[mshrs.scala 756:37 chipyard.TestHarness.LargeBoomConfig.fir 171172:4 mshrs.scala 757:13 chipyard.TestHarness.LargeBoomConfig.fir 171219:6 mshrs.scala 555:29 chipyard.TestHarness.LargeBoomConfig.fir 168963:4]
  Arbiter lb_read_arb ( // @[mshrs.scala 569:28 chipyard.TestHarness.LargeBoomConfig.fir 169033:4]
    .io_in_0_ready(lb_read_arb_io_in_0_ready),
    .io_in_0_valid(lb_read_arb_io_in_0_valid),
    .io_in_0_bits_id(lb_read_arb_io_in_0_bits_id),
    .io_in_0_bits_offset(lb_read_arb_io_in_0_bits_offset),
    .io_in_1_ready(lb_read_arb_io_in_1_ready),
    .io_in_1_valid(lb_read_arb_io_in_1_valid),
    .io_in_1_bits_id(lb_read_arb_io_in_1_bits_id),
    .io_in_1_bits_offset(lb_read_arb_io_in_1_bits_offset),
    .io_in_2_ready(lb_read_arb_io_in_2_ready),
    .io_in_2_valid(lb_read_arb_io_in_2_valid),
    .io_in_2_bits_id(lb_read_arb_io_in_2_bits_id),
    .io_in_2_bits_offset(lb_read_arb_io_in_2_bits_offset),
    .io_in_3_ready(lb_read_arb_io_in_3_ready),
    .io_in_3_valid(lb_read_arb_io_in_3_valid),
    .io_in_3_bits_id(lb_read_arb_io_in_3_bits_id),
    .io_in_3_bits_offset(lb_read_arb_io_in_3_bits_offset),
    .io_out_ready(lb_read_arb_io_out_ready),
    .io_out_valid(lb_read_arb_io_out_valid),
    .io_out_bits_id(lb_read_arb_io_out_bits_id),
    .io_out_bits_offset(lb_read_arb_io_out_bits_offset)
  );
  Arbiter_1 lb_write_arb ( // @[mshrs.scala 570:28 chipyard.TestHarness.LargeBoomConfig.fir 169036:4]
    .io_in_0_valid(lb_write_arb_io_in_0_valid),
    .io_in_0_bits_id(lb_write_arb_io_in_0_bits_id),
    .io_in_0_bits_offset(lb_write_arb_io_in_0_bits_offset),
    .io_in_0_bits_data(lb_write_arb_io_in_0_bits_data),
    .io_in_1_ready(lb_write_arb_io_in_1_ready),
    .io_in_1_valid(lb_write_arb_io_in_1_valid),
    .io_in_1_bits_id(lb_write_arb_io_in_1_bits_id),
    .io_in_1_bits_offset(lb_write_arb_io_in_1_bits_offset),
    .io_in_1_bits_data(lb_write_arb_io_in_1_bits_data),
    .io_in_2_ready(lb_write_arb_io_in_2_ready),
    .io_in_2_valid(lb_write_arb_io_in_2_valid),
    .io_in_2_bits_id(lb_write_arb_io_in_2_bits_id),
    .io_in_2_bits_offset(lb_write_arb_io_in_2_bits_offset),
    .io_in_2_bits_data(lb_write_arb_io_in_2_bits_data),
    .io_in_3_ready(lb_write_arb_io_in_3_ready),
    .io_in_3_valid(lb_write_arb_io_in_3_valid),
    .io_in_3_bits_id(lb_write_arb_io_in_3_bits_id),
    .io_in_3_bits_offset(lb_write_arb_io_in_3_bits_offset),
    .io_in_3_bits_data(lb_write_arb_io_in_3_bits_data),
    .io_out_ready(lb_write_arb_io_out_ready),
    .io_out_valid(lb_write_arb_io_out_valid),
    .io_out_bits_id(lb_write_arb_io_out_bits_id),
    .io_out_bits_offset(lb_write_arb_io_out_bits_offset),
    .io_out_bits_data(lb_write_arb_io_out_bits_data)
  );
  Arbiter_2 meta_write_arb ( // @[mshrs.scala 599:30 chipyard.TestHarness.LargeBoomConfig.fir 169089:4]
    .io_in_0_ready(meta_write_arb_io_in_0_ready),
    .io_in_0_valid(meta_write_arb_io_in_0_valid),
    .io_in_0_bits_idx(meta_write_arb_io_in_0_bits_idx),
    .io_in_0_bits_way_en(meta_write_arb_io_in_0_bits_way_en),
    .io_in_0_bits_data_coh_state(meta_write_arb_io_in_0_bits_data_coh_state),
    .io_in_0_bits_data_tag(meta_write_arb_io_in_0_bits_data_tag),
    .io_in_1_ready(meta_write_arb_io_in_1_ready),
    .io_in_1_valid(meta_write_arb_io_in_1_valid),
    .io_in_1_bits_idx(meta_write_arb_io_in_1_bits_idx),
    .io_in_1_bits_way_en(meta_write_arb_io_in_1_bits_way_en),
    .io_in_1_bits_data_coh_state(meta_write_arb_io_in_1_bits_data_coh_state),
    .io_in_1_bits_data_tag(meta_write_arb_io_in_1_bits_data_tag),
    .io_in_2_ready(meta_write_arb_io_in_2_ready),
    .io_in_2_valid(meta_write_arb_io_in_2_valid),
    .io_in_2_bits_idx(meta_write_arb_io_in_2_bits_idx),
    .io_in_2_bits_way_en(meta_write_arb_io_in_2_bits_way_en),
    .io_in_2_bits_data_coh_state(meta_write_arb_io_in_2_bits_data_coh_state),
    .io_in_2_bits_data_tag(meta_write_arb_io_in_2_bits_data_tag),
    .io_in_3_ready(meta_write_arb_io_in_3_ready),
    .io_in_3_valid(meta_write_arb_io_in_3_valid),
    .io_in_3_bits_idx(meta_write_arb_io_in_3_bits_idx),
    .io_in_3_bits_way_en(meta_write_arb_io_in_3_bits_way_en),
    .io_in_3_bits_data_coh_state(meta_write_arb_io_in_3_bits_data_coh_state),
    .io_in_3_bits_data_tag(meta_write_arb_io_in_3_bits_data_tag),
    .io_out_ready(meta_write_arb_io_out_ready),
    .io_out_valid(meta_write_arb_io_out_valid),
    .io_out_bits_idx(meta_write_arb_io_out_bits_idx),
    .io_out_bits_way_en(meta_write_arb_io_out_bits_way_en),
    .io_out_bits_data_coh_state(meta_write_arb_io_out_bits_data_coh_state),
    .io_out_bits_data_tag(meta_write_arb_io_out_bits_data_tag)
  );
  Arbiter_3 meta_read_arb ( // @[mshrs.scala 600:30 chipyard.TestHarness.LargeBoomConfig.fir 169092:4]
    .io_in_0_ready(meta_read_arb_io_in_0_ready),
    .io_in_0_valid(meta_read_arb_io_in_0_valid),
    .io_in_0_bits_idx(meta_read_arb_io_in_0_bits_idx),
    .io_in_0_bits_way_en(meta_read_arb_io_in_0_bits_way_en),
    .io_in_0_bits_tag(meta_read_arb_io_in_0_bits_tag),
    .io_in_1_ready(meta_read_arb_io_in_1_ready),
    .io_in_1_valid(meta_read_arb_io_in_1_valid),
    .io_in_1_bits_idx(meta_read_arb_io_in_1_bits_idx),
    .io_in_1_bits_way_en(meta_read_arb_io_in_1_bits_way_en),
    .io_in_1_bits_tag(meta_read_arb_io_in_1_bits_tag),
    .io_in_2_ready(meta_read_arb_io_in_2_ready),
    .io_in_2_valid(meta_read_arb_io_in_2_valid),
    .io_in_2_bits_idx(meta_read_arb_io_in_2_bits_idx),
    .io_in_2_bits_way_en(meta_read_arb_io_in_2_bits_way_en),
    .io_in_2_bits_tag(meta_read_arb_io_in_2_bits_tag),
    .io_in_3_ready(meta_read_arb_io_in_3_ready),
    .io_in_3_valid(meta_read_arb_io_in_3_valid),
    .io_in_3_bits_idx(meta_read_arb_io_in_3_bits_idx),
    .io_in_3_bits_way_en(meta_read_arb_io_in_3_bits_way_en),
    .io_in_3_bits_tag(meta_read_arb_io_in_3_bits_tag),
    .io_out_ready(meta_read_arb_io_out_ready),
    .io_out_valid(meta_read_arb_io_out_valid),
    .io_out_bits_idx(meta_read_arb_io_out_bits_idx),
    .io_out_bits_way_en(meta_read_arb_io_out_bits_way_en),
    .io_out_bits_tag(meta_read_arb_io_out_bits_tag)
  );
  Arbiter_4 wb_req_arb ( // @[mshrs.scala 601:30 chipyard.TestHarness.LargeBoomConfig.fir 169095:4]
    .io_in_0_ready(wb_req_arb_io_in_0_ready),
    .io_in_0_valid(wb_req_arb_io_in_0_valid),
    .io_in_0_bits_tag(wb_req_arb_io_in_0_bits_tag),
    .io_in_0_bits_idx(wb_req_arb_io_in_0_bits_idx),
    .io_in_0_bits_param(wb_req_arb_io_in_0_bits_param),
    .io_in_0_bits_way_en(wb_req_arb_io_in_0_bits_way_en),
    .io_in_1_ready(wb_req_arb_io_in_1_ready),
    .io_in_1_valid(wb_req_arb_io_in_1_valid),
    .io_in_1_bits_tag(wb_req_arb_io_in_1_bits_tag),
    .io_in_1_bits_idx(wb_req_arb_io_in_1_bits_idx),
    .io_in_1_bits_param(wb_req_arb_io_in_1_bits_param),
    .io_in_1_bits_way_en(wb_req_arb_io_in_1_bits_way_en),
    .io_in_2_ready(wb_req_arb_io_in_2_ready),
    .io_in_2_valid(wb_req_arb_io_in_2_valid),
    .io_in_2_bits_tag(wb_req_arb_io_in_2_bits_tag),
    .io_in_2_bits_idx(wb_req_arb_io_in_2_bits_idx),
    .io_in_2_bits_param(wb_req_arb_io_in_2_bits_param),
    .io_in_2_bits_way_en(wb_req_arb_io_in_2_bits_way_en),
    .io_in_3_ready(wb_req_arb_io_in_3_ready),
    .io_in_3_valid(wb_req_arb_io_in_3_valid),
    .io_in_3_bits_tag(wb_req_arb_io_in_3_bits_tag),
    .io_in_3_bits_idx(wb_req_arb_io_in_3_bits_idx),
    .io_in_3_bits_param(wb_req_arb_io_in_3_bits_param),
    .io_in_3_bits_way_en(wb_req_arb_io_in_3_bits_way_en),
    .io_out_ready(wb_req_arb_io_out_ready),
    .io_out_valid(wb_req_arb_io_out_valid),
    .io_out_bits_tag(wb_req_arb_io_out_bits_tag),
    .io_out_bits_idx(wb_req_arb_io_out_bits_idx),
    .io_out_bits_param(wb_req_arb_io_out_bits_param),
    .io_out_bits_way_en(wb_req_arb_io_out_bits_way_en)
  );
  Arbiter_5 replay_arb ( // @[mshrs.scala 602:30 chipyard.TestHarness.LargeBoomConfig.fir 169098:4]
    .io_in_0_ready(replay_arb_io_in_0_ready),
    .io_in_0_valid(replay_arb_io_in_0_valid),
    .io_in_0_bits_uop_br_mask(replay_arb_io_in_0_bits_uop_br_mask),
    .io_in_0_bits_uop_ldq_idx(replay_arb_io_in_0_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx(replay_arb_io_in_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_mem_cmd(replay_arb_io_in_0_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size(replay_arb_io_in_0_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed(replay_arb_io_in_0_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_amo(replay_arb_io_in_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq(replay_arb_io_in_0_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq(replay_arb_io_in_0_bits_uop_uses_stq),
    .io_in_0_bits_addr(replay_arb_io_in_0_bits_addr),
    .io_in_0_bits_is_hella(replay_arb_io_in_0_bits_is_hella),
    .io_in_0_bits_way_en(replay_arb_io_in_0_bits_way_en),
    .io_in_0_bits_sdq_id(replay_arb_io_in_0_bits_sdq_id),
    .io_in_1_ready(replay_arb_io_in_1_ready),
    .io_in_1_valid(replay_arb_io_in_1_valid),
    .io_in_1_bits_uop_br_mask(replay_arb_io_in_1_bits_uop_br_mask),
    .io_in_1_bits_uop_ldq_idx(replay_arb_io_in_1_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx(replay_arb_io_in_1_bits_uop_stq_idx),
    .io_in_1_bits_uop_mem_cmd(replay_arb_io_in_1_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size(replay_arb_io_in_1_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed(replay_arb_io_in_1_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_amo(replay_arb_io_in_1_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq(replay_arb_io_in_1_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq(replay_arb_io_in_1_bits_uop_uses_stq),
    .io_in_1_bits_addr(replay_arb_io_in_1_bits_addr),
    .io_in_1_bits_is_hella(replay_arb_io_in_1_bits_is_hella),
    .io_in_1_bits_way_en(replay_arb_io_in_1_bits_way_en),
    .io_in_1_bits_sdq_id(replay_arb_io_in_1_bits_sdq_id),
    .io_in_2_ready(replay_arb_io_in_2_ready),
    .io_in_2_valid(replay_arb_io_in_2_valid),
    .io_in_2_bits_uop_br_mask(replay_arb_io_in_2_bits_uop_br_mask),
    .io_in_2_bits_uop_ldq_idx(replay_arb_io_in_2_bits_uop_ldq_idx),
    .io_in_2_bits_uop_stq_idx(replay_arb_io_in_2_bits_uop_stq_idx),
    .io_in_2_bits_uop_mem_cmd(replay_arb_io_in_2_bits_uop_mem_cmd),
    .io_in_2_bits_uop_mem_size(replay_arb_io_in_2_bits_uop_mem_size),
    .io_in_2_bits_uop_mem_signed(replay_arb_io_in_2_bits_uop_mem_signed),
    .io_in_2_bits_uop_is_amo(replay_arb_io_in_2_bits_uop_is_amo),
    .io_in_2_bits_uop_uses_ldq(replay_arb_io_in_2_bits_uop_uses_ldq),
    .io_in_2_bits_uop_uses_stq(replay_arb_io_in_2_bits_uop_uses_stq),
    .io_in_2_bits_addr(replay_arb_io_in_2_bits_addr),
    .io_in_2_bits_is_hella(replay_arb_io_in_2_bits_is_hella),
    .io_in_2_bits_way_en(replay_arb_io_in_2_bits_way_en),
    .io_in_2_bits_sdq_id(replay_arb_io_in_2_bits_sdq_id),
    .io_in_3_ready(replay_arb_io_in_3_ready),
    .io_in_3_valid(replay_arb_io_in_3_valid),
    .io_in_3_bits_uop_br_mask(replay_arb_io_in_3_bits_uop_br_mask),
    .io_in_3_bits_uop_ldq_idx(replay_arb_io_in_3_bits_uop_ldq_idx),
    .io_in_3_bits_uop_stq_idx(replay_arb_io_in_3_bits_uop_stq_idx),
    .io_in_3_bits_uop_mem_cmd(replay_arb_io_in_3_bits_uop_mem_cmd),
    .io_in_3_bits_uop_mem_size(replay_arb_io_in_3_bits_uop_mem_size),
    .io_in_3_bits_uop_mem_signed(replay_arb_io_in_3_bits_uop_mem_signed),
    .io_in_3_bits_uop_is_amo(replay_arb_io_in_3_bits_uop_is_amo),
    .io_in_3_bits_uop_uses_ldq(replay_arb_io_in_3_bits_uop_uses_ldq),
    .io_in_3_bits_uop_uses_stq(replay_arb_io_in_3_bits_uop_uses_stq),
    .io_in_3_bits_addr(replay_arb_io_in_3_bits_addr),
    .io_in_3_bits_is_hella(replay_arb_io_in_3_bits_is_hella),
    .io_in_3_bits_way_en(replay_arb_io_in_3_bits_way_en),
    .io_in_3_bits_sdq_id(replay_arb_io_in_3_bits_sdq_id),
    .io_out_ready(replay_arb_io_out_ready),
    .io_out_valid(replay_arb_io_out_valid),
    .io_out_bits_uop_br_mask(replay_arb_io_out_bits_uop_br_mask),
    .io_out_bits_uop_ldq_idx(replay_arb_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx(replay_arb_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_mem_cmd(replay_arb_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size(replay_arb_io_out_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed(replay_arb_io_out_bits_uop_mem_signed),
    .io_out_bits_uop_is_amo(replay_arb_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq(replay_arb_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq(replay_arb_io_out_bits_uop_uses_stq),
    .io_out_bits_addr(replay_arb_io_out_bits_addr),
    .io_out_bits_is_hella(replay_arb_io_out_bits_is_hella),
    .io_out_bits_way_en(replay_arb_io_out_bits_way_en),
    .io_out_bits_sdq_id(replay_arb_io_out_bits_sdq_id)
  );
  Arbiter_6 resp_arb ( // @[mshrs.scala 603:30 chipyard.TestHarness.LargeBoomConfig.fir 169101:4]
    .io_in_0_ready(resp_arb_io_in_0_ready),
    .io_in_0_valid(resp_arb_io_in_0_valid),
    .io_in_0_bits_uop_br_mask(resp_arb_io_in_0_bits_uop_br_mask),
    .io_in_0_bits_uop_ldq_idx(resp_arb_io_in_0_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx(resp_arb_io_in_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_is_amo(resp_arb_io_in_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq(resp_arb_io_in_0_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq(resp_arb_io_in_0_bits_uop_uses_stq),
    .io_in_0_bits_data(resp_arb_io_in_0_bits_data),
    .io_in_0_bits_is_hella(resp_arb_io_in_0_bits_is_hella),
    .io_in_1_ready(resp_arb_io_in_1_ready),
    .io_in_1_valid(resp_arb_io_in_1_valid),
    .io_in_1_bits_uop_br_mask(resp_arb_io_in_1_bits_uop_br_mask),
    .io_in_1_bits_uop_ldq_idx(resp_arb_io_in_1_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx(resp_arb_io_in_1_bits_uop_stq_idx),
    .io_in_1_bits_uop_is_amo(resp_arb_io_in_1_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq(resp_arb_io_in_1_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq(resp_arb_io_in_1_bits_uop_uses_stq),
    .io_in_1_bits_data(resp_arb_io_in_1_bits_data),
    .io_in_1_bits_is_hella(resp_arb_io_in_1_bits_is_hella),
    .io_in_2_ready(resp_arb_io_in_2_ready),
    .io_in_2_valid(resp_arb_io_in_2_valid),
    .io_in_2_bits_uop_br_mask(resp_arb_io_in_2_bits_uop_br_mask),
    .io_in_2_bits_uop_ldq_idx(resp_arb_io_in_2_bits_uop_ldq_idx),
    .io_in_2_bits_uop_stq_idx(resp_arb_io_in_2_bits_uop_stq_idx),
    .io_in_2_bits_uop_is_amo(resp_arb_io_in_2_bits_uop_is_amo),
    .io_in_2_bits_uop_uses_ldq(resp_arb_io_in_2_bits_uop_uses_ldq),
    .io_in_2_bits_uop_uses_stq(resp_arb_io_in_2_bits_uop_uses_stq),
    .io_in_2_bits_data(resp_arb_io_in_2_bits_data),
    .io_in_2_bits_is_hella(resp_arb_io_in_2_bits_is_hella),
    .io_in_3_ready(resp_arb_io_in_3_ready),
    .io_in_3_valid(resp_arb_io_in_3_valid),
    .io_in_3_bits_uop_br_mask(resp_arb_io_in_3_bits_uop_br_mask),
    .io_in_3_bits_uop_ldq_idx(resp_arb_io_in_3_bits_uop_ldq_idx),
    .io_in_3_bits_uop_stq_idx(resp_arb_io_in_3_bits_uop_stq_idx),
    .io_in_3_bits_uop_is_amo(resp_arb_io_in_3_bits_uop_is_amo),
    .io_in_3_bits_uop_uses_ldq(resp_arb_io_in_3_bits_uop_uses_ldq),
    .io_in_3_bits_uop_uses_stq(resp_arb_io_in_3_bits_uop_uses_stq),
    .io_in_3_bits_data(resp_arb_io_in_3_bits_data),
    .io_in_3_bits_is_hella(resp_arb_io_in_3_bits_is_hella),
    .io_in_4_ready(resp_arb_io_in_4_ready),
    .io_in_4_valid(resp_arb_io_in_4_valid),
    .io_in_4_bits_uop_br_mask(resp_arb_io_in_4_bits_uop_br_mask),
    .io_in_4_bits_uop_ldq_idx(resp_arb_io_in_4_bits_uop_ldq_idx),
    .io_in_4_bits_uop_stq_idx(resp_arb_io_in_4_bits_uop_stq_idx),
    .io_in_4_bits_uop_is_amo(resp_arb_io_in_4_bits_uop_is_amo),
    .io_in_4_bits_uop_uses_ldq(resp_arb_io_in_4_bits_uop_uses_ldq),
    .io_in_4_bits_uop_uses_stq(resp_arb_io_in_4_bits_uop_uses_stq),
    .io_in_4_bits_data(resp_arb_io_in_4_bits_data),
    .io_out_ready(resp_arb_io_out_ready),
    .io_out_valid(resp_arb_io_out_valid),
    .io_out_bits_uop_br_mask(resp_arb_io_out_bits_uop_br_mask),
    .io_out_bits_uop_ldq_idx(resp_arb_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx(resp_arb_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_is_amo(resp_arb_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq(resp_arb_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq(resp_arb_io_out_bits_uop_uses_stq),
    .io_out_bits_data(resp_arb_io_out_bits_data),
    .io_out_bits_is_hella(resp_arb_io_out_bits_is_hella)
  );
  Arbiter_7 refill_arb ( // @[mshrs.scala 604:30 chipyard.TestHarness.LargeBoomConfig.fir 169104:4]
    .io_in_0_ready(refill_arb_io_in_0_ready),
    .io_in_0_valid(refill_arb_io_in_0_valid),
    .io_in_0_bits_way_en(refill_arb_io_in_0_bits_way_en),
    .io_in_0_bits_addr(refill_arb_io_in_0_bits_addr),
    .io_in_0_bits_data(refill_arb_io_in_0_bits_data),
    .io_in_1_ready(refill_arb_io_in_1_ready),
    .io_in_1_valid(refill_arb_io_in_1_valid),
    .io_in_1_bits_way_en(refill_arb_io_in_1_bits_way_en),
    .io_in_1_bits_addr(refill_arb_io_in_1_bits_addr),
    .io_in_1_bits_data(refill_arb_io_in_1_bits_data),
    .io_in_2_ready(refill_arb_io_in_2_ready),
    .io_in_2_valid(refill_arb_io_in_2_valid),
    .io_in_2_bits_way_en(refill_arb_io_in_2_bits_way_en),
    .io_in_2_bits_addr(refill_arb_io_in_2_bits_addr),
    .io_in_2_bits_data(refill_arb_io_in_2_bits_data),
    .io_in_3_ready(refill_arb_io_in_3_ready),
    .io_in_3_valid(refill_arb_io_in_3_valid),
    .io_in_3_bits_way_en(refill_arb_io_in_3_bits_way_en),
    .io_in_3_bits_addr(refill_arb_io_in_3_bits_addr),
    .io_in_3_bits_data(refill_arb_io_in_3_bits_data),
    .io_out_ready(refill_arb_io_out_ready),
    .io_out_valid(refill_arb_io_out_valid),
    .io_out_bits_way_en(refill_arb_io_out_bits_way_en),
    .io_out_bits_addr(refill_arb_io_out_bits_addr),
    .io_out_bits_data(refill_arb_io_out_bits_data)
  );
  BoomMSHR mshrs_0 ( // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169120:4]
    .clock(mshrs_0_clock),
    .reset(mshrs_0_reset),
    .io_id(mshrs_0_io_id),
    .io_req_pri_val(mshrs_0_io_req_pri_val),
    .io_req_pri_rdy(mshrs_0_io_req_pri_rdy),
    .io_req_sec_val(mshrs_0_io_req_sec_val),
    .io_req_sec_rdy(mshrs_0_io_req_sec_rdy),
    .io_clear_prefetch(mshrs_0_io_clear_prefetch),
    .io_brupdate_b1_resolve_mask(mshrs_0_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_0_io_brupdate_b1_mispredict_mask),
    .io_exception(mshrs_0_io_exception),
    .io_req_uop_br_mask(mshrs_0_io_req_uop_br_mask),
    .io_req_uop_ldq_idx(mshrs_0_io_req_uop_ldq_idx),
    .io_req_uop_stq_idx(mshrs_0_io_req_uop_stq_idx),
    .io_req_uop_mem_cmd(mshrs_0_io_req_uop_mem_cmd),
    .io_req_uop_mem_size(mshrs_0_io_req_uop_mem_size),
    .io_req_uop_mem_signed(mshrs_0_io_req_uop_mem_signed),
    .io_req_uop_is_amo(mshrs_0_io_req_uop_is_amo),
    .io_req_uop_uses_ldq(mshrs_0_io_req_uop_uses_ldq),
    .io_req_uop_uses_stq(mshrs_0_io_req_uop_uses_stq),
    .io_req_addr(mshrs_0_io_req_addr),
    .io_req_is_hella(mshrs_0_io_req_is_hella),
    .io_req_tag_match(mshrs_0_io_req_tag_match),
    .io_req_old_meta_coh_state(mshrs_0_io_req_old_meta_coh_state),
    .io_req_old_meta_tag(mshrs_0_io_req_old_meta_tag),
    .io_req_way_en(mshrs_0_io_req_way_en),
    .io_req_sdq_id(mshrs_0_io_req_sdq_id),
    .io_req_is_probe(mshrs_0_io_req_is_probe),
    .io_idx_valid(mshrs_0_io_idx_valid),
    .io_idx_bits(mshrs_0_io_idx_bits),
    .io_way_valid(mshrs_0_io_way_valid),
    .io_way_bits(mshrs_0_io_way_bits),
    .io_tag_valid(mshrs_0_io_tag_valid),
    .io_tag_bits(mshrs_0_io_tag_bits),
    .io_mem_acquire_ready(mshrs_0_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_0_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(mshrs_0_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(mshrs_0_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_0_io_mem_acquire_bits_address),
    .io_mem_grant_ready(mshrs_0_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_0_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_0_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_0_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_0_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(mshrs_0_io_mem_grant_bits_sink),
    .io_mem_grant_bits_data(mshrs_0_io_mem_grant_bits_data),
    .io_mem_finish_ready(mshrs_0_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_0_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_0_io_mem_finish_bits_sink),
    .io_prober_state_valid(mshrs_0_io_prober_state_valid),
    .io_prober_state_bits(mshrs_0_io_prober_state_bits),
    .io_refill_ready(mshrs_0_io_refill_ready),
    .io_refill_valid(mshrs_0_io_refill_valid),
    .io_refill_bits_way_en(mshrs_0_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_0_io_refill_bits_addr),
    .io_refill_bits_data(mshrs_0_io_refill_bits_data),
    .io_meta_write_ready(mshrs_0_io_meta_write_ready),
    .io_meta_write_valid(mshrs_0_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_0_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_0_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state(mshrs_0_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_0_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_0_io_meta_read_ready),
    .io_meta_read_valid(mshrs_0_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_0_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_0_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_0_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_0_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_0_io_meta_resp_bits_coh_state),
    .io_wb_req_ready(mshrs_0_io_wb_req_ready),
    .io_wb_req_valid(mshrs_0_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_0_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_0_io_wb_req_bits_idx),
    .io_wb_req_bits_param(mshrs_0_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_0_io_wb_req_bits_way_en),
    .io_lb_read_ready(mshrs_0_io_lb_read_ready),
    .io_lb_read_valid(mshrs_0_io_lb_read_valid),
    .io_lb_read_bits_id(mshrs_0_io_lb_read_bits_id),
    .io_lb_read_bits_offset(mshrs_0_io_lb_read_bits_offset),
    .io_lb_resp(mshrs_0_io_lb_resp),
    .io_lb_write_ready(mshrs_0_io_lb_write_ready),
    .io_lb_write_valid(mshrs_0_io_lb_write_valid),
    .io_lb_write_bits_id(mshrs_0_io_lb_write_bits_id),
    .io_lb_write_bits_offset(mshrs_0_io_lb_write_bits_offset),
    .io_lb_write_bits_data(mshrs_0_io_lb_write_bits_data),
    .io_replay_ready(mshrs_0_io_replay_ready),
    .io_replay_valid(mshrs_0_io_replay_valid),
    .io_replay_bits_uop_br_mask(mshrs_0_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_ldq_idx(mshrs_0_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_0_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_mem_cmd(mshrs_0_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_0_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_0_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_amo(mshrs_0_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_0_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_0_io_replay_bits_uop_uses_stq),
    .io_replay_bits_addr(mshrs_0_io_replay_bits_addr),
    .io_replay_bits_is_hella(mshrs_0_io_replay_bits_is_hella),
    .io_replay_bits_way_en(mshrs_0_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_0_io_replay_bits_sdq_id),
    .io_resp_ready(mshrs_0_io_resp_ready),
    .io_resp_valid(mshrs_0_io_resp_valid),
    .io_resp_bits_uop_br_mask(mshrs_0_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx(mshrs_0_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_0_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo(mshrs_0_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_0_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_0_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data(mshrs_0_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_0_io_resp_bits_is_hella),
    .io_wb_resp(mshrs_0_io_wb_resp),
    .io_probe_rdy(mshrs_0_io_probe_rdy)
  );
  BoomMSHR mshrs_1 ( // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169399:4]
    .clock(mshrs_1_clock),
    .reset(mshrs_1_reset),
    .io_id(mshrs_1_io_id),
    .io_req_pri_val(mshrs_1_io_req_pri_val),
    .io_req_pri_rdy(mshrs_1_io_req_pri_rdy),
    .io_req_sec_val(mshrs_1_io_req_sec_val),
    .io_req_sec_rdy(mshrs_1_io_req_sec_rdy),
    .io_clear_prefetch(mshrs_1_io_clear_prefetch),
    .io_brupdate_b1_resolve_mask(mshrs_1_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_1_io_brupdate_b1_mispredict_mask),
    .io_exception(mshrs_1_io_exception),
    .io_req_uop_br_mask(mshrs_1_io_req_uop_br_mask),
    .io_req_uop_ldq_idx(mshrs_1_io_req_uop_ldq_idx),
    .io_req_uop_stq_idx(mshrs_1_io_req_uop_stq_idx),
    .io_req_uop_mem_cmd(mshrs_1_io_req_uop_mem_cmd),
    .io_req_uop_mem_size(mshrs_1_io_req_uop_mem_size),
    .io_req_uop_mem_signed(mshrs_1_io_req_uop_mem_signed),
    .io_req_uop_is_amo(mshrs_1_io_req_uop_is_amo),
    .io_req_uop_uses_ldq(mshrs_1_io_req_uop_uses_ldq),
    .io_req_uop_uses_stq(mshrs_1_io_req_uop_uses_stq),
    .io_req_addr(mshrs_1_io_req_addr),
    .io_req_is_hella(mshrs_1_io_req_is_hella),
    .io_req_tag_match(mshrs_1_io_req_tag_match),
    .io_req_old_meta_coh_state(mshrs_1_io_req_old_meta_coh_state),
    .io_req_old_meta_tag(mshrs_1_io_req_old_meta_tag),
    .io_req_way_en(mshrs_1_io_req_way_en),
    .io_req_sdq_id(mshrs_1_io_req_sdq_id),
    .io_req_is_probe(mshrs_1_io_req_is_probe),
    .io_idx_valid(mshrs_1_io_idx_valid),
    .io_idx_bits(mshrs_1_io_idx_bits),
    .io_way_valid(mshrs_1_io_way_valid),
    .io_way_bits(mshrs_1_io_way_bits),
    .io_tag_valid(mshrs_1_io_tag_valid),
    .io_tag_bits(mshrs_1_io_tag_bits),
    .io_mem_acquire_ready(mshrs_1_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_1_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(mshrs_1_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(mshrs_1_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_1_io_mem_acquire_bits_address),
    .io_mem_grant_ready(mshrs_1_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_1_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_1_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_1_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_1_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(mshrs_1_io_mem_grant_bits_sink),
    .io_mem_grant_bits_data(mshrs_1_io_mem_grant_bits_data),
    .io_mem_finish_ready(mshrs_1_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_1_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_1_io_mem_finish_bits_sink),
    .io_prober_state_valid(mshrs_1_io_prober_state_valid),
    .io_prober_state_bits(mshrs_1_io_prober_state_bits),
    .io_refill_ready(mshrs_1_io_refill_ready),
    .io_refill_valid(mshrs_1_io_refill_valid),
    .io_refill_bits_way_en(mshrs_1_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_1_io_refill_bits_addr),
    .io_refill_bits_data(mshrs_1_io_refill_bits_data),
    .io_meta_write_ready(mshrs_1_io_meta_write_ready),
    .io_meta_write_valid(mshrs_1_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_1_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_1_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state(mshrs_1_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_1_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_1_io_meta_read_ready),
    .io_meta_read_valid(mshrs_1_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_1_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_1_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_1_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_1_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_1_io_meta_resp_bits_coh_state),
    .io_wb_req_ready(mshrs_1_io_wb_req_ready),
    .io_wb_req_valid(mshrs_1_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_1_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_1_io_wb_req_bits_idx),
    .io_wb_req_bits_param(mshrs_1_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_1_io_wb_req_bits_way_en),
    .io_lb_read_ready(mshrs_1_io_lb_read_ready),
    .io_lb_read_valid(mshrs_1_io_lb_read_valid),
    .io_lb_read_bits_id(mshrs_1_io_lb_read_bits_id),
    .io_lb_read_bits_offset(mshrs_1_io_lb_read_bits_offset),
    .io_lb_resp(mshrs_1_io_lb_resp),
    .io_lb_write_ready(mshrs_1_io_lb_write_ready),
    .io_lb_write_valid(mshrs_1_io_lb_write_valid),
    .io_lb_write_bits_id(mshrs_1_io_lb_write_bits_id),
    .io_lb_write_bits_offset(mshrs_1_io_lb_write_bits_offset),
    .io_lb_write_bits_data(mshrs_1_io_lb_write_bits_data),
    .io_replay_ready(mshrs_1_io_replay_ready),
    .io_replay_valid(mshrs_1_io_replay_valid),
    .io_replay_bits_uop_br_mask(mshrs_1_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_ldq_idx(mshrs_1_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_1_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_mem_cmd(mshrs_1_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_1_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_1_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_amo(mshrs_1_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_1_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_1_io_replay_bits_uop_uses_stq),
    .io_replay_bits_addr(mshrs_1_io_replay_bits_addr),
    .io_replay_bits_is_hella(mshrs_1_io_replay_bits_is_hella),
    .io_replay_bits_way_en(mshrs_1_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_1_io_replay_bits_sdq_id),
    .io_resp_ready(mshrs_1_io_resp_ready),
    .io_resp_valid(mshrs_1_io_resp_valid),
    .io_resp_bits_uop_br_mask(mshrs_1_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx(mshrs_1_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_1_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo(mshrs_1_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_1_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_1_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data(mshrs_1_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_1_io_resp_bits_is_hella),
    .io_wb_resp(mshrs_1_io_wb_resp),
    .io_probe_rdy(mshrs_1_io_probe_rdy)
  );
  BoomMSHR mshrs_2 ( // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169678:4]
    .clock(mshrs_2_clock),
    .reset(mshrs_2_reset),
    .io_id(mshrs_2_io_id),
    .io_req_pri_val(mshrs_2_io_req_pri_val),
    .io_req_pri_rdy(mshrs_2_io_req_pri_rdy),
    .io_req_sec_val(mshrs_2_io_req_sec_val),
    .io_req_sec_rdy(mshrs_2_io_req_sec_rdy),
    .io_clear_prefetch(mshrs_2_io_clear_prefetch),
    .io_brupdate_b1_resolve_mask(mshrs_2_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_2_io_brupdate_b1_mispredict_mask),
    .io_exception(mshrs_2_io_exception),
    .io_req_uop_br_mask(mshrs_2_io_req_uop_br_mask),
    .io_req_uop_ldq_idx(mshrs_2_io_req_uop_ldq_idx),
    .io_req_uop_stq_idx(mshrs_2_io_req_uop_stq_idx),
    .io_req_uop_mem_cmd(mshrs_2_io_req_uop_mem_cmd),
    .io_req_uop_mem_size(mshrs_2_io_req_uop_mem_size),
    .io_req_uop_mem_signed(mshrs_2_io_req_uop_mem_signed),
    .io_req_uop_is_amo(mshrs_2_io_req_uop_is_amo),
    .io_req_uop_uses_ldq(mshrs_2_io_req_uop_uses_ldq),
    .io_req_uop_uses_stq(mshrs_2_io_req_uop_uses_stq),
    .io_req_addr(mshrs_2_io_req_addr),
    .io_req_is_hella(mshrs_2_io_req_is_hella),
    .io_req_tag_match(mshrs_2_io_req_tag_match),
    .io_req_old_meta_coh_state(mshrs_2_io_req_old_meta_coh_state),
    .io_req_old_meta_tag(mshrs_2_io_req_old_meta_tag),
    .io_req_way_en(mshrs_2_io_req_way_en),
    .io_req_sdq_id(mshrs_2_io_req_sdq_id),
    .io_req_is_probe(mshrs_2_io_req_is_probe),
    .io_idx_valid(mshrs_2_io_idx_valid),
    .io_idx_bits(mshrs_2_io_idx_bits),
    .io_way_valid(mshrs_2_io_way_valid),
    .io_way_bits(mshrs_2_io_way_bits),
    .io_tag_valid(mshrs_2_io_tag_valid),
    .io_tag_bits(mshrs_2_io_tag_bits),
    .io_mem_acquire_ready(mshrs_2_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_2_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(mshrs_2_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(mshrs_2_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_2_io_mem_acquire_bits_address),
    .io_mem_grant_ready(mshrs_2_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_2_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_2_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_2_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_2_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(mshrs_2_io_mem_grant_bits_sink),
    .io_mem_grant_bits_data(mshrs_2_io_mem_grant_bits_data),
    .io_mem_finish_ready(mshrs_2_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_2_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_2_io_mem_finish_bits_sink),
    .io_prober_state_valid(mshrs_2_io_prober_state_valid),
    .io_prober_state_bits(mshrs_2_io_prober_state_bits),
    .io_refill_ready(mshrs_2_io_refill_ready),
    .io_refill_valid(mshrs_2_io_refill_valid),
    .io_refill_bits_way_en(mshrs_2_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_2_io_refill_bits_addr),
    .io_refill_bits_data(mshrs_2_io_refill_bits_data),
    .io_meta_write_ready(mshrs_2_io_meta_write_ready),
    .io_meta_write_valid(mshrs_2_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_2_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_2_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state(mshrs_2_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_2_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_2_io_meta_read_ready),
    .io_meta_read_valid(mshrs_2_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_2_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_2_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_2_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_2_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_2_io_meta_resp_bits_coh_state),
    .io_wb_req_ready(mshrs_2_io_wb_req_ready),
    .io_wb_req_valid(mshrs_2_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_2_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_2_io_wb_req_bits_idx),
    .io_wb_req_bits_param(mshrs_2_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_2_io_wb_req_bits_way_en),
    .io_lb_read_ready(mshrs_2_io_lb_read_ready),
    .io_lb_read_valid(mshrs_2_io_lb_read_valid),
    .io_lb_read_bits_id(mshrs_2_io_lb_read_bits_id),
    .io_lb_read_bits_offset(mshrs_2_io_lb_read_bits_offset),
    .io_lb_resp(mshrs_2_io_lb_resp),
    .io_lb_write_ready(mshrs_2_io_lb_write_ready),
    .io_lb_write_valid(mshrs_2_io_lb_write_valid),
    .io_lb_write_bits_id(mshrs_2_io_lb_write_bits_id),
    .io_lb_write_bits_offset(mshrs_2_io_lb_write_bits_offset),
    .io_lb_write_bits_data(mshrs_2_io_lb_write_bits_data),
    .io_replay_ready(mshrs_2_io_replay_ready),
    .io_replay_valid(mshrs_2_io_replay_valid),
    .io_replay_bits_uop_br_mask(mshrs_2_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_ldq_idx(mshrs_2_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_2_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_mem_cmd(mshrs_2_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_2_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_2_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_amo(mshrs_2_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_2_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_2_io_replay_bits_uop_uses_stq),
    .io_replay_bits_addr(mshrs_2_io_replay_bits_addr),
    .io_replay_bits_is_hella(mshrs_2_io_replay_bits_is_hella),
    .io_replay_bits_way_en(mshrs_2_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_2_io_replay_bits_sdq_id),
    .io_resp_ready(mshrs_2_io_resp_ready),
    .io_resp_valid(mshrs_2_io_resp_valid),
    .io_resp_bits_uop_br_mask(mshrs_2_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx(mshrs_2_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_2_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo(mshrs_2_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_2_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_2_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data(mshrs_2_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_2_io_resp_bits_is_hella),
    .io_wb_resp(mshrs_2_io_wb_resp),
    .io_probe_rdy(mshrs_2_io_probe_rdy)
  );
  BoomMSHR mshrs_3 ( // @[mshrs.scala 620:22 chipyard.TestHarness.LargeBoomConfig.fir 169957:4]
    .clock(mshrs_3_clock),
    .reset(mshrs_3_reset),
    .io_id(mshrs_3_io_id),
    .io_req_pri_val(mshrs_3_io_req_pri_val),
    .io_req_pri_rdy(mshrs_3_io_req_pri_rdy),
    .io_req_sec_val(mshrs_3_io_req_sec_val),
    .io_req_sec_rdy(mshrs_3_io_req_sec_rdy),
    .io_clear_prefetch(mshrs_3_io_clear_prefetch),
    .io_brupdate_b1_resolve_mask(mshrs_3_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_3_io_brupdate_b1_mispredict_mask),
    .io_exception(mshrs_3_io_exception),
    .io_req_uop_br_mask(mshrs_3_io_req_uop_br_mask),
    .io_req_uop_ldq_idx(mshrs_3_io_req_uop_ldq_idx),
    .io_req_uop_stq_idx(mshrs_3_io_req_uop_stq_idx),
    .io_req_uop_mem_cmd(mshrs_3_io_req_uop_mem_cmd),
    .io_req_uop_mem_size(mshrs_3_io_req_uop_mem_size),
    .io_req_uop_mem_signed(mshrs_3_io_req_uop_mem_signed),
    .io_req_uop_is_amo(mshrs_3_io_req_uop_is_amo),
    .io_req_uop_uses_ldq(mshrs_3_io_req_uop_uses_ldq),
    .io_req_uop_uses_stq(mshrs_3_io_req_uop_uses_stq),
    .io_req_addr(mshrs_3_io_req_addr),
    .io_req_is_hella(mshrs_3_io_req_is_hella),
    .io_req_tag_match(mshrs_3_io_req_tag_match),
    .io_req_old_meta_coh_state(mshrs_3_io_req_old_meta_coh_state),
    .io_req_old_meta_tag(mshrs_3_io_req_old_meta_tag),
    .io_req_way_en(mshrs_3_io_req_way_en),
    .io_req_sdq_id(mshrs_3_io_req_sdq_id),
    .io_req_is_probe(mshrs_3_io_req_is_probe),
    .io_idx_valid(mshrs_3_io_idx_valid),
    .io_idx_bits(mshrs_3_io_idx_bits),
    .io_way_valid(mshrs_3_io_way_valid),
    .io_way_bits(mshrs_3_io_way_bits),
    .io_tag_valid(mshrs_3_io_tag_valid),
    .io_tag_bits(mshrs_3_io_tag_bits),
    .io_mem_acquire_ready(mshrs_3_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_3_io_mem_acquire_valid),
    .io_mem_acquire_bits_param(mshrs_3_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source(mshrs_3_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_3_io_mem_acquire_bits_address),
    .io_mem_grant_ready(mshrs_3_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_3_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_3_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_3_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_3_io_mem_grant_bits_size),
    .io_mem_grant_bits_sink(mshrs_3_io_mem_grant_bits_sink),
    .io_mem_grant_bits_data(mshrs_3_io_mem_grant_bits_data),
    .io_mem_finish_ready(mshrs_3_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_3_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_3_io_mem_finish_bits_sink),
    .io_prober_state_valid(mshrs_3_io_prober_state_valid),
    .io_prober_state_bits(mshrs_3_io_prober_state_bits),
    .io_refill_ready(mshrs_3_io_refill_ready),
    .io_refill_valid(mshrs_3_io_refill_valid),
    .io_refill_bits_way_en(mshrs_3_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_3_io_refill_bits_addr),
    .io_refill_bits_data(mshrs_3_io_refill_bits_data),
    .io_meta_write_ready(mshrs_3_io_meta_write_ready),
    .io_meta_write_valid(mshrs_3_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_3_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_3_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state(mshrs_3_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_3_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_3_io_meta_read_ready),
    .io_meta_read_valid(mshrs_3_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_3_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_3_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_3_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_3_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_3_io_meta_resp_bits_coh_state),
    .io_wb_req_ready(mshrs_3_io_wb_req_ready),
    .io_wb_req_valid(mshrs_3_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_3_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_3_io_wb_req_bits_idx),
    .io_wb_req_bits_param(mshrs_3_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_3_io_wb_req_bits_way_en),
    .io_lb_read_ready(mshrs_3_io_lb_read_ready),
    .io_lb_read_valid(mshrs_3_io_lb_read_valid),
    .io_lb_read_bits_id(mshrs_3_io_lb_read_bits_id),
    .io_lb_read_bits_offset(mshrs_3_io_lb_read_bits_offset),
    .io_lb_resp(mshrs_3_io_lb_resp),
    .io_lb_write_ready(mshrs_3_io_lb_write_ready),
    .io_lb_write_valid(mshrs_3_io_lb_write_valid),
    .io_lb_write_bits_id(mshrs_3_io_lb_write_bits_id),
    .io_lb_write_bits_offset(mshrs_3_io_lb_write_bits_offset),
    .io_lb_write_bits_data(mshrs_3_io_lb_write_bits_data),
    .io_replay_ready(mshrs_3_io_replay_ready),
    .io_replay_valid(mshrs_3_io_replay_valid),
    .io_replay_bits_uop_br_mask(mshrs_3_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_ldq_idx(mshrs_3_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_3_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_mem_cmd(mshrs_3_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_3_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_3_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_amo(mshrs_3_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_3_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_3_io_replay_bits_uop_uses_stq),
    .io_replay_bits_addr(mshrs_3_io_replay_bits_addr),
    .io_replay_bits_is_hella(mshrs_3_io_replay_bits_is_hella),
    .io_replay_bits_way_en(mshrs_3_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_3_io_replay_bits_sdq_id),
    .io_resp_ready(mshrs_3_io_resp_ready),
    .io_resp_valid(mshrs_3_io_resp_valid),
    .io_resp_bits_uop_br_mask(mshrs_3_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx(mshrs_3_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_3_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo(mshrs_3_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_3_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_3_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data(mshrs_3_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_3_io_resp_bits_is_hella),
    .io_wb_resp(mshrs_3_io_wb_resp),
    .io_probe_rdy(mshrs_3_io_probe_rdy)
  );
  Arbiter_8 mmio_alloc_arb ( // @[mshrs.scala 703:30 chipyard.TestHarness.LargeBoomConfig.fir 170272:4]
    .io_in_0_ready(mmio_alloc_arb_io_in_0_ready),
    .io_out_ready(mmio_alloc_arb_io_out_ready)
  );
  BoomIOMSHR mmios_0 ( // @[mshrs.scala 710:22 chipyard.TestHarness.LargeBoomConfig.fir 170275:4]
    .clock(mmios_0_clock),
    .reset(mmios_0_reset),
    .io_req_ready(mmios_0_io_req_ready),
    .io_req_valid(mmios_0_io_req_valid),
    .io_req_bits_uop_br_mask(mmios_0_io_req_bits_uop_br_mask),
    .io_req_bits_uop_ldq_idx(mmios_0_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(mmios_0_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_mem_cmd(mmios_0_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(mmios_0_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(mmios_0_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_amo(mmios_0_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(mmios_0_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(mmios_0_io_req_bits_uop_uses_stq),
    .io_req_bits_addr(mmios_0_io_req_bits_addr),
    .io_req_bits_data(mmios_0_io_req_bits_data),
    .io_resp_ready(mmios_0_io_resp_ready),
    .io_resp_valid(mmios_0_io_resp_valid),
    .io_resp_bits_uop_br_mask(mmios_0_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx(mmios_0_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mmios_0_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo(mmios_0_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mmios_0_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mmios_0_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data(mmios_0_io_resp_bits_data),
    .io_mem_access_ready(mmios_0_io_mem_access_ready),
    .io_mem_access_valid(mmios_0_io_mem_access_valid),
    .io_mem_access_bits_opcode(mmios_0_io_mem_access_bits_opcode),
    .io_mem_access_bits_param(mmios_0_io_mem_access_bits_param),
    .io_mem_access_bits_size(mmios_0_io_mem_access_bits_size),
    .io_mem_access_bits_source(mmios_0_io_mem_access_bits_source),
    .io_mem_access_bits_address(mmios_0_io_mem_access_bits_address),
    .io_mem_access_bits_mask(mmios_0_io_mem_access_bits_mask),
    .io_mem_access_bits_data(mmios_0_io_mem_access_bits_data),
    .io_mem_ack_valid(mmios_0_io_mem_ack_valid),
    .io_mem_ack_bits_data(mmios_0_io_mem_ack_bits_data)
  );
  BranchKillableQueue_4 respq ( // @[mshrs.scala 737:21 chipyard.TestHarness.LargeBoomConfig.fir 171026:4]
    .clock(respq_clock),
    .reset(respq_reset),
    .io_enq_ready(respq_io_enq_ready),
    .io_enq_valid(respq_io_enq_valid),
    .io_enq_bits_uop_br_mask(respq_io_enq_bits_uop_br_mask),
    .io_enq_bits_uop_ldq_idx(respq_io_enq_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx(respq_io_enq_bits_uop_stq_idx),
    .io_enq_bits_uop_is_amo(respq_io_enq_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq(respq_io_enq_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq(respq_io_enq_bits_uop_uses_stq),
    .io_enq_bits_data(respq_io_enq_bits_data),
    .io_enq_bits_is_hella(respq_io_enq_bits_is_hella),
    .io_deq_ready(respq_io_deq_ready),
    .io_deq_valid(respq_io_deq_valid),
    .io_deq_bits_uop_br_mask(respq_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_ldq_idx(respq_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx(respq_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_is_amo(respq_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq(respq_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq(respq_io_deq_bits_uop_uses_stq),
    .io_deq_bits_data(respq_io_deq_bits_data),
    .io_deq_bits_is_hella(respq_io_deq_bits_is_hella),
    .io_brupdate_b1_resolve_mask(respq_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(respq_io_brupdate_b1_mispredict_mask),
    .io_flush(respq_io_flush),
    .io_empty(respq_io_empty)
  );
  assign sdq_io_replay_bits_data_MPORT_addr = replay_arb_io_out_bits_sdq_id;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign sdq_io_replay_bits_data_MPORT_data = sdq[sdq_io_replay_bits_data_MPORT_addr]; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  `else
  assign sdq_io_replay_bits_data_MPORT_data = sdq_io_replay_bits_data_MPORT_addr >= 5'h11 ? _RAND_1[63:0] :
    sdq[sdq_io_replay_bits_data_MPORT_addr]; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign sdq_MPORT_data = io_req_0_bits_data;
  assign sdq_MPORT_addr = _sdq_alloc_id_T_1[0] ? 5'h0 : _sdq_alloc_id_T_33;
  assign sdq_MPORT_mask = 1'h1;
  assign sdq_MPORT_en = _sdq_enq_T_1 & _sdq_enq_T_24;
  assign lb_lb_read_data_MPORT_addr = {lb_read_arb_io_out_bits_id,lb_read_arb_io_out_bits_offset};
  assign lb_lb_read_data_MPORT_data = lb[lb_lb_read_data_MPORT_addr]; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
  assign lb_MPORT_1_data = lb_write_arb_io_out_bits_data;
  assign lb_MPORT_1_addr = {lb_write_arb_io_out_bits_id,lb_write_arb_io_out_bits_offset};
  assign lb_MPORT_1_mask = 1'h1;
  assign lb_MPORT_1_en = lb_write_arb_io_out_ready & lb_write_arb_io_out_valid;
  assign io_req_0_ready = _mmio_alloc_arb_io_out_ready_T ? mmio_rdy : _io_req_0_ready_T_4; // @[mshrs.scala 745:10 chipyard.TestHarness.LargeBoomConfig.fir 171129:4]
  assign io_resp_valid = respq_io_deq_valid; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171122:4]
  assign io_resp_bits_uop_br_mask = respq_io_deq_bits_uop_br_mask; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_uop_ldq_idx = respq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_uop_stq_idx = respq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_uop_is_amo = respq_io_deq_bits_uop_is_amo; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_uop_uses_ldq = respq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_uop_uses_stq = respq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_data = respq_io_deq_bits_data; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_resp_bits_is_hella = respq_io_deq_bits_is_hella; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171121:4]
  assign io_secondary_miss_0 = _io_secondary_miss_0_T & _mshr_io_clear_prefetch_T_4; // @[mshrs.scala 746:58 chipyard.TestHarness.LargeBoomConfig.fir 171134:4]
  assign io_block_hit_0 = idx_match_0 & tag_match_0; // @[mshrs.scala 747:42 chipyard.TestHarness.LargeBoomConfig.fir 171136:4]
  assign io_mem_acquire_valid = idle ? _T_67 : _sink_ACancel_earlyValid_T_12; // @[Arbiter.scala 125:29 chipyard.TestHarness.LargeBoomConfig.fir 170674:4]
  assign io_mem_acquire_bits_opcode = _T_160 | _T_157; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170783:4]
  assign io_mem_acquire_bits_param = _T_151 | _T_148; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170771:4]
  assign io_mem_acquire_bits_size = _T_142 | _T_139; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170759:4]
  assign io_mem_acquire_bits_source = _T_133 | _T_130; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170747:4]
  assign io_mem_acquire_bits_address = _T_124 | _T_121; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170735:4]
  assign io_mem_acquire_bits_mask = _T_115 | _T_112; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170721:4]
  assign io_mem_acquire_bits_data = muxStateEarly__4 ? out_4_bits_data : 128'h0; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 170705:4]
  assign io_mem_grant_ready = _mshr_io_mem_ack_valid_T | _GEN_68; // @[mshrs.scala 721:46 chipyard.TestHarness.LargeBoomConfig.fir 170376:4 mshrs.scala 722:26 chipyard.TestHarness.LargeBoomConfig.fir 170377:6]
  assign io_mem_finish_valid = idle_1 ? _T_182 : _sink_ACancel_earlyValid_T_23; // @[Arbiter.scala 125:29 chipyard.TestHarness.LargeBoomConfig.fir 170993:4]
  assign io_mem_finish_bits_sink = _T_207 | _T_205; // @[Mux.scala 27:72 chipyard.TestHarness.LargeBoomConfig.fir 171012:4]
  assign io_refill_valid = refill_arb_io_out_valid; // @[mshrs.scala 749:21 chipyard.TestHarness.LargeBoomConfig.fir 171139:4]
  assign io_refill_bits_way_en = refill_arb_io_out_bits_way_en; // @[mshrs.scala 749:21 chipyard.TestHarness.LargeBoomConfig.fir 171138:4]
  assign io_refill_bits_addr = refill_arb_io_out_bits_addr; // @[mshrs.scala 749:21 chipyard.TestHarness.LargeBoomConfig.fir 171138:4]
  assign io_refill_bits_data = refill_arb_io_out_bits_data; // @[mshrs.scala 749:21 chipyard.TestHarness.LargeBoomConfig.fir 171138:4]
  assign io_meta_write_valid = meta_write_arb_io_out_valid; // @[mshrs.scala 699:17 chipyard.TestHarness.LargeBoomConfig.fir 170264:4]
  assign io_meta_write_bits_idx = meta_write_arb_io_out_bits_idx; // @[mshrs.scala 699:17 chipyard.TestHarness.LargeBoomConfig.fir 170263:4]
  assign io_meta_write_bits_way_en = meta_write_arb_io_out_bits_way_en; // @[mshrs.scala 699:17 chipyard.TestHarness.LargeBoomConfig.fir 170263:4]
  assign io_meta_write_bits_data_coh_state = meta_write_arb_io_out_bits_data_coh_state; // @[mshrs.scala 699:17 chipyard.TestHarness.LargeBoomConfig.fir 170263:4]
  assign io_meta_write_bits_data_tag = meta_write_arb_io_out_bits_data_tag; // @[mshrs.scala 699:17 chipyard.TestHarness.LargeBoomConfig.fir 170263:4]
  assign io_meta_read_valid = meta_read_arb_io_out_valid; // @[mshrs.scala 700:17 chipyard.TestHarness.LargeBoomConfig.fir 170267:4]
  assign io_meta_read_bits_idx = meta_read_arb_io_out_bits_idx; // @[mshrs.scala 700:17 chipyard.TestHarness.LargeBoomConfig.fir 170266:4]
  assign io_meta_read_bits_way_en = meta_read_arb_io_out_bits_way_en; // @[mshrs.scala 700:17 chipyard.TestHarness.LargeBoomConfig.fir 170266:4]
  assign io_meta_read_bits_tag = meta_read_arb_io_out_bits_tag; // @[mshrs.scala 700:17 chipyard.TestHarness.LargeBoomConfig.fir 170266:4]
  assign io_replay_valid = replay_arb_io_out_valid; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171167:4]
  assign io_replay_bits_uop_br_mask = replay_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_ldq_idx = replay_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_stq_idx = replay_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_mem_cmd = replay_arb_io_out_bits_uop_mem_cmd; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_mem_size = replay_arb_io_out_bits_uop_mem_size; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_mem_signed = replay_arb_io_out_bits_uop_mem_signed; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_is_amo = replay_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_uses_ldq = replay_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_uop_uses_stq = replay_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_addr = replay_arb_io_out_bits_addr; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_data = sdq_io_replay_bits_data_MPORT_data; // @[mshrs.scala 754:23 chipyard.TestHarness.LargeBoomConfig.fir 171170:4]
  assign io_replay_bits_is_hella = replay_arb_io_out_bits_is_hella; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_replay_bits_way_en = replay_arb_io_out_bits_way_en; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171166:4]
  assign io_wb_req_valid = wb_req_arb_io_out_valid; // @[mshrs.scala 701:17 chipyard.TestHarness.LargeBoomConfig.fir 170270:4]
  assign io_wb_req_bits_tag = wb_req_arb_io_out_bits_tag; // @[mshrs.scala 701:17 chipyard.TestHarness.LargeBoomConfig.fir 170269:4]
  assign io_wb_req_bits_idx = wb_req_arb_io_out_bits_idx; // @[mshrs.scala 701:17 chipyard.TestHarness.LargeBoomConfig.fir 170269:4]
  assign io_wb_req_bits_param = wb_req_arb_io_out_bits_param; // @[mshrs.scala 701:17 chipyard.TestHarness.LargeBoomConfig.fir 170269:4]
  assign io_wb_req_bits_way_en = wb_req_arb_io_out_bits_way_en; // @[mshrs.scala 701:17 chipyard.TestHarness.LargeBoomConfig.fir 170269:4]
  assign io_fence_rdy = _T_36 ? 1'h0 : _GEN_69; // @[mshrs.scala 726:31 chipyard.TestHarness.LargeBoomConfig.fir 170383:4 mshrs.scala 727:20 chipyard.TestHarness.LargeBoomConfig.fir 170384:6]
  assign io_probe_rdy = _T_33 ? 1'h0 : _GEN_57; // @[mshrs.scala 684:76 chipyard.TestHarness.LargeBoomConfig.fir 170233:4 mshrs.scala 685:22 chipyard.TestHarness.LargeBoomConfig.fir 170234:6]
  assign lb_read_arb_io_in_0_valid = mshrs_0_io_lb_read_valid; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169360:4]
  assign lb_read_arb_io_in_0_bits_id = mshrs_0_io_lb_read_bits_id; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169359:4]
  assign lb_read_arb_io_in_0_bits_offset = mshrs_0_io_lb_read_bits_offset; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169359:4]
  assign lb_read_arb_io_in_1_valid = mshrs_1_io_lb_read_valid; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169639:4]
  assign lb_read_arb_io_in_1_bits_id = mshrs_1_io_lb_read_bits_id; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169638:4]
  assign lb_read_arb_io_in_1_bits_offset = mshrs_1_io_lb_read_bits_offset; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169638:4]
  assign lb_read_arb_io_in_2_valid = mshrs_2_io_lb_read_valid; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169918:4]
  assign lb_read_arb_io_in_2_bits_id = mshrs_2_io_lb_read_bits_id; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169917:4]
  assign lb_read_arb_io_in_2_bits_offset = mshrs_2_io_lb_read_bits_offset; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169917:4]
  assign lb_read_arb_io_in_3_valid = mshrs_3_io_lb_read_valid; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 170197:4]
  assign lb_read_arb_io_in_3_bits_id = mshrs_3_io_lb_read_bits_id; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 170196:4]
  assign lb_read_arb_io_in_3_bits_offset = mshrs_3_io_lb_read_bits_offset; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 170196:4]
  assign lb_read_arb_io_out_ready = _T ? 1'h0 : 1'h1; // @[mshrs.scala 576:37 chipyard.TestHarness.LargeBoomConfig.fir 169044:4 mshrs.scala 572:29 chipyard.TestHarness.LargeBoomConfig.fir 169039:4 mshrs.scala 579:30 chipyard.TestHarness.LargeBoomConfig.fir 169050:6]
  assign lb_write_arb_io_in_0_valid = mshrs_0_io_lb_write_valid; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169364:4]
  assign lb_write_arb_io_in_0_bits_id = mshrs_0_io_lb_write_bits_id; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169363:4]
  assign lb_write_arb_io_in_0_bits_offset = mshrs_0_io_lb_write_bits_offset; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169363:4]
  assign lb_write_arb_io_in_0_bits_data = mshrs_0_io_lb_write_bits_data; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169363:4]
  assign lb_write_arb_io_in_1_valid = mshrs_1_io_lb_write_valid; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169643:4]
  assign lb_write_arb_io_in_1_bits_id = mshrs_1_io_lb_write_bits_id; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169642:4]
  assign lb_write_arb_io_in_1_bits_offset = mshrs_1_io_lb_write_bits_offset; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169642:4]
  assign lb_write_arb_io_in_1_bits_data = mshrs_1_io_lb_write_bits_data; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169642:4]
  assign lb_write_arb_io_in_2_valid = mshrs_2_io_lb_write_valid; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169922:4]
  assign lb_write_arb_io_in_2_bits_id = mshrs_2_io_lb_write_bits_id; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169921:4]
  assign lb_write_arb_io_in_2_bits_offset = mshrs_2_io_lb_write_bits_offset; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169921:4]
  assign lb_write_arb_io_in_2_bits_data = mshrs_2_io_lb_write_bits_data; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169921:4]
  assign lb_write_arb_io_in_3_valid = mshrs_3_io_lb_write_valid; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 170201:4]
  assign lb_write_arb_io_in_3_bits_id = mshrs_3_io_lb_write_bits_id; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 170200:4]
  assign lb_write_arb_io_in_3_bits_offset = mshrs_3_io_lb_write_bits_offset; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 170200:4]
  assign lb_write_arb_io_in_3_bits_data = mshrs_3_io_lb_write_bits_data; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 170200:4]
  assign lb_write_arb_io_out_ready = 1'h1; // @[mshrs.scala 573:29 chipyard.TestHarness.LargeBoomConfig.fir 169040:4]
  assign meta_write_arb_io_in_0_valid = mshrs_0_io_meta_write_valid; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169342:4]
  assign meta_write_arb_io_in_0_bits_idx = mshrs_0_io_meta_write_bits_idx; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169341:4]
  assign meta_write_arb_io_in_0_bits_way_en = mshrs_0_io_meta_write_bits_way_en; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169341:4]
  assign meta_write_arb_io_in_0_bits_data_coh_state = mshrs_0_io_meta_write_bits_data_coh_state; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169341:4]
  assign meta_write_arb_io_in_0_bits_data_tag = mshrs_0_io_meta_write_bits_data_tag; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169341:4]
  assign meta_write_arb_io_in_1_valid = mshrs_1_io_meta_write_valid; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169621:4]
  assign meta_write_arb_io_in_1_bits_idx = mshrs_1_io_meta_write_bits_idx; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169620:4]
  assign meta_write_arb_io_in_1_bits_way_en = mshrs_1_io_meta_write_bits_way_en; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169620:4]
  assign meta_write_arb_io_in_1_bits_data_coh_state = mshrs_1_io_meta_write_bits_data_coh_state; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169620:4]
  assign meta_write_arb_io_in_1_bits_data_tag = mshrs_1_io_meta_write_bits_data_tag; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169620:4]
  assign meta_write_arb_io_in_2_valid = mshrs_2_io_meta_write_valid; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169900:4]
  assign meta_write_arb_io_in_2_bits_idx = mshrs_2_io_meta_write_bits_idx; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169899:4]
  assign meta_write_arb_io_in_2_bits_way_en = mshrs_2_io_meta_write_bits_way_en; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169899:4]
  assign meta_write_arb_io_in_2_bits_data_coh_state = mshrs_2_io_meta_write_bits_data_coh_state; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169899:4]
  assign meta_write_arb_io_in_2_bits_data_tag = mshrs_2_io_meta_write_bits_data_tag; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169899:4]
  assign meta_write_arb_io_in_3_valid = mshrs_3_io_meta_write_valid; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 170179:4]
  assign meta_write_arb_io_in_3_bits_idx = mshrs_3_io_meta_write_bits_idx; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 170178:4]
  assign meta_write_arb_io_in_3_bits_way_en = mshrs_3_io_meta_write_bits_way_en; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 170178:4]
  assign meta_write_arb_io_in_3_bits_data_coh_state = mshrs_3_io_meta_write_bits_data_coh_state; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 170178:4]
  assign meta_write_arb_io_in_3_bits_data_tag = mshrs_3_io_meta_write_bits_data_tag; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 170178:4]
  assign meta_write_arb_io_out_ready = io_meta_write_ready; // @[mshrs.scala 699:17 chipyard.TestHarness.LargeBoomConfig.fir 170265:4]
  assign meta_read_arb_io_in_0_valid = mshrs_0_io_meta_read_valid; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169345:4]
  assign meta_read_arb_io_in_0_bits_idx = mshrs_0_io_meta_read_bits_idx; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169344:4]
  assign meta_read_arb_io_in_0_bits_way_en = mshrs_0_io_meta_read_bits_way_en; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169344:4]
  assign meta_read_arb_io_in_0_bits_tag = mshrs_0_io_meta_read_bits_tag; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169344:4]
  assign meta_read_arb_io_in_1_valid = mshrs_1_io_meta_read_valid; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169624:4]
  assign meta_read_arb_io_in_1_bits_idx = mshrs_1_io_meta_read_bits_idx; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169623:4]
  assign meta_read_arb_io_in_1_bits_way_en = mshrs_1_io_meta_read_bits_way_en; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169623:4]
  assign meta_read_arb_io_in_1_bits_tag = mshrs_1_io_meta_read_bits_tag; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169623:4]
  assign meta_read_arb_io_in_2_valid = mshrs_2_io_meta_read_valid; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169903:4]
  assign meta_read_arb_io_in_2_bits_idx = mshrs_2_io_meta_read_bits_idx; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169902:4]
  assign meta_read_arb_io_in_2_bits_way_en = mshrs_2_io_meta_read_bits_way_en; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169902:4]
  assign meta_read_arb_io_in_2_bits_tag = mshrs_2_io_meta_read_bits_tag; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169902:4]
  assign meta_read_arb_io_in_3_valid = mshrs_3_io_meta_read_valid; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 170182:4]
  assign meta_read_arb_io_in_3_bits_idx = mshrs_3_io_meta_read_bits_idx; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 170181:4]
  assign meta_read_arb_io_in_3_bits_way_en = mshrs_3_io_meta_read_bits_way_en; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 170181:4]
  assign meta_read_arb_io_in_3_bits_tag = mshrs_3_io_meta_read_bits_tag; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 170181:4]
  assign meta_read_arb_io_out_ready = io_meta_read_ready; // @[mshrs.scala 700:17 chipyard.TestHarness.LargeBoomConfig.fir 170268:4]
  assign wb_req_arb_io_in_0_valid = mshrs_0_io_wb_req_valid; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169351:4]
  assign wb_req_arb_io_in_0_bits_tag = mshrs_0_io_wb_req_bits_tag; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169350:4]
  assign wb_req_arb_io_in_0_bits_idx = mshrs_0_io_wb_req_bits_idx; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169350:4]
  assign wb_req_arb_io_in_0_bits_param = mshrs_0_io_wb_req_bits_param; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169350:4]
  assign wb_req_arb_io_in_0_bits_way_en = mshrs_0_io_wb_req_bits_way_en; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169350:4]
  assign wb_req_arb_io_in_1_valid = mshrs_1_io_wb_req_valid; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169630:4]
  assign wb_req_arb_io_in_1_bits_tag = mshrs_1_io_wb_req_bits_tag; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169629:4]
  assign wb_req_arb_io_in_1_bits_idx = mshrs_1_io_wb_req_bits_idx; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169629:4]
  assign wb_req_arb_io_in_1_bits_param = mshrs_1_io_wb_req_bits_param; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169629:4]
  assign wb_req_arb_io_in_1_bits_way_en = mshrs_1_io_wb_req_bits_way_en; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169629:4]
  assign wb_req_arb_io_in_2_valid = mshrs_2_io_wb_req_valid; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169909:4]
  assign wb_req_arb_io_in_2_bits_tag = mshrs_2_io_wb_req_bits_tag; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169908:4]
  assign wb_req_arb_io_in_2_bits_idx = mshrs_2_io_wb_req_bits_idx; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169908:4]
  assign wb_req_arb_io_in_2_bits_param = mshrs_2_io_wb_req_bits_param; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169908:4]
  assign wb_req_arb_io_in_2_bits_way_en = mshrs_2_io_wb_req_bits_way_en; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169908:4]
  assign wb_req_arb_io_in_3_valid = mshrs_3_io_wb_req_valid; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 170188:4]
  assign wb_req_arb_io_in_3_bits_tag = mshrs_3_io_wb_req_bits_tag; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 170187:4]
  assign wb_req_arb_io_in_3_bits_idx = mshrs_3_io_wb_req_bits_idx; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 170187:4]
  assign wb_req_arb_io_in_3_bits_param = mshrs_3_io_wb_req_bits_param; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 170187:4]
  assign wb_req_arb_io_in_3_bits_way_en = mshrs_3_io_wb_req_bits_way_en; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 170187:4]
  assign wb_req_arb_io_out_ready = io_wb_req_ready; // @[mshrs.scala 701:17 chipyard.TestHarness.LargeBoomConfig.fir 170271:4]
  assign replay_arb_io_in_0_valid = mshrs_0_io_replay_valid; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169354:4]
  assign replay_arb_io_in_0_bits_uop_br_mask = mshrs_0_io_replay_bits_uop_br_mask; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_ldq_idx = mshrs_0_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_stq_idx = mshrs_0_io_replay_bits_uop_stq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_mem_cmd = mshrs_0_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_mem_size = mshrs_0_io_replay_bits_uop_mem_size; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_mem_signed = mshrs_0_io_replay_bits_uop_mem_signed; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_is_amo = mshrs_0_io_replay_bits_uop_is_amo; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_uses_ldq = mshrs_0_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_uop_uses_stq = mshrs_0_io_replay_bits_uop_uses_stq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_addr = mshrs_0_io_replay_bits_addr; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_is_hella = mshrs_0_io_replay_bits_is_hella; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_way_en = mshrs_0_io_replay_bits_way_en; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_0_bits_sdq_id = mshrs_0_io_replay_bits_sdq_id; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169353:4]
  assign replay_arb_io_in_1_valid = mshrs_1_io_replay_valid; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169633:4]
  assign replay_arb_io_in_1_bits_uop_br_mask = mshrs_1_io_replay_bits_uop_br_mask; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_ldq_idx = mshrs_1_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_stq_idx = mshrs_1_io_replay_bits_uop_stq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_mem_cmd = mshrs_1_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_mem_size = mshrs_1_io_replay_bits_uop_mem_size; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_mem_signed = mshrs_1_io_replay_bits_uop_mem_signed; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_is_amo = mshrs_1_io_replay_bits_uop_is_amo; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_uses_ldq = mshrs_1_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_uop_uses_stq = mshrs_1_io_replay_bits_uop_uses_stq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_addr = mshrs_1_io_replay_bits_addr; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_is_hella = mshrs_1_io_replay_bits_is_hella; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_way_en = mshrs_1_io_replay_bits_way_en; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_1_bits_sdq_id = mshrs_1_io_replay_bits_sdq_id; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169632:4]
  assign replay_arb_io_in_2_valid = mshrs_2_io_replay_valid; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169912:4]
  assign replay_arb_io_in_2_bits_uop_br_mask = mshrs_2_io_replay_bits_uop_br_mask; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_ldq_idx = mshrs_2_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_stq_idx = mshrs_2_io_replay_bits_uop_stq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_mem_cmd = mshrs_2_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_mem_size = mshrs_2_io_replay_bits_uop_mem_size; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_mem_signed = mshrs_2_io_replay_bits_uop_mem_signed; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_is_amo = mshrs_2_io_replay_bits_uop_is_amo; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_uses_ldq = mshrs_2_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_uop_uses_stq = mshrs_2_io_replay_bits_uop_uses_stq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_addr = mshrs_2_io_replay_bits_addr; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_is_hella = mshrs_2_io_replay_bits_is_hella; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_way_en = mshrs_2_io_replay_bits_way_en; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_2_bits_sdq_id = mshrs_2_io_replay_bits_sdq_id; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169911:4]
  assign replay_arb_io_in_3_valid = mshrs_3_io_replay_valid; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170191:4]
  assign replay_arb_io_in_3_bits_uop_br_mask = mshrs_3_io_replay_bits_uop_br_mask; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_ldq_idx = mshrs_3_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_stq_idx = mshrs_3_io_replay_bits_uop_stq_idx; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_mem_cmd = mshrs_3_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_mem_size = mshrs_3_io_replay_bits_uop_mem_size; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_mem_signed = mshrs_3_io_replay_bits_uop_mem_signed; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_is_amo = mshrs_3_io_replay_bits_uop_is_amo; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_uses_ldq = mshrs_3_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_uop_uses_stq = mshrs_3_io_replay_bits_uop_uses_stq; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_addr = mshrs_3_io_replay_bits_addr; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_is_hella = mshrs_3_io_replay_bits_is_hella; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_way_en = mshrs_3_io_replay_bits_way_en; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_in_3_bits_sdq_id = mshrs_3_io_replay_bits_sdq_id; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170190:4]
  assign replay_arb_io_out_ready = io_replay_ready; // @[mshrs.scala 753:13 chipyard.TestHarness.LargeBoomConfig.fir 171168:4]
  assign resp_arb_io_in_0_valid = mshrs_0_io_resp_valid; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169387:4]
  assign resp_arb_io_in_0_bits_uop_br_mask = mshrs_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_uop_ldq_idx = mshrs_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_uop_stq_idx = mshrs_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_uop_is_amo = mshrs_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_uop_uses_ldq = mshrs_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_uop_uses_stq = mshrs_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_data = mshrs_0_io_resp_bits_data; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_0_bits_is_hella = mshrs_0_io_resp_bits_is_hella; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169386:4]
  assign resp_arb_io_in_1_valid = mshrs_1_io_resp_valid; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169666:4]
  assign resp_arb_io_in_1_bits_uop_br_mask = mshrs_1_io_resp_bits_uop_br_mask; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_uop_ldq_idx = mshrs_1_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_uop_stq_idx = mshrs_1_io_resp_bits_uop_stq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_uop_is_amo = mshrs_1_io_resp_bits_uop_is_amo; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_uop_uses_ldq = mshrs_1_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_uop_uses_stq = mshrs_1_io_resp_bits_uop_uses_stq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_data = mshrs_1_io_resp_bits_data; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_1_bits_is_hella = mshrs_1_io_resp_bits_is_hella; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169665:4]
  assign resp_arb_io_in_2_valid = mshrs_2_io_resp_valid; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169945:4]
  assign resp_arb_io_in_2_bits_uop_br_mask = mshrs_2_io_resp_bits_uop_br_mask; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_uop_ldq_idx = mshrs_2_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_uop_stq_idx = mshrs_2_io_resp_bits_uop_stq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_uop_is_amo = mshrs_2_io_resp_bits_uop_is_amo; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_uop_uses_ldq = mshrs_2_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_uop_uses_stq = mshrs_2_io_resp_bits_uop_uses_stq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_data = mshrs_2_io_resp_bits_data; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_2_bits_is_hella = mshrs_2_io_resp_bits_is_hella; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169944:4]
  assign resp_arb_io_in_3_valid = mshrs_3_io_resp_valid; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170224:4]
  assign resp_arb_io_in_3_bits_uop_br_mask = mshrs_3_io_resp_bits_uop_br_mask; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_uop_ldq_idx = mshrs_3_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_uop_stq_idx = mshrs_3_io_resp_bits_uop_stq_idx; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_uop_is_amo = mshrs_3_io_resp_bits_uop_is_amo; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_uop_uses_ldq = mshrs_3_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_uop_uses_stq = mshrs_3_io_resp_bits_uop_uses_stq; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_data = mshrs_3_io_resp_bits_data; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_3_bits_is_hella = mshrs_3_io_resp_bits_is_hella; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170223:4]
  assign resp_arb_io_in_4_valid = mmios_0_io_resp_valid; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170380:4]
  assign resp_arb_io_in_4_bits_uop_br_mask = mmios_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_in_4_bits_uop_ldq_idx = mmios_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_in_4_bits_uop_stq_idx = mmios_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_in_4_bits_uop_is_amo = mmios_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_in_4_bits_uop_uses_ldq = mmios_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_in_4_bits_uop_uses_stq = mmios_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_in_4_bits_data = mmios_0_io_resp_bits_data; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170379:4]
  assign resp_arb_io_out_ready = respq_io_enq_ready; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171120:4]
  assign refill_arb_io_in_0_valid = mshrs_0_io_refill_valid; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169357:4]
  assign refill_arb_io_in_0_bits_way_en = mshrs_0_io_refill_bits_way_en; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169356:4]
  assign refill_arb_io_in_0_bits_addr = mshrs_0_io_refill_bits_addr; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169356:4]
  assign refill_arb_io_in_0_bits_data = mshrs_0_io_refill_bits_data; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169356:4]
  assign refill_arb_io_in_1_valid = mshrs_1_io_refill_valid; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169636:4]
  assign refill_arb_io_in_1_bits_way_en = mshrs_1_io_refill_bits_way_en; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169635:4]
  assign refill_arb_io_in_1_bits_addr = mshrs_1_io_refill_bits_addr; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169635:4]
  assign refill_arb_io_in_1_bits_data = mshrs_1_io_refill_bits_data; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169635:4]
  assign refill_arb_io_in_2_valid = mshrs_2_io_refill_valid; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169915:4]
  assign refill_arb_io_in_2_bits_way_en = mshrs_2_io_refill_bits_way_en; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169914:4]
  assign refill_arb_io_in_2_bits_addr = mshrs_2_io_refill_bits_addr; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169914:4]
  assign refill_arb_io_in_2_bits_data = mshrs_2_io_refill_bits_data; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169914:4]
  assign refill_arb_io_in_3_valid = mshrs_3_io_refill_valid; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 170194:4]
  assign refill_arb_io_in_3_bits_way_en = mshrs_3_io_refill_bits_way_en; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 170193:4]
  assign refill_arb_io_in_3_bits_addr = mshrs_3_io_refill_bits_addr; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 170193:4]
  assign refill_arb_io_in_3_bits_data = mshrs_3_io_refill_bits_data; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 170193:4]
  assign refill_arb_io_out_ready = io_refill_ready; // @[mshrs.scala 749:21 chipyard.TestHarness.LargeBoomConfig.fir 171140:4]
  assign mshrs_0_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 169121:4]
  assign mshrs_0_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 169122:4]
  assign mshrs_0_io_id = 2'h0; // @[mshrs.scala 621:16 chipyard.TestHarness.LargeBoomConfig.fir 169123:4]
  assign mshrs_0_io_req_pri_val = _mshr_io_req_pri_val_T & pri_val; // @[mshrs.scala 632:54 chipyard.TestHarness.LargeBoomConfig.fir 169137:4]
  assign mshrs_0_io_req_sec_val = _mshr_io_req_sec_val_T_2 & cacheable; // @[mshrs.scala 637:99 chipyard.TestHarness.LargeBoomConfig.fir 169146:4]
  assign mshrs_0_io_clear_prefetch = _mshr_io_clear_prefetch_T_6 | _mshr_io_clear_prefetch_T_7; // @[mshrs.scala 645:82 chipyard.TestHarness.LargeBoomConfig.fir 169245:4]
  assign mshrs_0_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 169334:4]
  assign mshrs_0_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 169333:4]
  assign mshrs_0_io_exception = io_exception; // @[mshrs.scala 648:26 chipyard.TestHarness.LargeBoomConfig.fir 169335:4]
  assign mshrs_0_io_req_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169210:4]
  assign mshrs_0_io_req_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169201:4]
  assign mshrs_0_io_req_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169200:4]
  assign mshrs_0_io_req_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169185:4]
  assign mshrs_0_io_req_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169184:4]
  assign mshrs_0_io_req_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169183:4]
  assign mshrs_0_io_req_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169180:4]
  assign mshrs_0_io_req_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169179:4]
  assign mshrs_0_io_req_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169178:4]
  assign mshrs_0_io_req_addr = io_req_0_bits_addr; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169155:4]
  assign mshrs_0_io_req_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169153:4]
  assign mshrs_0_io_req_tag_match = io_req_0_bits_tag_match; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169152:4]
  assign mshrs_0_io_req_old_meta_coh_state = io_req_0_bits_old_meta_coh_state; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169151:4]
  assign mshrs_0_io_req_old_meta_tag = io_req_0_bits_old_meta_tag; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169150:4]
  assign mshrs_0_io_req_way_en = io_req_0_bits_way_en; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169149:4]
  assign mshrs_0_io_req_sdq_id = _sdq_alloc_id_T_1[0] ? 5'h0 : _sdq_alloc_id_T_33; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168998:4]
  assign mshrs_0_io_req_is_probe = io_req_is_probe_0; // @[mshrs.scala 639:26 chipyard.TestHarness.LargeBoomConfig.fir 169235:4]
  assign mshrs_0_io_mem_acquire_ready = io_mem_acquire_ready & allowed__0; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170649:4]
  assign mshrs_0_io_mem_grant_valid = _T_4 & io_mem_grant_valid; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169381:6 mshrs.scala 671:29 chipyard.TestHarness.LargeBoomConfig.fir 169369:4]
  assign mshrs_0_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169380:6]
  assign mshrs_0_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169380:6]
  assign mshrs_0_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169380:6]
  assign mshrs_0_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169380:6]
  assign mshrs_0_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169379:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169380:6]
  assign mshrs_0_io_mem_finish_ready = io_mem_finish_ready & allowed_1_0; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170973:4]
  assign mshrs_0_io_prober_state_valid = io_prober_state_valid; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 169339:4]
  assign mshrs_0_io_prober_state_bits = io_prober_state_bits; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 169338:4]
  assign mshrs_0_io_refill_ready = refill_arb_io_in_0_ready; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169358:4]
  assign mshrs_0_io_meta_write_ready = meta_write_arb_io_in_0_ready; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169343:4]
  assign mshrs_0_io_meta_read_ready = meta_read_arb_io_in_0_ready; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169346:4]
  assign mshrs_0_io_meta_resp_valid = io_meta_resp_valid; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 169349:4]
  assign mshrs_0_io_meta_resp_bits_coh_state = io_meta_resp_bits_coh_state; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 169348:4]
  assign mshrs_0_io_wb_req_ready = wb_req_arb_io_in_0_ready; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169352:4]
  assign mshrs_0_io_lb_read_ready = lb_read_arb_io_in_0_ready; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169361:4]
  assign mshrs_0_io_lb_resp = _T ? 128'h0 : _GEN_8; // @[mshrs.scala 576:37 chipyard.TestHarness.LargeBoomConfig.fir 169044:4 chipyard.TestHarness.LargeBoomConfig.fir 169042:4]
  assign mshrs_0_io_lb_write_ready = 1'h1; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169365:4]
  assign mshrs_0_io_replay_ready = replay_arb_io_in_0_ready; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169355:4]
  assign mshrs_0_io_resp_ready = resp_arb_io_in_0_ready; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169388:4]
  assign mshrs_0_io_wb_resp = io_wb_resp; // @[mshrs.scala 654:26 chipyard.TestHarness.LargeBoomConfig.fir 169340:4]
  assign mshrs_1_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 169400:4]
  assign mshrs_1_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 169401:4]
  assign mshrs_1_io_id = 2'h1; // @[mshrs.scala 621:16 chipyard.TestHarness.LargeBoomConfig.fir 169402:4]
  assign mshrs_1_io_req_pri_val = _mshr_io_req_pri_val_T_2 & pri_val; // @[mshrs.scala 632:54 chipyard.TestHarness.LargeBoomConfig.fir 169416:4]
  assign mshrs_1_io_req_sec_val = _mshr_io_req_sec_val_T_6 & cacheable; // @[mshrs.scala 637:99 chipyard.TestHarness.LargeBoomConfig.fir 169425:4]
  assign mshrs_1_io_clear_prefetch = _mshr_io_clear_prefetch_T_15 | _mshr_io_clear_prefetch_T_16; // @[mshrs.scala 645:82 chipyard.TestHarness.LargeBoomConfig.fir 169524:4]
  assign mshrs_1_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 169613:4]
  assign mshrs_1_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 169612:4]
  assign mshrs_1_io_exception = io_exception; // @[mshrs.scala 648:26 chipyard.TestHarness.LargeBoomConfig.fir 169614:4]
  assign mshrs_1_io_req_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169489:4]
  assign mshrs_1_io_req_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169480:4]
  assign mshrs_1_io_req_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169479:4]
  assign mshrs_1_io_req_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169464:4]
  assign mshrs_1_io_req_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169463:4]
  assign mshrs_1_io_req_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169462:4]
  assign mshrs_1_io_req_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169459:4]
  assign mshrs_1_io_req_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169458:4]
  assign mshrs_1_io_req_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169457:4]
  assign mshrs_1_io_req_addr = io_req_0_bits_addr; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169434:4]
  assign mshrs_1_io_req_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169432:4]
  assign mshrs_1_io_req_tag_match = io_req_0_bits_tag_match; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169431:4]
  assign mshrs_1_io_req_old_meta_coh_state = io_req_0_bits_old_meta_coh_state; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169430:4]
  assign mshrs_1_io_req_old_meta_tag = io_req_0_bits_old_meta_tag; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169429:4]
  assign mshrs_1_io_req_way_en = io_req_0_bits_way_en; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169428:4]
  assign mshrs_1_io_req_sdq_id = _sdq_alloc_id_T_1[0] ? 5'h0 : _sdq_alloc_id_T_33; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168998:4]
  assign mshrs_1_io_req_is_probe = io_req_is_probe_0; // @[mshrs.scala 639:26 chipyard.TestHarness.LargeBoomConfig.fir 169514:4]
  assign mshrs_1_io_mem_acquire_ready = io_mem_acquire_ready & allowed__1; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170651:4]
  assign mshrs_1_io_mem_grant_valid = _T_12 & io_mem_grant_valid; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169660:6 mshrs.scala 671:29 chipyard.TestHarness.LargeBoomConfig.fir 169648:4]
  assign mshrs_1_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169659:6]
  assign mshrs_1_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169659:6]
  assign mshrs_1_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169659:6]
  assign mshrs_1_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169659:6]
  assign mshrs_1_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169658:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169659:6]
  assign mshrs_1_io_mem_finish_ready = io_mem_finish_ready & allowed_1_1; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170975:4]
  assign mshrs_1_io_prober_state_valid = io_prober_state_valid; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 169618:4]
  assign mshrs_1_io_prober_state_bits = io_prober_state_bits; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 169617:4]
  assign mshrs_1_io_refill_ready = refill_arb_io_in_1_ready; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169637:4]
  assign mshrs_1_io_meta_write_ready = meta_write_arb_io_in_1_ready; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169622:4]
  assign mshrs_1_io_meta_read_ready = meta_read_arb_io_in_1_ready; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169625:4]
  assign mshrs_1_io_meta_resp_valid = io_meta_resp_valid; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 169628:4]
  assign mshrs_1_io_meta_resp_bits_coh_state = io_meta_resp_bits_coh_state; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 169627:4]
  assign mshrs_1_io_wb_req_ready = wb_req_arb_io_in_1_ready; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169631:4]
  assign mshrs_1_io_lb_read_ready = lb_read_arb_io_in_1_ready; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169640:4]
  assign mshrs_1_io_lb_resp = _T ? 128'h0 : _GEN_8; // @[mshrs.scala 576:37 chipyard.TestHarness.LargeBoomConfig.fir 169044:4 chipyard.TestHarness.LargeBoomConfig.fir 169042:4]
  assign mshrs_1_io_lb_write_ready = lb_write_arb_io_in_1_ready; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169644:4]
  assign mshrs_1_io_replay_ready = replay_arb_io_in_1_ready; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169634:4]
  assign mshrs_1_io_resp_ready = resp_arb_io_in_1_ready; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169667:4]
  assign mshrs_1_io_wb_resp = io_wb_resp; // @[mshrs.scala 654:26 chipyard.TestHarness.LargeBoomConfig.fir 169619:4]
  assign mshrs_2_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 169679:4]
  assign mshrs_2_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 169680:4]
  assign mshrs_2_io_id = 2'h2; // @[mshrs.scala 621:16 chipyard.TestHarness.LargeBoomConfig.fir 169681:4]
  assign mshrs_2_io_req_pri_val = _mshr_io_req_pri_val_T_4 & pri_val; // @[mshrs.scala 632:54 chipyard.TestHarness.LargeBoomConfig.fir 169695:4]
  assign mshrs_2_io_req_sec_val = _mshr_io_req_sec_val_T_10 & cacheable; // @[mshrs.scala 637:99 chipyard.TestHarness.LargeBoomConfig.fir 169704:4]
  assign mshrs_2_io_clear_prefetch = _mshr_io_clear_prefetch_T_24 | _mshr_io_clear_prefetch_T_25; // @[mshrs.scala 645:82 chipyard.TestHarness.LargeBoomConfig.fir 169803:4]
  assign mshrs_2_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 169892:4]
  assign mshrs_2_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 169891:4]
  assign mshrs_2_io_exception = io_exception; // @[mshrs.scala 648:26 chipyard.TestHarness.LargeBoomConfig.fir 169893:4]
  assign mshrs_2_io_req_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169768:4]
  assign mshrs_2_io_req_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169759:4]
  assign mshrs_2_io_req_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169758:4]
  assign mshrs_2_io_req_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169743:4]
  assign mshrs_2_io_req_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169742:4]
  assign mshrs_2_io_req_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169741:4]
  assign mshrs_2_io_req_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169738:4]
  assign mshrs_2_io_req_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169737:4]
  assign mshrs_2_io_req_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169736:4]
  assign mshrs_2_io_req_addr = io_req_0_bits_addr; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169713:4]
  assign mshrs_2_io_req_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169711:4]
  assign mshrs_2_io_req_tag_match = io_req_0_bits_tag_match; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169710:4]
  assign mshrs_2_io_req_old_meta_coh_state = io_req_0_bits_old_meta_coh_state; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169709:4]
  assign mshrs_2_io_req_old_meta_tag = io_req_0_bits_old_meta_tag; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169708:4]
  assign mshrs_2_io_req_way_en = io_req_0_bits_way_en; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169707:4]
  assign mshrs_2_io_req_sdq_id = _sdq_alloc_id_T_1[0] ? 5'h0 : _sdq_alloc_id_T_33; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168998:4]
  assign mshrs_2_io_req_is_probe = io_req_is_probe_0; // @[mshrs.scala 639:26 chipyard.TestHarness.LargeBoomConfig.fir 169793:4]
  assign mshrs_2_io_mem_acquire_ready = io_mem_acquire_ready & allowed__2; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170653:4]
  assign mshrs_2_io_mem_grant_valid = _T_20 & io_mem_grant_valid; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169939:6 mshrs.scala 671:29 chipyard.TestHarness.LargeBoomConfig.fir 169927:4]
  assign mshrs_2_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169938:6]
  assign mshrs_2_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169938:6]
  assign mshrs_2_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169938:6]
  assign mshrs_2_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169938:6]
  assign mshrs_2_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 169937:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 169938:6]
  assign mshrs_2_io_mem_finish_ready = io_mem_finish_ready & allowed_1_2; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170977:4]
  assign mshrs_2_io_prober_state_valid = io_prober_state_valid; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 169897:4]
  assign mshrs_2_io_prober_state_bits = io_prober_state_bits; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 169896:4]
  assign mshrs_2_io_refill_ready = refill_arb_io_in_2_ready; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 169916:4]
  assign mshrs_2_io_meta_write_ready = meta_write_arb_io_in_2_ready; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 169901:4]
  assign mshrs_2_io_meta_read_ready = meta_read_arb_io_in_2_ready; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 169904:4]
  assign mshrs_2_io_meta_resp_valid = io_meta_resp_valid; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 169907:4]
  assign mshrs_2_io_meta_resp_bits_coh_state = io_meta_resp_bits_coh_state; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 169906:4]
  assign mshrs_2_io_wb_req_ready = wb_req_arb_io_in_2_ready; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 169910:4]
  assign mshrs_2_io_lb_read_ready = lb_read_arb_io_in_2_ready; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 169919:4]
  assign mshrs_2_io_lb_resp = _T ? 128'h0 : _GEN_8; // @[mshrs.scala 576:37 chipyard.TestHarness.LargeBoomConfig.fir 169044:4 chipyard.TestHarness.LargeBoomConfig.fir 169042:4]
  assign mshrs_2_io_lb_write_ready = lb_write_arb_io_in_2_ready; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 169923:4]
  assign mshrs_2_io_replay_ready = replay_arb_io_in_2_ready; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 169913:4]
  assign mshrs_2_io_resp_ready = resp_arb_io_in_2_ready; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 169946:4]
  assign mshrs_2_io_wb_resp = io_wb_resp; // @[mshrs.scala 654:26 chipyard.TestHarness.LargeBoomConfig.fir 169898:4]
  assign mshrs_3_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 169958:4]
  assign mshrs_3_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 169959:4]
  assign mshrs_3_io_id = 2'h3; // @[mshrs.scala 621:16 chipyard.TestHarness.LargeBoomConfig.fir 169960:4]
  assign mshrs_3_io_req_pri_val = _mshr_io_req_pri_val_T_6 & pri_val; // @[mshrs.scala 632:54 chipyard.TestHarness.LargeBoomConfig.fir 169974:4]
  assign mshrs_3_io_req_sec_val = _mshr_io_req_sec_val_T_14 & cacheable; // @[mshrs.scala 637:99 chipyard.TestHarness.LargeBoomConfig.fir 169983:4]
  assign mshrs_3_io_clear_prefetch = _mshr_io_clear_prefetch_T_33 | _mshr_io_clear_prefetch_T_34; // @[mshrs.scala 645:82 chipyard.TestHarness.LargeBoomConfig.fir 170082:4]
  assign mshrs_3_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 170171:4]
  assign mshrs_3_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 647:28 chipyard.TestHarness.LargeBoomConfig.fir 170170:4]
  assign mshrs_3_io_exception = io_exception; // @[mshrs.scala 648:26 chipyard.TestHarness.LargeBoomConfig.fir 170172:4]
  assign mshrs_3_io_req_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170047:4]
  assign mshrs_3_io_req_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170038:4]
  assign mshrs_3_io_req_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170037:4]
  assign mshrs_3_io_req_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170022:4]
  assign mshrs_3_io_req_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170021:4]
  assign mshrs_3_io_req_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170020:4]
  assign mshrs_3_io_req_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170017:4]
  assign mshrs_3_io_req_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170016:4]
  assign mshrs_3_io_req_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 170015:4]
  assign mshrs_3_io_req_addr = io_req_0_bits_addr; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169992:4]
  assign mshrs_3_io_req_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169990:4]
  assign mshrs_3_io_req_tag_match = io_req_0_bits_tag_match; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169989:4]
  assign mshrs_3_io_req_old_meta_coh_state = io_req_0_bits_old_meta_coh_state; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169988:4]
  assign mshrs_3_io_req_old_meta_tag = io_req_0_bits_old_meta_tag; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169987:4]
  assign mshrs_3_io_req_way_en = io_req_0_bits_way_en; // @[mshrs.scala 638:26 chipyard.TestHarness.LargeBoomConfig.fir 169986:4]
  assign mshrs_3_io_req_sdq_id = _sdq_alloc_id_T_1[0] ? 5'h0 : _sdq_alloc_id_T_33; // @[Mux.scala 47:69 chipyard.TestHarness.LargeBoomConfig.fir 168998:4]
  assign mshrs_3_io_req_is_probe = io_req_is_probe_0; // @[mshrs.scala 639:26 chipyard.TestHarness.LargeBoomConfig.fir 170072:4]
  assign mshrs_3_io_mem_acquire_ready = io_mem_acquire_ready & allowed__3; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170655:4]
  assign mshrs_3_io_mem_grant_valid = _T_28 & io_mem_grant_valid; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170218:6 mshrs.scala 671:29 chipyard.TestHarness.LargeBoomConfig.fir 170206:4]
  assign mshrs_3_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170217:6]
  assign mshrs_3_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170217:6]
  assign mshrs_3_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170217:6]
  assign mshrs_3_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170217:6]
  assign mshrs_3_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 673:45 chipyard.TestHarness.LargeBoomConfig.fir 170216:4 mshrs.scala 674:25 chipyard.TestHarness.LargeBoomConfig.fir 170217:6]
  assign mshrs_3_io_mem_finish_ready = io_mem_finish_ready & allowed_1_3; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170979:4]
  assign mshrs_3_io_prober_state_valid = io_prober_state_valid; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 170176:4]
  assign mshrs_3_io_prober_state_bits = io_prober_state_bits; // @[mshrs.scala 652:26 chipyard.TestHarness.LargeBoomConfig.fir 170175:4]
  assign mshrs_3_io_refill_ready = refill_arb_io_in_3_ready; // @[mshrs.scala 661:29 chipyard.TestHarness.LargeBoomConfig.fir 170195:4]
  assign mshrs_3_io_meta_write_ready = meta_write_arb_io_in_3_ready; // @[mshrs.scala 656:29 chipyard.TestHarness.LargeBoomConfig.fir 170180:4]
  assign mshrs_3_io_meta_read_ready = meta_read_arb_io_in_3_ready; // @[mshrs.scala 657:29 chipyard.TestHarness.LargeBoomConfig.fir 170183:4]
  assign mshrs_3_io_meta_resp_valid = io_meta_resp_valid; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 170186:4]
  assign mshrs_3_io_meta_resp_bits_coh_state = io_meta_resp_bits_coh_state; // @[mshrs.scala 658:29 chipyard.TestHarness.LargeBoomConfig.fir 170185:4]
  assign mshrs_3_io_wb_req_ready = wb_req_arb_io_in_3_ready; // @[mshrs.scala 659:29 chipyard.TestHarness.LargeBoomConfig.fir 170189:4]
  assign mshrs_3_io_lb_read_ready = lb_read_arb_io_in_3_ready; // @[mshrs.scala 663:32 chipyard.TestHarness.LargeBoomConfig.fir 170198:4]
  assign mshrs_3_io_lb_resp = _T ? 128'h0 : _GEN_8; // @[mshrs.scala 576:37 chipyard.TestHarness.LargeBoomConfig.fir 169044:4 chipyard.TestHarness.LargeBoomConfig.fir 169042:4]
  assign mshrs_3_io_lb_write_ready = lb_write_arb_io_in_3_ready; // @[mshrs.scala 665:32 chipyard.TestHarness.LargeBoomConfig.fir 170202:4]
  assign mshrs_3_io_replay_ready = replay_arb_io_in_3_ready; // @[mshrs.scala 660:29 chipyard.TestHarness.LargeBoomConfig.fir 170192:4]
  assign mshrs_3_io_resp_ready = resp_arb_io_in_3_ready; // @[mshrs.scala 678:23 chipyard.TestHarness.LargeBoomConfig.fir 170225:4]
  assign mshrs_3_io_wb_resp = io_wb_resp; // @[mshrs.scala 654:26 chipyard.TestHarness.LargeBoomConfig.fir 170177:4]
  assign mmio_alloc_arb_io_out_ready = io_req_0_valid & _mmio_alloc_arb_io_out_ready_T; // @[mshrs.scala 732:44 chipyard.TestHarness.LargeBoomConfig.fir 170387:4]
  assign mmios_0_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 170276:4]
  assign mmios_0_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 170277:4]
  assign mmios_0_io_req_valid = mmio_alloc_arb_io_in_0_ready; // @[mshrs.scala 714:23 chipyard.TestHarness.LargeBoomConfig.fir 170280:4]
  assign mmios_0_io_req_bits_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170338:4]
  assign mmios_0_io_req_bits_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170329:4]
  assign mmios_0_io_req_bits_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170328:4]
  assign mmios_0_io_req_bits_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170313:4]
  assign mmios_0_io_req_bits_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170312:4]
  assign mmios_0_io_req_bits_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170311:4]
  assign mmios_0_io_req_bits_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170308:4]
  assign mmios_0_io_req_bits_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170307:4]
  assign mmios_0_io_req_bits_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170306:4]
  assign mmios_0_io_req_bits_addr = io_req_0_bits_addr; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170283:4]
  assign mmios_0_io_req_bits_data = io_req_0_bits_data; // @[mshrs.scala 715:23 chipyard.TestHarness.LargeBoomConfig.fir 170282:4]
  assign mmios_0_io_resp_ready = resp_arb_io_in_4_ready; // @[mshrs.scala 725:36 chipyard.TestHarness.LargeBoomConfig.fir 170381:4]
  assign mmios_0_io_mem_access_ready = io_mem_acquire_ready & allowed__4; // @[Arbiter.scala 123:31 chipyard.TestHarness.LargeBoomConfig.fir 170657:4]
  assign mmios_0_io_mem_ack_valid = io_mem_grant_valid & _mshr_io_mem_ack_valid_T; // @[mshrs.scala 720:49 chipyard.TestHarness.LargeBoomConfig.fir 170373:4]
  assign mmios_0_io_mem_ack_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 719:27 chipyard.TestHarness.LargeBoomConfig.fir 170365:4]
  assign respq_clock = clock; // @[chipyard.TestHarness.LargeBoomConfig.fir 171027:4]
  assign respq_reset = reset; // @[chipyard.TestHarness.LargeBoomConfig.fir 171028:4]
  assign respq_io_enq_valid = resp_arb_io_out_valid; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171119:4]
  assign respq_io_enq_bits_uop_br_mask = resp_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_uop_ldq_idx = resp_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_uop_stq_idx = resp_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_uop_is_amo = resp_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_uop_uses_ldq = resp_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_uop_uses_stq = resp_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_data = resp_arb_io_out_bits_data; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_enq_bits_is_hella = resp_arb_io_out_bits_is_hella; // @[mshrs.scala 740:21 chipyard.TestHarness.LargeBoomConfig.fir 171118:4]
  assign respq_io_deq_ready = io_resp_ready; // @[mshrs.scala 741:21 chipyard.TestHarness.LargeBoomConfig.fir 171123:4]
  assign respq_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 738:21 chipyard.TestHarness.LargeBoomConfig.fir 171116:4]
  assign respq_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 738:21 chipyard.TestHarness.LargeBoomConfig.fir 171115:4]
  assign respq_io_flush = io_exception; // @[mshrs.scala 739:21 chipyard.TestHarness.LargeBoomConfig.fir 171117:4]
  always @(posedge clock) begin
    if(sdq_MPORT_en & sdq_MPORT_mask) begin
      sdq[sdq_MPORT_addr] <= sdq_MPORT_data; // @[mshrs.scala 559:25 chipyard.TestHarness.LargeBoomConfig.fir 169027:4]
    end
    if(lb_MPORT_1_en & lb_MPORT_1_mask) begin
      lb[lb_MPORT_1_addr] <= lb_MPORT_1_data; // @[mshrs.scala 568:15 chipyard.TestHarness.LargeBoomConfig.fir 169032:4]
    end
    if (reset) begin // @[mshrs.scala 555:29 chipyard.TestHarness.LargeBoomConfig.fir 168963:4]
      sdq_val <= 17'h0; // @[mshrs.scala 555:29 chipyard.TestHarness.LargeBoomConfig.fir 168963:4]
    end else begin
      sdq_val <= _GEN_74[16:0];
    end
    mshr_alloc_idx_REG <= mshr_alloc_idx_idx[1:0]; // @[util.scala 353:8 chipyard.TestHarness.LargeBoomConfig.fir 170252:4]
    if (reset) begin // @[mshrs.scala 693:31 chipyard.TestHarness.LargeBoomConfig.fir 170236:4]
      mshr_head <= 2'h0; // @[mshrs.scala 693:31 chipyard.TestHarness.LargeBoomConfig.fir 170236:4]
    end else if (_T_34) begin // @[mshrs.scala 695:29 chipyard.TestHarness.LargeBoomConfig.fir 170257:4]
      mshr_head <= _mshr_head_T_1; // @[mshrs.scala 695:41 chipyard.TestHarness.LargeBoomConfig.fir 170261:6]
    end
    if (reset) begin // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 170490:4]
      beatsLeft <= 8'h0; // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 170490:4]
    end else if (latch) begin // @[Arbiter.scala 113:23 chipyard.TestHarness.LargeBoomConfig.fir 170632:4]
      if (earlyWinner__4) begin // @[Arbiter.scala 111:73 chipyard.TestHarness.LargeBoomConfig.fir 170622:4]
        if (opdata_4) begin // @[Edges.scala 220:14 chipyard.TestHarness.LargeBoomConfig.fir 170428:4]
          beatsLeft <= decode_4;
        end else begin
          beatsLeft <= 8'h0;
        end
      end else begin
        beatsLeft <= 8'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
      state__0 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
      state__0 <= earlyWinner__0;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
      state__1 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
      state__1 <= earlyWinner__1;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
      state__2 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
      state__2 <= earlyWinner__2;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
      state__3 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
      state__3 <= earlyWinner__3;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
      state__4 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170640:4]
    end else if (idle) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170641:4]
      state__4 <= earlyWinner__4;
    end
    if (reset) begin // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 170839:4]
      beatsLeft_1 <= 1'h0; // @[Arbiter.scala 87:30 chipyard.TestHarness.LargeBoomConfig.fir 170839:4]
    end else if (latch_1) begin // @[Arbiter.scala 113:23 chipyard.TestHarness.LargeBoomConfig.fir 170958:4]
      beatsLeft_1 <= 1'h0;
    end else begin
      beatsLeft_1 <= _beatsLeft_T_10;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
      state_1_0 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
    end else if (idle_1) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
      state_1_0 <= earlyWinner_1_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
      state_1_1 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
    end else if (idle_1) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
      state_1_1 <= earlyWinner_1_1;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
      state_1_2 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
    end else if (idle_1) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
      state_1_2 <= earlyWinner_1_2;
    end
    if (reset) begin // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
      state_1_3 <= 1'h0; // @[Arbiter.scala 116:26 chipyard.TestHarness.LargeBoomConfig.fir 170965:4]
    end else if (idle_1) begin // @[Arbiter.scala 117:30 chipyard.TestHarness.LargeBoomConfig.fir 170966:4]
      state_1_3 <= earlyWinner_1_3;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_63) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170581:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_63) begin
          $fatal; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170582:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_76) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170598:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_76) begin
          $fatal; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170599:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_89) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170615:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_89) begin
          $fatal; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170616:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_179) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170913:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_179) begin
          $fatal; // @[Arbiter.scala 105:13 chipyard.TestHarness.LargeBoomConfig.fir 170914:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_190) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170928:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_190) begin
          $fatal; // @[Arbiter.scala 107:14 chipyard.TestHarness.LargeBoomConfig.fir 170929:6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_201) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170943:6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_201) begin
          $fatal; // @[Arbiter.scala 108:14 chipyard.TestHarness.LargeBoomConfig.fir 170944:6]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 17; initvar = initvar+1)
    sdq[initvar] = _RAND_0[63:0];
  _RAND_2 = {4{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    lb[initvar] = _RAND_2[127:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  sdq_val = _RAND_3[16:0];
  _RAND_4 = {1{`RANDOM}};
  mshr_alloc_idx_REG = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  mshr_head = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  beatsLeft = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  state__0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state__1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state__2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  state__3 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  state__4 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  state_1_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  state_1_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state_1_2 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  state_1_3 = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule