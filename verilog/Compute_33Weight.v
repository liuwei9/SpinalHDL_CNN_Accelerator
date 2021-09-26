// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Compute_33Weight
// Git hash  : b694a57c8f5c199d7fd0af5809d5f7d2954eb351


module Compute_33Weight (
  input      [63:0]   io_weight_data_One,
  input      [0:0]    io_weight_wr,
  input      [14:0]   io_weight_addra,
  input      [14:0]   io_weight_addrb,
  output     [2047:0] io_weight_ram_data_out_0,
  input               clk
);
  wire       [9:0]    sdpram_5_addrb;
  wire       [0:0]    sdpram_5_wea;
  wire       [2047:0] sdpram_5_doutb;

  sdpram sdpram_5 (
    .doutb    (sdpram_5_doutb      ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_5_addrb      ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_5_wea        ), //i
    .clk      (clk                 )  //i
  );
  assign sdpram_5_wea = io_weight_wr[0];
  assign sdpram_5_addrb = io_weight_addrb[9:0];
  assign io_weight_ram_data_out_0 = sdpram_5_doutb;

endmodule
