
interface DecoupledIF #(
    type T
);
  logic valid, ready;
  T bits;
  modport out(  //decouple
      input ready,
      output valid, bits
  );

  modport in(  //decouple fliped
      input valid, bits,
      output ready
  );
endinterface
