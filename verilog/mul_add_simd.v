// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_add_simd
// Git hash  : c12011d1e8655c6f5dcb4228add939efcb9499aa
// Date      : 20/08/2021, 22:45:46


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
  wire       [19:0]   add_simd_72_P;
  wire       [19:0]   add_simd_73_P;
  wire       [19:0]   add_simd_74_P;
  wire       [19:0]   add_simd_75_P;
  wire       [19:0]   add_simd_76_P;
  wire       [19:0]   add_simd_77_P;
  wire       [19:0]   add_simd_78_P;
  wire       [19:0]   add_simd_79_P;
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
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_73 (
    .data_in      (mul_simd_73_data_in    ), //i
    .weight_in    (mul_simd_73_weight_in  ), //i
    .data_out     (mul_simd_73_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_74 (
    .data_in      (mul_simd_74_data_in    ), //i
    .weight_in    (mul_simd_74_weight_in  ), //i
    .data_out     (mul_simd_74_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_75 (
    .data_in      (mul_simd_75_data_in    ), //i
    .weight_in    (mul_simd_75_weight_in  ), //i
    .data_out     (mul_simd_75_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_76 (
    .data_in      (mul_simd_76_data_in    ), //i
    .weight_in    (mul_simd_76_weight_in  ), //i
    .data_out     (mul_simd_76_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_77 (
    .data_in      (mul_simd_77_data_in    ), //i
    .weight_in    (mul_simd_77_weight_in  ), //i
    .data_out     (mul_simd_77_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_78 (
    .data_in      (mul_simd_78_data_in    ), //i
    .weight_in    (mul_simd_78_weight_in  ), //i
    .data_out     (mul_simd_78_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_79 (
    .data_in      (mul_simd_79_data_in    ), //i
    .weight_in    (mul_simd_79_weight_in  ), //i
    .data_out     (mul_simd_79_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_80 (
    .data_in      (mul_simd_80_data_in    ), //i
    .weight_in    (mul_simd_80_weight_in  ), //i
    .data_out     (mul_simd_80_data_out   ), //o
    .clk          (clk                    )  //i
  );
  add_simd add_simd_72 (
    .A        (mul_data_out_0  ), //i
    .B        (mul_data_out_1  ), //i
    .P        (add_simd_72_P   ), //o
    .clk      (clk             ), //i
    .reset    (reset           )  //i
  );
  add_simd add_simd_73 (
    .A        (mul_data_out_delay2_0  ), //i
    .B        (mul_data_out_delay2_1  ), //i
    .P        (add_simd_73_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_74 (
    .A        (mul_data_out_delay2_2  ), //i
    .B        (mul_data_out_delay2_3  ), //i
    .P        (add_simd_74_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_75 (
    .A        (mul_data_out_delay2_4  ), //i
    .B        (mul_data_out_delay2_5  ), //i
    .P        (add_simd_75_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_76 (
    .A        (mul_data_out_delay2_6  ), //i
    .B        (mul_data_out_delay2_7  ), //i
    .P        (add_simd_76_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_77 (
    .A        (mul_data_out_delay3_0  ), //i
    .B        (mul_data_out_delay3_1  ), //i
    .P        (add_simd_77_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_78 (
    .A        (mul_data_out_delay3_2  ), //i
    .B        (mul_data_out_delay3_3  ), //i
    .P        (add_simd_78_P          ), //o
    .clk      (clk                    ), //i
    .reset    (reset                  )  //i
  );
  add_simd add_simd_79 (
    .A        (mul_data_out_delay4_0  ), //i
    .B        (mul_data_out_delay4_1  ), //i
    .P        (add_simd_79_P          ), //o
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
  assign mul_data_out_delay2_0 = add_simd_72_P;
  assign mul_data_out_delay3_0 = add_simd_73_P;
  assign mul_data_out_delay3_1 = add_simd_74_P;
  assign mul_data_out_delay3_2 = add_simd_75_P;
  assign mul_data_out_delay3_3 = add_simd_76_P;
  assign mul_data_out_delay4_0 = add_simd_77_P;
  assign mul_data_out_delay4_1 = add_simd_78_P;
  assign dataOut = add_simd_79_P;
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
