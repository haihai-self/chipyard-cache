
import HasL1CacheParameters::*;
import MemoryOpConstants::*;
import TLBundleParam::*;


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
logic [`blockOffBits-1: 0] req_idx;
logic [tagBits-1: 0] req_tag;
logic [`paddrBits-1: 0] req_block_addr;
logic req_needs_wb; 


assign req_idx = req.addr[untagBits-1: `blockOffBits];
assign req_tag = req.addr >> untagBits;
assign req_block_addr = ((req.addr >> `blockOffBits) << `blockOffBits);

logic [TLPermissions_width-1:0] new_coh;

logic [cwidth-1:0] shrink_param;
logic [TLPermissions_width-1:0] coh_on_clear;


assign {shrink_param, coh_on_clear} = onCacheControl(req.old_meta_coh_state, M_FLUSH);  //need one bit flag

logic [2:0] grow_param;
logic [TLPermissions_width-1: 0] coh_on_grant;

assign grow_param = onAccess(new_coh, req.uop.mem_cmd);
assign coh_on_grant = onGrant(req.uop.mem_cmd, io_mem_grant);

logic [$clog2(cacheDataBeats)-1:0] refill_ctr;
logic commit_line;
logic grant_had_data;
logic finish_to_prefetch;
logic is_hit;
logic coh_on_hit;



logic rpq_i_enq_valid;
logic rpq_o_enq_ready;
logic rpq_o_deq_valid;
BoomDCacheReqInternalST rpq_o_deq;
logic rpq_o_empty;
logic [$clog2(cfg.nRPQ)-1: 0] rpq_o_count;




assign rpq_i_enq_valid = (i_req_pri_val && o_req_pri_rdy) || 
                         (i_req_sec_val && o_req_sec_rdy) &&
                         !isPrefetch(i_req.uop.mem_cmd);

BranchKillableQueue # (.entries(cfg.nRPQ)            ,
                      .T(BoomDCacheReqInternalST)) 
                    rpq
                    (.clock(clock)                ,
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
                    );

function automatic MSHRSStates handle_pri_req(MSHRSStates old_state);
    logic [client_states_width-1: 0] old_coh;
    logic [5:0] on_cache_result;
    logic [5:0] on_access;

    MSHRSStates new_state;
    new_state = old_state;
    grantack.valid = 0;
    assert(rpq_o_enq_ready); 
    req = i_req;
    old_coh = i_req.old_meta_coh_state;
    on_cache_result = onCacheControl(old_coh, M_FLUSH);
    req_needs_wb = on_cache_result[5];
    if (i_req.tag_match)begin
        on_access = onAccess(old_coh, i_req.uop.mem_cmd);
        is_hit = on_access[5];
        coh_on_hit = on_access[1:0];
        if (is_hit) begin
            assert(isWrite(i_req.uop.mem_cmd));
            new_coh = coh_on_hit;
            new_state = s_drain_rpq;
        end
        else begin
            new_coh = old_coh;
            new_state = s_refill_req;
        end
    end
    else begin
        new_coh = Nothing;
        new_state = s_refill_req;
    end


    return new_state;
    

        
endfunction

always_ff @(posedge clock) begin
    case (states)
        s_invalid: begin
            o_req_pri_rdy <= 1;
            // logic grant_had_data = 0;
            // if (i_req_pri_val & o_req_pri_rdy)begin
                
            // end
        end

        default: begin
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