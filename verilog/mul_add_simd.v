// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_add_simd
// Git hash  : 46de7a2643940073d87fffa27badc891275ca23e


module mul_add_simd (
  input      [7:0]    dataIn,
  input      [7:0]    weightIn,
  output     [19:0]   dataOut,
  input               clk
);
  wire       [7:0]    mul_simd_256_data_in;
  wire       [7:0]    mul_simd_256_weight_in;
  wire       [19:0]   mul_simd_256_data_out;
  wire       [19:0]   mul_data_out_0;

  mul_simd mul_simd_256 (
    .data_in      (mul_simd_256_data_in    ), //i
    .weight_in    (mul_simd_256_weight_in  ), //i
    .data_out     (mul_simd_256_data_out   ), //o
    .clk          (clk                     )  //i
  );
  assign mul_simd_256_data_in = dataIn[7 : 0];
  assign mul_simd_256_weight_in = weightIn[7 : 0];
  assign mul_data_out_0 = mul_simd_256_data_out;
  assign dataOut = mul_data_out_0;

endmodule
