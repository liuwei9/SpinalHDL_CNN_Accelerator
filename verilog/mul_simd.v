// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_simd
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:42


module mul_simd (
  input      [7:0]    data_in,
  input      [7:0]    weight_in,
  output     [19:0]   data_out,
  input               clk
);
  wire       [15:0]   mult_8_8_16_1_P;
  wire       [15:0]   _zz_data_out_q;
  reg        [19:0]   data_out_q;

  assign _zz_data_out_q = mult_8_8_16_1_P;
  mult_8_8_16 mult_8_8_16_1 (
    .A      (data_in          ), //i
    .B      (weight_in        ), //i
    .P      (mult_8_8_16_1_P  ), //o
    .CLK    (clk              )  //i
  );
  assign data_out = data_out_q;
  always @(posedge clk) begin
    data_out_q <= {{4{_zz_data_out_q[15]}}, _zz_data_out_q};
  end


endmodule
