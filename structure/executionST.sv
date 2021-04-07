package ExuST;
  typedef struct packed {
    logic [`maxBrCount-1:0] resolve_mask;
    logic [`maxBrCount-1:0] mispredict_mask;
  } BrUpdateMasksST;

  typedef struct packed {BrUpdateMasksST b1;} BrUpdateInfoST;

endpackage
