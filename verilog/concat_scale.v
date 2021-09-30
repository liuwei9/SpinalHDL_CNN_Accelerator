// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : concat_scale
// Git hash  : 0e6a3ebbe013921c1c094a4a70c6b764aaf2f29f


module concat_scale (
  input      [255:0]  data_in,
  input      [31:0]   scale,
  output reg [255:0]  data_out,
  input               clk
);
  wire       [31:0]   xmul_A;
  wire       [31:0]   xmul_1_A;
  wire       [31:0]   xmul_2_A;
  wire       [31:0]   xmul_3_A;
  wire       [31:0]   xmul_4_A;
  wire       [31:0]   xmul_5_A;
  wire       [31:0]   xmul_6_A;
  wire       [31:0]   xmul_7_A;
  wire       [32:0]   xmul_P;
  wire       [32:0]   xmul_1_P;
  wire       [32:0]   xmul_2_P;
  wire       [32:0]   xmul_3_P;
  wire       [32:0]   xmul_4_P;
  wire       [32:0]   xmul_5_P;
  wire       [32:0]   xmul_6_P;
  wire       [32:0]   xmul_7_P;
  wire       [31:0]   _zz_data_out;
  wire       [31:0]   _zz_data_out_1;
  wire       [31:0]   _zz_data_out_2;
  wire       [31:0]   _zz_data_out_3;
  wire       [31:0]   _zz_data_out_4;
  wire       [31:0]   _zz_data_out_5;
  wire       [31:0]   _zz_data_out_6;
  wire       [31:0]   _zz_data_out_7;
  wire       [32:0]   data_temp_0;
  wire       [32:0]   data_temp_1;
  wire       [32:0]   data_temp_2;
  wire       [32:0]   data_temp_3;
  wire       [32:0]   data_temp_4;
  wire       [32:0]   data_temp_5;
  wire       [32:0]   data_temp_6;
  wire       [32:0]   data_temp_7;
  wire                when_concat_scale_l31;
  wire                when_concat_scale_l31_1;
  wire                when_concat_scale_l31_2;
  wire                when_concat_scale_l31_3;
  wire                when_concat_scale_l31_4;
  wire                when_concat_scale_l31_5;
  wire                when_concat_scale_l31_6;
  wire                when_concat_scale_l31_7;

  assign _zz_data_out = (data_temp_0[32 : 1] + 32'h00000001);
  assign _zz_data_out_1 = (data_temp_1[32 : 1] + 32'h00000001);
  assign _zz_data_out_2 = (data_temp_2[32 : 1] + 32'h00000001);
  assign _zz_data_out_3 = (data_temp_3[32 : 1] + 32'h00000001);
  assign _zz_data_out_4 = (data_temp_4[32 : 1] + 32'h00000001);
  assign _zz_data_out_5 = (data_temp_5[32 : 1] + 32'h00000001);
  assign _zz_data_out_6 = (data_temp_6[32 : 1] + 32'h00000001);
  assign _zz_data_out_7 = (data_temp_7[32 : 1] + 32'h00000001);
  xmul_32_32_33 xmul (
    .A      (xmul_A  ), //i
    .B      (scale   ), //i
    .P      (xmul_P  ), //o
    .CLK    (clk     )  //i
  );
  xmul_32_32_33 xmul_1 (
    .A      (xmul_1_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_1_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_2 (
    .A      (xmul_2_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_2_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_3 (
    .A      (xmul_3_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_3_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_4 (
    .A      (xmul_4_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_4_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_5 (
    .A      (xmul_5_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_5_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_6 (
    .A      (xmul_6_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_6_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_7 (
    .A      (xmul_7_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_7_P  ), //o
    .CLK    (clk       )  //i
  );
  assign xmul_A = data_in[31 : 0];
  assign data_temp_0 = xmul_P;
  assign xmul_1_A = data_in[63 : 32];
  assign data_temp_1 = xmul_1_P;
  assign xmul_2_A = data_in[95 : 64];
  assign data_temp_2 = xmul_2_P;
  assign xmul_3_A = data_in[127 : 96];
  assign data_temp_3 = xmul_3_P;
  assign xmul_4_A = data_in[159 : 128];
  assign data_temp_4 = xmul_4_P;
  assign xmul_5_A = data_in[191 : 160];
  assign data_temp_5 = xmul_5_P;
  assign xmul_6_A = data_in[223 : 192];
  assign data_temp_6 = xmul_6_P;
  assign xmul_7_A = data_in[255 : 224];
  assign data_temp_7 = xmul_7_P;
  assign when_concat_scale_l31 = data_temp_0[0];
  always @(*) begin
    if(when_concat_scale_l31) begin
      data_out[31 : 0] = _zz_data_out;
    end else begin
      data_out[31 : 0] = data_temp_0[32 : 1];
    end
    if(when_concat_scale_l31_1) begin
      data_out[63 : 32] = _zz_data_out_1;
    end else begin
      data_out[63 : 32] = data_temp_1[32 : 1];
    end
    if(when_concat_scale_l31_2) begin
      data_out[95 : 64] = _zz_data_out_2;
    end else begin
      data_out[95 : 64] = data_temp_2[32 : 1];
    end
    if(when_concat_scale_l31_3) begin
      data_out[127 : 96] = _zz_data_out_3;
    end else begin
      data_out[127 : 96] = data_temp_3[32 : 1];
    end
    if(when_concat_scale_l31_4) begin
      data_out[159 : 128] = _zz_data_out_4;
    end else begin
      data_out[159 : 128] = data_temp_4[32 : 1];
    end
    if(when_concat_scale_l31_5) begin
      data_out[191 : 160] = _zz_data_out_5;
    end else begin
      data_out[191 : 160] = data_temp_5[32 : 1];
    end
    if(when_concat_scale_l31_6) begin
      data_out[223 : 192] = _zz_data_out_6;
    end else begin
      data_out[223 : 192] = data_temp_6[32 : 1];
    end
    if(when_concat_scale_l31_7) begin
      data_out[255 : 224] = _zz_data_out_7;
    end else begin
      data_out[255 : 224] = data_temp_7[32 : 1];
    end
  end

  assign when_concat_scale_l31_1 = data_temp_1[0];
  assign when_concat_scale_l31_2 = data_temp_2[0];
  assign when_concat_scale_l31_3 = data_temp_3[0];
  assign when_concat_scale_l31_4 = data_temp_4[0];
  assign when_concat_scale_l31_5 = data_temp_5[0];
  assign when_concat_scale_l31_6 = data_temp_6[0];
  assign when_concat_scale_l31_7 = data_temp_7[0];

endmodule
