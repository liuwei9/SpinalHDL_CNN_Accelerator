// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_Stride
// Git hash  : 6a036d116ed8ed37e64ac312cea61447972676ed


module Conv_Stride (
  input               Start,
  input               EN_Stride_REG,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input      [63:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Out_Num_REG,
  output reg          Last,
  output reg          Stride_Complete,
  input               reset,
  input               clk
);
  wire       [63:0]   count_mult_B;
  wire                fifo_rd_en;
  wire       [63:0]   fifo_m_data_count;
  wire       [63:0]   fifo_s_data_count;
  wire       [63:0]   count_mult_P;
  wire                fifo_data_in_ready;
  wire       [63:0]   fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [62:0]   _zz_row_num_out;
  wire       [9:0]    _zz_when_Conv_Stride_l75;
  wire       [6:0]    _zz_when_Conv_Stride_l75_1;
  wire       [63:0]   _zz_when_Conv_Stride_l96;
  wire       [63:0]   _zz_when_Conv_Stride_l119;
  wire       [63:0]   _zz_when_Conv_Stride_l137;
  wire       [63:0]   _zz_when_Conv_Stride_l137_1;
  wire       [9:0]    _zz_when_Conv_Stride_l150;
  wire       [63:0]   _zz_when_Conv_Stride_l167;
  wire       [63:0]   _zz_when_Conv_Stride_l184;
  reg        [63:0]   row_num_out;
  reg        [63:0]   data_count;
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
  reg        [63:0]   fsm_Cnt_Col;
  reg                 fsm_En_Col;
  wire                when_Conv_Stride_l96;
  wire                when_Conv_Stride_l101;
  wire                when_Conv_Stride_l103;
  reg        [63:0]   fsm_Cnt_Row;
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
  reg        [63:0]   fsm_M_Cnt_Column;
  reg                 fsm_M_En_Last_Col;
  wire                when_Conv_Stride_l167;
  wire                when_Conv_Stride_l172;
  reg        [63:0]   fsm_M_Cnt_Row;
  reg                 fsm_M_En_Last_Row;
  wire                when_Conv_Stride_l184;
  wire                when_Conv_Stride_l189;
  wire                when_Conv_Stride_l192;
  wire                when_Conv_Stride_l201;
  wire                when_Conv_Stride_l207;
  reg        `fsm_enumDefinition_3_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_3_binary_sequential_type fsm_stateNext;
  wire                when_Conv_Stride_l231;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_row_num_out = (Row_Num_Out_REG >>> 1);
  assign _zz_when_Conv_Stride_l75_1 = (Channel_Times - 7'h01);
  assign _zz_when_Conv_Stride_l75 = {3'd0, _zz_when_Conv_Stride_l75_1};
  assign _zz_when_Conv_Stride_l96 = (Row_Num_Out_REG - 64'h0000000000000001);
  assign _zz_when_Conv_Stride_l119 = (Row_Num_Out_REG - 64'h0000000000000001);
  assign _zz_when_Conv_Stride_l137 = fsm_Cnt_Col;
  assign _zz_when_Conv_Stride_l137_1 = fsm_Cnt_Row;
  assign _zz_when_Conv_Stride_l150 = (Channel_Out_Num_REG - 10'h001);
  assign _zz_when_Conv_Stride_l167 = (row_num_out - 64'h0000000000000001);
  assign _zz_when_Conv_Stride_l184 = (row_num_out - 64'h0000000000000001);
  mul_4 count_mult (
    .A        (row_num_out   ), //i
    .B        (count_mult_B  ), //i
    .P        (count_mult_P  ), //o
    .clk      (clk           ), //i
    .reset    (reset         )  //i
  );
  general_fifo_sync_11 fifo (
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
      `fsm_enumDefinition_3_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_WAIT : fsm_stateReg_string = "fsm_WAIT  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_Stride : fsm_stateReg_string = "fsm_Stride";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_3_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_WAIT : fsm_stateNext_string = "fsm_WAIT  ";
      `fsm_enumDefinition_3_binary_sequential_fsm_Stride : fsm_stateNext_string = "fsm_Stride";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_Out_Num_REG >>> 3);
  assign count_mult_B = {57'd0, Channel_Times};
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
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_WAIT : begin
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_Stride : begin
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

  assign when_Conv_Stride_l207 = ((fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_Stride) && ((fsm_stateNext == `fsm_enumDefinition_3_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_3_binary_sequential_fsm_IDLE)));
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
      `fsm_enumDefinition_3_binary_sequential_fsm_IDLE : begin
        if(Start) begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_WAIT;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_WAIT : begin
        if(fsm_wait_en) begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_Stride;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_WAIT;
        end
      end
      `fsm_enumDefinition_3_binary_sequential_fsm_Stride : begin
        if(when_Conv_Stride_l231) begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_Stride;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_3_binary_sequential_fsm_BOOT;
    end
  end

  assign when_Conv_Stride_l231 = ((fsm_En_Row && fsm_En_Col) && fsm_En_Cin);
  assign when_Conv_Stride_l67 = (fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_WAIT);
  assign when_Conv_Stride_l80 = (fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_Stride);
  assign when_Conv_Stride_l101 = (fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_Stride);
  assign when_Conv_Stride_l124 = (fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_Stride);
  assign when_Conv_Stride_l136 = (fsm_stateReg == `fsm_enumDefinition_3_binary_sequential_fsm_Stride);
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
          fsm_Cnt_Col <= 64'h0;
        end else begin
          if(fsm_En_Cin) begin
            fsm_Cnt_Col <= (fsm_Cnt_Col + 64'h0000000000000001);
          end else begin
            fsm_Cnt_Col <= fsm_Cnt_Col;
          end
        end
      end else begin
        fsm_Cnt_Col <= fsm_Cnt_Col;
      end
    end else begin
      fsm_Cnt_Col <= 64'h0;
    end
    if(when_Conv_Stride_l124) begin
      if(when_Conv_Stride_l125) begin
        fsm_Cnt_Row <= (fsm_Cnt_Row + 64'h0000000000000001);
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end else begin
      fsm_Cnt_Row <= 64'h0;
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

  always @(posedge clk) begin
    if(reset) begin
      fsm_M_Cnt_Cout <= 10'h0;
      fsm_M_Cnt_Column <= 64'h0;
      fsm_M_Cnt_Row <= 64'h0;
      fsm_stateReg <= `fsm_enumDefinition_3_binary_sequential_fsm_BOOT;
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
          fsm_M_Cnt_Column <= 64'h0;
        end else begin
          fsm_M_Cnt_Column <= (fsm_M_Cnt_Column + 64'h0000000000000001);
        end
      end else begin
        fsm_M_Cnt_Column <= fsm_M_Cnt_Column;
      end
      if(when_Conv_Stride_l189) begin
        if(fsm_M_En_Last_Row) begin
          fsm_M_Cnt_Row <= 64'h0;
        end else begin
          if(when_Conv_Stride_l192) begin
            fsm_M_Cnt_Row <= (fsm_M_Cnt_Row + 64'h0000000000000001);
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
