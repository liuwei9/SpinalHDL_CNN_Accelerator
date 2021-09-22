// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : general_fifo_sync_1
// Git hash  : 038b51e1758bac70ab39881905296db1cc09842a
// Date      : 22/09/2021, 16:16:35


module general_fifo_sync_1 (
  input               reset,
  input               clk,
  input      [255:0]  data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [255:0]  data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [11:0]   m_data_count,
  input      [11:0]   s_data_count,
  output              data_valid,
  output              full,
  output              empty
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [255:0]  fifo_dout;
  wire       [12:0]   fifo_wr_data_count;
  wire       [12:0]   fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [12:0]   _zz_when_general_fifo_sync_l39;
  wire       [12:0]   _zz_when_general_fifo_sync_l39_1;
  wire       [12:0]   _zz_when_general_fifo_sync_l49;
  wire                when_general_fifo_sync_l39;
  wire                when_general_fifo_sync_l49;

  assign _zz_when_general_fifo_sync_l39 = (fifo_wr_data_count + _zz_when_general_fifo_sync_l39_1);
  assign _zz_when_general_fifo_sync_l39_1 = {1'd0, s_data_count};
  assign _zz_when_general_fifo_sync_l49 = {1'd0, m_data_count};
  fifo_sync_2 fifo (
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
  assign when_general_fifo_sync_l39 = (((! fifo_wr_rst_busy) && (_zz_when_general_fifo_sync_l39 < 13'h1000)) && (! fifo_full));
  always @(*) begin
    if(when_general_fifo_sync_l39) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l49 = ((! fifo_rd_rst_busy) && (_zz_when_general_fifo_sync_l49 <= fifo_rd_data_count));
  always @(*) begin
    if(when_general_fifo_sync_l49) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule
