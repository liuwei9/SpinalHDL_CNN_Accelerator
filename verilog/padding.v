// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : padding
// Git hash  : d32cde3db027d89428574702988f88c1cdde3b16
// Date      : 16/09/2021, 21:40:14


module padding (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output reg          M_DATA_valid,
  input               M_DATA_ready,
  output reg [63:0]   M_DATA_payload,
  input      [10:0]   Row_Num_In_REG,
  input      [9:0]    Channel_In_Num_REG,
  input               Padding_REG,
  input      [7:0]    Zero_Point_REG,
  input      [2:0]    Zero_Num_REG,
  output     [10:0]   RowNum_After_Padding,
  input               reset,
  input               clk
);
  wire       [6:0]    count_mult_B;
  reg                 fifo_rd_en;
  wire       [10:0]   fifo_m_data_count;
  wire       [10:0]   count_mult_P;
  wire                fifo_data_in_ready;
  wire       [63:0]   fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [10:0]   _zz_Out_Size;
  wire       [4:0]    _zz_Out_Size_1;
  wire       [10:0]   _zz_when_padding_l103;
  wire       [2:0]    _zz_when_padding_l103_1;
  wire       [10:0]   _zz_when_padding_l103_2;
  wire       [10:0]   _zz_when_padding_l103_3;
  wire       [10:0]   _zz_when_padding_l103_4;
  wire       [2:0]    _zz_when_padding_l103_5;
  wire       [9:0]    _zz_when_padding_l111;
  wire       [6:0]    _zz_when_padding_l111_1;
  wire       [10:0]   _zz_when_padding_l129;
  wire       [10:0]   _zz_when_padding_l145;
  wire       [6:0]    Channel_Times;
  reg        [63:0]   Zero_Point;
  reg                 EN_Row0;
  reg                 EN_Row1;
  reg                 EN_Col0;
  reg                 EN_Col1;
  reg        [10:0]   Row_Num_In_REG_regNext;
  wire       [10:0]   In_Size;
  reg        [10:0]   Out_Size;
  wire                padding_fsm_wantExit;
  reg                 padding_fsm_wantStart;
  wire                padding_fsm_wantKill;
  reg        [5:0]    padding_fsm_wait_cnt;
  wire                when_padding_l82;
  reg                 padding_fsm_init_en;
  wire                when_padding_l88;
  reg        [10:0]   padding_fsm_Cnt_Row;
  wire                when_padding_l95;
  wire                when_padding_l97;
  reg                 padding_fsm_EN_Left_Padding;
  wire                when_padding_l103;
  reg        [9:0]    padding_fsm_Cnt_Cin;
  reg                 padding_fsm_EN_Last_Cin;
  wire                when_padding_l111;
  wire                when_padding_l116;
  reg        [10:0]   padding_fsm_Cnt_Column;
  reg                 padding_fsm_EN_Row_Read;
  wire                when_padding_l129;
  wire                when_padding_l134;
  reg                 padding_fsm_EN_Judge_Row;
  wire                when_padding_l145;
  wire                when_padding_l151;
  wire                when_padding_l157;
  wire                when_padding_l163;
  wire                when_padding_l165;
  reg        `padding_fsm_enumDefinition_binary_sequential_type padding_fsm_stateReg;
  reg        `padding_fsm_enumDefinition_binary_sequential_type padding_fsm_stateNext;
  wire                when_padding_l206;
  wire                when_padding_l236;
  `ifndef SYNTHESIS
  reg [231:0] padding_fsm_stateReg_string;
  reg [231:0] padding_fsm_stateNext_string;
  `endif


  assign _zz_Out_Size_1 = (2'b10 * Zero_Num_REG);
  assign _zz_Out_Size = {6'd0, _zz_Out_Size_1};
  assign _zz_when_padding_l103_1 = Zero_Num_REG;
  assign _zz_when_padding_l103 = {8'd0, _zz_when_padding_l103_1};
  assign _zz_when_padding_l103_2 = (_zz_when_padding_l103_3 - 11'h001);
  assign _zz_when_padding_l103_3 = (Out_Size - _zz_when_padding_l103_4);
  assign _zz_when_padding_l103_5 = Zero_Num_REG;
  assign _zz_when_padding_l103_4 = {8'd0, _zz_when_padding_l103_5};
  assign _zz_when_padding_l111_1 = (Channel_Times - 7'h01);
  assign _zz_when_padding_l111 = {3'd0, _zz_when_padding_l111_1};
  assign _zz_when_padding_l129 = (In_Size - 11'h001);
  assign _zz_when_padding_l145 = (Out_Size - 11'h001);
  mul count_mult (
    .A        (Row_Num_In_REG  ), //i
    .B        (count_mult_B    ), //i
    .P        (count_mult_P    ), //o
    .clk      (clk             ), //i
    .reset    (reset           )  //i
  );
  padding_fifo fifo (
    .reset             (reset                ), //i
    .clk               (clk                  ), //i
    .data_in           (S_DATA_payload       ), //i
    .wr_en             (S_DATA_valid         ), //i
    .data_in_ready     (fifo_data_in_ready   ), //o
    .data_out          (fifo_data_out        ), //o
    .rd_en             (fifo_rd_en           ), //i
    .data_out_valid    (fifo_data_out_valid  ), //o
    .m_data_count      (fifo_m_data_count    ), //i
    .data_valid        (fifo_data_valid      ), //o
    .full              (fifo_full            ), //o
    .empty             (fifo_empty           )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT : padding_fsm_stateReg_string = "padding_fsm_BOOT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : padding_fsm_stateReg_string = "padding_fsm_IDLE             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : padding_fsm_stateReg_string = "padding_fsm_INIT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : padding_fsm_stateReg_string = "padding_fsm_M_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : padding_fsm_stateReg_string = "padding_fsm_S_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : padding_fsm_stateReg_string = "padding_fsm_M_Row_Read       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : padding_fsm_stateReg_string = "padding_fsm_Judge_Row        ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : padding_fsm_stateReg_string = "padding_fsm_S_Left_Padding   ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : padding_fsm_stateReg_string = "padding_fsm_M_Up_Down_Padding";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : padding_fsm_stateReg_string = "padding_fsm_M_Right_Padding  ";
      default : padding_fsm_stateReg_string = "?????????????????????????????";
    endcase
  end
  always @(*) begin
    case(padding_fsm_stateNext)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT : padding_fsm_stateNext_string = "padding_fsm_BOOT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : padding_fsm_stateNext_string = "padding_fsm_IDLE             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : padding_fsm_stateNext_string = "padding_fsm_INIT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : padding_fsm_stateNext_string = "padding_fsm_M_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : padding_fsm_stateNext_string = "padding_fsm_S_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : padding_fsm_stateNext_string = "padding_fsm_M_Row_Read       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : padding_fsm_stateNext_string = "padding_fsm_Judge_Row        ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : padding_fsm_stateNext_string = "padding_fsm_S_Left_Padding   ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : padding_fsm_stateNext_string = "padding_fsm_M_Up_Down_Padding";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : padding_fsm_stateNext_string = "padding_fsm_M_Right_Padding  ";
      default : padding_fsm_stateNext_string = "?????????????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_In_Num_REG >>> 3);
  always @(*) begin
    Zero_Point[7 : 0] = Zero_Point_REG;
    Zero_Point[15 : 8] = Zero_Point_REG;
    Zero_Point[23 : 16] = Zero_Point_REG;
    Zero_Point[31 : 24] = Zero_Point_REG;
    Zero_Point[39 : 32] = Zero_Point_REG;
    Zero_Point[47 : 40] = Zero_Point_REG;
    Zero_Point[55 : 48] = Zero_Point_REG;
    Zero_Point[63 : 56] = Zero_Point_REG;
  end

  assign count_mult_B = Channel_Times;
  assign S_DATA_ready = fifo_data_in_ready;
  assign fifo_m_data_count = count_mult_P;
  always @(*) begin
    if(Padding_REG) begin
      EN_Row0 = 1'b1;
    end else begin
      EN_Row0 = 1'b0;
    end
  end

  always @(*) begin
    if(Padding_REG) begin
      EN_Row1 = 1'b1;
    end else begin
      EN_Row1 = 1'b0;
    end
  end

  always @(*) begin
    if(Padding_REG) begin
      EN_Col0 = 1'b1;
    end else begin
      EN_Col0 = 1'b0;
    end
  end

  always @(*) begin
    if(Padding_REG) begin
      EN_Col1 = 1'b1;
    end else begin
      EN_Col1 = 1'b0;
    end
  end

  assign In_Size = Row_Num_In_REG_regNext;
  always @(*) begin
    if(Padding_REG) begin
      Out_Size = (Row_Num_In_REG + _zz_Out_Size);
    end else begin
      Out_Size = Row_Num_In_REG;
    end
  end

  assign RowNum_After_Padding = Out_Size;
  assign padding_fsm_wantExit = 1'b0;
  always @(*) begin
    padding_fsm_wantStart = 1'b0;
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : begin
      end
      default : begin
        padding_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign padding_fsm_wantKill = 1'b0;
  assign when_padding_l88 = (padding_fsm_wait_cnt == 6'h05);
  always @(*) begin
    if(when_padding_l88) begin
      padding_fsm_init_en = 1'b1;
    end else begin
      padding_fsm_init_en = 1'b0;
    end
  end

  assign when_padding_l103 = ((EN_Row0 && (padding_fsm_Cnt_Row < _zz_when_padding_l103)) || (EN_Row1 && (_zz_when_padding_l103_2 < padding_fsm_Cnt_Row)));
  always @(*) begin
    if(when_padding_l103) begin
      padding_fsm_EN_Left_Padding = 1'b1;
    end else begin
      padding_fsm_EN_Left_Padding = 1'b0;
    end
  end

  assign when_padding_l111 = (padding_fsm_Cnt_Cin == _zz_when_padding_l111);
  always @(*) begin
    if(when_padding_l111) begin
      padding_fsm_EN_Last_Cin = 1'b1;
    end else begin
      padding_fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_padding_l116 = ((((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding));
  assign when_padding_l129 = ((padding_fsm_Cnt_Column == _zz_when_padding_l129) && padding_fsm_EN_Last_Cin);
  always @(*) begin
    if(when_padding_l129) begin
      padding_fsm_EN_Row_Read = 1'b1;
    end else begin
      padding_fsm_EN_Row_Read = 1'b0;
    end
  end

  assign when_padding_l134 = ((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding));
  assign when_padding_l145 = (padding_fsm_Cnt_Row == _zz_when_padding_l145);
  always @(*) begin
    if(when_padding_l145) begin
      padding_fsm_EN_Judge_Row = 1'b1;
    end else begin
      padding_fsm_EN_Judge_Row = 1'b0;
    end
  end

  always @(*) begin
    if(when_padding_l151) begin
      fifo_rd_en = 1'b1;
    end else begin
      fifo_rd_en = 1'b0;
    end
  end

  assign when_padding_l157 = ((((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read));
  always @(*) begin
    if(when_padding_l157) begin
      M_DATA_valid = 1'b1;
    end else begin
      M_DATA_valid = 1'b0;
    end
  end

  assign when_padding_l163 = (((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding));
  always @(*) begin
    if(when_padding_l163) begin
      M_DATA_payload = Zero_Point;
    end else begin
      if(when_padding_l165) begin
        M_DATA_payload = fifo_data_out;
      end else begin
        M_DATA_payload = 64'h0;
      end
    end
  end

  always @(*) begin
    padding_fsm_stateNext = padding_fsm_stateReg;
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : begin
        if(Start) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : begin
        if(padding_fsm_init_en) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : begin
        if(M_DATA_ready) begin
          if(EN_Row0) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : begin
        if(fifo_data_out_valid) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : begin
        if(padding_fsm_EN_Row_Read) begin
          if(when_padding_l206) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : begin
        if(padding_fsm_EN_Judge_Row) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : begin
        if(padding_fsm_EN_Left_Padding) begin
          if(padding_fsm_EN_Last_Cin) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding;
          end
        end else begin
          if(padding_fsm_EN_Last_Cin) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding;
          end
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : begin
        if(padding_fsm_EN_Row_Read) begin
          if(when_padding_l236) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : begin
        if(padding_fsm_EN_Last_Cin) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
        end
      end
      default : begin
      end
    endcase
    if(padding_fsm_wantStart) begin
      padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
    end
    if(padding_fsm_wantKill) begin
      padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT;
    end
  end

  assign when_padding_l206 = (! EN_Col1);
  assign when_padding_l236 = (! EN_Col1);
  assign when_padding_l82 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT);
  assign when_padding_l95 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row);
  assign when_padding_l97 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE);
  assign when_padding_l151 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read);
  assign when_padding_l165 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read);
  always @(posedge clk) begin
    Row_Num_In_REG_regNext <= Row_Num_In_REG;
    if(when_padding_l82) begin
      padding_fsm_wait_cnt <= (padding_fsm_wait_cnt + 6'h01);
    end else begin
      padding_fsm_wait_cnt <= 6'h0;
    end
    if(when_padding_l95) begin
      padding_fsm_Cnt_Row <= (padding_fsm_Cnt_Row + 11'h001);
    end else begin
      if(when_padding_l97) begin
        padding_fsm_Cnt_Row <= 11'h0;
      end else begin
        padding_fsm_Cnt_Row <= padding_fsm_Cnt_Row;
      end
    end
    if(when_padding_l116) begin
      if(padding_fsm_EN_Last_Cin) begin
        padding_fsm_Cnt_Cin <= 10'h0;
      end else begin
        padding_fsm_Cnt_Cin <= (padding_fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      padding_fsm_Cnt_Cin <= 10'h0;
    end
    if(when_padding_l134) begin
      if(padding_fsm_EN_Last_Cin) begin
        padding_fsm_Cnt_Column <= (padding_fsm_Cnt_Column + 11'h001);
      end else begin
        padding_fsm_Cnt_Column <= padding_fsm_Cnt_Column;
      end
    end else begin
      padding_fsm_Cnt_Column <= 11'h0;
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      padding_fsm_stateReg <= `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT;
    end else begin
      padding_fsm_stateReg <= padding_fsm_stateNext;
    end
  end


endmodule
