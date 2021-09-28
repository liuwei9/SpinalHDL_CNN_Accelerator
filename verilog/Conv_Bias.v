// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_Bias
// Git hash  : 46de7a2643940073d87fffa27badc891275ca23e


module Conv_Bias (
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [255:0]  S_DATA_payload,
  output              fifo_ready,
  input               rd_en_fifo,
  input      [255:0]  bias_data_in,
  output reg [255:0]  M_Data,
  input      [9:0]    Channel_Out_Num_REG,
  input      [11:0]   S_Count_Fifo,
  input               reset,
  input               clk
);
  wire       [11:0]   fifo_m_data_count;
  wire       [11:0]   fifo_s_data_count;
  wire       [31:0]   add_simd_8_A;
  wire       [31:0]   add_simd_8_B;
  wire       [31:0]   add_simd_9_A;
  wire       [31:0]   add_simd_9_B;
  wire       [31:0]   add_simd_10_A;
  wire       [31:0]   add_simd_10_B;
  wire       [31:0]   add_simd_11_A;
  wire       [31:0]   add_simd_11_B;
  wire       [31:0]   add_simd_12_A;
  wire       [31:0]   add_simd_12_B;
  wire       [31:0]   add_simd_13_A;
  wire       [31:0]   add_simd_13_B;
  wire       [31:0]   add_simd_14_A;
  wire       [31:0]   add_simd_14_B;
  wire       [31:0]   add_simd_15_A;
  wire       [31:0]   add_simd_15_B;
  wire                fifo_data_in_ready;
  wire       [255:0]  fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [31:0]   add_simd_8_P;
  wire       [31:0]   add_simd_9_P;
  wire       [31:0]   add_simd_10_P;
  wire       [31:0]   add_simd_11_P;
  wire       [31:0]   add_simd_12_P;
  wire       [31:0]   add_simd_13_P;
  wire       [31:0]   add_simd_14_P;
  wire       [31:0]   add_simd_15_P;
  wire       [6:0]    Channel_Times;
  wire       [255:0]  data_fifo_out;

  general_fifo_sync fifo (
    .reset             (reset                ), //i
    .clk               (clk                  ), //i
    .data_in           (S_DATA_payload       ), //i
    .wr_en             (S_DATA_valid         ), //i
    .data_in_ready     (fifo_data_in_ready   ), //o
    .data_out          (fifo_data_out        ), //o
    .rd_en             (rd_en_fifo           ), //i
    .data_out_valid    (fifo_data_out_valid  ), //o
    .m_data_count      (fifo_m_data_count    ), //i
    .s_data_count      (fifo_s_data_count    ), //i
    .data_valid        (fifo_data_valid      ), //o
    .full              (fifo_full            ), //o
    .empty             (fifo_empty           )  //o
  );
  add_simd add_simd_8 (
    .A        (add_simd_8_A  ), //i
    .B        (add_simd_8_B  ), //i
    .P        (add_simd_8_P  ), //o
    .clk      (clk           ), //i
    .reset    (reset         )  //i
  );
  add_simd add_simd_9 (
    .A        (add_simd_9_A  ), //i
    .B        (add_simd_9_B  ), //i
    .P        (add_simd_9_P  ), //o
    .clk      (clk           ), //i
    .reset    (reset         )  //i
  );
  add_simd add_simd_10 (
    .A        (add_simd_10_A  ), //i
    .B        (add_simd_10_B  ), //i
    .P        (add_simd_10_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_11 (
    .A        (add_simd_11_A  ), //i
    .B        (add_simd_11_B  ), //i
    .P        (add_simd_11_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_12 (
    .A        (add_simd_12_A  ), //i
    .B        (add_simd_12_B  ), //i
    .P        (add_simd_12_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_13 (
    .A        (add_simd_13_A  ), //i
    .B        (add_simd_13_B  ), //i
    .P        (add_simd_13_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_14 (
    .A        (add_simd_14_A  ), //i
    .B        (add_simd_14_B  ), //i
    .P        (add_simd_14_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_15 (
    .A        (add_simd_15_A  ), //i
    .B        (add_simd_15_B  ), //i
    .P        (add_simd_15_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  assign Channel_Times = (Channel_Out_Num_REG >>> 3);
  assign data_fifo_out = fifo_data_out;
  assign fifo_m_data_count = S_Count_Fifo;
  assign fifo_s_data_count = S_Count_Fifo;
  assign S_DATA_ready = fifo_data_in_ready;
  assign fifo_ready = fifo_data_out_valid;
  assign add_simd_8_A = data_fifo_out[31 : 0];
  assign add_simd_8_B = bias_data_in[31 : 0];
  always @(*) begin
    M_Data[31 : 0] = add_simd_8_P;
    M_Data[63 : 32] = add_simd_9_P;
    M_Data[95 : 64] = add_simd_10_P;
    M_Data[127 : 96] = add_simd_11_P;
    M_Data[159 : 128] = add_simd_12_P;
    M_Data[191 : 160] = add_simd_13_P;
    M_Data[223 : 192] = add_simd_14_P;
    M_Data[255 : 224] = add_simd_15_P;
  end

  assign add_simd_9_A = data_fifo_out[63 : 32];
  assign add_simd_9_B = bias_data_in[63 : 32];
  assign add_simd_10_A = data_fifo_out[95 : 64];
  assign add_simd_10_B = bias_data_in[95 : 64];
  assign add_simd_11_A = data_fifo_out[127 : 96];
  assign add_simd_11_B = bias_data_in[127 : 96];
  assign add_simd_12_A = data_fifo_out[159 : 128];
  assign add_simd_12_B = bias_data_in[159 : 128];
  assign add_simd_13_A = data_fifo_out[191 : 160];
  assign add_simd_13_B = bias_data_in[191 : 160];
  assign add_simd_14_A = data_fifo_out[223 : 192];
  assign add_simd_14_B = bias_data_in[223 : 192];
  assign add_simd_15_A = data_fifo_out[255 : 224];
  assign add_simd_15_B = bias_data_in[255 : 224];

endmodule
