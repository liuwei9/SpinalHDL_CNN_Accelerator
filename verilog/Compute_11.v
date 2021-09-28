// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Compute_11
// Git hash  : 46de7a2643940073d87fffa27badc891275ca23e


module Compute_11 (
  output              Conv_Complete,
  output              Stride_Complete,
  output              Write_Block_Complete,
  input      [2:0]    Sign,
  input      [31:0]   Reg_4,
  input      [31:0]   Reg_5,
  input      [31:0]   Reg_6,
  input      [31:0]   Reg_7,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  input               para_data_valid,
  output              para_data_ready,
  input      [63:0]   para_data_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input               Start_Pa,
  input               Start_Cu,
  output              Last_11,
  input               clk,
  input               reset
);
  wire       [0:0]    conv_norm_1_S_DATA_Valid;
  wire       [11:0]   conv_norm_1_Row_Num_Out_REG;
  wire       [11:0]   conv_norm_1_RowNum_After_Padding;
  wire       [11:0]   conv_quan_1_Row_Num_Out_REG;
  wire       [63:0]   conv_stride_1_Row_Num_Out_REG;
  wire                conv_norm_1_para_data_ready;
  wire                conv_norm_1_Write_Block_Complete;
  wire                conv_norm_1_Compute_Complete;
  wire                conv_norm_1_S_DATA_Ready;
  wire                conv_norm_1_M_DATA_valid;
  wire       [255:0]  conv_norm_1_M_DATA_payload;
  wire       [255:0]  conv_norm_1_Data_Out_Bias;
  wire       [255:0]  conv_norm_1_Data_Out_Scale;
  wire       [255:0]  conv_norm_1_Data_Out_Shift;
  wire                conv_quan_1_S_DATA_ready;
  wire       [8:0]    conv_quan_1_bias_addrb;
  wire                conv_quan_1_M_DATA_valid;
  wire       [63:0]   conv_quan_1_M_DATA_payload;
  wire                conv_stride_1_S_DATA_ready;
  wire                conv_stride_1_M_DATA_valid;
  wire       [63:0]   conv_stride_1_M_DATA_payload;
  wire                conv_stride_1_Last;
  wire                conv_stride_1_Stride_Complete;
  reg        [127:0]  Cu_Instruction_reg;
  reg        [127:0]  Cu_Instruction;
  reg        [127:0]  _zz_Cu_Instruction_reg;
  reg        [63:0]   Para_Instruction_reg;
  reg        [63:0]   Para_Instruction;
  reg        [63:0]   _zz_Para_Instruction_reg;
  wire       [7:0]    Zero_Point_REG1;
  wire       [7:0]    Zero_Point_REG3;
  wire                EN_Cin_Select_REG;
  wire                Padding_REG;
  wire                Stride_REG;
  wire       [2:0]    Zero_Num_REG;
  wire                Leaky_REG;
  wire       [10:0]   Row_Num_In_REG;
  wire       [9:0]    Channel_In_Num_REG;
  wire       [10:0]   Row_Num_Out_REG;
  wire       [9:0]    Channel_Out_Num_REG;
  wire       [15:0]   Weight_Num_REG;
  wire       [8:0]    Bias_Num_REG;

  Conv_Norm conv_norm_1 (
    .Start_Cu                 (Start_Cu                          ), //i
    .Start_Pa                 (Start_Pa                          ), //i
    .para_data_valid          (para_data_valid                   ), //i
    .para_data_ready          (conv_norm_1_para_data_ready       ), //o
    .para_data_payload        (para_data_payload                 ), //i
    .Write_Block_Complete     (conv_norm_1_Write_Block_Complete  ), //o
    .Compute_Complete         (conv_norm_1_Compute_Complete      ), //o
    .S_DATA                   (S_DATA_payload                    ), //i
    .S_DATA_Valid             (conv_norm_1_S_DATA_Valid          ), //i
    .S_DATA_Ready             (conv_norm_1_S_DATA_Ready          ), //o
    .M_DATA_valid             (conv_norm_1_M_DATA_valid          ), //o
    .M_DATA_ready             (conv_quan_1_S_DATA_ready          ), //i
    .M_DATA_payload           (conv_norm_1_M_DATA_payload        ), //o
    .Row_Num_Out_REG          (conv_norm_1_Row_Num_Out_REG       ), //i
    .RowNum_After_Padding     (conv_norm_1_RowNum_After_Padding  ), //i
    .Channel_In_Num_REG       (Channel_In_Num_REG                ), //i
    .Channel_Out_Num_REG      (Channel_Out_Num_REG               ), //i
    .Weight_Single_Num_REG    (Weight_Num_REG                    ), //i
    .Bias_Num_REG             (Bias_Num_REG                      ), //i
    .Bias_Addrb               (conv_quan_1_bias_addrb            ), //i
    .Data_Out_Bias            (conv_norm_1_Data_Out_Bias         ), //o
    .Data_Out_Scale           (conv_norm_1_Data_Out_Scale        ), //o
    .Data_Out_Shift           (conv_norm_1_Data_Out_Shift        ), //o
    .clk                      (clk                               ), //i
    .reset                    (reset                             )  //i
  );
  Conv_quan conv_quan_1 (
    .Strat                  (Start_Cu                     ), //i
    .S_DATA_valid           (conv_norm_1_M_DATA_valid     ), //i
    .S_DATA_ready           (conv_quan_1_S_DATA_ready     ), //o
    .S_DATA_payload         (conv_norm_1_M_DATA_payload   ), //i
    .bias_data_in           (conv_norm_1_Data_Out_Bias    ), //i
    .scale_data_in          (conv_norm_1_Data_Out_Scale   ), //i
    .shift_data_in          (conv_norm_1_Data_Out_Shift   ), //i
    .Zero_Point_REG3        (Zero_Point_REG3              ), //i
    .bias_addrb             (conv_quan_1_bias_addrb       ), //o
    .M_DATA_valid           (conv_quan_1_M_DATA_valid     ), //o
    .M_DATA_ready           (conv_stride_1_S_DATA_ready   ), //i
    .M_DATA_payload         (conv_quan_1_M_DATA_payload   ), //o
    .Row_Num_Out_REG        (conv_quan_1_Row_Num_Out_REG  ), //i
    .Channel_Out_Num_REG    (Channel_Out_Num_REG          ), //i
    .Leaky_REG              (Leaky_REG                    ), //i
    .reset                  (reset                        ), //i
    .clk                    (clk                          )  //i
  );
  Conv_Stride conv_stride_1 (
    .Start                  (Start_Cu                       ), //i
    .EN_Stride_REG          (Stride_REG                     ), //i
    .S_DATA_valid           (conv_quan_1_M_DATA_valid       ), //i
    .S_DATA_ready           (conv_stride_1_S_DATA_ready     ), //o
    .S_DATA_payload         (conv_quan_1_M_DATA_payload     ), //i
    .M_DATA_valid           (conv_stride_1_M_DATA_valid     ), //o
    .M_DATA_ready           (M_DATA_ready                   ), //i
    .M_DATA_payload         (conv_stride_1_M_DATA_payload   ), //o
    .Row_Num_Out_REG        (conv_stride_1_Row_Num_Out_REG  ), //i
    .Channel_Out_Num_REG    (Channel_Out_Num_REG            ), //i
    .Last                   (conv_stride_1_Last             ), //o
    .Stride_Complete        (conv_stride_1_Stride_Complete  ), //o
    .reset                  (reset                          ), //i
    .clk                    (clk                            )  //i
  );
  assign Zero_Point_REG1 = Cu_Instruction[127 : 120];
  assign Zero_Point_REG3 = Cu_Instruction[119 : 112];
  assign EN_Cin_Select_REG = Cu_Instruction[63];
  assign Padding_REG = Cu_Instruction[62];
  assign Stride_REG = Cu_Instruction[61];
  assign Zero_Num_REG = Cu_Instruction[60 : 58];
  assign Leaky_REG = Cu_Instruction[57];
  assign Row_Num_In_REG = Cu_Instruction[42 : 32];
  assign Channel_In_Num_REG = Cu_Instruction[31 : 22];
  assign Row_Num_Out_REG = Cu_Instruction[21 : 11];
  assign Channel_Out_Num_REG = Cu_Instruction[9 : 0];
  assign Weight_Num_REG = Para_Instruction[63 : 48];
  assign Bias_Num_REG = {Para_Instruction[39],Para_Instruction[47 : 40]};
  assign para_data_ready = conv_norm_1_para_data_ready;
  assign conv_norm_1_S_DATA_Valid = S_DATA_valid;
  assign S_DATA_ready = conv_norm_1_S_DATA_Ready;
  assign Write_Block_Complete = conv_norm_1_Write_Block_Complete;
  assign Conv_Complete = conv_norm_1_Compute_Complete;
  assign conv_norm_1_Row_Num_Out_REG = {1'd0, Row_Num_Out_REG};
  assign conv_quan_1_Row_Num_Out_REG = {1'd0, Row_Num_Out_REG};
  assign M_DATA_valid = conv_stride_1_M_DATA_valid;
  assign M_DATA_payload = conv_stride_1_M_DATA_payload;
  assign conv_stride_1_Row_Num_Out_REG = {53'd0, Row_Num_Out_REG};
  assign Last_11 = conv_stride_1_Last;
  assign Stride_Complete = conv_stride_1_Stride_Complete;
  always @(posedge clk) begin
    _zz_Cu_Instruction_reg <= {{{Reg_7,Reg_6},Reg_5},Reg_4};
    Cu_Instruction_reg <= _zz_Cu_Instruction_reg;
    _zz_Para_Instruction_reg <= {Reg_4,Reg_5};
    Para_Instruction_reg <= _zz_Para_Instruction_reg;
    case(Sign)
      3'b001 : begin
        Cu_Instruction <= Cu_Instruction_reg;
      end
      3'b010 : begin
        Para_Instruction <= Para_Instruction_reg;
      end
      default : begin
        Cu_Instruction <= Cu_Instruction;
        Para_Instruction <= Para_Instruction;
      end
    endcase
  end


endmodule
