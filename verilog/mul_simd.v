// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_simd
// Git hash  : 273c3163e7ad111796d5ae7321f4b13ac23942b4
// Date      : 12/08/2021, 11:18:31


module mul_simd (
  input      [7:0]    data_in,
  input      [7:0]    weight_in,
  output     [19:0]   data_out,
  input               clk,
  input               reset
);
  wire       [15:0]   mul_72_P;
  wire       [15:0]   _zz_data_out_q;
  reg        [19:0]   data_out_q;

  assign _zz_data_out_q = mul_72_P;
  mul mul_72 (
    .A        (data_in    ), //i
    .B        (weight_in  ), //i
    .P        (mul_72_P   ), //o
    .clk      (clk        ), //i
    .reset    (reset      )  //i
  );
  assign data_out = data_out_q;
  always @(posedge clk) begin
    data_out_q <= {{4{_zz_data_out_q[15]}}, _zz_data_out_q};
  end


endmodule
