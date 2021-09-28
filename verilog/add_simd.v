// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_simd
// Git hash  : 46de7a2643940073d87fffa27badc891275ca23e


module add_simd (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  wire       [31:0]   add_8_P;

  add add_8 (
    .A        (A        ), //i
    .B        (B        ), //i
    .P        (add_8_P  ), //o
    .clk      (clk      ), //i
    .reset    (reset    )  //i
  );
  assign P = add_8_P;

endmodule
