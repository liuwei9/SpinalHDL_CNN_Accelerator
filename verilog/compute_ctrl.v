// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : compute_ctrl
// Git hash  : 038b51e1758bac70ab39881905296db1cc09842a
// Date      : 22/09/2021, 16:16:36


module compute_ctrl (
  input               Start_Cu,
  output reg          Compute_Complete,
  output              First_Compute_Complete,
  input               compute_fifo_ready,
  output reg          rd_en_fifo,
  input               M_ready,
  output              M_Valid,
  output     [12:0]   weight_addrb,
  output     [11:0]   ram_temp_read_address,
  output reg [11:0]   ram_temp_write_address,
  input      [11:0]   COMPUTE_TIMES_CHANNEL_IN_REG,
  input      [11:0]   COMPUTE_TIMES_CHANNEL_IN_REG_8,
  input      [11:0]   COMPUTE_TIMES_CHANNEL_OUT_REG,
  input      [11:0]   ROW_NUM_CHANNEL_OUT_REG,
  output     [11:0]   S_Count_Fifo,
  output     [11:0]   M_Count_Fifo,
  input               clk,
  input               reset
);
  wire       [11:0]   count_mult_P;
  wire       [10:0]   _zz_M_Count_Fifo;
  wire       [11:0]   _zz_when_compute_ctrl_l67;
  wire       [11:0]   _zz_when_compute_ctrl_l67_1;
  wire       [11:0]   _zz_when_compute_ctrl_l76;
  wire       [11:0]   _zz_when_compute_ctrl_l76_1;
  wire       [11:0]   _zz_when_compute_ctrl_l77;
  wire       [11:0]   _zz_when_compute_ctrl_l77_1;
  wire       [11:0]   _zz_when_compute_ctrl_l91;
  wire       [11:0]   _zz_when_compute_ctrl_l91_1;
  wire       [11:0]   _zz_when_compute_ctrl_l91_2;
  wire       [11:0]   _zz_when_compute_ctrl_l91_3;
  wire       [11:0]   _zz_when_compute_ctrl_l108;
  wire       [11:0]   _zz_when_compute_ctrl_l108_1;
  wire       [11:0]   _zz_when_compute_ctrl_l108_2;
  wire       [11:0]   _zz_when_compute_ctrl_l108_3;
  wire       [11:0]   _zz_when_compute_ctrl_l108_4;
  wire       [11:0]   _zz_when_compute_ctrl_l114;
  wire       [11:0]   _zz_ram_temp_write_address;
  wire       [11:0]   _zz_when_compute_ctrl_l143;
  wire       [11:0]   _zz_when_compute_ctrl_l143_1;
  wire       [11:0]   _zz_when_compute_ctrl_l155;
  wire       [11:0]   _zz_when_compute_ctrl_l155_1;
  wire       [11:0]   _zz_when_compute_ctrl_l155_2;
  wire       [11:0]   _zz_when_compute_ctrl_l155_3;
  wire       [11:0]   _zz_when_compute_ctrl_l167;
  wire       [11:0]   _zz_when_compute_ctrl_l167_1;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_compute_ctrl_l53;
  wire                when_compute_ctrl_l58;
  reg        [9:0]    fsm_Cnt_Channel_In_Num;
  reg        [9:0]    fsm_Cnt_Channel_Out_Num;
  wire                when_compute_ctrl_l66;
  wire                when_compute_ctrl_l67;
  wire                when_compute_ctrl_l75;
  wire                when_compute_ctrl_l76;
  wire                when_compute_ctrl_l77;
  reg        [11:0]   fsm_Cnt_Column;
  wire                when_compute_ctrl_l90;
  wire                when_compute_ctrl_l91;
  reg        [11:0]   fsm_Cnt_Row;
  wire                when_compute_ctrl_l100;
  wire                when_compute_ctrl_l102;
  reg                 fsm_En_Compute_Column;
  wire                when_compute_ctrl_l108;
  reg                 fsm_En_Compute_Row;
  wire                when_compute_ctrl_l114;
  wire                when_compute_ctrl_l120;
  wire                when_compute_ctrl_l126;
  wire                when_compute_ctrl_l127;
  wire                when_compute_ctrl_l135;
  reg        [11:0]   fsm_ram_temp_read_address_temp;
  wire                when_compute_ctrl_l142;
  wire                when_compute_ctrl_l143;
  reg        [11:0]   _zz_ram_temp_read_address;
  reg        [11:0]   _zz_ram_temp_read_address_1;
  reg        [12:0]   fsm_weight_addrb_temp;
  wire                when_compute_ctrl_l154;
  wire                when_compute_ctrl_l155;
  reg        [12:0]   _zz_weight_addrb;
  reg        [12:0]   _zz_weight_addrb_1;
  reg                 fsm_M_Fifo_Valid;
  wire                when_compute_ctrl_l166;
  wire                when_compute_ctrl_l167;
  reg                 fsm_M_Fifo_Valid_delay_1;
  reg                 fsm_M_Fifo_Valid_delay_2;
  reg                 fsm_M_Fifo_Valid_delay_3;
  reg                 fsm_M_Fifo_Valid_delay_4;
  reg                 fsm_M_Fifo_Valid_delay_5;
  reg                 fsm_M_Fifo_Valid_delay_6;
  reg                 fsm_M_Fifo_Valid_delay_7;
  reg                 fsm_M_Fifo_Valid_delay_8;
  reg                 fsm_M_Fifo_Valid_delay_9;
  reg                 fsm_M_Fifo_Valid_delay_10;
  reg                 fsm_M_Fifo_Valid_delay_11;
  reg                 fsm_M_Fifo_Valid_delay_12;
  reg                 fsm_M_Fifo_Valid_delay_13;
  reg                 fsm_M_Fifo_Valid_delay_14;
  reg                 fsm_M_Fifo_Valid_delay_15;
  reg                 fsm_M_Fifo_Valid_delay_16;
  reg                 fsm_M_Fifo_Valid_delay_17;
  reg                 fsm_M_Fifo_Valid_delay_18;
  reg                 fsm_M_Fifo_Valid_delay_19;
  reg                 fsm_M_Fifo_Valid_delay_20;
  reg                 fsm_M_Fifo_Valid_delay_21;
  reg                 fsm_M_Fifo_Valid_delay_22;
  reg                 fsm_M_Fifo_Valid_delay_23;
  reg                 fsm_M_Fifo_Valid_delay_24;
  reg                 fsm_First_Complete;
  wire                when_compute_ctrl_l178;
  wire                when_compute_ctrl_l179;
  reg                 fsm_First_Complete_delay_1;
  reg                 fsm_First_Complete_delay_2;
  reg                 fsm_First_Complete_delay_3;
  reg                 fsm_First_Complete_delay_4;
  reg                 fsm_First_Complete_delay_5;
  reg                 fsm_First_Complete_delay_6;
  reg                 fsm_First_Complete_delay_7;
  reg                 fsm_First_Complete_delay_8;
  reg                 fsm_First_Complete_delay_9;
  reg                 fsm_First_Complete_delay_10;
  reg                 fsm_First_Complete_delay_11;
  reg                 fsm_First_Complete_delay_12;
  reg                 fsm_First_Complete_delay_13;
  reg                 fsm_First_Complete_delay_14;
  reg                 fsm_First_Complete_delay_15;
  reg                 fsm_First_Complete_delay_16;
  reg                 fsm_First_Complete_delay_17;
  reg                 fsm_First_Complete_delay_18;
  reg                 fsm_First_Complete_delay_19;
  reg                 fsm_First_Complete_delay_20;
  reg                 fsm_First_Complete_delay_21;
  reg                 fsm_First_Complete_delay_22;
  reg                 fsm_First_Complete_delay_23;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [167:0] fsm_stateReg_string;
  reg [167:0] fsm_stateNext_string;
  `endif


  assign _zz_M_Count_Fifo = (count_mult_P >>> 1);
  assign _zz_when_compute_ctrl_l67 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l67_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l76 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l76_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l77 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l77_1 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l91 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l91_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l91_2 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l91_3 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l108 = (ROW_NUM_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l108_1 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l108_2 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l108_3 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l108_4 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l114 = (ROW_NUM_CHANNEL_OUT_REG - 12'h001);
  assign _zz_ram_temp_write_address = (ram_temp_write_address + 12'h001);
  assign _zz_when_compute_ctrl_l143 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l143_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l155 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l155_1 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l155_2 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l155_3 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l167 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l167_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  mul_2 count_mult (
    .A        (ROW_NUM_CHANNEL_OUT_REG         ), //i
    .B        (COMPUTE_TIMES_CHANNEL_IN_REG_8  ), //i
    .P        (count_mult_P                    ), //o
    .clk      (clk                             ), //i
    .reset    (reset                           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT             ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE             ";
      `fsm_enumDefinition_binary_sequential_fsm_Wait : fsm_stateReg_string = "fsm_Wait             ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : fsm_stateReg_string = "fsm_Judge_Before_Fifo";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : fsm_stateReg_string = "fsm_Judge_After_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_Compute : fsm_stateReg_string = "fsm_Compute          ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : fsm_stateReg_string = "fsm_Judge_Row        ";
      default : fsm_stateReg_string = "?????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT             ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE             ";
      `fsm_enumDefinition_binary_sequential_fsm_Wait : fsm_stateNext_string = "fsm_Wait             ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : fsm_stateNext_string = "fsm_Judge_Before_Fifo";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : fsm_stateNext_string = "fsm_Judge_After_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_Compute : fsm_stateNext_string = "fsm_Compute          ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : fsm_stateNext_string = "fsm_Judge_Row        ";
      default : fsm_stateNext_string = "?????????????????????";
    endcase
  end
  `endif

  assign S_Count_Fifo = count_mult_P;
  assign M_Count_Fifo = {1'd0, _zz_M_Count_Fifo};
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Wait : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Compute : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_compute_ctrl_l53 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_compute_ctrl_l53) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_compute_ctrl_l67 = (_zz_when_compute_ctrl_l67 == _zz_when_compute_ctrl_l67_1);
  assign when_compute_ctrl_l76 = (_zz_when_compute_ctrl_l76 == _zz_when_compute_ctrl_l76_1);
  assign when_compute_ctrl_l77 = (_zz_when_compute_ctrl_l77 == _zz_when_compute_ctrl_l77_1);
  assign when_compute_ctrl_l91 = ((_zz_when_compute_ctrl_l91 == _zz_when_compute_ctrl_l91_1) && (_zz_when_compute_ctrl_l91_2 == _zz_when_compute_ctrl_l91_3));
  assign when_compute_ctrl_l108 = (((fsm_Cnt_Column == _zz_when_compute_ctrl_l108) && (_zz_when_compute_ctrl_l108_1 == _zz_when_compute_ctrl_l108_2)) && (_zz_when_compute_ctrl_l108_3 == _zz_when_compute_ctrl_l108_4));
  always @(*) begin
    if(when_compute_ctrl_l108) begin
      fsm_En_Compute_Column = 1'b1;
    end else begin
      fsm_En_Compute_Column = 1'b0;
    end
  end

  assign when_compute_ctrl_l114 = (fsm_Cnt_Row == _zz_when_compute_ctrl_l114);
  always @(*) begin
    if(when_compute_ctrl_l114) begin
      fsm_En_Compute_Row = 1'b1;
    end else begin
      fsm_En_Compute_Row = 1'b0;
    end
  end

  assign when_compute_ctrl_l120 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_Row) && ((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_IDLE)));
  assign when_compute_ctrl_l127 = (fsm_Cnt_Channel_Out_Num == 10'h0);
  assign when_compute_ctrl_l135 = ((fsm_Cnt_Channel_Out_Num == 10'h0) && (fsm_Cnt_Channel_In_Num == 10'h0));
  assign when_compute_ctrl_l143 = (_zz_when_compute_ctrl_l143 == _zz_when_compute_ctrl_l143_1);
  assign ram_temp_read_address = _zz_ram_temp_read_address_1;
  assign when_compute_ctrl_l155 = ((_zz_when_compute_ctrl_l155 == _zz_when_compute_ctrl_l155_1) && (_zz_when_compute_ctrl_l155_2 == _zz_when_compute_ctrl_l155_3));
  assign weight_addrb = _zz_weight_addrb_1;
  assign when_compute_ctrl_l167 = (_zz_when_compute_ctrl_l167 == _zz_when_compute_ctrl_l167_1);
  assign M_Valid = fsm_M_Fifo_Valid_delay_24;
  assign when_compute_ctrl_l179 = (fsm_Cnt_Channel_In_Num == 10'h0);
  assign First_Compute_Complete = fsm_First_Complete_delay_23;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(Start_Cu) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Wait : begin
        if(fsm_wait_en) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : begin
        if(compute_fifo_ready) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : begin
        if(M_ready) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Compute;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Compute : begin
        if(fsm_En_Compute_Column) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Row;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Compute;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : begin
        if(fsm_En_Compute_Row) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign when_compute_ctrl_l58 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Wait);
  assign when_compute_ctrl_l66 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l75 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l90 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l100 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_Row);
  assign when_compute_ctrl_l102 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_IDLE);
  assign when_compute_ctrl_l126 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l142 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l154 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l166 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l178 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  always @(posedge clk) begin
    if(when_compute_ctrl_l58) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_compute_ctrl_l66) begin
      if(when_compute_ctrl_l67) begin
        fsm_Cnt_Channel_In_Num <= 10'h0;
      end else begin
        fsm_Cnt_Channel_In_Num <= (fsm_Cnt_Channel_In_Num + 10'h001);
      end
    end else begin
      fsm_Cnt_Channel_In_Num <= 10'h0;
    end
    if(when_compute_ctrl_l75) begin
      if(when_compute_ctrl_l76) begin
        if(when_compute_ctrl_l77) begin
          fsm_Cnt_Channel_Out_Num <= 10'h0;
        end else begin
          fsm_Cnt_Channel_Out_Num <= (fsm_Cnt_Channel_Out_Num + 10'h001);
        end
      end else begin
        fsm_Cnt_Channel_Out_Num <= fsm_Cnt_Channel_Out_Num;
      end
    end else begin
      fsm_Cnt_Channel_Out_Num <= 10'h0;
    end
    if(when_compute_ctrl_l90) begin
      if(when_compute_ctrl_l91) begin
        fsm_Cnt_Column <= (fsm_Cnt_Column + 12'h001);
      end else begin
        fsm_Cnt_Column <= fsm_Cnt_Column;
      end
    end else begin
      fsm_Cnt_Column <= 12'h0;
    end
    if(when_compute_ctrl_l100) begin
      fsm_Cnt_Row <= (fsm_Cnt_Row + 12'h001);
    end else begin
      if(when_compute_ctrl_l102) begin
        fsm_Cnt_Row <= 12'h0;
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end
    if(when_compute_ctrl_l120) begin
      Compute_Complete <= 1'b1;
    end else begin
      Compute_Complete <= 1'b0;
    end
    if(when_compute_ctrl_l126) begin
      if(when_compute_ctrl_l127) begin
        rd_en_fifo <= 1'b1;
      end else begin
        rd_en_fifo <= 1'b0;
      end
    end else begin
      rd_en_fifo <= 1'b0;
    end
    if(when_compute_ctrl_l135) begin
      ram_temp_write_address <= 12'h0;
    end else begin
      if(rd_en_fifo) begin
        ram_temp_write_address <= _zz_ram_temp_write_address;
      end
    end
    if(when_compute_ctrl_l142) begin
      if(when_compute_ctrl_l143) begin
        fsm_ram_temp_read_address_temp <= 12'h0;
      end else begin
        fsm_ram_temp_read_address_temp <= (fsm_ram_temp_read_address_temp + 12'h001);
      end
    end else begin
      fsm_ram_temp_read_address_temp <= 12'h0;
    end
    _zz_ram_temp_read_address <= fsm_ram_temp_read_address_temp;
    _zz_ram_temp_read_address_1 <= _zz_ram_temp_read_address;
    if(when_compute_ctrl_l154) begin
      if(when_compute_ctrl_l155) begin
        fsm_weight_addrb_temp <= 13'h0;
      end else begin
        fsm_weight_addrb_temp <= (fsm_weight_addrb_temp + 13'h0001);
      end
    end else begin
      fsm_weight_addrb_temp <= 13'h0;
    end
    _zz_weight_addrb <= fsm_weight_addrb_temp;
    _zz_weight_addrb_1 <= _zz_weight_addrb;
    if(when_compute_ctrl_l166) begin
      if(when_compute_ctrl_l167) begin
        fsm_M_Fifo_Valid <= 1'b1;
      end else begin
        fsm_M_Fifo_Valid <= 1'b0;
      end
    end else begin
      fsm_M_Fifo_Valid <= 1'b0;
    end
    fsm_M_Fifo_Valid_delay_1 <= fsm_M_Fifo_Valid;
    fsm_M_Fifo_Valid_delay_2 <= fsm_M_Fifo_Valid_delay_1;
    fsm_M_Fifo_Valid_delay_3 <= fsm_M_Fifo_Valid_delay_2;
    fsm_M_Fifo_Valid_delay_4 <= fsm_M_Fifo_Valid_delay_3;
    fsm_M_Fifo_Valid_delay_5 <= fsm_M_Fifo_Valid_delay_4;
    fsm_M_Fifo_Valid_delay_6 <= fsm_M_Fifo_Valid_delay_5;
    fsm_M_Fifo_Valid_delay_7 <= fsm_M_Fifo_Valid_delay_6;
    fsm_M_Fifo_Valid_delay_8 <= fsm_M_Fifo_Valid_delay_7;
    fsm_M_Fifo_Valid_delay_9 <= fsm_M_Fifo_Valid_delay_8;
    fsm_M_Fifo_Valid_delay_10 <= fsm_M_Fifo_Valid_delay_9;
    fsm_M_Fifo_Valid_delay_11 <= fsm_M_Fifo_Valid_delay_10;
    fsm_M_Fifo_Valid_delay_12 <= fsm_M_Fifo_Valid_delay_11;
    fsm_M_Fifo_Valid_delay_13 <= fsm_M_Fifo_Valid_delay_12;
    fsm_M_Fifo_Valid_delay_14 <= fsm_M_Fifo_Valid_delay_13;
    fsm_M_Fifo_Valid_delay_15 <= fsm_M_Fifo_Valid_delay_14;
    fsm_M_Fifo_Valid_delay_16 <= fsm_M_Fifo_Valid_delay_15;
    fsm_M_Fifo_Valid_delay_17 <= fsm_M_Fifo_Valid_delay_16;
    fsm_M_Fifo_Valid_delay_18 <= fsm_M_Fifo_Valid_delay_17;
    fsm_M_Fifo_Valid_delay_19 <= fsm_M_Fifo_Valid_delay_18;
    fsm_M_Fifo_Valid_delay_20 <= fsm_M_Fifo_Valid_delay_19;
    fsm_M_Fifo_Valid_delay_21 <= fsm_M_Fifo_Valid_delay_20;
    fsm_M_Fifo_Valid_delay_22 <= fsm_M_Fifo_Valid_delay_21;
    fsm_M_Fifo_Valid_delay_23 <= fsm_M_Fifo_Valid_delay_22;
    fsm_M_Fifo_Valid_delay_24 <= fsm_M_Fifo_Valid_delay_23;
    if(when_compute_ctrl_l178) begin
      if(when_compute_ctrl_l179) begin
        fsm_First_Complete <= 1'b1;
      end else begin
        fsm_First_Complete <= 1'b0;
      end
    end else begin
      fsm_First_Complete <= 1'b0;
    end
    fsm_First_Complete_delay_1 <= fsm_First_Complete;
    fsm_First_Complete_delay_2 <= fsm_First_Complete_delay_1;
    fsm_First_Complete_delay_3 <= fsm_First_Complete_delay_2;
    fsm_First_Complete_delay_4 <= fsm_First_Complete_delay_3;
    fsm_First_Complete_delay_5 <= fsm_First_Complete_delay_4;
    fsm_First_Complete_delay_6 <= fsm_First_Complete_delay_5;
    fsm_First_Complete_delay_7 <= fsm_First_Complete_delay_6;
    fsm_First_Complete_delay_8 <= fsm_First_Complete_delay_7;
    fsm_First_Complete_delay_9 <= fsm_First_Complete_delay_8;
    fsm_First_Complete_delay_10 <= fsm_First_Complete_delay_9;
    fsm_First_Complete_delay_11 <= fsm_First_Complete_delay_10;
    fsm_First_Complete_delay_12 <= fsm_First_Complete_delay_11;
    fsm_First_Complete_delay_13 <= fsm_First_Complete_delay_12;
    fsm_First_Complete_delay_14 <= fsm_First_Complete_delay_13;
    fsm_First_Complete_delay_15 <= fsm_First_Complete_delay_14;
    fsm_First_Complete_delay_16 <= fsm_First_Complete_delay_15;
    fsm_First_Complete_delay_17 <= fsm_First_Complete_delay_16;
    fsm_First_Complete_delay_18 <= fsm_First_Complete_delay_17;
    fsm_First_Complete_delay_19 <= fsm_First_Complete_delay_18;
    fsm_First_Complete_delay_20 <= fsm_First_Complete_delay_19;
    fsm_First_Complete_delay_21 <= fsm_First_Complete_delay_20;
    fsm_First_Complete_delay_22 <= fsm_First_Complete_delay_21;
    fsm_First_Complete_delay_23 <= fsm_First_Complete_delay_22;
  end

  always @(posedge clk) begin
    if(reset) begin
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule
