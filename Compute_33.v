// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Compute_33
// Git hash  : efc1c477d46adc8af190bd5f1fd3546169f4e71c



module Compute_33 (
  input      [2:0]    Sign,
  input      [31:0]   Reg_4,
  input      [31:0]   Reg_5,
  input      [31:0]   Reg_6,
  input      [31:0]   Reg_7,
  input               clk,
  input               reset
);
  reg        [127:0]  Cu_Instruction_reg;
  reg        [127:0]  Cu_Instruction;
  reg        [127:0]  _zz_Cu_Instruction_reg;
  reg        [63:0]   Para_Instruction_reg;
  reg        [63:0]   Para_Instruction;
  reg        [63:0]   _zz_Para_Instruction_reg;

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
