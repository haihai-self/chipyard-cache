package Edge;


  import HasL1CacheParameters::*;


  //need to compile
  function logic [BundleParam::dataBits/8-1:0] mask(
      logic [BundleParam::addressBits-1:0] toAddress, [BundleParam::sizeBits-1:0] lgsize);

    return 0;
  endfunction


  function logic hasDataC(BundleST::TLBundleCST x);

    return 0;
  endfunction

  //need to comp
  function logic hasDataD(BundleST::TLBundleDST x);
    logic opdata;
    opdata = x.opcode[0];

    return opdata;
  endfunction

  function BundleST::TLBundleAST AcquireBlock(logic [BundleParam::sourceBits-1:0] fromSource,
                                              logic [BundleParam::addressBits-1:0] toAddress,
                                              logic [BundleParam::sizeBits-1:0] lgSize,
                                              logic [BundleParam::param_size_a-1:0] growPermissions
                                                  );
    BundleST::TLBundleAST a;
    a.opcode = TLMessages::AcquireBlock;
    a.param = growPermissions;
    a.size = lgSize;
    a.source = fromSource;
    a.address = toAddress;
    a.mask = mask(toAddress, lgSize);
    a.data = 0;
    a.corrupt = 0;
    return a;
  endfunction

  function BundleST::TLBundleCST Release_data(logic [BundleParam::sourceBits-1:0] fromSource,
                                         logic [BundleParam::addressBits-1:0] toAddress,
                                         logic [BundleParam::sizeBits-1:0] lgSize,
                                         logic [BundleParam::cwidth-1:0] shrinkPermissions,
                                         logic [BundleParam::dataBits-1:0] data,
                                         logic corrupt = 0);
    BundleST::TLBundleCST c;
    c.opcode = TLMessages::ReleaseData;  //返回release相关信息
    c.param = shrinkPermissions;
    c.size = lgSize;
    c.source = fromSource;
    c.address = toAddress;
    c.data = data;
    c.corrupt = corrupt;
    return c;  //返回c通道需要的数据

  endfunction

  function BundleST::TLBundleCST ProbeAck(logic [BundleParam::sourceBits-1:0] fromSource,
                                          logic [BundleParam::addressBits-1:0] toAddress,
                                          logic [BundleParam::sizeBits-1:0] lgSize,
                                          logic [BundleParam::cwidth-1:0] reportPermissions
                                          );
    BundleST::TLBundleCST c;
    c.opcode = TLMessages::ProbeAck;
    c.param = reportPermissions;
    c.size = lgSize;
    c.source = fromSource;
    c.address = toAddress;
    c.data = 0;
    c.corrupt = 0;
    return c;
  endfunction

  function BundleST::TLBundleCST ProbeAckST(BundleST::TLBundleBST b,
                                            logic [BundleParam::cwidth-1:0] reportPermissions);
    return ProbeAck(
    .fromSource(b.source),
    .toAddress(b.address),
    .lgSize(b.size),
    .reportPermissions(reportPermissions)
    );
  endfunction

  function BundleST::TLBundleCST ProbeAck_data(logic [BundleParam::sourceBits-1:0] fromSource,
                                          logic [BundleParam::addressBits-1:0] toAddress,
                                          logic [BundleParam::sizeBits-1:0] lgSize,
                                          logic [BundleParam::cwidth-1:0] reportPermissions,
                                          logic [BundleParam::dataBits-1:0] data = 128'b0,
                                          logic corrupt = 0);
    BundleST::TLBundleCST c;
    c.opcode = TLMessages::ProbeAckData;  //返回prober相关
    c.param = reportPermissions;
    c.size = lgSize;
    c.source = fromSource;
    c.address = toAddress;
    c.data = data;
    c.corrupt = corrupt;
    return c;  //返回C通道需要的数据样式
  endfunction

  function BundleST::TLBundleCST ProbeAck_data_ST(BundleST::TLBundleBST b,
                                            logic [BundleParam::cwidth-1:0] reportPermissions);
    return ProbeAck_data(
    .fromSource(b.source),
    .toAddress(b.address),
    .lgSize(b.size),
    .reportPermissions(reportPermissions)
    );
  endfunction

  function logic isRequestD(BundleST::TLBundleDST d);
    return d.opcode[2] && !d.opcode[1];
  endfunction

  function BundleST::TLBundleEST GrantAck(logic [BundleParam::sinkBits-1:0] tosink);
    BundleST::TLBundleEST e;
    e.sink = tosink;
    return e;
  endfunction

  function BundleST::TLBundleEST GrantAckST(BundleST::TLBundleDST d);
    return GrantAck(d.sink);
  endfunction


  function BundleST::TLBundleAST GetA(logic [BundleParam::sourceBits-1:0] fromSource,
                                      logic [BundleParam::addressBits-1:0] toAddress,
                                      logic [BundleParam::sizeBits-1:0] lgSize);
    BundleST::TLBundleAST a;
    a.opcode = TLMessages::Get;
    a.param = 0;
    a.size = lgSize;
    a.source = fromSource;
    a.address = toAddress;
    a.mask = mask(toAddress, lgSize);
    a.data = 0;
    a.corrupt = 0;
    return a;
  endfunction
endpackage

