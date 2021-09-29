// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : concat_final
// Git hash  : 272f0170fdb5b57b5dfe47631c24d24b486fc69d


`define fsm_enumDefinition_binary_sequential_type [3:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 4'b0000
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 4'b0001
`define fsm_enumDefinition_binary_sequential_fsm_WAIT 4'b0010
`define fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo 4'b0011
`define fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo 4'b0100
`define fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1 4'b0101
`define fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1 4'b0110
`define fsm_enumDefinition_binary_sequential_fsm_Direct_Data 4'b0111
`define fsm_enumDefinition_binary_sequential_fsm_Judge_Col 4'b1000
`define fsm_enumDefinition_binary_sequential_fsm_Judge_Row 4'b1001


module concat_final (
  input               Start,
  input      [14:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Ram_Part,
  input      [9:0]    Channel_Direct_Part,
  input      [14:0]   Row_Num_In_REG,
  output reg          Connect_Complete,
  input               S_DATA_1_valid,
  output              S_DATA_1_ready,
  input      [63:0]   S_DATA_1_payload,
  input               S_DATA_2_valid,
  output              S_DATA_2_ready,
  input      [63:0]   S_DATA_2_payload,
  input      [31:0]   Concat1_ZeroPoint,
  input      [31:0]   Concat2_ZeroPoint,
  input      [31:0]   Concat1_Scale,
  input      [31:0]   Concat2_Scale,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  output reg          Last_Concat,
  input               reset,
  input               clk
);
  wire       [14:0]   count_mult1_B;
  wire       [14:0]   count_mult2_B;
  wire                concat_read_fifo_1_wr_en;
  wire       [14:0]   concat_read_fifo_1_m_data_count;
  wire       [14:0]   concat_read_fifo_1_s_data_count;
  wire                concat_read_fifo_2_wr_en;
  wire       [14:0]   concat_read_fifo_2_m_data_count;
  wire       [14:0]   concat_read_fifo_2_s_data_count;
  wire                FIFO_Concat_rd_en;
  wire       [14:0]   FIFO_Concat_m_data_count;
  wire       [14:0]   FIFO_Concat_s_data_count;
  wire       [14:0]   count_mult1_P;
  wire       [14:0]   count_mult2_P;
  wire                concat_read_fifo_1_data_in_ready;
  wire       [63:0]   concat_read_fifo_1_data_out;
  wire                concat_read_fifo_1_data_out_valid;
  wire                concat_read_fifo_1_data_valid;
  wire                concat_read_fifo_1_full;
  wire                concat_read_fifo_1_empty;
  wire                concat_read_fifo_2_data_in_ready;
  wire       [63:0]   concat_read_fifo_2_data_out;
  wire                concat_read_fifo_2_data_out_valid;
  wire                concat_read_fifo_2_data_valid;
  wire                concat_read_fifo_2_full;
  wire                concat_read_fifo_2_empty;
  wire       [255:0]  concat_zero_2_data_out;
  wire       [255:0]  concat_scale_2_data_out;
  wire       [63:0]   connect_32to8_2_data_out;
  wire       [255:0]  concat_zero_3_data_out;
  wire       [255:0]  concat_scale_3_data_out;
  wire       [63:0]   connect_32to8_3_data_out;
  wire                FIFO_Concat_data_in_ready;
  wire       [63:0]   FIFO_Concat_data_out;
  wire                FIFO_Concat_data_out_valid;
  wire                FIFO_Concat_data_valid;
  wire                FIFO_Concat_full;
  wire                FIFO_Concat_empty;
  wire       [14:0]   _zz__zz_S_Count_Fifo_3;
  wire       [6:0]    _zz_data_count2;
  wire       [9:0]    _zz_when_concat_final_l107;
  wire       [6:0]    _zz_when_concat_final_l107_1;
  wire       [14:0]   _zz_when_concat_final_l123;
  wire       [14:0]   _zz_when_concat_final_l139;
  wire       [9:0]    _zz_when_concat_final_l194;
  wire       [6:0]    _zz_when_concat_final_l194_1;
  wire       [9:0]    _zz_when_concat_final_l243;
  wire       [6:0]    _zz_when_concat_final_l243_1;
  wire       [14:0]   _zz_when_concat_final_l256;
  wire       [14:0]   _zz_when_concat_final_l274;
  wire       [6:0]    Ram_Channel_Times;
  wire       [6:0]    Direct_Channel_Times;
  wire       [14:0]   S_Count_Fifo_1;
  wire       [14:0]   S_Count_Fifo_2;
  wire       [14:0]   S_Count_Fifo_3;
  reg        [14:0]   _zz_S_Count_Fifo_3;
  reg        [255:0]  _zz_data_in;
  reg        [255:0]  _zz_data_in_1;
  wire                En_Write;
  reg        [63:0]   M_Fifo_Data;
  reg        [6:0]    data_count2;
  reg        [9:0]    M_Cnt_Cout;
  reg                 M_En_Last_Cout;
  wire                when_concat_final_l107;
  wire                when_concat_final_l112;
  reg        [14:0]   M_Cnt_Column;
  reg                 M_En_Last_Col;
  wire                when_concat_final_l123;
  wire                when_concat_final_l128;
  reg        [14:0]   M_Cnt_Row;
  reg                 M_En_Last_Row;
  wire                when_concat_final_l139;
  wire                when_concat_final_l144;
  wire                when_concat_final_l147;
  wire                when_concat_final_l155;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_concat_final_l180;
  wire                when_concat_final_l185;
  reg        [9:0]    fsm_Ram_Channel_Cnt;
  reg                 fsm_Ram_Complete;
  wire                when_concat_final_l194;
  wire                when_concat_final_l199;
  reg                 fsm_sign;
  wire                when_concat_final_l206;
  wire                fsm_sign_delay;
  reg                 fsm_sign_delay_1;
  reg                 fsm_sign_delay_2;
  reg                 fsm_sign_delay_3;
  reg                 fsm_sign_delay_4;
  reg                 fsm_sign_delay_5;
  reg                 fsm_sign_delay_6;
  reg                 fsm_sign_delay_7;
  reg                 fsm_sign_delay_8;
  reg                 fsm_rd_en_fifo_1;
  wire                when_concat_final_l215;
  wire                fsm_En_Write_1_0;
  reg                 fsm_En_Write_1_1;
  reg                 fsm_En_Write_1_2;
  reg                 fsm_En_Write_1_3;
  reg                 fsm_En_Write_1_4;
  reg                 fsm_En_Write_1_5;
  reg                 fsm_En_Write_1_6;
  reg                 fsm_En_Write_1_7;
  reg                 fsm_En_Write_1_8;
  reg                 fsm_rd_en_fifo_2;
  wire                when_concat_final_l222;
  wire                fsm_En_Write_2_0;
  reg                 fsm_En_Write_2_1;
  reg                 fsm_En_Write_2_2;
  reg                 fsm_En_Write_2_3;
  reg                 fsm_En_Write_2_4;
  reg                 fsm_En_Write_2_5;
  reg                 fsm_En_Write_2_6;
  reg                 fsm_En_Write_2_7;
  reg                 fsm_En_Write_2_8;
  reg                 fsm_Direct_Complete;
  reg        [9:0]    fsm_Direct_Channel_Cnt;
  wire                when_concat_final_l243;
  wire                when_concat_final_l248;
  reg                 fsm_Col_Complete;
  reg        [14:0]   fsm_Col_Cnt;
  wire                when_concat_final_l256;
  wire                when_concat_final_l261;
  wire                when_concat_final_l267;
  reg        [14:0]   fsm_Row_Cnt;
  reg                 fsm_Row_Complete;
  wire                when_concat_final_l274;
  wire                when_concat_final_l279;
  wire                when_concat_final_l285;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_concat_final_l309;
  `ifndef SYNTHESIS
  reg [167:0] fsm_stateReg_string;
  reg [167:0] fsm_stateNext_string;
  `endif


  assign _zz__zz_S_Count_Fifo_3 = (S_Count_Fifo_1 + S_Count_Fifo_2);
  assign _zz_data_count2 = (Ram_Channel_Times + Direct_Channel_Times);
  assign _zz_when_concat_final_l107_1 = (data_count2 - 7'h01);
  assign _zz_when_concat_final_l107 = {3'd0, _zz_when_concat_final_l107_1};
  assign _zz_when_concat_final_l123 = (Row_Num_Out_REG - 15'h0001);
  assign _zz_when_concat_final_l139 = (Row_Num_Out_REG - 15'h0001);
  assign _zz_when_concat_final_l194_1 = (Ram_Channel_Times - 7'h01);
  assign _zz_when_concat_final_l194 = {3'd0, _zz_when_concat_final_l194_1};
  assign _zz_when_concat_final_l243_1 = (Direct_Channel_Times - 7'h01);
  assign _zz_when_concat_final_l243 = {3'd0, _zz_when_concat_final_l243_1};
  assign _zz_when_concat_final_l256 = (Row_Num_Out_REG - 15'h0001);
  assign _zz_when_concat_final_l274 = (Row_Num_In_REG - 15'h0001);
  mul count_mult1 (
    .A        (Row_Num_Out_REG  ), //i
    .B        (count_mult1_B    ), //i
    .P        (count_mult1_P    ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  mul count_mult2 (
    .A        (Row_Num_Out_REG  ), //i
    .B        (count_mult2_B    ), //i
    .P        (count_mult2_P    ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  general_fifo_sync concat_read_fifo_1 (
    .reset             (reset                              ), //i
    .clk               (clk                                ), //i
    .data_in           (S_DATA_1_payload                   ), //i
    .wr_en             (concat_read_fifo_1_wr_en           ), //i
    .data_in_ready     (concat_read_fifo_1_data_in_ready   ), //o
    .data_out          (concat_read_fifo_1_data_out        ), //o
    .rd_en             (fsm_rd_en_fifo_1                   ), //i
    .data_out_valid    (concat_read_fifo_1_data_out_valid  ), //o
    .m_data_count      (concat_read_fifo_1_m_data_count    ), //i
    .s_data_count      (concat_read_fifo_1_s_data_count    ), //i
    .data_valid        (concat_read_fifo_1_data_valid      ), //o
    .full              (concat_read_fifo_1_full            ), //o
    .empty             (concat_read_fifo_1_empty           )  //o
  );
  general_fifo_sync concat_read_fifo_2 (
    .reset             (reset                              ), //i
    .clk               (clk                                ), //i
    .data_in           (S_DATA_2_payload                   ), //i
    .wr_en             (concat_read_fifo_2_wr_en           ), //i
    .data_in_ready     (concat_read_fifo_2_data_in_ready   ), //o
    .data_out          (concat_read_fifo_2_data_out        ), //o
    .rd_en             (fsm_rd_en_fifo_2                   ), //i
    .data_out_valid    (concat_read_fifo_2_data_out_valid  ), //o
    .m_data_count      (concat_read_fifo_2_m_data_count    ), //i
    .s_data_count      (concat_read_fifo_2_s_data_count    ), //i
    .data_valid        (concat_read_fifo_2_data_valid      ), //o
    .full              (concat_read_fifo_2_full            ), //o
    .empty             (concat_read_fifo_2_empty           )  //o
  );
  concat_zero concat_zero_2 (
    .data_in     (_zz_data_in             ), //i
    .zero        (Concat1_ZeroPoint       ), //i
    .data_out    (concat_zero_2_data_out  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  concat_scale concat_scale_2 (
    .data_in     (concat_zero_2_data_out   ), //i
    .scale       (Concat1_Scale            ), //i
    .data_out    (concat_scale_2_data_out  ), //o
    .clk         (clk                      )  //i
  );
  connect_32to8 connect_32to8_2 (
    .data_in     (concat_scale_2_data_out   ), //i
    .data_out    (connect_32to8_2_data_out  ), //o
    .clk         (clk                       ), //i
    .reset       (reset                     )  //i
  );
  concat_zero concat_zero_3 (
    .data_in     (_zz_data_in_1           ), //i
    .zero        (Concat2_ZeroPoint       ), //i
    .data_out    (concat_zero_3_data_out  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  concat_scale concat_scale_3 (
    .data_in     (concat_zero_3_data_out   ), //i
    .scale       (Concat2_Scale            ), //i
    .data_out    (concat_scale_3_data_out  ), //o
    .clk         (clk                      )  //i
  );
  connect_32to8 connect_32to8_3 (
    .data_in     (concat_scale_3_data_out   ), //i
    .data_out    (connect_32to8_3_data_out  ), //o
    .clk         (clk                       ), //i
    .reset       (reset                     )  //i
  );
  general_fifo_sync_2 FIFO_Concat (
    .reset             (reset                       ), //i
    .clk               (clk                         ), //i
    .data_in           (M_Fifo_Data                 ), //i
    .wr_en             (En_Write                    ), //i
    .data_in_ready     (FIFO_Concat_data_in_ready   ), //o
    .data_out          (FIFO_Concat_data_out        ), //o
    .rd_en             (FIFO_Concat_rd_en           ), //i
    .data_out_valid    (FIFO_Concat_data_out_valid  ), //o
    .m_data_count      (FIFO_Concat_m_data_count    ), //i
    .s_data_count      (FIFO_Concat_s_data_count    ), //i
    .data_valid        (FIFO_Concat_data_valid      ), //o
    .full              (FIFO_Concat_full            ), //o
    .empty             (FIFO_Concat_empty           )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT             ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE             ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : fsm_stateReg_string = "fsm_WAIT             ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : fsm_stateReg_string = "fsm_Judge_Before_Fifo";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : fsm_stateReg_string = "fsm_Judge_After_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1 : fsm_stateReg_string = "fsm_READ_S_DATA_1    ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1 : fsm_stateReg_string = "fsm_WAIT_S_DATA_1    ";
      `fsm_enumDefinition_binary_sequential_fsm_Direct_Data : fsm_stateReg_string = "fsm_Direct_Data      ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Col : fsm_stateReg_string = "fsm_Judge_Col        ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : fsm_stateReg_string = "fsm_Judge_Row        ";
      default : fsm_stateReg_string = "?????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT             ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE             ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : fsm_stateNext_string = "fsm_WAIT             ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : fsm_stateNext_string = "fsm_Judge_Before_Fifo";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : fsm_stateNext_string = "fsm_Judge_After_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1 : fsm_stateNext_string = "fsm_READ_S_DATA_1    ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1 : fsm_stateNext_string = "fsm_WAIT_S_DATA_1    ";
      `fsm_enumDefinition_binary_sequential_fsm_Direct_Data : fsm_stateNext_string = "fsm_Direct_Data      ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Col : fsm_stateNext_string = "fsm_Judge_Col        ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : fsm_stateNext_string = "fsm_Judge_Row        ";
      default : fsm_stateNext_string = "?????????????????????";
    endcase
  end
  `endif

  assign Ram_Channel_Times = (Channel_Ram_Part >>> 3);
  assign Direct_Channel_Times = (Channel_Direct_Part >>> 3);
  assign S_Count_Fifo_3 = _zz_S_Count_Fifo_3;
  assign count_mult1_B = {8'd0, Ram_Channel_Times};
  assign S_Count_Fifo_1 = count_mult1_P;
  assign count_mult2_B = {8'd0, Direct_Channel_Times};
  assign S_Count_Fifo_2 = count_mult2_P;
  assign concat_read_fifo_1_wr_en = (S_DATA_1_valid && S_DATA_1_ready);
  assign concat_read_fifo_1_m_data_count = S_Count_Fifo_1;
  assign concat_read_fifo_1_s_data_count = S_Count_Fifo_1;
  assign S_DATA_1_ready = concat_read_fifo_1_data_in_ready;
  assign concat_read_fifo_2_wr_en = (S_DATA_2_valid && S_DATA_2_ready);
  assign concat_read_fifo_2_m_data_count = S_Count_Fifo_2;
  assign concat_read_fifo_2_s_data_count = S_Count_Fifo_2;
  assign S_DATA_2_ready = concat_read_fifo_2_data_in_ready;
  assign FIFO_Concat_rd_en = (M_DATA_ready && M_DATA_valid);
  assign M_DATA_valid = FIFO_Concat_data_valid;
  assign M_DATA_payload = FIFO_Concat_data_out;
  assign when_concat_final_l107 = (M_Cnt_Cout == _zz_when_concat_final_l107);
  always @(*) begin
    if(when_concat_final_l107) begin
      M_En_Last_Cout = 1'b1;
    end else begin
      M_En_Last_Cout = 1'b0;
    end
  end

  assign when_concat_final_l112 = (M_DATA_valid && M_DATA_ready);
  assign when_concat_final_l123 = (M_Cnt_Column == _zz_when_concat_final_l123);
  always @(*) begin
    if(when_concat_final_l123) begin
      M_En_Last_Col = 1'b1;
    end else begin
      M_En_Last_Col = 1'b0;
    end
  end

  assign when_concat_final_l128 = ((M_DATA_valid && M_DATA_ready) && M_En_Last_Cout);
  assign when_concat_final_l139 = (M_Cnt_Row == _zz_when_concat_final_l139);
  always @(*) begin
    if(when_concat_final_l139) begin
      M_En_Last_Row = 1'b1;
    end else begin
      M_En_Last_Row = 1'b0;
    end
  end

  assign when_concat_final_l144 = (M_DATA_valid && M_DATA_ready);
  assign when_concat_final_l147 = (M_En_Last_Col && M_En_Last_Cout);
  assign when_concat_final_l155 = ((M_En_Last_Row && M_En_Last_Col) && M_En_Last_Cout);
  always @(*) begin
    if(when_concat_final_l155) begin
      Last_Concat = 1'b1;
    end else begin
      Last_Concat = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1 : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1 : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Direct_Data : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Col : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_concat_final_l180 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_concat_final_l180) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_concat_final_l194 = (fsm_Ram_Channel_Cnt == _zz_when_concat_final_l194);
  always @(*) begin
    if(when_concat_final_l194) begin
      fsm_Ram_Complete = 1'b1;
    end else begin
      fsm_Ram_Complete = 1'b0;
    end
  end

  assign fsm_sign_delay = fsm_sign_delay_8;
  assign fsm_En_Write_1_0 = fsm_rd_en_fifo_1;
  assign fsm_En_Write_2_0 = fsm_rd_en_fifo_2;
  assign En_Write = (fsm_En_Write_1_8 || fsm_En_Write_2_8);
  assign when_concat_final_l243 = (fsm_Direct_Channel_Cnt == _zz_when_concat_final_l243);
  always @(*) begin
    if(when_concat_final_l243) begin
      fsm_Direct_Complete = 1'b1;
    end else begin
      fsm_Direct_Complete = 1'b0;
    end
  end

  assign when_concat_final_l256 = (fsm_Col_Cnt == _zz_when_concat_final_l256);
  always @(*) begin
    if(when_concat_final_l256) begin
      fsm_Col_Complete = 1'b1;
    end else begin
      fsm_Col_Complete = 1'b0;
    end
  end

  assign when_concat_final_l274 = (fsm_Row_Cnt == _zz_when_concat_final_l274);
  always @(*) begin
    if(when_concat_final_l274) begin
      fsm_Row_Complete = 1'b1;
    end else begin
      fsm_Row_Complete = 1'b0;
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
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WAIT;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : begin
        if(when_concat_final_l309) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : begin
        if(FIFO_Concat_empty) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1 : begin
        if(fsm_Ram_Complete) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1 : begin
        if(fsm_sign_delay) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Direct_Data;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Direct_Data : begin
        if(fsm_Direct_Complete) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Col;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Direct_Data;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Col : begin
        if(fsm_Col_Complete) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Row;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : begin
        if(fsm_Row_Complete) begin
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

  assign when_concat_final_l309 = (concat_read_fifo_1_data_out_valid && concat_read_fifo_2_data_out_valid);
  assign when_concat_final_l185 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_WAIT);
  assign when_concat_final_l199 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1);
  assign when_concat_final_l206 = ((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_WAIT_S_DATA_1));
  assign when_concat_final_l215 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_READ_S_DATA_1);
  assign when_concat_final_l222 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Direct_Data);
  assign when_concat_final_l248 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Direct_Data);
  assign when_concat_final_l261 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_Col);
  assign when_concat_final_l267 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_IDLE);
  assign when_concat_final_l279 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_Row);
  assign when_concat_final_l285 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_IDLE);
  always @(posedge clk) begin
    _zz_S_Count_Fifo_3 <= _zz__zz_S_Count_Fifo_3;
    _zz_data_in[31 : 0] <= {{8'h0,concat_read_fifo_1_data_out[7 : 0]},16'h0};
    _zz_data_in[63 : 32] <= {{8'h0,concat_read_fifo_1_data_out[15 : 8]},16'h0};
    _zz_data_in[95 : 64] <= {{8'h0,concat_read_fifo_1_data_out[23 : 16]},16'h0};
    _zz_data_in[127 : 96] <= {{8'h0,concat_read_fifo_1_data_out[31 : 24]},16'h0};
    _zz_data_in[159 : 128] <= {{8'h0,concat_read_fifo_1_data_out[39 : 32]},16'h0};
    _zz_data_in[191 : 160] <= {{8'h0,concat_read_fifo_1_data_out[47 : 40]},16'h0};
    _zz_data_in[223 : 192] <= {{8'h0,concat_read_fifo_1_data_out[55 : 48]},16'h0};
    _zz_data_in[255 : 224] <= {{8'h0,concat_read_fifo_1_data_out[63 : 56]},16'h0};
    _zz_data_in_1[31 : 0] <= {{8'h0,concat_read_fifo_2_data_out[7 : 0]},16'h0};
    _zz_data_in_1[63 : 32] <= {{8'h0,concat_read_fifo_2_data_out[15 : 8]},16'h0};
    _zz_data_in_1[95 : 64] <= {{8'h0,concat_read_fifo_2_data_out[23 : 16]},16'h0};
    _zz_data_in_1[127 : 96] <= {{8'h0,concat_read_fifo_2_data_out[31 : 24]},16'h0};
    _zz_data_in_1[159 : 128] <= {{8'h0,concat_read_fifo_2_data_out[39 : 32]},16'h0};
    _zz_data_in_1[191 : 160] <= {{8'h0,concat_read_fifo_2_data_out[47 : 40]},16'h0};
    _zz_data_in_1[223 : 192] <= {{8'h0,concat_read_fifo_2_data_out[55 : 48]},16'h0};
    _zz_data_in_1[255 : 224] <= {{8'h0,concat_read_fifo_2_data_out[63 : 56]},16'h0};
    data_count2 <= _zz_data_count2;
    if(Last_Concat) begin
      Connect_Complete <= 1'b1;
    end else begin
      Connect_Complete <= 1'b0;
    end
    if(when_concat_final_l185) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_concat_final_l199) begin
      fsm_Ram_Channel_Cnt <= (fsm_Ram_Channel_Cnt + 10'h001);
    end else begin
      fsm_Ram_Channel_Cnt <= 10'h0;
    end
    if(when_concat_final_l206) begin
      fsm_sign <= 1'b1;
    end else begin
      fsm_sign <= 1'b0;
    end
    fsm_sign_delay_1 <= fsm_sign;
    fsm_sign_delay_2 <= fsm_sign_delay_1;
    fsm_sign_delay_3 <= fsm_sign_delay_2;
    fsm_sign_delay_4 <= fsm_sign_delay_3;
    fsm_sign_delay_5 <= fsm_sign_delay_4;
    fsm_sign_delay_6 <= fsm_sign_delay_5;
    fsm_sign_delay_7 <= fsm_sign_delay_6;
    fsm_sign_delay_8 <= fsm_sign_delay_7;
    if(when_concat_final_l215) begin
      fsm_rd_en_fifo_1 <= 1'b1;
    end else begin
      fsm_rd_en_fifo_1 <= 1'b0;
    end
    fsm_En_Write_1_1 <= fsm_En_Write_1_0;
    fsm_En_Write_1_2 <= fsm_En_Write_1_1;
    fsm_En_Write_1_3 <= fsm_En_Write_1_2;
    fsm_En_Write_1_4 <= fsm_En_Write_1_3;
    fsm_En_Write_1_5 <= fsm_En_Write_1_4;
    fsm_En_Write_1_6 <= fsm_En_Write_1_5;
    fsm_En_Write_1_7 <= fsm_En_Write_1_6;
    fsm_En_Write_1_8 <= fsm_En_Write_1_7;
    if(when_concat_final_l222) begin
      fsm_rd_en_fifo_2 <= 1'b1;
    end else begin
      fsm_rd_en_fifo_2 <= 1'b0;
    end
    fsm_En_Write_2_1 <= fsm_En_Write_2_0;
    fsm_En_Write_2_2 <= fsm_En_Write_2_1;
    fsm_En_Write_2_3 <= fsm_En_Write_2_2;
    fsm_En_Write_2_4 <= fsm_En_Write_2_3;
    fsm_En_Write_2_5 <= fsm_En_Write_2_4;
    fsm_En_Write_2_6 <= fsm_En_Write_2_5;
    fsm_En_Write_2_7 <= fsm_En_Write_2_6;
    fsm_En_Write_2_8 <= fsm_En_Write_2_7;
    if(fsm_En_Write_1_7) begin
      M_Fifo_Data <= connect_32to8_2_data_out;
    end else begin
      if(fsm_En_Write_2_7) begin
        M_Fifo_Data <= connect_32to8_3_data_out;
      end else begin
        M_Fifo_Data <= 64'h0;
      end
    end
    if(when_concat_final_l248) begin
      fsm_Direct_Channel_Cnt <= (fsm_Direct_Channel_Cnt + 10'h001);
    end else begin
      fsm_Direct_Channel_Cnt <= 10'h0;
    end
    if(when_concat_final_l261) begin
      if(fsm_Col_Complete) begin
        fsm_Col_Cnt <= 15'h0;
      end else begin
        fsm_Col_Cnt <= (fsm_Col_Cnt + 15'h0001);
      end
    end else begin
      if(when_concat_final_l267) begin
        fsm_Col_Cnt <= 15'h0;
      end else begin
        fsm_Col_Cnt <= fsm_Col_Cnt;
      end
    end
    if(when_concat_final_l279) begin
      if(fsm_Row_Complete) begin
        fsm_Row_Cnt <= 15'h0;
      end else begin
        fsm_Row_Cnt <= (fsm_Row_Cnt + 15'h0001);
      end
    end else begin
      if(when_concat_final_l285) begin
        fsm_Row_Cnt <= 15'h0;
      end else begin
        fsm_Row_Cnt <= fsm_Row_Cnt;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      M_Cnt_Cout <= 10'h0;
      M_Cnt_Column <= 15'h0;
      M_Cnt_Row <= 15'h0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_concat_final_l112) begin
        if(M_En_Last_Cout) begin
          M_Cnt_Cout <= 10'h0;
        end else begin
          M_Cnt_Cout <= (M_Cnt_Cout + 10'h001);
        end
      end else begin
        M_Cnt_Cout <= M_Cnt_Cout;
      end
      if(when_concat_final_l128) begin
        if(M_En_Last_Col) begin
          M_Cnt_Column <= 15'h0;
        end else begin
          M_Cnt_Column <= (M_Cnt_Column + 15'h0001);
        end
      end else begin
        M_Cnt_Column <= M_Cnt_Column;
      end
      if(when_concat_final_l144) begin
        if(M_En_Last_Row) begin
          M_Cnt_Row <= 15'h0;
        end else begin
          if(when_concat_final_l147) begin
            M_Cnt_Row <= (M_Cnt_Row + 15'h0001);
          end else begin
            M_Cnt_Row <= M_Cnt_Row;
          end
        end
      end else begin
        M_Cnt_Row <= M_Cnt_Row;
      end
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule

module general_fifo_sync_2 (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [63:0]   data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [14:0]   m_data_count,
  input      [14:0]   s_data_count,
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
  wire       [14:0]   _zz_when_general_fifo_sync_l59;
  wire       [10:0]   _zz_when_general_fifo_sync_l59_1;
  wire                when_general_fifo_sync_l53;
  wire                when_general_fifo_sync_l59;

  assign _zz_when_general_fifo_sync_l59_1 = fifo_rd_data_count;
  assign _zz_when_general_fifo_sync_l59 = {4'd0, _zz_when_general_fifo_sync_l59_1};
  fifo_sync_2 fifo (
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
  assign when_general_fifo_sync_l53 = (((! fifo_wr_rst_busy) && (! fifo_full)) && (fifo_wr_data_count < 11'h3f6));
  always @(*) begin
    if(when_general_fifo_sync_l53) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l59 = ((! fifo_rd_rst_busy) && (m_data_count <= _zz_when_general_fifo_sync_l59));
  always @(*) begin
    if(when_general_fifo_sync_l59) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

//connect_32to8 replaced by connect_32to8

//concat_scale replaced by concat_scale

//concat_zero replaced by concat_zero

module connect_32to8 (
  input      [255:0]  data_in,
  output reg [63:0]   data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_data_out;
  reg        [7:0]    _zz_data_out_1;
  wire                when_connect_32to8_l17;
  wire                when_connect_32to8_l19;
  wire       [31:0]   _zz_data_out_2;
  reg        [7:0]    _zz_data_out_3;
  wire                when_connect_32to8_l17_1;
  wire                when_connect_32to8_l19_1;
  wire       [31:0]   _zz_data_out_4;
  reg        [7:0]    _zz_data_out_5;
  wire                when_connect_32to8_l17_2;
  wire                when_connect_32to8_l19_2;
  wire       [31:0]   _zz_data_out_6;
  reg        [7:0]    _zz_data_out_7;
  wire                when_connect_32to8_l17_3;
  wire                when_connect_32to8_l19_3;
  wire       [31:0]   _zz_data_out_8;
  reg        [7:0]    _zz_data_out_9;
  wire                when_connect_32to8_l17_4;
  wire                when_connect_32to8_l19_4;
  wire       [31:0]   _zz_data_out_10;
  reg        [7:0]    _zz_data_out_11;
  wire                when_connect_32to8_l17_5;
  wire                when_connect_32to8_l19_5;
  wire       [31:0]   _zz_data_out_12;
  reg        [7:0]    _zz_data_out_13;
  wire                when_connect_32to8_l17_6;
  wire                when_connect_32to8_l19_6;
  wire       [31:0]   _zz_data_out_14;
  reg        [7:0]    _zz_data_out_15;
  wire                when_connect_32to8_l17_7;
  wire                when_connect_32to8_l19_7;

  assign _zz_data_out = data_in[31 : 0];
  assign when_connect_32to8_l17 = _zz_data_out[31];
  assign when_connect_32to8_l19 = (_zz_data_out[30 : 8] != 23'h0);
  always @(*) begin
    data_out[7 : 0] = _zz_data_out_1;
    data_out[15 : 8] = _zz_data_out_3;
    data_out[23 : 16] = _zz_data_out_5;
    data_out[31 : 24] = _zz_data_out_7;
    data_out[39 : 32] = _zz_data_out_9;
    data_out[47 : 40] = _zz_data_out_11;
    data_out[55 : 48] = _zz_data_out_13;
    data_out[63 : 56] = _zz_data_out_15;
  end

  assign _zz_data_out_2 = data_in[63 : 32];
  assign when_connect_32to8_l17_1 = _zz_data_out_2[31];
  assign when_connect_32to8_l19_1 = (_zz_data_out_2[30 : 8] != 23'h0);
  assign _zz_data_out_4 = data_in[95 : 64];
  assign when_connect_32to8_l17_2 = _zz_data_out_4[31];
  assign when_connect_32to8_l19_2 = (_zz_data_out_4[30 : 8] != 23'h0);
  assign _zz_data_out_6 = data_in[127 : 96];
  assign when_connect_32to8_l17_3 = _zz_data_out_6[31];
  assign when_connect_32to8_l19_3 = (_zz_data_out_6[30 : 8] != 23'h0);
  assign _zz_data_out_8 = data_in[159 : 128];
  assign when_connect_32to8_l17_4 = _zz_data_out_8[31];
  assign when_connect_32to8_l19_4 = (_zz_data_out_8[30 : 8] != 23'h0);
  assign _zz_data_out_10 = data_in[191 : 160];
  assign when_connect_32to8_l17_5 = _zz_data_out_10[31];
  assign when_connect_32to8_l19_5 = (_zz_data_out_10[30 : 8] != 23'h0);
  assign _zz_data_out_12 = data_in[223 : 192];
  assign when_connect_32to8_l17_6 = _zz_data_out_12[31];
  assign when_connect_32to8_l19_6 = (_zz_data_out_12[30 : 8] != 23'h0);
  assign _zz_data_out_14 = data_in[255 : 224];
  assign when_connect_32to8_l17_7 = _zz_data_out_14[31];
  assign when_connect_32to8_l19_7 = (_zz_data_out_14[30 : 8] != 23'h0);
  always @(posedge clk) begin
    if(when_connect_32to8_l17) begin
      _zz_data_out_1 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19) begin
        _zz_data_out_1 <= 8'hff;
      end else begin
        _zz_data_out_1 <= _zz_data_out[7 : 0];
      end
    end
    if(when_connect_32to8_l17_1) begin
      _zz_data_out_3 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_1) begin
        _zz_data_out_3 <= 8'hff;
      end else begin
        _zz_data_out_3 <= _zz_data_out_2[7 : 0];
      end
    end
    if(when_connect_32to8_l17_2) begin
      _zz_data_out_5 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_2) begin
        _zz_data_out_5 <= 8'hff;
      end else begin
        _zz_data_out_5 <= _zz_data_out_4[7 : 0];
      end
    end
    if(when_connect_32to8_l17_3) begin
      _zz_data_out_7 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_3) begin
        _zz_data_out_7 <= 8'hff;
      end else begin
        _zz_data_out_7 <= _zz_data_out_6[7 : 0];
      end
    end
    if(when_connect_32to8_l17_4) begin
      _zz_data_out_9 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_4) begin
        _zz_data_out_9 <= 8'hff;
      end else begin
        _zz_data_out_9 <= _zz_data_out_8[7 : 0];
      end
    end
    if(when_connect_32to8_l17_5) begin
      _zz_data_out_11 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_5) begin
        _zz_data_out_11 <= 8'hff;
      end else begin
        _zz_data_out_11 <= _zz_data_out_10[7 : 0];
      end
    end
    if(when_connect_32to8_l17_6) begin
      _zz_data_out_13 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_6) begin
        _zz_data_out_13 <= 8'hff;
      end else begin
        _zz_data_out_13 <= _zz_data_out_12[7 : 0];
      end
    end
    if(when_connect_32to8_l17_7) begin
      _zz_data_out_15 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_7) begin
        _zz_data_out_15 <= 8'hff;
      end else begin
        _zz_data_out_15 <= _zz_data_out_14[7 : 0];
      end
    end
  end


endmodule

module concat_scale (
  input      [255:0]  data_in,
  input      [31:0]   scale,
  output reg [255:0]  data_out,
  input               clk
);
  wire       [31:0]   xmul_A;
  wire       [31:0]   xmul_1_A;
  wire       [31:0]   xmul_2_A;
  wire       [31:0]   xmul_3_A;
  wire       [31:0]   xmul_4_A;
  wire       [31:0]   xmul_5_A;
  wire       [31:0]   xmul_6_A;
  wire       [31:0]   xmul_7_A;
  wire       [32:0]   xmul_P;
  wire       [32:0]   xmul_1_P;
  wire       [32:0]   xmul_2_P;
  wire       [32:0]   xmul_3_P;
  wire       [32:0]   xmul_4_P;
  wire       [32:0]   xmul_5_P;
  wire       [32:0]   xmul_6_P;
  wire       [32:0]   xmul_7_P;
  wire       [31:0]   _zz_data_out;
  wire       [31:0]   _zz_data_out_1;
  wire       [31:0]   _zz_data_out_2;
  wire       [31:0]   _zz_data_out_3;
  wire       [31:0]   _zz_data_out_4;
  wire       [31:0]   _zz_data_out_5;
  wire       [31:0]   _zz_data_out_6;
  wire       [31:0]   _zz_data_out_7;
  wire       [32:0]   data_temp_0;
  wire       [32:0]   data_temp_1;
  wire       [32:0]   data_temp_2;
  wire       [32:0]   data_temp_3;
  wire       [32:0]   data_temp_4;
  wire       [32:0]   data_temp_5;
  wire       [32:0]   data_temp_6;
  wire       [32:0]   data_temp_7;
  wire                when_concat_scale_l31;
  wire                when_concat_scale_l31_1;
  wire                when_concat_scale_l31_2;
  wire                when_concat_scale_l31_3;
  wire                when_concat_scale_l31_4;
  wire                when_concat_scale_l31_5;
  wire                when_concat_scale_l31_6;
  wire                when_concat_scale_l31_7;

  assign _zz_data_out = (data_temp_0[32 : 1] + 32'h00000001);
  assign _zz_data_out_1 = (data_temp_1[32 : 1] + 32'h00000001);
  assign _zz_data_out_2 = (data_temp_2[32 : 1] + 32'h00000001);
  assign _zz_data_out_3 = (data_temp_3[32 : 1] + 32'h00000001);
  assign _zz_data_out_4 = (data_temp_4[32 : 1] + 32'h00000001);
  assign _zz_data_out_5 = (data_temp_5[32 : 1] + 32'h00000001);
  assign _zz_data_out_6 = (data_temp_6[32 : 1] + 32'h00000001);
  assign _zz_data_out_7 = (data_temp_7[32 : 1] + 32'h00000001);
  xmul_32_32_33 xmul (
    .A      (xmul_A  ), //i
    .B      (scale   ), //i
    .P      (xmul_P  ), //o
    .CLK    (clk     )  //i
  );
  xmul_32_32_33 xmul_1 (
    .A      (xmul_1_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_1_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_2 (
    .A      (xmul_2_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_2_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_3 (
    .A      (xmul_3_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_3_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_4 (
    .A      (xmul_4_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_4_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_5 (
    .A      (xmul_5_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_5_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_6 (
    .A      (xmul_6_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_6_P  ), //o
    .CLK    (clk       )  //i
  );
  xmul_32_32_33 xmul_7 (
    .A      (xmul_7_A  ), //i
    .B      (scale     ), //i
    .P      (xmul_7_P  ), //o
    .CLK    (clk       )  //i
  );
  assign xmul_A = data_in[31 : 0];
  assign data_temp_0 = xmul_P;
  assign xmul_1_A = data_in[63 : 32];
  assign data_temp_1 = xmul_1_P;
  assign xmul_2_A = data_in[95 : 64];
  assign data_temp_2 = xmul_2_P;
  assign xmul_3_A = data_in[127 : 96];
  assign data_temp_3 = xmul_3_P;
  assign xmul_4_A = data_in[159 : 128];
  assign data_temp_4 = xmul_4_P;
  assign xmul_5_A = data_in[191 : 160];
  assign data_temp_5 = xmul_5_P;
  assign xmul_6_A = data_in[223 : 192];
  assign data_temp_6 = xmul_6_P;
  assign xmul_7_A = data_in[255 : 224];
  assign data_temp_7 = xmul_7_P;
  assign when_concat_scale_l31 = data_temp_0[0];
  always @(*) begin
    if(when_concat_scale_l31) begin
      data_out[31 : 0] = _zz_data_out;
    end else begin
      data_out[31 : 0] = data_temp_0[32 : 1];
    end
    if(when_concat_scale_l31_1) begin
      data_out[63 : 32] = _zz_data_out_1;
    end else begin
      data_out[63 : 32] = data_temp_1[32 : 1];
    end
    if(when_concat_scale_l31_2) begin
      data_out[95 : 64] = _zz_data_out_2;
    end else begin
      data_out[95 : 64] = data_temp_2[32 : 1];
    end
    if(when_concat_scale_l31_3) begin
      data_out[127 : 96] = _zz_data_out_3;
    end else begin
      data_out[127 : 96] = data_temp_3[32 : 1];
    end
    if(when_concat_scale_l31_4) begin
      data_out[159 : 128] = _zz_data_out_4;
    end else begin
      data_out[159 : 128] = data_temp_4[32 : 1];
    end
    if(when_concat_scale_l31_5) begin
      data_out[191 : 160] = _zz_data_out_5;
    end else begin
      data_out[191 : 160] = data_temp_5[32 : 1];
    end
    if(when_concat_scale_l31_6) begin
      data_out[223 : 192] = _zz_data_out_6;
    end else begin
      data_out[223 : 192] = data_temp_6[32 : 1];
    end
    if(when_concat_scale_l31_7) begin
      data_out[255 : 224] = _zz_data_out_7;
    end else begin
      data_out[255 : 224] = data_temp_7[32 : 1];
    end
  end

  assign when_concat_scale_l31_1 = data_temp_1[0];
  assign when_concat_scale_l31_2 = data_temp_2[0];
  assign when_concat_scale_l31_3 = data_temp_3[0];
  assign when_concat_scale_l31_4 = data_temp_4[0];
  assign when_concat_scale_l31_5 = data_temp_5[0];
  assign when_concat_scale_l31_6 = data_temp_6[0];
  assign when_concat_scale_l31_7 = data_temp_7[0];

endmodule

module concat_zero (
  input      [255:0]  data_in,
  input      [31:0]   zero,
  output reg [255:0]  data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   add_simd_16_A;
  wire       [31:0]   add_simd_17_A;
  wire       [31:0]   add_simd_18_A;
  wire       [31:0]   add_simd_19_A;
  wire       [31:0]   add_simd_20_A;
  wire       [31:0]   add_simd_21_A;
  wire       [31:0]   add_simd_22_A;
  wire       [31:0]   add_simd_23_A;
  wire       [31:0]   add_simd_16_P;
  wire       [31:0]   add_simd_17_P;
  wire       [31:0]   add_simd_18_P;
  wire       [31:0]   add_simd_19_P;
  wire       [31:0]   add_simd_20_P;
  wire       [31:0]   add_simd_21_P;
  wire       [31:0]   add_simd_22_P;
  wire       [31:0]   add_simd_23_P;

  add_simd add_simd_16 (
    .A        (add_simd_16_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_16_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_17 (
    .A        (add_simd_17_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_17_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_18 (
    .A        (add_simd_18_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_18_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_19 (
    .A        (add_simd_19_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_19_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_20 (
    .A        (add_simd_20_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_20_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_21 (
    .A        (add_simd_21_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_21_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_22 (
    .A        (add_simd_22_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_22_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_23 (
    .A        (add_simd_23_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_23_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  assign add_simd_16_A = data_in[31 : 0];
  always @(*) begin
    data_out[31 : 0] = add_simd_16_P;
    data_out[63 : 32] = add_simd_17_P;
    data_out[95 : 64] = add_simd_18_P;
    data_out[127 : 96] = add_simd_19_P;
    data_out[159 : 128] = add_simd_20_P;
    data_out[191 : 160] = add_simd_21_P;
    data_out[223 : 192] = add_simd_22_P;
    data_out[255 : 224] = add_simd_23_P;
  end

  assign add_simd_17_A = data_in[63 : 32];
  assign add_simd_18_A = data_in[95 : 64];
  assign add_simd_19_A = data_in[127 : 96];
  assign add_simd_20_A = data_in[159 : 128];
  assign add_simd_21_A = data_in[191 : 160];
  assign add_simd_22_A = data_in[223 : 192];
  assign add_simd_23_A = data_in[255 : 224];

endmodule

//general_fifo_sync replaced by general_fifo_sync

module general_fifo_sync (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [63:0]   data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [14:0]   m_data_count,
  input      [14:0]   s_data_count,
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
  wire       [14:0]   _zz_when_general_fifo_sync_l59;
  wire       [11:0]   _zz_when_general_fifo_sync_l59_1;
  wire                when_general_fifo_sync_l53;
  wire                when_general_fifo_sync_l59;

  assign _zz_when_general_fifo_sync_l59_1 = fifo_rd_data_count;
  assign _zz_when_general_fifo_sync_l59 = {3'd0, _zz_when_general_fifo_sync_l59_1};
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
  assign when_general_fifo_sync_l53 = (((! fifo_wr_rst_busy) && (! fifo_full)) && (fifo_wr_data_count < 12'h7f6));
  always @(*) begin
    if(when_general_fifo_sync_l53) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l59 = ((! fifo_rd_rst_busy) && (m_data_count <= _zz_when_general_fifo_sync_l59));
  always @(*) begin
    if(when_general_fifo_sync_l59) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

//mul replaced by mul

module mul (
  input      [14:0]   A,
  input      [14:0]   B,
  output     [14:0]   P,
  input               clk,
  input               reset
);
  wire       [29:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [14:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [14:0]   _zz_P_1;
  (* use_dsp = "yes" *) reg        [14:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [14:0]   _zz_P_3;
  (* use_dsp = "yes" *) reg        [29:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [29:0]   _zz_P_5;

  assign _zz_P_6 = _zz_P_5;
  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_6[14:0];
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule

module fifo_sync_2 (
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

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

//add_simd replaced by add_simd

module add_simd (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  wire       [31:0]   add_16_P;

  add add_16 (
    .A        (A         ), //i
    .B        (B         ), //i
    .P        (add_16_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  assign P = add_16_P;

endmodule

//fifo_sync replaced by fifo_sync

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

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

//add replaced by add

module add (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [31:0]   A_q;
  (* use_dsp = "yes" *) wire       [31:0]   B_q;
  (* use_dsp = "yes" *) reg        [31:0]   A_qq;
  (* use_dsp = "yes" *) reg        [31:0]   B_qq;
  (* use_dsp = "yes" *) reg        [31:0]   P_q;

  assign A_q = A;
  assign B_q = B;
  assign P = P_q;
  always @(posedge clk) begin
    A_qq <= A_q;
    B_qq <= B_q;
    P_q <= ($signed(A_qq) + $signed(B_qq));
  end


endmodule
