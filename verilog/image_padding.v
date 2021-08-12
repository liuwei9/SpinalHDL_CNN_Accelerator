// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_padding
// Git hash  : 273c3163e7ad111796d5ae7321f4b13ac23942b4
// Date      : 12/08/2021, 11:18:31


module image_padding (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [7:0]    S_DATA_payload,
  output reg          M_DATA_valid,
  input               M_DATA_ready,
  output reg [7:0]    M_DATA_payload,
  output     [11:0]   Row_Num_After_Padding,
  output reg          Last,
  input               reset,
  input               clk
);
  reg                 padding_fifo_rd_en;
  wire                padding_fifo_data_in_ready;
  wire       [7:0]    padding_fifo_data_out;
  wire                padding_fifo_data_out_valid;
  wire       [11:0]   _zz__zz_Row_Num_After_Padding;
  wire       [1:0]    _zz__zz_Row_Num_After_Padding_1;
  wire       [11:0]   _zz_when_padding_l52;
  wire       [11:0]   _zz_when_padding_l75;
  wire       [11:0]   in_size;
  reg        [11:0]   _zz_Row_Num_After_Padding;
  wire                EN_Row0;
  wire                EN_Row1;
  wire                EN_Col0;
  wire                EN_Col1;
  wire                padding_fsm_wantExit;
  reg                 padding_fsm_wantStart;
  wire                padding_fsm_wantKill;
  reg                 padding_fsm_EN_Row_Read;
  reg        [11:0]   padding_fsm_Cnt_Column;
  wire                when_padding_l52;
  wire                when_padding_l55;
  reg                 padding_fsm_EN_Judge_Row;
  reg        [11:0]   padding_fsm_Cnt_Row;
  wire                when_padding_l65;
  wire                when_padding_l67;
  wire                when_padding_l70;
  reg                 padding_fsm_EN_UP_DOWN_Padding;
  wire                when_padding_l75;
  wire                when_padding_l137;
  wire                when_padding_l145;
  wire                when_padding_l147;
  wire                when_padding_l152;
  reg        `padding_fsm_enumDefinition_binary_sequential_type padding_fsm_stateReg;
  reg        `padding_fsm_enumDefinition_binary_sequential_type padding_fsm_stateNext;
  wire                when_padding_l121;
  wire                when_padding_l101;
  `ifndef SYNTHESIS
  reg [231:0] padding_fsm_stateReg_string;
  reg [231:0] padding_fsm_stateNext_string;
  `endif


  assign _zz__zz_Row_Num_After_Padding_1 = 2'b10;
  assign _zz__zz_Row_Num_After_Padding = {10'd0, _zz__zz_Row_Num_After_Padding_1};
  assign _zz_when_padding_l52 = (in_size - 12'h001);
  assign _zz_when_padding_l75 = (Row_Num_After_Padding - 12'h001);
  image_padding_fifo padding_fifo (
    .reset             (reset                        ), //i
    .clk               (clk                          ), //i
    .data_in           (S_DATA_payload               ), //i
    .wr_en             (S_DATA_valid                 ), //i
    .data_in_ready     (padding_fifo_data_in_ready   ), //o
    .data_out          (padding_fifo_data_out        ), //o
    .rd_en             (padding_fifo_rd_en           ), //i
    .data_out_valid    (padding_fifo_data_out_valid  ), //o
    .m_data_count      (12'h280                      )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT : padding_fsm_stateReg_string = "padding_fsm_BOOT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : padding_fsm_stateReg_string = "padding_fsm_IDLE             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : padding_fsm_stateReg_string = "padding_fsm_M_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : padding_fsm_stateReg_string = "padding_fsm_S_Left_Padding   ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : padding_fsm_stateReg_string = "padding_fsm_S_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : padding_fsm_stateReg_string = "padding_fsm_M_Up_Down_Padding";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : padding_fsm_stateReg_string = "padding_fsm_M_Right_Padding  ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : padding_fsm_stateReg_string = "padding_fsm_M_Row_Read       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : padding_fsm_stateReg_string = "padding_fsm_Judge_Row        ";
      default : padding_fsm_stateReg_string = "?????????????????????????????";
    endcase
  end
  always @(*) begin
    case(padding_fsm_stateNext)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT : padding_fsm_stateNext_string = "padding_fsm_BOOT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : padding_fsm_stateNext_string = "padding_fsm_IDLE             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : padding_fsm_stateNext_string = "padding_fsm_M_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : padding_fsm_stateNext_string = "padding_fsm_S_Left_Padding   ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : padding_fsm_stateNext_string = "padding_fsm_S_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : padding_fsm_stateNext_string = "padding_fsm_M_Up_Down_Padding";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : padding_fsm_stateNext_string = "padding_fsm_M_Right_Padding  ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : padding_fsm_stateNext_string = "padding_fsm_M_Row_Read       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : padding_fsm_stateNext_string = "padding_fsm_Judge_Row        ";
      default : padding_fsm_stateNext_string = "?????????????????????????????";
    endcase
  end
  `endif

  assign in_size = 12'h280;
  assign Row_Num_After_Padding = _zz_Row_Num_After_Padding;
  assign EN_Row0 = 1'b1;
  assign EN_Row1 = 1'b1;
  assign EN_Col0 = 1'b1;
  assign EN_Col1 = 1'b1;
  assign S_DATA_ready = padding_fifo_data_in_ready;
  assign padding_fsm_wantExit = 1'b0;
  always @(*) begin
    padding_fsm_wantStart = 1'b0;
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : begin
      end
      default : begin
        padding_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign padding_fsm_wantKill = 1'b0;
  assign when_padding_l52 = (padding_fsm_Cnt_Column == _zz_when_padding_l52);
  always @(*) begin
    if(when_padding_l52) begin
      padding_fsm_EN_Row_Read = 1'b1;
    end else begin
      padding_fsm_EN_Row_Read = 1'b0;
    end
  end

  assign when_padding_l55 = ((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding));
  assign when_padding_l70 = (padding_fsm_Cnt_Row == Row_Num_After_Padding);
  always @(*) begin
    if(when_padding_l70) begin
      padding_fsm_EN_Judge_Row = 1'b1;
    end else begin
      padding_fsm_EN_Judge_Row = 1'b0;
    end
  end

  assign when_padding_l75 = ((padding_fsm_Cnt_Row == 12'h0) || (padding_fsm_Cnt_Row == _zz_when_padding_l75));
  always @(*) begin
    if(when_padding_l75) begin
      padding_fsm_EN_UP_DOWN_Padding = 1'b1;
    end else begin
      padding_fsm_EN_UP_DOWN_Padding = 1'b0;
    end
  end

  assign when_padding_l137 = ((((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read));
  assign when_padding_l145 = (((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding));
  always @(*) begin
    if(when_padding_l152) begin
      padding_fifo_rd_en = 1'b1;
    end else begin
      padding_fifo_rd_en = 1'b0;
    end
  end

  always @(*) begin
    padding_fsm_stateNext = padding_fsm_stateReg;
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : begin
        if(Start) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
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
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : begin
        if(padding_fsm_EN_UP_DOWN_Padding) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : begin
        if(padding_fifo_data_out_valid) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : begin
        if(padding_fsm_EN_Row_Read) begin
          if(when_padding_l121) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : begin
        padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : begin
        if(padding_fsm_EN_Row_Read) begin
          if(when_padding_l101) begin
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

  assign when_padding_l121 = (! EN_Col1);
  assign when_padding_l101 = (! EN_Col1);
  assign when_padding_l65 = ((padding_fsm_stateNext == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row) && (padding_fsm_stateReg != `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row));
  assign when_padding_l67 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE);
  assign when_padding_l147 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read);
  assign when_padding_l152 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read);
  always @(posedge clk) begin
    if(reset) begin
      Last <= 1'b0;
      padding_fsm_Cnt_Column <= 12'h0;
      padding_fsm_Cnt_Row <= 12'h0;
      padding_fsm_stateReg <= `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT;
    end else begin
      if(when_padding_l55) begin
        padding_fsm_Cnt_Column <= (padding_fsm_Cnt_Column + 12'h001);
      end else begin
        padding_fsm_Cnt_Column <= 12'h0;
      end
      if(padding_fsm_EN_Judge_Row) begin
        Last <= 1'b1;
      end else begin
        Last <= 1'b0;
      end
      if(when_padding_l65) begin
        padding_fsm_Cnt_Row <= (padding_fsm_Cnt_Row + 12'h001);
      end else begin
        if(when_padding_l67) begin
          padding_fsm_Cnt_Row <= 12'h0;
        end else begin
          padding_fsm_Cnt_Row <= padding_fsm_Cnt_Row;
        end
      end
      padding_fsm_stateReg <= padding_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    _zz_Row_Num_After_Padding <= (in_size + _zz__zz_Row_Num_After_Padding);
    if(when_padding_l137) begin
      M_DATA_valid <= 1'b1;
    end else begin
      M_DATA_valid <= 1'b0;
    end
    if(when_padding_l145) begin
      M_DATA_payload <= 8'h0;
    end else begin
      if(when_padding_l147) begin
        M_DATA_payload <= padding_fifo_data_out;
      end else begin
        M_DATA_payload <= 8'h0;
      end
    end
  end


endmodule
