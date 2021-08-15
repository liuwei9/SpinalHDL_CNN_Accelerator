// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_zero
// Git hash  : 2369c413fff5a0fcbd7a3ce8524fdef796a92c43



module image_quan_zero (
  input      [63:0]   data_in,
  input      [7:0]    zero_data_in,
  output reg [31:0]   data_out,
  input               clk,
  input               reset
);
  wire       [15:0]   xadd_A;
  wire       [15:0]   xadd_1_A;
  wire       [15:0]   xadd_2_A;
  wire       [15:0]   xadd_3_A;
  wire       [15:0]   xadd_S;
  wire       [15:0]   xadd_1_S;
  wire       [15:0]   xadd_2_S;
  wire       [15:0]   xadd_3_S;
  wire       [15:0]   add_out_temp_0;
  wire       [15:0]   add_out_temp_1;
  wire       [15:0]   add_out_temp_2;
  wire       [15:0]   add_out_temp_3;
  wire                when_image_quan_zero_l31;
  wire                when_image_quan_zero_l33;
  wire                when_image_quan_zero_l31_1;
  wire                when_image_quan_zero_l33_1;
  wire                when_image_quan_zero_l31_2;
  wire                when_image_quan_zero_l33_2;
  wire                when_image_quan_zero_l31_3;
  wire                when_image_quan_zero_l33_3;

  xadd_16_u8_16 xadd (
    .A      (xadd_A        ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_S        ), //o
    .CLK    (clk           )  //i
  );
  xadd_16_u8_16 xadd_1 (
    .A      (xadd_1_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_1_S      ), //o
    .CLK    (clk           )  //i
  );
  xadd_16_u8_16 xadd_2 (
    .A      (xadd_2_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_2_S      ), //o
    .CLK    (clk           )  //i
  );
  xadd_16_u8_16 xadd_3 (
    .A      (xadd_3_A      ), //i
    .B      (zero_data_in  ), //i
    .S      (xadd_3_S      ), //o
    .CLK    (clk           )  //i
  );
  assign xadd_A = data_in[15 : 0];
  assign add_out_temp_0 = xadd_S;
  assign xadd_1_A = data_in[31 : 16];
  assign add_out_temp_1 = xadd_1_S;
  assign xadd_2_A = data_in[47 : 32];
  assign add_out_temp_2 = xadd_2_S;
  assign xadd_3_A = data_in[63 : 48];
  assign add_out_temp_3 = xadd_3_S;
  assign when_image_quan_zero_l31 = add_out_temp_0[15];
  assign when_image_quan_zero_l33 = (add_out_temp_0[14 : 8] != 7'h0);
  assign when_image_quan_zero_l31_1 = add_out_temp_1[15];
  assign when_image_quan_zero_l33_1 = (add_out_temp_1[14 : 8] != 7'h0);
  assign when_image_quan_zero_l31_2 = add_out_temp_2[15];
  assign when_image_quan_zero_l33_2 = (add_out_temp_2[14 : 8] != 7'h0);
  assign when_image_quan_zero_l31_3 = add_out_temp_3[15];
  assign when_image_quan_zero_l33_3 = (add_out_temp_3[14 : 8] != 7'h0);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      data_out <= 32'h0;
    end else begin
      if(when_image_quan_zero_l31) begin
        data_out[7 : 0] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l33) begin
          data_out[7 : 0] <= 8'hff;
        end else begin
          data_out[7 : 0] <= add_out_temp_0[7 : 0];
        end
      end
      if(when_image_quan_zero_l31_1) begin
        data_out[15 : 8] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l33_1) begin
          data_out[15 : 8] <= 8'hff;
        end else begin
          data_out[15 : 8] <= add_out_temp_1[7 : 0];
        end
      end
      if(when_image_quan_zero_l31_2) begin
        data_out[23 : 16] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l33_2) begin
          data_out[23 : 16] <= 8'hff;
        end else begin
          data_out[23 : 16] <= add_out_temp_2[7 : 0];
        end
      end
      if(when_image_quan_zero_l31_3) begin
        data_out[31 : 24] <= 8'h0;
      end else begin
        if(when_image_quan_zero_l33_3) begin
          data_out[31 : 24] <= 8'hff;
        end else begin
          data_out[31 : 24] <= add_out_temp_3[7 : 0];
        end
      end
    end
  end


endmodule
