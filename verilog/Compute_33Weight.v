// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Compute_33Weight
// Git hash  : fbf001df014e844f818dd31ebd5c3686888b43b3


module Compute_33Weight (
  input      [63:0]   io_weight_data_One,
  input      [8:0]    io_weight_wr,
  input      [12:0]   io_weight_addra,
  input      [12:0]   io_weight_addrb,
  output     [1023:0] io_weight_ram_data_out_0,
  output     [1023:0] io_weight_ram_data_out_1,
  output     [1023:0] io_weight_ram_data_out_2,
  output     [1023:0] io_weight_ram_data_out_3,
  output     [1023:0] io_weight_ram_data_out_4,
  output     [1023:0] io_weight_ram_data_out_5,
  output     [1023:0] io_weight_ram_data_out_6,
  output     [1023:0] io_weight_ram_data_out_7,
  output     [1023:0] io_weight_ram_data_out_8,
  input               clk
);
  wire       [8:0]    sdpram_17_addrb;
  wire       [0:0]    sdpram_17_wea;
  wire       [8:0]    sdpram_18_addrb;
  wire       [0:0]    sdpram_18_wea;
  wire       [8:0]    sdpram_19_addrb;
  wire       [0:0]    sdpram_19_wea;
  wire       [8:0]    sdpram_20_addrb;
  wire       [0:0]    sdpram_20_wea;
  wire       [8:0]    sdpram_21_addrb;
  wire       [0:0]    sdpram_21_wea;
  wire       [8:0]    sdpram_22_addrb;
  wire       [0:0]    sdpram_22_wea;
  wire       [8:0]    sdpram_23_addrb;
  wire       [0:0]    sdpram_23_wea;
  wire       [8:0]    sdpram_24_addrb;
  wire       [0:0]    sdpram_24_wea;
  wire       [8:0]    sdpram_25_addrb;
  wire       [0:0]    sdpram_25_wea;
  wire       [1023:0] sdpram_17_doutb;
  wire       [1023:0] sdpram_18_doutb;
  wire       [1023:0] sdpram_19_doutb;
  wire       [1023:0] sdpram_20_doutb;
  wire       [1023:0] sdpram_21_doutb;
  wire       [1023:0] sdpram_22_doutb;
  wire       [1023:0] sdpram_23_doutb;
  wire       [1023:0] sdpram_24_doutb;
  wire       [1023:0] sdpram_25_doutb;

  sdpram sdpram_17 (
    .doutb    (sdpram_17_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_17_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_17_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_18 (
    .doutb    (sdpram_18_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_18_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_18_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_19 (
    .doutb    (sdpram_19_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_19_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_19_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_20 (
    .doutb    (sdpram_20_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_20_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_20_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_21 (
    .doutb    (sdpram_21_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_21_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_21_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_22 (
    .doutb    (sdpram_22_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_22_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_22_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_23 (
    .doutb    (sdpram_23_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_23_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_23_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_24 (
    .doutb    (sdpram_24_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_24_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_24_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_25 (
    .doutb    (sdpram_25_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_25_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_25_wea       ), //i
    .clk      (clk                 )  //i
  );
  assign sdpram_17_wea = io_weight_wr[0];
  assign sdpram_17_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_0 = sdpram_17_doutb;
  assign sdpram_18_wea = io_weight_wr[1];
  assign sdpram_18_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_1 = sdpram_18_doutb;
  assign sdpram_19_wea = io_weight_wr[2];
  assign sdpram_19_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_2 = sdpram_19_doutb;
  assign sdpram_20_wea = io_weight_wr[3];
  assign sdpram_20_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_3 = sdpram_20_doutb;
  assign sdpram_21_wea = io_weight_wr[4];
  assign sdpram_21_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_4 = sdpram_21_doutb;
  assign sdpram_22_wea = io_weight_wr[5];
  assign sdpram_22_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_5 = sdpram_22_doutb;
  assign sdpram_23_wea = io_weight_wr[6];
  assign sdpram_23_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_6 = sdpram_23_doutb;
  assign sdpram_24_wea = io_weight_wr[7];
  assign sdpram_24_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_7 = sdpram_24_doutb;
  assign sdpram_25_wea = io_weight_wr[8];
  assign sdpram_25_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_8 = sdpram_25_doutb;

endmodule
