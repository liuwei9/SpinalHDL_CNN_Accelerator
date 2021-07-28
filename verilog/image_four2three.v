// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_four2three
// Git hash  : 1b45fb4aa3f85cd7bbb69604ecada626903029dd
// Date      : 28/07/2021, 23:32:47


module image_four2three (
  input               Start,
  output reg          StartRow,
  input      [11:0]   Row_Num_After_Padding,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [7:0]    S_DATA_payload,
  output reg [23:0]   M_DATA,
  input               M_Ready,
  output reg          M_Valid,
  input               M_rd_en,
  input      [11:0]   M_Addr,
  input               reset,
  input               clk
);
  reg                 four2three_fifo_rd_en;
  wire       [9:0]    ram1_addra;
  wire       [9:0]    ram1_addrb;
  reg                 ram1_ena;
  reg                 ram1_enb;
  reg        [0:0]    ram1_wea;
  wire       [9:0]    ram2_addra;
  wire       [9:0]    ram2_addrb;
  reg                 ram2_ena;
  reg                 ram2_enb;
  reg        [0:0]    ram2_wea;
  wire       [9:0]    ram3_addra;
  wire       [9:0]    ram3_addrb;
  reg                 ram3_ena;
  reg                 ram3_enb;
  reg        [0:0]    ram3_wea;
  wire       [9:0]    ram4_addra;
  wire       [9:0]    ram4_addrb;
  reg                 ram4_ena;
  reg                 ram4_enb;
  reg        [0:0]    ram4_wea;
  wire                four2three_fifo_data_in_ready;
  wire       [7:0]    four2three_fifo_data_out;
  wire                four2three_fifo_data_out_valid;
  wire       [7:0]    ram1_doutb;
  wire       [7:0]    ram2_doutb;
  wire       [7:0]    ram3_doutb;
  wire       [7:0]    ram4_doutb;
  wire       [11:0]   _zz_addrb;
  wire       [11:0]   _zz_addrb_1;
  wire       [11:0]   _zz_addrb_2;
  wire       [11:0]   _zz_addrb_3;
  wire       [11:0]   _zz_when_four2three_l48;
  wire       [11:0]   _zz_addra;
  wire       [11:0]   _zz_addra_1;
  wire       [11:0]   _zz_addra_2;
  wire       [11:0]   _zz_addra_3;
  wire                four2three_fsm_wantExit;
  reg                 four2three_fsm_wantStart;
  wire                four2three_fsm_wantKill;
  reg                 four2three_fsm_End_Read;
  reg        [11:0]   four2three_fsm_Cnt_Column;
  wire                when_four2three_l45;
  wire                when_four2three_l48;
  reg        [1:0]    four2three_fsm_Cnt_Ram;
  wire                when_four2three_l52;
  wire                when_four2three_l54;
  reg        [11:0]   four2three_fsm_Cnt_ROW;
  wire                when_four2three_l58;
  wire                when_four2three_l60;
  reg                 four2three_fsm_Last_Row;
  wire                when_four2three_l64;
  reg        [1:0]    four2three_fsm_En_Ram;
  wire                when_four2three_l70;
  reg        [11:0]   four2three_fsm_addrRam1;
  reg        [11:0]   four2three_fsm_addrRam2;
  reg        [11:0]   four2three_fsm_addrRam3;
  reg        [11:0]   four2three_fsm_addrRam4;
  wire                when_four2three_l272;
  wire                when_four2three_l272_1;
  wire                when_four2three_l272_2;
  wire                when_four2three_l272_3;
  wire                when_four2three_l117;
  wire                when_four2three_l158;
  reg        [2:0]    four2three_fsm_rd_ram_cnt;
  wire                when_four2three_l165;
  wire                when_four2three_l167;
  reg        `four2three_fsm_enumDefinition_binary_sequential_type four2three_fsm_stateReg;
  reg        `four2three_fsm_enumDefinition_binary_sequential_type four2three_fsm_stateNext;
  wire                when_four2three_l255;
  `ifndef SYNTHESIS
  reg [223:0] four2three_fsm_stateReg_string;
  reg [223:0] four2three_fsm_stateNext_string;
  `endif


  assign _zz_addrb = M_Addr;
  assign _zz_addrb_1 = M_Addr;
  assign _zz_addrb_2 = M_Addr;
  assign _zz_addrb_3 = M_Addr;
  assign _zz_when_four2three_l48 = (Row_Num_After_Padding - 12'h001);
  assign _zz_addra = four2three_fsm_addrRam1;
  assign _zz_addra_1 = four2three_fsm_addrRam2;
  assign _zz_addra_2 = four2three_fsm_addrRam3;
  assign _zz_addra_3 = four2three_fsm_addrRam4;
  image_four2three_fifo four2three_fifo (
    .reset             (reset                           ), //i
    .clk               (clk                             ), //i
    .data_in           (S_DATA_payload                  ), //i
    .wr_en             (S_DATA_valid                    ), //i
    .data_in_ready     (four2three_fifo_data_in_ready   ), //o
    .data_out          (four2three_fifo_data_out        ), //o
    .rd_en             (four2three_fifo_rd_en           ), //i
    .data_out_valid    (four2three_fifo_data_out_valid  )  //o
  );
  image_four2three_ram1 ram1 (
    .doutb    (ram1_doutb                ), //o
    .addra    (ram1_addra                ), //i
    .addrb    (ram1_addrb                ), //i
    .dina     (four2three_fifo_data_out  ), //i
    .ena      (ram1_ena                  ), //i
    .enb      (ram1_enb                  ), //i
    .wea      (ram1_wea                  ), //i
    .clk      (clk                       )  //i
  );
  image_four2three_ram1 ram2 (
    .doutb    (ram2_doutb                ), //o
    .addra    (ram2_addra                ), //i
    .addrb    (ram2_addrb                ), //i
    .dina     (four2three_fifo_data_out  ), //i
    .ena      (ram2_ena                  ), //i
    .enb      (ram2_enb                  ), //i
    .wea      (ram2_wea                  ), //i
    .clk      (clk                       )  //i
  );
  image_four2three_ram1 ram3 (
    .doutb    (ram3_doutb                ), //o
    .addra    (ram3_addra                ), //i
    .addrb    (ram3_addrb                ), //i
    .dina     (four2three_fifo_data_out  ), //i
    .ena      (ram3_ena                  ), //i
    .enb      (ram3_enb                  ), //i
    .wea      (ram3_wea                  ), //i
    .clk      (clk                       )  //i
  );
  image_four2three_ram1 ram4 (
    .doutb    (ram4_doutb                ), //o
    .addra    (ram4_addra                ), //i
    .addrb    (ram4_addrb                ), //i
    .dina     (four2three_fifo_data_out  ), //i
    .ena      (ram4_ena                  ), //i
    .enb      (ram4_enb                  ), //i
    .wea      (ram4_wea                  ), //i
    .clk      (clk                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(four2three_fsm_stateReg)
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_BOOT : four2three_fsm_stateReg_string = "four2three_fsm_BOOT         ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE : four2three_fsm_stateReg_string = "four2three_fsm_IDLE         ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo : four2three_fsm_stateReg_string = "four2three_fsm_Judge_Fifo   ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read : four2three_fsm_stateReg_string = "four2three_fsm_Read         ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute : four2three_fsm_stateReg_string = "four2three_fsm_Judge_Compute";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute : four2three_fsm_stateReg_string = "four2three_fsm_Start_Compute";
      default : four2three_fsm_stateReg_string = "????????????????????????????";
    endcase
  end
  always @(*) begin
    case(four2three_fsm_stateNext)
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_BOOT : four2three_fsm_stateNext_string = "four2three_fsm_BOOT         ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE : four2three_fsm_stateNext_string = "four2three_fsm_IDLE         ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo : four2three_fsm_stateNext_string = "four2three_fsm_Judge_Fifo   ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read : four2three_fsm_stateNext_string = "four2three_fsm_Read         ";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute : four2three_fsm_stateNext_string = "four2three_fsm_Judge_Compute";
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute : four2three_fsm_stateNext_string = "four2three_fsm_Start_Compute";
      default : four2three_fsm_stateNext_string = "????????????????????????????";
    endcase
  end
  `endif

  assign S_DATA_ready = four2three_fifo_data_in_ready;
  assign ram1_addrb = _zz_addrb[9:0];
  assign ram2_addrb = _zz_addrb_1[9:0];
  assign ram3_addrb = _zz_addrb_2[9:0];
  assign ram4_addrb = _zz_addrb_3[9:0];
  assign four2three_fsm_wantExit = 1'b0;
  always @(*) begin
    four2three_fsm_wantStart = 1'b0;
    case(four2three_fsm_stateReg)
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE : begin
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo : begin
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read : begin
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute : begin
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute : begin
      end
      default : begin
        four2three_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign four2three_fsm_wantKill = 1'b0;
  assign when_four2three_l48 = (four2three_fsm_Cnt_Column == _zz_when_four2three_l48);
  always @(*) begin
    if(when_four2three_l48) begin
      four2three_fsm_End_Read = 1'b1;
    end else begin
      four2three_fsm_End_Read = 1'b0;
    end
  end

  assign when_four2three_l64 = (four2three_fsm_Cnt_ROW == Row_Num_After_Padding);
  always @(*) begin
    if(when_four2three_l64) begin
      four2three_fsm_Last_Row = 1'b1;
    end else begin
      four2three_fsm_Last_Row = 1'b0;
    end
  end

  always @(*) begin
    case(four2three_fsm_En_Ram)
      2'b00 : begin
        ram1_ena = 1'b1;
      end
      2'b01 : begin
        ram1_ena = 1'b0;
      end
      2'b10 : begin
        ram1_ena = 1'b0;
      end
      default : begin
        ram1_ena = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(four2three_fsm_En_Ram)
      2'b00 : begin
        ram2_ena = 1'b0;
      end
      2'b01 : begin
        ram2_ena = 1'b1;
      end
      2'b10 : begin
        ram2_ena = 1'b0;
      end
      default : begin
        ram2_ena = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(four2three_fsm_En_Ram)
      2'b00 : begin
        ram3_ena = 1'b0;
      end
      2'b01 : begin
        ram3_ena = 1'b0;
      end
      2'b10 : begin
        ram3_ena = 1'b1;
      end
      default : begin
        ram3_ena = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(four2three_fsm_En_Ram)
      2'b00 : begin
        ram4_ena = 1'b0;
      end
      2'b01 : begin
        ram4_ena = 1'b0;
      end
      2'b10 : begin
        ram4_ena = 1'b0;
      end
      default : begin
        ram4_ena = 1'b1;
      end
    endcase
  end

  assign ram1_addra = _zz_addra[9:0];
  assign ram2_addra = _zz_addra_1[9:0];
  assign ram3_addra = _zz_addra_2[9:0];
  assign ram4_addra = _zz_addra_3[9:0];
  always @(*) begin
    if(when_four2three_l117) begin
      four2three_fifo_rd_en = 1'b1;
    end else begin
      four2three_fifo_rd_en = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l117) begin
      case(four2three_fsm_En_Ram)
        2'b00 : begin
          ram1_wea = 1'b1;
        end
        2'b01 : begin
          ram1_wea = 1'b0;
        end
        2'b10 : begin
          ram1_wea = 1'b0;
        end
        default : begin
          ram1_wea = 1'b0;
        end
      endcase
    end else begin
      ram1_wea = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l117) begin
      case(four2three_fsm_En_Ram)
        2'b00 : begin
          ram2_wea = 1'b0;
        end
        2'b01 : begin
          ram2_wea = 1'b1;
        end
        2'b10 : begin
          ram2_wea = 1'b0;
        end
        default : begin
          ram2_wea = 1'b0;
        end
      endcase
    end else begin
      ram2_wea = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l117) begin
      case(four2three_fsm_En_Ram)
        2'b00 : begin
          ram3_wea = 1'b0;
        end
        2'b01 : begin
          ram3_wea = 1'b0;
        end
        2'b10 : begin
          ram3_wea = 1'b1;
        end
        default : begin
          ram3_wea = 1'b0;
        end
      endcase
    end else begin
      ram3_wea = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l117) begin
      case(four2three_fsm_En_Ram)
        2'b00 : begin
          ram4_wea = 1'b0;
        end
        2'b01 : begin
          ram4_wea = 1'b0;
        end
        2'b10 : begin
          ram4_wea = 1'b0;
        end
        default : begin
          ram4_wea = 1'b1;
        end
      endcase
    end else begin
      ram4_wea = 1'b0;
    end
  end

  assign when_four2three_l165 = (four2three_fsm_rd_ram_cnt == 3'b100);
  always @(*) begin
    case(four2three_fsm_rd_ram_cnt)
      3'b001 : begin
        ram1_enb = M_rd_en;
      end
      3'b010 : begin
        ram1_enb = 1'b0;
      end
      3'b011 : begin
        ram1_enb = M_rd_en;
      end
      3'b100 : begin
        ram1_enb = M_rd_en;
      end
      default : begin
        ram1_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(four2three_fsm_rd_ram_cnt)
      3'b001 : begin
        ram2_enb = M_rd_en;
      end
      3'b010 : begin
        ram2_enb = M_rd_en;
      end
      3'b011 : begin
        ram2_enb = 1'b0;
      end
      3'b100 : begin
        ram2_enb = M_rd_en;
      end
      default : begin
        ram2_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(four2three_fsm_rd_ram_cnt)
      3'b001 : begin
        ram3_enb = M_rd_en;
      end
      3'b010 : begin
        ram3_enb = M_rd_en;
      end
      3'b011 : begin
        ram3_enb = M_rd_en;
      end
      3'b100 : begin
        ram3_enb = 1'b0;
      end
      default : begin
        ram3_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(four2three_fsm_rd_ram_cnt)
      3'b001 : begin
        ram4_enb = 1'b0;
      end
      3'b010 : begin
        ram4_enb = M_rd_en;
      end
      3'b011 : begin
        ram4_enb = M_rd_en;
      end
      3'b100 : begin
        ram4_enb = M_rd_en;
      end
      default : begin
        ram4_enb = 1'b0;
      end
    endcase
  end

  always @(*) begin
    four2three_fsm_stateNext = four2three_fsm_stateReg;
    case(four2three_fsm_stateReg)
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE : begin
        if(Start) begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo;
        end else begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE;
        end
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo : begin
        if(four2three_fifo_data_out_valid) begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read;
        end else begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo;
        end
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read : begin
        if(four2three_fsm_End_Read) begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute;
        end else begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read;
        end
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute : begin
        if(when_four2three_l255) begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute;
        end else begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo;
        end
      end
      `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute : begin
        if(four2three_fsm_Last_Row) begin
          four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE;
        end else begin
          if(M_Ready) begin
            four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Fifo;
          end else begin
            four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute;
          end
        end
      end
      default : begin
      end
    endcase
    if(four2three_fsm_wantStart) begin
      four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE;
    end
    if(four2three_fsm_wantKill) begin
      four2three_fsm_stateNext = `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_BOOT;
    end
  end

  assign when_four2three_l255 = (four2three_fsm_Cnt_Ram == 2'b10);
  assign when_four2three_l45 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read);
  assign when_four2three_l52 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute);
  assign when_four2three_l54 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute);
  assign when_four2three_l58 = ((four2three_fsm_stateNext == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute) && (four2three_fsm_stateReg != `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute));
  assign when_four2three_l60 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_IDLE);
  assign when_four2three_l70 = ((four2three_fsm_stateNext == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute) && (four2three_fsm_stateReg != `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Judge_Compute));
  assign when_four2three_l272 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read);
  assign when_four2three_l272_1 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read);
  assign when_four2three_l272_2 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read);
  assign when_four2three_l272_3 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read);
  assign when_four2three_l117 = (four2three_fsm_stateReg == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Read);
  assign when_four2three_l158 = ((four2three_fsm_stateNext == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute) && (four2three_fsm_stateReg != `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute));
  assign when_four2three_l167 = ((four2three_fsm_stateNext == `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute) && (four2three_fsm_stateReg != `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_Start_Compute));
  always @(posedge clk) begin
    if(reset) begin
      StartRow <= 1'b0;
      M_DATA <= 24'h0;
      M_Valid <= 1'b0;
      four2three_fsm_Cnt_Column <= 12'h0;
      four2three_fsm_Cnt_Ram <= 2'b00;
      four2three_fsm_Cnt_ROW <= 12'h0;
      four2three_fsm_En_Ram <= 2'b00;
      four2three_fsm_addrRam1 <= 12'h0;
      four2three_fsm_addrRam2 <= 12'h0;
      four2three_fsm_addrRam3 <= 12'h0;
      four2three_fsm_addrRam4 <= 12'h0;
      four2three_fsm_rd_ram_cnt <= 3'b000;
      four2three_fsm_stateReg <= `four2three_fsm_enumDefinition_binary_sequential_four2three_fsm_BOOT;
    end else begin
      if(when_four2three_l45) begin
        four2three_fsm_Cnt_Column <= (four2three_fsm_Cnt_Column + 12'h001);
      end else begin
        four2three_fsm_Cnt_Column <= 12'h0;
      end
      if(when_four2three_l52) begin
        four2three_fsm_Cnt_Ram <= (four2three_fsm_Cnt_Ram + 2'b01);
      end else begin
        if(when_four2three_l54) begin
          four2three_fsm_Cnt_Ram <= (four2three_fsm_Cnt_Ram - 2'b01);
        end else begin
          four2three_fsm_Cnt_Ram <= four2three_fsm_Cnt_Ram;
        end
      end
      if(when_four2three_l58) begin
        four2three_fsm_Cnt_ROW <= (four2three_fsm_Cnt_ROW + 12'h001);
      end else begin
        if(when_four2three_l60) begin
          four2three_fsm_Cnt_ROW <= 12'h0;
        end else begin
          four2three_fsm_Cnt_ROW <= four2three_fsm_Cnt_ROW;
        end
      end
      if(when_four2three_l70) begin
        four2three_fsm_En_Ram <= (four2three_fsm_En_Ram + 2'b01);
      end else begin
        four2three_fsm_En_Ram <= four2three_fsm_En_Ram;
      end
      if(when_four2three_l272) begin
        four2three_fsm_addrRam1 <= (four2three_fsm_addrRam1 + 12'h001);
      end else begin
        four2three_fsm_addrRam1 <= 12'h0;
      end
      if(when_four2three_l272_1) begin
        four2three_fsm_addrRam2 <= (four2three_fsm_addrRam2 + 12'h001);
      end else begin
        four2three_fsm_addrRam2 <= 12'h0;
      end
      if(when_four2three_l272_2) begin
        four2three_fsm_addrRam3 <= (four2three_fsm_addrRam3 + 12'h001);
      end else begin
        four2three_fsm_addrRam3 <= 12'h0;
      end
      if(when_four2three_l272_3) begin
        four2three_fsm_addrRam4 <= (four2three_fsm_addrRam4 + 12'h001);
      end else begin
        four2three_fsm_addrRam4 <= 12'h0;
      end
      if(when_four2three_l158) begin
        StartRow <= 1'b1;
      end else begin
        StartRow <= 1'b0;
      end
      if(when_four2three_l165) begin
        four2three_fsm_rd_ram_cnt <= 3'b001;
      end else begin
        if(when_four2three_l167) begin
          four2three_fsm_rd_ram_cnt <= (four2three_fsm_rd_ram_cnt + 3'b001);
        end else begin
          four2three_fsm_rd_ram_cnt <= four2three_fsm_rd_ram_cnt;
        end
      end
      case(four2three_fsm_rd_ram_cnt)
        3'b001 : begin
          M_DATA <= {{ram1_doutb,ram2_doutb},ram3_doutb};
        end
        3'b010 : begin
          M_DATA <= {{ram2_doutb,ram3_doutb},ram4_doutb};
        end
        3'b011 : begin
          M_DATA <= {{ram3_doutb,ram4_doutb},ram1_doutb};
        end
        3'b100 : begin
          M_DATA <= {{ram4_doutb,ram1_doutb},ram2_doutb};
        end
        default : begin
          M_DATA <= 24'h0;
        end
      endcase
      if(M_rd_en) begin
        M_Valid <= 1'b1;
        case(four2three_fsm_rd_ram_cnt)
          3'b001 : begin
            M_DATA <= {{ram1_doutb,ram2_doutb},ram3_doutb};
          end
          3'b010 : begin
            M_DATA <= {{ram2_doutb,ram3_doutb},ram4_doutb};
          end
          3'b011 : begin
            M_DATA <= {{ram3_doutb,ram4_doutb},ram1_doutb};
          end
          3'b100 : begin
            M_DATA <= {{ram4_doutb,ram1_doutb},ram2_doutb};
          end
          default : begin
            M_DATA <= 24'h0;
          end
        endcase
      end else begin
        M_Valid <= 1'b0;
        M_DATA <= 24'h0;
      end
      four2three_fsm_stateReg <= four2three_fsm_stateNext;
    end
  end


endmodule
