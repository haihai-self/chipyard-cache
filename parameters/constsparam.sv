

package MemoryOpConstants;
  localparam NUM_XA_OPS = 9;
  localparam M_SZ      = 5;
//   parameter M_X       = BitPat("b?????");
  localparam M_XRD     = 'b00000; // int load
  localparam M_XWR     = 'b00001; // int store
  localparam M_PFR     = 'b00010; // prefetch with intent to read
  localparam M_PFW     = 'b00011; // prefetch with intent to write
  localparam M_XA_SWAP = 'b00100;
  localparam M_FLUSH_ALL = 'b00101;  // flush all lines
  localparam M_XLR     = 'b00110;
  localparam M_XSC     = 'b00111;
  localparam M_XA_ADD  = 'b01000;
  localparam M_XA_XOR  = 'b01001;
  localparam M_XA_OR   = 'b01010;
  localparam M_XA_AND  = 'b01011;
  localparam M_XA_MIN  = 'b01100;
  localparam M_XA_MAX  = 'b01101;
  localparam M_XA_MINU = 'b01110;
  localparam M_XA_MAXU = 'b01111;
  localparam M_FLUSH   = 'b10000;// write back dirty data and cede R/W permissions
  localparam M_PWR     = 'b10001;// partial (masked) store
  localparam M_PRODUCE = 'b10010;// write back dirty data and cede W permissions
  localparam M_CLEAN   = 'b10011;// write back dirty data and retain R/W permissions
  localparam M_SFENCE  = 'b10100;// flush TLB
  localparam M_WOK     = 'b10111;// check write permissions but don't perform a write

//   def isAMOLogical(cmd: UInt) = cmd.isOneOf(M_XA_SWAP, M_XA_XOR, M_XA_OR, M_XA_AND)
//   def isAMOArithmetic(cmd: UInt) = cmd.isOneOf(M_XA_ADD, M_XA_MIN, M_XA_MAX, M_XA_MINU, M_XA_MAXU)
//   def isAMO(cmd: UInt) = isAMOLogical(cmd) || isAMOArithmetic(cmd)
//   def isPrefetch(cmd: UInt) = cmd === M_PFR || cmd === M_PFW
//   def isRead(cmd: UInt) = cmd === M_XRD || cmd === M_XLR || cmd === M_XSC || isAMO(cmd)
//   def isWrite(cmd: UInt) = cmd === M_XWR || cmd === M_PWR || cmd === M_XSC || isAMO(cmd)
//   def isWriteIntent(cmd: UInt) = isWrite(cmd) || cmd === M_PFW || cmd === M_XLR

function logic isAMOLogical(logic [4:0] cmd);
    return cmd inside {M_XA_SWAP, M_XA_XOR, M_XA_OR, M_XA_AND};
endfunction

function logic isAMOArithmetic(logic [4:0] cmd);
    return cmd inside {M_XA_ADD, M_XA_MIN, M_XA_MAX, M_XA_MINU, M_XA_MAXU};
endfunction

function logic isPrefetch(logic [4:0] cmd);
    return cmd == M_PFR || cmd == M_PFW; 
endfunction

function logic isAMO(logic [4:0] cmd);
    return isAMOLogical(cmd) || isAMOArithmetic(cmd);
endfunction
function logic isWrite(logic [4:0] cmd);
    return cmd == M_XWR || cmd == M_PWR || cmd == M_XSC || isAMO(cmd);    
endfunction

endpackage