// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : four2three
// Git hash  : 5e1b82d0af135d1f0cd525844f0bb03779615cb8
// Date      : 17/09/2021, 10:04:11


module four2three (
  input               Start,
  output reg          StartRow,
  input      [10:0]   Row_Num_After_Padding,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output reg [191:0]  M_DATA,
  input               M_Ready,
  output reg          M_Valid,
  input               M_rd_en,
  input      [10:0]   M_Addr,
  input      [9:0]    Channel_In_Num_REG,
  input               reset,
  input               clk
);
  wire       [10:0]   count_mult_A;
  wire       [6:0]    count_mult_B;
  reg                 fifo_rd_en;
  wire       [10:0]   fifo_m_data_count;
  wire       [10:0]   fifo_s_data_count;
  wire       [10:0]   ram1_addra;
  wire       [10:0]   ram1_addrb;
  reg                 ram1_ena;
  reg                 ram1_enb;
  reg        [0:0]    ram1_wea;
  wire       [10:0]   ram2_addra;
  wire       [10:0]   ram2_addrb;
  reg                 ram2_ena;
  reg                 ram2_enb;
  reg        [0:0]    ram2_wea;
  wire       [10:0]   ram3_addra;
  wire       [10:0]   ram3_addrb;
  reg                 ram3_ena;
  reg                 ram3_enb;
  reg        [0:0]    ram3_wea;
  wire       [10:0]   ram4_addra;
  wire       [10:0]   ram4_addrb;
  reg                 ram4_ena;
  reg                 ram4_enb;
  reg        [0:0]    ram4_wea;
  wire       [10:0]   count_mult_P;
  wire                fifo_data_in_ready;
  wire       [63:0]   fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [63:0]   ram1_doutb;
  wire       [63:0]   ram2_doutb;
  wire       [63:0]   ram3_doutb;
  wire       [63:0]   ram4_doutb;
  wire       [9:0]    _zz_when_four2three_l72;
  wire       [6:0]    _zz_when_four2three_l72_1;
  wire       [10:0]   _zz_when_four2three_l89;
  wire       [10:0]   _zz_when_four2three_l110;
  wire       [17:0]   _zz_when_four2three_l204;
  wire       [17:0]   _zz_when_four2three_l204_1;
  wire       [17:0]   _zz_when_four2three_l204_2;
  wire       [17:0]   _zz_when_four2three_l304;
  wire       [17:0]   _zz_when_four2three_l304_1;
  wire       [17:0]   _zz_when_four2three_l304_2;
  wire       [6:0]    Channel_Times;
  wire                f2t_fsm_wantExit;
  reg                 f2t_fsm_wantStart;
  wire                f2t_fsm_wantKill;
  reg        [5:0]    f2t_fsm_wait_cnt;
  wire                when_four2three_l58;
  reg                 f2t_fsm_init_en;
  wire                when_four2three_l64;
  reg        [9:0]    f2t_fsm_Cnt_Cin;
  reg                 f2t_fsm_EN_Last_Cin;
  wire                when_four2three_l72;
  wire                when_four2three_l77;
  reg        [10:0]   f2t_fsm_Cnt_Column;
  reg                 f2t_fsm_EN_Read_State;
  wire                when_four2three_l89;
  wire                when_four2three_l94;
  reg        [10:0]   f2t_fsm_Cnt_ROW;
  wire                when_four2three_l104;
  wire                when_four2three_l106;
  reg                 f2t_fsm_Last_Row;
  wire                when_four2three_l110;
  reg        [1:0]    f2t_fsm_Cnt_Ram;
  wire                when_four2three_l115;
  wire                when_four2three_l117;
  reg        [1:0]    f2t_fsm_En_Ram;
  wire                when_four2three_l122;
  reg        [10:0]   f2t_fsm_addrRam1;
  reg        [10:0]   f2t_fsm_addrRam2;
  reg        [10:0]   f2t_fsm_addrRam3;
  reg        [10:0]   f2t_fsm_addrRam4;
  wire                when_four2three_l314;
  wire                when_four2three_l314_1;
  wire                when_four2three_l314_2;
  wire                when_four2three_l314_3;
  wire                when_four2three_l163;
  wire                when_four2three_l198;
  reg        [2:0]    f2t_fsm_rd_ram_cnt;
  wire                when_four2three_l204;
  wire                when_four2three_l206;
  reg        `f2t_fsm_enumDefinition_binary_sequential_type f2t_fsm_stateReg;
  reg        `f2t_fsm_enumDefinition_binary_sequential_type f2t_fsm_stateNext;
  wire                when_four2three_l288;
  wire                when_four2three_l294;
  wire                when_four2three_l304;
  `ifndef SYNTHESIS
  reg [167:0] f2t_fsm_stateReg_string;
  reg [167:0] f2t_fsm_stateNext_string;
  `endif


  assign _zz_when_four2three_l72_1 = (Channel_Times - 7'h01);
  assign _zz_when_four2three_l72 = {3'd0, _zz_when_four2three_l72_1};
  assign _zz_when_four2three_l89 = (Row_Num_After_Padding - 11'h001);
  assign _zz_when_four2three_l110 = (Row_Num_After_Padding - 11'h002);
  assign _zz_when_four2three_l204 = {7'd0, M_Addr};
  assign _zz_when_four2three_l204_1 = (_zz_when_four2three_l204_2 - 18'h00001);
  assign _zz_when_four2three_l204_2 = (Row_Num_After_Padding * Channel_Times);
  assign _zz_when_four2three_l304 = {7'd0, M_Addr};
  assign _zz_when_four2three_l304_1 = (_zz_when_four2three_l304_2 - 18'h00001);
  assign _zz_when_four2three_l304_2 = (Row_Num_After_Padding * Channel_Times);
  mul count_mult (
    .A        (count_mult_A  ), //i
    .B        (count_mult_B  ), //i
    .P        (count_mult_P  ), //o
    .clk      (clk           ), //i
    .reset    (reset         )  //i
  );
  general_fifo_sync fifo (
    .reset             (reset                ), //i
    .clk               (clk                  ), //i
    .data_in           (S_DATA_payload       ), //i
    .wr_en             (S_DATA_valid         ), //i
    .data_in_ready     (fifo_data_in_ready   ), //o
    .data_out          (fifo_data_out        ), //o
    .rd_en             (fifo_rd_en           ), //i
    .data_out_valid    (fifo_data_out_valid  ), //o
    .m_data_count      (fifo_m_data_count    ), //i
    .s_data_count      (fifo_s_data_count    ), //i
    .data_valid        (fifo_data_valid      ), //o
    .full              (fifo_full            ), //o
    .empty             (fifo_empty           )  //o
  );
  sdpram ram1 (
    .doutb    (ram1_doutb     ), //o
    .addra    (ram1_addra     ), //i
    .addrb    (ram1_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram1_ena       ), //i
    .enb      (ram1_enb       ), //i
    .wea      (ram1_wea       ), //i
    .clk      (clk            )  //i
  );
  sdpram ram2 (
    .doutb    (ram2_doutb     ), //o
    .addra    (ram2_addra     ), //i
    .addrb    (ram2_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram2_ena       ), //i
    .enb      (ram2_enb       ), //i
    .wea      (ram2_wea       ), //i
    .clk      (clk            )  //i
  );
  sdpram ram3 (
    .doutb    (ram3_doutb     ), //o
    .addra    (ram3_addra     ), //i
    .addrb    (ram3_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram3_ena       ), //i
    .enb      (ram3_enb       ), //i
    .wea      (ram3_wea       ), //i
    .clk      (clk            )  //i
  );
  sdpram ram4 (
    .doutb    (ram4_doutb     ), //o
    .addra    (ram4_addra     ), //i
    .addrb    (ram4_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram4_ena       ), //i
    .enb      (ram4_enb       ), //i
    .wea      (ram4_wea       ), //i
    .clk      (clk            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(f2t_fsm_stateReg)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT : f2t_fsm_stateReg_string = "f2t_fsm_BOOT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : f2t_fsm_stateReg_string = "f2t_fsm_IDLE         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : f2t_fsm_stateReg_string = "f2t_fsm_INIT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : f2t_fsm_stateReg_string = "f2t_fsm_Judge_Fifo   ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : f2t_fsm_stateReg_string = "f2t_fsm_Read         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : f2t_fsm_stateReg_string = "f2t_fsm_Judge_Compute";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : f2t_fsm_stateReg_string = "f2t_fsm_Start_Compute";
      default : f2t_fsm_stateReg_string = "?????????????????????";
    endcase
  end
  always @(*) begin
    case(f2t_fsm_stateNext)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT : f2t_fsm_stateNext_string = "f2t_fsm_BOOT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : f2t_fsm_stateNext_string = "f2t_fsm_IDLE         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : f2t_fsm_stateNext_string = "f2t_fsm_INIT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : f2t_fsm_stateNext_string = "f2t_fsm_Judge_Fifo   ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : f2t_fsm_stateNext_string = "f2t_fsm_Read         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : f2t_fsm_stateNext_string = "f2t_fsm_Judge_Compute";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : f2t_fsm_stateNext_string = "f2t_fsm_Start_Compute";
      default : f2t_fsm_stateNext_string = "?????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_In_Num_REG >>> 3);
  assign count_mult_A = Row_Num_After_Padding;
  assign count_mult_B = Channel_Times;
  assign S_DATA_ready = fifo_data_in_ready;
  assign fifo_m_data_count = count_mult_P;
  assign fifo_s_data_count = count_mult_P;
  assign ram1_addrb = M_Addr;
  assign ram2_addrb = M_Addr;
  assign ram3_addrb = M_Addr;
  assign ram4_addrb = M_Addr;
  assign f2t_fsm_wantExit = 1'b0;
  always @(*) begin
    f2t_fsm_wantStart = 1'b0;
    case(f2t_fsm_stateReg)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : begin
      end
      default : begin
        f2t_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign f2t_fsm_wantKill = 1'b0;
  assign when_four2three_l64 = (f2t_fsm_wait_cnt == 6'h05);
  always @(*) begin
    if(when_four2three_l64) begin
      f2t_fsm_init_en = 1'b1;
    end else begin
      f2t_fsm_init_en = 1'b0;
    end
  end

  assign when_four2three_l72 = (f2t_fsm_Cnt_Cin == _zz_when_four2three_l72);
  always @(*) begin
    if(when_four2three_l72) begin
      f2t_fsm_EN_Last_Cin = 1'b1;
    end else begin
      f2t_fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_four2three_l89 = (f2t_fsm_Cnt_Column == _zz_when_four2three_l89);
  always @(*) begin
    if(when_four2three_l89) begin
      f2t_fsm_EN_Read_State = 1'b1;
    end else begin
      f2t_fsm_EN_Read_State = 1'b0;
    end
  end

  assign when_four2three_l110 = (f2t_fsm_Cnt_ROW == _zz_when_four2three_l110);
  always @(*) begin
    if(when_four2three_l110) begin
      f2t_fsm_Last_Row = 1'b1;
    end else begin
      f2t_fsm_Last_Row = 1'b0;
    end
  end

  always @(*) begin
    case(f2t_fsm_En_Ram)
      2'b00 : begin
        ram1_ena = 1'b1;
      end
      2'b01 : begin
        ram1_ena = 1'b0;
      end
      2'b10 : begin
        ram1_ena = 1'b0;
      end
      default : begin
        ram1_ena = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(f2t_fsm_En_Ram)
      2'b00 : begin
        ram2_ena = 1'b0;
      end
      2'b01 : begin
        ram2_ena = 1'b1;
      end
      2'b10 : begin
        ram2_ena = 1'b0;
      end
      default : begin
        ram2_ena = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(f2t_fsm_En_Ram)
      2'b00 : begin
        ram3_ena = 1'b0;
      end
      2'b01 : begin
        ram3_ena = 1'b0;
      end
      2'b10 : begin
        ram3_ena = 1'b1;
      end
      default : begin
        ram3_ena = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(f2t_fsm_En_Ram)
      2'b00 : begin
        ram4_ena = 1'b0;
      end
      2'b01 : begin
        ram4_ena = 1'b0;
      end
      2'b10 : begin
        ram4_ena = 1'b0;
      end
      default : begin
        ram4_ena = 1'b1;
      end
    endcase
  end

  assign ram1_addra = f2t_fsm_addrRam1;
  assign ram2_addra = f2t_fsm_addrRam2;
  assign ram3_addra = f2t_fsm_addrRam3;
  assign ram4_addra = f2t_fsm_addrRam4;
  always @(*) begin
    if(when_four2three_l163) begin
      fifo_rd_en = 1'b1;
    end else begin
      fifo_rd_en = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
        2'b00 : begin
          ram1_wea = 1'b1;
        end
        2'b01 : begin
          ram1_wea = 1'b0;
        end
        2'b10 : begin
          ram1_wea = 1'b0;
        end
        default : begin
          ram1_wea = 1'b0;
        end
      endcase
    end else begin
      ram1_wea = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
        2'b00 : begin
          ram2_wea = 1'b0;
        end
        2'b01 : begin
          ram2_wea = 1'b1;
        end
        2'b10 : begin
          ram2_wea = 1'b0;
        end
        default : begin
          ram2_wea = 1'b0;
        end
      endcase
    end else begin
      ram2_wea = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
        2'b00 : begin
          ram3_wea = 1'b0;
        end
        2'b01 : begin
          ram3_wea = 1'b0;
        end
        2'b10 : begin
          ram3_wea = 1'b1;
        end
        default : begin
          ram3_wea = 1'b0;
        end
      endcase
    end else begin
      ram3_wea = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
        2'b00 : begin
          ram4_wea = 1'b0;
        end
        2'b01 : begin
          ram4_wea = 1'b0;
        end
        2'b10 : begin
          ram4_wea = 1'b0;
        end
        default : begin
          ram4_wea = 1'b1;
        end
      endcase
    end else begin
      ram4_wea = 1'b0;
    end
  end

  assign when_four2three_l204 = ((f2t_fsm_rd_ram_cnt == 3'b100) && (_zz_when_four2three_l204 == _zz_when_four2three_l204_1));
  always @(*) begin
    case(f2t_fsm_rd_ram_cnt)
      3'b001 : begin
        ram1_enb = M_rd_en;
      end
      3'b010 : begin
        ram1_enb = 1'b0;
      end
      3'b011 : begin
        ram1_enb = M_rd_en;
      end
      3'b100 : begin
        ram1_enb = M_rd_en;
      end
      default : begin
        ram1_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(f2t_fsm_rd_ram_cnt)
      3'b001 : begin
        ram2_enb = M_rd_en;
      end
      3'b010 : begin
        ram2_enb = M_rd_en;
      end
      3'b011 : begin
        ram2_enb = 1'b0;
      end
      3'b100 : begin
        ram2_enb = M_rd_en;
      end
      default : begin
        ram2_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(f2t_fsm_rd_ram_cnt)
      3'b001 : begin
        ram3_enb = M_rd_en;
      end
      3'b010 : begin
        ram3_enb = M_rd_en;
      end
      3'b011 : begin
        ram3_enb = M_rd_en;
      end
      3'b100 : begin
        ram3_enb = 1'b0;
      end
      default : begin
        ram3_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(f2t_fsm_rd_ram_cnt)
      3'b001 : begin
        ram4_enb = 1'b0;
      end
      3'b010 : begin
        ram4_enb = M_rd_en;
      end
      3'b011 : begin
        ram4_enb = M_rd_en;
      end
      3'b100 : begin
        ram4_enb = M_rd_en;
      end
      default : begin
        ram4_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    f2t_fsm_stateNext = f2t_fsm_stateReg;
    case(f2t_fsm_stateReg)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : begin
        if(Start) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : begin
        if(f2t_fsm_init_en) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : begin
        if(fifo_data_out_valid) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : begin
        if(when_four2three_l288) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : begin
        if(when_four2three_l294) begin
          if(M_Ready) begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute;
          end else begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute;
          end
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : begin
        if(f2t_fsm_Last_Row) begin
          if(when_four2three_l304) begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE;
          end else begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute;
          end
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end
      end
      default : begin
      end
    endcase
    if(f2t_fsm_wantStart) begin
      f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE;
    end
    if(f2t_fsm_wantKill) begin
      f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT;
    end
  end

  assign when_four2three_l288 = (f2t_fsm_EN_Read_State && f2t_fsm_EN_Last_Cin);
  assign when_four2three_l294 = (f2t_fsm_Cnt_Ram == 2'b11);
  assign when_four2three_l304 = (_zz_when_four2three_l304 == _zz_when_four2three_l304_1);
  assign when_four2three_l58 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT);
  assign when_four2three_l77 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l94 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l104 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  assign when_four2three_l106 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE);
  assign when_four2three_l115 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute));
  assign when_four2three_l117 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  assign when_four2three_l122 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute));
  assign when_four2three_l314 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l314_1 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l314_2 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l314_3 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l163 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l198 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  assign when_four2three_l206 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  always @(posedge clk) begin
    if(reset) begin
      StartRow <= 1'b0;
      M_DATA <= 192'h0;
      M_Valid <= 1'b0;
      f2t_fsm_Cnt_ROW <= 11'h0;
      f2t_fsm_Cnt_Ram <= 2'b00;
      f2t_fsm_En_Ram <= 2'b00;
      f2t_fsm_addrRam1 <= 11'h0;
      f2t_fsm_addrRam2 <= 11'h0;
      f2t_fsm_addrRam3 <= 11'h0;
      f2t_fsm_addrRam4 <= 11'h0;
      f2t_fsm_rd_ram_cnt <= 3'b000;
      f2t_fsm_stateReg <= `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT;
    end else begin
      if(when_four2three_l104) begin
        f2t_fsm_Cnt_ROW <= (f2t_fsm_Cnt_ROW + 11'h001);
      end else begin
        if(when_four2three_l106) begin
          f2t_fsm_Cnt_ROW <= 11'h0;
        end else begin
          f2t_fsm_Cnt_ROW <= f2t_fsm_Cnt_ROW;
        end
      end
      if(when_four2three_l115) begin
        f2t_fsm_Cnt_Ram <= (f2t_fsm_Cnt_Ram + 2'b01);
      end else begin
        if(when_four2three_l117) begin
          f2t_fsm_Cnt_Ram <= (f2t_fsm_Cnt_Ram - 2'b01);
        end else begin
          f2t_fsm_Cnt_Ram <= f2t_fsm_Cnt_Ram;
        end
      end
      if(when_four2three_l122) begin
        f2t_fsm_En_Ram <= (f2t_fsm_En_Ram + 2'b01);
      end else begin
        f2t_fsm_En_Ram <= f2t_fsm_En_Ram;
      end
      if(when_four2three_l314) begin
        f2t_fsm_addrRam1 <= (f2t_fsm_addrRam1 + 11'h001);
      end else begin
        f2t_fsm_addrRam1 <= 11'h0;
      end
      if(when_four2three_l314_1) begin
        f2t_fsm_addrRam2 <= (f2t_fsm_addrRam2 + 11'h001);
      end else begin
        f2t_fsm_addrRam2 <= 11'h0;
      end
      if(when_four2three_l314_2) begin
        f2t_fsm_addrRam3 <= (f2t_fsm_addrRam3 + 11'h001);
      end else begin
        f2t_fsm_addrRam3 <= 11'h0;
      end
      if(when_four2three_l314_3) begin
        f2t_fsm_addrRam4 <= (f2t_fsm_addrRam4 + 11'h001);
      end else begin
        f2t_fsm_addrRam4 <= 11'h0;
      end
      if(when_four2three_l198) begin
        StartRow <= 1'b1;
      end else begin
        StartRow <= 1'b0;
      end
      if(when_four2three_l204) begin
        f2t_fsm_rd_ram_cnt <= 3'b000;
      end else begin
        if(when_four2three_l206) begin
          f2t_fsm_rd_ram_cnt <= (f2t_fsm_rd_ram_cnt + 3'b001);
        end else begin
          f2t_fsm_rd_ram_cnt <= f2t_fsm_rd_ram_cnt;
        end
      end
      if(M_rd_en) begin
        M_Valid <= 1'b1;
        case(f2t_fsm_rd_ram_cnt)
          3'b001 : begin
            M_DATA <= {{ram3_doutb,ram2_doutb},ram1_doutb};
          end
          3'b010 : begin
            M_DATA <= {{ram4_doutb,ram3_doutb},ram2_doutb};
          end
          3'b011 : begin
            M_DATA <= {{ram1_doutb,ram4_doutb},ram3_doutb};
          end
          3'b100 : begin
            M_DATA <= {{ram2_doutb,ram1_doutb},ram4_doutb};
          end
          default : begin
            M_DATA <= 192'h0;
          end
        endcase
      end else begin
        M_Valid <= 1'b0;
        M_DATA <= 192'h0;
      end
      f2t_fsm_stateReg <= f2t_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    if(when_four2three_l58) begin
      f2t_fsm_wait_cnt <= (f2t_fsm_wait_cnt + 6'h01);
    end else begin
      f2t_fsm_wait_cnt <= 6'h0;
    end
    if(when_four2three_l77) begin
      if(f2t_fsm_EN_Last_Cin) begin
        f2t_fsm_Cnt_Cin <= 10'h0;
      end else begin
        f2t_fsm_Cnt_Cin <= (f2t_fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      f2t_fsm_Cnt_Cin <= 10'h0;
    end
    if(when_four2three_l94) begin
      if(f2t_fsm_EN_Last_Cin) begin
        f2t_fsm_Cnt_Column <= (f2t_fsm_Cnt_Column + 11'h001);
      end else begin
        f2t_fsm_Cnt_Column <= f2t_fsm_Cnt_Column;
      end
    end else begin
      f2t_fsm_Cnt_Column <= 11'h0;
    end
  end


endmodule
