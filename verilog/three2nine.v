// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : three2nine
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:44


module three2nine (
  input               Start,
  input      [191:0]  S_DATA,
  input               S_DATA_Valid,
  output reg          S_DATA_Ready,
  output reg [10:0]   S_DATA_Addr,
  input      [10:0]   Row_Num_After_Padding,
  input      [9:0]    Channel_In_Num_REG,
  input               Row_Compute_Sign,
  output reg [575:0]  M_Data,
  input               M_Ready,
  output reg [8:0]    M_Valid,
  output reg          S_Ready,
  input               clk,
  input               reset
);
  wire       [9:0]    _zz_when_three2nine_l39;
  wire       [6:0]    _zz_when_three2nine_l39_1;
  wire       [10:0]   _zz_when_three2nine_l56;
  wire       [10:0]   _zz_when_three2nine_l71;
  wire       [10:0]   _zz_when_three2nine_l105;
  wire       [10:0]   _zz_when_three2nine_l114;
  wire       [6:0]    Channel_Times;
  wire                t2n_fsm_wantExit;
  reg                 t2n_fsm_wantStart;
  wire                t2n_fsm_wantKill;
  reg        [9:0]    t2n_fsm_Cnt_Cin;
  reg                 t2n_fsm_EN_Last_Cin;
  wire                when_three2nine_l39;
  wire                when_three2nine_l44;
  reg        [10:0]   t2n_fsm_Cnt_Column;
  reg                 t2n_fsm_EN_ComputeRow_Read;
  wire                when_three2nine_l56;
  wire                when_three2nine_l59;
  reg        [10:0]   t2n_fsm_Cnt_Row;
  reg                 t2n_fsm_EN_Judge_LastRow;
  wire                when_three2nine_l71;
  wire                when_three2nine_l77;
  wire                when_three2nine_l79;
  wire                when_three2nine_l85;
  wire                when_three2nine_l95;
  wire                when_three2nine_l103;
  wire                when_three2nine_l105;
  wire                when_three2nine_l114;
  wire                when_three2nine_l123;
  reg        `t2n_fsm_enumDefinition_binary_sequential_type t2n_fsm_stateReg;
  reg        `t2n_fsm_enumDefinition_binary_sequential_type t2n_fsm_stateNext;
  wire                when_three2nine_l156;
  `ifndef SYNTHESIS
  reg [183:0] t2n_fsm_stateReg_string;
  reg [183:0] t2n_fsm_stateNext_string;
  `endif


  assign _zz_when_three2nine_l39_1 = (Channel_Times - 7'h01);
  assign _zz_when_three2nine_l39 = {3'd0, _zz_when_three2nine_l39_1};
  assign _zz_when_three2nine_l56 = (Row_Num_After_Padding - 11'h001);
  assign _zz_when_three2nine_l71 = (Row_Num_After_Padding - 11'h002);
  assign _zz_when_three2nine_l105 = (Row_Num_After_Padding - 11'h002);
  assign _zz_when_three2nine_l114 = (Row_Num_After_Padding - 11'h001);
  `ifndef SYNTHESIS
  always @(*) begin
    case(t2n_fsm_stateReg)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT : t2n_fsm_stateReg_string = "t2n_fsm_BOOT           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : t2n_fsm_stateReg_string = "t2n_fsm_IDLE           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : t2n_fsm_stateReg_string = "t2n_fsm_Start_Wait     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : t2n_fsm_stateReg_string = "t2n_fsm_Judge_FIFO     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : t2n_fsm_stateReg_string = "t2n_fsm_ComputeRow_Read";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : t2n_fsm_stateReg_string = "t2n_fsm_Judge_LastRow  ";
      default : t2n_fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(t2n_fsm_stateNext)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT : t2n_fsm_stateNext_string = "t2n_fsm_BOOT           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : t2n_fsm_stateNext_string = "t2n_fsm_IDLE           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : t2n_fsm_stateNext_string = "t2n_fsm_Start_Wait     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : t2n_fsm_stateNext_string = "t2n_fsm_Judge_FIFO     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : t2n_fsm_stateNext_string = "t2n_fsm_ComputeRow_Read";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : t2n_fsm_stateNext_string = "t2n_fsm_Judge_LastRow  ";
      default : t2n_fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_In_Num_REG >>> 3);
  assign t2n_fsm_wantExit = 1'b0;
  always @(*) begin
    t2n_fsm_wantStart = 1'b0;
    case(t2n_fsm_stateReg)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : begin
      end
      default : begin
        t2n_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign t2n_fsm_wantKill = 1'b0;
  assign when_three2nine_l39 = (t2n_fsm_Cnt_Cin == _zz_when_three2nine_l39);
  always @(*) begin
    if(when_three2nine_l39) begin
      t2n_fsm_EN_Last_Cin = 1'b1;
    end else begin
      t2n_fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_three2nine_l56 = (t2n_fsm_Cnt_Column == _zz_when_three2nine_l56);
  always @(*) begin
    if(when_three2nine_l56) begin
      t2n_fsm_EN_ComputeRow_Read = 1'b1;
    end else begin
      t2n_fsm_EN_ComputeRow_Read = 1'b0;
    end
  end

  assign when_three2nine_l71 = (t2n_fsm_Cnt_Row == _zz_when_three2nine_l71);
  always @(*) begin
    if(when_three2nine_l71) begin
      t2n_fsm_EN_Judge_LastRow = 1'b1;
    end else begin
      t2n_fsm_EN_Judge_LastRow = 1'b0;
    end
  end

  always @(*) begin
    if(when_three2nine_l85) begin
      S_DATA_Ready = 1'b1;
    end else begin
      S_DATA_Ready = 1'b0;
    end
  end

  always @(*) begin
    if(when_three2nine_l95) begin
      S_Ready = 1'b1;
    end else begin
      S_Ready = 1'b0;
    end
  end

  always @(*) begin
    M_Data[191 : 0] = {{S_DATA[63 : 0],S_DATA[63 : 0]},S_DATA[63 : 0]};
    M_Data[383 : 192] = {{S_DATA[127 : 64],S_DATA[127 : 64]},S_DATA[127 : 64]};
    M_Data[575 : 384] = {{S_DATA[191 : 128],S_DATA[191 : 128]},S_DATA[191 : 128]};
  end

  assign when_three2nine_l105 = (t2n_fsm_Cnt_Column < _zz_when_three2nine_l105);
  assign when_three2nine_l114 = ((11'h0 < t2n_fsm_Cnt_Column) && (t2n_fsm_Cnt_Column < _zz_when_three2nine_l114));
  assign when_three2nine_l123 = ((11'h001 < t2n_fsm_Cnt_Column) && (t2n_fsm_Cnt_Column < Row_Num_After_Padding));
  always @(*) begin
    t2n_fsm_stateNext = t2n_fsm_stateReg;
    case(t2n_fsm_stateReg)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : begin
        if(Start) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : begin
        if(Row_Compute_Sign) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : begin
        if(M_Ready) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : begin
        if(when_three2nine_l156) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : begin
        if(t2n_fsm_EN_Judge_LastRow) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait;
        end
      end
      default : begin
      end
    endcase
    if(t2n_fsm_wantStart) begin
      t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE;
    end
    if(t2n_fsm_wantKill) begin
      t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT;
    end
  end

  assign when_three2nine_l156 = (t2n_fsm_EN_ComputeRow_Read && t2n_fsm_EN_Last_Cin);
  assign when_three2nine_l44 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  assign when_three2nine_l59 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  assign when_three2nine_l77 = ((t2n_fsm_stateNext == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow) && (t2n_fsm_stateReg != `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow));
  assign when_three2nine_l79 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE);
  assign when_three2nine_l85 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  assign when_three2nine_l95 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait);
  assign when_three2nine_l103 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  always @(posedge clk) begin
    if(reset) begin
      S_DATA_Addr <= 11'h0;
      M_Valid <= 9'h0;
      t2n_fsm_stateReg <= `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT;
    end else begin
      if(S_DATA_Ready) begin
        S_DATA_Addr <= (S_DATA_Addr + 11'h001);
      end else begin
        S_DATA_Addr <= 11'h0;
      end
      if(when_three2nine_l103) begin
        if(when_three2nine_l105) begin
          M_Valid[0] <= 1'b1;
          M_Valid[3] <= 1'b1;
          M_Valid[6] <= 1'b1;
        end else begin
          M_Valid[0] <= 1'b0;
          M_Valid[3] <= 1'b0;
          M_Valid[6] <= 1'b0;
        end
        if(when_three2nine_l114) begin
          M_Valid[1] <= 1'b1;
          M_Valid[4] <= 1'b1;
          M_Valid[7] <= 1'b1;
        end else begin
          M_Valid[1] <= 1'b0;
          M_Valid[4] <= 1'b0;
          M_Valid[7] <= 1'b0;
        end
        if(when_three2nine_l123) begin
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
      t2n_fsm_stateReg <= t2n_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    if(when_three2nine_l44) begin
      if(t2n_fsm_EN_Last_Cin) begin
        t2n_fsm_Cnt_Cin <= 10'h0;
      end else begin
        t2n_fsm_Cnt_Cin <= (t2n_fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      t2n_fsm_Cnt_Cin <= 10'h0;
    end
    if(when_three2nine_l59) begin
      if(t2n_fsm_EN_Last_Cin) begin
        t2n_fsm_Cnt_Column <= (t2n_fsm_Cnt_Column + 11'h001);
      end else begin
        t2n_fsm_Cnt_Column <= t2n_fsm_Cnt_Column;
      end
    end else begin
      t2n_fsm_Cnt_Column <= 11'h0;
    end
    if(when_three2nine_l77) begin
      t2n_fsm_Cnt_Row <= (t2n_fsm_Cnt_Row + 11'h001);
    end else begin
      if(when_three2nine_l79) begin
        t2n_fsm_Cnt_Row <= 11'h0;
      end else begin
        t2n_fsm_Cnt_Row <= t2n_fsm_Cnt_Row;
      end
    end
  end


endmodule
