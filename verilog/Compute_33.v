// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Compute_33
// Git hash  : 5e1b82d0af135d1f0cd525844f0bb03779615cb8
// Date      : 17/09/2021, 10:04:12


module Compute_33 (
  input      [2:0]    Sign,
  input      [31:0]   Reg_4,
  input      [31:0]   Reg_5,
  input      [31:0]   Reg_6,
  input      [31:0]   Reg_7,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  input               Start_Cu,
  output     [575:0]  M_DATA,
  output     [8:0]    M_DATA_Valid,
  input               M_DATA_Ready,
  input               reset,
  input               clk
);
  wire                data_generate_1_S_DATA_ready;
  wire       [575:0]  data_generate_1_M_DATA;
  wire       [8:0]    data_generate_1_M_DATA_Valid;
  wire       [10:0]   data_generate_1_RowNum_After_Padding;
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
  wire       [10:0]   Row_Num_In_REG;
  wire       [9:0]    Channel_In_Num_REG;
  wire       [10:0]   Row_Num_Out_REG;
  wire       [9:0]    Channel_Out_Num_REG;
  wire       [14:0]   Weight_Num_REG;
  wire       [7:0]    Bias_Num_REG;

  data_generate data_generate_1 (
    .Start                   (Start_Cu                              ), //i
    .S_DATA_valid            (S_DATA_valid                          ), //i
    .S_DATA_ready            (data_generate_1_S_DATA_ready          ), //o
    .S_DATA_payload          (S_DATA_payload                        ), //i
    .M_DATA                  (data_generate_1_M_DATA                ), //o
    .M_DATA_Valid            (data_generate_1_M_DATA_Valid          ), //o
    .M_DATA_Ready            (M_DATA_Ready                          ), //i
    .Row_Num_In_REG          (Row_Num_In_REG                        ), //i
    .Padding_REG             (Padding_REG                           ), //i
    .Zero_Point_REG          (Zero_Point_REG1                       ), //i
    .Zero_Num_REG            (Zero_Num_REG                          ), //i
    .Channel_In_Num_REG      (Channel_In_Num_REG                    ), //i
    .EN_Cin_Select_REG       (EN_Cin_Select_REG                     ), //i
    .RowNum_After_Padding    (data_generate_1_RowNum_After_Padding  ), //o
    .reset                   (reset                                 ), //i
    .clk                     (clk                                   )  //i
  );
  assign Zero_Point_REG1 = Cu_Instruction[127 : 120];
  assign Zero_Point_REG3 = Cu_Instruction[119 : 112];
  assign EN_Cin_Select_REG = Cu_Instruction[63];
  assign Padding_REG = Cu_Instruction[62];
  assign Stride_REG = Cu_Instruction[61];
  assign Zero_Num_REG = Cu_Instruction[60 : 58];
  assign Row_Num_In_REG = Cu_Instruction[42 : 32];
  assign Channel_In_Num_REG = Cu_Instruction[31 : 22];
  assign Row_Num_Out_REG = Cu_Instruction[21 : 11];
  assign Channel_Out_Num_REG = Cu_Instruction[9 : 0];
  assign Weight_Num_REG = Para_Instruction[62 : 48];
  assign Bias_Num_REG = Para_Instruction[47 : 40];
  assign S_DATA_ready = data_generate_1_S_DATA_ready;
  assign M_DATA = data_generate_1_M_DATA;
  assign M_DATA_Valid = data_generate_1_M_DATA_Valid;
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
