`include "structure/lsust.sv";    
import boom_lsu_st::*;

localparam cacheDataBeats=4;
localparam log2CeilcacheDataBeats=2;

module BoomMSHR(
    input   logic                  clock               ,
    input   logic                  reset               ,
    input   logic   [1:0]         i_id               ,
    input   logic                  i_req_pri_val      ,
    output  logic                  o_req_pri_rdy      ,
    input   logic                   i_req_sec_val      ,
    output  logic                  o_req_sec_rdy      ,
    input   logic                  i_clear_prefetch   ,
    input   BrUpdateInfoST                  i_brupdate         ,
    input   logic                  i_exception        ,
    input   BoomDCacheReqInternalST i_req,
    input logic i_req_is_probe,
    ValidIF.outputdata io_idx ,
    ValidIF.outputdata io_way,
    ValidIF.outputdata io_tag,
    TLBundleAIF.inputready io_mem_acquire,
    TLBundleDIF.inputready io_mem_grant,
    TLBundleEIF.inputready io_mem_finish,
    input logic io_prober_idle,
    L1DataReadReqIF.inputready io_refill,
    L1MetaWriteReqIF.inputready io_meta_write,
    L1MetaReadReqIF.inputready io_meta_read,
    input L1MetadataST,
    WriteBackReqIF.inputready io_wb_req,

    input   io_lb_read_ready,
    output io_lb_read_valid,
    output LineBufferReadReqST io_lb_read,

    input logic [127:0] io_lb_resp,

    input logic i_lb_wirte_ready,
    output logic o_lb_wirte_valid,
    output LineBufferWriteReqST o_lb_write,

    input logic i_reply_ready,
    output logic o_reply_valid,
    output BoomDCacheReqInternalST o_reply,

    input logic i_resp_ready,
    output logic o_resp_valid,
    output BoomDCacheRespST o_resp,

    input logic i_wb_resp,
    output logic o_probe_rdy

);


typedef enum { s_invalid,           s_refill_req,           s_refill_resp,      s_drain_rpq_loads, 
               s_meta_read,         s_meta_resp_1,          s_meta_resp_2,      s_meta_clear, 
               s_wb_meta_read,      s_wb_req, s_wb_resp,    s_commit_line,      s_drain_rpq, 
               s_meta_write_req,    s_mem_finish_1,         s_mem_finish_2,     s_prefetched, 
               s_prefetch 
               } MSHRSStates;
MSHRSStates states;

ValidTLBundleEST grantack;

BoomDCacheReqInternalST req;



logic [log2CeilcacheDataBeats-1:0] refill_ctr;
logic commit_line;
logic grant_had_data;
logic finish_to_prefetch;


logic rpq_i_enq_valid;
logic rpq_o_enq_ready;
logic rpq_o_deq_valid;
BoomDCacheReqInternalST rpq_o_deq;
logic rpq_o_empty;
logic [$clog2(cfg.nRPQ)-1: 0] rpq_o_count;




assign rpq_i_enq_valid = (i_req_pri_val && o_req_pri_rdy) || 
                         (i_req_sec_val && o_req_sec_rdy) &&
                         !isPrefetch(i_req);

BranchKillableQueue rpq #(.entries(cfg.nRPQ)            ,
                          .T(BoomDCacheReqInternal)) 
                         (.clock(clock)                 ,
                          .reset(reset)                 ,
                          .o_enq_ready(rpq_o_enq_ready) ,
                          .i_enq_valid(rpq_i_enq_valid) ,
                          .i_enq(i_req)                 ,
                          .i_deq_ready(0)               ,   
                          .o_deq_valid(o_deq_valid)     ,
                          .o_deq(rpq_o_deq)             ,
                          .i_brupdate(i_brupdate)       ,
                          .i_flush(i_exception)         ,
                          .o_empty(rpq_o_empty)         ,
                          .o_count(rpq_o_count)
                          )

function automatic MSHRSStates handle_pri_req(MSHRSStates old_state);
    MSHRSStates new_state;
    always_comb begin
        new_state = old_state;
        grantack.valid = 0;
        assert (io_) 
        else   error_process

        
    end
endfunction

always_ff @(posedge clock) begin
    case (states)
        s_invalid: begin
            o_req_pri_rdy <= 1;
            logic grant_had_data = 0;
            if (i_req_pri_val & o_req_pri_rdy)begin
                
            end
        end

        defaule: begin
            states <= s_invalid;
        end
    endcase
    
end

endmodule



// module BoomMSHRFile(
//     input       clock;
//     input       reset;


// );

// endmodule // end BoomMSHRFile