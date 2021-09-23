// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd_1024
// Git hash  : 6a036d116ed8ed37e64ac312cea61447972676ed


module add_simd_1024 (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  wire       [31:0]   add_1032_P;

  add_1024 add_1032 (
    .A        (A           ), //i
    .B        (B           ), //i
    .P        (add_1032_P  ), //o
    .clk      (clk         ), //i
    .reset    (reset       )  //i
  );
  assign P = add_1032_P;

endmodule
