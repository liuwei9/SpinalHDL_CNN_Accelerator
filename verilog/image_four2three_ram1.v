// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_four2three_ram1
// Git hash  : 1b45fb4aa3f85cd7bbb69604ecada626903029dd
// Date      : 28/07/2021, 23:32:47


module image_four2three_ram1 (
  output     [7:0]    doutb,
  input      [9:0]    addra,
  input      [9:0]    addrb,
  input      [7:0]    dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [7:0]    temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(8),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("distributed"),
    .MEMORY_SIZE(5136),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(8),
    .READ_LATENCY_B(0),
    .READ_RESET_VALUE_B("0"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_EMBEDDED_CONSTRAINT(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep"),
    .WRITE_DATA_WIDTH_A(8),
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
