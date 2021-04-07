package BundleST;

  import BundleParam::*;

  typedef struct packed {
    logic [2:0] opcode;
    logic [param_size_a-1:0] param;
    logic [sizeBits-1:0] size;
    logic [sourceBits-1:0] source;
    logic [addressBits-1:0] address;
    logic [dataBits/8 -1:0] mask;
    logic [dataBits-1:0] data;
    logic corrupt;
  } TLBundleAST;

  typedef struct packed {
    logic [2:0] opcode;
    logic [bdwidth-1:0] param;
    logic [sizeBits-1:0] size;
    logic [sourceBits-1:0] source;
    logic [addressBits-1:0] address;
    logic [dataBits/8 -1:0] mask;
    logic [dataBits-1:0] data;
    logic corrupt;
  } TLBundleBST;

  typedef struct packed {
    logic [2:0] opcode;
    logic [cwidth-1:0] param;
    logic [sizeBits-1:0] size;
    logic [sourceBits-1:0] source;
    logic [addressBits-1:0] address;
    logic [dataBits-1:0] data;
    logic corrupt;
  } TLBundleCST;


  typedef struct packed {
    logic [2:0] opcode;
    logic [bdwidth-1:0] param;
    logic [sizeBits-1:0] size;
    logic [sourceBits-1:0] source;
    logic [sinkBits-1:0] sink;
    logic denied;
    logic [dataBits-1:0] data;
    logic corrupt;
  } TLBundleDST;

  typedef struct packed {logic [sinkBits-1:0] sink;} TLBundleEST;


endpackage
