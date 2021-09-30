// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd
// Git hash  : 0e6a3ebbe013921c1c094a4a70c6b764aaf2f29f


module add_simd (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  wire       [31:0]   add_16_P;

  add add_16 (
    .A        (A         ), //i
    .B        (B         ), //i
    .P        (add_16_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  assign P = add_16_P;

endmodule
