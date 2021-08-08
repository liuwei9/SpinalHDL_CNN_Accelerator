// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_bias
// Git hash  : 1384860c0036c73e3b86ea43dc3bd8aef24bc981



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
  wire                bias_fifo_data_in_ready;
  wire       [255:0]  bias_fifo_data_out;
  wire                bias_fifo_data_out_valid;
  wire       [31:0]   add_simd_8_P;
  wire       [31:0]   add_simd_9_P;
  wire       [31:0]   add_simd_10_P;
  wire       [31:0]   add_simd_11_P;
  wire       [31:0]   add_simd_12_P;
  wire       [31:0]   add_simd_13_P;
  wire       [31:0]   add_simd_14_P;
  wire       [31:0]   add_simd_15_P;
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
    .m_data_count      (12'ha00                   )  //i
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
  assign S_DATA_ready = bias_fifo_data_in_ready;
  assign fifo_valid = bias_fifo_data_out_valid;
  assign add_simd_8_A = S_DATA_payload[31 : 0];
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

  assign add_simd_9_A = S_DATA_payload[63 : 32];
  assign add_simd_9_B = bias_data_in[63 : 32];
  assign add_simd_10_A = S_DATA_payload[95 : 64];
  assign add_simd_10_B = bias_data_in[95 : 64];
  assign add_simd_11_A = S_DATA_payload[127 : 96];
  assign add_simd_11_B = bias_data_in[127 : 96];
  assign add_simd_12_A = S_DATA_payload[159 : 128];
  assign add_simd_12_B = bias_data_in[159 : 128];
  assign add_simd_13_A = S_DATA_payload[191 : 160];
  assign add_simd_13_B = bias_data_in[191 : 160];
  assign add_simd_14_A = S_DATA_payload[223 : 192];
  assign add_simd_14_B = bias_data_in[223 : 192];
  assign add_simd_15_A = S_DATA_payload[255 : 224];
  assign add_simd_15_B = bias_data_in[255 : 224];
  always @(posedge clk) begin
    bias_fifo_data_out_delay_1 <= bias_fifo_data_out;
    data_out_fifo_delay <= bias_fifo_data_out_delay_1;
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
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  wire       [31:0]   add_8_P;

  add add_8 (
    .A        (A        ), //i
    .B        (B        ), //i
    .P        (add_8_P  ), //o
    .clk      (clk      ), //i
    .reset    (reset    )  //i
  );
  assign P = add_8_P;

endmodule

module general_fifo_sync (
  input               reset,
  input               clk,
  input      [255:0]  data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [255:0]  data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [11:0]   m_data_count
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [255:0]  fifo_dout;
  wire       [12:0]   fifo_wr_data_count;
  wire       [12:0]   fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [12:0]   _zz_when_general_fifo_sync_l38;
  wire                when_general_fifo_sync_l33;
  wire                when_general_fifo_sync_l38;

  assign _zz_when_general_fifo_sync_l38 = {1'd0, m_data_count};
  fifo_sync fifo (
    .full             (fifo_full           ), //o
    .wr_en            (wr_en               ), //i
    .din              (data_in             ), //i
    .empty            (fifo_empty          ), //o
    .dout             (fifo_dout           ), //o
    .rd_en            (rd_en               ), //i
    .wr_data_count    (fifo_wr_data_count  ), //o
    .rd_data_count    (fifo_rd_data_count  ), //o
    .data_valid       (fifo_data_valid     ), //o
    .rd_rst_busy      (fifo_rd_rst_busy    ), //o
    .wr_rst_busy      (fifo_wr_rst_busy    ), //o
    .reset            (reset               ), //i
    .clk              (clk                 )  //i
  );
  assign data_out = fifo_dout;
  assign when_general_fifo_sync_l33 = ((! fifo_wr_rst_busy) && (! fifo_full));
  always @(*) begin
    if(when_general_fifo_sync_l33) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l38 = ((! fifo_rd_rst_busy) && (_zz_when_general_fifo_sync_l38 <= fifo_rd_data_count));
  always @(*) begin
    if(when_general_fifo_sync_l38) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
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
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [31:0]   A_q;
  (* use_dsp = "yes" *) wire       [31:0]   B_q;
  (* use_dsp = "yes" *) reg        [31:0]   A_qq;
  (* use_dsp = "yes" *) reg        [31:0]   B_qq;
  (* use_dsp = "yes" *) reg        [31:0]   P_q;

  assign A_q = A;
  assign B_q = B;
  assign P = P_q;
  always @(posedge clk) begin
    A_qq <= A_q;
    B_qq <= B_q;
    P_q <= ($signed(A_qq) + $signed(B_qq));
  end


endmodule

module fifo_sync (
  output              full,
  input               wr_en,
  input      [255:0]  din,
  output              empty,
  output     [255:0]  dout,
  input               rd_en,
  output     [12:0]   wr_data_count,
  output     [12:0]   rd_data_count,
  output              data_valid,
  output              rd_rst_busy,
  output              wr_rst_busy,
  input               reset,
  input               clk
);
  wire                temp_almost_empty;
  wire                temp_almost_full;
  wire                temp_data_valid;
  wire                temp_dbiterr;
  wire       [255:0]  temp_dout;
  wire                temp_empty;
  wire                temp_full;
  wire                temp_overflow;
  wire                temp_prog_empty;
  wire                temp_prog_full;
  wire       [12:0]   temp_rd_data_count;
  wire                temp_rd_rst_busy;
  wire                temp_sbiterr;
  wire                temp_underflow;
  wire                temp_wr_ack;
  wire       [12:0]   temp_wr_data_count;
  wire                temp_wr_rst_busy;
  wire                almost_empty;
  wire                almost_full;
  wire                dbiterr;
  wire                overflow;
  wire                prog_empty;
  wire                prog_full;
  wire                sbiterr;
  wire                underflow;
  wire                wr_ack;
  wire                injectdbiterr;
  wire                injectsbiterr;
  wire                sleep;

  xpm_fifo_sync #(
    .DOUT_RESET_VALUE("0"),
    .ECC_MODE("no_ecc"),
    .FIFO_MEMORY_TYPE("block"),
    .FIFO_READ_LATENCY(0),
    .FIFO_WRITE_DEPTH(4096),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(4091),
    .RD_DATA_COUNT_WIDTH(13),
    .READ_DATA_WIDTH(256),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(256),
    .WR_DATA_COUNT_WIDTH(13) 
  ) temp (
    .almost_empty     (temp_almost_empty   ), //o
    .almost_full      (temp_almost_full    ), //o
    .data_valid       (temp_data_valid     ), //o
    .dbiterr          (temp_dbiterr        ), //o
    .dout             (temp_dout           ), //o
    .empty            (temp_empty          ), //o
    .full             (temp_full           ), //o
    .overflow         (temp_overflow       ), //o
    .prog_empty       (temp_prog_empty     ), //o
    .prog_full        (temp_prog_full      ), //o
    .rd_data_count    (temp_rd_data_count  ), //o
    .rd_rst_busy      (temp_rd_rst_busy    ), //o
    .sbiterr          (temp_sbiterr        ), //o
    .underflow        (temp_underflow      ), //o
    .wr_ack           (temp_wr_ack         ), //o
    .wr_data_count    (temp_wr_data_count  ), //o
    .wr_rst_busy      (temp_wr_rst_busy    ), //o
    .din              (din                 ), //i
    .injectdbiterr    (injectdbiterr       ), //i
    .injectsbiterr    (injectsbiterr       ), //i
    .rd_en            (rd_en               ), //i
    .rst              (reset               ), //i
    .sleep            (sleep               ), //i
    .wr_clk           (clk                 ), //i
    .wr_en            (wr_en               )  //i
  );
  assign injectdbiterr = 1'b0;
  assign injectsbiterr = 1'b0;
  assign sleep = 1'b0;
  assign almost_empty = temp_almost_empty;
  assign almost_full = temp_almost_full;
  assign data_valid = temp_data_valid;
  assign dbiterr = temp_dbiterr;
  assign dout = temp_dout;
  assign empty = temp_empty;
  assign full = temp_full;
  assign overflow = temp_overflow;
  assign prog_empty = temp_prog_empty;
  assign prog_full = temp_prog_full;
  assign rd_data_count = temp_rd_data_count;
  assign rd_rst_busy = temp_rd_rst_busy;
  assign sbiterr = temp_sbiterr;
  assign underflow = temp_underflow;
  assign wr_ack = temp_wr_ack;
  assign wr_data_count = temp_wr_data_count;
  assign wr_rst_busy = temp_wr_rst_busy;

endmodule
