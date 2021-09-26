// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_add_simd
// Git hash  : b694a57c8f5c199d7fd0af5809d5f7d2954eb351


module mul_add_simd (
  input      [7:0]    dataIn,
  input      [7:0]    weightIn,
  output     [19:0]   dataOut,
  input               clk,
  input               reset
);
  wire       [7:0]    mul_simd_256_data_in;
  wire       [7:0]    mul_simd_256_weight_in;
  wire       [19:0]   mul_simd_256_data_out;
  wire       [19:0]   mul_data_out_0;
  reg        [19:0]   mul_data_out_0_delay_1;
  reg        [19:0]   mul_data_out_0_delay_2;
  reg        [19:0]   mul_data_out_0_delay_3;
  reg        [19:0]   mul_data_out_0_delay_4;
  reg        [19:0]   mul_data_out_0_delay_5;
  reg        [19:0]   mul_data_out_0_delay_6;
  reg        [19:0]   mul_data_out_0_delay_7;
  reg        [19:0]   mul_data_out_0_delay_8;

  mul_simd mul_simd_256 (
    .data_in      (mul_simd_256_data_in    ), //i
    .weight_in    (mul_simd_256_weight_in  ), //i
    .data_out     (mul_simd_256_data_out   ), //o
    .clk          (clk                     )  //i
  );
  assign mul_simd_256_data_in = dataIn[7 : 0];
  assign mul_simd_256_weight_in = weightIn[7 : 0];
  assign mul_data_out_0 = mul_simd_256_data_out;
  assign dataOut = mul_data_out_0_delay_8;
  always @(posedge clk) begin
    mul_data_out_0_delay_1 <= mul_data_out_0;
    mul_data_out_0_delay_2 <= mul_data_out_0_delay_1;
    mul_data_out_0_delay_3 <= mul_data_out_0_delay_2;
    mul_data_out_0_delay_4 <= mul_data_out_0_delay_3;
    mul_data_out_0_delay_5 <= mul_data_out_0_delay_4;
    mul_data_out_0_delay_6 <= mul_data_out_0_delay_5;
    mul_data_out_0_delay_7 <= mul_data_out_0_delay_6;
    mul_data_out_0_delay_8 <= mul_data_out_0_delay_7;
  end


endmodule
