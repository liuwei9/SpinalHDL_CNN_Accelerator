// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_add_simd
// Git hash  : 166ad749a20f55503ea9181f2b02d7a1ff2d73c3
// Date      : 20/09/2021, 12:49:40


module mul_add_simd (
  input      [71:0]   dataIn,
  input      [71:0]   weightIn,
  output     [19:0]   dataOut,
  input               clk,
  input               reset
);
  wire       [7:0]    mul_simd_1152_data_in;
  wire       [7:0]    mul_simd_1152_weight_in;
  wire       [7:0]    mul_simd_1153_data_in;
  wire       [7:0]    mul_simd_1153_weight_in;
  wire       [7:0]    mul_simd_1154_data_in;
  wire       [7:0]    mul_simd_1154_weight_in;
  wire       [7:0]    mul_simd_1155_data_in;
  wire       [7:0]    mul_simd_1155_weight_in;
  wire       [7:0]    mul_simd_1156_data_in;
  wire       [7:0]    mul_simd_1156_weight_in;
  wire       [7:0]    mul_simd_1157_data_in;
  wire       [7:0]    mul_simd_1157_weight_in;
  wire       [7:0]    mul_simd_1158_data_in;
  wire       [7:0]    mul_simd_1158_weight_in;
  wire       [7:0]    mul_simd_1159_data_in;
  wire       [7:0]    mul_simd_1159_weight_in;
  wire       [7:0]    mul_simd_1160_data_in;
  wire       [7:0]    mul_simd_1160_weight_in;
  wire       [19:0]   mul_simd_1152_data_out;
  wire       [19:0]   mul_simd_1153_data_out;
  wire       [19:0]   mul_simd_1154_data_out;
  wire       [19:0]   mul_simd_1155_data_out;
  wire       [19:0]   mul_simd_1156_data_out;
  wire       [19:0]   mul_simd_1157_data_out;
  wire       [19:0]   mul_simd_1158_data_out;
  wire       [19:0]   mul_simd_1159_data_out;
  wire       [19:0]   mul_simd_1160_data_out;
  wire       [19:0]   add_simd_1024_P;
  wire       [19:0]   add_simd_1025_P;
  wire       [19:0]   add_simd_1026_P;
  wire       [19:0]   add_simd_1027_P;
  wire       [19:0]   add_simd_1028_P;
  wire       [19:0]   add_simd_1029_P;
  wire       [19:0]   add_simd_1030_P;
  wire       [19:0]   add_simd_1031_P;
  wire       [19:0]   mul_data_out_0;
  wire       [19:0]   mul_data_out_1;
  wire       [19:0]   mul_data_out_2;
  wire       [19:0]   mul_data_out_3;
  wire       [19:0]   mul_data_out_4;
  wire       [19:0]   mul_data_out_5;
  wire       [19:0]   mul_data_out_6;
  wire       [19:0]   mul_data_out_7;
  wire       [19:0]   mul_data_out_8;
  wire       [19:0]   mul_data_out_delay2_0;
  wire       [19:0]   mul_data_out_delay2_1;
  wire       [19:0]   mul_data_out_delay2_2;
  wire       [19:0]   mul_data_out_delay2_3;
  wire       [19:0]   mul_data_out_delay2_4;
  wire       [19:0]   mul_data_out_delay2_5;
  wire       [19:0]   mul_data_out_delay2_6;
  wire       [19:0]   mul_data_out_delay2_7;
  reg        [19:0]   mul_data_out_2_delay_1;
  reg        [19:0]   mul_data_out_2_delay_2;
  reg        [19:0]   mul_data_out_3_delay_1;
  reg        [19:0]   mul_data_out_3_delay_2;
  reg        [19:0]   mul_data_out_4_delay_1;
  reg        [19:0]   mul_data_out_4_delay_2;
  reg        [19:0]   mul_data_out_5_delay_1;
  reg        [19:0]   mul_data_out_5_delay_2;
  reg        [19:0]   mul_data_out_6_delay_1;
  reg        [19:0]   mul_data_out_6_delay_2;
  reg        [19:0]   mul_data_out_7_delay_1;
  reg        [19:0]   mul_data_out_7_delay_2;
  reg        [19:0]   mul_data_out_8_delay_1;
  reg        [19:0]   mul_data_out_8_delay_2;
  wire       [19:0]   mul_data_out_delay3_0;
  wire       [19:0]   mul_data_out_delay3_1;
  wire       [19:0]   mul_data_out_delay3_2;
  wire       [19:0]   mul_data_out_delay3_3;
  wire       [19:0]   mul_data_out_delay4_0;
  wire       [19:0]   mul_data_out_delay4_1;

  mul_simd mul_simd_1152 (
    .data_in      (mul_simd_1152_data_in    ), //i
    .weight_in    (mul_simd_1152_weight_in  ), //i
    .data_out     (mul_simd_1152_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1153 (
    .data_in      (mul_simd_1153_data_in    ), //i
    .weight_in    (mul_simd_1153_weight_in  ), //i
    .data_out     (mul_simd_1153_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1154 (
    .data_in      (mul_simd_1154_data_in    ), //i
    .weight_in    (mul_simd_1154_weight_in  ), //i
    .data_out     (mul_simd_1154_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1155 (
    .data_in      (mul_simd_1155_data_in    ), //i
    .weight_in    (mul_simd_1155_weight_in  ), //i
    .data_out     (mul_simd_1155_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1156 (
    .data_in      (mul_simd_1156_data_in    ), //i
    .weight_in    (mul_simd_1156_weight_in  ), //i
    .data_out     (mul_simd_1156_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1157 (
    .data_in      (mul_simd_1157_data_in    ), //i
    .weight_in    (mul_simd_1157_weight_in  ), //i
    .data_out     (mul_simd_1157_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1158 (
    .data_in      (mul_simd_1158_data_in    ), //i
    .weight_in    (mul_simd_1158_weight_in  ), //i
    .data_out     (mul_simd_1158_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1159 (
    .data_in      (mul_simd_1159_data_in    ), //i
    .weight_in    (mul_simd_1159_weight_in  ), //i
    .data_out     (mul_simd_1159_data_out   ), //o
    .clk          (clk                      )  //i
  );
  mul_simd mul_simd_1160 (
    .data_in      (mul_simd_1160_data_in    ), //i
    .weight_in    (mul_simd_1160_weight_in  ), //i
    .data_out     (mul_simd_1160_data_out   ), //o
    .clk          (clk                      )  //i
  );
  add_simd add_simd_1024 (
    .A        (mul_data_out_0   ), //i
    .B        (mul_data_out_1   ), //i
    .P        (add_simd_1024_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd add_simd_1025 (
    .A        (mul_data_out_delay2_0  ), //i
    .B        (mul_data_out_delay2_1  ), //i
    .P        (add_simd_1025_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_1026 (
    .A        (mul_data_out_delay2_2  ), //i
    .B        (mul_data_out_delay2_3  ), //i
    .P        (add_simd_1026_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_1027 (
    .A        (mul_data_out_delay2_4  ), //i
    .B        (mul_data_out_delay2_5  ), //i
    .P        (add_simd_1027_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_1028 (
    .A        (mul_data_out_delay2_6  ), //i
    .B        (mul_data_out_delay2_7  ), //i
    .P        (add_simd_1028_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_1029 (
    .A        (mul_data_out_delay3_0  ), //i
    .B        (mul_data_out_delay3_1  ), //i
    .P        (add_simd_1029_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_1030 (
    .A        (mul_data_out_delay3_2  ), //i
    .B        (mul_data_out_delay3_3  ), //i
    .P        (add_simd_1030_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_1031 (
    .A        (mul_data_out_delay4_0  ), //i
    .B        (mul_data_out_delay4_1  ), //i
    .P        (add_simd_1031_P        ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  assign mul_simd_1152_data_in = dataIn[7 : 0];
  assign mul_simd_1152_weight_in = weightIn[7 : 0];
  assign mul_data_out_0 = mul_simd_1152_data_out;
  assign mul_simd_1153_data_in = dataIn[15 : 8];
  assign mul_simd_1153_weight_in = weightIn[15 : 8];
  assign mul_data_out_1 = mul_simd_1153_data_out;
  assign mul_simd_1154_data_in = dataIn[23 : 16];
  assign mul_simd_1154_weight_in = weightIn[23 : 16];
  assign mul_data_out_2 = mul_simd_1154_data_out;
  assign mul_simd_1155_data_in = dataIn[31 : 24];
  assign mul_simd_1155_weight_in = weightIn[31 : 24];
  assign mul_data_out_3 = mul_simd_1155_data_out;
  assign mul_simd_1156_data_in = dataIn[39 : 32];
  assign mul_simd_1156_weight_in = weightIn[39 : 32];
  assign mul_data_out_4 = mul_simd_1156_data_out;
  assign mul_simd_1157_data_in = dataIn[47 : 40];
  assign mul_simd_1157_weight_in = weightIn[47 : 40];
  assign mul_data_out_5 = mul_simd_1157_data_out;
  assign mul_simd_1158_data_in = dataIn[55 : 48];
  assign mul_simd_1158_weight_in = weightIn[55 : 48];
  assign mul_data_out_6 = mul_simd_1158_data_out;
  assign mul_simd_1159_data_in = dataIn[63 : 56];
  assign mul_simd_1159_weight_in = weightIn[63 : 56];
  assign mul_data_out_7 = mul_simd_1159_data_out;
  assign mul_simd_1160_data_in = dataIn[71 : 64];
  assign mul_simd_1160_weight_in = weightIn[71 : 64];
  assign mul_data_out_8 = mul_simd_1160_data_out;
  assign mul_data_out_delay2_1 = mul_data_out_2_delay_2;
  assign mul_data_out_delay2_2 = mul_data_out_3_delay_2;
  assign mul_data_out_delay2_3 = mul_data_out_4_delay_2;
  assign mul_data_out_delay2_4 = mul_data_out_5_delay_2;
  assign mul_data_out_delay2_5 = mul_data_out_6_delay_2;
  assign mul_data_out_delay2_6 = mul_data_out_7_delay_2;
  assign mul_data_out_delay2_7 = mul_data_out_8_delay_2;
  assign mul_data_out_delay2_0 = add_simd_1024_P;
  assign mul_data_out_delay3_0 = add_simd_1025_P;
  assign mul_data_out_delay3_1 = add_simd_1026_P;
  assign mul_data_out_delay3_2 = add_simd_1027_P;
  assign mul_data_out_delay3_3 = add_simd_1028_P;
  assign mul_data_out_delay4_0 = add_simd_1029_P;
  assign mul_data_out_delay4_1 = add_simd_1030_P;
  assign dataOut = add_simd_1031_P;
  always @(posedge clk) begin
    mul_data_out_2_delay_1 <= mul_data_out_2;
    mul_data_out_2_delay_2 <= mul_data_out_2_delay_1;
    mul_data_out_3_delay_1 <= mul_data_out_3;
    mul_data_out_3_delay_2 <= mul_data_out_3_delay_1;
    mul_data_out_4_delay_1 <= mul_data_out_4;
    mul_data_out_4_delay_2 <= mul_data_out_4_delay_1;
    mul_data_out_5_delay_1 <= mul_data_out_5;
    mul_data_out_5_delay_2 <= mul_data_out_5_delay_1;
    mul_data_out_6_delay_1 <= mul_data_out_6;
    mul_data_out_6_delay_2 <= mul_data_out_6_delay_1;
    mul_data_out_7_delay_1 <= mul_data_out_7;
    mul_data_out_7_delay_2 <= mul_data_out_7_delay_1;
    mul_data_out_8_delay_1 <= mul_data_out_8;
    mul_data_out_8_delay_2 <= mul_data_out_8_delay_1;
  end


endmodule
