// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_padding_fifo_sync
// Git hash  : b80498e7ba4f011f4b3ac5e4fb93afd2fb7a8c4d
// Date      : 06/08/2021, 19:22:06


module image_padding_fifo_sync (
  output              full,
  input               wr_en,
  input      [7:0]    din,
  output              empty,
  output     [7:0]    dout,
  input               rd_en,
  output     [10:0]   wr_data_count,
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
  wire       [7:0]    temp_dout;
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
  wire       [10:0]   temp_wr_data_count;
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
    .FIFO_WRITE_DEPTH(1024),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(1019),
    .RD_DATA_COUNT_WIDTH(11),
    .READ_DATA_WIDTH(8),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(8),
    .WR_DATA_COUNT_WIDTH(11) 
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
