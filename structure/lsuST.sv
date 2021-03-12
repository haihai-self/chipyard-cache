
package BoomLSUST;
import MemoryOpConstants::M_SZ;
import BundleParam::*;
import HasL1CacheParameters::*;
import HasL1CacheParameters::*;


typedef struct packed {
    logic [`maxBrCount-1:0] resolve_mask;
    logic [`maxBrCount-1:0] mispredict_mask;
} BrUpdateMasksST;

typedef struct packed {
    BrUpdateMasksST b1;
} BrUpdateInfoST;

typedef struct packed {
    logic [`maxBrCount-1:0] br_mask;
    logic [`ldqAddrSz-1:0] ldq_idx;
    logic [`stqAddrSz-1:0] stq_idx;
    logic [M_SZ-1:0] mem_cmd;
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
    logic [TLPermissions_width-1: 0] old_meta_coh_state;
    logic [tagBits-1: 0] old_meta_tag;
    logic [nWays-1: 0] way_en;
    logic [4:0] sdq_id;    
} BoomDCacheReqInternalST;




typedef struct packed {
    logic [1:0] id;
    logic [1:0] offset;
    logic [dataBits-1:0] data;
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
    logic needs_second_acq;
    logic hit_again;
    logic dirties;
    logic [TLPermissions_width-1: 0] biggest_grow_param;
    logic [TLPermissions_width-1: 0] dirtiest_state;
    logic [M_SZ-1: 0] dirtiest_cmd;
} onSecondaryAccessST;

endpackage