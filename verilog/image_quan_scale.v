// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_scale
// Git hash  : 27666a2ca9cd05f729dd3f96470cda679b8843ec
// Date      : 17/08/2021, 15:19:16


module image_quan_scale (
  input      [255:0]  S_DATA,
  input      [255:0]  scale_data_in,
  output reg [255:0]  M_DATA,
  input               clk
);
  wire       [31:0]   xmul_A;
  wire       [31:0]   xmul_B;
  wire       [31:0]   xmul_1_A;
  wire       [31:0]   xmul_1_B;
  wire       [31:0]   xmul_2_A;
  wire       [31:0]   xmul_2_B;
  wire       [31:0]   xmul_3_A;
  wire       [31:0]   xmul_3_B;
  wire       [31:0]   xmul_4_A;
  wire       [31:0]   xmul_4_B;
  wire       [31:0]   xmul_5_A;
  wire       [31:0]   xmul_5_B;
  wire       [31:0]   xmul_6_A;
  wire       [31:0]   xmul_6_B;
  wire       [31:0]   xmul_7_A;
  wire       [31:0]   xmul_7_B;
  wire       [31:0]   xmul_P;
  wire       [31:0]   xmul_1_P;
  wire       [31:0]   xmul_2_P;
  wire       [31:0]   xmul_3_P;
  wire       [31:0]   xmul_4_P;
  wire       [31:0]   xmul_5_P;
  wire       [31:0]   xmul_6_P;
  wire       [31:0]   xmul_7_P;

  xmul_32_32 xmul (
    .A      (xmul_A  ), //i
    .B      (xmul_B  ), //i
    .P      (xmul_P  ), //o
    .CLK    (clk     )  //i
  );
  xmul_32_32 xmul_1 (
    .A      (xmul_1_A  ), //i
    .B      (xmul_1_B  ), //i
    .P      (xmul_1_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32 xmul_2 (
    .A      (xmul_2_A  ), //i
    .B      (xmul_2_B  ), //i
    .P      (xmul_2_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32 xmul_3 (
    .A      (xmul_3_A  ), //i
    .B      (xmul_3_B  ), //i
    .P      (xmul_3_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32 xmul_4 (
    .A      (xmul_4_A  ), //i
    .B      (xmul_4_B  ), //i
    .P      (xmul_4_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32 xmul_5 (
    .A      (xmul_5_A  ), //i
    .B      (xmul_5_B  ), //i
    .P      (xmul_5_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32 xmul_6 (
    .A      (xmul_6_A  ), //i
    .B      (xmul_6_B  ), //i
    .P      (xmul_6_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32 xmul_7 (
    .A      (xmul_7_A  ), //i
    .B      (xmul_7_B  ), //i
    .P      (xmul_7_P  ), //o
    .CLK    (clk       )  //i
  );
  assign xmul_A = S_DATA[31 : 0];
  assign xmul_B = scale_data_in[31 : 0];
  always @(*) begin
    M_DATA[31 : 0] = xmul_P;
    M_DATA[63 : 32] = xmul_1_P;
    M_DATA[95 : 64] = xmul_2_P;
    M_DATA[127 : 96] = xmul_3_P;
    M_DATA[159 : 128] = xmul_4_P;
    M_DATA[191 : 160] = xmul_5_P;
    M_DATA[223 : 192] = xmul_6_P;
    M_DATA[255 : 224] = xmul_7_P;
  end

  assign xmul_1_A = S_DATA[63 : 32];
  assign xmul_1_B = scale_data_in[63 : 32];
  assign xmul_2_A = S_DATA[95 : 64];
  assign xmul_2_B = scale_data_in[95 : 64];
  assign xmul_3_A = S_DATA[127 : 96];
  assign xmul_3_B = scale_data_in[127 : 96];
  assign xmul_4_A = S_DATA[159 : 128];
  assign xmul_4_B = scale_data_in[159 : 128];
  assign xmul_5_A = S_DATA[191 : 160];
  assign xmul_5_B = scale_data_in[191 : 160];
  assign xmul_6_A = S_DATA[223 : 192];
  assign xmul_6_B = scale_data_in[223 : 192];
  assign xmul_7_A = S_DATA[255 : 224];
  assign xmul_7_B = scale_data_in[255 : 224];

endmodule
