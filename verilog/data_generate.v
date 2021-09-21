// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : data_generate
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:45


module data_generate (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output     [575:0]  M_DATA,
  output     [8:0]    M_DATA_Valid,
  input               M_DATA_Ready,
  input      [10:0]   Row_Num_In_REG,
  input               Padding_REG,
  input      [7:0]    Zero_Point_REG,
  input      [2:0]    Zero_Num_REG,
  input      [9:0]    Channel_In_Num_REG,
  input               EN_Cin_Select_REG,
  output     [10:0]   RowNum_After_Padding,
  input               reset,
  input               clk
);
  wire       [10:0]   f2t_Row_Num_After_Padding;
  wire       [10:0]   t2n_Row_Num_After_Padding;
  wire                cin_convert_1_S_DATA_ready;
  wire                cin_convert_1_M_DATA_valid;
  wire       [63:0]   cin_convert_1_M_DATA_payload;
  wire                padding_1_S_DATA_ready;
  wire                padding_1_M_DATA_valid;
  wire       [63:0]   padding_1_M_DATA_payload;
  wire       [10:0]   padding_1_RowNum_After_Padding;
  wire                f2t_StartRow;
  wire                f2t_S_DATA_ready;
  wire       [191:0]  f2t_M_DATA;
  wire                f2t_M_Valid;
  wire                t2n_S_DATA_Ready;
  wire       [10:0]   t2n_S_DATA_Addr;
  wire       [575:0]  t2n_M_Data;
  wire       [8:0]    t2n_M_Valid;
  wire                t2n_S_Ready;

  cin_convert cin_convert_1 (
    .S_DATA_valid         (S_DATA_valid                  ), //i
    .S_DATA_ready         (cin_convert_1_S_DATA_ready    ), //o
    .S_DATA_payload       (S_DATA_payload                ), //i
    .M_DATA_valid         (cin_convert_1_M_DATA_valid    ), //o
    .M_DATA_ready         (padding_1_S_DATA_ready        ), //i
    .M_DATA_payload       (cin_convert_1_M_DATA_payload  ), //o
    .EN_Cin_Select_REG    (EN_Cin_Select_REG             ), //i
    .clk                  (clk                           ), //i
    .reset                (reset                         )  //i
  );
  padding padding_1 (
    .Start                   (Start                           ), //i
    .S_DATA_valid            (cin_convert_1_M_DATA_valid      ), //i
    .S_DATA_ready            (padding_1_S_DATA_ready          ), //o
    .S_DATA_payload          (cin_convert_1_M_DATA_payload    ), //i
    .M_DATA_valid            (padding_1_M_DATA_valid          ), //o
    .M_DATA_ready            (f2t_S_DATA_ready                ), //i
    .M_DATA_payload          (padding_1_M_DATA_payload        ), //o
    .Row_Num_In_REG          (Row_Num_In_REG                  ), //i
    .Channel_In_Num_REG      (Channel_In_Num_REG              ), //i
    .Padding_REG             (Padding_REG                     ), //i
    .Zero_Point_REG          (Zero_Point_REG                  ), //i
    .Zero_Num_REG            (Zero_Num_REG                    ), //i
    .RowNum_After_Padding    (padding_1_RowNum_After_Padding  ), //o
    .reset                   (reset                           ), //i
    .clk                     (clk                             )  //i
  );
  four2three f2t (
    .Start                    (Start                      ), //i
    .StartRow                 (f2t_StartRow               ), //o
    .Row_Num_After_Padding    (f2t_Row_Num_After_Padding  ), //i
    .S_DATA_valid             (padding_1_M_DATA_valid     ), //i
    .S_DATA_ready             (f2t_S_DATA_ready           ), //o
    .S_DATA_payload           (padding_1_M_DATA_payload   ), //i
    .M_DATA                   (f2t_M_DATA                 ), //o
    .M_Ready                  (t2n_S_Ready                ), //i
    .M_Valid                  (f2t_M_Valid                ), //o
    .M_rd_en                  (t2n_S_DATA_Ready           ), //i
    .M_Addr                   (t2n_S_DATA_Addr            ), //i
    .Channel_In_Num_REG       (Channel_In_Num_REG         ), //i
    .reset                    (reset                      ), //i
    .clk                      (clk                        )  //i
  );
  three2nine t2n (
    .Start                    (Start                      ), //i
    .S_DATA                   (f2t_M_DATA                 ), //i
    .S_DATA_Valid             (f2t_M_Valid                ), //i
    .S_DATA_Ready             (t2n_S_DATA_Ready           ), //o
    .S_DATA_Addr              (t2n_S_DATA_Addr            ), //o
    .Row_Num_After_Padding    (t2n_Row_Num_After_Padding  ), //i
    .Channel_In_Num_REG       (Channel_In_Num_REG         ), //i
    .Row_Compute_Sign         (f2t_StartRow               ), //i
    .M_Data                   (t2n_M_Data                 ), //o
    .M_Ready                  (M_DATA_Ready               ), //i
    .M_Valid                  (t2n_M_Valid                ), //o
    .S_Ready                  (t2n_S_Ready                ), //o
    .clk                      (clk                        ), //i
    .reset                    (reset                      )  //i
  );
  assign S_DATA_ready = cin_convert_1_S_DATA_ready;
  assign RowNum_After_Padding = padding_1_RowNum_After_Padding;
  assign f2t_Row_Num_After_Padding = padding_1_RowNum_After_Padding;
  assign M_DATA_Valid = t2n_M_Valid;
  assign M_DATA = t2n_M_Data;
  assign t2n_Row_Num_After_Padding = padding_1_RowNum_After_Padding;

endmodule
