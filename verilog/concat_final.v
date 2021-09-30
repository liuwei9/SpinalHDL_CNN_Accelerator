// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : concat_final
// Git hash  : 0e6a3ebbe013921c1c094a4a70c6b764aaf2f29f


module concat_final (
  input               Start,
  input      [10:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Ram_Part,
  input      [9:0]    Channel_Direct_Part,
  input      [10:0]   Row_Num_In_REG,
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
  wire       [10:0]   count_mult1_B;
  wire       [10:0]   count_mult2_B;
  wire                concat_read_fifo_1_wr_en;
  wire       [10:0]   concat_read_fifo_1_m_data_count;
  wire       [10:0]   concat_read_fifo_1_s_data_count;
  wire                concat_read_fifo_2_wr_en;
  wire       [10:0]   concat_read_fifo_2_m_data_count;
  wire       [10:0]   concat_read_fifo_2_s_data_count;
  wire                FIFO_Concat_rd_en;
  wire       [10:0]   FIFO_Concat_m_data_count;
  wire       [10:0]   FIFO_Concat_s_data_count;
  wire       [10:0]   count_mult1_P;
  wire       [10:0]   count_mult2_P;
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
  wire       [10:0]   _zz__zz_S_Count_Fifo_3;
  wire       [6:0]    _zz_data_count2;
  wire       [14:0]   _zz_when_concat_final_l107;
  wire       [6:0]    _zz_when_concat_final_l107_1;
  wire       [10:0]   _zz_when_concat_final_l123;
  wire       [10:0]   _zz_when_concat_final_l139;
  wire       [14:0]   _zz_when_concat_final_l194;
  wire       [6:0]    _zz_when_concat_final_l194_1;
  wire       [14:0]   _zz_when_concat_final_l243;
  wire       [6:0]    _zz_when_concat_final_l243_1;
  wire       [10:0]   _zz_when_concat_final_l256;
  wire       [10:0]   _zz_when_concat_final_l274;
  wire       [6:0]    Ram_Channel_Times;
  wire       [6:0]    Direct_Channel_Times;
  wire       [10:0]   S_Count_Fifo_1;
  wire       [10:0]   S_Count_Fifo_2;
  wire       [10:0]   S_Count_Fifo_3;
  reg        [10:0]   _zz_S_Count_Fifo_3;
  reg        [255:0]  _zz_data_in;
  reg        [255:0]  _zz_data_in_1;
  wire                En_Write;
  reg        [63:0]   M_Fifo_Data;
  reg        [6:0]    data_count2;
  reg        [14:0]   M_Cnt_Cout;
  reg                 M_En_Last_Cout;
  wire                when_concat_final_l107;
  wire                when_concat_final_l112;
  reg        [10:0]   M_Cnt_Column;
  reg                 M_En_Last_Col;
  wire                when_concat_final_l123;
  wire                when_concat_final_l128;
  reg        [10:0]   M_Cnt_Row;
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
  reg        [14:0]   fsm_Ram_Channel_Cnt;
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
  reg        [14:0]   fsm_Direct_Channel_Cnt;
  wire                when_concat_final_l243;
  wire                when_concat_final_l248;
  reg                 fsm_Col_Complete;
  reg        [10:0]   fsm_Col_Cnt;
  wire                when_concat_final_l256;
  wire                when_concat_final_l261;
  wire                when_concat_final_l267;
  reg        [10:0]   fsm_Row_Cnt;
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
  assign _zz_when_concat_final_l107 = {8'd0, _zz_when_concat_final_l107_1};
  assign _zz_when_concat_final_l123 = (Row_Num_Out_REG - 11'h001);
  assign _zz_when_concat_final_l139 = (Row_Num_Out_REG - 11'h001);
  assign _zz_when_concat_final_l194_1 = (Ram_Channel_Times - 7'h01);
  assign _zz_when_concat_final_l194 = {8'd0, _zz_when_concat_final_l194_1};
  assign _zz_when_concat_final_l243_1 = (Direct_Channel_Times - 7'h01);
  assign _zz_when_concat_final_l243 = {8'd0, _zz_when_concat_final_l243_1};
  assign _zz_when_concat_final_l256 = (Row_Num_Out_REG - 11'h001);
  assign _zz_when_concat_final_l274 = (Row_Num_In_REG - 11'h001);
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
  assign count_mult1_B = {4'd0, Ram_Channel_Times};
  assign S_Count_Fifo_1 = count_mult1_P;
  assign count_mult2_B = {4'd0, Direct_Channel_Times};
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
      fsm_Ram_Channel_Cnt <= (fsm_Ram_Channel_Cnt + 15'h0001);
    end else begin
      fsm_Ram_Channel_Cnt <= 15'h0;
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
      fsm_Direct_Channel_Cnt <= (fsm_Direct_Channel_Cnt + 15'h0001);
    end else begin
      fsm_Direct_Channel_Cnt <= 15'h0;
    end
    if(when_concat_final_l261) begin
      if(fsm_Col_Complete) begin
        fsm_Col_Cnt <= 11'h0;
      end else begin
        fsm_Col_Cnt <= (fsm_Col_Cnt + 11'h001);
      end
    end else begin
      if(when_concat_final_l267) begin
        fsm_Col_Cnt <= 11'h0;
      end else begin
        fsm_Col_Cnt <= fsm_Col_Cnt;
      end
    end
    if(when_concat_final_l279) begin
      if(fsm_Row_Complete) begin
        fsm_Row_Cnt <= 11'h0;
      end else begin
        fsm_Row_Cnt <= (fsm_Row_Cnt + 11'h001);
      end
    end else begin
      if(when_concat_final_l285) begin
        fsm_Row_Cnt <= 11'h0;
      end else begin
        fsm_Row_Cnt <= fsm_Row_Cnt;
      end
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      M_Cnt_Cout <= 15'h0;
      M_Cnt_Column <= 11'h0;
      M_Cnt_Row <= 11'h0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_concat_final_l112) begin
        if(M_En_Last_Cout) begin
          M_Cnt_Cout <= 15'h0;
        end else begin
          M_Cnt_Cout <= (M_Cnt_Cout + 15'h0001);
        end
      end else begin
        M_Cnt_Cout <= M_Cnt_Cout;
      end
      if(when_concat_final_l128) begin
        if(M_En_Last_Col) begin
          M_Cnt_Column <= 11'h0;
        end else begin
          M_Cnt_Column <= (M_Cnt_Column + 11'h001);
        end
      end else begin
        M_Cnt_Column <= M_Cnt_Column;
      end
      if(when_concat_final_l144) begin
        if(M_En_Last_Row) begin
          M_Cnt_Row <= 11'h0;
        end else begin
          if(when_concat_final_l147) begin
            M_Cnt_Row <= (M_Cnt_Row + 11'h001);
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
