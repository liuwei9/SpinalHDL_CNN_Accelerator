// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : sprom
// Git hash  : d32cde3db027d89428574702988f88c1cdde3b16



module sprom (
  input      [18:0]   addra,
  output     [63:0]   douta,
  input               ena,
  input               clk
);
  wire                temp_dbiterra;
  wire       [63:0]   temp_douta;
  wire                temp_sbiterra;
  wire                dbiterra;
  wire                sbiterra;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regcea;
  wire                rsta;
  wire                sleep;

  xpm_memory_sprom #(
    .ADDR_WIDTH_A(19),
    .AUTO_SLEEP_TIME(0),
    .CASCADE_HEIGHT(0),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("feature__conv2_leak.mem"),
    .MEMORY_INIT_PARAM(""),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("distributed"),
    .MEMORY_SIZE(26214400),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_A(64),
    .READ_LATENCY_A(0),
    .READ_RESET_VALUE_A("0"),
    .RST_MODE_A("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep") 
  ) temp (
    .dbiterra          (temp_dbiterra   ), //o
    .douta             (temp_douta      ), //o
    .sbiterra          (temp_sbiterra   ), //o
    .addra             (addra           ), //i
    .clka              (clk             ), //i
    .ena               (ena             ), //i
    .injectdbiterra    (injectdbiterra  ), //i
    .injectsbiterra    (injectsbiterra  ), //i
    .regcea            (regcea          ), //i
    .rsta              (rsta            ), //i
    .sleep             (sleep           )  //i
  );
  assign injectdbiterra = 1'b0;
  assign injectsbiterra = 1'b0;
  assign regcea = 1'b1;
  assign rsta = 1'b0;
  assign sleep = 1'b0;
  assign dbiterra = temp_dbiterra;
  assign douta = temp_douta;
  assign sbiterra = temp_sbiterra;

endmodule
