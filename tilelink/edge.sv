package Edge;
    

import BundleParam::*;
import HasL1CacheParameters::*;
function BundleST::TLBundleCST Release(logic [sourceBits-1: 0] fromSource, logic [addressBits-1: 0] toAddress, logic [sizeBits-1:0] lgSize, 
                             logic [cwidth-1: 0] shrinkPermissions, logic [dataBits-1:0] data, logic corrupt=0);
    BundleST::TLBundleCST c;
    c.opcode = TLMessages::Release;
    c.param = shrinkPermissions;
    c.size = lgSize;
    c.source = fromSource;
    c.address = toAddress;
    c.data = data;
    c.corrupt = corrupt;
    return c;

endfunction



function BundleST::TLBundleCST ProbeAck(logic [sourceBits-1: 0] fromSource, logic [addressBits-1: 0]toAddress,
                                        logic[sizeBits-1: 0] lgSize, logic[cwidth-1: 0]reportPermissions, logic[dataBits-1: 0]data=128'b0, logic corrupt=0);
    BundleST::TLBundleCST c;
    c.opcode = TLMessages::ProbeAckData;
    c.param = reportPermissions;
    c.size = lgSize;
    c.source = fromSource;
    c.address = toAddress;
    c.data = data;
    c.corrupt = corrupt;                                     
    return c;
endfunction

function BundleST::TLBundleCST ProbeAckST(BundleST::TLBundleBST b, logic[cwidth-1: 0]reportPermissions);
    return ProbeAck(.fromSource(b.source),
                    .toAddress(b.address),
                    .lgSize(b.size),
                    .reportPermissions(reportPermissions));
endfunction

function logic hasDataC(BundleST::TLBundleCST x); //need to comp
    
    return 0;
endfunction

endpackage