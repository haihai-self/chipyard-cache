module BoomIOMSHR #(parameter id = 0)(
  input clock,
  input reset,

  DecoupledIF.out io_req, //BoomDCacheReqST
  DecoupledIF.in io_resp, //BoomDCacheRespST
  DecoupledIF.in io_mem_access, //TLBundleA
  ValidSTIF.out io_mem_ack //TLBundleD
);
  
endmodule