// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : A
// Git hash  : 3de18e70bd50589bd21035e4fb7a1c12a3bd4cfa



module A (
  input               reset,
  input               clk
);
  wire                general_fifo_sync_9_data_in_ready;
  wire       [127:0]  general_fifo_sync_9_data_out;
  wire                general_fifo_sync_9_data_out_valid;
  wire                general_fifo_sync_9_data_valid;
  wire                general_fifo_sync_9_full;
  wire                general_fifo_sync_9_empty;
  wire                general_fifo_sync_10_data_in_ready;
  wire       [127:0]  general_fifo_sync_10_data_out;
  wire                general_fifo_sync_10_data_out_valid;
  wire                general_fifo_sync_10_data_valid;
  wire                general_fifo_sync_10_full;
  wire                general_fifo_sync_10_empty;
  wire                general_fifo_sync_11_data_in_ready;
  wire       [127:0]  general_fifo_sync_11_data_out;
  wire                general_fifo_sync_11_data_out_valid;
  wire                general_fifo_sync_11_data_valid;
  wire                general_fifo_sync_11_full;
  wire                general_fifo_sync_11_empty;
  wire                general_fifo_sync_12_data_in_ready;
  wire       [127:0]  general_fifo_sync_12_data_out;
  wire                general_fifo_sync_12_data_out_valid;
  wire                general_fifo_sync_12_data_valid;
  wire                general_fifo_sync_12_full;
  wire                general_fifo_sync_12_empty;
  wire                general_fifo_sync_13_data_in_ready;
  wire       [127:0]  general_fifo_sync_13_data_out;
  wire                general_fifo_sync_13_data_out_valid;
  wire                general_fifo_sync_13_data_valid;
  wire                general_fifo_sync_13_full;
  wire                general_fifo_sync_13_empty;
  wire                general_fifo_sync_14_data_in_ready;
  wire       [127:0]  general_fifo_sync_14_data_out;
  wire                general_fifo_sync_14_data_out_valid;
  wire                general_fifo_sync_14_data_valid;
  wire                general_fifo_sync_14_full;
  wire                general_fifo_sync_14_empty;
  wire                general_fifo_sync_15_data_in_ready;
  wire       [127:0]  general_fifo_sync_15_data_out;
  wire                general_fifo_sync_15_data_out_valid;
  wire                general_fifo_sync_15_data_valid;
  wire                general_fifo_sync_15_full;
  wire                general_fifo_sync_15_empty;
  wire                general_fifo_sync_16_data_in_ready;
  wire       [127:0]  general_fifo_sync_16_data_out;
  wire                general_fifo_sync_16_data_out_valid;
  wire                general_fifo_sync_16_data_valid;
  wire                general_fifo_sync_16_full;
  wire                general_fifo_sync_16_empty;
  wire                general_fifo_sync_17_data_in_ready;
  wire       [127:0]  general_fifo_sync_17_data_out;
  wire                general_fifo_sync_17_data_out_valid;
  wire                general_fifo_sync_17_data_valid;
  wire                general_fifo_sync_17_full;
  wire                general_fifo_sync_17_empty;
  reg        [1151:0] temp;
  reg        [127:0]  _zz_temp;
  reg        [127:0]  _zz_temp_1;
  reg        [127:0]  _zz_temp_2;
  reg        [127:0]  _zz_temp_3;
  reg        [127:0]  _zz_temp_4;
  reg        [127:0]  _zz_temp_5;
  reg        [127:0]  _zz_temp_6;
  reg        [127:0]  _zz_temp_7;
  reg        [127:0]  _zz_temp_8;

  general_fifo_sync general_fifo_sync_9 (
    .reset             (reset                               ), //i
    .clk               (clk                                 ), //i
    .data_in           (64'h0                               ), //i
    .wr_en             (1'b1                                ), //i
    .data_in_ready     (general_fifo_sync_9_data_in_ready   ), //o
    .data_out          (general_fifo_sync_9_data_out        ), //o
    .rd_en             (1'b0                                ), //i
    .data_out_valid    (general_fifo_sync_9_data_out_valid  ), //o
    .m_data_count      (13'h0                               ), //i
    .s_data_count      (13'h0                               ), //i
    .data_valid        (general_fifo_sync_9_data_valid      ), //o
    .full              (general_fifo_sync_9_full            ), //o
    .empty             (general_fifo_sync_9_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_10 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_10_data_in_ready   ), //o
    .data_out          (general_fifo_sync_10_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_10_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_10_data_valid      ), //o
    .full              (general_fifo_sync_10_full            ), //o
    .empty             (general_fifo_sync_10_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_11 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_11_data_in_ready   ), //o
    .data_out          (general_fifo_sync_11_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_11_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_11_data_valid      ), //o
    .full              (general_fifo_sync_11_full            ), //o
    .empty             (general_fifo_sync_11_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_12 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_12_data_in_ready   ), //o
    .data_out          (general_fifo_sync_12_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_12_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_12_data_valid      ), //o
    .full              (general_fifo_sync_12_full            ), //o
    .empty             (general_fifo_sync_12_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_13 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_13_data_in_ready   ), //o
    .data_out          (general_fifo_sync_13_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_13_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_13_data_valid      ), //o
    .full              (general_fifo_sync_13_full            ), //o
    .empty             (general_fifo_sync_13_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_14 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_14_data_in_ready   ), //o
    .data_out          (general_fifo_sync_14_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_14_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_14_data_valid      ), //o
    .full              (general_fifo_sync_14_full            ), //o
    .empty             (general_fifo_sync_14_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_15 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_15_data_in_ready   ), //o
    .data_out          (general_fifo_sync_15_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_15_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_15_data_valid      ), //o
    .full              (general_fifo_sync_15_full            ), //o
    .empty             (general_fifo_sync_15_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_16 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_16_data_in_ready   ), //o
    .data_out          (general_fifo_sync_16_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_16_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_16_data_valid      ), //o
    .full              (general_fifo_sync_16_full            ), //o
    .empty             (general_fifo_sync_16_empty           )  //o
  );
  general_fifo_sync general_fifo_sync_17 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (64'h0                                ), //i
    .wr_en             (1'b1                                 ), //i
    .data_in_ready     (general_fifo_sync_17_data_in_ready   ), //o
    .data_out          (general_fifo_sync_17_data_out        ), //o
    .rd_en             (1'b0                                 ), //i
    .data_out_valid    (general_fifo_sync_17_data_out_valid  ), //o
    .m_data_count      (13'h0                                ), //i
    .s_data_count      (13'h0                                ), //i
    .data_valid        (general_fifo_sync_17_data_valid      ), //o
    .full              (general_fifo_sync_17_full            ), //o
    .empty             (general_fifo_sync_17_empty           )  //o
  );
  always @(*) begin
    _zz_temp[63 : 0] = general_fifo_sync_9_data_out;
    _zz_temp[127 : 64] = general_fifo_sync_9_data[127 : 64]_out[63 : 0];
  end

  always @(*) begin
    temp[127 : 0] = _zz_temp;
    temp[255 : 128] = _zz_temp_1;
    temp[383 : 256] = _zz_temp_2;
    temp[511 : 384] = _zz_temp_3;
    temp[639 : 512] = _zz_temp_4;
    temp[767 : 640] = _zz_temp_5;
    temp[895 : 768] = _zz_temp_6;
    temp[1023 : 896] = _zz_temp_7;
    temp[1151 : 1024] = _zz_temp_8;
  end

  always @(*) begin
    _zz_temp_1[63 : 0] = general_fifo_sync_10_data_out[127 : 64];
    _zz_temp_1[127 : 64] = general_fifo_sync_10_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_2[63 : 0] = general_fifo_sync_11_data_out[127 : 64];
    _zz_temp_2[127 : 64] = general_fifo_sync_11_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_3[63 : 0] = general_fifo_sync_12_data_out[127 : 64];
    _zz_temp_3[127 : 64] = general_fifo_sync_12_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_4[63 : 0] = general_fifo_sync_13_data_out[127 : 64];
    _zz_temp_4[127 : 64] = general_fifo_sync_13_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_5[63 : 0] = general_fifo_sync_14_data_out[127 : 64];
    _zz_temp_5[127 : 64] = general_fifo_sync_14_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_6[63 : 0] = general_fifo_sync_15_data_out[127 : 64];
    _zz_temp_6[127 : 64] = general_fifo_sync_15_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_7[63 : 0] = general_fifo_sync_16_data_out[127 : 64];
    _zz_temp_7[127 : 64] = general_fifo_sync_16_data_out[63 : 0];
  end

  always @(*) begin
    _zz_temp_8[63 : 0] = general_fifo_sync_17_data_out[127 : 64];
    _zz_temp_8[127 : 64] = general_fifo_sync_17_data_out[63 : 0];
  end


endmodule

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

//general_fifo_sync replaced by general_fifo_sync

module general_fifo_sync (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [127:0]  data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [12:0]   m_data_count,
  input      [12:0]   s_data_count,
  output              data_valid,
  output              full,
  output              empty
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [127:0]  fifo_dout;
  wire       [11:0]   fifo_wr_data_count;
  wire       [10:0]   fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [12:0]   _zz_when_general_fifo_sync_l39;
  wire       [12:0]   _zz_when_general_fifo_sync_l39_1;
  wire       [11:0]   _zz_when_general_fifo_sync_l39_2;
  wire       [12:0]   _zz_when_general_fifo_sync_l49;
  wire       [10:0]   _zz_when_general_fifo_sync_l49_1;
  wire                when_general_fifo_sync_l39;
  wire                when_general_fifo_sync_l49;

  assign _zz_when_general_fifo_sync_l39 = (_zz_when_general_fifo_sync_l39_1 + s_data_count);
  assign _zz_when_general_fifo_sync_l39_2 = fifo_wr_data_count;
  assign _zz_when_general_fifo_sync_l39_1 = {1'd0, _zz_when_general_fifo_sync_l39_2};
  assign _zz_when_general_fifo_sync_l49_1 = fifo_rd_data_count;
  assign _zz_when_general_fifo_sync_l49 = {2'd0, _zz_when_general_fifo_sync_l49_1};
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
  assign data_valid = fifo_data_valid;
  assign full = fifo_full;
  assign empty = fifo_empty;
  assign data_out = fifo_dout;
  assign when_general_fifo_sync_l39 = (((! fifo_wr_rst_busy) && (_zz_when_general_fifo_sync_l39 < 13'h0800)) && (! fifo_full));
  always @(*) begin
    if(when_general_fifo_sync_l39) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l49 = ((! fifo_rd_rst_busy) && (m_data_count <= _zz_when_general_fifo_sync_l49));
  always @(*) begin
    if(when_general_fifo_sync_l49) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

module fifo_sync (
  output              full,
  input               wr_en,
  input      [63:0]   din,
  output              empty,
  output     [127:0]  dout,
  input               rd_en,
  output     [11:0]   wr_data_count,
  output     [10:0]   rd_data_count,
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
  wire       [127:0]  temp_dout;
  wire                temp_empty;
  wire                temp_full;
  wire                temp_overflow;
  wire                temp_prog_empty;
  wire                temp_prog_full;
  wire       [10:0]   temp_rd_data_count;
  wire                temp_rd_rst_busy;
  wire                temp_sbiterr;
  wire                temp_underflow;
  wire                temp_wr_ack;
  wire       [11:0]   temp_wr_data_count;
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
    .FIFO_WRITE_DEPTH(2048),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(2041),
    .RD_DATA_COUNT_WIDTH(11),
    .READ_DATA_WIDTH(128),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(64),
    .WR_DATA_COUNT_WIDTH(12) 
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
