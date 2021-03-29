
interface DecoupledIF #(
    type T
);
  logic valid, ready;
  T bits;
  modport in(  //decouple
      input ready,
      output valid, bits
  );

  modport out(  //decouple fliped
      input valid, bits,
      output ready
  );
endinterface
