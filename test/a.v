// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : a
// Git hash  : 27666a2ca9cd05f729dd3f96470cda679b8843ec
// Date      : 17/08/2021, 15:09:53



module a (
  input      [7:0]    A_1,
  input      [7:0]    B,
  output     [7:0]    S1,
  output     [7:0]    S2,
  input               clk
);
  wire       [7:0]    a1_S;
  wire       [7:0]    a2_S;

  xadd a1 (
    .A      (A_1   ), //i
    .B      (B     ), //i
    .S      (a1_S  ), //o
    .CLK    (clk   )  //i
  );
  //It's correct
  xsub a2 (
    .A      (A_1   ), //i
    .B      (B     ), //i
    .S      (a2_S  ), //o
    .CLK    (clk   )  //i
  );
  assign S1 = a1_S;
  assign S2 = a2_S;

endmodule
