
package BoomLSUST;

localparam client_states_width = 2;


typedef struct packed {
    logic [`maxBrCount-1:0] resolve_mask;
    logic [`maxBrCount-1:0] mispredict_mask;
} BrUpdateMasksST;

typedef struct packed {
    BrUpdateMasksST b1;
} BrUpdateInfoST;

typedef struct packed {
    logic [`maxBrCount-1:0] br_mask;
    logic [4:0] ldq_idx;
    logic [4:0] stq_idx;
    logic [4:0] mem_cmd;
    logic [1:0] mem_size;
    logic mem_signed;
    logic is_amo;
    logic uses_ldq;
    logic uses_stq;
} MicroOpST;

typedef struct packed {
    MicroOpST uop;
    logic [39:0] addr;
    logic is_hella;
    logic tag_match;
    logic [client_states_width-1: 0] old_meta_coh_state;
    logic [19:0] old_meta_tag;
    logic [7:0] way_en;
    logic [4:0] sdq_id;    
} BoomDCacheReqInternalST;


typedef struct packed {
    logic valid;
    logic [1:0] coh;
} L1MetadataST;

typedef struct packed {
    logic [1:0] id;
    logic [1:0] offset;
    logic [127:0] data;
} LineBufferWriteReqST;

typedef struct packed {
    MicroOpST uop;
    logic [63:0] data;
    logic is_hella;
} BoomDCacheRespST;

typedef struct packed {
    logic [1:0] id      ;
    logic [1:0] offset  ;
} LineBufferReadReqST;

typedef struct packed {
    logic [3:0] sink;
} TLBundleEST;

typedef struct packed {
    logic valid;
    TLBundleEST bits;
} ValidTLBundleEST;



endpackage