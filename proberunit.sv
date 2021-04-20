

module BoomProbeUnit (
    input  logic                                        clock,
    input  logic                                        reset,
    input  logic [     HasL1CacheParameters::nWays-1:0] io_way_en,
    input  logic                                        io_wb_rdy,
    input  logic                                        io_mshr_rdy,
    output logic                                        io_mshr_wb_rdy,
    input        [BundleParam::TLPermissions_width-1:0] io_block_state,

    ValidIF.out     io_state,
    DecoupledIF.in  io_req,
    DecoupledIF.out io_rep,
    DecoupledIF.out io_meta_read,
    DecoupledIF.out io_meta_write,
    DecoupledIF.out io_wb_req,
    DecoupledIF.out io_lsu_release
);

  //assign fire
  logic io_req_fire;
  logic io_rep_fire;
  logic io_meta_read_fire;
  logic io_meta_write_fire;
  logic io_wb_req_fire;
  logic io_lsu_release_fire;

  always_comb begin
    io_req_fire = io_req.ready && io_req.valid;
    io_rep_fire = io_rep.ready && io_rep.valid;
    io_meta_read_fire = io_meta_read.ready && io_meta_read.valid;
    io_meta_write_fire = io_meta_write.ready && io_meta_write.valid;
    io_wb_req_fire = io_wb_req.ready && io_wb_req.valid;
    io_lsu_release_fire = io_lsu_release.ready && io_lsu_release.valid;
  end

  typedef enum {
    s_invalid,
    s_meta_read,
    s_meta_resp,
    s_mshr_req,
    s_mshr_resp,
    s_lsu_release,
    s_release,
    s_writeback_req,
    s_writeback_resp,
    s_meta_write,
    s_meta_write_resp
  } probstate;
  probstate states;
  BundleST::TLBundleBST req;

  logic [HasL1CacheParameters::idxBits-1:0] req_idx;
  logic [HasL1CacheParameters::tagBits-1:0] req_tag;

  assign req_idx =
      req.address[HasL1HellaCacheParameters::idxMSB - 1:HasL1HellaCacheParameters::idxLSB - 1];
  assign req_tag = req.address[BundleParam::addressBits - 1:HasL1CacheParameters::untagBits];

  logic [HasL1CacheParameters::nWays-1:0] way_en;
  logic tag_matchs;
  logic [BundleParam::TLPermissions_width-1:0] old_coh;
  logic [BundleParam::TLPermissions_width-1:0] miss_coh;
  logic [BundleParam::TLPermissions_width-1:0] reply_coh;

  assign tag_matchs = |way_en;
  assign miss_coh = BundleParam::Nothing;
  assign reply_coh = tag_matchs ? old_coh : miss_coh;

  logic is_dirty;
  logic [BundleParam::cwidth-1:0] report_param;
  logic [BundleParam::TLPermissions_width-1:0] new_coh;

  assign {is_dirty, report_param, new_coh} = MetaData::onProb(reply_coh, req.param);


  //assign init && output 
  always_comb begin
    io_state.valid = states != s_invalid;
    io_state.bits = {8'b0, req.address};

    io_req.ready = states == s_invalid;

    io_rep.valid = states == s_release;
    io_rep.bits = Edge::ProbeAckST(req, report_param);

    // assert(!io_rep.valid || Edge::hasDataC(io_rep.bits));  //need to compile hasdata

    io_meta_read.valid = states == s_meta_read;
    io_meta_read.bits.idx = req_idx;
    io_meta_read.bits.tag = req_tag;

    io_meta_write.valid = states == s_meta_write;
    io_meta_write.bits.way_en = way_en;
    io_meta_write.bits.idx = req_idx;
    io_meta_write.bits.data.tag = req_tag;
    io_meta_write.bits.data.coh = new_coh;

    io_wb_req.valid = states == s_writeback_req;
    io_wb_req.bits.source = req.source;
    io_wb_req.bits.idx = req_idx;
    io_wb_req.bits.tag = req_tag;
    io_wb_req.bits.param = report_param;
    io_wb_req.bits.way_en = way_en;
    io_wb_req.bits.voluntary = 0;

    io_mshr_wb_rdy = !(states inside {s_release, s_writeback_req, s_writeback_resp, s_meta_write,
                                      s_meta_write_resp});

    io_lsu_release.valid = states == s_lsu_release;
    io_lsu_release.bits = Edge::ProbeAckST(req, report_param);

  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      req <= 0;
      old_coh <= 0;
      way_en = 0;
    end else begin
      if (states == s_invalid) begin
        if (io_req_fire) req <= io_req.bits;
      end else if (states == s_mshr_req) begin
        old_coh <= io_block_state;
        way_en <= io_way_en;
      end
    end

  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) states <= s_invalid;
    else begin
      case (states)
        s_invalid: begin
          if (io_req_fire) begin
            states <= s_meta_read;
          end
        end

        s_meta_read: begin
          if (io_meta_read_fire) states <= s_meta_resp;
        end

        s_meta_resp: begin
          states <= s_mshr_req;
        end

        s_mshr_req: begin
          states <= io_mshr_rdy && io_wb_rdy ? s_mshr_resp : s_meta_read;
        end

        s_mshr_resp: begin
          states <= tag_matchs && is_dirty ? s_writeback_req : s_lsu_release;
        end

        s_lsu_release: begin
          if (io_lsu_release_fire) states <= s_release;
        end

        s_release: begin
          if (io_rep.ready) states <= tag_matchs ? s_meta_write : s_invalid;
        end

        s_writeback_req: begin
          if (io_wb_req_fire) states <= s_writeback_resp;
        end

        s_writeback_resp: begin
          if (io_wb_req.ready) states <= s_meta_write;
        end

        s_meta_write: begin
          if (io_meta_write_fire) states <= s_meta_write_resp;
        end

        s_meta_write_resp: begin
          states <= s_invalid;
        end
        default: begin
          states <= s_invalid;
        end
      endcase
    end

  end
endmodule



// module BoomProbeUnit( // @[chipyard.TestHarness.LargeBoomConfig.fir 151419:2]
//   input         clock, // @[chipyard.TestHarness.LargeBoomConfig.fir 151420:4]
//   input         reset, // @[chipyard.TestHarness.LargeBoomConfig.fir 151421:4]
//   output        io_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input  [1:0]  io_req_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input  [3:0]  io_req_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input  [2:0]  io_req_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input  [31:0] io_req_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_rep_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_rep_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [2:0]  io_rep_bits_opcode, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [2:0]  io_rep_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [3:0]  io_rep_bits_size, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [2:0]  io_rep_bits_source, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [31:0] io_rep_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_meta_read_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_meta_read_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [5:0]  io_meta_read_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [19:0] io_meta_read_bits_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_meta_write_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_meta_write_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [5:0]  io_meta_write_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [7:0]  io_meta_write_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [1:0]  io_meta_write_bits_data_coh_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [19:0] io_meta_write_bits_data_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_wb_req_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_wb_req_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [19:0] io_wb_req_bits_tag, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [5:0]  io_wb_req_bits_idx, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [2:0]  io_wb_req_bits_param, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [7:0]  io_wb_req_bits_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input  [7:0]  io_way_en, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_wb_rdy, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_mshr_rdy, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_mshr_wb_rdy, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input  [1:0]  io_block_state_state, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   input         io_lsu_release_ready, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_lsu_release_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [31:0] io_lsu_release_bits_address, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output        io_state_valid, // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
//   output [39:0] io_state_bits // @[chipyard.TestHarness.LargeBoomConfig.fir 151422:4]
// );
// `ifdef RANDOMIZE_REG_INIT
//   reg [31:0] _RAND_0;
//   reg [31:0] _RAND_1;
//   reg [31:0] _RAND_2;
//   reg [31:0] _RAND_3;
//   reg [31:0] _RAND_4;
//   reg [31:0] _RAND_5;
//   reg [31:0] _RAND_6;
// `endif // RANDOMIZE_REG_INIT
//   reg [3:0] state; // @[dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   reg [1:0] req_param; // @[dcache.scala 167:16 chipyard.TestHarness.LargeBoomConfig.fir 151428:4]
//   reg [3:0] req_size; // @[dcache.scala 167:16 chipyard.TestHarness.LargeBoomConfig.fir 151428:4]
//   reg [2:0] req_source; // @[dcache.scala 167:16 chipyard.TestHarness.LargeBoomConfig.fir 151428:4]
//   reg [31:0] req_address; // @[dcache.scala 167:16 chipyard.TestHarness.LargeBoomConfig.fir 151428:4]
//   reg [7:0] way_en; // @[dcache.scala 171:19 chipyard.TestHarness.LargeBoomConfig.fir 151431:4]
//   wire  tag_matches = |way_en; // @[dcache.scala 172:28 chipyard.TestHarness.LargeBoomConfig.fir 151432:4]
//   reg [1:0] old_coh_state; // @[dcache.scala 173:20 chipyard.TestHarness.LargeBoomConfig.fir 151433:4]
//   wire [1:0] reply_coh_state = tag_matches ? old_coh_state : 2'h0; // @[dcache.scala 175:22 chipyard.TestHarness.LargeBoomConfig.fir 151437:4]
//   wire [3:0] _T = {req_param,reply_coh_state}; // @[Cat.scala 30:58 chipyard.TestHarness.LargeBoomConfig.fir 151438:4]
//   wire  _T_13 = 4'h8 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151451:4]
//   wire [2:0] _T_15 = _T_13 ? 3'h5 : 3'h0; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151453:4]
//   wire  _T_17 = 4'h9 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151455:4]
//   wire [2:0] _T_19 = _T_17 ? 3'h2 : _T_15; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151457:4]
//   wire  _T_21 = 4'ha == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151459:4]
//   wire [2:0] _T_23 = _T_21 ? 3'h1 : _T_19; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151461:4]
//   wire  _T_25 = 4'hb == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151463:4]
//   wire [2:0] _T_27 = _T_25 ? 3'h1 : _T_23; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151465:4]
//   wire  _T_29 = 4'h4 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151467:4]
//   wire  _T_30 = _T_29 ? 1'h0 : _T_25; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151468:4]
//   wire [2:0] _T_31 = _T_29 ? 3'h5 : _T_27; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151469:4]
//   wire  _T_33 = 4'h5 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151471:4]
//   wire  _T_34 = _T_33 ? 1'h0 : _T_30; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151472:4]
//   wire [2:0] _T_35 = _T_33 ? 3'h4 : _T_31; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151473:4]
//   wire [1:0] _T_36 = _T_33 ? 2'h1 : 2'h0; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151474:4]
//   wire  _T_37 = 4'h6 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151475:4]
//   wire  _T_38 = _T_37 ? 1'h0 : _T_34; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151476:4]
//   wire [2:0] _T_39 = _T_37 ? 3'h0 : _T_35; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151477:4]
//   wire [1:0] _T_40 = _T_37 ? 2'h1 : _T_36; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151478:4]
//   wire  _T_41 = 4'h7 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151479:4]
//   wire  _T_42 = _T_41 | _T_38; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151480:4]
//   wire [2:0] _T_43 = _T_41 ? 3'h0 : _T_39; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151481:4]
//   wire [1:0] _T_44 = _T_41 ? 2'h1 : _T_40; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151482:4]
//   wire  _T_45 = 4'h0 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151483:4]
//   wire  _T_46 = _T_45 ? 1'h0 : _T_42; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151484:4]
//   wire [2:0] _T_47 = _T_45 ? 3'h5 : _T_43; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151485:4]
//   wire [1:0] _T_48 = _T_45 ? 2'h0 : _T_44; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151486:4]
//   wire  _T_49 = 4'h1 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151487:4]
//   wire  _T_50 = _T_49 ? 1'h0 : _T_46; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151488:4]
//   wire [2:0] _T_51 = _T_49 ? 3'h4 : _T_47; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151489:4]
//   wire [1:0] _T_52 = _T_49 ? 2'h1 : _T_48; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151490:4]
//   wire  _T_53 = 4'h2 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151491:4]
//   wire  _T_54 = _T_53 ? 1'h0 : _T_50; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151492:4]
//   wire [2:0] _T_55 = _T_53 ? 3'h3 : _T_51; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151493:4]
//   wire [1:0] _T_56 = _T_53 ? 2'h2 : _T_52; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151494:4]
//   wire  _T_57 = 4'h3 == _T; // @[Misc.scala 55:20 chipyard.TestHarness.LargeBoomConfig.fir 151495:4]
//   wire  is_dirty = _T_57 | _T_54; // @[Misc.scala 37:9 chipyard.TestHarness.LargeBoomConfig.fir 151496:4]
//   wire  _io_req_ready_T = state == 4'h0; // @[dcache.scala 181:25 chipyard.TestHarness.LargeBoomConfig.fir 151505:4]
//   wire  _io_rep_valid_T = state == 4'h6; // @[dcache.scala 182:25 chipyard.TestHarness.LargeBoomConfig.fir 151507:4]
//   wire  _T_59 = ~io_rep_valid; // @[dcache.scala 185:10 chipyard.TestHarness.LargeBoomConfig.fir 151525:4]
//   wire  opdata = io_rep_bits_opcode[0]; // @[Edges.scala 101:36 chipyard.TestHarness.LargeBoomConfig.fir 151526:4]
//   wire  _T_60 = ~opdata; // @[dcache.scala 185:27 chipyard.TestHarness.LargeBoomConfig.fir 151527:4]
//   wire  _T_61 = _T_59 | _T_60; // @[dcache.scala 185:24 chipyard.TestHarness.LargeBoomConfig.fir 151528:4]
//   wire  _T_63 = _T_61 | reset; // @[dcache.scala 185:9 chipyard.TestHarness.LargeBoomConfig.fir 151530:4]
//   wire  _T_64 = ~_T_63; // @[dcache.scala 185:9 chipyard.TestHarness.LargeBoomConfig.fir 151531:4]
//   wire  _io_meta_read_valid_T = state == 4'h1; // @[dcache.scala 188:31 chipyard.TestHarness.LargeBoomConfig.fir 151536:4]
//   wire  _io_meta_write_valid_T = state == 4'h9; // @[dcache.scala 192:32 chipyard.TestHarness.LargeBoomConfig.fir 151540:4]
//   wire  _io_wb_req_valid_T = state == 4'h7; // @[dcache.scala 198:28 chipyard.TestHarness.LargeBoomConfig.fir 151546:4]
//   wire  _io_mshr_wb_rdy_T_2 = state == 4'h8; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 151556:4]
//   wire  _io_mshr_wb_rdy_T_4 = state == 4'ha; // @[package.scala 15:47 chipyard.TestHarness.LargeBoomConfig.fir 151558:4]
//   wire  _io_mshr_wb_rdy_T_5 = _io_rep_valid_T | _io_wb_req_valid_T; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 151559:4]
//   wire  _io_mshr_wb_rdy_T_6 = _io_mshr_wb_rdy_T_5 | _io_mshr_wb_rdy_T_2; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 151560:4]
//   wire  _io_mshr_wb_rdy_T_7 = _io_mshr_wb_rdy_T_6 | _io_meta_write_valid_T; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 151561:4]
//   wire  _io_mshr_wb_rdy_T_8 = _io_mshr_wb_rdy_T_7 | _io_mshr_wb_rdy_T_4; // @[package.scala 72:59 chipyard.TestHarness.LargeBoomConfig.fir 151562:4]
//   wire  _io_lsu_release_valid_T = state == 4'h5; // @[dcache.scala 209:33 chipyard.TestHarness.LargeBoomConfig.fir 151565:4]
//   wire  _T_66 = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151585:6]
//   wire  _T_68 = io_meta_read_ready & io_meta_read_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151601:8]
//   wire  _T_69 = state == 4'h2; // @[dcache.scala 222:22 chipyard.TestHarness.LargeBoomConfig.fir 151607:8]
//   wire  _T_70 = state == 4'h3; // @[dcache.scala 225:22 chipyard.TestHarness.LargeBoomConfig.fir 151612:10]
//   wire  _state_T = io_mshr_rdy & io_wb_rdy; // @[dcache.scala 229:30 chipyard.TestHarness.LargeBoomConfig.fir 151616:12]
//   wire [3:0] _state_T_1 = _state_T ? 4'h4 : 4'h1; // @[dcache.scala 229:17 chipyard.TestHarness.LargeBoomConfig.fir 151617:12]
//   wire  _T_71 = state == 4'h4; // @[dcache.scala 230:22 chipyard.TestHarness.LargeBoomConfig.fir 151621:12]
//   wire  _state_T_2 = tag_matches & is_dirty; // @[dcache.scala 231:30 chipyard.TestHarness.LargeBoomConfig.fir 151623:14]
//   wire [3:0] _state_T_3 = _state_T_2 ? 4'h7 : 4'h5; // @[dcache.scala 231:17 chipyard.TestHarness.LargeBoomConfig.fir 151624:14]
//   wire  _T_73 = io_lsu_release_ready & io_lsu_release_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151630:16]
//   wire [3:0] _GEN_10 = _T_73 ? 4'h6 : state; // @[dcache.scala 233:34 chipyard.TestHarness.LargeBoomConfig.fir 151631:16 dcache.scala 234:13 chipyard.TestHarness.LargeBoomConfig.fir 151632:18 dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   wire [3:0] _state_T_4 = tag_matches ? 4'h9 : 4'h0; // @[dcache.scala 238:19 chipyard.TestHarness.LargeBoomConfig.fir 151639:20]
//   wire [3:0] _GEN_11 = io_rep_ready ? _state_T_4 : state; // @[dcache.scala 237:25 chipyard.TestHarness.LargeBoomConfig.fir 151638:18 dcache.scala 238:13 chipyard.TestHarness.LargeBoomConfig.fir 151640:20 dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   wire  _T_76 = io_wb_req_ready & io_wb_req_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151646:20]
//   wire [3:0] _GEN_12 = _T_76 ? 4'h8 : state; // @[dcache.scala 241:29 chipyard.TestHarness.LargeBoomConfig.fir 151647:20 dcache.scala 242:13 chipyard.TestHarness.LargeBoomConfig.fir 151648:22 dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   wire [3:0] _GEN_13 = io_wb_req_ready ? 4'h9 : state; // @[dcache.scala 246:28 chipyard.TestHarness.LargeBoomConfig.fir 151654:22 dcache.scala 247:13 chipyard.TestHarness.LargeBoomConfig.fir 151655:24 dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   wire  _T_79 = io_meta_write_ready & io_meta_write_valid; // @[Decoupled.scala 40:37 chipyard.TestHarness.LargeBoomConfig.fir 151661:24]
//   wire [3:0] _GEN_14 = _T_79 ? 4'ha : state; // @[dcache.scala 250:33 chipyard.TestHarness.LargeBoomConfig.fir 151662:24 dcache.scala 251:13 chipyard.TestHarness.LargeBoomConfig.fir 151663:26 dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   wire [3:0] _GEN_15 = _io_mshr_wb_rdy_T_4 ? 4'h0 : state; // @[dcache.scala 253:45 chipyard.TestHarness.LargeBoomConfig.fir 151668:24 dcache.scala 254:11 chipyard.TestHarness.LargeBoomConfig.fir 151669:26 dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//   wire [3:0] _GEN_16 = _io_meta_write_valid_T ? _GEN_14 : _GEN_15; // @[dcache.scala 249:40 chipyard.TestHarness.LargeBoomConfig.fir 151660:22]
//   wire [3:0] _GEN_17 = _io_mshr_wb_rdy_T_2 ? _GEN_13 : _GEN_16; // @[dcache.scala 244:44 chipyard.TestHarness.LargeBoomConfig.fir 151653:20]
//   wire [3:0] _GEN_18 = _io_wb_req_valid_T ? _GEN_12 : _GEN_17; // @[dcache.scala 240:43 chipyard.TestHarness.LargeBoomConfig.fir 151645:18]
//   wire [3:0] _GEN_19 = _io_rep_valid_T ? _GEN_11 : _GEN_18; // @[dcache.scala 236:37 chipyard.TestHarness.LargeBoomConfig.fir 151637:16]
//   wire [3:0] _GEN_20 = _io_lsu_release_valid_T ? _GEN_10 : _GEN_19; // @[dcache.scala 232:41 chipyard.TestHarness.LargeBoomConfig.fir 151629:14]
//   wire [3:0] _GEN_21 = _T_71 ? _state_T_3 : _GEN_20; // @[dcache.scala 230:39 chipyard.TestHarness.LargeBoomConfig.fir 151622:12 dcache.scala 231:11 chipyard.TestHarness.LargeBoomConfig.fir 151625:14]
//   wire [3:0] _GEN_24 = _T_70 ? _state_T_1 : _GEN_21; // @[dcache.scala 225:38 chipyard.TestHarness.LargeBoomConfig.fir 151613:10 dcache.scala 229:11 chipyard.TestHarness.LargeBoomConfig.fir 151618:12]
//   assign io_req_ready = state == 4'h0; // @[dcache.scala 181:25 chipyard.TestHarness.LargeBoomConfig.fir 151505:4]
//   assign io_rep_valid = state == 4'h6; // @[dcache.scala 182:25 chipyard.TestHarness.LargeBoomConfig.fir 151507:4]
//   assign io_rep_bits_opcode = 3'h4; // @[Edges.scala 407:17 chipyard.TestHarness.LargeBoomConfig.fir 151509:4 Edges.scala 408:15 chipyard.TestHarness.LargeBoomConfig.fir 151511:4]
//   assign io_rep_bits_param = _T_57 ? 3'h3 : _T_55; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151497:4]
//   assign io_rep_bits_size = req_size; // @[Edges.scala 407:17 chipyard.TestHarness.LargeBoomConfig.fir 151509:4 Edges.scala 410:15 chipyard.TestHarness.LargeBoomConfig.fir 151513:4]
//   assign io_rep_bits_source = req_source; // @[Edges.scala 407:17 chipyard.TestHarness.LargeBoomConfig.fir 151509:4 Edges.scala 411:15 chipyard.TestHarness.LargeBoomConfig.fir 151514:4]
//   assign io_rep_bits_address = req_address; // @[Edges.scala 407:17 chipyard.TestHarness.LargeBoomConfig.fir 151509:4 Edges.scala 412:15 chipyard.TestHarness.LargeBoomConfig.fir 151515:4]
//   assign io_meta_read_valid = state == 4'h1; // @[dcache.scala 188:31 chipyard.TestHarness.LargeBoomConfig.fir 151536:4]
//   assign io_meta_read_bits_idx = req_address[11:6]; // @[dcache.scala 168:28 chipyard.TestHarness.LargeBoomConfig.fir 151429:4]
//   assign io_meta_read_bits_tag = req_address[31:12]; // @[dcache.scala 169:29 chipyard.TestHarness.LargeBoomConfig.fir 151430:4]
//   assign io_meta_write_valid = state == 4'h9; // @[dcache.scala 192:32 chipyard.TestHarness.LargeBoomConfig.fir 151540:4]
//   assign io_meta_write_bits_idx = req_address[11:6]; // @[dcache.scala 168:28 chipyard.TestHarness.LargeBoomConfig.fir 151429:4]
//   assign io_meta_write_bits_way_en = way_en; // @[dcache.scala 193:29 chipyard.TestHarness.LargeBoomConfig.fir 151542:4]
//   assign io_meta_write_bits_data_coh_state = _T_57 ? 2'h2 : _T_56; // @[Misc.scala 37:63 chipyard.TestHarness.LargeBoomConfig.fir 151498:4]
//   assign io_meta_write_bits_data_tag = req_address[31:12]; // @[dcache.scala 169:29 chipyard.TestHarness.LargeBoomConfig.fir 151430:4]
//   assign io_wb_req_valid = state == 4'h7; // @[dcache.scala 198:28 chipyard.TestHarness.LargeBoomConfig.fir 151546:4]
//   assign io_wb_req_bits_tag = req_address[31:12]; // @[dcache.scala 169:29 chipyard.TestHarness.LargeBoomConfig.fir 151430:4]
//   assign io_wb_req_bits_idx = req_address[11:6]; // @[dcache.scala 168:28 chipyard.TestHarness.LargeBoomConfig.fir 151429:4]
//   assign io_wb_req_bits_param = _T_57 ? 3'h3 : _T_55; // @[Misc.scala 37:36 chipyard.TestHarness.LargeBoomConfig.fir 151497:4]
//   assign io_wb_req_bits_way_en = way_en; // @[dcache.scala 203:25 chipyard.TestHarness.LargeBoomConfig.fir 151552:4]
//   assign io_mshr_wb_rdy = ~_io_mshr_wb_rdy_T_8; // @[dcache.scala 207:21 chipyard.TestHarness.LargeBoomConfig.fir 151563:4]
//   assign io_lsu_release_valid = state == 4'h5; // @[dcache.scala 209:33 chipyard.TestHarness.LargeBoomConfig.fir 151565:4]
//   assign io_lsu_release_bits_address = req_address; // @[Edges.scala 407:17 chipyard.TestHarness.LargeBoomConfig.fir 151567:4 Edges.scala 412:15 chipyard.TestHarness.LargeBoomConfig.fir 151573:4]
//   assign io_state_valid = state != 4'h0; // @[dcache.scala 178:27 chipyard.TestHarness.LargeBoomConfig.fir 151502:4]
//   assign io_state_bits = {{8'd0}, req_address}; // @[dcache.scala 179:18 chipyard.TestHarness.LargeBoomConfig.fir 151504:4]
//   always @(posedge clock) begin
//     if (reset) begin // @[dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//       state <= 4'h0; // @[dcache.scala 165:22 chipyard.TestHarness.LargeBoomConfig.fir 151427:4]
//     end else if (_io_req_ready_T) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (_T_66) begin // @[dcache.scala 214:26 chipyard.TestHarness.LargeBoomConfig.fir 151586:6]
//         state <= 4'h1; // @[dcache.scala 215:13 chipyard.TestHarness.LargeBoomConfig.fir 151587:8]
//       end
//     end else if (_io_meta_read_valid_T) begin // @[dcache.scala 218:39 chipyard.TestHarness.LargeBoomConfig.fir 151600:6]
//       if (_T_68) begin // @[dcache.scala 219:32 chipyard.TestHarness.LargeBoomConfig.fir 151602:8]
//         state <= 4'h2; // @[dcache.scala 220:13 chipyard.TestHarness.LargeBoomConfig.fir 151603:10]
//       end
//     end else if (_T_69) begin // @[dcache.scala 222:39 chipyard.TestHarness.LargeBoomConfig.fir 151608:8]
//       state <= 4'h3; // @[dcache.scala 224:11 chipyard.TestHarness.LargeBoomConfig.fir 151609:10]
//     end else begin
//       state <= _GEN_24;
//     end
//     if (_io_req_ready_T) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (_T_66) begin // @[dcache.scala 214:26 chipyard.TestHarness.LargeBoomConfig.fir 151586:6]
//         req_param <= io_req_bits_param; // @[dcache.scala 216:11 chipyard.TestHarness.LargeBoomConfig.fir 151594:8]
//       end
//     end
//     if (_io_req_ready_T) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (_T_66) begin // @[dcache.scala 214:26 chipyard.TestHarness.LargeBoomConfig.fir 151586:6]
//         req_size <= io_req_bits_size; // @[dcache.scala 216:11 chipyard.TestHarness.LargeBoomConfig.fir 151593:8]
//       end
//     end
//     if (_io_req_ready_T) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (_T_66) begin // @[dcache.scala 214:26 chipyard.TestHarness.LargeBoomConfig.fir 151586:6]
//         req_source <= io_req_bits_source; // @[dcache.scala 216:11 chipyard.TestHarness.LargeBoomConfig.fir 151592:8]
//       end
//     end
//     if (_io_req_ready_T) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (_T_66) begin // @[dcache.scala 214:26 chipyard.TestHarness.LargeBoomConfig.fir 151586:6]
//         req_address <= io_req_bits_address; // @[dcache.scala 216:11 chipyard.TestHarness.LargeBoomConfig.fir 151591:8]
//       end
//     end
//     if (!(_io_req_ready_T)) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (!(_io_meta_read_valid_T)) begin // @[dcache.scala 218:39 chipyard.TestHarness.LargeBoomConfig.fir 151600:6]
//         if (!(_T_69)) begin // @[dcache.scala 222:39 chipyard.TestHarness.LargeBoomConfig.fir 151608:8]
//           if (_T_70) begin // @[dcache.scala 225:38 chipyard.TestHarness.LargeBoomConfig.fir 151613:10]
//             way_en <= io_way_en; // @[dcache.scala 227:12 chipyard.TestHarness.LargeBoomConfig.fir 151615:12]
//           end
//         end
//       end
//     end
//     if (!(_io_req_ready_T)) begin // @[dcache.scala 213:30 chipyard.TestHarness.LargeBoomConfig.fir 151584:4]
//       if (!(_io_meta_read_valid_T)) begin // @[dcache.scala 218:39 chipyard.TestHarness.LargeBoomConfig.fir 151600:6]
//         if (!(_T_69)) begin // @[dcache.scala 222:39 chipyard.TestHarness.LargeBoomConfig.fir 151608:8]
//           if (_T_70) begin // @[dcache.scala 225:38 chipyard.TestHarness.LargeBoomConfig.fir 151613:10]
//             old_coh_state <= io_block_state_state; // @[dcache.scala 226:13 chipyard.TestHarness.LargeBoomConfig.fir 151614:12]
//           end
//         end
//       end
//     end
//     `ifndef SYNTHESIS
//     `ifdef PRINTF_COND
//       if (`PRINTF_COND) begin
//     `endif
//         if (_T_64) begin
//           $fwrite(32'h80000002,
//             "Assertion failed: ProbeUnit should not send ProbeAcks with data, WritebackUnit should handle it\n    at dcache.scala:185 assert(!io.rep.valid || !edge.hasData(io.rep.bits),\n"
//             ); // @[dcache.scala 185:9 chipyard.TestHarness.LargeBoomConfig.fir 151533:6]
//         end
//     `ifdef PRINTF_COND
//       end
//     `endif
//     `endif // SYNTHESIS
//     `ifndef SYNTHESIS
//     `ifdef STOP_COND
//       if (`STOP_COND) begin
//     `endif
//         if (_T_64) begin
//           $fatal; // @[dcache.scala 185:9 chipyard.TestHarness.LargeBoomConfig.fir 151534:6]
//         end
//     `ifdef STOP_COND
//       end
//     `endif
//     `endif // SYNTHESIS
//   end
// // Register and memory initialization
// `ifdef RANDOMIZE_GARBAGE_ASSIGN
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_INVALID_ASSIGN
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_REG_INIT
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_MEM_INIT
// `define RANDOMIZE
// `endif
// `ifndef RANDOM
// `define RANDOM $random
// `endif
// `ifdef RANDOMIZE_MEM_INIT
//   integer initvar;
// `endif
// `ifndef SYNTHESIS
// `ifdef FIRRTL_BEFORE_INITIAL
// `FIRRTL_BEFORE_INITIAL
// `endif
// initial begin
//   `ifdef RANDOMIZE
//     `ifdef INIT_RANDOM
//       `INIT_RANDOM
//     `endif
//     `ifndef VERILATOR
//       `ifdef RANDOMIZE_DELAY
//         #`RANDOMIZE_DELAY begin end
//       `else
//         #0.002 begin end
//       `endif
//     `endif
// `ifdef RANDOMIZE_REG_INIT
//   _RAND_0 = {1{`RANDOM}};
//   state = _RAND_0[3:0];
//   _RAND_1 = {1{`RANDOM}};
//   req_param = _RAND_1[1:0];
//   _RAND_2 = {1{`RANDOM}};
//   req_size = _RAND_2[3:0];
//   _RAND_3 = {1{`RANDOM}};
//   req_source = _RAND_3[2:0];
//   _RAND_4 = {1{`RANDOM}};
//   req_address = _RAND_4[31:0];
//   _RAND_5 = {1{`RANDOM}};
//   way_en = _RAND_5[7:0];
//   _RAND_6 = {1{`RANDOM}};
//   old_coh_state = _RAND_6[1:0];
// `endif // RANDOMIZE_REG_INIT
//   `endif // RANDOMIZE
// end // initial
// `ifdef FIRRTL_AFTER_INITIAL
// `FIRRTL_AFTER_INITIAL
// `endif
// `endif // SYNTHESIS
// endmodule
