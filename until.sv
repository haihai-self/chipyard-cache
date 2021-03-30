
function automatic logic isPow2(int n);
  if (n < 1) return 0;
  return (n & (n - 1)) == 0;
endfunction


function automatic [`maxBrCount-1:0] getNewBrMask(ExuST::BrUpdateInfoST brupdate,
                                                    logic [`maxBrCount-1:0] br_mask);
  return br_mask & ~brupdate.b1.resolve_mask;
endfunction

function automatic logic maskMatch(logic [`maxBrCount-1:0] msk1, logic [`maxBrCount-1:0] msk2);
  return (msk1 & msk2) != 0;
endfunction


function automatic logic isKilledByBranch(ExuST::BrUpdateInfoST brupdate,
                                          logic [`maxBrCount-1:0] br_mask);
  return maskMatch(brupdate.b1.resolve_mask, br_mask);
endfunction

function automatic logic flush_fn(Micro::MicroOpST uop);
  return uop.uses_ldq;
endfunction

module BranchKillableQueue #(
    parameter entries = 16,
    parameter flow = 0,
    type T = MSHRST::BoomDCacheReqInternalST
) (
    input  logic                       clock,
    input  logic                       reset,
    input  logic                       io_flush,
    output logic                       io_empty,
    output logic [$clog2(entries)-1:0] io_count,

    input ExuST::BrUpdateInfoST io_brupdate,

    DecoupledIF.out io_enq,  //T
    DecoupledIF.in  io_deq  //T
);

  T ram[entries-1:0];
  logic [entries-1:0] valids;  //init with false
  Micro::MicroOpST uops[entries-1:0];
  logic [$clog2(entries)-1:0] enq_ptr;  //counter
  logic [$clog2(entries)-1:0] deq_ptr;  //counter
  logic maybe_full;  //可能队列满了

  //wire
  logic ptr_match;
  logic full;
  logic do_deq;
  logic do_enq;
  T out;
  logic [$clog2(entries-1):0] ptr_diff;

  //assign wire
  always_comb begin
    // init wire
    do_enq = io_enq.valid && io_enq.ready;
    do_deq = (io_deq.valid && valids[deq_ptr]) && !io_empty;

    // assign wire
    full = ptr_match && maybe_full;  //队列满
    ptr_match = enq_ptr == deq_ptr;  //出队数量等于入队数量

    out = ram[deq_ptr];
    out.uop = uops[deq_ptr];

    //流式队列 直接出队入队
    if (flow) begin
      if (io_empty) begin
        do_deq = false;
        if (io_deq.ready) do_enq = false;
      end
    end

    //队列元素个数
    ptr_diff = enq_ptr - deq_ptr;


  end

  //assign io
  always_comb begin

    io_empty = ptr_match & ~maybe_full;
    io_enq.ready = !full;

    //出队数据更新
    io_deq.valid = !io_empty && valids[deq_ptr] &&
        isKilledbyBrcanch(io_brupdate, out.uop.br_mask) && (io_flush && flush_fn(out.uop));
    io_deq.bits = out;
    io_deq.bits.uop.br_mask = GetNewBrMask(io_brupdate, out.uop.br_mask);

    //流式队列 直接出队入队
    if (flow) begin
      if (io_empty) begin
        io_deq.valid = io_enq.valid;
        io_deq.bits = io_enq.bits;
        io_deq.bits.uop.br_mask = GetNewBrMask(io_brupdate, io_enq.bits.uop);

      end
    end

    if (isPow2(entries)) io_count = {maybe_full && ptr_match, ptr_diff};
    else
      io_count = ptr_match ? (maybe_full ? entries : 0) : (
          deq_ptr > enq_ptr ? (entries + ptr_diff) : ptr_diff
          );  //要是出队大于入队用加法是不是不太好
  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      maybe_full <= 0;
      valids <= 0;

    end else begin
      for (int i = 0; i < entries; i++) begin
        valids[i] <= valids[i] && !isKilledbyBrcanch(io_brupdate, uops[i].br_mask) &&
            !(io_flush && flush_fn(uops[i]));
        // if valids是旧的值还是新的值？
        if (valids[i]) uops[i].br_mask <= GetNewBrMask(i_brupdate, uops[i].br_mask);
      end
    end

    if (do_enq) begin  //入队
      ram[enq_ptr] <= io_enq.bits;
      valids[enq_ptr] <= 1;
      uops[enq_ptr] <= io_enq.bits.uop;
      uops[enq_ptr].br_mask <= GetNewBrMask(io_brupdate, io_enq.bits.uop.br_mask);
      enq_ptr <= enq_ptr + 1;
    end

    if (do_deq) begin  //出队
      valids[deq_ptr] <= 0;
      deq_ptr <= deq_ptr + 1;
    end

    if (do_deq != do_enq) maybe_full <= do_enq;
  end

endmodule
