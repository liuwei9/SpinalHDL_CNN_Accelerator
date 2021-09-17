// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd
// Git hash  : a7a69259854496944a80b53cb839562d830e2b39
// Date      : 17/09/2021, 17:43:43


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
