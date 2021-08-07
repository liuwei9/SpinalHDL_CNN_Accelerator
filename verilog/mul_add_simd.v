// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_add_simd
// Git hash  : 627187c3e57e5afa461430fb3119888a5e0edda4
// Date      : 06/08/2021, 19:31:59


module mul_add_simd (
  input      [71:0]   dataIn,
  input      [71:0]   weightIn,
  output     [19:0]   dataOut,
  input               clk,
  input               reset
);
  wire       [7:0]    mul_simd_72_data_in;
  wire       [7:0]    mul_simd_72_weight_in;
  wire       [7:0]    mul_simd_73_data_in;
  wire       [7:0]    mul_simd_73_weight_in;
  wire       [7:0]    mul_simd_74_data_in;
  wire       [7:0]    mul_simd_74_weight_in;
  wire       [7:0]    mul_simd_75_data_in;
  wire       [7:0]    mul_simd_75_weight_in;
  wire       [7:0]    mul_simd_76_data_in;
  wire       [7:0]    mul_simd_76_weight_in;
  wire       [7:0]    mul_simd_77_data_in;
  wire       [7:0]    mul_simd_77_weight_in;
  wire       [7:0]    mul_simd_78_data_in;
  wire       [7:0]    mul_simd_78_weight_in;
  wire       [7:0]    mul_simd_79_data_in;
  wire       [7:0]    mul_simd_79_weight_in;
  wire       [7:0]    mul_simd_80_data_in;
  wire       [7:0]    mul_simd_80_weight_in;
  wire       [19:0]   mul_simd_72_data_out;
  wire       [19:0]   mul_simd_73_data_out;
  wire       [19:0]   mul_simd_74_data_out;
  wire       [19:0]   mul_simd_75_data_out;
  wire       [19:0]   mul_simd_76_data_out;
  wire       [19:0]   mul_simd_77_data_out;
  wire       [19:0]   mul_simd_78_data_out;
  wire       [19:0]   mul_simd_79_data_out;
  wire       [19:0]   mul_simd_80_data_out;
  wire       [19:0]   add_simd_64_P;
  wire       [19:0]   add_simd_65_P;
  wire       [19:0]   add_simd_66_P;
  wire       [19:0]   add_simd_67_P;
  wire       [19:0]   add_simd_68_P;
  wire       [19:0]   add_simd_69_P;
  wire       [19:0]   add_simd_70_P;
  wire       [19:0]   add_simd_71_P;
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

  mul_simd mul_simd_72 (
    .data_in      (mul_simd_72_data_in    ), //i
    .weight_in    (mul_simd_72_weight_in  ), //i
    .data_out     (mul_simd_72_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_73 (
    .data_in      (mul_simd_73_data_in    ), //i
    .weight_in    (mul_simd_73_weight_in  ), //i
    .data_out     (mul_simd_73_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_74 (
    .data_in      (mul_simd_74_data_in    ), //i
    .weight_in    (mul_simd_74_weight_in  ), //i
    .data_out     (mul_simd_74_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_75 (
    .data_in      (mul_simd_75_data_in    ), //i
    .weight_in    (mul_simd_75_weight_in  ), //i
    .data_out     (mul_simd_75_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_76 (
    .data_in      (mul_simd_76_data_in    ), //i
    .weight_in    (mul_simd_76_weight_in  ), //i
    .data_out     (mul_simd_76_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_77 (
    .data_in      (mul_simd_77_data_in    ), //i
    .weight_in    (mul_simd_77_weight_in  ), //i
    .data_out     (mul_simd_77_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_78 (
    .data_in      (mul_simd_78_data_in    ), //i
    .weight_in    (mul_simd_78_weight_in  ), //i
    .data_out     (mul_simd_78_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_79 (
    .data_in      (mul_simd_79_data_in    ), //i
    .weight_in    (mul_simd_79_weight_in  ), //i
    .data_out     (mul_simd_79_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  mul_simd mul_simd_80 (
    .data_in      (mul_simd_80_data_in    ), //i
    .weight_in    (mul_simd_80_weight_in  ), //i
    .data_out     (mul_simd_80_data_out   ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  add_simd add_simd_64 (
    .A        (mul_data_out_0  ), //i
    .B        (mul_data_out_1  ), //i
    .P        (add_simd_64_P   ), //o
    .clk      (clk             ), //i
    .reset    (reset           )  //i
  );
  add_simd add_simd_65 (
    .A        (mul_data_out_delay2_0  ), //i
    .B        (mul_data_out_delay2_1  ), //i
    .P        (add_simd_65_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_66 (
    .A        (mul_data_out_delay2_2  ), //i
    .B        (mul_data_out_delay2_3  ), //i
    .P        (add_simd_66_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_67 (
    .A        (mul_data_out_delay2_4  ), //i
    .B        (mul_data_out_delay2_5  ), //i
    .P        (add_simd_67_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_68 (
    .A        (mul_data_out_delay2_6  ), //i
    .B        (mul_data_out_delay2_7  ), //i
    .P        (add_simd_68_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_69 (
    .A        (mul_data_out_delay3_0  ), //i
    .B        (mul_data_out_delay3_1  ), //i
    .P        (add_simd_69_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_70 (
    .A        (mul_data_out_delay3_2  ), //i
    .B        (mul_data_out_delay3_3  ), //i
    .P        (add_simd_70_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_71 (
    .A        (mul_data_out_delay4_0  ), //i
    .B        (mul_data_out_delay4_1  ), //i
    .P        (add_simd_71_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  assign mul_simd_72_data_in = dataIn[7 : 0];
  assign mul_simd_72_weight_in = weightIn[7 : 0];
  assign mul_data_out_0 = mul_simd_72_data_out;
  assign mul_simd_73_data_in = dataIn[15 : 8];
  assign mul_simd_73_weight_in = weightIn[15 : 8];
  assign mul_data_out_1 = mul_simd_73_data_out;
  assign mul_simd_74_data_in = dataIn[23 : 16];
  assign mul_simd_74_weight_in = weightIn[23 : 16];
  assign mul_data_out_2 = mul_simd_74_data_out;
  assign mul_simd_75_data_in = dataIn[31 : 24];
  assign mul_simd_75_weight_in = weightIn[31 : 24];
  assign mul_data_out_3 = mul_simd_75_data_out;
  assign mul_simd_76_data_in = dataIn[39 : 32];
  assign mul_simd_76_weight_in = weightIn[39 : 32];
  assign mul_data_out_4 = mul_simd_76_data_out;
  assign mul_simd_77_data_in = dataIn[47 : 40];
  assign mul_simd_77_weight_in = weightIn[47 : 40];
  assign mul_data_out_5 = mul_simd_77_data_out;
  assign mul_simd_78_data_in = dataIn[55 : 48];
  assign mul_simd_78_weight_in = weightIn[55 : 48];
  assign mul_data_out_6 = mul_simd_78_data_out;
  assign mul_simd_79_data_in = dataIn[63 : 56];
  assign mul_simd_79_weight_in = weightIn[63 : 56];
  assign mul_data_out_7 = mul_simd_79_data_out;
  assign mul_simd_80_data_in = dataIn[71 : 64];
  assign mul_simd_80_weight_in = weightIn[71 : 64];
  assign mul_data_out_8 = mul_simd_80_data_out;
  assign mul_data_out_delay2_1 = mul_data_out_2_delay_2;
  assign mul_data_out_delay2_2 = mul_data_out_3_delay_2;
  assign mul_data_out_delay2_3 = mul_data_out_4_delay_2;
  assign mul_data_out_delay2_4 = mul_data_out_5_delay_2;
  assign mul_data_out_delay2_5 = mul_data_out_6_delay_2;
  assign mul_data_out_delay2_6 = mul_data_out_7_delay_2;
  assign mul_data_out_delay2_7 = mul_data_out_8_delay_2;
  assign mul_data_out_delay2_0 = add_simd_64_P;
  assign mul_data_out_delay3_0 = add_simd_65_P;
  assign mul_data_out_delay3_1 = add_simd_66_P;
  assign mul_data_out_delay3_2 = add_simd_67_P;
  assign mul_data_out_delay3_3 = add_simd_68_P;
  assign mul_data_out_delay4_0 = add_simd_69_P;
  assign mul_data_out_delay4_1 = add_simd_70_P;
  assign dataOut = add_simd_71_P;
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
