// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : top
// Git hash  : e8c442bcca73bbd2bccec93ed3ca9d5596923c97
// Date      : 13/08/2021, 20:40:20


module top (
  input               image_Start,
  input               image_S_DATA_valid,
  output              image_S_DATA_ready,
  input      [7:0]    image_S_DATA_payload,
  output     [255:0]  M_DATA,
  output              M_Valid,
  input               M_Ready,
  output              Conv_Complete,
  input               reset,
  input               clk
);
  wire                image_padding_1_S_DATA_ready;
  wire                image_padding_1_M_DATA_valid;
  wire       [7:0]    image_padding_1_M_DATA_payload;
  wire       [11:0]   image_padding_1_Row_Num_After_Padding;
  wire                image_padding_1_Last;
  wire                image_four2three_1_StartRow;
  wire                image_four2three_1_S_DATA_ready;
  wire       [23:0]   image_four2three_1_M_DATA;
  wire                image_four2three_1_M_Valid;
  wire                image_three2nine_S_DATA_Ready;
  wire       [11:0]   image_three2nine_S_DATA_Addr;
  wire       [71:0]   image_three2nine_M_Data;
  wire       [8:0]    image_three2nine_M_Valid;
  wire                image_three2nine_S_Ready;
  wire                image_conv_1_S_Ready;
  wire                image_conv_1_M_Valid;
  wire       [255:0]  image_conv_1_M_DATA;
  wire                image_conv_1_Conv_Complete;

  image_padding image_padding_1 (
    .Start                    (image_Start                            ), //i
    .S_DATA_valid             (image_S_DATA_valid                     ), //i
    .S_DATA_ready             (image_padding_1_S_DATA_ready           ), //o
    .S_DATA_payload           (image_S_DATA_payload                   ), //i
    .M_DATA_valid             (image_padding_1_M_DATA_valid           ), //o
    .M_DATA_ready             (image_four2three_1_S_DATA_ready        ), //i
    .M_DATA_payload           (image_padding_1_M_DATA_payload         ), //o
    .Row_Num_After_Padding    (image_padding_1_Row_Num_After_Padding  ), //o
    .Last                     (image_padding_1_Last                   ), //o
    .reset                    (reset                                  ), //i
    .clk                      (clk                                    )  //i
  );
  image_four2three image_four2three_1 (
    .Start                    (image_Start                            ), //i
    .StartRow                 (image_four2three_1_StartRow            ), //o
    .Row_Num_After_Padding    (image_padding_1_Row_Num_After_Padding  ), //i
    .S_DATA_valid             (image_padding_1_M_DATA_valid           ), //i
    .S_DATA_ready             (image_four2three_1_S_DATA_ready        ), //o
    .S_DATA_payload           (image_padding_1_M_DATA_payload         ), //i
    .M_DATA                   (image_four2three_1_M_DATA              ), //o
    .M_Ready                  (image_three2nine_S_Ready               ), //i
    .M_Valid                  (image_four2three_1_M_Valid             ), //o
    .M_rd_en                  (image_three2nine_S_DATA_Ready          ), //i
    .M_Addr                   (image_three2nine_S_DATA_Addr           ), //i
    .reset                    (reset                                  ), //i
    .clk                      (clk                                    )  //i
  );
  three2nine image_three2nine (
    .Start                    (image_Start                            ), //i
    .S_DATA                   (image_four2three_1_M_DATA              ), //i
    .S_DATA_Valid             (image_four2three_1_M_Valid             ), //i
    .S_DATA_Ready             (image_three2nine_S_DATA_Ready          ), //o
    .S_DATA_Addr              (image_three2nine_S_DATA_Addr           ), //o
    .Row_Num_After_Padding    (image_padding_1_Row_Num_After_Padding  ), //i
    .Row_Compute_Sign         (image_four2three_1_StartRow            ), //i
    .M_Data                   (image_three2nine_M_Data                ), //o
    .M_Ready                  (image_conv_1_S_Ready                   ), //i
    .M_Valid                  (image_three2nine_M_Valid               ), //o
    .S_Ready                  (image_three2nine_S_Ready               ), //o
    .clk                      (clk                                    ), //i
    .reset                    (reset                                  )  //i
  );
  image_conv image_conv_1 (
    .Start            (image_Start                 ), //i
    .S_Valid          (image_three2nine_M_Valid    ), //i
    .S_DATA           (image_three2nine_M_Data     ), //i
    .S_Ready          (image_conv_1_S_Ready        ), //o
    .M_Valid          (image_conv_1_M_Valid        ), //o
    .M_DATA           (image_conv_1_M_DATA         ), //o
    .M_Ready          (M_Ready                     ), //i
    .Conv_Complete    (image_conv_1_Conv_Complete  ), //o
    .reset            (reset                       ), //i
    .clk              (clk                         )  //i
  );
  assign image_S_DATA_ready = image_padding_1_S_DATA_ready;
  assign M_Valid = image_conv_1_M_Valid;
  assign M_DATA = image_conv_1_M_DATA;
  assign Conv_Complete = image_conv_1_Conv_Complete;

endmodule
