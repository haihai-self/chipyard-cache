package TLBundleParam;
    localparam addressBits = 32;   
    localparam dataBits    = 128;
    localparam sourceBits  = 3;
    localparam sinkBits    = 4;
    localparam sizeBits    = 4;

    localparam TLPermissions_width = 2;
    localparam TLAtomics_width = 3;
    localparam TLHints_width = 1;

    localparam awidth = 2;
    localparam bdwidth = 2;
    localparam cwidth = 3;


    localparam Nothing = 2'h0;
    localparam Branch = 2'h1;
    localparam Trunk = 2'h2;
    localparam Dirty = 2'h3;

    localparam toT = 2'h0;
    localparam toB = 2'h1;
    localparam toN = 2'h2;

    localparam NtoB = 2'h0;
    localparam NtoT = 2'h1;
    localparam BtoT = 2'h2;

    localparam TtoB = 3'h0;
    localparam TtoN = 3'h1;
    localparam BtoN = 3'h2;
    localparam TtoT = 3'h3;
    localparam BtoB = 3'h4;
    localparam NtoN = 3'h5;
    
endpackage