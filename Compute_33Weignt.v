// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Compute_33Weignt
// Git hash  : 1b4f93df9584d340d9de49a5ab0817f8a6a13705



module Compute_33Weignt (
  input      [63:0]   io_weight_data_One,
  input      [63:0]   io_weight_data_Two,
  input      [63:0]   io_weight_data_Three,
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
  wire       [8:0]    sdpram_9_addrb;
  wire       [0:0]    sdpram_9_wea;
  wire       [8:0]    sdpram_10_addrb;
  wire       [0:0]    sdpram_10_wea;
  wire       [8:0]    sdpram_11_addrb;
  wire       [0:0]    sdpram_11_wea;
  wire       [8:0]    sdpram_12_addrb;
  wire       [0:0]    sdpram_12_wea;
  wire       [8:0]    sdpram_13_addrb;
  wire       [0:0]    sdpram_13_wea;
  wire       [8:0]    sdpram_14_addrb;
  wire       [0:0]    sdpram_14_wea;
  wire       [8:0]    sdpram_15_addrb;
  wire       [0:0]    sdpram_15_wea;
  wire       [8:0]    sdpram_16_addrb;
  wire       [0:0]    sdpram_16_wea;
  wire       [8:0]    sdpram_17_addrb;
  wire       [0:0]    sdpram_17_wea;
  wire       [1023:0] sdpram_9_doutb;
  wire       [1023:0] sdpram_10_doutb;
  wire       [1023:0] sdpram_11_doutb;
  wire       [1023:0] sdpram_12_doutb;
  wire       [1023:0] sdpram_13_doutb;
  wire       [1023:0] sdpram_14_doutb;
  wire       [1023:0] sdpram_15_doutb;
  wire       [1023:0] sdpram_16_doutb;
  wire       [1023:0] sdpram_17_doutb;

  sdpram sdpram_9 (
    .doutb    (sdpram_9_doutb      ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_9_addrb      ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_9_wea        ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_10 (
    .doutb    (sdpram_10_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_10_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_10_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_11 (
    .doutb    (sdpram_11_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_11_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_11_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_12 (
    .doutb    (sdpram_12_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_12_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_12_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_13 (
    .doutb    (sdpram_13_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_13_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_13_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_14 (
    .doutb    (sdpram_14_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_14_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_14_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_15 (
    .doutb    (sdpram_15_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_15_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_15_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_16 (
    .doutb    (sdpram_16_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_16_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_16_wea       ), //i
    .clk      (clk                 )  //i
  );
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
  assign sdpram_9_wea = io_weight_wr[0];
  assign sdpram_9_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_0 = sdpram_9_doutb;
  assign sdpram_10_wea = io_weight_wr[1];
  assign sdpram_10_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_1 = sdpram_10_doutb;
  assign sdpram_11_wea = io_weight_wr[2];
  assign sdpram_11_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_2 = sdpram_11_doutb;
  assign sdpram_12_wea = io_weight_wr[3];
  assign sdpram_12_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_3 = sdpram_12_doutb;
  assign sdpram_13_wea = io_weight_wr[4];
  assign sdpram_13_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_4 = sdpram_13_doutb;
  assign sdpram_14_wea = io_weight_wr[5];
  assign sdpram_14_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_5 = sdpram_14_doutb;
  assign sdpram_15_wea = io_weight_wr[6];
  assign sdpram_15_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_6 = sdpram_15_doutb;
  assign sdpram_16_wea = io_weight_wr[7];
  assign sdpram_16_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_7 = sdpram_16_doutb;
  assign sdpram_17_wea = io_weight_wr[8];
  assign sdpram_17_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_8 = sdpram_17_doutb;

endmodule

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

module sdpram (
  output     [1023:0] doutb,
  input      [12:0]   addra,
  input      [8:0]    addrb,
  input      [63:0]   dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [1023:0] temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(13),
    .ADDR_WIDTH_B(9),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(64),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("block"),
    .MEMORY_SIZE(524288),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(1024),
    .READ_LATENCY_B(1),
    .READ_RESET_VALUE_B("0"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_EMBEDDED_CONSTRAINT(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep"),
    .WRITE_DATA_WIDTH_A(64),
    .WRITE_MODE_B("read_first") 
  ) temp (
    .dbiterrb          (temp_dbiterrb   ), //o
    .doutb             (temp_doutb      ), //o
    .sbiterrb          (temp_sbiterrb   ), //o
    .addra             (addra           ), //i
    .addrb             (addrb           ), //i
    .clka              (clk             ), //i
    .clkb              (clk             ), //i
    .dina              (dina            ), //i
    .ena               (ena             ), //i
    .enb               (enb             ), //i
    .injectdbiterra    (injectdbiterra  ), //i
    .injectsbiterra    (injectsbiterra  ), //i
    .regceb            (regceb          ), //i
    .rstb              (rstb            ), //i
    .sleep             (sleep           ), //i
    .wea               (wea             )  //i
  );
  assign injectdbiterra = 1'b0;
  assign injectsbiterra = 1'b0;
  assign regceb = 1'b1;
  assign rstb = 1'b0;
  assign sleep = 1'b0;
  assign dbiterrb = temp_dbiterrb;
  assign doutb = temp_doutb;
  assign sbiterrb = temp_sbiterrb;

endmodule
