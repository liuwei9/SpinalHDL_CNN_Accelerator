// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_bias
// Git hash  : c12011d1e8655c6f5dcb4228add939efcb9499aa
// Date      : 20/08/2021, 22:45:46


module image_quan_bias (
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [255:0]  S_DATA_payload,
  input               rd_en_fifo,
  input      [255:0]  bias_data_in,
  output              fifo_valid,
  output reg [255:0]  M_Data,
  input               reset,
  input               clk
);
  wire       [31:0]   add_simd_72_A;
  wire       [31:0]   add_simd_72_B;
  wire       [31:0]   add_simd_73_A;
  wire       [31:0]   add_simd_73_B;
  wire       [31:0]   add_simd_74_A;
  wire       [31:0]   add_simd_74_B;
  wire       [31:0]   add_simd_75_A;
  wire       [31:0]   add_simd_75_B;
  wire       [31:0]   add_simd_76_A;
  wire       [31:0]   add_simd_76_B;
  wire       [31:0]   add_simd_77_A;
  wire       [31:0]   add_simd_77_B;
  wire       [31:0]   add_simd_78_A;
  wire       [31:0]   add_simd_78_B;
  wire       [31:0]   add_simd_79_A;
  wire       [31:0]   add_simd_79_B;
  wire                bias_fifo_data_in_ready;
  wire       [255:0]  bias_fifo_data_out;
  wire                bias_fifo_data_out_valid;
  wire                bias_fifo_data_valid;
  wire                bias_fifo_full;
  wire                bias_fifo_empty;
  wire       [31:0]   add_simd_72_P;
  wire       [31:0]   add_simd_73_P;
  wire       [31:0]   add_simd_74_P;
  wire       [31:0]   add_simd_75_P;
  wire       [31:0]   add_simd_76_P;
  wire       [31:0]   add_simd_77_P;
  wire       [31:0]   add_simd_78_P;
  wire       [31:0]   add_simd_79_P;
  reg        [255:0]  bias_fifo_data_out_delay_1;
  reg        [255:0]  data_out_fifo_delay;

  general_fifo_sync bias_fifo (
    .reset             (reset                     ), //i
    .clk               (clk                       ), //i
    .data_in           (S_DATA_payload            ), //i
    .wr_en             (S_DATA_valid              ), //i
    .data_in_ready     (bias_fifo_data_in_ready   ), //o
    .data_out          (bias_fifo_data_out        ), //o
    .rd_en             (rd_en_fifo                ), //i
    .data_out_valid    (bias_fifo_data_out_valid  ), //o
    .m_data_count      (12'ha00                   ), //i
    .s_data_count      (12'ha00                   ), //i
    .data_valid        (bias_fifo_data_valid      ), //o
    .full              (bias_fifo_full            ), //o
    .empty             (bias_fifo_empty           )  //o
  );
  add_simd_64 add_simd_72 (
    .A        (add_simd_72_A  ), //i
    .B        (add_simd_72_B  ), //i
    .P        (add_simd_72_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_73 (
    .A        (add_simd_73_A  ), //i
    .B        (add_simd_73_B  ), //i
    .P        (add_simd_73_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_74 (
    .A        (add_simd_74_A  ), //i
    .B        (add_simd_74_B  ), //i
    .P        (add_simd_74_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_75 (
    .A        (add_simd_75_A  ), //i
    .B        (add_simd_75_B  ), //i
    .P        (add_simd_75_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_76 (
    .A        (add_simd_76_A  ), //i
    .B        (add_simd_76_B  ), //i
    .P        (add_simd_76_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_77 (
    .A        (add_simd_77_A  ), //i
    .B        (add_simd_77_B  ), //i
    .P        (add_simd_77_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_78 (
    .A        (add_simd_78_A  ), //i
    .B        (add_simd_78_B  ), //i
    .P        (add_simd_78_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd_64 add_simd_79 (
    .A        (add_simd_79_A  ), //i
    .B        (add_simd_79_B  ), //i
    .P        (add_simd_79_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  assign S_DATA_ready = bias_fifo_data_in_ready;
  assign fifo_valid = bias_fifo_data_out_valid;
  assign add_simd_72_A = data_out_fifo_delay[31 : 0];
  assign add_simd_72_B = bias_data_in[31 : 0];
  always @(*) begin
    M_Data[31 : 0] = add_simd_72_P;
    M_Data[63 : 32] = add_simd_73_P;
    M_Data[95 : 64] = add_simd_74_P;
    M_Data[127 : 96] = add_simd_75_P;
    M_Data[159 : 128] = add_simd_76_P;
    M_Data[191 : 160] = add_simd_77_P;
    M_Data[223 : 192] = add_simd_78_P;
    M_Data[255 : 224] = add_simd_79_P;
  end

  assign add_simd_73_A = data_out_fifo_delay[63 : 32];
  assign add_simd_73_B = bias_data_in[63 : 32];
  assign add_simd_74_A = data_out_fifo_delay[95 : 64];
  assign add_simd_74_B = bias_data_in[95 : 64];
  assign add_simd_75_A = data_out_fifo_delay[127 : 96];
  assign add_simd_75_B = bias_data_in[127 : 96];
  assign add_simd_76_A = data_out_fifo_delay[159 : 128];
  assign add_simd_76_B = bias_data_in[159 : 128];
  assign add_simd_77_A = data_out_fifo_delay[191 : 160];
  assign add_simd_77_B = bias_data_in[191 : 160];
  assign add_simd_78_A = data_out_fifo_delay[223 : 192];
  assign add_simd_78_B = bias_data_in[223 : 192];
  assign add_simd_79_A = data_out_fifo_delay[255 : 224];
  assign add_simd_79_B = bias_data_in[255 : 224];
  always @(posedge clk) begin
    bias_fifo_data_out_delay_1 <= bias_fifo_data_out;
    data_out_fifo_delay <= bias_fifo_data_out_delay_1;
  end


endmodule
