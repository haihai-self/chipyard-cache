
module NullPrefetcher (
    input logic clock,
    input logic reset,

    input logic                                        io_mshr_avail,
    input logic                                        io_req_val,
    input logic [                `coreMaxAddrBits-1:0] req_addr,
    input logic [BundleParam::TLPermissions_width-1:0] req_coh,

    DecoupledIF.in io_prefetch  //BoomDCacheReqST

);
  assign io_prefetch.valid = 0;
  assign io_prefetch.bits = 0;
endmodule




module NLPrefetcher (
    input logic clock,
    input logic reset,

    input logic                                        io_mshr_avail,
    input logic                                        io_req_val,
    input logic [                `coreMaxAddrBits-1:0] io_req_addr,
    input logic [BundleParam::TLPermissions_width-1:0] io_req_coh,

    DecoupledIF.in io_prefetch  //BoomDCacheReqST

);


  //reg
  logic req_valid;
  logic [`coreMaxAddrBits-1:0] req_addr;
  logic [MemoryOpConstants::M_SZ-1:0] req_cmd;



  //wire
  logic [`coreMaxAddrBits-1:0] mshr_req_addr;
  logic cacheable;
  logic io_prefetch_fire;

  assign io_prefetch_fire = io_prefetch.valid && io_prefetch.ready;

  assign mshr_req_addr = io_req_addr + HasL1HellaCacheParameters::cacheBlockBytes;

  assign
      cacheable = supportsAcquireBSafe(mshr_req_addr, HasL1HellaCacheParameters::lgCacheBlockBytes);


  always_ff @(posedge clock or posedge clock) begin
    if (reset) begin
      req_valid <= 0;
      req_addr <= 0;
      req_cmd <= 0;
    end else if (io_req_val && cacheable) begin
      req_valid <= 1;
      req_addr <= mshr_req_addr;
      req_cmd <=
          hasWritePermission(io_req_coh) ? MemoryOpConstants::M_PFW : MemoryOpConstants::M_PFR;
    end else if (io_prefetch_fire) req_valid <= 0;
  end


  always_comb begin
    io_prefetch.valid = req_valid && io_mshr_avail;
    io_prefetch.bits.addr = req_addr;
    io_prefetch.bits.uop = NullMicroOp();
    io_prefetch.bits.uop.mem_cmd = req_cmd;
    io_prefetch.bits.data = 0;
  end

endmodule
