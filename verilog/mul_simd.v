// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_simd
// Git hash  : 038b51e1758bac70ab39881905296db1cc09842a
// Date      : 22/09/2021, 16:16:34


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
