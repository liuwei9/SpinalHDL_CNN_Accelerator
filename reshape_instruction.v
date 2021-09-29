// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : reshape_instruction
// Git hash  : 272f0170fdb5b57b5dfe47631c24d24b486fc69d



module reshape_instruction (
  input               Start,
  input      [31:0]   Reg_4,
  input      [31:0]   Reg_5,
  input      [31:0]   Reg_6,
  input      [31:0]   Reg_7,
  input      [31:0]   Reg_8,
  input      [31:0]   Reg_9,
  output     [10:0]   Row_Num_In_REG,
  output     [9:0]    Channel_RAM_Num_REG,
  output     [10:0]   Row_Num_Out_REG,
  output     [9:0]    Channel_In_Num_REG,
  output     [31:0]   Concat1_ZeroPoint,
  output     [31:0]   Concat2_ZeroPoint,
  output     [31:0]   Concat1_Scale,
  output     [31:0]   Concat2_Scale,
  input               clk,
  input               reset
);
  reg        [191:0]  Re_Instruction;

  assign Channel_In_Num_REG = Re_Instruction[31 : 22];
  assign Row_Num_In_REG = Re_Instruction[63 : 53];
  assign Channel_RAM_Num_REG = Re_Instruction[52 : 43];
  assign Row_Num_Out_REG = Re_Instruction[42 : 32];
  assign Concat1_Scale = Re_Instruction[95 : 64];
  assign Concat2_Scale = Re_Instruction[127 : 96];
  assign Concat1_ZeroPoint = Re_Instruction[159 : 128];
  assign Concat2_ZeroPoint = Re_Instruction[191 : 160];
  always @(posedge clk) begin
    if(Start) begin
      Re_Instruction <= {{{{{Reg_9,Reg_8},Reg_7},Reg_6},Reg_5},Reg_4};
    end else begin
      Re_Instruction <= Re_Instruction;
    end
  end


endmodule
