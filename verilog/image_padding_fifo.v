// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_padding_fifo
// Git hash  : 4a3cffa6a82f86452f11e887963137268ca9c148
// Date      : 11/08/2021, 22:11:06


module image_padding_fifo (
  input               reset,
  input               clk,
  input      [7:0]    data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [7:0]    data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [11:0]   m_data_count
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [7:0]    fifo_dout;
  wire       [10:0]   fifo_wr_data_count;
  wire       [10:0]   fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [11:0]   _zz_when_image_padding_fifo_l38;
  wire       [10:0]   _zz_when_image_padding_fifo_l38_1;
  wire                when_image_padding_fifo_l33;
  wire                when_image_padding_fifo_l38;

  assign _zz_when_image_padding_fifo_l38_1 = fifo_rd_data_count;
  assign _zz_when_image_padding_fifo_l38 = {1'd0, _zz_when_image_padding_fifo_l38_1};
  image_padding_fifo_sync fifo (
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
  assign when_image_padding_fifo_l33 = (((! fifo_wr_rst_busy) && (! fifo_full)) && (fifo_wr_data_count < 11'h3f6));
  always @(*) begin
    if(when_image_padding_fifo_l33) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_image_padding_fifo_l38 = ((! fifo_rd_rst_busy) && (m_data_count <= _zz_when_image_padding_fifo_l38));
  always @(*) begin
    if(when_image_padding_fifo_l38) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule
