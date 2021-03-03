`include "./structure/lsust.sv";
`include "./parameters.sv"
import boom_lsu_st::*;

function automatic logic isPow2(int n);
    if (n < 1) return 0;
    return (n & (n-1))==0;
endfunction


function automatic [`maxBrCount-1: 0] getNewBrMask(
                        BrUpdateInfoST brupdate,
                        logic [`maxBrCount-1: 0] br_mask);
    return br_mask & ~brupdate.b1.resolve_mask;
endfunction

function automatic logic maskMatch(
                logic[`maxBrCount-1:0] msk1,
                logic[`maxBrCount-1:0] msk2);
    return (msk1 & msk2) != 0;
endfunction


function automatic logic isKilledByBranch(
                BrUpdateInfoST brupdate, 
                logic [`maxBrCount-1: 0] br_mask);
    return maskMatch(brupdate.b1.resolve_mask, br_mask);
endfunction

function automatic logic flush_fn(MicroOpST uop);
    return uop.uses_ldq;
endfunction

module BranchKillableQueue #(
    parameter   entries =   16                      ,
    parameter   flow    =   0                       ,
    type        T       =   BoomDCacheReqInternalST
) (
    input   logic                           clock           ,
    input   logic                           reset           ,

    output  logic                           o_enq_ready     ,
    input   logic                           i_enq_valid     ,
    input   T                               i_enq           ,
    
    input   logic                           i_deq_ready     ,
    output  logic                           o_deq_ready     ,
    output  T                               o_deq           ,
    
    input   BrUpdateInfoST                  i_brupdate      ,
    input   logic                           i_flush         ,
    
    output  logic                           o_empty         ,
    output  logic [$clog2(entries)-1: 0]    o_count
);
    T ram [entries-1:0];
    logic [entries-1:0]valids;
    MicroOpST uops [entries-1:0];

    logic [$clog2(entries-1):0] enq_ptr;
    logic [$clog2(entries-1):0] deq_ptr;

    logic maybe_full;
    logic full;
    logic do_enq;
    logic do_deq;
    logic ptr_match;
    T out;

    assign ptr_match = enq_ptr == deq_ptr;
    assign o_empty = ptr_match & ~maybe_full;
    assign full = ptr_match & maybe_full;

    assign o_enq_ready = ~full;

    assign out = ram[deq_ptr];
    assign out.uop = uops[deq_ptr];
    assign o_deq_ready = !o_empty && 
                          valids[deq_ptr] && 
                          isKilledbyBrcanch(i_brupdate, out.uop.br_mask) &&
                          (i_flush && flush_fn(out.uop));
    assign o_deq = out;
    assign o_deq.uop.br_mask = GetNewBrMask(i_brupdate, out.uop.br_mask);

    always_ff @(posedge clock) begin
        for (int i=0; i<entries; i++)begin
            valids[i] <= valids[i]                                          && 
                         !isKilledbyBrcanch(i_brupdate, uops[i].br_mask)    && 
                         !(i_flush && flush_fn(uops[i]));
            if(valids[i])
                uops[i].br_mask <= GetNewBrMask(i_brupdate, uops[i].br_mask);
        end

        if (do_enq) begin  //入队
            ram[enq_ptr] <= i_enq;
            valids[enq_ptr] <= 1;
            uops[enq_ptr] <= i_enq.uop;
            uops[enq_ptr].br_mask <= GetNewBrMask(i_brupdate, i_enq.uop.br_mask);
            enq_ptr <= enq_ptr + 1;
        end

        if (do_deq)begin  //出队
            valids[deq_ptr] <= 0;
            deq_ptr <= deq_ptr + 1;
        end

        if (do_deq != do_enq)
            maybe_full <= do_enq; 
    end

    always_ff @(posedge clock) begin
        if (flow) begin
            o_deq_ready <= i_enq_valid;
            o_deq <= i_enq;
            o_deq.br_mask <= GetNewBrMask(i_brupdate, i_enq.uop.br_mask);
            do_deq <= 0;
            if (i_deq_ready) 
                do_enq <= 0;
        end
    end

    logic [$clog2(entries-1):0] ptr_diff;
    assign ptr_diff = enq_ptr - deq_ptr;

    always_comb begin
        if (isPow2(entries))
            o_count = {maybe_full && ptr_match, ptr_diff};
        else 
            o_count = ptr_match ? (maybe_full ? entries : 0) : 
                                 (deq_ptr > enq_ptr ? (entries + ptr_diff) : ptr_diff);

    end


endmodule