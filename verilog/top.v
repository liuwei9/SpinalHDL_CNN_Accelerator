// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : top
// Git hash  : 1b45fb4aa3f85cd7bbb69604ecada626903029dd
// Date      : 28/07/2021, 23:32:47


module top (
  input               io_image_Start,
  input               io_image_S_DATA_valid,
  output              io_image_S_DATA_ready,
  input      [7:0]    io_image_S_DATA_payload,
  output     [23:0]   io_M_DATA,
  output              io_M_Valid,
  input               io_M_Ready,
  input               io_M_rd_en,
  input      [11:0]   io_M_Addr,
  output              io_StartRow,
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

  image_padding image_padding_1 (
    .Start                    (io_image_Start                         ), //i
    .S_DATA_valid             (io_image_S_DATA_valid                  ), //i
    .S_DATA_ready             (image_padding_1_S_DATA_ready           ), //o
    .S_DATA_payload           (io_image_S_DATA_payload                ), //i
    .M_DATA_valid             (image_padding_1_M_DATA_valid           ), //o
    .M_DATA_ready             (image_four2three_1_S_DATA_ready        ), //i
    .M_DATA_payload           (image_padding_1_M_DATA_payload         ), //o
    .Row_Num_After_Padding    (image_padding_1_Row_Num_After_Padding  ), //o
    .Last                     (image_padding_1_Last                   ), //o
    .reset                    (reset                                  ), //i
    .clk                      (clk                                    )  //i
  );
  image_four2three image_four2three_1 (
    .Start                    (io_image_Start                         ), //i
    .StartRow                 (image_four2three_1_StartRow            ), //o
    .Row_Num_After_Padding    (image_padding_1_Row_Num_After_Padding  ), //i
    .S_DATA_valid             (image_padding_1_M_DATA_valid           ), //i
    .S_DATA_ready             (image_four2three_1_S_DATA_ready        ), //o
    .S_DATA_payload           (image_padding_1_M_DATA_payload         ), //i
    .M_DATA                   (image_four2three_1_M_DATA              ), //o
    .M_Ready                  (io_M_Ready                             ), //i
    .M_Valid                  (image_four2three_1_M_Valid             ), //o
    .M_rd_en                  (io_M_rd_en                             ), //i
    .M_Addr                   (io_M_Addr                              ), //i
    .reset                    (reset                                  ), //i
    .clk                      (clk                                    )  //i
  );
  assign io_image_S_DATA_ready = image_padding_1_S_DATA_ready;
  assign io_M_DATA = image_four2three_1_M_DATA;
  assign io_M_Valid = image_four2three_1_M_Valid;
  assign io_StartRow = image_four2three_1_StartRow;

endmodule
