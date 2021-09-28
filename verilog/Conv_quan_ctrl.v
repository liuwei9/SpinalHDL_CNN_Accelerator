// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_quan_ctrl
// Git hash  : 46de7a2643940073d87fffa27badc891275ca23e


module Conv_quan_ctrl (
  input               Start,
  output     [8:0]    bias_addrb,
  output              EN_Rd_Fifo,
  input               Fifo_Ready,
  input               M_Ready,
  output reg          M_Valid,
  input      [11:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Out_Num_REG,
  output     [11:0]   S_Count_Fifo,
  input               Leaky_REG,
  input               clk,
  input               reset
);
  wire       [11:0]   count_mult_B;
  wire       [11:0]   count_mult_P;
  wire       [9:0]    _zz_when_Conv_quan_ctrl_l54;
  wire       [6:0]    _zz_when_Conv_quan_ctrl_l54_1;
  wire       [9:0]    _zz_bias_addrb;
  wire       [11:0]   _zz_when_Conv_quan_ctrl_l91;
  wire       [6:0]    Channel_Times;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_Conv_quan_ctrl_l40;
  wire                when_Conv_quan_ctrl_l45;
  reg        [9:0]    fsm_Cnt_Cout;
  reg                 fsm_EN_Last_Cout;
  wire                when_Conv_quan_ctrl_l54;
  wire                when_Conv_quan_ctrl_l59;
  reg                 fsm_fifo_rd_en_temp;
  wire                when_Conv_quan_ctrl_l71;
  reg                 fsm_fifo_rd_en_temp_regNext;
  reg                 fsm_M_Valid_temp;
  wire                when_Conv_quan_ctrl_l78;
  wire                when_Conv_quan_ctrl_l83;
  reg                 fsm_M_Valid_temp_delay_1;
  reg                 fsm_M_Valid_temp_delay_2;
  reg                 fsm_M_Valid_temp_delay_3;
  reg                 fsm_M_Valid_temp_delay_4;
  reg                 fsm_M_Valid_temp_delay_5;
  reg                 fsm_M_Valid_temp_delay_6;
  reg                 fsm_M_Valid_temp_delay_7;
  reg                 fsm_M_Valid_temp_delay_8;
  reg                 fsm_M_Valid_temp_delay_9;
  reg                 fsm_M_Valid_temp_delay_10;
  reg                 fsm_M_Valid_temp_delay_11;
  reg                 fsm_M_Valid_temp_delay_12;
  reg                 fsm_M_Valid_temp_delay_13;
  reg                 fsm_M_Valid_temp_delay_14;
  reg                 fsm_M_Valid_temp_delay_15;
  reg                 fsm_M_Valid_temp_delay_16;
  reg                 fsm_M_Valid_temp_delay_17;
  reg                 fsm_M_Valid_temp_delay_18;
  reg                 fsm_M_Valid_temp_delay_19;
  reg                 fsm_M_Valid_temp_delay_20;
  reg                 fsm_M_Valid_temp_delay_1_1;
  reg                 fsm_M_Valid_temp_delay_2_1;
  reg                 fsm_M_Valid_temp_delay_3_1;
  reg                 fsm_M_Valid_temp_delay_4_1;
  reg                 fsm_M_Valid_temp_delay_5_1;
  reg                 fsm_M_Valid_temp_delay_6_1;
  reg                 fsm_M_Valid_temp_delay_7_1;
  reg                 fsm_M_Valid_temp_delay_8_1;
  reg                 fsm_M_Valid_temp_delay_9_1;
  reg                 fsm_M_Valid_temp_delay_10_1;
  reg        [11:0]   fsm_Cnt_Column;
  reg                 fsm_En_Col;
  wire                when_Conv_quan_ctrl_l91;
  wire                when_Conv_quan_ctrl_l96;
  reg        [11:0]   fsm_Cnt_Row;
  reg                 fsm_En_Row;
  wire                when_Conv_quan_ctrl_l107;
  wire                when_Conv_quan_ctrl_l112;
  wire                when_Conv_quan_ctrl_l114;
  reg        `fsm_enumDefinition_2_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_2_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [167:0] fsm_stateReg_string;
  reg [167:0] fsm_stateNext_string;
  `endif


  assign _zz_when_Conv_quan_ctrl_l54_1 = (Channel_Times - 7'h01);
  assign _zz_when_Conv_quan_ctrl_l54 = {3'd0, _zz_when_Conv_quan_ctrl_l54_1};
  assign _zz_bias_addrb = fsm_Cnt_Cout;
  assign _zz_when_Conv_quan_ctrl_l91 = (Row_Num_Out_REG - 12'h001);
  mul count_mult (
    .A        (Row_Num_Out_REG  ), //i
    .B        (count_mult_B     ), //i
    .P        (count_mult_P     ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT             ";
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE             ";
      `fsm_enumDefinition_2_binary_sequential_fsm_WAIT : fsm_stateReg_string = "fsm_WAIT             ";
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO : fsm_stateReg_string = "fsm_Judge_Before_FIFO";
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_After_FIFO : fsm_stateReg_string = "fsm_Judge_After_FIFO ";
      `fsm_enumDefinition_2_binary_sequential_fsm_Compute : fsm_stateReg_string = "fsm_Compute          ";
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge : fsm_stateReg_string = "fsm_Judge            ";
      default : fsm_stateReg_string = "?????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_2_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT             ";
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE             ";
      `fsm_enumDefinition_2_binary_sequential_fsm_WAIT : fsm_stateNext_string = "fsm_WAIT             ";
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO : fsm_stateNext_string = "fsm_Judge_Before_FIFO";
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_After_FIFO : fsm_stateNext_string = "fsm_Judge_After_FIFO ";
      `fsm_enumDefinition_2_binary_sequential_fsm_Compute : fsm_stateNext_string = "fsm_Compute          ";
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge : fsm_stateNext_string = "fsm_Judge            ";
      default : fsm_stateNext_string = "?????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_Out_Num_REG >>> 3);
  assign count_mult_B = {5'd0, Channel_Times};
  assign S_Count_Fifo = count_mult_P;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_WAIT : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_After_FIFO : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Compute : begin
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_Conv_quan_ctrl_l40 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_Conv_quan_ctrl_l40) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_Conv_quan_ctrl_l54 = (fsm_Cnt_Cout == _zz_when_Conv_quan_ctrl_l54);
  always @(*) begin
    if(when_Conv_quan_ctrl_l54) begin
      fsm_EN_Last_Cout = 1'b1;
    end else begin
      fsm_EN_Last_Cout = 1'b0;
    end
  end

  assign bias_addrb = _zz_bias_addrb[8:0];
  always @(*) begin
    if(when_Conv_quan_ctrl_l71) begin
      fsm_fifo_rd_en_temp = 1'b1;
    end else begin
      fsm_fifo_rd_en_temp = 1'b0;
    end
  end

  assign EN_Rd_Fifo = fsm_fifo_rd_en_temp_regNext;
  always @(*) begin
    if(when_Conv_quan_ctrl_l78) begin
      fsm_M_Valid_temp = 1'b1;
    end else begin
      fsm_M_Valid_temp = 1'b0;
    end
  end

  assign when_Conv_quan_ctrl_l83 = (! Leaky_REG);
  always @(*) begin
    if(when_Conv_quan_ctrl_l83) begin
      M_Valid = fsm_M_Valid_temp_delay_20;
    end else begin
      M_Valid = fsm_M_Valid_temp_delay_10_1;
    end
  end

  assign when_Conv_quan_ctrl_l91 = (fsm_EN_Last_Cout && (fsm_Cnt_Column == _zz_when_Conv_quan_ctrl_l91));
  always @(*) begin
    if(when_Conv_quan_ctrl_l91) begin
      fsm_En_Col = 1'b1;
    end else begin
      fsm_En_Col = 1'b0;
    end
  end

  assign when_Conv_quan_ctrl_l107 = (fsm_Cnt_Row == Row_Num_Out_REG);
  always @(*) begin
    if(when_Conv_quan_ctrl_l107) begin
      fsm_En_Row = 1'b1;
    end else begin
      fsm_En_Row = 1'b0;
    end
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_binary_sequential_fsm_IDLE : begin
        if(Start) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_WAIT;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_WAIT : begin
        if(fsm_wait_en) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_WAIT;
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO : begin
        if(Fifo_Ready) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Judge_After_FIFO;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO;
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge_After_FIFO : begin
        if(M_Ready) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Compute;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Judge_After_FIFO;
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Compute : begin
        if(fsm_En_Col) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Judge;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Compute;
        end
      end
      `fsm_enumDefinition_2_binary_sequential_fsm_Judge : begin
        if(fsm_En_Row) begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_Judge_Before_FIFO;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_2_binary_sequential_fsm_BOOT;
    end
  end

  assign when_Conv_quan_ctrl_l45 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_WAIT);
  assign when_Conv_quan_ctrl_l59 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l71 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l78 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l96 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l112 = ((fsm_stateNext == `fsm_enumDefinition_2_binary_sequential_fsm_Judge) && (fsm_stateReg != `fsm_enumDefinition_2_binary_sequential_fsm_Judge));
  assign when_Conv_quan_ctrl_l114 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_IDLE);
  always @(posedge clk) begin
    if(when_Conv_quan_ctrl_l45) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_Conv_quan_ctrl_l59) begin
      if(fsm_EN_Last_Cout) begin
        fsm_Cnt_Cout <= 10'h0;
      end else begin
        fsm_Cnt_Cout <= (fsm_Cnt_Cout + 10'h001);
      end
    end else begin
      fsm_Cnt_Cout <= 10'h0;
    end
    fsm_fifo_rd_en_temp_regNext <= fsm_fifo_rd_en_temp;
    if(when_Conv_quan_ctrl_l96) begin
      if(fsm_EN_Last_Cout) begin
        fsm_Cnt_Column <= (fsm_Cnt_Column + 12'h001);
      end else begin
        fsm_Cnt_Column <= fsm_Cnt_Column;
      end
    end else begin
      fsm_Cnt_Column <= 12'h0;
    end
    if(when_Conv_quan_ctrl_l112) begin
      fsm_Cnt_Row <= (fsm_Cnt_Row + 12'h001);
    end else begin
      if(when_Conv_quan_ctrl_l114) begin
        fsm_Cnt_Row <= 12'h0;
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end
  end

  always @(posedge clk) begin
    fsm_M_Valid_temp_delay_1 <= fsm_M_Valid_temp;
    fsm_M_Valid_temp_delay_2 <= fsm_M_Valid_temp_delay_1;
    fsm_M_Valid_temp_delay_3 <= fsm_M_Valid_temp_delay_2;
    fsm_M_Valid_temp_delay_4 <= fsm_M_Valid_temp_delay_3;
    fsm_M_Valid_temp_delay_5 <= fsm_M_Valid_temp_delay_4;
    fsm_M_Valid_temp_delay_6 <= fsm_M_Valid_temp_delay_5;
    fsm_M_Valid_temp_delay_7 <= fsm_M_Valid_temp_delay_6;
    fsm_M_Valid_temp_delay_8 <= fsm_M_Valid_temp_delay_7;
    fsm_M_Valid_temp_delay_9 <= fsm_M_Valid_temp_delay_8;
    fsm_M_Valid_temp_delay_10 <= fsm_M_Valid_temp_delay_9;
    fsm_M_Valid_temp_delay_11 <= fsm_M_Valid_temp_delay_10;
    fsm_M_Valid_temp_delay_12 <= fsm_M_Valid_temp_delay_11;
    fsm_M_Valid_temp_delay_13 <= fsm_M_Valid_temp_delay_12;
    fsm_M_Valid_temp_delay_14 <= fsm_M_Valid_temp_delay_13;
    fsm_M_Valid_temp_delay_15 <= fsm_M_Valid_temp_delay_14;
    fsm_M_Valid_temp_delay_16 <= fsm_M_Valid_temp_delay_15;
    fsm_M_Valid_temp_delay_17 <= fsm_M_Valid_temp_delay_16;
    fsm_M_Valid_temp_delay_18 <= fsm_M_Valid_temp_delay_17;
    fsm_M_Valid_temp_delay_19 <= fsm_M_Valid_temp_delay_18;
    fsm_M_Valid_temp_delay_20 <= fsm_M_Valid_temp_delay_19;
  end

  always @(posedge clk) begin
    fsm_M_Valid_temp_delay_1_1 <= fsm_M_Valid_temp;
    fsm_M_Valid_temp_delay_2_1 <= fsm_M_Valid_temp_delay_1_1;
    fsm_M_Valid_temp_delay_3_1 <= fsm_M_Valid_temp_delay_2_1;
    fsm_M_Valid_temp_delay_4_1 <= fsm_M_Valid_temp_delay_3_1;
    fsm_M_Valid_temp_delay_5_1 <= fsm_M_Valid_temp_delay_4_1;
    fsm_M_Valid_temp_delay_6_1 <= fsm_M_Valid_temp_delay_5_1;
    fsm_M_Valid_temp_delay_7_1 <= fsm_M_Valid_temp_delay_6_1;
    fsm_M_Valid_temp_delay_8_1 <= fsm_M_Valid_temp_delay_7_1;
    fsm_M_Valid_temp_delay_9_1 <= fsm_M_Valid_temp_delay_8_1;
    fsm_M_Valid_temp_delay_10_1 <= fsm_M_Valid_temp_delay_9_1;
  end

  always @(posedge clk) begin
    if(reset) begin
      fsm_stateReg <= `fsm_enumDefinition_2_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule
