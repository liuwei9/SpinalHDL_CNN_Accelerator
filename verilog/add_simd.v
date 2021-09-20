// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd
// Git hash  : 166ad749a20f55503ea9181f2b02d7a1ff2d73c3
// Date      : 20/09/2021, 12:49:39


module add_simd (
  input      [19:0]   A,
  input      [19:0]   B,
  output     [19:0]   P,
  input               clk,
  input               reset
);
  wire       [19:0]   add_1024_P;

  add add_1024 (
    .A        (A           ), //i
    .B        (B           ), //i
    .P        (add_1024_P  ), //o
    .clk      (clk         ), //i
    .reset    (reset       )  //i
  );
  assign P = add_1024_P;

endmodule
