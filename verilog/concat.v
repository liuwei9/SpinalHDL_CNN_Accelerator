// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : concat
// Git hash  : 0e6a3ebbe013921c1c094a4a70c6b764aaf2f29f


module concat (
  input               Start,
  input      [31:0]   Reg_4,
  input      [31:0]   Reg_5,
  input      [31:0]   Reg_6,
  input      [31:0]   Reg_7,
  input      [31:0]   Reg_8,
  input      [31:0]   Reg_9,
  input               S_DATA_1_valid,
  output              S_DATA_1_ready,
  input      [63:0]   S_DATA_1_payload,
  input               S_DATA_2_valid,
  output              S_DATA_2_ready,
  input      [63:0]   S_DATA_2_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  output              Last_Concat,
  input               reset,
  input               clk
);
  wire       [10:0]   reshape_instruction_1_Row_Num_In_REG;
  wire       [9:0]    reshape_instruction_1_Channel_RAM_Num_REG;
  wire       [10:0]   reshape_instruction_1_Row_Num_Out_REG;
  wire       [9:0]    reshape_instruction_1_Channel_In_Num_REG;
  wire       [31:0]   reshape_instruction_1_Concat1_ZeroPoint;
  wire       [31:0]   reshape_instruction_1_Concat2_ZeroPoint;
  wire       [31:0]   reshape_instruction_1_Concat1_Scale;
  wire       [31:0]   reshape_instruction_1_Concat2_Scale;
  wire                concat_final_1_Connect_Complete;
  wire                concat_final_1_S_DATA_1_ready;
  wire                concat_final_1_S_DATA_2_ready;
  wire                concat_final_1_M_DATA_valid;
  wire       [63:0]   concat_final_1_M_DATA_payload;
  wire                concat_final_1_Last_Concat;

  reshape_instruction reshape_instruction_1 (
    .Start                  (Start                                      ), //i
    .Reg_4                  (Reg_4                                      ), //i
    .Reg_5                  (Reg_5                                      ), //i
    .Reg_6                  (Reg_6                                      ), //i
    .Reg_7                  (Reg_7                                      ), //i
    .Reg_8                  (Reg_8                                      ), //i
    .Reg_9                  (Reg_9                                      ), //i
    .Row_Num_In_REG         (reshape_instruction_1_Row_Num_In_REG       ), //o
    .Channel_RAM_Num_REG    (reshape_instruction_1_Channel_RAM_Num_REG  ), //o
    .Row_Num_Out_REG        (reshape_instruction_1_Row_Num_Out_REG      ), //o
    .Channel_In_Num_REG     (reshape_instruction_1_Channel_In_Num_REG   ), //o
    .Concat1_ZeroPoint      (reshape_instruction_1_Concat1_ZeroPoint    ), //o
    .Concat2_ZeroPoint      (reshape_instruction_1_Concat2_ZeroPoint    ), //o
    .Concat1_Scale          (reshape_instruction_1_Concat1_Scale        ), //o
    .Concat2_Scale          (reshape_instruction_1_Concat2_Scale        ), //o
    .clk                    (clk                                        ), //i
    .reset                  (reset                                      )  //i
  );
  concat_final concat_final_1 (
    .Start                  (Start                                      ), //i
    .Row_Num_Out_REG        (reshape_instruction_1_Row_Num_Out_REG      ), //i
    .Channel_Ram_Part       (reshape_instruction_1_Channel_RAM_Num_REG  ), //i
    .Channel_Direct_Part    (reshape_instruction_1_Channel_In_Num_REG   ), //i
    .Row_Num_In_REG         (reshape_instruction_1_Row_Num_In_REG       ), //i
    .Connect_Complete       (concat_final_1_Connect_Complete            ), //o
    .S_DATA_1_valid         (S_DATA_1_valid                             ), //i
    .S_DATA_1_ready         (concat_final_1_S_DATA_1_ready              ), //o
    .S_DATA_1_payload       (S_DATA_1_payload                           ), //i
    .S_DATA_2_valid         (S_DATA_2_valid                             ), //i
    .S_DATA_2_ready         (concat_final_1_S_DATA_2_ready              ), //o
    .S_DATA_2_payload       (S_DATA_2_payload                           ), //i
    .Concat1_ZeroPoint      (reshape_instruction_1_Concat1_ZeroPoint    ), //i
    .Concat2_ZeroPoint      (reshape_instruction_1_Concat2_ZeroPoint    ), //i
    .Concat1_Scale          (reshape_instruction_1_Concat1_Scale        ), //i
    .Concat2_Scale          (reshape_instruction_1_Concat2_Scale        ), //i
    .M_DATA_valid           (concat_final_1_M_DATA_valid                ), //o
    .M_DATA_ready           (M_DATA_ready                               ), //i
    .M_DATA_payload         (concat_final_1_M_DATA_payload              ), //o
    .Last_Concat            (concat_final_1_Last_Concat                 ), //o
    .reset                  (reset                                      ), //i
    .clk                    (clk                                        )  //i
  );
  assign S_DATA_1_ready = concat_final_1_S_DATA_1_ready;
  assign S_DATA_2_ready = concat_final_1_S_DATA_2_ready;
  assign M_DATA_valid = concat_final_1_M_DATA_valid;
  assign M_DATA_payload = concat_final_1_M_DATA_payload;
  assign Last_Concat = concat_final_1_Last_Concat;

endmodule
