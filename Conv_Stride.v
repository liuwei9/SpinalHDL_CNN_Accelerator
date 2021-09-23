// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_Stride
// Git hash  : 6a036d116ed8ed37e64ac312cea61447972676ed


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_WAIT 2'b10
`define fsm_enumDefinition_binary_sequential_fsm_Stride 2'b11


module Conv_Stride (
  input               Start,
  input               EN_Stride_REG,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input      [11:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Out_Num_REG,
  output reg          Last,
  output reg          Stride_Complete,
  input               reset,
  input               clk
);
  wire       [11:0]   count_mult_B;
  wire                fifo_rd_en;
  wire       [11:0]   fifo_m_data_count;
  wire       [11:0]   fifo_s_data_count;
  wire       [11:0]   count_mult_P;
  wire                fifo_data_in_ready;
  wire       [63:0]   fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [10:0]   _zz_row_num_out;
  wire       [9:0]    _zz_when_Conv_Stride_l75;
  wire       [6:0]    _zz_when_Conv_Stride_l75_1;
  wire       [11:0]   _zz_when_Conv_Stride_l96;
  wire       [11:0]   _zz_when_Conv_Stride_l119;
  wire       [11:0]   _zz_when_Conv_Stride_l137;
  wire       [11:0]   _zz_when_Conv_Stride_l137_1;
  wire       [9:0]    _zz_when_Conv_Stride_l150;
  wire       [11:0]   _zz_when_Conv_Stride_l167;
  wire       [11:0]   _zz_when_Conv_Stride_l184;
  reg        [11:0]   row_num_out;
  reg        [11:0]   data_count;
  wire       [6:0]    Channel_Times;
  reg        [63:0]   S_DATA_payload_regNext;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_Conv_Stride_l62;
  wire                when_Conv_Stride_l67;
  reg        [9:0]    fsm_Cnt_Cin;
  reg                 fsm_En_Cin;
  wire                when_Conv_Stride_l75;
  wire                when_Conv_Stride_l80;
  reg        [11:0]   fsm_Cnt_Col;
  reg                 fsm_En_Col;
  wire                when_Conv_Stride_l96;
  wire                when_Conv_Stride_l101;
  wire                when_Conv_Stride_l103;
  reg        [11:0]   fsm_Cnt_Row;
  reg                 fsm_En_Row;
  wire                when_Conv_Stride_l119;
  wire                when_Conv_Stride_l124;
  wire                when_Conv_Stride_l125;
  reg                 fsm_Valid_Out;
  wire                when_Conv_Stride_l136;
  wire                when_Conv_Stride_l137;
  reg        [9:0]    fsm_M_Cnt_Cout;
  reg                 fsm_M_En_Last_Cout;
  wire                when_Conv_Stride_l150;
  wire                when_Conv_Stride_l155;
  reg        [11:0]   fsm_M_Cnt_Column;
  reg                 fsm_M_En_Last_Col;
  wire                when_Conv_Stride_l167;
  wire                when_Conv_Stride_l172;
  reg        [11:0]   fsm_M_Cnt_Row;
  reg                 fsm_M_En_Last_Row;
  wire                when_Conv_Stride_l184;
  wire                when_Conv_Stride_l189;
  wire                when_Conv_Stride_l192;
  wire                when_Conv_Stride_l201;
  wire                when_Conv_Stride_l207;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_Conv_Stride_l231;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_row_num_out = (Row_Num_Out_REG >>> 1);
  assign _zz_when_Conv_Stride_l75_1 = (Channel_Times - 7'h01);
  assign _zz_when_Conv_Stride_l75 = {3'd0, _zz_when_Conv_Stride_l75_1};
  assign _zz_when_Conv_Stride_l96 = (Row_Num_Out_REG - 12'h001);
  assign _zz_when_Conv_Stride_l119 = (Row_Num_Out_REG - 12'h001);
  assign _zz_when_Conv_Stride_l137 = fsm_Cnt_Col;
  assign _zz_when_Conv_Stride_l137_1 = fsm_Cnt_Row;
  assign _zz_when_Conv_Stride_l150 = (Channel_Out_Num_REG - 10'h001);
  assign _zz_when_Conv_Stride_l167 = (row_num_out - 12'h001);
  assign _zz_when_Conv_Stride_l184 = (row_num_out - 12'h001);
  mul count_mult (
    .A        (row_num_out   ), //i
    .B        (count_mult_B  ), //i
    .P        (count_mult_P  ), //o
    .clk      (clk           ), //i
    .reset    (reset         )  //i
  );
  general_fifo_sync fifo (
    .reset             (reset                   ), //i
    .clk               (clk                     ), //i
    .data_in           (S_DATA_payload_regNext  ), //i
    .wr_en             (fsm_Valid_Out           ), //i
    .data_in_ready     (fifo_data_in_ready      ), //o
    .data_out          (fifo_data_out           ), //o
    .rd_en             (fifo_rd_en              ), //i
    .data_out_valid    (fifo_data_out_valid     ), //o
    .m_data_count      (fifo_m_data_count       ), //i
    .s_data_count      (fifo_s_data_count       ), //i
    .data_valid        (fifo_data_valid         ), //o
    .full              (fifo_full               ), //o
    .empty             (fifo_empty              )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : fsm_stateReg_string = "fsm_WAIT  ";
      `fsm_enumDefinition_binary_sequential_fsm_Stride : fsm_stateReg_string = "fsm_Stride";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : fsm_stateNext_string = "fsm_WAIT  ";
      `fsm_enumDefinition_binary_sequential_fsm_Stride : fsm_stateNext_string = "fsm_Stride";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_Out_Num_REG >>> 3);
  assign count_mult_B = {5'd0, Channel_Times};
  assign fifo_s_data_count = data_count;
  assign fifo_m_data_count = data_count;
  assign S_DATA_ready = fifo_data_in_ready;
  assign M_DATA_valid = fifo_data_valid;
  assign fifo_rd_en = (M_DATA_valid && M_DATA_ready);
  assign M_DATA_payload = fifo_data_out;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Stride : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_Conv_Stride_l62 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_Conv_Stride_l62) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_Conv_Stride_l75 = (fsm_Cnt_Cin == _zz_when_Conv_Stride_l75);
  always @(*) begin
    if(when_Conv_Stride_l75) begin
      fsm_En_Cin = 1'b1;
    end else begin
      fsm_En_Cin = 1'b0;
    end
  end

  assign when_Conv_Stride_l96 = (fsm_Cnt_Col == _zz_when_Conv_Stride_l96);
  always @(*) begin
    if(when_Conv_Stride_l96) begin
      fsm_En_Col = 1'b1;
    end else begin
      fsm_En_Col = 1'b0;
    end
  end

  assign when_Conv_Stride_l103 = (fsm_En_Col && fsm_En_Cin);
  assign when_Conv_Stride_l119 = (fsm_Cnt_Row == _zz_when_Conv_Stride_l119);
  always @(*) begin
    if(when_Conv_Stride_l119) begin
      fsm_En_Row = 1'b1;
    end else begin
      fsm_En_Row = 1'b0;
    end
  end

  assign when_Conv_Stride_l125 = (fsm_En_Col && fsm_En_Cin);
  assign when_Conv_Stride_l137 = (((! _zz_when_Conv_Stride_l137[0]) && (! _zz_when_Conv_Stride_l137_1[0])) && S_DATA_valid);
  assign when_Conv_Stride_l150 = (fsm_M_Cnt_Cout == _zz_when_Conv_Stride_l150);
  always @(*) begin
    if(when_Conv_Stride_l150) begin
      fsm_M_En_Last_Cout = 1'b1;
    end else begin
      fsm_M_En_Last_Cout = 1'b0;
    end
  end

  assign when_Conv_Stride_l155 = (M_DATA_valid && M_DATA_ready);
  assign when_Conv_Stride_l167 = (fsm_M_Cnt_Column == _zz_when_Conv_Stride_l167);
  always @(*) begin
    if(when_Conv_Stride_l167) begin
      fsm_M_En_Last_Col = 1'b1;
    end else begin
      fsm_M_En_Last_Col = 1'b0;
    end
  end

  assign when_Conv_Stride_l172 = ((M_DATA_valid && M_DATA_ready) && fsm_M_En_Last_Cout);
  assign when_Conv_Stride_l184 = (fsm_M_Cnt_Row == _zz_when_Conv_Stride_l184);
  always @(*) begin
    if(when_Conv_Stride_l184) begin
      fsm_M_En_Last_Row = 1'b1;
    end else begin
      fsm_M_En_Last_Row = 1'b0;
    end
  end

  assign when_Conv_Stride_l189 = (M_DATA_valid && M_DATA_ready);
  assign when_Conv_Stride_l192 = (fsm_M_En_Last_Col && fsm_M_En_Last_Cout);
  assign when_Conv_Stride_l201 = ((fsm_M_En_Last_Row && fsm_M_En_Last_Col) && fsm_M_En_Last_Cout);
  always @(*) begin
    if(when_Conv_Stride_l201) begin
      Last = 1'b1;
    end else begin
      Last = 1'b0;
    end
  end

  assign when_Conv_Stride_l207 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Stride) && ((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_IDLE)));
  always @(*) begin
    if(when_Conv_Stride_l207) begin
      Stride_Complete = 1'b1;
    end else begin
      Stride_Complete = 1'b0;
    end
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(Start) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WAIT;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : begin
        if(fsm_wait_en) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Stride;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WAIT;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Stride : begin
        if(when_Conv_Stride_l231) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Stride;
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

  assign when_Conv_Stride_l231 = ((fsm_En_Row && fsm_En_Col) && fsm_En_Cin);
  assign when_Conv_Stride_l67 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_WAIT);
  assign when_Conv_Stride_l80 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Stride);
  assign when_Conv_Stride_l101 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Stride);
  assign when_Conv_Stride_l124 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Stride);
  assign when_Conv_Stride_l136 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Stride);
  always @(posedge clk) begin
    if(EN_Stride_REG) begin
      row_num_out <= {1'd0, _zz_row_num_out};
    end else begin
      row_num_out <= Row_Num_Out_REG;
    end
    data_count <= count_mult_P;
    S_DATA_payload_regNext <= S_DATA_payload;
    if(when_Conv_Stride_l67) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_Conv_Stride_l80) begin
      if(S_DATA_valid) begin
        if(fsm_En_Cin) begin
          fsm_Cnt_Cin <= 10'h0;
        end else begin
          fsm_Cnt_Cin <= (fsm_Cnt_Cin + 10'h001);
        end
      end else begin
        fsm_Cnt_Cin <= fsm_Cnt_Cin;
      end
    end else begin
      fsm_Cnt_Cin <= 10'h0;
    end
    if(when_Conv_Stride_l101) begin
      if(S_DATA_valid) begin
        if(when_Conv_Stride_l103) begin
          fsm_Cnt_Col <= 12'h0;
        end else begin
          if(fsm_En_Cin) begin
            fsm_Cnt_Col <= (fsm_Cnt_Col + 12'h001);
          end else begin
            fsm_Cnt_Col <= fsm_Cnt_Col;
          end
        end
      end else begin
        fsm_Cnt_Col <= fsm_Cnt_Col;
      end
    end else begin
      fsm_Cnt_Col <= 12'h0;
    end
    if(when_Conv_Stride_l124) begin
      if(when_Conv_Stride_l125) begin
        fsm_Cnt_Row <= (fsm_Cnt_Row + 12'h001);
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end else begin
      fsm_Cnt_Row <= 12'h0;
    end
    if(when_Conv_Stride_l136) begin
      if(when_Conv_Stride_l137) begin
        fsm_Valid_Out <= 1'b1;
      end else begin
        fsm_Valid_Out <= 1'b0;
      end
    end else begin
      fsm_Valid_Out <= 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_M_Cnt_Cout <= 10'h0;
      fsm_M_Cnt_Column <= 12'h0;
      fsm_M_Cnt_Row <= 12'h0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_Conv_Stride_l155) begin
        if(fsm_M_En_Last_Cout) begin
          fsm_M_Cnt_Cout <= 10'h0;
        end else begin
          fsm_M_Cnt_Cout <= (fsm_M_Cnt_Cout + 10'h001);
        end
      end else begin
        fsm_M_Cnt_Cout <= fsm_M_Cnt_Cout;
      end
      if(when_Conv_Stride_l172) begin
        if(fsm_M_En_Last_Col) begin
          fsm_M_Cnt_Column <= 12'h0;
        end else begin
          fsm_M_Cnt_Column <= (fsm_M_Cnt_Column + 12'h001);
        end
      end else begin
        fsm_M_Cnt_Column <= fsm_M_Cnt_Column;
      end
      if(when_Conv_Stride_l189) begin
        if(fsm_M_En_Last_Row) begin
          fsm_M_Cnt_Row <= 12'h0;
        end else begin
          if(when_Conv_Stride_l192) begin
            fsm_M_Cnt_Row <= (fsm_M_Cnt_Row + 12'h001);
          end else begin
            fsm_M_Cnt_Row <= fsm_M_Cnt_Row;
          end
        end
      end else begin
        fsm_M_Cnt_Row <= fsm_M_Cnt_Row;
      end
      fsm_stateReg <= fsm_stateNext;
    end
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
  wire       [11:0]   fifo_wr_data_count;
  wire       [11:0]   fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [11:0]   _zz_when_general_fifo_sync_l39;
  wire                when_general_fifo_sync_l39;
  wire                when_general_fifo_sync_l49;

  assign _zz_when_general_fifo_sync_l39 = (fifo_wr_data_count + s_data_count);
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
  assign when_general_fifo_sync_l39 = (((! fifo_wr_rst_busy) && (_zz_when_general_fifo_sync_l39 < 12'h800)) && (! fifo_full));
  always @(*) begin
    if(when_general_fifo_sync_l39) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l49 = ((! fifo_rd_rst_busy) && (m_data_count <= fifo_rd_data_count));
  always @(*) begin
    if(when_general_fifo_sync_l49) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

module mul (
  input      [11:0]   A,
  input      [11:0]   B,
  output     [11:0]   P,
  input               clk,
  input               reset
);
  wire       [23:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [11:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [11:0]   _zz_P_1;
  (* use_dsp = "yes" *) reg        [11:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [11:0]   _zz_P_3;
  (* use_dsp = "yes" *) reg        [23:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [23:0]   _zz_P_5;

  assign _zz_P_6 = _zz_P_5;
  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_6[11:0];
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule

module fifo_sync (
  output              full,
  input               wr_en,
  input      [63:0]   din,
  output              empty,
  output     [63:0]   dout,
  input               rd_en,
  output     [11:0]   wr_data_count,
  output     [11:0]   rd_data_count,
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
  wire       [11:0]   temp_rd_data_count;
  wire                temp_rd_rst_busy;
  wire                temp_sbiterr;
  wire                temp_underflow;
  wire                temp_wr_ack;
  wire       [11:0]   temp_wr_data_count;
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
    .FIFO_WRITE_DEPTH(2048),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(2043),
    .RD_DATA_COUNT_WIDTH(12),
    .READ_DATA_WIDTH(64),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(64),
    .WR_DATA_COUNT_WIDTH(12) 
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
