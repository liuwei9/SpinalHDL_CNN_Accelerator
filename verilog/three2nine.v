// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : three2nine
// Git hash  : c12011d1e8655c6f5dcb4228add939efcb9499aa
// Date      : 20/08/2021, 22:45:46


module three2nine (
  input               Start,
  input      [23:0]   S_DATA,
  input               S_DATA_Valid,
  output reg          S_DATA_Ready,
  output reg [11:0]   S_DATA_Addr,
  input      [11:0]   Row_Num_After_Padding,
  input               Row_Compute_Sign,
  output reg [71:0]   M_Data,
  input               M_Ready,
  output reg [8:0]    M_Valid,
  output reg          S_Ready,
  input               clk,
  input               reset
);
  wire       [11:0]   _zz_when_three2nine_l40;
  wire       [11:0]   _zz_when_three2nine_l53;
  wire       [11:0]   _zz_when_three2nine_l73;
  wire       [11:0]   _zz_when_three2nine_l82;
  wire                three2nine_fsm_wantExit;
  reg                 three2nine_fsm_wantStart;
  wire                three2nine_fsm_wantKill;
  reg                 three2nine_fsm_EN_ComputeRow_Read;
  reg        [11:0]   three2nine_fsm_Cnt_COl;
  wire                when_three2nine_l35;
  wire                when_three2nine_l37;
  wire                when_three2nine_l40;
  reg                 three2nine_fsm_EN_Judge_LastRow;
  reg        [11:0]   three2nine_fsm_Cnt_Row;
  wire                when_three2nine_l46;
  wire                when_three2nine_l48;
  wire                when_three2nine_l53;
  wire                when_three2nine_l59;
  wire                when_three2nine_l65;
  wire                when_three2nine_l71;
  wire                when_three2nine_l73;
  wire                when_three2nine_l82;
  wire                when_three2nine_l91;
  reg        `three2nine_fsm_enumDefinition_binary_sequential_type three2nine_fsm_stateReg;
  reg        `three2nine_fsm_enumDefinition_binary_sequential_type three2nine_fsm_stateNext;
  `ifndef SYNTHESIS
  reg [239:0] three2nine_fsm_stateReg_string;
  reg [239:0] three2nine_fsm_stateNext_string;
  `endif


  assign _zz_when_three2nine_l40 = (Row_Num_After_Padding - 12'h001);
  assign _zz_when_three2nine_l53 = (Row_Num_After_Padding - 12'h002);
  assign _zz_when_three2nine_l73 = (Row_Num_After_Padding - 12'h002);
  assign _zz_when_three2nine_l82 = (Row_Num_After_Padding - 12'h001);
  `ifndef SYNTHESIS
  always @(*) begin
    case(three2nine_fsm_stateReg)
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_BOOT : three2nine_fsm_stateReg_string = "three2nine_fsm_BOOT           ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE : three2nine_fsm_stateReg_string = "three2nine_fsm_IDLE           ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait : three2nine_fsm_stateReg_string = "three2nine_fsm_Start_Wait     ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_FIFO : three2nine_fsm_stateReg_string = "three2nine_fsm_Judge_FIFO     ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read : three2nine_fsm_stateReg_string = "three2nine_fsm_ComputeRow_Read";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow : three2nine_fsm_stateReg_string = "three2nine_fsm_Judge_LastRow  ";
      default : three2nine_fsm_stateReg_string = "??????????????????????????????";
    endcase
  end
  always @(*) begin
    case(three2nine_fsm_stateNext)
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_BOOT : three2nine_fsm_stateNext_string = "three2nine_fsm_BOOT           ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE : three2nine_fsm_stateNext_string = "three2nine_fsm_IDLE           ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait : three2nine_fsm_stateNext_string = "three2nine_fsm_Start_Wait     ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_FIFO : three2nine_fsm_stateNext_string = "three2nine_fsm_Judge_FIFO     ";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read : three2nine_fsm_stateNext_string = "three2nine_fsm_ComputeRow_Read";
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow : three2nine_fsm_stateNext_string = "three2nine_fsm_Judge_LastRow  ";
      default : three2nine_fsm_stateNext_string = "??????????????????????????????";
    endcase
  end
  `endif

  assign three2nine_fsm_wantExit = 1'b0;
  always @(*) begin
    three2nine_fsm_wantStart = 1'b0;
    case(three2nine_fsm_stateReg)
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE : begin
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait : begin
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_FIFO : begin
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read : begin
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow : begin
      end
      default : begin
        three2nine_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign three2nine_fsm_wantKill = 1'b0;
  assign when_three2nine_l40 = (three2nine_fsm_Cnt_COl == _zz_when_three2nine_l40);
  always @(*) begin
    if(when_three2nine_l40) begin
      three2nine_fsm_EN_ComputeRow_Read = 1'b1;
    end else begin
      three2nine_fsm_EN_ComputeRow_Read = 1'b0;
    end
  end

  assign when_three2nine_l53 = (three2nine_fsm_Cnt_Row == _zz_when_three2nine_l53);
  always @(*) begin
    if(when_three2nine_l53) begin
      three2nine_fsm_EN_Judge_LastRow = 1'b1;
    end else begin
      three2nine_fsm_EN_Judge_LastRow = 1'b0;
    end
  end

  always @(*) begin
    if(when_three2nine_l59) begin
      S_DATA_Ready = 1'b1;
    end else begin
      S_DATA_Ready = 1'b0;
    end
  end

  always @(*) begin
    if(when_three2nine_l65) begin
      S_Ready = 1'b1;
    end else begin
      S_Ready = 1'b0;
    end
  end

  always @(*) begin
    M_Data[23 : 0] = {{S_DATA[7 : 0],S_DATA[7 : 0]},S_DATA[7 : 0]};
    M_Data[47 : 24] = {{S_DATA[15 : 8],S_DATA[15 : 8]},S_DATA[15 : 8]};
    M_Data[71 : 48] = {{S_DATA[23 : 16],S_DATA[23 : 16]},S_DATA[23 : 16]};
  end

  assign when_three2nine_l73 = (three2nine_fsm_Cnt_COl < _zz_when_three2nine_l73);
  assign when_three2nine_l82 = ((12'h0 < three2nine_fsm_Cnt_COl) && (three2nine_fsm_Cnt_COl < _zz_when_three2nine_l82));
  assign when_three2nine_l91 = ((12'h001 < three2nine_fsm_Cnt_COl) && (three2nine_fsm_Cnt_COl < Row_Num_After_Padding));
  always @(*) begin
    three2nine_fsm_stateNext = three2nine_fsm_stateReg;
    case(three2nine_fsm_stateReg)
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE : begin
        if(Start) begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait;
        end else begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE;
        end
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait : begin
        if(Row_Compute_Sign) begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_FIFO;
        end else begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait;
        end
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_FIFO : begin
        if(M_Ready) begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read;
        end else begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_FIFO;
        end
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read : begin
        if(three2nine_fsm_EN_ComputeRow_Read) begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow;
        end else begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read;
        end
      end
      `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow : begin
        if(three2nine_fsm_EN_Judge_LastRow) begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE;
        end else begin
          three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait;
        end
      end
      default : begin
      end
    endcase
    if(three2nine_fsm_wantStart) begin
      three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE;
    end
    if(three2nine_fsm_wantKill) begin
      three2nine_fsm_stateNext = `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_BOOT;
    end
  end

  assign when_three2nine_l35 = (three2nine_fsm_stateReg == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read);
  assign when_three2nine_l37 = (three2nine_fsm_stateReg == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read);
  assign when_three2nine_l46 = ((three2nine_fsm_stateNext == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow) && (three2nine_fsm_stateReg != `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Judge_LastRow));
  assign when_three2nine_l48 = (three2nine_fsm_stateReg == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_IDLE);
  assign when_three2nine_l59 = (three2nine_fsm_stateReg == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read);
  assign when_three2nine_l65 = (three2nine_fsm_stateReg == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_Start_Wait);
  assign when_three2nine_l71 = (three2nine_fsm_stateReg == `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_ComputeRow_Read);
  always @(posedge clk) begin
    if(reset) begin
      S_DATA_Addr <= 12'h0;
      M_Valid <= 9'h0;
      three2nine_fsm_Cnt_COl <= 12'h0;
      three2nine_fsm_Cnt_Row <= 12'h0;
      three2nine_fsm_stateReg <= `three2nine_fsm_enumDefinition_binary_sequential_three2nine_fsm_BOOT;
    end else begin
      if(when_three2nine_l35) begin
        three2nine_fsm_Cnt_COl <= (three2nine_fsm_Cnt_COl + 12'h001);
      end else begin
        if(when_three2nine_l37) begin
          three2nine_fsm_Cnt_COl <= three2nine_fsm_Cnt_COl;
        end else begin
          three2nine_fsm_Cnt_COl <= 12'h0;
        end
      end
      if(when_three2nine_l46) begin
        three2nine_fsm_Cnt_Row <= (three2nine_fsm_Cnt_Row + 12'h001);
      end else begin
        if(when_three2nine_l48) begin
          three2nine_fsm_Cnt_Row <= 12'h0;
        end else begin
          three2nine_fsm_Cnt_Row <= three2nine_fsm_Cnt_Row;
        end
      end
      if(S_DATA_Ready) begin
        S_DATA_Addr <= (S_DATA_Addr + 12'h001);
      end else begin
        S_DATA_Addr <= 12'h0;
      end
      if(when_three2nine_l71) begin
        if(when_three2nine_l73) begin
          M_Valid[0] <= 1'b1;
          M_Valid[3] <= 1'b1;
          M_Valid[6] <= 1'b1;
        end else begin
          M_Valid[0] <= 1'b0;
          M_Valid[3] <= 1'b0;
          M_Valid[6] <= 1'b0;
        end
        if(when_three2nine_l82) begin
          M_Valid[1] <= 1'b1;
          M_Valid[4] <= 1'b1;
          M_Valid[7] <= 1'b1;
        end else begin
          M_Valid[1] <= 1'b0;
          M_Valid[4] <= 1'b0;
          M_Valid[7] <= 1'b0;
        end
        if(when_three2nine_l91) begin
          M_Valid[2] <= 1'b1;
          M_Valid[5] <= 1'b1;
          M_Valid[8] <= 1'b1;
        end else begin
          M_Valid[2] <= 1'b0;
          M_Valid[5] <= 1'b0;
          M_Valid[8] <= 1'b0;
        end
      end else begin
        M_Valid <= 9'h0;
      end
      three2nine_fsm_stateReg <= three2nine_fsm_stateNext;
    end
  end


endmodule
