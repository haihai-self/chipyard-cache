package BundleParam;
  localparam addressBits = 32;
  localparam dataBits = 128;
  localparam sourceBits = 3;
  localparam sinkBits = 4;
  localparam sizeBits = 4;

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

  localparam param_size_a =
      TLAtomics_width > awidth ? TLAtomics_width : awidth > TLHints_width ? awidth : TLHints_width;


endpackage

package TLMessages;
  localparam PutFullData = 0;  //     .    .                   => AccessAck
  localparam PutPartialData = 1;  //     .    .                   => AccessAck
  localparam ArithmeticData = 2;  //     .    .                   => AccessAckData
  localparam LogicalData = 3;  //     .    .                   => AccessAckData
  localparam Get = 4;  //     .    .                   => AccessAckData
  localparam Hint = 5;  //     .    .                   => HintAck
  localparam AcquireBlock = 6;  //     .                        => Grant[Data]
  localparam AcquirePerm = 7;  //     .                        => Grant[Data]
  localparam Probe = 6;  //          .                   => ProbeAck[Data]
  localparam AccessAck = 0;  //               .    .
  localparam AccessAckData = 1;  //               .    .
  localparam HintAck = 2;  //               .    .
  localparam ProbeAck = 4;  //               .
  localparam ProbeAckData = 5;  //               .
  localparam Release = 6;  //               .              => ReleaseAck
  localparam ReleaseData = 7;  //               .              => ReleaseAck
  localparam Grant = 4;  //                    .         => GrantAck
  localparam GrantData = 5;  //                    .         => GrantAck
  localparam ReleaseAck = 6;  //                    .
  localparam GrantAck = 0;  //                         .


endpackage
