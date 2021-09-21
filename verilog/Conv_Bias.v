// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_Bias
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:45


module Conv_Bias (
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [255:0]  S_DATA_payload,
  output              fifo_ready,
  input               rd_en_fifo,
  input      [255:0]  bias_data_in,
  output reg [255:0]  M_Data,
  input      [9:0]    Channel_Out_Num_REG,
  input      [10:0]   S_Count_Fifo,
  input               reset,
  input               clk
);
  wire       [10:0]   fifo_m_data_count;
  wire       [10:0]   fifo_s_data_count;
  wire       [31:0]   add_simd_1032_A;
  wire       [31:0]   add_simd_1032_B;
  wire       [31:0]   add_simd_1033_A;
  wire       [31:0]   add_simd_1033_B;
  wire       [31:0]   add_simd_1034_A;
  wire       [31:0]   add_simd_1034_B;
  wire       [31:0]   add_simd_1035_A;
  wire       [31:0]   add_simd_1035_B;
  wire       [31:0]   add_simd_1036_A;
  wire       [31:0]   add_simd_1036_B;
  wire       [31:0]   add_simd_1037_A;
  wire       [31:0]   add_simd_1037_B;
  wire       [31:0]   add_simd_1038_A;
  wire       [31:0]   add_simd_1038_B;
  wire       [31:0]   add_simd_1039_A;
  wire       [31:0]   add_simd_1039_B;
  wire                fifo_data_in_ready;
  wire       [255:0]  fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [31:0]   add_simd_1032_P;
  wire       [31:0]   add_simd_1033_P;
  wire       [31:0]   add_simd_1034_P;
  wire       [31:0]   add_simd_1035_P;
  wire       [31:0]   add_simd_1036_P;
  wire       [31:0]   add_simd_1037_P;
  wire       [31:0]   add_simd_1038_P;
  wire       [31:0]   add_simd_1039_P;
  wire       [6:0]    Channel_Times;
  wire       [255:0]  data_fifo_out;

  general_fifo_sync_1 fifo (
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
  add_simd_1024 add_simd_1032 (
    .A        (add_simd_1032_A  ), //i
    .B        (add_simd_1032_B  ), //i
    .P        (add_simd_1032_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1033 (
    .A        (add_simd_1033_A  ), //i
    .B        (add_simd_1033_B  ), //i
    .P        (add_simd_1033_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1034 (
    .A        (add_simd_1034_A  ), //i
    .B        (add_simd_1034_B  ), //i
    .P        (add_simd_1034_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1035 (
    .A        (add_simd_1035_A  ), //i
    .B        (add_simd_1035_B  ), //i
    .P        (add_simd_1035_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1036 (
    .A        (add_simd_1036_A  ), //i
    .B        (add_simd_1036_B  ), //i
    .P        (add_simd_1036_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1037 (
    .A        (add_simd_1037_A  ), //i
    .B        (add_simd_1037_B  ), //i
    .P        (add_simd_1037_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1038 (
    .A        (add_simd_1038_A  ), //i
    .B        (add_simd_1038_B  ), //i
    .P        (add_simd_1038_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  add_simd_1024 add_simd_1039 (
    .A        (add_simd_1039_A  ), //i
    .B        (add_simd_1039_B  ), //i
    .P        (add_simd_1039_P  ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  assign Channel_Times = (Channel_Out_Num_REG >>> 3);
  assign data_fifo_out = fifo_data_out;
  assign fifo_m_data_count = S_Count_Fifo;
  assign fifo_s_data_count = S_Count_Fifo;
  assign S_DATA_ready = fifo_data_in_ready;
  assign fifo_ready = fifo_data_out_valid;
  assign add_simd_1032_A = data_fifo_out[31 : 0];
  assign add_simd_1032_B = bias_data_in[31 : 0];
  always @(*) begin
    M_Data[31 : 0] = add_simd_1032_P;
    M_Data[63 : 32] = add_simd_1033_P;
    M_Data[95 : 64] = add_simd_1034_P;
    M_Data[127 : 96] = add_simd_1035_P;
    M_Data[159 : 128] = add_simd_1036_P;
    M_Data[191 : 160] = add_simd_1037_P;
    M_Data[223 : 192] = add_simd_1038_P;
    M_Data[255 : 224] = add_simd_1039_P;
  end

  assign add_simd_1033_A = data_fifo_out[63 : 32];
  assign add_simd_1033_B = bias_data_in[63 : 32];
  assign add_simd_1034_A = data_fifo_out[95 : 64];
  assign add_simd_1034_B = bias_data_in[95 : 64];
  assign add_simd_1035_A = data_fifo_out[127 : 96];
  assign add_simd_1035_B = bias_data_in[127 : 96];
  assign add_simd_1036_A = data_fifo_out[159 : 128];
  assign add_simd_1036_B = bias_data_in[159 : 128];
  assign add_simd_1037_A = data_fifo_out[191 : 160];
  assign add_simd_1037_B = bias_data_in[191 : 160];
  assign add_simd_1038_A = data_fifo_out[223 : 192];
  assign add_simd_1038_B = bias_data_in[223 : 192];
  assign add_simd_1039_A = data_fifo_out[255 : 224];
  assign add_simd_1039_B = bias_data_in[255 : 224];

endmodule
