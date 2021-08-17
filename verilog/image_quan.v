// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan
// Git hash  : 27666a2ca9cd05f729dd3f96470cda679b8843ec
// Date      : 17/08/2021, 15:19:17


module image_quan (
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [255:0]  S_DATA_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input               reset,
  input               clk
);
  wire       [31:0]   image_quan_shift_8_shift_data_in;
  wire       [31:0]   image_quan_shift_8_data_in;
  wire       [31:0]   image_quan_shift_9_shift_data_in;
  wire       [31:0]   image_quan_shift_9_data_in;
  wire       [31:0]   image_quan_shift_10_shift_data_in;
  wire       [31:0]   image_quan_shift_10_data_in;
  wire       [31:0]   image_quan_shift_11_shift_data_in;
  wire       [31:0]   image_quan_shift_11_data_in;
  wire       [31:0]   image_quan_shift_12_shift_data_in;
  wire       [31:0]   image_quan_shift_12_data_in;
  wire       [31:0]   image_quan_shift_13_shift_data_in;
  wire       [31:0]   image_quan_shift_13_data_in;
  wire       [31:0]   image_quan_shift_14_shift_data_in;
  wire       [31:0]   image_quan_shift_14_data_in;
  wire       [31:0]   image_quan_shift_15_shift_data_in;
  wire       [31:0]   image_quan_shift_15_data_in;
  wire                ctrl_rd_en_fifo;
  wire       [3:0]    ctrl_para_select;
  wire                ctrl_M_Valid;
  wire                image_bias_S_DATA_ready;
  wire                image_bias_fifo_valid;
  wire       [255:0]  image_bias_M_Data;
  wire       [255:0]  image_scale_M_DATA;
  wire       [15:0]   image_quan_shift_8_shift_data_out;
  wire       [15:0]   image_quan_shift_9_shift_data_out;
  wire       [15:0]   image_quan_shift_10_shift_data_out;
  wire       [15:0]   image_quan_shift_11_shift_data_out;
  wire       [15:0]   image_quan_shift_12_shift_data_out;
  wire       [15:0]   image_quan_shift_13_shift_data_out;
  wire       [15:0]   image_quan_shift_14_shift_data_out;
  wire       [15:0]   image_quan_shift_15_shift_data_out;
  wire       [63:0]   image_zero_data_out;
  wire       [63:0]   image_leaky_data_out;
  wire       [255:0]  bias_data_0;
  wire       [255:0]  bias_data_1;
  wire       [255:0]  bias_data_2;
  wire       [255:0]  bias_data_3;
  wire       [255:0]  scale_data_0;
  wire       [255:0]  scale_data_1;
  wire       [255:0]  scale_data_2;
  wire       [255:0]  scale_data_3;
  wire       [255:0]  shift_data_0;
  wire       [255:0]  shift_data_1;
  wire       [255:0]  shift_data_2;
  wire       [255:0]  shift_data_3;
  wire       [7:0]    zero_point;
  reg        [255:0]  bias_data_in;
  reg        [255:0]  scale_data_in;
  reg        [255:0]  shift_data_in;
  reg        [255:0]  scale_data_in_delay_1;
  reg        [255:0]  scale_data_in_delay;
  reg        [255:0]  shift_data_in_delay_1;
  reg        [255:0]  shift_data_in_delay_2;
  reg        [255:0]  shift_data_in_delay_3;
  reg        [255:0]  shift_data_in_delay_4;
  reg        [255:0]  shift_data_in_delay;
  reg        [127:0]  shift_data_out_temp;

  image_quan_ctrl ctrl (
    .fifo_valid     (image_bias_fifo_valid  ), //i
    .M_Ready        (M_DATA_ready           ), //i
    .rd_en_fifo     (ctrl_rd_en_fifo        ), //o
    .para_select    (ctrl_para_select       ), //o
    .M_Valid        (ctrl_M_Valid           ), //o
    .clk            (clk                    ), //i
    .reset          (reset                  )  //i
  );
  image_quan_bias image_bias (
    .S_DATA_valid      (S_DATA_valid             ), //i
    .S_DATA_ready      (image_bias_S_DATA_ready  ), //o
    .S_DATA_payload    (S_DATA_payload           ), //i
    .rd_en_fifo        (ctrl_rd_en_fifo          ), //i
    .bias_data_in      (bias_data_in             ), //i
    .fifo_valid        (image_bias_fifo_valid    ), //o
    .M_Data            (image_bias_M_Data        ), //o
    .reset             (reset                    ), //i
    .clk               (clk                      )  //i
  );
  image_quan_scale image_scale (
    .S_DATA           (image_bias_M_Data    ), //i
    .scale_data_in    (scale_data_in_delay  ), //i
    .M_DATA           (image_scale_M_DATA   ), //o
    .clk              (clk                  )  //i
  );
  image_quan_shift image_quan_shift_8 (
    .shift_data_in     (image_quan_shift_8_shift_data_in   ), //i
    .data_in           (image_quan_shift_8_data_in         ), //i
    .shift_data_out    (image_quan_shift_8_shift_data_out  ), //o
    .clk               (clk                                ), //i
    .reset             (reset                              )  //i
  );
  image_quan_shift image_quan_shift_9 (
    .shift_data_in     (image_quan_shift_9_shift_data_in   ), //i
    .data_in           (image_quan_shift_9_data_in         ), //i
    .shift_data_out    (image_quan_shift_9_shift_data_out  ), //o
    .clk               (clk                                ), //i
    .reset             (reset                              )  //i
  );
  image_quan_shift image_quan_shift_10 (
    .shift_data_in     (image_quan_shift_10_shift_data_in   ), //i
    .data_in           (image_quan_shift_10_data_in         ), //i
    .shift_data_out    (image_quan_shift_10_shift_data_out  ), //o
    .clk               (clk                                 ), //i
    .reset             (reset                               )  //i
  );
  image_quan_shift image_quan_shift_11 (
    .shift_data_in     (image_quan_shift_11_shift_data_in   ), //i
    .data_in           (image_quan_shift_11_data_in         ), //i
    .shift_data_out    (image_quan_shift_11_shift_data_out  ), //o
    .clk               (clk                                 ), //i
    .reset             (reset                               )  //i
  );
  image_quan_shift image_quan_shift_12 (
    .shift_data_in     (image_quan_shift_12_shift_data_in   ), //i
    .data_in           (image_quan_shift_12_data_in         ), //i
    .shift_data_out    (image_quan_shift_12_shift_data_out  ), //o
    .clk               (clk                                 ), //i
    .reset             (reset                               )  //i
  );
  image_quan_shift image_quan_shift_13 (
    .shift_data_in     (image_quan_shift_13_shift_data_in   ), //i
    .data_in           (image_quan_shift_13_data_in         ), //i
    .shift_data_out    (image_quan_shift_13_shift_data_out  ), //o
    .clk               (clk                                 ), //i
    .reset             (reset                               )  //i
  );
  image_quan_shift image_quan_shift_14 (
    .shift_data_in     (image_quan_shift_14_shift_data_in   ), //i
    .data_in           (image_quan_shift_14_data_in         ), //i
    .shift_data_out    (image_quan_shift_14_shift_data_out  ), //o
    .clk               (clk                                 ), //i
    .reset             (reset                               )  //i
  );
  image_quan_shift image_quan_shift_15 (
    .shift_data_in     (image_quan_shift_15_shift_data_in   ), //i
    .data_in           (image_quan_shift_15_data_in         ), //i
    .shift_data_out    (image_quan_shift_15_shift_data_out  ), //o
    .clk               (clk                                 ), //i
    .reset             (reset                               )  //i
  );
  image_quan_zero image_zero (
    .data_in         (shift_data_out_temp  ), //i
    .zero_data_in    (zero_point           ), //i
    .data_out        (image_zero_data_out  ), //o
    .clk             (clk                  ), //i
    .reset           (reset                )  //i
  );
  image_leaky_relu image_leaky (
    .data_in         (image_zero_data_out   ), //i
    .zero_data_in    (zero_point            ), //i
    .data_out        (image_leaky_data_out  ), //o
    .clk             (clk                   )  //i
  );
  assign bias_data_0 = 256'hffffd79200001657000040b7ffffe72bffffd3c2ffffdc260000293d00003d10;
  assign bias_data_1 = 256'hfffff231000048a5fffff70100002e42fffffeb8fffff75dffffc50cfffff8d0;
  assign bias_data_2 = 256'hffffe61c000051a7ffffff2d00003b670000035e00000f3a00001999ffffff08;
  assign bias_data_3 = 256'h000013cf000001c6ffffd6dffffffbabffffc82400002274fffffbebffffdfff;
  assign scale_data_0 = 256'h9081a1009c6814006028a8007242d8006b430400a0a4a9006d986980621aec80;
  assign scale_data_1 = 256'hb26ca600a675090075bf3d0071cad480b17612007bf28d80b2614d0087565d00;
  assign scale_data_2 = 256'h620e66806d985580b2258b00b013a3005de8a600ac71ea00acd98d007323ce80;
  assign scale_data_3 = 256'h7539b280b43299007f6ce380a325fc0065362b00aee988006752a480af316500;
  assign shift_data_0 = 256'h00000009000000090000000a0000000800000009000000090000000900000009;
  assign shift_data_1 = 256'h000000080000000a000000070000000900000007000000070000000a00000007;
  assign shift_data_2 = 256'h000000080000000a000000060000000a00000006000000080000000900000007;
  assign shift_data_3 = 256'h0000000800000006000000090000000700000009000000090000000700000009;
  assign zero_point = 8'h44;
  assign M_DATA_valid = ctrl_M_Valid;
  assign S_DATA_ready = image_bias_S_DATA_ready;
  assign image_quan_shift_8_data_in = image_scale_M_DATA[31 : 0];
  assign image_quan_shift_8_shift_data_in = shift_data_in_delay[31 : 0];
  always @(*) begin
    shift_data_out_temp[15 : 0] = image_quan_shift_8_shift_data_out;
    shift_data_out_temp[31 : 16] = image_quan_shift_9_shift_data_out;
    shift_data_out_temp[47 : 32] = image_quan_shift_10_shift_data_out;
    shift_data_out_temp[63 : 48] = image_quan_shift_11_shift_data_out;
    shift_data_out_temp[79 : 64] = image_quan_shift_12_shift_data_out;
    shift_data_out_temp[95 : 80] = image_quan_shift_13_shift_data_out;
    shift_data_out_temp[111 : 96] = image_quan_shift_14_shift_data_out;
    shift_data_out_temp[127 : 112] = image_quan_shift_15_shift_data_out;
  end

  assign image_quan_shift_9_data_in = image_scale_M_DATA[63 : 32];
  assign image_quan_shift_9_shift_data_in = shift_data_in_delay[63 : 32];
  assign image_quan_shift_10_data_in = image_scale_M_DATA[95 : 64];
  assign image_quan_shift_10_shift_data_in = shift_data_in_delay[95 : 64];
  assign image_quan_shift_11_data_in = image_scale_M_DATA[127 : 96];
  assign image_quan_shift_11_shift_data_in = shift_data_in_delay[127 : 96];
  assign image_quan_shift_12_data_in = image_scale_M_DATA[159 : 128];
  assign image_quan_shift_12_shift_data_in = shift_data_in_delay[159 : 128];
  assign image_quan_shift_13_data_in = image_scale_M_DATA[191 : 160];
  assign image_quan_shift_13_shift_data_in = shift_data_in_delay[191 : 160];
  assign image_quan_shift_14_data_in = image_scale_M_DATA[223 : 192];
  assign image_quan_shift_14_shift_data_in = shift_data_in_delay[223 : 192];
  assign image_quan_shift_15_data_in = image_scale_M_DATA[255 : 224];
  assign image_quan_shift_15_shift_data_in = shift_data_in_delay[255 : 224];
  assign M_DATA_payload = image_leaky_data_out;
  always @(posedge clk) begin
    if(reset) begin
      bias_data_in <= 256'h0;
      scale_data_in <= 256'h0;
      shift_data_in <= 256'h0;
    end else begin
      case(ctrl_para_select)
        4'b0001 : begin
          bias_data_in <= bias_data_0;
          scale_data_in <= scale_data_0;
          shift_data_in <= shift_data_0;
        end
        4'b0010 : begin
          bias_data_in <= bias_data_1;
          scale_data_in <= scale_data_1;
          shift_data_in <= shift_data_1;
        end
        4'b0011 : begin
          bias_data_in <= bias_data_2;
          scale_data_in <= scale_data_2;
          shift_data_in <= shift_data_2;
        end
        4'b0100 : begin
          bias_data_in <= bias_data_3;
          scale_data_in <= scale_data_3;
          shift_data_in <= shift_data_3;
        end
        default : begin
          bias_data_in <= 256'h0;
          scale_data_in <= 256'h0;
          shift_data_in <= 256'h0;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    scale_data_in_delay_1 <= scale_data_in;
    scale_data_in_delay <= scale_data_in_delay_1;
    shift_data_in_delay_1 <= shift_data_in;
    shift_data_in_delay_2 <= shift_data_in_delay_1;
    shift_data_in_delay_3 <= shift_data_in_delay_2;
    shift_data_in_delay_4 <= shift_data_in_delay_3;
    shift_data_in_delay <= shift_data_in_delay_4;
  end


endmodule
