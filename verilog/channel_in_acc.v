// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : channel_in_acc
// Git hash  : 166ad749a20f55503ea9181f2b02d7a1ff2d73c3
// Date      : 20/09/2021, 12:49:41


module channel_in_acc (
  input      [319:0]  data_in,
  output     [31:0]   data_out,
  input               clk
);
  wire       [31:0]   channel_in_sixteen_times_acc_8_data_out;

  channel_in_sixteen_times_acc channel_in_sixteen_times_acc_8 (
    .data_in     (data_in                                  ), //i
    .data_out    (channel_in_sixteen_times_acc_8_data_out  ), //o
    .clk         (clk                                      )  //i
  );
  assign data_out = channel_in_sixteen_times_acc_8_data_out;

endmodule
