interface TLBundleAIF;
logic ready, valid;
logic [2:0] param;
logic [2:0] source;
logic [31:0] address;

modport inputready (
input ready,
output param, source, address
);
    
endinterface


interface TLBundleBIF;
    logic ready, valid;
    logic [1:0] param;
    logic [3:0] size;
    logic [2:0] source;
    logic [31:0] address;

    modport ProbeUnitReq (
    input valid, param, size, source, address,
    output ready
    );
endinterface //TLBundleBIF



interface TLBundleCIF;
    logic ready, valid;
    logic [2:0] opcode, param, source;
    logic [31:0] address;
    logic [127:0] data;
    logic [3:0] size;
    
    modport WriteBackRelease (
    input ready,
    output valid, opcode, param, address, data
    );

    modport WriteBackLsuRelease (
    input ready,
    output param, address, data
    );

    modport ProbeUnitRep (
    input ready,
    output valid, opcode, param, size, source, address
    );

    modport ProbeUnitLsuRelease (
    input ready,
    output valid, param, size, source, address
    );
endinterface //TLBundleCIF


interface TLBundleDIF;
logic ready, valid;
logic [2:0] opcode;
logic [1:0] param;
logic [3:0] size;
logic [3:0] sink;
logic [127:0] data;

modport inputready (
input ready,
output valid, opcode, param, size, sink, data
);
    
endinterface





interface TLBundleEIF;
logic ready, valid;
logic [3:0] sink;

modport inputready (
input ready,
output valid, sink
);
    
endinterface