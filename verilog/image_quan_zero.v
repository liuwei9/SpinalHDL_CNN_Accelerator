// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_zero
// Git hash  : 27666a2ca9cd05f729dd3f96470cda679b8843ec
// Date      : 17/08/2021, 15:19:16


module image_quan_zero (
  input      [127:0]  data_in,
  input      [7:0]    zero_data_in,
  output reg [63:0]   data_out,
  input               clk,
  input               reset
);
  wire       [15:0]   xadd_1_A;
  wire       [15:0]   xadd_2_A;
  wire       [15:0]   xadd_3_A;
  wire       [15:0]   xadd_4_A;
  wire       [15:0]   xadd_5_A;
  wire       [15:0]   xadd_6_A;
  wire       [15:0]   xadd_7_A;
  wire       [15:0]   xadd_8_A;
  wire       [15:0]   xadd_1_S;
  wire       [15:0]   xadd_2_S;
  wire       [15:0]   xadd_3_S;
  wire       [15:0]   xadd_4_S;
  wire       [15:0]   xadd_5_S;
  wire       [15:0]   xadd_6_S;
  wire       [15:0]   xadd_7_S;
  wire       [15:0]   xadd_8_S;
  wire       [15:0]   add_out_temp_0;
  wire       [15:0]   add_out_temp_1;
  wire       [15:0]   add_out_temp_2;
  wire       [15:0]   add_out_temp_3;
  wire       [15:0]   add_out_temp_4;
  wire       [15:0]   add_out_temp_5;
  wire       [15:0]   add_out_temp_6;
  wire       [15:0]   add_out_temp_7;
  wire                when_image_quan_zero_l32;
  wire                when_image_quan_zero_l34;
  wire                when_image_quan_zero_l32_1;
  wire                when_image_quan_zero_l34_1;
  wire                when_image_quan_zero_l32_2;
  wire                when_image_quan_zero_l34_2;
  wire                when_image_quan_zero_l32_3;
  wire                when_image_quan_zero_l34_3;
  wire                when_image_quan_zero_l32_4;
  wire                when_image_quan_zero_l34_4;
  wire                when_image_quan_zero_l32_5;
  wire                when_image_quan_zero_l34_5;
  wire                when_image_quan_zero_l32_6;
  wire                when_image_quan_zero_l34_6;
  wire                when_image_quan_zero_l32_7;
  wire                when_image_quan_zero_l34_7;

  sub_16_u8 xadd_1 (
    .A      (xadd_1_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_1_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_2 (
    .A      (xadd_2_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_2_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_3 (
    .A      (xadd_3_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_3_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_4 (
    .A      (xadd_4_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_4_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_5 (
    .A      (xadd_5_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_5_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_6 (
    .A      (xadd_6_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_6_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_7 (
    .A      (xadd_7_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_7_S      ), //o
    .CLK    (clk           )  //i
  );
  sub_16_u8 xadd_8 (
    .A      (xadd_8_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_8_S      ), //o
    .CLK    (clk           )  //i
  );
  assign xadd_1_A = data_in[15 : 0];
  assign add_out_temp_0 = xadd_1_S;
  assign xadd_2_A = data_in[31 : 16];
  assign add_out_temp_1 = xadd_2_S;
  assign xadd_3_A = data_in[47 : 32];
  assign add_out_temp_2 = xadd_3_S;
  assign xadd_4_A = data_in[63 : 48];
  assign add_out_temp_3 = xadd_4_S;
  assign xadd_5_A = data_in[79 : 64];
  assign add_out_temp_4 = xadd_5_S;
  assign xadd_6_A = data_in[95 : 80];
  assign add_out_temp_5 = xadd_6_S;
  assign xadd_7_A = data_in[111 : 96];
  assign add_out_temp_6 = xadd_7_S;
  assign xadd_8_A = data_in[127 : 112];
  assign add_out_temp_7 = xadd_8_S;
  assign when_image_quan_zero_l32 = add_out_temp_0[15];
  assign when_image_quan_zero_l34 = (add_out_temp_0[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_1 = add_out_temp_1[15];
  assign when_image_quan_zero_l34_1 = (add_out_temp_1[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_2 = add_out_temp_2[15];
  assign when_image_quan_zero_l34_2 = (add_out_temp_2[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_3 = add_out_temp_3[15];
  assign when_image_quan_zero_l34_3 = (add_out_temp_3[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_4 = add_out_temp_4[15];
  assign when_image_quan_zero_l34_4 = (add_out_temp_4[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_5 = add_out_temp_5[15];
  assign when_image_quan_zero_l34_5 = (add_out_temp_5[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_6 = add_out_temp_6[15];
  assign when_image_quan_zero_l34_6 = (add_out_temp_6[14 : 8] != 7'h0);
  assign when_image_quan_zero_l32_7 = add_out_temp_7[15];
  assign when_image_quan_zero_l34_7 = (add_out_temp_7[14 : 8] != 7'h0);
  always @(posedge clk) begin
    if(reset) begin
      data_out <= 64'h0;
    end else begin
      if(when_image_quan_zero_l32) begin
        data_out[7 : 0] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34) begin
          data_out[7 : 0] <= 8'hff;
        end else begin
          data_out[7 : 0] <= add_out_temp_0[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_1) begin
        data_out[15 : 8] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_1) begin
          data_out[15 : 8] <= 8'hff;
        end else begin
          data_out[15 : 8] <= add_out_temp_1[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_2) begin
        data_out[23 : 16] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_2) begin
          data_out[23 : 16] <= 8'hff;
        end else begin
          data_out[23 : 16] <= add_out_temp_2[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_3) begin
        data_out[31 : 24] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_3) begin
          data_out[31 : 24] <= 8'hff;
        end else begin
          data_out[31 : 24] <= add_out_temp_3[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_4) begin
        data_out[39 : 32] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_4) begin
          data_out[39 : 32] <= 8'hff;
        end else begin
          data_out[39 : 32] <= add_out_temp_4[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_5) begin
        data_out[47 : 40] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_5) begin
          data_out[47 : 40] <= 8'hff;
        end else begin
          data_out[47 : 40] <= add_out_temp_5[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_6) begin
        data_out[55 : 48] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_6) begin
          data_out[55 : 48] <= 8'hff;
        end else begin
          data_out[55 : 48] <= add_out_temp_6[7 : 0];
        end
      end
      if(when_image_quan_zero_l32_7) begin
        data_out[63 : 56] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l34_7) begin
          data_out[63 : 56] <= 8'hff;
        end else begin
          data_out[63 : 56] <= add_out_temp_7[7 : 0];
        end
      end
    end
  end


endmodule
