// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : upsampling
// Git hash  : bffdce92d07e4701e27bc73a7abe3219e550ba1a


`define fsm_enumDefinition_binary_sequential_type [3:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 4'b0000
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 4'b0001
`define fsm_enumDefinition_binary_sequential_fsm_WAIT 4'b0010
`define fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo 4'b0011
`define fsm_enumDefinition_binary_sequential_fsm_Write_Fifo 4'b0100
`define fsm_enumDefinition_binary_sequential_fsm_Read1_2 4'b0101
`define fsm_enumDefinition_binary_sequential_fsm_Read3_4 4'b0110
`define fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo 4'b0111
`define fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow 4'b1000


module upsampling (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input      [10:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Out_Num_REG,
  output reg          Upsample_Complete,
  output reg          Last_Upsample,
  input               reset,
  input               clk
);
  wire       [10:0]   count_mult_B;
  wire                Upsampling_Read_FIFO_wr_en;
  reg                 Upsampling_Read_FIFO_rd_en;
  wire       [10:0]   Upsampling_Read_FIFO_m_data_count;
  wire       [10:0]   Upsampling_Read_FIFO_s_data_count;
  wire                Upsampling_Write_FIFO_rd_en;
  wire       [10:0]   count_mult_P;
  wire       [13:0]   count_mult1_P;
  wire       [13:0]   count_mult2_P;
  wire                Upsampling_Read_FIFO_data_in_ready;
  wire       [63:0]   Upsampling_Read_FIFO_data_out;
  wire                Upsampling_Read_FIFO_data_out_valid;
  wire                Upsampling_Read_FIFO_data_valid;
  wire                Upsampling_Read_FIFO_full;
  wire                Upsampling_Read_FIFO_empty;
  wire                fifo_sync_6_full;
  wire                fifo_sync_6_empty;
  wire       [63:0]   fifo_sync_6_dout;
  wire       [9:0]    fifo_sync_6_wr_data_count;
  wire       [9:0]    fifo_sync_6_rd_data_count;
  wire                fifo_sync_6_data_valid;
  wire                fifo_sync_6_rd_rst_busy;
  wire                fifo_sync_6_wr_rst_busy;
  wire                fifo_sync_7_full;
  wire                fifo_sync_7_empty;
  wire       [63:0]   fifo_sync_7_dout;
  wire       [9:0]    fifo_sync_7_wr_data_count;
  wire       [9:0]    fifo_sync_7_rd_data_count;
  wire                fifo_sync_7_data_valid;
  wire                fifo_sync_7_rd_rst_busy;
  wire                fifo_sync_7_wr_rst_busy;
  wire                fifo_sync_8_full;
  wire                fifo_sync_8_empty;
  wire       [63:0]   fifo_sync_8_dout;
  wire       [9:0]    fifo_sync_8_wr_data_count;
  wire       [9:0]    fifo_sync_8_rd_data_count;
  wire                fifo_sync_8_data_valid;
  wire                fifo_sync_8_rd_rst_busy;
  wire                fifo_sync_8_wr_rst_busy;
  wire                fifo_sync_9_full;
  wire                fifo_sync_9_empty;
  wire       [63:0]   fifo_sync_9_dout;
  wire       [9:0]    fifo_sync_9_wr_data_count;
  wire       [9:0]    fifo_sync_9_rd_data_count;
  wire                fifo_sync_9_data_valid;
  wire                fifo_sync_9_rd_rst_busy;
  wire                fifo_sync_9_wr_rst_busy;
  wire                Upsampling_Write_FIFO_full;
  wire                Upsampling_Write_FIFO_empty;
  wire       [63:0]   Upsampling_Write_FIFO_dout;
  wire       [11:0]   Upsampling_Write_FIFO_wr_data_count;
  wire       [11:0]   Upsampling_Write_FIFO_rd_data_count;
  wire                Upsampling_Write_FIFO_data_valid;
  wire                Upsampling_Write_FIFO_rd_rst_busy;
  wire                Upsampling_Write_FIFO_wr_rst_busy;
  wire       [9:0]    _zz_when_upsampling_l102;
  wire       [6:0]    _zz_when_upsampling_l102_1;
  wire       [10:0]   _zz_when_upsampling_l119;
  wire       [9:0]    _zz_when_upsampling_l144;
  wire       [6:0]    _zz_when_upsampling_l144_1;
  wire       [13:0]   _zz_when_upsampling_l223;
  wire       [13:0]   _zz_when_upsampling_l229;
  wire       [10:0]   _zz_when_upsampling_l237;
  wire       [9:0]    _zz_when_upsampling_l253;
  wire       [6:0]    _zz_when_upsampling_l253_1;
  wire       [13:0]   _zz_when_upsampling_l269;
  wire       [13:0]   _zz_when_upsampling_l285;
  wire       [6:0]    Channel_Times;
  wire       [13:0]   Col1;
  wire       [13:0]   Col2;
  reg                 rd_en_0;
  reg                 rd_en_1;
  reg                 rd_en_2;
  reg                 rd_en_3;
  reg                 wr_en;
  reg        [63:0]   Last_din;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_upsampling_l88;
  wire                when_upsampling_l93;
  reg        [9:0]    fsm_Cnt_Cin;
  reg                 fsm_EN_Last_Cin;
  wire                when_upsampling_l102;
  wire                when_upsampling_l107;
  reg        [10:0]   fsm_Cnt_Column;
  reg                 fsm_En_Col;
  wire                when_upsampling_l119;
  wire                when_upsampling_l124;
  wire                when_upsampling_l135;
  reg        [9:0]    fsm_Cnt_Cin_2;
  reg                 fsm_EN_Last_Cin_2;
  wire                when_upsampling_l144;
  wire                when_upsampling_l149;
  wire                when_upsampling_l155;
  reg        [13:0]   fsm_Cnt_Column_2;
  wire                when_upsampling_l168;
  wire                when_upsampling_l176;
  wire                when_upsampling_l189;
  wire                when_upsampling_l194;
  wire                when_upsampling_l201;
  wire                when_upsampling_l206;
  wire                when_upsampling_l212;
  reg                 fsm_EN_Row_Read_2;
  wire                when_upsampling_l223;
  reg                 fsm_EN_Row_Read_3;
  wire                when_upsampling_l229;
  reg        [10:0]   fsm_Cnt_Row;
  reg                 fsm_EN_Judge_Row;
  wire                when_upsampling_l237;
  wire                when_upsampling_l242;
  wire                when_upsampling_l244;
  reg        [9:0]    fsm_M_Cnt_Cout;
  reg                 fsm_M_En_Last_Cout;
  wire                when_upsampling_l253;
  wire                when_upsampling_l258;
  reg        [13:0]   fsm_M_Cnt_Column;
  reg                 fsm_M_En_Last_Col;
  wire                when_upsampling_l269;
  wire                when_upsampling_l274;
  reg        [13:0]   fsm_M_Cnt_Row;
  reg                 fsm_M_En_Last_Row;
  wire                when_upsampling_l285;
  wire                when_upsampling_l290;
  wire                when_upsampling_l293;
  wire                when_upsampling_l301;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_upsampling_l337;
  `ifndef SYNTHESIS
  reg [135:0] fsm_stateReg_string;
  reg [135:0] fsm_stateNext_string;
  `endif


  assign _zz_when_upsampling_l102_1 = (Channel_Times - 7'h01);
  assign _zz_when_upsampling_l102 = {3'd0, _zz_when_upsampling_l102_1};
  assign _zz_when_upsampling_l119 = (Row_Num_Out_REG - 11'h001);
  assign _zz_when_upsampling_l144_1 = (Channel_Times - 7'h01);
  assign _zz_when_upsampling_l144 = {3'd0, _zz_when_upsampling_l144_1};
  assign _zz_when_upsampling_l223 = (Col1 - 14'h0001);
  assign _zz_when_upsampling_l229 = (Col2 - 14'h0001);
  assign _zz_when_upsampling_l237 = (Row_Num_Out_REG - 11'h001);
  assign _zz_when_upsampling_l253_1 = (Channel_Times - 7'h01);
  assign _zz_when_upsampling_l253 = {3'd0, _zz_when_upsampling_l253_1};
  assign _zz_when_upsampling_l269 = (Col1 - 14'h0001);
  assign _zz_when_upsampling_l285 = (Col1 - 14'h0001);
  mul count_mult (
    .A        (Row_Num_Out_REG  ), //i
    .B        (count_mult_B     ), //i
    .P        (count_mult_P     ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  mul_1 count_mult1 (
    .A        (Row_Num_Out_REG  ), //i
    .B        (2'b10            ), //i
    .P        (count_mult1_P    ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  mul_2 count_mult2 (
    .A        (Row_Num_Out_REG  ), //i
    .B        (3'b100           ), //i
    .P        (count_mult2_P    ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  general_fifo_sync Upsampling_Read_FIFO (
    .reset             (reset                                ), //i
    .clk               (clk                                  ), //i
    .data_in           (S_DATA_payload                       ), //i
    .wr_en             (Upsampling_Read_FIFO_wr_en           ), //i
    .data_in_ready     (Upsampling_Read_FIFO_data_in_ready   ), //o
    .data_out          (Upsampling_Read_FIFO_data_out        ), //o
    .rd_en             (Upsampling_Read_FIFO_rd_en           ), //i
    .data_out_valid    (Upsampling_Read_FIFO_data_out_valid  ), //o
    .m_data_count      (Upsampling_Read_FIFO_m_data_count    ), //i
    .s_data_count      (Upsampling_Read_FIFO_s_data_count    ), //i
    .data_valid        (Upsampling_Read_FIFO_data_valid      ), //o
    .full              (Upsampling_Read_FIFO_full            ), //o
    .empty             (Upsampling_Read_FIFO_empty           )  //o
  );
  fifo_sync fifo_sync_6 (
    .full             (fifo_sync_6_full               ), //o
    .wr_en            (Upsampling_Read_FIFO_rd_en     ), //i
    .din              (Upsampling_Read_FIFO_data_out  ), //i
    .empty            (fifo_sync_6_empty              ), //o
    .dout             (fifo_sync_6_dout               ), //o
    .rd_en            (rd_en_0                        ), //i
    .wr_data_count    (fifo_sync_6_wr_data_count      ), //o
    .rd_data_count    (fifo_sync_6_rd_data_count      ), //o
    .data_valid       (fifo_sync_6_data_valid         ), //o
    .rd_rst_busy      (fifo_sync_6_rd_rst_busy        ), //o
    .wr_rst_busy      (fifo_sync_6_wr_rst_busy        ), //o
    .reset            (reset                          ), //i
    .clk              (clk                            )  //i
  );
  fifo_sync fifo_sync_7 (
    .full             (fifo_sync_7_full               ), //o
    .wr_en            (Upsampling_Read_FIFO_rd_en     ), //i
    .din              (Upsampling_Read_FIFO_data_out  ), //i
    .empty            (fifo_sync_7_empty              ), //o
    .dout             (fifo_sync_7_dout               ), //o
    .rd_en            (rd_en_1                        ), //i
    .wr_data_count    (fifo_sync_7_wr_data_count      ), //o
    .rd_data_count    (fifo_sync_7_rd_data_count      ), //o
    .data_valid       (fifo_sync_7_data_valid         ), //o
    .rd_rst_busy      (fifo_sync_7_rd_rst_busy        ), //o
    .wr_rst_busy      (fifo_sync_7_wr_rst_busy        ), //o
    .reset            (reset                          ), //i
    .clk              (clk                            )  //i
  );
  fifo_sync fifo_sync_8 (
    .full             (fifo_sync_8_full               ), //o
    .wr_en            (Upsampling_Read_FIFO_rd_en     ), //i
    .din              (Upsampling_Read_FIFO_data_out  ), //i
    .empty            (fifo_sync_8_empty              ), //o
    .dout             (fifo_sync_8_dout               ), //o
    .rd_en            (rd_en_2                        ), //i
    .wr_data_count    (fifo_sync_8_wr_data_count      ), //o
    .rd_data_count    (fifo_sync_8_rd_data_count      ), //o
    .data_valid       (fifo_sync_8_data_valid         ), //o
    .rd_rst_busy      (fifo_sync_8_rd_rst_busy        ), //o
    .wr_rst_busy      (fifo_sync_8_wr_rst_busy        ), //o
    .reset            (reset                          ), //i
    .clk              (clk                            )  //i
  );
  fifo_sync fifo_sync_9 (
    .full             (fifo_sync_9_full               ), //o
    .wr_en            (Upsampling_Read_FIFO_rd_en     ), //i
    .din              (Upsampling_Read_FIFO_data_out  ), //i
    .empty            (fifo_sync_9_empty              ), //o
    .dout             (fifo_sync_9_dout               ), //o
    .rd_en            (rd_en_3                        ), //i
    .wr_data_count    (fifo_sync_9_wr_data_count      ), //o
    .rd_data_count    (fifo_sync_9_rd_data_count      ), //o
    .data_valid       (fifo_sync_9_data_valid         ), //o
    .rd_rst_busy      (fifo_sync_9_rd_rst_busy        ), //o
    .wr_rst_busy      (fifo_sync_9_wr_rst_busy        ), //o
    .reset            (reset                          ), //i
    .clk              (clk                            )  //i
  );
  fifo_sync_5 Upsampling_Write_FIFO (
    .full             (Upsampling_Write_FIFO_full           ), //o
    .wr_en            (wr_en                                ), //i
    .din              (Last_din                             ), //i
    .empty            (Upsampling_Write_FIFO_empty          ), //o
    .dout             (Upsampling_Write_FIFO_dout           ), //o
    .rd_en            (Upsampling_Write_FIFO_rd_en          ), //i
    .wr_data_count    (Upsampling_Write_FIFO_wr_data_count  ), //o
    .rd_data_count    (Upsampling_Write_FIFO_rd_data_count  ), //o
    .data_valid       (Upsampling_Write_FIFO_data_valid     ), //o
    .rd_rst_busy      (Upsampling_Write_FIFO_rd_rst_busy    ), //o
    .wr_rst_busy      (Upsampling_Write_FIFO_wr_rst_busy    ), //o
    .reset            (reset                                ), //i
    .clk              (clk                                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT         ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE         ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : fsm_stateReg_string = "fsm_WAIT         ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo : fsm_stateReg_string = "fsm_Judge_Fifo   ";
      `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo : fsm_stateReg_string = "fsm_Write_Fifo   ";
      `fsm_enumDefinition_binary_sequential_fsm_Read1_2 : fsm_stateReg_string = "fsm_Read1_2      ";
      `fsm_enumDefinition_binary_sequential_fsm_Read3_4 : fsm_stateReg_string = "fsm_Read3_4      ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo : fsm_stateReg_string = "fsm_Judge_M_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow : fsm_stateReg_string = "fsm_Judge_LastRow";
      default : fsm_stateReg_string = "?????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT         ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE         ";
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : fsm_stateNext_string = "fsm_WAIT         ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo : fsm_stateNext_string = "fsm_Judge_Fifo   ";
      `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo : fsm_stateNext_string = "fsm_Write_Fifo   ";
      `fsm_enumDefinition_binary_sequential_fsm_Read1_2 : fsm_stateNext_string = "fsm_Read1_2      ";
      `fsm_enumDefinition_binary_sequential_fsm_Read3_4 : fsm_stateNext_string = "fsm_Read3_4      ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo : fsm_stateNext_string = "fsm_Judge_M_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow : fsm_stateNext_string = "fsm_Judge_LastRow";
      default : fsm_stateNext_string = "?????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_Out_Num_REG >>> 3);
  assign count_mult_B = {4'd0, Channel_Times};
  assign Col1 = count_mult1_P;
  assign Col2 = count_mult2_P;
  assign Upsampling_Read_FIFO_wr_en = (S_DATA_valid && S_DATA_ready);
  assign S_DATA_ready = Upsampling_Read_FIFO_data_in_ready;
  assign Upsampling_Read_FIFO_m_data_count = count_mult_P;
  assign Upsampling_Read_FIFO_s_data_count = count_mult_P;
  assign Upsampling_Write_FIFO_rd_en = (M_DATA_ready && M_DATA_valid);
  assign M_DATA_payload = Upsampling_Write_FIFO_dout;
  assign M_DATA_valid = Upsampling_Write_FIFO_data_valid;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WAIT : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Read1_2 : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Read3_4 : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_upsampling_l88 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_upsampling_l88) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_upsampling_l102 = (fsm_Cnt_Cin == _zz_when_upsampling_l102);
  always @(*) begin
    if(when_upsampling_l102) begin
      fsm_EN_Last_Cin = 1'b1;
    end else begin
      fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_upsampling_l119 = (fsm_Cnt_Column == _zz_when_upsampling_l119);
  always @(*) begin
    if(when_upsampling_l119) begin
      fsm_En_Col = 1'b1;
    end else begin
      fsm_En_Col = 1'b0;
    end
  end

  always @(*) begin
    if(when_upsampling_l135) begin
      Upsampling_Read_FIFO_rd_en = 1'b1;
    end else begin
      Upsampling_Read_FIFO_rd_en = 1'b0;
    end
  end

  assign when_upsampling_l144 = (fsm_Cnt_Cin_2 == _zz_when_upsampling_l144);
  always @(*) begin
    if(when_upsampling_l144) begin
      fsm_EN_Last_Cin_2 = 1'b1;
    end else begin
      fsm_EN_Last_Cin_2 = 1'b0;
    end
  end

  always @(*) begin
    if(when_upsampling_l189) begin
      rd_en_1 = (! rd_en_0);
    end else begin
      rd_en_1 = 1'b0;
    end
  end

  always @(*) begin
    if(when_upsampling_l194) begin
      rd_en_3 = (! rd_en_2);
    end else begin
      rd_en_3 = 1'b0;
    end
  end

  assign when_upsampling_l201 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read1_2) || (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read3_4));
  assign when_upsampling_l223 = ((fsm_Cnt_Column_2 == _zz_when_upsampling_l223) && fsm_EN_Last_Cin_2);
  always @(*) begin
    if(when_upsampling_l223) begin
      fsm_EN_Row_Read_2 = 1'b1;
    end else begin
      fsm_EN_Row_Read_2 = 1'b0;
    end
  end

  assign when_upsampling_l229 = ((fsm_Cnt_Column_2 == _zz_when_upsampling_l229) && fsm_EN_Last_Cin_2);
  always @(*) begin
    if(when_upsampling_l229) begin
      fsm_EN_Row_Read_3 = 1'b1;
    end else begin
      fsm_EN_Row_Read_3 = 1'b0;
    end
  end

  assign when_upsampling_l237 = (fsm_Cnt_Row == _zz_when_upsampling_l237);
  always @(*) begin
    if(when_upsampling_l237) begin
      fsm_EN_Judge_Row = 1'b1;
    end else begin
      fsm_EN_Judge_Row = 1'b0;
    end
  end

  assign when_upsampling_l253 = (fsm_M_Cnt_Cout == _zz_when_upsampling_l253);
  always @(*) begin
    if(when_upsampling_l253) begin
      fsm_M_En_Last_Cout = 1'b1;
    end else begin
      fsm_M_En_Last_Cout = 1'b0;
    end
  end

  assign when_upsampling_l258 = (M_DATA_valid && M_DATA_ready);
  assign when_upsampling_l269 = (fsm_M_Cnt_Column == _zz_when_upsampling_l269);
  always @(*) begin
    if(when_upsampling_l269) begin
      fsm_M_En_Last_Col = 1'b1;
    end else begin
      fsm_M_En_Last_Col = 1'b0;
    end
  end

  assign when_upsampling_l274 = ((M_DATA_valid && M_DATA_ready) && fsm_M_En_Last_Cout);
  assign when_upsampling_l285 = (fsm_M_Cnt_Row == _zz_when_upsampling_l285);
  always @(*) begin
    if(when_upsampling_l285) begin
      fsm_M_En_Last_Row = 1'b1;
    end else begin
      fsm_M_En_Last_Row = 1'b0;
    end
  end

  assign when_upsampling_l290 = (M_DATA_valid && M_DATA_ready);
  assign when_upsampling_l293 = (fsm_M_En_Last_Col && fsm_M_En_Last_Cout);
  assign when_upsampling_l301 = ((fsm_M_En_Last_Row && fsm_M_En_Last_Col) && fsm_M_En_Last_Cout);
  always @(*) begin
    if(when_upsampling_l301) begin
      Last_Upsample = 1'b1;
    end else begin
      Last_Upsample = 1'b0;
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
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WAIT;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo : begin
        if(Upsampling_Read_FIFO_data_out_valid) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo : begin
        if(when_upsampling_l337) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Read1_2 : begin
        if(fsm_EN_Row_Read_2) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Read3_4;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Read1_2;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Read3_4 : begin
        if(fsm_EN_Row_Read_3) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Read3_4;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo : begin
        if(Upsampling_Write_FIFO_empty) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Read1_2;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_M_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow : begin
        if(fsm_EN_Judge_Row) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Fifo;
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

  assign when_upsampling_l337 = (fsm_En_Col && fsm_EN_Last_Cin);
  assign when_upsampling_l93 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_WAIT);
  assign when_upsampling_l107 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo);
  assign when_upsampling_l124 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo);
  assign when_upsampling_l135 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Write_Fifo);
  assign when_upsampling_l149 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read1_2);
  assign when_upsampling_l155 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read3_4);
  assign when_upsampling_l168 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read1_2);
  assign when_upsampling_l176 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read3_4);
  assign when_upsampling_l189 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read1_2);
  assign when_upsampling_l194 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read3_4);
  assign when_upsampling_l206 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read1_2);
  assign when_upsampling_l212 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Read3_4);
  assign when_upsampling_l242 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_LastRow);
  assign when_upsampling_l244 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_IDLE);
  always @(posedge clk) begin
    if(when_upsampling_l93) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_upsampling_l107) begin
      if(fsm_EN_Last_Cin) begin
        fsm_Cnt_Cin <= 10'h0;
      end else begin
        fsm_Cnt_Cin <= (fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      fsm_Cnt_Cin <= 10'h0;
    end
    if(when_upsampling_l124) begin
      if(fsm_EN_Last_Cin) begin
        fsm_Cnt_Column <= (fsm_Cnt_Column + 11'h001);
      end else begin
        fsm_Cnt_Column <= fsm_Cnt_Column;
      end
    end else begin
      fsm_Cnt_Column <= 11'h0;
    end
    if(when_upsampling_l149) begin
      if(fsm_EN_Last_Cin_2) begin
        fsm_Cnt_Cin_2 <= 10'h0;
      end else begin
        fsm_Cnt_Cin_2 <= (fsm_Cnt_Cin_2 + 10'h001);
      end
    end else begin
      if(when_upsampling_l155) begin
        if(fsm_EN_Last_Cin_2) begin
          fsm_Cnt_Cin_2 <= 10'h0;
        end else begin
          fsm_Cnt_Cin_2 <= (fsm_Cnt_Cin_2 + 10'h001);
        end
      end else begin
        fsm_Cnt_Cin_2 <= 10'h0;
      end
    end
    if(when_upsampling_l168) begin
      if(fsm_EN_Last_Cin_2) begin
        rd_en_0 <= (! rd_en_0);
        fsm_Cnt_Column_2 <= (fsm_Cnt_Column_2 + 14'h0001);
      end else begin
        rd_en_0 <= rd_en_0;
        fsm_Cnt_Column_2 <= fsm_Cnt_Column_2;
      end
    end else begin
      if(when_upsampling_l176) begin
        if(fsm_EN_Last_Cin_2) begin
          rd_en_2 <= (! rd_en_2);
          fsm_Cnt_Column_2 <= (fsm_Cnt_Column_2 + 14'h0001);
        end else begin
          rd_en_2 <= rd_en_2;
          fsm_Cnt_Column_2 <= fsm_Cnt_Column_2;
        end
      end else begin
        fsm_Cnt_Column_2 <= 14'h0;
        rd_en_0 <= 1'b0;
        rd_en_2 <= 1'b0;
      end
    end
    if(when_upsampling_l201) begin
      wr_en <= 1'b1;
    end else begin
      wr_en <= 1'b0;
    end
    if(when_upsampling_l206) begin
      if(rd_en_0) begin
        Last_din <= fifo_sync_6_dout;
      end else begin
        Last_din <= fifo_sync_7_dout;
      end
    end else begin
      if(when_upsampling_l212) begin
        if(rd_en_2) begin
          Last_din <= fifo_sync_8_dout;
        end else begin
          Last_din <= fifo_sync_9_dout;
        end
      end else begin
        Last_din <= 64'h0;
      end
    end
    if(when_upsampling_l242) begin
      fsm_Cnt_Row <= (fsm_Cnt_Row + 11'h001);
    end else begin
      if(when_upsampling_l244) begin
        fsm_Cnt_Row <= 11'h0;
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end
    if(Last_Upsample) begin
      Upsample_Complete <= 1'b1;
    end else begin
      Upsample_Complete <= 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_M_Cnt_Cout <= 10'h0;
      fsm_M_Cnt_Column <= 14'h0;
      fsm_M_Cnt_Row <= 14'h0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_upsampling_l258) begin
        if(fsm_M_En_Last_Cout) begin
          fsm_M_Cnt_Cout <= 10'h0;
        end else begin
          fsm_M_Cnt_Cout <= (fsm_M_Cnt_Cout + 10'h001);
        end
      end else begin
        fsm_M_Cnt_Cout <= fsm_M_Cnt_Cout;
      end
      if(when_upsampling_l274) begin
        if(fsm_M_En_Last_Col) begin
          fsm_M_Cnt_Column <= 14'h0;
        end else begin
          fsm_M_Cnt_Column <= (fsm_M_Cnt_Column + 14'h0001);
        end
      end else begin
        fsm_M_Cnt_Column <= fsm_M_Cnt_Column;
      end
      if(when_upsampling_l290) begin
        if(fsm_M_En_Last_Row) begin
          fsm_M_Cnt_Row <= 14'h0;
        end else begin
          if(when_upsampling_l293) begin
            fsm_M_Cnt_Row <= (fsm_M_Cnt_Row + 14'h0001);
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

module fifo_sync_5 (
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

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

//fifo_sync replaced by fifo_sync

module general_fifo_sync (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [63:0]   data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [10:0]   m_data_count,
  input      [10:0]   s_data_count,
  output              data_valid,
  output              full,
  output              empty
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [63:0]   fifo_dout;
  wire       [9:0]    fifo_wr_data_count;
  wire       [9:0]    fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [10:0]   _zz_when_general_fifo_sync_l59;
  wire       [9:0]    _zz_when_general_fifo_sync_l59_1;
  wire                when_general_fifo_sync_l53;
  wire                when_general_fifo_sync_l59;

  assign _zz_when_general_fifo_sync_l59_1 = fifo_rd_data_count;
  assign _zz_when_general_fifo_sync_l59 = {1'd0, _zz_when_general_fifo_sync_l59_1};
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
  assign when_general_fifo_sync_l53 = (((! fifo_wr_rst_busy) && (! fifo_full)) && (fifo_wr_data_count < 10'h1f6));
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

module mul_2 (
  input      [10:0]   A,
  input      [2:0]    B,
  output     [13:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [10:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [2:0]    _zz_P_1;
  (* use_dsp = "yes" *) reg        [10:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [2:0]    _zz_P_3;
  (* use_dsp = "yes" *) reg        [13:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [13:0]   _zz_P_5;

  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_5;
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule

module mul_1 (
  input      [10:0]   A,
  input      [1:0]    B,
  output     [13:0]   P,
  input               clk,
  input               reset
);
  wire       [12:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [10:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [1:0]    _zz_P_1;
  (* use_dsp = "yes" *) reg        [10:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [1:0]    _zz_P_3;
  (* use_dsp = "yes" *) reg        [12:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [12:0]   _zz_P_5;

  assign _zz_P_6 = _zz_P_5;
  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = {1'd0, _zz_P_6};
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule

module mul (
  input      [10:0]   A,
  input      [10:0]   B,
  output     [10:0]   P,
  input               clk,
  input               reset
);
  wire       [21:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [10:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [10:0]   _zz_P_1;
  (* use_dsp = "yes" *) reg        [10:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [10:0]   _zz_P_3;
  (* use_dsp = "yes" *) reg        [21:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [21:0]   _zz_P_5;

  assign _zz_P_6 = _zz_P_5;
  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_6[10:0];
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
  output     [9:0]    wr_data_count,
  output     [9:0]    rd_data_count,
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
  wire       [9:0]    temp_rd_data_count;
  wire                temp_rd_rst_busy;
  wire                temp_sbiterr;
  wire                temp_underflow;
  wire                temp_wr_ack;
  wire       [9:0]    temp_wr_data_count;
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
    .FIFO_WRITE_DEPTH(512),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(507),
    .RD_DATA_COUNT_WIDTH(10),
    .READ_DATA_WIDTH(64),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(64),
    .WR_DATA_COUNT_WIDTH(10) 
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
