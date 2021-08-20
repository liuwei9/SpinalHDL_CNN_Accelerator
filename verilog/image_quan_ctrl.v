// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_ctrl
// Git hash  : 7cff059cfd45157f7b8458b21b9667f4b8ae1e40
// Date      : 20/08/2021, 12:03:13


module image_quan_ctrl (
  input               fifo_valid,
  input               M_Ready,
  output reg          rd_en_fifo,
  output reg [3:0]    para_select,
  output              M_Valid,
  input               clk,
  input               reset
);
  wire                image_quan_fsm_wantExit;
  reg                 image_quan_fsm_wantStart;
  wire                image_quan_fsm_wantKill;
  reg        [3:0]    image_quan_fsm_Cnt_Cout;
  reg                 image_quan_fsm_En_Last_Cout;
  wire                when_image_quan_ctrl_l27;
  wire                when_image_quan_ctrl_l32;
  wire                when_image_quan_ctrl_l33;
  reg        [11:0]   image_quan_fsm_Cnt_Column;
  reg                 image_quan_fsm_En_Last_Column;
  wire                when_image_quan_ctrl_l43;
  wire                when_image_quan_ctrl_l53;
  reg                 image_quan_fsm_M_Valid_Temp;
  wire                when_image_quan_ctrl_l97;
  reg                 image_quan_fsm_M_Valid_Temp_delay_1;
  reg                 image_quan_fsm_M_Valid_Temp_delay_2;
  reg                 image_quan_fsm_M_Valid_Temp_delay_3;
  reg                 image_quan_fsm_M_Valid_Temp_delay_4;
  reg                 image_quan_fsm_M_Valid_Temp_delay_5;
  reg                 image_quan_fsm_M_Valid_Temp_delay_6;
  reg                 image_quan_fsm_M_Valid_Temp_delay_7;
  reg                 image_quan_fsm_M_Valid_Temp_delay_8;
  reg                 image_quan_fsm_M_Valid_Temp_delay_9;
  reg                 image_quan_fsm_M_Valid_Temp_delay_10;
  reg                 image_quan_fsm_M_Valid_Temp_delay_11;
  reg                 image_quan_fsm_M_Valid_Temp_delay_12;
  reg                 image_quan_fsm_M_Valid_Temp_delay_13;
  reg                 image_quan_fsm_M_Valid_Temp_delay_14;
  reg                 image_quan_fsm_M_Valid_Temp_delay_15;
  reg                 image_quan_fsm_M_Valid_Temp_delay_16;
  reg                 image_quan_fsm_M_Valid_Temp_delay_17;
  reg                 image_quan_fsm_M_Valid_Temp_delay_18;
  reg                 image_quan_fsm_M_Valid_Temp_delay_19;
  reg                 image_quan_fsm_M_Valid_Temp_delay_20;
  reg                 image_quan_fsm_M_Valid_Temp_delay_21;
  reg                 image_quan_fsm_M_Valid_Temp_delay_22;
  reg                 image_quan_fsm_M_Valid_Temp_delay_23;
  reg                 image_quan_fsm_M_Valid_Temp_delay_24;
  reg                 image_quan_fsm_M_Valid_Temp_delay_25;
  reg                 image_quan_fsm_M_Valid_Temp_delay_26;
  reg        `image_quan_fsm_enumDefinition_binary_sequential_type image_quan_fsm_stateReg;
  reg        `image_quan_fsm_enumDefinition_binary_sequential_type image_quan_fsm_stateNext;
  `ifndef SYNTHESIS
  reg [199:0] image_quan_fsm_stateReg_string;
  reg [199:0] image_quan_fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(image_quan_fsm_stateReg)
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_BOOT : image_quan_fsm_stateReg_string = "image_quan_fsm_BOOT      ";
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE : image_quan_fsm_stateReg_string = "image_quan_fsm_IDLE      ";
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_After_Fifo : image_quan_fsm_stateReg_string = "image_quan_fsm_After_Fifo";
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute : image_quan_fsm_stateReg_string = "image_quan_fsm_Compute   ";
      default : image_quan_fsm_stateReg_string = "?????????????????????????";
    endcase
  end
  always @(*) begin
    case(image_quan_fsm_stateNext)
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_BOOT : image_quan_fsm_stateNext_string = "image_quan_fsm_BOOT      ";
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE : image_quan_fsm_stateNext_string = "image_quan_fsm_IDLE      ";
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_After_Fifo : image_quan_fsm_stateNext_string = "image_quan_fsm_After_Fifo";
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute : image_quan_fsm_stateNext_string = "image_quan_fsm_Compute   ";
      default : image_quan_fsm_stateNext_string = "?????????????????????????";
    endcase
  end
  `endif

  assign image_quan_fsm_wantExit = 1'b0;
  always @(*) begin
    image_quan_fsm_wantStart = 1'b0;
    case(image_quan_fsm_stateReg)
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE : begin
      end
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_After_Fifo : begin
      end
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute : begin
      end
      default : begin
        image_quan_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign image_quan_fsm_wantKill = 1'b0;
  assign when_image_quan_ctrl_l27 = (image_quan_fsm_Cnt_Cout == 4'b0011);
  always @(*) begin
    if(when_image_quan_ctrl_l27) begin
      image_quan_fsm_En_Last_Cout = 1'b1;
    end else begin
      image_quan_fsm_En_Last_Cout = 1'b0;
    end
  end

  assign when_image_quan_ctrl_l33 = (image_quan_fsm_Cnt_Cout == 4'b0011);
  assign when_image_quan_ctrl_l53 = ((image_quan_fsm_Cnt_Column == 12'h27f) && image_quan_fsm_En_Last_Cout);
  always @(*) begin
    if(when_image_quan_ctrl_l53) begin
      image_quan_fsm_En_Last_Column = 1'b1;
    end else begin
      image_quan_fsm_En_Last_Column = 1'b0;
    end
  end

  always @(*) begin
    if(when_image_quan_ctrl_l97) begin
      image_quan_fsm_M_Valid_Temp = 1'b1;
    end else begin
      image_quan_fsm_M_Valid_Temp = 1'b0;
    end
  end

  always @(*) begin
    if(when_image_quan_ctrl_l97) begin
      rd_en_fifo = 1'b1;
    end else begin
      rd_en_fifo = 1'b0;
    end
  end

  assign M_Valid = image_quan_fsm_M_Valid_Temp_delay_26;
  always @(*) begin
    image_quan_fsm_stateNext = image_quan_fsm_stateReg;
    case(image_quan_fsm_stateReg)
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE : begin
        if(fifo_valid) begin
          image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_After_Fifo;
        end else begin
          image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE;
        end
      end
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_After_Fifo : begin
        if(M_Ready) begin
          image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute;
        end else begin
          image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_After_Fifo;
        end
      end
      `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute : begin
        if(image_quan_fsm_En_Last_Column) begin
          image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE;
        end else begin
          image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute;
        end
      end
      default : begin
      end
    endcase
    if(image_quan_fsm_wantStart) begin
      image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_IDLE;
    end
    if(image_quan_fsm_wantKill) begin
      image_quan_fsm_stateNext = `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_BOOT;
    end
  end

  assign when_image_quan_ctrl_l32 = (image_quan_fsm_stateReg == `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute);
  assign when_image_quan_ctrl_l43 = (image_quan_fsm_stateReg == `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute);
  assign when_image_quan_ctrl_l97 = (image_quan_fsm_stateReg == `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_Compute);
  always @(posedge clk) begin
    if(reset) begin
      para_select <= 4'b0000;
      image_quan_fsm_Cnt_Cout <= 4'b0000;
      image_quan_fsm_Cnt_Column <= 12'h0;
      image_quan_fsm_stateReg <= `image_quan_fsm_enumDefinition_binary_sequential_image_quan_fsm_BOOT;
    end else begin
      if(when_image_quan_ctrl_l32) begin
        if(when_image_quan_ctrl_l33) begin
          image_quan_fsm_Cnt_Cout <= 4'b0000;
        end else begin
          image_quan_fsm_Cnt_Cout <= (image_quan_fsm_Cnt_Cout + 4'b0001);
        end
      end else begin
        image_quan_fsm_Cnt_Cout <= 4'b0000;
      end
      if(when_image_quan_ctrl_l43) begin
        if(image_quan_fsm_En_Last_Cout) begin
          image_quan_fsm_Cnt_Column <= (image_quan_fsm_Cnt_Column + 12'h001);
        end else begin
          image_quan_fsm_Cnt_Column <= image_quan_fsm_Cnt_Column;
        end
      end else begin
        image_quan_fsm_Cnt_Column <= 12'h0;
      end
      case(image_quan_fsm_Cnt_Cout)
        4'b0000 : begin
          para_select <= 4'b0001;
        end
        4'b0001 : begin
          para_select <= 4'b0010;
        end
        4'b0010 : begin
          para_select <= 4'b0011;
        end
        4'b0011 : begin
          para_select <= 4'b0100;
        end
        default : begin
          para_select <= 4'b0000;
        end
      endcase
      image_quan_fsm_stateReg <= image_quan_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    image_quan_fsm_M_Valid_Temp_delay_1 <= image_quan_fsm_M_Valid_Temp;
    image_quan_fsm_M_Valid_Temp_delay_2 <= image_quan_fsm_M_Valid_Temp_delay_1;
    image_quan_fsm_M_Valid_Temp_delay_3 <= image_quan_fsm_M_Valid_Temp_delay_2;
    image_quan_fsm_M_Valid_Temp_delay_4 <= image_quan_fsm_M_Valid_Temp_delay_3;
    image_quan_fsm_M_Valid_Temp_delay_5 <= image_quan_fsm_M_Valid_Temp_delay_4;
    image_quan_fsm_M_Valid_Temp_delay_6 <= image_quan_fsm_M_Valid_Temp_delay_5;
    image_quan_fsm_M_Valid_Temp_delay_7 <= image_quan_fsm_M_Valid_Temp_delay_6;
    image_quan_fsm_M_Valid_Temp_delay_8 <= image_quan_fsm_M_Valid_Temp_delay_7;
    image_quan_fsm_M_Valid_Temp_delay_9 <= image_quan_fsm_M_Valid_Temp_delay_8;
    image_quan_fsm_M_Valid_Temp_delay_10 <= image_quan_fsm_M_Valid_Temp_delay_9;
    image_quan_fsm_M_Valid_Temp_delay_11 <= image_quan_fsm_M_Valid_Temp_delay_10;
    image_quan_fsm_M_Valid_Temp_delay_12 <= image_quan_fsm_M_Valid_Temp_delay_11;
    image_quan_fsm_M_Valid_Temp_delay_13 <= image_quan_fsm_M_Valid_Temp_delay_12;
    image_quan_fsm_M_Valid_Temp_delay_14 <= image_quan_fsm_M_Valid_Temp_delay_13;
    image_quan_fsm_M_Valid_Temp_delay_15 <= image_quan_fsm_M_Valid_Temp_delay_14;
    image_quan_fsm_M_Valid_Temp_delay_16 <= image_quan_fsm_M_Valid_Temp_delay_15;
    image_quan_fsm_M_Valid_Temp_delay_17 <= image_quan_fsm_M_Valid_Temp_delay_16;
    image_quan_fsm_M_Valid_Temp_delay_18 <= image_quan_fsm_M_Valid_Temp_delay_17;
    image_quan_fsm_M_Valid_Temp_delay_19 <= image_quan_fsm_M_Valid_Temp_delay_18;
    image_quan_fsm_M_Valid_Temp_delay_20 <= image_quan_fsm_M_Valid_Temp_delay_19;
    image_quan_fsm_M_Valid_Temp_delay_21 <= image_quan_fsm_M_Valid_Temp_delay_20;
    image_quan_fsm_M_Valid_Temp_delay_22 <= image_quan_fsm_M_Valid_Temp_delay_21;
    image_quan_fsm_M_Valid_Temp_delay_23 <= image_quan_fsm_M_Valid_Temp_delay_22;
    image_quan_fsm_M_Valid_Temp_delay_24 <= image_quan_fsm_M_Valid_Temp_delay_23;
    image_quan_fsm_M_Valid_Temp_delay_25 <= image_quan_fsm_M_Valid_Temp_delay_24;
    image_quan_fsm_M_Valid_Temp_delay_26 <= image_quan_fsm_M_Valid_Temp_delay_25;
  end


endmodule
