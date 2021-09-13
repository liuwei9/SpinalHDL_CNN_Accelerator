// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd_64
// Git hash  : 3de18e70bd50589bd21035e4fb7a1c12a3bd4cfa
// Date      : 13/09/2021, 21:49:39


module add_simd_64 (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  wire       [31:0]   add_72_P;

  add_64 add_72 (
    .A        (A         ), //i
    .B        (B         ), //i
    .P        (add_72_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  assign P = add_72_P;

endmodule
