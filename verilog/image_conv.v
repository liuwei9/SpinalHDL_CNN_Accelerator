// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_conv
// Git hash  : 5baa66bf9536e4a8433f01bb5557812926788a23
// Date      : 17/08/2021, 21:09:27


module image_conv (
  input               Start,
  input      [8:0]    S_Valid,
  input      [71:0]   S_DATA,
  output              S_Ready,
  output              M_Valid,
  output reg [255:0]  M_DATA,
  input               M_Ready,
  output              Conv_Complete,
  input               reset,
  input               clk
);
  wire                image_comp_ctrl_compute_fifo_ready;
  wire       [7:0]    general_fifo_sync_11_data_in;
  wire                general_fifo_sync_11_wr_en;
  wire       [7:0]    general_fifo_sync_12_data_in;
  wire                general_fifo_sync_12_wr_en;
  wire       [7:0]    general_fifo_sync_13_data_in;
  wire                general_fifo_sync_13_wr_en;
  wire       [7:0]    general_fifo_sync_14_data_in;
  wire                general_fifo_sync_14_wr_en;
  wire       [7:0]    general_fifo_sync_15_data_in;
  wire                general_fifo_sync_15_wr_en;
  wire       [7:0]    general_fifo_sync_16_data_in;
  wire                general_fifo_sync_16_wr_en;
  wire       [7:0]    general_fifo_sync_17_data_in;
  wire                general_fifo_sync_17_wr_en;
  wire       [7:0]    general_fifo_sync_18_data_in;
  wire                general_fifo_sync_18_wr_en;
  wire       [7:0]    general_fifo_sync_19_data_in;
  wire                general_fifo_sync_19_wr_en;
  wire                image_comp_ctrl_Compute_Complete;
  wire                image_comp_ctrl_Conv_Complete;
  wire                image_comp_ctrl_rd_en_fifo;
  wire                image_comp_ctrl_M_Valid;
  wire       [2:0]    image_comp_ctrl_weight_select;
  wire                general_fifo_sync_11_data_in_ready;
  wire       [7:0]    general_fifo_sync_11_data_out;
  wire                general_fifo_sync_11_data_out_valid;
  wire                general_fifo_sync_12_data_in_ready;
  wire       [7:0]    general_fifo_sync_12_data_out;
  wire                general_fifo_sync_12_data_out_valid;
  wire                general_fifo_sync_13_data_in_ready;
  wire       [7:0]    general_fifo_sync_13_data_out;
  wire                general_fifo_sync_13_data_out_valid;
  wire                general_fifo_sync_14_data_in_ready;
  wire       [7:0]    general_fifo_sync_14_data_out;
  wire                general_fifo_sync_14_data_out_valid;
  wire                general_fifo_sync_15_data_in_ready;
  wire       [7:0]    general_fifo_sync_15_data_out;
  wire                general_fifo_sync_15_data_out_valid;
  wire                general_fifo_sync_16_data_in_ready;
  wire       [7:0]    general_fifo_sync_16_data_out;
  wire                general_fifo_sync_16_data_out_valid;
  wire                general_fifo_sync_17_data_in_ready;
  wire       [7:0]    general_fifo_sync_17_data_out;
  wire                general_fifo_sync_17_data_out_valid;
  wire                general_fifo_sync_18_data_in_ready;
  wire       [7:0]    general_fifo_sync_18_data_out;
  wire                general_fifo_sync_18_data_out_valid;
  wire                general_fifo_sync_19_data_in_ready;
  wire       [7:0]    general_fifo_sync_19_data_out;
  wire                general_fifo_sync_19_data_out_valid;
  wire       [19:0]   mul_add_simd_8_dataOut;
  wire       [19:0]   mul_add_simd_9_dataOut;
  wire       [19:0]   mul_add_simd_10_dataOut;
  wire       [19:0]   mul_add_simd_11_dataOut;
  wire       [19:0]   mul_add_simd_12_dataOut;
  wire       [19:0]   mul_add_simd_13_dataOut;
  wire       [19:0]   mul_add_simd_14_dataOut;
  wire       [19:0]   mul_add_simd_15_dataOut;
  wire       [31:0]   _zz_M_DATA;
  wire       [19:0]   _zz_M_DATA_1;
  wire       [31:0]   _zz_M_DATA_2;
  wire       [19:0]   _zz_M_DATA_3;
  wire       [31:0]   _zz_M_DATA_4;
  wire       [19:0]   _zz_M_DATA_5;
  wire       [31:0]   _zz_M_DATA_6;
  wire       [19:0]   _zz_M_DATA_7;
  wire       [31:0]   _zz_M_DATA_8;
  wire       [19:0]   _zz_M_DATA_9;
  wire       [31:0]   _zz_M_DATA_10;
  wire       [19:0]   _zz_M_DATA_11;
  wire       [31:0]   _zz_M_DATA_12;
  wire       [19:0]   _zz_M_DATA_13;
  wire       [31:0]   _zz_M_DATA_14;
  wire       [19:0]   _zz_M_DATA_15;
  wire       [71:0]   weight_weight_0;
  wire       [71:0]   weight_weight_1;
  wire       [71:0]   weight_weight_2;
  wire       [71:0]   weight_weight_3;
  wire       [71:0]   weight_weight_4;
  wire       [71:0]   weight_weight_5;
  wire       [71:0]   weight_weight_6;
  wire       [71:0]   weight_weight_7;
  wire       [71:0]   weight_weight_8;
  wire       [71:0]   weight_weight_9;
  wire       [71:0]   weight_weight_10;
  wire       [71:0]   weight_weight_11;
  wire       [71:0]   weight_weight_12;
  wire       [71:0]   weight_weight_13;
  wire       [71:0]   weight_weight_14;
  wire       [71:0]   weight_weight_15;
  wire       [71:0]   weight_weight_16;
  wire       [71:0]   weight_weight_17;
  wire       [71:0]   weight_weight_18;
  wire       [71:0]   weight_weight_19;
  wire       [71:0]   weight_weight_20;
  wire       [71:0]   weight_weight_21;
  wire       [71:0]   weight_weight_22;
  wire       [71:0]   weight_weight_23;
  wire       [71:0]   weight_weight_24;
  wire       [71:0]   weight_weight_25;
  wire       [71:0]   weight_weight_26;
  wire       [71:0]   weight_weight_27;
  wire       [71:0]   weight_weight_28;
  wire       [71:0]   weight_weight_29;
  wire       [71:0]   weight_weight_30;
  wire       [71:0]   weight_weight_31;
  wire       [2:0]    weight_select;
  reg        [71:0]   weight_define_0;
  reg        [71:0]   weight_define_1;
  reg        [71:0]   weight_define_2;
  reg        [71:0]   weight_define_3;
  reg        [71:0]   weight_define_4;
  reg        [71:0]   weight_define_5;
  reg        [71:0]   weight_define_6;
  reg        [71:0]   weight_define_7;
  reg        [71:0]   fifo_out_data;
  reg        [71:0]   fifo_out_data_delay_0;
  wire       [19:0]   after_conv_data_0;
  wire       [19:0]   after_conv_data_1;
  wire       [19:0]   after_conv_data_2;
  wire       [19:0]   after_conv_data_3;
  wire       [19:0]   after_conv_data_4;
  wire       [19:0]   after_conv_data_5;
  wire       [19:0]   after_conv_data_6;
  wire       [19:0]   after_conv_data_7;

  assign _zz_M_DATA_1 = after_conv_data_0;
  assign _zz_M_DATA = {{12{_zz_M_DATA_1[19]}}, _zz_M_DATA_1};
  assign _zz_M_DATA_3 = after_conv_data_1;
  assign _zz_M_DATA_2 = {{12{_zz_M_DATA_3[19]}}, _zz_M_DATA_3};
  assign _zz_M_DATA_5 = after_conv_data_2;
  assign _zz_M_DATA_4 = {{12{_zz_M_DATA_5[19]}}, _zz_M_DATA_5};
  assign _zz_M_DATA_7 = after_conv_data_3;
  assign _zz_M_DATA_6 = {{12{_zz_M_DATA_7[19]}}, _zz_M_DATA_7};
  assign _zz_M_DATA_9 = after_conv_data_4;
  assign _zz_M_DATA_8 = {{12{_zz_M_DATA_9[19]}}, _zz_M_DATA_9};
  assign _zz_M_DATA_11 = after_conv_data_5;
  assign _zz_M_DATA_10 = {{12{_zz_M_DATA_11[19]}}, _zz_M_DATA_11};
  assign _zz_M_DATA_13 = after_conv_data_6;
  assign _zz_M_DATA_12 = {{12{_zz_M_DATA_13[19]}}, _zz_M_DATA_13};
  assign _zz_M_DATA_15 = after_conv_data_7;
  assign _zz_M_DATA_14 = {{12{_zz_M_DATA_15[19]}}, _zz_M_DATA_15};
  image_compute_ctrl image_comp_ctrl (
    .Start                 (Start                               ), //i
    .compute_fifo_ready    (image_comp_ctrl_compute_fifo_ready  ), //i
    .M_Ready               (M_Ready                             ), //i
    .Compute_Complete      (image_comp_ctrl_Compute_Complete    ), //o
    .Conv_Complete         (image_comp_ctrl_Conv_Complete       ), //o
    .rd_en_fifo            (image_comp_ctrl_rd_en_fifo          ), //o
    .M_Valid               (image_comp_ctrl_M_Valid             ), //o
    .weight_select         (image_comp_ctrl_weight_select       ), //o
    .clk                   (clk                                 ), //i
    .reset                 (reset                               )  //i
  );
  general_fifo_sync_1 general_fifo_sync_11 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_11_data_in         ), //i
    .wr_en             (general_fifo_sync_11_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_11_data_in_ready   ), //o
    .data_out          (general_fifo_sync_11_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_11_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_12 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_12_data_in         ), //i
    .wr_en             (general_fifo_sync_12_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_12_data_in_ready   ), //o
    .data_out          (general_fifo_sync_12_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_12_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_13 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_13_data_in         ), //i
    .wr_en             (general_fifo_sync_13_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_13_data_in_ready   ), //o
    .data_out          (general_fifo_sync_13_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_13_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_14 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_14_data_in         ), //i
    .wr_en             (general_fifo_sync_14_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_14_data_in_ready   ), //o
    .data_out          (general_fifo_sync_14_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_14_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_15 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_15_data_in         ), //i
    .wr_en             (general_fifo_sync_15_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_15_data_in_ready   ), //o
    .data_out          (general_fifo_sync_15_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_15_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_16 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_16_data_in         ), //i
    .wr_en             (general_fifo_sync_16_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_16_data_in_ready   ), //o
    .data_out          (general_fifo_sync_16_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_16_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_17 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_17_data_in         ), //i
    .wr_en             (general_fifo_sync_17_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_17_data_in_ready   ), //o
    .data_out          (general_fifo_sync_17_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_17_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_18 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_18_data_in         ), //i
    .wr_en             (general_fifo_sync_18_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_18_data_in_ready   ), //o
    .data_out          (general_fifo_sync_18_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_18_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  general_fifo_sync_1 general_fifo_sync_19 (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (general_fifo_sync_19_data_in         ), //i
    .wr_en             (general_fifo_sync_19_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_19_data_in_ready   ), //o
    .data_out          (general_fifo_sync_19_data_out        ), //o
    .rd_en             (image_comp_ctrl_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_19_data_out_valid  ), //o
    .m_data_count      (12'h280                              ), //i
    .s_data_count      (12'h280                              )  //i
  );
  mul_add_simd mul_add_simd_8 (
    .dataIn      (fifo_out_data_delay_0   ), //i
    .weightIn    (weight_define_0         ), //i
    .dataOut     (mul_add_simd_8_dataOut  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  mul_add_simd mul_add_simd_9 (
    .dataIn      (fifo_out_data_delay_0   ), //i
    .weightIn    (weight_define_1         ), //i
    .dataOut     (mul_add_simd_9_dataOut  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  mul_add_simd mul_add_simd_10 (
    .dataIn      (fifo_out_data_delay_0    ), //i
    .weightIn    (weight_define_2          ), //i
    .dataOut     (mul_add_simd_10_dataOut  ), //o
    .clk         (clk                      ), //i
    .reset       (reset                    )  //i
  );
  mul_add_simd mul_add_simd_11 (
    .dataIn      (fifo_out_data_delay_0    ), //i
    .weightIn    (weight_define_3          ), //i
    .dataOut     (mul_add_simd_11_dataOut  ), //o
    .clk         (clk                      ), //i
    .reset       (reset                    )  //i
  );
  mul_add_simd mul_add_simd_12 (
    .dataIn      (fifo_out_data_delay_0    ), //i
    .weightIn    (weight_define_4          ), //i
    .dataOut     (mul_add_simd_12_dataOut  ), //o
    .clk         (clk                      ), //i
    .reset       (reset                    )  //i
  );
  mul_add_simd mul_add_simd_13 (
    .dataIn      (fifo_out_data_delay_0    ), //i
    .weightIn    (weight_define_5          ), //i
    .dataOut     (mul_add_simd_13_dataOut  ), //o
    .clk         (clk                      ), //i
    .reset       (reset                    )  //i
  );
  mul_add_simd mul_add_simd_14 (
    .dataIn      (fifo_out_data_delay_0    ), //i
    .weightIn    (weight_define_6          ), //i
    .dataOut     (mul_add_simd_14_dataOut  ), //o
    .clk         (clk                      ), //i
    .reset       (reset                    )  //i
  );
  mul_add_simd mul_add_simd_15 (
    .dataIn      (fifo_out_data_delay_0    ), //i
    .weightIn    (weight_define_7          ), //i
    .dataOut     (mul_add_simd_15_dataOut  ), //o
    .clk         (clk                      ), //i
    .reset       (reset                    )  //i
  );
  assign weight_weight_0 = 72'h3ae95581a1cbd4be01;
  assign weight_weight_1 = 72'h0a767fdbccae81ce8d;
  assign weight_weight_2 = 72'h027f20f2561301f3b3;
  assign weight_weight_3 = 72'h0ad4ce7ff2c56e4a2d;
  assign weight_weight_4 = 72'h94e5eff34a7fd9016e;
  assign weight_weight_5 = 72'hc41b9a30908141b9d7;
  assign weight_weight_6 = 72'h0819c67880b45ad6d7;
  assign weight_weight_7 = 72'he53cea2b7fd13019e1;
  assign weight_weight_8 = 72'h7f3fdafe262cf8af91;
  assign weight_weight_9 = 72'h38442ce45d7fa4e01d;
  assign weight_weight_10 = 72'hd481be1763fc586edf;
  assign weight_weight_11 = 72'hd8fd22800016e42c72;
  assign weight_weight_12 = 72'h02c48018d8934043d8;
  assign weight_weight_13 = 72'h80d05bf6d238d6623f;
  assign weight_weight_14 = 72'h0480179589e816ea1e;
  assign weight_weight_15 = 72'h437f25daf6f2c617ba;
  assign weight_weight_16 = 72'h4c7f78e48c0b979b11;
  assign weight_weight_17 = 72'hcdf6804647fe15dbd4;
  assign weight_weight_18 = 72'h81bf1801ebdd2b5d16;
  assign weight_weight_19 = 72'hf4b4813fcdf824684a;
  assign weight_weight_20 = 72'h10a607d480d80fe712;
  assign weight_weight_21 = 72'h10d1357fc5f62ce59e;
  assign weight_weight_22 = 72'h9e99db80b10b03fe14;
  assign weight_weight_23 = 72'h8ccde61bc225566e7f;
  assign weight_weight_24 = 72'h80ad2c110b41214175;
  assign weight_weight_25 = 72'h49c5eb0f537fb9c1a2;
  assign weight_weight_26 = 72'ha8f71d80f3e90d0840;
  assign weight_weight_27 = 72'h49533f37f07fc5ddcf;
  assign weight_weight_28 = 72'hb21514fce17fb40c18;
  assign weight_weight_29 = 72'h7f01825f67945729dc;
  assign weight_weight_30 = 72'hcd6cff26c8b2aef47f;
  assign weight_weight_31 = 72'h12ea553b31fb80adc0;
  assign M_Valid = image_comp_ctrl_M_Valid;
  assign Conv_Complete = image_comp_ctrl_Conv_Complete;
  assign weight_select = image_comp_ctrl_weight_select;
  assign general_fifo_sync_11_data_in = S_DATA[7 : 0];
  assign general_fifo_sync_11_wr_en = S_Valid[0];
  always @(*) begin
    fifo_out_data[7 : 0] = general_fifo_sync_11_data_out;
    fifo_out_data[15 : 8] = general_fifo_sync_12_data_out;
    fifo_out_data[23 : 16] = general_fifo_sync_13_data_out;
    fifo_out_data[31 : 24] = general_fifo_sync_14_data_out;
    fifo_out_data[39 : 32] = general_fifo_sync_15_data_out;
    fifo_out_data[47 : 40] = general_fifo_sync_16_data_out;
    fifo_out_data[55 : 48] = general_fifo_sync_17_data_out;
    fifo_out_data[63 : 56] = general_fifo_sync_18_data_out;
    fifo_out_data[71 : 64] = general_fifo_sync_19_data_out;
  end

  assign general_fifo_sync_12_data_in = S_DATA[15 : 8];
  assign general_fifo_sync_12_wr_en = S_Valid[1];
  assign general_fifo_sync_13_data_in = S_DATA[23 : 16];
  assign general_fifo_sync_13_wr_en = S_Valid[2];
  assign general_fifo_sync_14_data_in = S_DATA[31 : 24];
  assign general_fifo_sync_14_wr_en = S_Valid[3];
  assign general_fifo_sync_15_data_in = S_DATA[39 : 32];
  assign general_fifo_sync_15_wr_en = S_Valid[4];
  assign general_fifo_sync_16_data_in = S_DATA[47 : 40];
  assign general_fifo_sync_16_wr_en = S_Valid[5];
  assign general_fifo_sync_17_data_in = S_DATA[55 : 48];
  assign general_fifo_sync_17_wr_en = S_Valid[6];
  assign general_fifo_sync_18_data_in = S_DATA[63 : 56];
  assign general_fifo_sync_18_wr_en = S_Valid[7];
  assign general_fifo_sync_19_data_in = S_DATA[71 : 64];
  assign general_fifo_sync_19_wr_en = S_Valid[8];
  assign S_Ready = ((general_fifo_sync_11_data_in_ready && general_fifo_sync_12_data_in_ready) && general_fifo_sync_13_data_in_ready);
  assign image_comp_ctrl_compute_fifo_ready = ((general_fifo_sync_11_data_out_valid && general_fifo_sync_12_data_out_valid) && general_fifo_sync_13_data_out_valid);
  assign after_conv_data_0 = mul_add_simd_8_dataOut;
  assign after_conv_data_1 = mul_add_simd_9_dataOut;
  assign after_conv_data_2 = mul_add_simd_10_dataOut;
  assign after_conv_data_3 = mul_add_simd_11_dataOut;
  assign after_conv_data_4 = mul_add_simd_12_dataOut;
  assign after_conv_data_5 = mul_add_simd_13_dataOut;
  assign after_conv_data_6 = mul_add_simd_14_dataOut;
  assign after_conv_data_7 = mul_add_simd_15_dataOut;
  always @(*) begin
    M_DATA[31 : 0] = _zz_M_DATA;
    M_DATA[63 : 32] = _zz_M_DATA_2;
    M_DATA[95 : 64] = _zz_M_DATA_4;
    M_DATA[127 : 96] = _zz_M_DATA_6;
    M_DATA[159 : 128] = _zz_M_DATA_8;
    M_DATA[191 : 160] = _zz_M_DATA_10;
    M_DATA[223 : 192] = _zz_M_DATA_12;
    M_DATA[255 : 224] = _zz_M_DATA_14;
  end

  always @(posedge clk) begin
    if(reset) begin
      weight_define_0 <= 72'h0;
      weight_define_1 <= 72'h0;
      weight_define_2 <= 72'h0;
      weight_define_3 <= 72'h0;
      weight_define_4 <= 72'h0;
      weight_define_5 <= 72'h0;
      weight_define_6 <= 72'h0;
      weight_define_7 <= 72'h0;
    end else begin
      case(weight_select)
        3'b001 : begin
          weight_define_0 <= weight_weight_0;
          weight_define_1 <= weight_weight_1;
          weight_define_2 <= weight_weight_2;
          weight_define_3 <= weight_weight_3;
          weight_define_4 <= weight_weight_4;
          weight_define_5 <= weight_weight_5;
          weight_define_6 <= weight_weight_6;
          weight_define_7 <= weight_weight_7;
        end
        3'b010 : begin
          weight_define_0 <= weight_weight_8;
          weight_define_1 <= weight_weight_9;
          weight_define_2 <= weight_weight_10;
          weight_define_3 <= weight_weight_11;
          weight_define_4 <= weight_weight_12;
          weight_define_5 <= weight_weight_13;
          weight_define_6 <= weight_weight_14;
          weight_define_7 <= weight_weight_15;
        end
        3'b011 : begin
          weight_define_0 <= weight_weight_16;
          weight_define_1 <= weight_weight_17;
          weight_define_2 <= weight_weight_18;
          weight_define_3 <= weight_weight_19;
          weight_define_4 <= weight_weight_20;
          weight_define_5 <= weight_weight_21;
          weight_define_6 <= weight_weight_22;
          weight_define_7 <= weight_weight_23;
        end
        3'b100 : begin
          weight_define_0 <= weight_weight_24;
          weight_define_1 <= weight_weight_25;
          weight_define_2 <= weight_weight_26;
          weight_define_3 <= weight_weight_27;
          weight_define_4 <= weight_weight_28;
          weight_define_5 <= weight_weight_29;
          weight_define_6 <= weight_weight_30;
          weight_define_7 <= weight_weight_31;
        end
        default : begin
          weight_define_0 <= 72'h0;
          weight_define_1 <= 72'h0;
          weight_define_2 <= 72'h0;
          weight_define_3 <= 72'h0;
          weight_define_4 <= 72'h0;
          weight_define_5 <= 72'h0;
          weight_define_6 <= 72'h0;
          weight_define_7 <= 72'h0;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    fifo_out_data_delay_0 <= fifo_out_data;
  end


endmodule
