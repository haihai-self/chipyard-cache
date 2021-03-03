// package lsu
  
// import tilelink::*;

parameter encRowBits = 128;

typedef struct packed {
  logic [19:0] tag;
  logic [5:0] idx;
  logic [1:0] param;
  logic [2:0] source;
  logic way_en;
  logic voluntary;
} WriteBackReqST;

typedef struct packed {
    logic [2:0] param;
    logic [3:0] size;
    logic [2:0] source;
    logic [31:0] address;
} TLBundleST;

module BoomWriteBackUnit(
  input logic clock,
  input logic reset,
  WriteBackReqIF.inputready io_req,
  L1MetaReadReqIF.WriteBackUnit io_meta_read,
  output logic io_resp,
  ValidIF.outputdata io_idx,
  L1DataReadReqIF.inputready io_data_req,
  input logic [encRowBits-1 : 0] io_data_resp,
  input logic io_mem_grant,
  TLBundleCIF.WriteBackRelease io_release,
  TLBundleCIF.WriteBackLsuRelease io_lsu_release
  );

  WriteBackReqST req;
  typedef enum {s_invalid, s_fill_buffer, s_lsu_release, s_active, s_grant} writebackstates;
  writebackstates states;
  logic r1_data_req_fired;
  logic r2_data_req_fired;
  logic [2:0] r1_data_req_cnt;
  logic [2:0] r2_data_req_cnt;
  logic [2:0] data_req_cnt;
  
  logic [127:0] wb_buffer[4];
  logic [127:0] probe_response;

  logic acked; 

  logic io_req_fire ;
  logic io_data_req_fire;
  logic io_meta_read_fire;
  logic io_lsu_release_fire;
  logic io_release_fire;

  assign probeResponse = 2'h3 == data_req_cnt[1:0]? wb_buffer[3]: 2'h2 == data_req_cnt[1:0]? wb_buffer[2]: 2'h1 == data_req_cnt[1:0]? wb_buffer[1]: wb_buffer[0];

  /*fire信号生成*/

  assign io_req_fire = io_req.ready & io_req.valid;
  assign io_data_req_fire = io_data_req.ready & io_data_req.valid;
  assign io_meta_read_fire = io_meta_read.ready & io_meta_read.valid;
  assign io_lsu_release_fire = io_lsu_release.ready & io_lsu_release.valid;
  assign io_release_fire = io_release.ready & io_release.valid;

  /*输出赋值*/

  assign io_req.ready = (states == s_invalid);

  assign io_meta_read.valid = states == s_fill_buffer ? data_req_cnt < 3'h4: 1'h0;
  assign io_meta_read.idx = req.idx;
  assign io_meta_read.tag = req.tag;

  assign io_resp = (r2_data_req_fired && (r2_data_req_cnt == 3)) ? 1'h1: 1'h0;

  assign io_idx.valid = states != s_invalid;
  assign io_idx.bits = req.idx;

  assign io_data_req.valid = io_meta_read.valid;
  assign io_data_req.way_en = req.way_en;
  assign io_data_req.addr = {req.idx, data_req_cnt[1:0], 4'h0};

  assign io_release.valid = states == s_active? data_req_cnt < 3'h4: 1'h0;
  assign io_release.opcode = req.voluntary? 3'h7: 3'h5;
  assign io_release.param = req.param;
  assign io_release.address = {req.tag, req.idx, 6'h0};
  assign io_release.data = req.voluntary? probe_response: probe_response;

  assign io_lsu_release.valid = states == s_lsu_release;
  assign io_lsu_release.param = req.param;
  assign io_lsu_release.address = io_release.address;
  assign io_lsu_release.data = probeResponse;


  

  always_ff@(posedge clock) begin
    
    case (states)
      s_invalid: begin
        if (io_req_fire) begin
          
          states <= s_fill_buffer;
          data_req_cnt <= 3'h0;
          req_.tag <= io_req.tag; //assign req
          req.idx <= io_req.idx;
          req.param <= io_req.param;
          req.way_en <= io_req.way_en;
          req.voluntary <= io_req.voluntary;
          acked <= 1'h0;
        end
      end

      s_fill_buffer: begin

        r1_data_req_fired <= 1'h0;  //r2寄存器延时一个周期
        r1_data_req_cnt <= 3'h0;
        r2_data_req_fired <= r1_data_req_fired;
        r2_data_req_cnt <= r1_data_req_cnt;

        if (io_data_req_fire && io_meta_read_fire)  //寄存器计数
        begin
          r1_data_req_fired <= 1'h1;
          r1_data_req_cnt <= data_req_cnt;
          data_req_cnt <= data_req_cnt + 1;
        end

        if (r2_data_req_fired) begin  //拷贝数据到wb_buffer中
          wb_buffer[r2_data_req_cnt] <= io_data_resp;
          if (r2_data_req_cnt == 3'h3) begin
            states <= s_lsu_release;
            data_req_cnt <= 3'h0;
          end
        end
      end  //end s_fill_buffer

      s_lsu_release: begin  

        if (io_lsu_release_fire)
          states <= s_active;
      end //end s_lsu_release

      s_active: begin  

        if (io_mem_grant)
          acked <= 1'h1;
        if (io_release_fire)
          data_req_cnt <= data_req_cnt + 1;

        if (data_req_cnt == 3'h3 && io_release_fire)
          states <= req.voluntary? s_grant: s_invalid;

      end  //end s_activate
      s_grant: begin
        if (io_mem_grant)
          acked <= 1'h1;
        if (acked)
          states <= s_invalid;
      end
      default: begin
        states<= s_invalid;
        end


    endcase //end case_states
  end //end always_ff
  

endmodule; //end module writebackunit


/*写回状态转换*/
function automatic logic[5:0] onProb(logic [3:0] param);
  localparam Nothing = 2'h0;
  localparam Branch = 2'h1;
  localparam Trunk = 2'h2;
  localparam Dirty = 2'h3;

  localparam toT = 2'h0;
  localparam toB = 2'h1;
  localparam toN = 2'h2;
  
  localparam TtoT = 3'h3;
  localparam BtoB = 3'h4;
  localparam NtoN = 3'h5;
  localparam TtoB = 3'h0;
  localparam TtoN = 3'h1;
  localparam BtoN = 3'h2;

  localparam False = 1'h0 ;
  localparam True = 1'h1;
  
  logic [5:0] result;

  result = {toT, Dirty}     == param    ?   {True,  TtoT, Trunk}        :
           {toT, Trunk}     == param    ?   {False, TtoT, Trunk}        :
           {toT, Branch}    == param    ?   {False, BtoB, Branch}       :
           {toT, Nothing}   == param    ?   {False, NtoN, Nothing}      :
           {toB, Dirty}     == param    ?   {True,  TtoB, Branch}       :
           {toB, Trunk}     == param    ?   {False, TtoB, Branch}       :
           {toB, Branch}    == param    ?   {False, BtoB, Branch}       :
           {toB, Nothing}   == param    ?   {False, NtoN, Nothing}      :
           {toN, Dirty}     == param    ?   {True,  TtoT, Nothing}      :
           {toN, Trunk}     == param    ?   {False, TtoN, Nothing}      :
           {toN, Branch}    == param    ?   {False, BtoN, Nothing}      :
           {toN, Nothing}   == param    ?   {False, NtoN, Nothing}      : 0;
           
  return result;  
endfunction

module BoomProbeUnit (
  input logic clock, reset,
  TLBundleBIF.ProbeUnitReq io_req,
  TLBundleCIF.ProbeUnitRep io_rep,
  L1MetaReadReqIF.ProbeUnit io_meta_read,
  L1MetaWriteReqIF.inputready io_meta_write,
  WriteBackReqIF.inputready io_wb_req,
  input logic [7:0] io_way_en,
  input logic io_wb_rdy,
  input logic io_mshr_rdy,
  input logic io_mshr_wb_rdy,
  input [1:0] io_block_state,
  TLBundleCIF.ProbeUnitLsuRelease io_lsu_release
);

typedef enum{s_invalid, s_meta_read, s_meta_resp, s_mshr_req, s_mshr_resp, s_lsu_release, s_release, s_writeback_req, s_writeback_resp,s_meta_write, s_meta_write_resp} probstate;

  probstate states;
  TLBundleST req;
  logic is_dirty, tag_match;

  logic [7:0] way_en;
  logic [1:0] old_coh, reply_coh, new_coh;
  logic [2:0] report_param;

  assign {is_dirty, report_param, new_coh} = onProb({req.param, reply_coh});
  assign tag_match = |way_en;
  assign reply_coh = tag_match? old_coh: 2'h0;

  /*assign fire signal*/

  logic io_req_fire;
  logic io_meta_read_fire;
  logic io_lsu_release_fire;
  logic io_wb_req_fire;
  logic io_meta_write_fire;

  assign io_req_fire = io_req.valid & io_req.ready;
  assign io_meta_read_fire = io_meta_read.valid & io_meta_read.ready;
  assign io_lsu_release_fire = io_lsu_release.valid & io_lsu_release.ready;
  assign io_wb_req_fire = io_wb_req.valid & io_wb_req.ready;
  assign io_meta_write_fire = io_meta_write.valid & io_meta_write.ready;


  /*assign output port*/
  assign io_req.ready = states == s_invalid;

  assign io_rep.valid = states == s_release;
  assign io_rep.opcode = 3'h4;
  assign io_rep.param = report_param;
  assign io_rep.size = req.size;
  assign io_rep.source = req.source;
  assign io_rep.address = req.address;

  assign io_meta_read.valid = states == s_meta_read;
  assign io_meta_read.idx = req.address[11:6];
  assign io_meta_read.tag = req.address[31:12];

  assign io_meta_write = states == s_meta_write;
  assign io_meta_write.way_en = way_en;
  assign io_meta_write.idx = req.address[11:6];
  assign io_meta_write.data_coh_state = new_coh;
  assign io_meta_write.data_tag = req.address[31:12];

  assign io_wb_req.valid = states == s_writeback_req;
  assign io.wb_req.source = req.source;
  assign io_wb_req.idx = req.idx;
  assign io_wb_req.tag = req.tag;
  assign io_wb_req.param = report_param;
  assign io_wb_req.way_en = way_en;
  assign io_wb_req.voluntary = 1'h0;

  assign io_mshr_wb_rdy = states inside {s_lsu_release, s_writeback_req, s_writeback_resp, s_meta_write, s_meta_write_resp};

  assign io_lsu_release.valid = states == s_lsu_release;
  assign io_lsu_release.param = report_param;
  assign io_lsu_release.size = req.size;
  assign io_lsu_release.source = req.source;
  assign io_lsu_release.address = req.address;



  always_ff@(posedge clock) begin

    case (states)
      s_invalid:begin
        if (io_req_fire) begin
          req.param <= io_req.param;
          req.size <= io_req.size;
          req.source <= io_req.source;
          req.address <= io_req.address;
          states <= s_meta_read;
        end
      end  //end states s_invalid
      s_meta_read:begin
        if (io_meta_read_fire)begin
          states <= s_meta_resp; 
        end
      end  //end states s_meta_read
      s_meta_resp:begin
        states <= s_mshr_req;
      end  //end state s_mshr_req
      s_mshr_req:begin
        way_en <= io_way_en;
        old_coh <= io_block_state;
        states <= io_mshr_rdy & io_wb_rdy? s_mshr_resp: s_meta_read;
      end  //end s_mshr_req
      s_mshr_resp:begin
        states <= tag_match & is_dirty? s_writeback_req: s_lsu_release;
      end  //end s_mshr_req
      s_lsu_release:begin
        if (io_lsu_release_fire)
          states <= s_release;
      end  //end s_lsu_release
      s_release:begin
        if (io_rep.ready)
          states <= tag_match? s_meta_write: s_invalid;
      end  //end states s_release
      s_writeback_req:begin
          if (io_wb_req_fire)
            states <= s_writeback_resp;
      end  //end writeback_req
      s_writeback_resp:begin
        if (io_wb_req.ready)
          states <= s_meta_write;
      end  //end writeback_resp
      s_meta_write:begin
        if (io_meta_write_fire)
          states <= s_meta_write_resp;
      end // end states s_meta_write
      s_meta_write_resp:begin
        states <= s_invalid;
      end
      default: begin
        states <= s_invalid;
      end//end default
    endcase
    

  end
  
endmodule


// module BoomNonBlockingDCache (
//   ports
// );
  
// endmodule