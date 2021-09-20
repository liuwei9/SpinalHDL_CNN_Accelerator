// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : channel_in_sixteen_times_acc
// Git hash  : 166ad749a20f55503ea9181f2b02d7a1ff2d73c3
// Date      : 20/09/2021, 12:49:39


module channel_in_sixteen_times_acc (
  input      [319:0]  data_in,
  output     [31:0]   data_out,
  input               clk
);
  wire       [31:0]   xadd_S;
  wire       [31:0]   xadd_1_S;
  wire       [31:0]   xadd_2_S;
  wire       [31:0]   xadd_3_S;
  wire       [31:0]   xadd_4_S;
  wire       [31:0]   xadd_5_S;
  wire       [31:0]   xadd_6_S;
  wire       [31:0]   xadd_7_S;
  wire       [31:0]   xadd_8_S;
  wire       [31:0]   xadd_9_S;
  wire       [31:0]   xadd_10_S;
  wire       [31:0]   xadd_11_S;
  wire       [31:0]   xadd_12_S;
  wire       [31:0]   xadd_13_S;
  wire       [31:0]   xadd_14_S;
  wire       [31:0]   _zz_temp_0;
  wire       [19:0]   _zz_temp_0_1;
  wire       [31:0]   _zz_temp_1;
  wire       [19:0]   _zz_temp_1_1;
  wire       [31:0]   _zz_temp_2;
  wire       [19:0]   _zz_temp_2_1;
  wire       [31:0]   _zz_temp_3;
  wire       [19:0]   _zz_temp_3_1;
  wire       [31:0]   _zz_temp_4;
  wire       [19:0]   _zz_temp_4_1;
  wire       [31:0]   _zz_temp_5;
  wire       [19:0]   _zz_temp_5_1;
  wire       [31:0]   _zz_temp_6;
  wire       [19:0]   _zz_temp_6_1;
  wire       [31:0]   _zz_temp_7;
  wire       [19:0]   _zz_temp_7_1;
  wire       [31:0]   _zz_temp_8;
  wire       [19:0]   _zz_temp_8_1;
  wire       [31:0]   _zz_temp_9;
  wire       [19:0]   _zz_temp_9_1;
  wire       [31:0]   _zz_temp_10;
  wire       [19:0]   _zz_temp_10_1;
  wire       [31:0]   _zz_temp_11;
  wire       [19:0]   _zz_temp_11_1;
  wire       [31:0]   _zz_temp_12;
  wire       [19:0]   _zz_temp_12_1;
  wire       [31:0]   _zz_temp_13;
  wire       [19:0]   _zz_temp_13_1;
  wire       [31:0]   _zz_temp_14;
  wire       [19:0]   _zz_temp_14_1;
  wire       [31:0]   _zz_temp_15;
  wire       [19:0]   _zz_temp_15_1;
  wire       [19:0]   temp_t_0;
  wire       [19:0]   temp_t_1;
  wire       [19:0]   temp_t_2;
  wire       [19:0]   temp_t_3;
  wire       [19:0]   temp_t_4;
  wire       [19:0]   temp_t_5;
  wire       [19:0]   temp_t_6;
  wire       [19:0]   temp_t_7;
  wire       [19:0]   temp_t_8;
  wire       [19:0]   temp_t_9;
  wire       [19:0]   temp_t_10;
  wire       [19:0]   temp_t_11;
  wire       [19:0]   temp_t_12;
  wire       [19:0]   temp_t_13;
  wire       [19:0]   temp_t_14;
  wire       [19:0]   temp_t_15;
  wire       [31:0]   temp_0;
  wire       [31:0]   temp_1;
  wire       [31:0]   temp_2;
  wire       [31:0]   temp_3;
  wire       [31:0]   temp_4;
  wire       [31:0]   temp_5;
  wire       [31:0]   temp_6;
  wire       [31:0]   temp_7;
  wire       [31:0]   temp_8;
  wire       [31:0]   temp_9;
  wire       [31:0]   temp_10;
  wire       [31:0]   temp_11;
  wire       [31:0]   temp_12;
  wire       [31:0]   temp_13;
  wire       [31:0]   temp_14;
  wire       [31:0]   temp_15;

  assign _zz_temp_0_1 = temp_t_0;
  assign _zz_temp_0 = {{12{_zz_temp_0_1[19]}}, _zz_temp_0_1};
  assign _zz_temp_1_1 = temp_t_1;
  assign _zz_temp_1 = {{12{_zz_temp_1_1[19]}}, _zz_temp_1_1};
  assign _zz_temp_2_1 = temp_t_2;
  assign _zz_temp_2 = {{12{_zz_temp_2_1[19]}}, _zz_temp_2_1};
  assign _zz_temp_3_1 = temp_t_3;
  assign _zz_temp_3 = {{12{_zz_temp_3_1[19]}}, _zz_temp_3_1};
  assign _zz_temp_4_1 = temp_t_4;
  assign _zz_temp_4 = {{12{_zz_temp_4_1[19]}}, _zz_temp_4_1};
  assign _zz_temp_5_1 = temp_t_5;
  assign _zz_temp_5 = {{12{_zz_temp_5_1[19]}}, _zz_temp_5_1};
  assign _zz_temp_6_1 = temp_t_6;
  assign _zz_temp_6 = {{12{_zz_temp_6_1[19]}}, _zz_temp_6_1};
  assign _zz_temp_7_1 = temp_t_7;
  assign _zz_temp_7 = {{12{_zz_temp_7_1[19]}}, _zz_temp_7_1};
  assign _zz_temp_8_1 = temp_t_8;
  assign _zz_temp_8 = {{12{_zz_temp_8_1[19]}}, _zz_temp_8_1};
  assign _zz_temp_9_1 = temp_t_9;
  assign _zz_temp_9 = {{12{_zz_temp_9_1[19]}}, _zz_temp_9_1};
  assign _zz_temp_10_1 = temp_t_10;
  assign _zz_temp_10 = {{12{_zz_temp_10_1[19]}}, _zz_temp_10_1};
  assign _zz_temp_11_1 = temp_t_11;
  assign _zz_temp_11 = {{12{_zz_temp_11_1[19]}}, _zz_temp_11_1};
  assign _zz_temp_12_1 = temp_t_12;
  assign _zz_temp_12 = {{12{_zz_temp_12_1[19]}}, _zz_temp_12_1};
  assign _zz_temp_13_1 = temp_t_13;
  assign _zz_temp_13 = {{12{_zz_temp_13_1[19]}}, _zz_temp_13_1};
  assign _zz_temp_14_1 = temp_t_14;
  assign _zz_temp_14 = {{12{_zz_temp_14_1[19]}}, _zz_temp_14_1};
  assign _zz_temp_15_1 = temp_t_15;
  assign _zz_temp_15 = {{12{_zz_temp_15_1[19]}}, _zz_temp_15_1};
  add_32_32 xadd (
    .A      (temp_0  ), //i
    .B      (temp_1  ), //i
    .S      (xadd_S  ), //o
    .CLK    (clk     )  //i
  );
  add_32_32 xadd_1 (
    .A      (temp_2    ), //i
    .B      (temp_3    ), //i
    .S      (xadd_1_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_2 (
    .A      (temp_4    ), //i
    .B      (temp_5    ), //i
    .S      (xadd_2_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_3 (
    .A      (temp_6    ), //i
    .B      (temp_7    ), //i
    .S      (xadd_3_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_4 (
    .A      (temp_8    ), //i
    .B      (temp_9    ), //i
    .S      (xadd_4_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_5 (
    .A      (temp_10   ), //i
    .B      (temp_11   ), //i
    .S      (xadd_5_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_6 (
    .A      (temp_12   ), //i
    .B      (temp_13   ), //i
    .S      (xadd_6_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_7 (
    .A      (temp_14   ), //i
    .B      (temp_15   ), //i
    .S      (xadd_7_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_8 (
    .A      (xadd_S    ), //i
    .B      (xadd_1_S  ), //i
    .S      (xadd_8_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_9 (
    .A      (xadd_2_S  ), //i
    .B      (xadd_3_S  ), //i
    .S      (xadd_9_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_10 (
    .A      (xadd_4_S   ), //i
    .B      (xadd_5_S   ), //i
    .S      (xadd_10_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_11 (
    .A      (xadd_6_S   ), //i
    .B      (xadd_7_S   ), //i
    .S      (xadd_11_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_12 (
    .A      (xadd_8_S   ), //i
    .B      (xadd_9_S   ), //i
    .S      (xadd_12_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_13 (
    .A      (xadd_10_S  ), //i
    .B      (xadd_11_S  ), //i
    .S      (xadd_13_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_14 (
    .A      (xadd_12_S  ), //i
    .B      (xadd_13_S  ), //i
    .S      (xadd_14_S  ), //o
    .CLK    (clk        )  //i
  );
  assign temp_t_0 = data_in[19 : 0];
  assign temp_t_1 = data_in[39 : 20];
  assign temp_t_2 = data_in[59 : 40];
  assign temp_t_3 = data_in[79 : 60];
  assign temp_t_4 = data_in[99 : 80];
  assign temp_t_5 = data_in[119 : 100];
  assign temp_t_6 = data_in[139 : 120];
  assign temp_t_7 = data_in[159 : 140];
  assign temp_t_8 = data_in[179 : 160];
  assign temp_t_9 = data_in[199 : 180];
  assign temp_t_10 = data_in[219 : 200];
  assign temp_t_11 = data_in[239 : 220];
  assign temp_t_12 = data_in[259 : 240];
  assign temp_t_13 = data_in[279 : 260];
  assign temp_t_14 = data_in[299 : 280];
  assign temp_t_15 = data_in[319 : 300];
  assign temp_0 = _zz_temp_0;
  assign temp_1 = _zz_temp_1;
  assign temp_2 = _zz_temp_2;
  assign temp_3 = _zz_temp_3;
  assign temp_4 = _zz_temp_4;
  assign temp_5 = _zz_temp_5;
  assign temp_6 = _zz_temp_6;
  assign temp_7 = _zz_temp_7;
  assign temp_8 = _zz_temp_8;
  assign temp_9 = _zz_temp_9;
  assign temp_10 = _zz_temp_10;
  assign temp_11 = _zz_temp_11;
  assign temp_12 = _zz_temp_12;
  assign temp_13 = _zz_temp_13;
  assign temp_14 = _zz_temp_14;
  assign temp_15 = _zz_temp_15;
  assign data_out = xadd_14_S;

endmodule
