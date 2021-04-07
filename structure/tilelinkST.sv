package TileLinkST;
  typedef struct packed {
    logic needs_second_acq;
    logic hit_again;
    logic dirties;
    logic [BundleParam::TLPermissions_width-1:0] biggest_grow_param;
    logic [BundleParam::TLPermissions_width-1:0] dirtiest_state;
    logic [MemoryOpConstants::M_SZ-1:0] dirtiest_cmd;
  } onSecondaryAccessST;
  
endpackage