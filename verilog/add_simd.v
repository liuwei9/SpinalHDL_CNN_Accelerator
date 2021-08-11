// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd
// Git hash  : 4a3cffa6a82f86452f11e887963137268ca9c148
// Date      : 11/08/2021, 22:11:06


module add_simd (
  input      [19:0]   A,
  input      [19:0]   B,
  output     [19:0]   P,
  input               clk,
  input               reset
);
  wire       [19:0]   add_64_P;

  add add_64 (
    .A        (A         ), //i
    .B        (B         ), //i
    .P        (add_64_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  assign P = add_64_P;

endmodule
