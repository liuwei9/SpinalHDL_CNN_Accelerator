// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_stride
// Git hash  : c12011d1e8655c6f5dcb4228add939efcb9499aa
// Date      : 20/08/2021, 22:45:47


module image_stride (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  output reg          Stride_Complete,
  output reg          Img_Last,
  input               reset,
  input               clk
);
  wire                stride_fifo_rd_en;
  wire                stride_fifo_data_in_ready;
  wire       [63:0]   stride_fifo_data_out;
  wire                stride_fifo_data_out_valid;
  wire                stride_fifo_data_valid;
  wire                stride_fifo_full;
  wire                stride_fifo_empty;
  wire       [18:0]   _zz_when_image_stride_l32;
  wire       [18:0]   _zz_when_image_stride_l39;
  wire       [18:0]   data_count;
  reg        [18:0]   Cnt_Stride_Complete;
  wire                when_image_stride_l32;
  wire                when_image_stride_l34;
  wire                when_image_stride_l39;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [11:0]   fsm_Cnt_Row;
  reg        [1:0]    fsm_Cnt_Channel_out;
  reg        [11:0]   fsm_Cnt_Column;
  reg                 fsm_En_Last_Channel_out;
  reg                 fsm_En_Last_Col;
  reg                 fsm_En_Last_Row;
  wire                when_image_stride_l57;
  wire                when_image_stride_l62;
  wire                when_image_stride_l67;
  wire                when_image_stride_l72;
  wire                when_image_stride_l86;
  wire                when_image_stride_l103;
  wire                when_image_stride_l104;
  reg                 fsm_wr_en_fifo;
  wire                when_image_stride_l113;
  wire                when_image_stride_l114;
  reg        [63:0]   S_DATA_payload_regNext;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_image_stride_l135;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_when_image_stride_l32 = (data_count - 19'h00001);
  assign _zz_when_image_stride_l39 = (data_count - 19'h00001);
  general_fifo_sync_11 stride_fifo (
    .reset             (reset                       ), //i
    .clk               (clk                         ), //i
    .data_in           (S_DATA_payload_regNext      ), //i
    .wr_en             (fsm_wr_en_fifo              ), //i
    .data_in_ready     (stride_fifo_data_in_ready   ), //o
    .data_out          (stride_fifo_data_out        ), //o
    .rd_en             (stride_fifo_rd_en           ), //i
    .data_out_valid    (stride_fifo_data_out_valid  ), //o
    .m_data_count      (12'h500                     ), //i
    .s_data_count      (12'h500                     ), //i
    .data_valid        (stride_fifo_data_valid      ), //o
    .full              (stride_fifo_full            ), //o
    .empty             (stride_fifo_empty           )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_binary_sequential_fsm_STRIDE : fsm_stateReg_string = "fsm_STRIDE";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_binary_sequential_fsm_STRIDE : fsm_stateNext_string = "fsm_STRIDE";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign S_DATA_ready = stride_fifo_data_in_ready;
  assign M_DATA_valid = stride_fifo_data_valid;
  assign stride_fifo_rd_en = (M_DATA_ready && stride_fifo_data_valid);
  assign M_DATA_payload = stride_fifo_data_out;
  assign data_count = 19'h64000;
  assign when_image_stride_l32 = (Cnt_Stride_Complete == _zz_when_image_stride_l32);
  assign when_image_stride_l34 = (M_DATA_valid && M_DATA_ready);
  assign when_image_stride_l39 = (Cnt_Stride_Complete == _zz_when_image_stride_l39);
  always @(*) begin
    if(when_image_stride_l39) begin
      Stride_Complete = 1'b1;
    end else begin
      Stride_Complete = 1'b0;
    end
  end

  always @(*) begin
    if(when_image_stride_l39) begin
      Img_Last = 1'b1;
    end else begin
      Img_Last = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_STRIDE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_image_stride_l57 = (fsm_Cnt_Channel_out == 2'b11);
  always @(*) begin
    if(when_image_stride_l57) begin
      fsm_En_Last_Channel_out = 1'b1;
    end else begin
      fsm_En_Last_Channel_out = 1'b0;
    end
  end

  assign when_image_stride_l62 = (fsm_Cnt_Column == 12'h27f);
  always @(*) begin
    if(when_image_stride_l62) begin
      fsm_En_Last_Col = 1'b1;
    end else begin
      fsm_En_Last_Col = 1'b0;
    end
  end

  assign when_image_stride_l67 = (fsm_Cnt_Row == 12'h27f);
  always @(*) begin
    if(when_image_stride_l67) begin
      fsm_En_Last_Row = 1'b1;
    end else begin
      fsm_En_Last_Row = 1'b0;
    end
  end

  assign when_image_stride_l104 = (fsm_En_Last_Channel_out && fsm_En_Last_Col);
  assign when_image_stride_l114 = (((fsm_Cnt_Row[0] == 1'b0) && (fsm_Cnt_Column[0] == 1'b0)) && S_DATA_valid);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(Start) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_STRIDE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_STRIDE : begin
        if(when_image_stride_l135) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_STRIDE;
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

  assign when_image_stride_l135 = ((fsm_En_Last_Channel_out && fsm_En_Last_Col) && fsm_En_Last_Row);
  assign when_image_stride_l72 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  assign when_image_stride_l86 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  assign when_image_stride_l103 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  assign when_image_stride_l113 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  always @(posedge clk) begin
    if(reset) begin
      Cnt_Stride_Complete <= 19'h0;
      fsm_Cnt_Row <= 12'h0;
      fsm_Cnt_Channel_out <= 2'b00;
      fsm_Cnt_Column <= 12'h0;
      fsm_wr_en_fifo <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_image_stride_l32) begin
        Cnt_Stride_Complete <= 19'h0;
      end else begin
        if(when_image_stride_l34) begin
          Cnt_Stride_Complete <= (Cnt_Stride_Complete + 19'h00001);
        end else begin
          Cnt_Stride_Complete <= Cnt_Stride_Complete;
        end
      end
      if(when_image_stride_l72) begin
        if(S_DATA_valid) begin
          if(fsm_En_Last_Channel_out) begin
            fsm_Cnt_Channel_out <= 2'b00;
          end else begin
            fsm_Cnt_Channel_out <= (fsm_Cnt_Channel_out + 2'b01);
          end
        end else begin
          fsm_Cnt_Channel_out <= fsm_Cnt_Channel_out;
        end
      end else begin
        fsm_Cnt_Channel_out <= 2'b00;
      end
      if(when_image_stride_l86) begin
        if(S_DATA_valid) begin
          if(fsm_En_Last_Channel_out) begin
            if(fsm_En_Last_Col) begin
              fsm_Cnt_Column <= 12'h0;
            end else begin
              fsm_Cnt_Column <= (fsm_Cnt_Column + 12'h001);
            end
          end else begin
            fsm_Cnt_Column <= fsm_Cnt_Column;
          end
        end else begin
          fsm_Cnt_Column <= fsm_Cnt_Column;
        end
      end else begin
        fsm_Cnt_Column <= 12'h0;
      end
      if(when_image_stride_l103) begin
        if(when_image_stride_l104) begin
          fsm_Cnt_Row <= (fsm_Cnt_Row + 12'h001);
        end else begin
          fsm_Cnt_Row <= fsm_Cnt_Row;
        end
      end else begin
        fsm_Cnt_Row <= 12'h0;
      end
      if(when_image_stride_l113) begin
        if(when_image_stride_l114) begin
          fsm_wr_en_fifo <= 1'b1;
        end else begin
          fsm_wr_en_fifo <= 1'b0;
        end
      end else begin
        fsm_wr_en_fifo <= 1'b0;
      end
      fsm_stateReg <= fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    S_DATA_payload_regNext <= S_DATA_payload;
  end


endmodule
