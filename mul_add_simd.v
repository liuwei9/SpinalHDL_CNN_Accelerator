// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_add_simd
// Git hash  : 568b368e2ab1f99c683b6cc582c6fa980adb3c3c



module mul_add_simd (
  input      [71:0]   dataIn,
  input      [71:0]   weightIn,
  output     [19:0]   dataOut,
  input               clk,
  input               reset
);
  wire       [7:0]    mul_simd_9_data_in;
  wire       [7:0]    mul_simd_9_weight_in;
  wire       [7:0]    mul_simd_10_data_in;
  wire       [7:0]    mul_simd_10_weight_in;
  wire       [7:0]    mul_simd_11_data_in;
  wire       [7:0]    mul_simd_11_weight_in;
  wire       [7:0]    mul_simd_12_data_in;
  wire       [7:0]    mul_simd_12_weight_in;
  wire       [7:0]    mul_simd_13_data_in;
  wire       [7:0]    mul_simd_13_weight_in;
  wire       [7:0]    mul_simd_14_data_in;
  wire       [7:0]    mul_simd_14_weight_in;
  wire       [7:0]    mul_simd_15_data_in;
  wire       [7:0]    mul_simd_15_weight_in;
  wire       [7:0]    mul_simd_16_data_in;
  wire       [7:0]    mul_simd_16_weight_in;
  wire       [7:0]    mul_simd_17_data_in;
  wire       [7:0]    mul_simd_17_weight_in;
  wire       [19:0]   mul_simd_9_data_out;
  wire       [19:0]   mul_simd_10_data_out;
  wire       [19:0]   mul_simd_11_data_out;
  wire       [19:0]   mul_simd_12_data_out;
  wire       [19:0]   mul_simd_13_data_out;
  wire       [19:0]   mul_simd_14_data_out;
  wire       [19:0]   mul_simd_15_data_out;
  wire       [19:0]   mul_simd_16_data_out;
  wire       [19:0]   mul_simd_17_data_out;
  wire       [19:0]   add_simd_8_P;
  wire       [19:0]   add_simd_9_P;
  wire       [19:0]   add_simd_10_P;
  wire       [19:0]   add_simd_11_P;
  wire       [19:0]   add_simd_12_P;
  wire       [19:0]   add_simd_13_P;
  wire       [19:0]   add_simd_14_P;
  wire       [19:0]   add_simd_15_P;
  wire       [19:0]   mul_data_out_0;
  wire       [19:0]   mul_data_out_1;
  wire       [19:0]   mul_data_out_2;
  wire       [19:0]   mul_data_out_3;
  wire       [19:0]   mul_data_out_4;
  wire       [19:0]   mul_data_out_5;
  wire       [19:0]   mul_data_out_6;
  wire       [19:0]   mul_data_out_7;
  wire       [19:0]   mul_data_out_8;
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

  mul_simd mul_simd_9 (
    .data_in      (mul_simd_9_data_in    ), //i
    .weight_in    (mul_simd_9_weight_in  ), //i
    .data_out     (mul_simd_9_data_out   ), //o
    .clk          (clk                   )  //i
  );
  mul_simd mul_simd_10 (
    .data_in      (mul_simd_10_data_in    ), //i
    .weight_in    (mul_simd_10_weight_in  ), //i
    .data_out     (mul_simd_10_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_11 (
    .data_in      (mul_simd_11_data_in    ), //i
    .weight_in    (mul_simd_11_weight_in  ), //i
    .data_out     (mul_simd_11_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_12 (
    .data_in      (mul_simd_12_data_in    ), //i
    .weight_in    (mul_simd_12_weight_in  ), //i
    .data_out     (mul_simd_12_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_13 (
    .data_in      (mul_simd_13_data_in    ), //i
    .weight_in    (mul_simd_13_weight_in  ), //i
    .data_out     (mul_simd_13_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_14 (
    .data_in      (mul_simd_14_data_in    ), //i
    .weight_in    (mul_simd_14_weight_in  ), //i
    .data_out     (mul_simd_14_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_15 (
    .data_in      (mul_simd_15_data_in    ), //i
    .weight_in    (mul_simd_15_weight_in  ), //i
    .data_out     (mul_simd_15_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_16 (
    .data_in      (mul_simd_16_data_in    ), //i
    .weight_in    (mul_simd_16_weight_in  ), //i
    .data_out     (mul_simd_16_data_out   ), //o
    .clk          (clk                    )  //i
  );
  mul_simd mul_simd_17 (
    .data_in      (mul_simd_17_data_in    ), //i
    .weight_in    (mul_simd_17_weight_in  ), //i
    .data_out     (mul_simd_17_data_out   ), //o
    .clk          (clk                    )  //i
  );
  add_simd add_simd_8 (
    .A        (mul_data_out_0  ), //i
    .B        (mul_data_out_1  ), //i
    .P        (add_simd_8_P    ), //o
    .clk      (clk             ), //i
    .reset    (reset           )  //i
  );
  add_simd add_simd_9 (
    .A        (add_simd_8_P            ), //i
    .B        (mul_data_out_2_delay_2  ), //i
    .P        (add_simd_9_P            ), //o
    .clk      (clk                     ), //i
    .reset    (reset                   )  //i
  );
  add_simd add_simd_10 (
    .A        (mul_data_out_3_delay_2  ), //i
    .B        (mul_data_out_4_delay_2  ), //i
    .P        (add_simd_10_P           ), //o
    .clk      (clk                     ), //i
    .reset    (reset                   )  //i
  );
  add_simd add_simd_11 (
    .A        (mul_data_out_5_delay_2  ), //i
    .B        (mul_data_out_6_delay_2  ), //i
    .P        (add_simd_11_P           ), //o
    .clk      (clk                     ), //i
    .reset    (reset                   )  //i
  );
  add_simd add_simd_12 (
    .A        (mul_data_out_7_delay_2  ), //i
    .B        (mul_data_out_8_delay_2  ), //i
    .P        (add_simd_12_P           ), //o
    .clk      (clk                     ), //i
    .reset    (reset                   )  //i
  );
  add_simd add_simd_13 (
    .A        (add_simd_9_P   ), //i
    .B        (add_simd_10_P  ), //i
    .P        (add_simd_13_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_14 (
    .A        (add_simd_11_P  ), //i
    .B        (add_simd_12_P  ), //i
    .P        (add_simd_14_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_15 (
    .A        (add_simd_13_P  ), //i
    .B        (add_simd_14_P  ), //i
    .P        (add_simd_15_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  assign mul_simd_9_data_in = dataIn[7 : 0];
  assign mul_simd_9_weight_in = weightIn[7 : 0];
  assign mul_data_out_0 = mul_simd_9_data_out;
  assign mul_simd_10_data_in = dataIn[15 : 8];
  assign mul_simd_10_weight_in = weightIn[15 : 8];
  assign mul_data_out_1 = mul_simd_10_data_out;
  assign mul_simd_11_data_in = dataIn[23 : 16];
  assign mul_simd_11_weight_in = weightIn[23 : 16];
  assign mul_data_out_2 = mul_simd_11_data_out;
  assign mul_simd_12_data_in = dataIn[31 : 24];
  assign mul_simd_12_weight_in = weightIn[31 : 24];
  assign mul_data_out_3 = mul_simd_12_data_out;
  assign mul_simd_13_data_in = dataIn[39 : 32];
  assign mul_simd_13_weight_in = weightIn[39 : 32];
  assign mul_data_out_4 = mul_simd_13_data_out;
  assign mul_simd_14_data_in = dataIn[47 : 40];
  assign mul_simd_14_weight_in = weightIn[47 : 40];
  assign mul_data_out_5 = mul_simd_14_data_out;
  assign mul_simd_15_data_in = dataIn[55 : 48];
  assign mul_simd_15_weight_in = weightIn[55 : 48];
  assign mul_data_out_6 = mul_simd_15_data_out;
  assign mul_simd_16_data_in = dataIn[63 : 56];
  assign mul_simd_16_weight_in = weightIn[63 : 56];
  assign mul_data_out_7 = mul_simd_16_data_out;
  assign mul_simd_17_data_in = dataIn[71 : 64];
  assign mul_simd_17_weight_in = weightIn[71 : 64];
  assign mul_data_out_8 = mul_simd_17_data_out;
  assign dataOut = add_simd_15_P;
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

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

module add_simd (
  input      [19:0]   A,
  input      [19:0]   B,
  output     [19:0]   P,
  input               clk,
  input               reset
);
  wire       [19:0]   add_8_P;

  add add_8 (
    .A        (A        ), //i
    .B        (B        ), //i
    .P        (add_8_P  ), //o
    .clk      (clk      ), //i
    .reset    (reset    )  //i
  );
  assign P = add_8_P;

endmodule

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

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

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

module add (
  input      [19:0]   A,
  input      [19:0]   B,
  output     [19:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [19:0]   A_q;
  (* use_dsp = "yes" *) wire       [19:0]   B_q;
  (* use_dsp = "yes" *) reg        [19:0]   A_qq;
  (* use_dsp = "yes" *) reg        [19:0]   B_qq;
  (* use_dsp = "yes" *) reg        [19:0]   P_q;

  assign A_q = A;
  assign B_q = B;
  assign P = P_q;
  always @(posedge clk) begin
    A_qq <= A_q;
    B_qq <= B_q;
    P_q <= ($signed(A_qq) + $signed(B_qq));
  end


endmodule
