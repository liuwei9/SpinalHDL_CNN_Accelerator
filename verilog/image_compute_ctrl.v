// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_compute_ctrl
// Git hash  : 627187c3e57e5afa461430fb3119888a5e0edda4
// Date      : 06/08/2021, 19:31:59


module image_compute_ctrl (
  input               Start,
  input               compute_fifo_ready,
  input               M_Ready,
  output reg          Compute_Complete,
  output              Conv_Complete,
  output reg          rd_en_fifo,
  output              M_Valid,
  output reg [2:0]    weight_select,
  input               clk,
  input               reset
);
  wire       [2:0]    _zz_when_image_compute_ctrl_l37;
  wire       [2:0]    _zz_when_image_compute_ctrl_l46;
  wire       [2:0]    _zz_when_image_compute_ctrl_l57;
  reg                 Compute_Complete_delay_1;
  reg                 Compute_Complete_delay_2;
  reg                 Compute_Complete_delay_3;
  reg                 Compute_Complete_delay_4;
  reg                 Compute_Complete_delay_5;
  reg                 Compute_Complete_delay_6;
  reg                 Compute_Complete_delay_7;
  reg                 Compute_Complete_delay_8;
  reg                 Compute_Complete_delay_9;
  reg                 Compute_Complete_delay_10;
  reg                 Compute_Complete_delay_11;
  reg                 Compute_Complete_delay_12;
  reg                 Compute_Complete_delay_13;
  reg                 Compute_Complete_delay_14;
  wire                image_cmp_ctrl_fsm_wantExit;
  reg                 image_cmp_ctrl_fsm_wantStart;
  wire                image_cmp_ctrl_fsm_wantKill;
  reg                 image_cmp_ctrl_fsm_En_Compute_Column;
  wire       [2:0]    image_cmp_ctrl_fsm_COMPUTE_TIMES_CHANNEL_OUT_REG;
  reg        [2:0]    image_cmp_ctrl_fsm_Cnt_Channel_Out_Num;
  reg        [11:0]   image_cmp_ctrl_fsm_Cnt_Column;
  wire                when_image_compute_ctrl_l36;
  wire                when_image_compute_ctrl_l37;
  wire                when_image_compute_ctrl_l45;
  wire                when_image_compute_ctrl_l46;
  wire                when_image_compute_ctrl_l57;
  reg                 image_cmp_ctrl_fsm_En_Compute_Row;
  reg        [11:0]   image_cmp_ctrl_fsm_Cnt_Row;
  wire                when_image_compute_ctrl_l65;
  wire                when_image_compute_ctrl_l67;
  wire                when_image_compute_ctrl_l72;
  wire                when_image_compute_ctrl_l78;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid;
  wire                when_image_compute_ctrl_l85;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_1;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_2;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_3;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_4;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_5;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_6;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_7;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_8;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_9;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_10;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_11;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_12;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_13;
  reg                 image_cmp_ctrl_fsm_M_Fifo_Valid_delay_14;
  reg        `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_type image_cmp_ctrl_fsm_stateReg;
  reg        `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_type image_cmp_ctrl_fsm_stateNext;
  `ifndef SYNTHESIS
  reg [287:0] image_cmp_ctrl_fsm_stateReg_string;
  reg [287:0] image_cmp_ctrl_fsm_stateNext_string;
  `endif


  assign _zz_when_image_compute_ctrl_l37 = (image_cmp_ctrl_fsm_COMPUTE_TIMES_CHANNEL_OUT_REG - 3'b001);
  assign _zz_when_image_compute_ctrl_l46 = (image_cmp_ctrl_fsm_COMPUTE_TIMES_CHANNEL_OUT_REG - 3'b001);
  assign _zz_when_image_compute_ctrl_l57 = (image_cmp_ctrl_fsm_COMPUTE_TIMES_CHANNEL_OUT_REG - 3'b001);
  `ifndef SYNTHESIS
  always @(*) begin
    case(image_cmp_ctrl_fsm_stateReg)
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_BOOT : image_cmp_ctrl_fsm_stateReg_string = "image_cmp_ctrl_fsm_BOOT             ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE : image_cmp_ctrl_fsm_stateReg_string = "image_cmp_ctrl_fsm_IDLE             ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo : image_cmp_ctrl_fsm_stateReg_string = "image_cmp_ctrl_fsm_Judge_Before_Fifo";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_After_Fifo : image_cmp_ctrl_fsm_stateReg_string = "image_cmp_ctrl_fsm_Judge_After_Fifo ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute : image_cmp_ctrl_fsm_stateReg_string = "image_cmp_ctrl_fsm_Compute          ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row : image_cmp_ctrl_fsm_stateReg_string = "image_cmp_ctrl_fsm_Judge_Row        ";
      default : image_cmp_ctrl_fsm_stateReg_string = "????????????????????????????????????";
    endcase
  end
  always @(*) begin
    case(image_cmp_ctrl_fsm_stateNext)
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_BOOT : image_cmp_ctrl_fsm_stateNext_string = "image_cmp_ctrl_fsm_BOOT             ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE : image_cmp_ctrl_fsm_stateNext_string = "image_cmp_ctrl_fsm_IDLE             ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo : image_cmp_ctrl_fsm_stateNext_string = "image_cmp_ctrl_fsm_Judge_Before_Fifo";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_After_Fifo : image_cmp_ctrl_fsm_stateNext_string = "image_cmp_ctrl_fsm_Judge_After_Fifo ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute : image_cmp_ctrl_fsm_stateNext_string = "image_cmp_ctrl_fsm_Compute          ";
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row : image_cmp_ctrl_fsm_stateNext_string = "image_cmp_ctrl_fsm_Judge_Row        ";
      default : image_cmp_ctrl_fsm_stateNext_string = "????????????????????????????????????";
    endcase
  end
  `endif

  assign Conv_Complete = Compute_Complete_delay_14;
  assign image_cmp_ctrl_fsm_wantExit = 1'b0;
  always @(*) begin
    image_cmp_ctrl_fsm_wantStart = 1'b0;
    case(image_cmp_ctrl_fsm_stateReg)
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE : begin
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo : begin
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_After_Fifo : begin
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute : begin
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row : begin
      end
      default : begin
        image_cmp_ctrl_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign image_cmp_ctrl_fsm_wantKill = 1'b0;
  assign image_cmp_ctrl_fsm_COMPUTE_TIMES_CHANNEL_OUT_REG = 3'b100;
  assign when_image_compute_ctrl_l37 = (image_cmp_ctrl_fsm_Cnt_Channel_Out_Num == _zz_when_image_compute_ctrl_l37);
  assign when_image_compute_ctrl_l46 = (image_cmp_ctrl_fsm_Cnt_Channel_Out_Num == _zz_when_image_compute_ctrl_l46);
  assign when_image_compute_ctrl_l57 = ((image_cmp_ctrl_fsm_Cnt_Channel_Out_Num == _zz_when_image_compute_ctrl_l57) && (image_cmp_ctrl_fsm_Cnt_Column == 12'h27f));
  always @(*) begin
    if(when_image_compute_ctrl_l57) begin
      image_cmp_ctrl_fsm_En_Compute_Column = 1'b1;
    end else begin
      image_cmp_ctrl_fsm_En_Compute_Column = 1'b0;
    end
  end

  assign when_image_compute_ctrl_l72 = (image_cmp_ctrl_fsm_Cnt_Row == 12'h27f);
  always @(*) begin
    if(when_image_compute_ctrl_l72) begin
      image_cmp_ctrl_fsm_En_Compute_Row = 1'b1;
    end else begin
      image_cmp_ctrl_fsm_En_Compute_Row = 1'b0;
    end
  end

  assign M_Valid = image_cmp_ctrl_fsm_M_Fifo_Valid_delay_14;
  always @(*) begin
    image_cmp_ctrl_fsm_stateNext = image_cmp_ctrl_fsm_stateReg;
    case(image_cmp_ctrl_fsm_stateReg)
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE : begin
        if(Start) begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo;
        end else begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE;
        end
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo : begin
        if(compute_fifo_ready) begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_After_Fifo;
        end else begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo;
        end
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_After_Fifo : begin
        if(M_Ready) begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute;
        end else begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_After_Fifo;
        end
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute : begin
        if(image_cmp_ctrl_fsm_En_Compute_Column) begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row;
        end else begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute;
        end
      end
      `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row : begin
        if(image_cmp_ctrl_fsm_En_Compute_Row) begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE;
        end else begin
          image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Before_Fifo;
        end
      end
      default : begin
      end
    endcase
    if(image_cmp_ctrl_fsm_wantStart) begin
      image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE;
    end
    if(image_cmp_ctrl_fsm_wantKill) begin
      image_cmp_ctrl_fsm_stateNext = `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_BOOT;
    end
  end

  assign when_image_compute_ctrl_l36 = (image_cmp_ctrl_fsm_stateReg == `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute);
  assign when_image_compute_ctrl_l45 = (image_cmp_ctrl_fsm_stateReg == `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute);
  assign when_image_compute_ctrl_l65 = ((image_cmp_ctrl_fsm_stateNext == `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row) && (image_cmp_ctrl_fsm_stateReg != `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Judge_Row));
  assign when_image_compute_ctrl_l67 = (image_cmp_ctrl_fsm_stateReg == `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE);
  assign when_image_compute_ctrl_l78 = ((image_cmp_ctrl_fsm_stateNext == `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE) && (image_cmp_ctrl_fsm_stateReg != `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_IDLE));
  assign when_image_compute_ctrl_l85 = (image_cmp_ctrl_fsm_stateReg == `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_Compute);
  always @(posedge clk) begin
    if(reset) begin
      Compute_Complete <= 1'b0;
      rd_en_fifo <= 1'b0;
      weight_select <= 3'b000;
      image_cmp_ctrl_fsm_Cnt_Channel_Out_Num <= 3'b000;
      image_cmp_ctrl_fsm_Cnt_Column <= 12'h0;
      image_cmp_ctrl_fsm_Cnt_Row <= 12'h0;
      image_cmp_ctrl_fsm_M_Fifo_Valid <= 1'b0;
      image_cmp_ctrl_fsm_stateReg <= `image_cmp_ctrl_fsm_enumDefinition_binary_sequential_image_cmp_ctrl_fsm_BOOT;
    end else begin
      if(when_image_compute_ctrl_l36) begin
        if(when_image_compute_ctrl_l37) begin
          image_cmp_ctrl_fsm_Cnt_Channel_Out_Num <= 3'b000;
        end else begin
          image_cmp_ctrl_fsm_Cnt_Channel_Out_Num <= (image_cmp_ctrl_fsm_Cnt_Channel_Out_Num + 3'b001);
        end
      end else begin
        image_cmp_ctrl_fsm_Cnt_Channel_Out_Num <= 3'b000;
      end
      if(when_image_compute_ctrl_l45) begin
        if(when_image_compute_ctrl_l46) begin
          rd_en_fifo <= 1'b1;
          image_cmp_ctrl_fsm_Cnt_Column <= (image_cmp_ctrl_fsm_Cnt_Column + 12'h001);
        end else begin
          rd_en_fifo <= 1'b0;
          image_cmp_ctrl_fsm_Cnt_Column <= image_cmp_ctrl_fsm_Cnt_Column;
        end
      end else begin
        rd_en_fifo <= 1'b0;
        image_cmp_ctrl_fsm_Cnt_Channel_Out_Num <= 3'b000;
      end
      if(when_image_compute_ctrl_l65) begin
        image_cmp_ctrl_fsm_Cnt_Row <= (image_cmp_ctrl_fsm_Cnt_Row + 12'h001);
      end else begin
        if(when_image_compute_ctrl_l67) begin
          image_cmp_ctrl_fsm_Cnt_Row <= 12'h0;
        end else begin
          image_cmp_ctrl_fsm_Cnt_Row <= image_cmp_ctrl_fsm_Cnt_Row;
        end
      end
      if(when_image_compute_ctrl_l78) begin
        Compute_Complete <= 1'b1;
      end else begin
        Compute_Complete <= 1'b0;
      end
      if(when_image_compute_ctrl_l85) begin
        image_cmp_ctrl_fsm_M_Fifo_Valid <= 1'b1;
      end else begin
        image_cmp_ctrl_fsm_M_Fifo_Valid <= 1'b0;
      end
      case(image_cmp_ctrl_fsm_Cnt_Channel_Out_Num)
        3'b000 : begin
          weight_select <= 3'b001;
        end
        3'b001 : begin
          weight_select <= 3'b010;
        end
        3'b010 : begin
          weight_select <= 3'b011;
        end
        3'b011 : begin
          weight_select <= 3'b100;
        end
        default : begin
          weight_select <= 3'b000;
        end
      endcase
      image_cmp_ctrl_fsm_stateReg <= image_cmp_ctrl_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    Compute_Complete_delay_1 <= Compute_Complete;
    Compute_Complete_delay_2 <= Compute_Complete_delay_1;
    Compute_Complete_delay_3 <= Compute_Complete_delay_2;
    Compute_Complete_delay_4 <= Compute_Complete_delay_3;
    Compute_Complete_delay_5 <= Compute_Complete_delay_4;
    Compute_Complete_delay_6 <= Compute_Complete_delay_5;
    Compute_Complete_delay_7 <= Compute_Complete_delay_6;
    Compute_Complete_delay_8 <= Compute_Complete_delay_7;
    Compute_Complete_delay_9 <= Compute_Complete_delay_8;
    Compute_Complete_delay_10 <= Compute_Complete_delay_9;
    Compute_Complete_delay_11 <= Compute_Complete_delay_10;
    Compute_Complete_delay_12 <= Compute_Complete_delay_11;
    Compute_Complete_delay_13 <= Compute_Complete_delay_12;
    Compute_Complete_delay_14 <= Compute_Complete_delay_13;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_1 <= image_cmp_ctrl_fsm_M_Fifo_Valid;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_2 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_1;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_3 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_2;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_4 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_3;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_5 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_4;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_6 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_5;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_7 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_6;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_8 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_7;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_9 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_8;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_10 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_9;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_11 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_10;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_12 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_11;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_13 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_12;
    image_cmp_ctrl_fsm_M_Fifo_Valid_delay_14 <= image_cmp_ctrl_fsm_M_Fifo_Valid_delay_13;
  end


endmodule