

interface ValidIF #(bits_size=6);
    logic valid;
    logic [bits_size-1:0] bits;

    modport outputdata (
    output valid, bits
    );
    modport inputdata (
    output valid, bits
    );
endinterface //ValidIF