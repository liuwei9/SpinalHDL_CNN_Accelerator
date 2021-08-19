// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_stride
// Git hash  : 14c224a291d4c09f98f2fe70959a048a13500200


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_STRIDE 2'b10


module image_stride (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  input               reset,
  input               clk
);
  wire                stride_fifo_data_in_ready;
  wire       [63:0]   stride_fifo_data_out;
  wire                stride_fifo_data_out_valid;
  wire                stride_fifo_data_valid;
  wire                stride_fifo_full;
  wire                stride_fifo_empty;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [11:0]   fsm_Cnt_Row;
  reg        [1:0]    fsm_Cnt_Channel_out;
  reg        [11:0]   fsm_Cnt_Column;
  reg                 fsm_En_Last_Channel_out;
  reg                 fsm_En_Last_Col;
  reg                 fsm_En_Last_Row;
  wire                when_image_stride_l39;
  wire                when_image_stride_l44;
  wire                when_image_stride_l49;
  wire                when_image_stride_l54;
  wire                when_image_stride_l68;
  wire                when_image_stride_l85;
  wire                when_image_stride_l86;
  reg                 fsm_wr_en_fifo;
  wire                when_image_stride_l95;
  wire                when_image_stride_l96;
  reg        [63:0]   S_DATA_payload_regNext;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  general_fifo_sync stride_fifo (
    .reset             (reset                       ), //i
    .clk               (clk                         ), //i
    .data_in           (S_DATA_payload_regNext      ), //i
    .wr_en             (fsm_wr_en_fifo              ), //i
    .data_in_ready     (stride_fifo_data_in_ready   ), //o
    .data_out          (stride_fifo_data_out        ), //o
    .rd_en             (1'b0                        ), //i
    .data_out_valid    (stride_fifo_data_out_valid  ), //o
    .m_data_count      (12'h0                       ), //i
    .s_data_count      (12'h0                       ), //i
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
  assign when_image_stride_l39 = (fsm_Cnt_Channel_out == 2'b11);
  always @(*) begin
    if(when_image_stride_l39) begin
      fsm_En_Last_Channel_out = 1'b1;
    end else begin
      fsm_En_Last_Channel_out = 1'b0;
    end
  end

  assign when_image_stride_l44 = (fsm_Cnt_Column == 12'h27f);
  always @(*) begin
    if(when_image_stride_l44) begin
      fsm_En_Last_Col = 1'b1;
    end else begin
      fsm_En_Last_Col = 1'b0;
    end
  end

  assign when_image_stride_l49 = (fsm_Cnt_Row == 12'h27f);
  always @(*) begin
    if(when_image_stride_l49) begin
      fsm_En_Last_Row = 1'b1;
    end else begin
      fsm_En_Last_Row = 1'b0;
    end
  end

  assign when_image_stride_l86 = (fsm_En_Last_Channel_out && fsm_En_Last_Col);
  assign when_image_stride_l96 = (((fsm_Cnt_Row[0] == 1'b0) && (fsm_Cnt_Column[0] == 1'b0)) && S_DATA_valid);
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
        fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
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

  assign when_image_stride_l54 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  assign when_image_stride_l68 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  assign when_image_stride_l85 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  assign when_image_stride_l95 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_STRIDE);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_Cnt_Row <= 12'h0;
      fsm_Cnt_Channel_out <= 2'b00;
      fsm_Cnt_Column <= 12'h0;
      fsm_wr_en_fifo <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_image_stride_l54) begin
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
      if(when_image_stride_l68) begin
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
      if(when_image_stride_l85) begin
        if(when_image_stride_l86) begin
          fsm_Cnt_Row <= (fsm_Cnt_Row + 12'h001);
        end else begin
          fsm_Cnt_Row <= fsm_Cnt_Row;
        end
      end else begin
        fsm_Cnt_Row <= 12'h0;
      end
      if(when_image_stride_l95) begin
        if(when_image_stride_l96) begin
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

module general_fifo_sync (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [63:0]   data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [11:0]   m_data_count,
  input      [11:0]   s_data_count,
  output              data_valid,
  output              full,
  output              empty
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [63:0]   fifo_dout;
  wire       [10:0]   fifo_wr_data_count;
  wire       [10:0]   fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [11:0]   _zz_when_general_fifo_sync_l39;
  wire       [11:0]   _zz_when_general_fifo_sync_l39_1;
  wire       [10:0]   _zz_when_general_fifo_sync_l39_2;
  wire       [11:0]   _zz_when_general_fifo_sync_l49;
  wire       [10:0]   _zz_when_general_fifo_sync_l49_1;
  wire                when_general_fifo_sync_l39;
  wire                when_general_fifo_sync_l49;

  assign _zz_when_general_fifo_sync_l39 = (_zz_when_general_fifo_sync_l39_1 + s_data_count);
  assign _zz_when_general_fifo_sync_l39_2 = fifo_wr_data_count;
  assign _zz_when_general_fifo_sync_l39_1 = {1'd0, _zz_when_general_fifo_sync_l39_2};
  assign _zz_when_general_fifo_sync_l49_1 = fifo_rd_data_count;
  assign _zz_when_general_fifo_sync_l49 = {1'd0, _zz_when_general_fifo_sync_l49_1};
  fifo_sync fifo (
    .full             (fifo_full           ), //o
    .wr_en            (wr_en               ), //i
    .din              (data_in             ), //i
    .empty            (fifo_empty          ), //o
    .dout             (fifo_dout           ), //o
    .rd_en            (rd_en               ), //i
    .wr_data_count    (fifo_wr_data_count  ), //o
    .rd_data_count    (fifo_rd_data_count  ), //o
    .data_valid       (fifo_data_valid     ), //o
    .rd_rst_busy      (fifo_rd_rst_busy    ), //o
    .wr_rst_busy      (fifo_wr_rst_busy    ), //o
    .reset            (reset               ), //i
    .clk              (clk                 )  //i
  );
  assign data_valid = fifo_data_valid;
  assign full = fifo_full;
  assign empty = fifo_empty;
  assign data_out = fifo_dout;
  assign when_general_fifo_sync_l39 = (((! fifo_wr_rst_busy) && (_zz_when_general_fifo_sync_l39 < 12'h400)) && (! fifo_full));
  always @(*) begin
    if(when_general_fifo_sync_l39) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l49 = ((! fifo_rd_rst_busy) && (m_data_count <= _zz_when_general_fifo_sync_l49));
  always @(*) begin
    if(when_general_fifo_sync_l49) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

module fifo_sync (
  output              full,
  input               wr_en,
  input      [63:0]   din,
  output              empty,
  output     [63:0]   dout,
  input               rd_en,
  output     [10:0]   wr_data_count,
  output     [10:0]   rd_data_count,
  output              data_valid,
  output              rd_rst_busy,
  output              wr_rst_busy,
  input               reset,
  input               clk
);
  wire                temp_almost_empty;
  wire                temp_almost_full;
  wire                temp_data_valid;
  wire                temp_dbiterr;
  wire       [63:0]   temp_dout;
  wire                temp_empty;
  wire                temp_full;
  wire                temp_overflow;
  wire                temp_prog_empty;
  wire                temp_prog_full;
  wire       [10:0]   temp_rd_data_count;
  wire                temp_rd_rst_busy;
  wire                temp_sbiterr;
  wire                temp_underflow;
  wire                temp_wr_ack;
  wire       [10:0]   temp_wr_data_count;
  wire                temp_wr_rst_busy;
  wire                almost_empty;
  wire                almost_full;
  wire                dbiterr;
  wire                overflow;
  wire                prog_empty;
  wire                prog_full;
  wire                sbiterr;
  wire                underflow;
  wire                wr_ack;
  wire                injectdbiterr;
  wire                injectsbiterr;
  wire                sleep;

  xpm_fifo_sync #(
    .DOUT_RESET_VALUE("0"),
    .ECC_MODE("no_ecc"),
    .FIFO_MEMORY_TYPE("block"),
    .FIFO_READ_LATENCY(0),
    .FIFO_WRITE_DEPTH(1024),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(1019),
    .RD_DATA_COUNT_WIDTH(11),
    .READ_DATA_WIDTH(64),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(64),
    .WR_DATA_COUNT_WIDTH(11) 
  ) temp (
    .almost_empty     (temp_almost_empty   ), //o
    .almost_full      (temp_almost_full    ), //o
    .data_valid       (temp_data_valid     ), //o
    .dbiterr          (temp_dbiterr        ), //o
    .dout             (temp_dout           ), //o
    .empty            (temp_empty          ), //o
    .full             (temp_full           ), //o
    .overflow         (temp_overflow       ), //o
    .prog_empty       (temp_prog_empty     ), //o
    .prog_full        (temp_prog_full      ), //o
    .rd_data_count    (temp_rd_data_count  ), //o
    .rd_rst_busy      (temp_rd_rst_busy    ), //o
    .sbiterr          (temp_sbiterr        ), //o
    .underflow        (temp_underflow      ), //o
    .wr_ack           (temp_wr_ack         ), //o
    .wr_data_count    (temp_wr_data_count  ), //o
    .wr_rst_busy      (temp_wr_rst_busy    ), //o
    .din              (din                 ), //i
    .injectdbiterr    (injectdbiterr       ), //i
    .injectsbiterr    (injectsbiterr       ), //i
    .rd_en            (rd_en               ), //i
    .rst              (reset               ), //i
    .sleep            (sleep               ), //i
    .wr_clk           (clk                 ), //i
    .wr_en            (wr_en               )  //i
  );
  assign injectdbiterr = 1'b0;
  assign injectsbiterr = 1'b0;
  assign sleep = 1'b0;
  assign almost_empty = temp_almost_empty;
  assign almost_full = temp_almost_full;
  assign data_valid = temp_data_valid;
  assign dbiterr = temp_dbiterr;
  assign dout = temp_dout;
  assign empty = temp_empty;
  assign full = temp_full;
  assign overflow = temp_overflow;
  assign prog_empty = temp_prog_empty;
  assign prog_full = temp_prog_full;
  assign rd_data_count = temp_rd_data_count;
  assign rd_rst_busy = temp_rd_rst_busy;
  assign sbiterr = temp_sbiterr;
  assign underflow = temp_underflow;
  assign wr_ack = temp_wr_ack;
  assign wr_data_count = temp_wr_data_count;
  assign wr_rst_busy = temp_wr_rst_busy;

endmodule
