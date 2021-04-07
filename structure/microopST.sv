package Micro;
  typedef struct packed {
    logic [`maxBrCount-1:0] br_mask;
    logic [`ldqAddrSz-1:0] ldq_idx;
    logic [`stqAddrSz-1:0] stq_idx;
    logic [MemoryOpConstants::M_SZ-1:0] mem_cmd;
    logic [1:0] mem_size;
    logic mem_signed;
    logic is_amo;
    logic uses_ldq;
    logic uses_stq;
  } MicroOpST;
    
endpackage