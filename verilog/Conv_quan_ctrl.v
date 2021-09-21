// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_quan_ctrl
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:45


module Conv_quan_ctrl (
  input               Start,
  output     [7:0]    bias_addrb,
  output              EN_Rd_Fifo,
  input               Fifo_Ready,
  input               M_Ready,
  output              M_Valid,
  input      [10:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Out_Num_REG,
  output     [10:0]   S_Count_Fifo,
  input               clk,
  input               reset
);
  wire       [10:0]   count_mult_B;
  wire       [10:0]   count_mult_P;
  wire       [9:0]    _zz_when_Conv_quan_ctrl_l53;
  wire       [6:0]    _zz_when_Conv_quan_ctrl_l53_1;
  wire       [9:0]    _zz_bias_addrb;
  wire       [10:0]   _zz_when_Conv_quan_ctrl_l85;
  wire       [6:0]    Channel_Times;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_Conv_quan_ctrl_l39;
  wire                when_Conv_quan_ctrl_l44;
  reg        [9:0]    fsm_Cnt_Cout;
  reg                 fsm_EN_Last_Cout;
  wire                when_Conv_quan_ctrl_l53;
  wire                when_Conv_quan_ctrl_l58;
  reg                 fsm_fifo_rd_en_temp;
  wire                when_Conv_quan_ctrl_l70;
  reg                 fsm_fifo_rd_en_temp_regNext;
  reg                 fsm_M_Valid_temp;
  wire                when_Conv_quan_ctrl_l77;
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
  reg        [10:0]   fsm_Cnt_Column;
  reg                 fsm_En_Col;
  wire                when_Conv_quan_ctrl_l85;
  wire                when_Conv_quan_ctrl_l90;
  reg        [10:0]   fsm_Cnt_Row;
  reg                 fsm_En_Row;
  wire                when_Conv_quan_ctrl_l101;
  wire                when_Conv_quan_ctrl_l106;
  wire                when_Conv_quan_ctrl_l108;
  reg        `fsm_enumDefinition_2_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_2_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [167:0] fsm_stateReg_string;
  reg [167:0] fsm_stateNext_string;
  `endif


  assign _zz_when_Conv_quan_ctrl_l53_1 = (Channel_Times - 7'h01);
  assign _zz_when_Conv_quan_ctrl_l53 = {3'd0, _zz_when_Conv_quan_ctrl_l53_1};
  assign _zz_bias_addrb = fsm_Cnt_Cout;
  assign _zz_when_Conv_quan_ctrl_l85 = (Row_Num_Out_REG - 11'h001);
  mul_2 count_mult (
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
  assign count_mult_B = {4'd0, Channel_Times};
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
  assign when_Conv_quan_ctrl_l39 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_Conv_quan_ctrl_l39) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_Conv_quan_ctrl_l53 = (fsm_Cnt_Cout == _zz_when_Conv_quan_ctrl_l53);
  always @(*) begin
    if(when_Conv_quan_ctrl_l53) begin
      fsm_EN_Last_Cout = 1'b1;
    end else begin
      fsm_EN_Last_Cout = 1'b0;
    end
  end

  assign bias_addrb = _zz_bias_addrb[7:0];
  always @(*) begin
    if(when_Conv_quan_ctrl_l70) begin
      fsm_fifo_rd_en_temp = 1'b1;
    end else begin
      fsm_fifo_rd_en_temp = 1'b0;
    end
  end

  assign EN_Rd_Fifo = fsm_fifo_rd_en_temp_regNext;
  always @(*) begin
    if(when_Conv_quan_ctrl_l77) begin
      fsm_M_Valid_temp = 1'b1;
    end else begin
      fsm_M_Valid_temp = 1'b0;
    end
  end

  assign M_Valid = fsm_M_Valid_temp_delay_20;
  assign when_Conv_quan_ctrl_l85 = (fsm_EN_Last_Cout && (fsm_Cnt_Column == _zz_when_Conv_quan_ctrl_l85));
  always @(*) begin
    if(when_Conv_quan_ctrl_l85) begin
      fsm_En_Col = 1'b1;
    end else begin
      fsm_En_Col = 1'b0;
    end
  end

  assign when_Conv_quan_ctrl_l101 = (fsm_Cnt_Row == Row_Num_Out_REG);
  always @(*) begin
    if(when_Conv_quan_ctrl_l101) begin
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

  assign when_Conv_quan_ctrl_l44 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_WAIT);
  assign when_Conv_quan_ctrl_l58 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l70 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l77 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l90 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_Compute);
  assign when_Conv_quan_ctrl_l106 = ((fsm_stateNext == `fsm_enumDefinition_2_binary_sequential_fsm_Judge) && (fsm_stateReg != `fsm_enumDefinition_2_binary_sequential_fsm_Judge));
  assign when_Conv_quan_ctrl_l108 = (fsm_stateReg == `fsm_enumDefinition_2_binary_sequential_fsm_IDLE);
  always @(posedge clk) begin
    if(when_Conv_quan_ctrl_l44) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_Conv_quan_ctrl_l58) begin
      if(fsm_EN_Last_Cout) begin
        fsm_Cnt_Cout <= 10'h0;
      end else begin
        fsm_Cnt_Cout <= (fsm_Cnt_Cout + 10'h001);
      end
    end else begin
      fsm_Cnt_Cout <= 10'h0;
    end
    fsm_fifo_rd_en_temp_regNext <= fsm_fifo_rd_en_temp;
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
    if(when_Conv_quan_ctrl_l90) begin
      if(fsm_EN_Last_Cout) begin
        fsm_Cnt_Column <= (fsm_Cnt_Column + 11'h001);
      end else begin
        fsm_Cnt_Column <= fsm_Cnt_Column;
      end
    end else begin
      fsm_Cnt_Column <= 11'h0;
    end
    if(when_Conv_quan_ctrl_l106) begin
      fsm_Cnt_Row <= (fsm_Cnt_Row + 11'h001);
    end else begin
      if(when_Conv_quan_ctrl_l108) begin
        fsm_Cnt_Row <= 11'h0;
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      fsm_stateReg <= `fsm_enumDefinition_2_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule
