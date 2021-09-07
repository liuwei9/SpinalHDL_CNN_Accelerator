// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : data_generate
// Git hash  : b7a0dd4916880e11bf2cf9b5f8cb8e9d704fcde5


`define padding_fsm_enumDefinition_binary_sequential_type [3:0]
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT 4'b0000
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE 4'b0001
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT 4'b0010
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait 4'b0011
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait 4'b0100
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read 4'b0101
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row 4'b0110
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding 4'b0111
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding 4'b1000
`define padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding 4'b1001

`define f2t_fsm_enumDefinition_binary_sequential_type [2:0]
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT 3'b000
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE 3'b001
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT 3'b010
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo 3'b011
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read 3'b100
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute 3'b101
`define f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute 3'b110

`define t2n_fsm_enumDefinition_binary_sequential_type [2:0]
`define t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT 3'b000
`define t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE 3'b001
`define t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait 3'b010
`define t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO 3'b011
`define t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read 3'b100
`define t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow 3'b101


module data_generate (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output     [575:0]  M_DATA,
  output     [8:0]    M_DATA_Valid,
  input               M_DATA_Ready,
  input      [11:0]   Row_Num_In_REG,
  input               Padding_REG,
  input      [7:0]    Zero_Point_REG,
  input      [7:0]    Zero_Num_REG,
  input      [9:0]    Channel_In_Num_REG,
  input               EN_Cin_Select_REG,
  output     [11:0]   RowNum_After_Padding,
  input               reset,
  input               clk
);
  wire       [11:0]   f2t_Row_Num_After_Padding;
  wire       [11:0]   t2n_Row_Num_After_Padding;
  wire                cin_convert_1_S_DATA_ready;
  wire                cin_convert_1_M_DATA_valid;
  wire       [63:0]   cin_convert_1_M_DATA_payload;
  wire                padding_1_S_DATA_ready;
  wire                padding_1_M_DATA_valid;
  wire       [63:0]   padding_1_M_DATA_payload;
  wire       [11:0]   padding_1_RowNum_After_Padding;
  wire                f2t_StartRow;
  wire                f2t_S_DATA_ready;
  wire       [191:0]  f2t_M_DATA;
  wire                f2t_M_Valid;
  wire                t2n_S_DATA_Ready;
  wire       [11:0]   t2n_S_DATA_Addr;
  wire       [575:0]  t2n_M_Data;
  wire       [8:0]    t2n_M_Valid;
  wire                t2n_S_Ready;

  cin_convert cin_convert_1 (
    .S_DATA_valid         (S_DATA_valid                  ), //i
    .S_DATA_ready         (cin_convert_1_S_DATA_ready    ), //o
    .S_DATA_payload       (S_DATA_payload                ), //i
    .M_DATA_valid         (cin_convert_1_M_DATA_valid    ), //o
    .M_DATA_ready         (padding_1_S_DATA_ready        ), //i
    .M_DATA_payload       (cin_convert_1_M_DATA_payload  ), //o
    .EN_Cin_Select_REG    (EN_Cin_Select_REG             ), //i
    .clk                  (clk                           ), //i
    .reset                (reset                         )  //i
  );
  padding padding_1 (
    .Start                   (Start                           ), //i
    .S_DATA_valid            (cin_convert_1_M_DATA_valid      ), //i
    .S_DATA_ready            (padding_1_S_DATA_ready          ), //o
    .S_DATA_payload          (cin_convert_1_M_DATA_payload    ), //i
    .M_DATA_valid            (padding_1_M_DATA_valid          ), //o
    .M_DATA_ready            (f2t_S_DATA_ready                ), //i
    .M_DATA_payload          (padding_1_M_DATA_payload        ), //o
    .Row_Num_In_REG          (Row_Num_In_REG                  ), //i
    .Channel_In_Num_REG      (Channel_In_Num_REG              ), //i
    .Padding_REG             (Padding_REG                     ), //i
    .Zero_Point_REG          (Zero_Point_REG                  ), //i
    .Zero_Num_REG            (Zero_Num_REG                    ), //i
    .RowNum_After_Padding    (padding_1_RowNum_After_Padding  ), //o
    .reset                   (reset                           ), //i
    .clk                     (clk                             )  //i
  );
  four2three f2t (
    .Start                    (Start                      ), //i
    .StartRow                 (f2t_StartRow               ), //o
    .Row_Num_After_Padding    (f2t_Row_Num_After_Padding  ), //i
    .S_DATA_valid             (padding_1_M_DATA_valid     ), //i
    .S_DATA_ready             (f2t_S_DATA_ready           ), //o
    .S_DATA_payload           (padding_1_M_DATA_payload   ), //i
    .M_DATA                   (f2t_M_DATA                 ), //o
    .M_Ready                  (t2n_S_Ready                ), //i
    .M_Valid                  (f2t_M_Valid                ), //o
    .M_rd_en                  (t2n_S_DATA_Ready           ), //i
    .M_Addr                   (t2n_S_DATA_Addr            ), //i
    .Channel_In_Num_REG       (Channel_In_Num_REG         ), //i
    .reset                    (reset                      ), //i
    .clk                      (clk                        )  //i
  );
  three2nine t2n (
    .Start                    (Start                      ), //i
    .S_DATA                   (f2t_M_DATA                 ), //i
    .S_DATA_Valid             (f2t_M_Valid                ), //i
    .S_DATA_Ready             (t2n_S_DATA_Ready           ), //o
    .S_DATA_Addr              (t2n_S_DATA_Addr            ), //o
    .Row_Num_After_Padding    (t2n_Row_Num_After_Padding  ), //i
    .Channel_In_Num_REG       (Channel_In_Num_REG         ), //i
    .Row_Compute_Sign         (f2t_StartRow               ), //i
    .M_Data                   (t2n_M_Data                 ), //o
    .M_Ready                  (M_DATA_Ready               ), //i
    .M_Valid                  (t2n_M_Valid                ), //o
    .S_Ready                  (t2n_S_Ready                ), //o
    .clk                      (clk                        ), //i
    .reset                    (reset                      )  //i
  );
  assign S_DATA_ready = cin_convert_1_S_DATA_ready;
  assign RowNum_After_Padding = padding_1_RowNum_After_Padding;
  assign f2t_Row_Num_After_Padding = padding_1_RowNum_After_Padding;
  assign M_DATA_Valid = t2n_M_Valid;
  assign M_DATA = t2n_M_Data;
  assign t2n_Row_Num_After_Padding = padding_1_RowNum_After_Padding;

endmodule

module three2nine (
  input               Start,
  input      [191:0]  S_DATA,
  input               S_DATA_Valid,
  output reg          S_DATA_Ready,
  output reg [11:0]   S_DATA_Addr,
  input      [11:0]   Row_Num_After_Padding,
  input      [9:0]    Channel_In_Num_REG,
  input               Row_Compute_Sign,
  output reg [575:0]  M_Data,
  input               M_Ready,
  output reg [8:0]    M_Valid,
  output reg          S_Ready,
  input               clk,
  input               reset
);
  wire       [9:0]    _zz_when_three2nine_l39;
  wire       [6:0]    _zz_when_three2nine_l39_1;
  wire       [11:0]   _zz_when_three2nine_l56;
  wire       [11:0]   _zz_when_three2nine_l71;
  wire       [11:0]   _zz_when_three2nine_l105;
  wire       [11:0]   _zz_when_three2nine_l114;
  wire       [6:0]    Channel_Times;
  wire                t2n_fsm_wantExit;
  reg                 t2n_fsm_wantStart;
  wire                t2n_fsm_wantKill;
  reg        [9:0]    t2n_fsm_Cnt_Cin;
  reg                 t2n_fsm_EN_Last_Cin;
  wire                when_three2nine_l39;
  wire                when_three2nine_l44;
  reg        [11:0]   t2n_fsm_Cnt_Column;
  reg                 t2n_fsm_EN_ComputeRow_Read;
  wire                when_three2nine_l56;
  wire                when_three2nine_l59;
  reg        [11:0]   t2n_fsm_Cnt_Row;
  reg                 t2n_fsm_EN_Judge_LastRow;
  wire                when_three2nine_l71;
  wire                when_three2nine_l77;
  wire                when_three2nine_l79;
  wire                when_three2nine_l85;
  wire                when_three2nine_l95;
  wire                when_three2nine_l103;
  wire                when_three2nine_l105;
  wire                when_three2nine_l114;
  wire                when_three2nine_l123;
  reg        `t2n_fsm_enumDefinition_binary_sequential_type t2n_fsm_stateReg;
  reg        `t2n_fsm_enumDefinition_binary_sequential_type t2n_fsm_stateNext;
  wire                when_three2nine_l156;
  `ifndef SYNTHESIS
  reg [183:0] t2n_fsm_stateReg_string;
  reg [183:0] t2n_fsm_stateNext_string;
  `endif


  assign _zz_when_three2nine_l39_1 = (Channel_Times - 7'h01);
  assign _zz_when_three2nine_l39 = {3'd0, _zz_when_three2nine_l39_1};
  assign _zz_when_three2nine_l56 = (Row_Num_After_Padding - 12'h001);
  assign _zz_when_three2nine_l71 = (Row_Num_After_Padding - 12'h002);
  assign _zz_when_three2nine_l105 = (Row_Num_After_Padding - 12'h002);
  assign _zz_when_three2nine_l114 = (Row_Num_After_Padding - 12'h001);
  `ifndef SYNTHESIS
  always @(*) begin
    case(t2n_fsm_stateReg)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT : t2n_fsm_stateReg_string = "t2n_fsm_BOOT           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : t2n_fsm_stateReg_string = "t2n_fsm_IDLE           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : t2n_fsm_stateReg_string = "t2n_fsm_Start_Wait     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : t2n_fsm_stateReg_string = "t2n_fsm_Judge_FIFO     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : t2n_fsm_stateReg_string = "t2n_fsm_ComputeRow_Read";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : t2n_fsm_stateReg_string = "t2n_fsm_Judge_LastRow  ";
      default : t2n_fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(t2n_fsm_stateNext)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT : t2n_fsm_stateNext_string = "t2n_fsm_BOOT           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : t2n_fsm_stateNext_string = "t2n_fsm_IDLE           ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : t2n_fsm_stateNext_string = "t2n_fsm_Start_Wait     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : t2n_fsm_stateNext_string = "t2n_fsm_Judge_FIFO     ";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : t2n_fsm_stateNext_string = "t2n_fsm_ComputeRow_Read";
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : t2n_fsm_stateNext_string = "t2n_fsm_Judge_LastRow  ";
      default : t2n_fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_In_Num_REG >>> 3);
  assign t2n_fsm_wantExit = 1'b0;
  always @(*) begin
    t2n_fsm_wantStart = 1'b0;
    case(t2n_fsm_stateReg)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : begin
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : begin
      end
      default : begin
        t2n_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign t2n_fsm_wantKill = 1'b0;
  assign when_three2nine_l39 = (t2n_fsm_Cnt_Cin == _zz_when_three2nine_l39);
  always @(*) begin
    if(when_three2nine_l39) begin
      t2n_fsm_EN_Last_Cin = 1'b1;
    end else begin
      t2n_fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_three2nine_l56 = (t2n_fsm_Cnt_Column == _zz_when_three2nine_l56);
  always @(*) begin
    if(when_three2nine_l56) begin
      t2n_fsm_EN_ComputeRow_Read = 1'b1;
    end else begin
      t2n_fsm_EN_ComputeRow_Read = 1'b0;
    end
  end

  assign when_three2nine_l71 = (t2n_fsm_Cnt_Row == _zz_when_three2nine_l71);
  always @(*) begin
    if(when_three2nine_l71) begin
      t2n_fsm_EN_Judge_LastRow = 1'b1;
    end else begin
      t2n_fsm_EN_Judge_LastRow = 1'b0;
    end
  end

  always @(*) begin
    if(when_three2nine_l85) begin
      S_DATA_Ready = 1'b1;
    end else begin
      S_DATA_Ready = 1'b0;
    end
  end

  always @(*) begin
    if(when_three2nine_l95) begin
      S_Ready = 1'b1;
    end else begin
      S_Ready = 1'b0;
    end
  end

  always @(*) begin
    M_Data[191 : 0] = {{S_DATA[63 : 0],S_DATA[63 : 0]},S_DATA[63 : 0]};
    M_Data[383 : 192] = {{S_DATA[127 : 64],S_DATA[127 : 64]},S_DATA[127 : 64]};
    M_Data[575 : 384] = {{S_DATA[191 : 128],S_DATA[191 : 128]},S_DATA[191 : 128]};
  end

  assign when_three2nine_l105 = (t2n_fsm_Cnt_Column < _zz_when_three2nine_l105);
  assign when_three2nine_l114 = ((12'h0 < t2n_fsm_Cnt_Column) && (t2n_fsm_Cnt_Column < _zz_when_three2nine_l114));
  assign when_three2nine_l123 = ((12'h001 < t2n_fsm_Cnt_Column) && (t2n_fsm_Cnt_Column < Row_Num_After_Padding));
  always @(*) begin
    t2n_fsm_stateNext = t2n_fsm_stateReg;
    case(t2n_fsm_stateReg)
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE : begin
        if(Start) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait : begin
        if(Row_Compute_Sign) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO : begin
        if(M_Ready) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_FIFO;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read : begin
        if(when_three2nine_l156) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read;
        end
      end
      `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow : begin
        if(t2n_fsm_EN_Judge_LastRow) begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE;
        end else begin
          t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait;
        end
      end
      default : begin
      end
    endcase
    if(t2n_fsm_wantStart) begin
      t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE;
    end
    if(t2n_fsm_wantKill) begin
      t2n_fsm_stateNext = `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT;
    end
  end

  assign when_three2nine_l156 = (t2n_fsm_EN_ComputeRow_Read && t2n_fsm_EN_Last_Cin);
  assign when_three2nine_l44 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  assign when_three2nine_l59 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  assign when_three2nine_l77 = ((t2n_fsm_stateNext == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow) && (t2n_fsm_stateReg != `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Judge_LastRow));
  assign when_three2nine_l79 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_IDLE);
  assign when_three2nine_l85 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  assign when_three2nine_l95 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_Start_Wait);
  assign when_three2nine_l103 = (t2n_fsm_stateReg == `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_ComputeRow_Read);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      S_DATA_Addr <= 12'h0;
      M_Valid <= 9'h0;
      t2n_fsm_stateReg <= `t2n_fsm_enumDefinition_binary_sequential_t2n_fsm_BOOT;
    end else begin
      if(S_DATA_Ready) begin
        S_DATA_Addr <= (S_DATA_Addr + 12'h001);
      end else begin
        S_DATA_Addr <= 12'h0;
      end
      if(when_three2nine_l103) begin
        if(when_three2nine_l105) begin
          M_Valid[0] <= 1'b1;
          M_Valid[3] <= 1'b1;
          M_Valid[6] <= 1'b1;
        end else begin
          M_Valid[0] <= 1'b0;
          M_Valid[3] <= 1'b0;
          M_Valid[6] <= 1'b0;
        end
        if(when_three2nine_l114) begin
          M_Valid[1] <= 1'b1;
          M_Valid[4] <= 1'b1;
          M_Valid[7] <= 1'b1;
        end else begin
          M_Valid[1] <= 1'b0;
          M_Valid[4] <= 1'b0;
          M_Valid[7] <= 1'b0;
        end
        if(when_three2nine_l123) begin
          M_Valid[2] <= 1'b1;
          M_Valid[5] <= 1'b1;
          M_Valid[8] <= 1'b1;
        end else begin
          M_Valid[2] <= 1'b0;
          M_Valid[5] <= 1'b0;
          M_Valid[8] <= 1'b0;
        end
      end else begin
        M_Valid <= 9'h0;
      end
      t2n_fsm_stateReg <= t2n_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    if(when_three2nine_l44) begin
      if(t2n_fsm_EN_Last_Cin) begin
        t2n_fsm_Cnt_Cin <= 10'h0;
      end else begin
        t2n_fsm_Cnt_Cin <= (t2n_fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      t2n_fsm_Cnt_Cin <= 10'h0;
    end
    if(when_three2nine_l59) begin
      if(t2n_fsm_EN_Last_Cin) begin
        t2n_fsm_Cnt_Column <= (t2n_fsm_Cnt_Column + 12'h001);
      end else begin
        t2n_fsm_Cnt_Column <= t2n_fsm_Cnt_Column;
      end
    end else begin
      t2n_fsm_Cnt_Column <= 12'h0;
    end
    if(when_three2nine_l77) begin
      t2n_fsm_Cnt_Row <= (t2n_fsm_Cnt_Row + 12'h001);
    end else begin
      if(when_three2nine_l79) begin
        t2n_fsm_Cnt_Row <= 12'h0;
      end else begin
        t2n_fsm_Cnt_Row <= t2n_fsm_Cnt_Row;
      end
    end
  end


endmodule

module four2three (
  input               Start,
  output reg          StartRow,
  input      [11:0]   Row_Num_After_Padding,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output reg [191:0]  M_DATA,
  input               M_Ready,
  output reg          M_Valid,
  input               M_rd_en,
  input      [11:0]   M_Addr,
  input      [9:0]    Channel_In_Num_REG,
  input               reset,
  input               clk
);
  wire       [11:0]   count_mult_A;
  wire       [6:0]    count_mult_B;
  reg                 fifo_rd_en;
  wire       [11:0]   fifo_m_data_count;
  wire       [11:0]   fifo_s_data_count;
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
  wire       [11:0]   count_mult_P;
  wire                fifo_data_in_ready;
  wire       [63:0]   fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [63:0]   ram1_doutb;
  wire       [63:0]   ram2_doutb;
  wire       [63:0]   ram3_doutb;
  wire       [63:0]   ram4_doutb;
  wire       [11:0]   _zz_addrb;
  wire       [11:0]   _zz_addrb_1;
  wire       [11:0]   _zz_addrb_2;
  wire       [11:0]   _zz_addrb_3;
  wire       [9:0]    _zz_when_four2three_l72;
  wire       [6:0]    _zz_when_four2three_l72_1;
  wire       [11:0]   _zz_when_four2three_l89;
  wire       [11:0]   _zz_when_four2three_l110;
  wire       [11:0]   _zz_addra;
  wire       [11:0]   _zz_addra_1;
  wire       [11:0]   _zz_addra_2;
  wire       [11:0]   _zz_addra_3;
  wire       [11:0]   _zz_when_four2three_l204;
  wire       [18:0]   _zz_when_four2three_l304;
  wire       [18:0]   _zz_when_four2three_l304_1;
  wire       [18:0]   _zz_when_four2three_l304_2;
  wire       [6:0]    Channel_Times;
  wire                f2t_fsm_wantExit;
  reg                 f2t_fsm_wantStart;
  wire                f2t_fsm_wantKill;
  reg        [5:0]    f2t_fsm_wait_cnt;
  wire                when_four2three_l58;
  reg                 f2t_fsm_init_en;
  wire                when_four2three_l64;
  reg        [9:0]    f2t_fsm_Cnt_Cin;
  reg                 f2t_fsm_EN_Last_Cin;
  wire                when_four2three_l72;
  wire                when_four2three_l77;
  reg        [11:0]   f2t_fsm_Cnt_Column;
  reg                 f2t_fsm_EN_Read_State;
  wire                when_four2three_l89;
  wire                when_four2three_l94;
  reg        [11:0]   f2t_fsm_Cnt_ROW;
  wire                when_four2three_l104;
  wire                when_four2three_l106;
  reg                 f2t_fsm_Last_Row;
  wire                when_four2three_l110;
  reg        [1:0]    f2t_fsm_Cnt_Ram;
  wire                when_four2three_l115;
  wire                when_four2three_l117;
  reg        [1:0]    f2t_fsm_En_Ram;
  wire                when_four2three_l122;
  reg        [11:0]   f2t_fsm_addrRam1;
  reg        [11:0]   f2t_fsm_addrRam2;
  reg        [11:0]   f2t_fsm_addrRam3;
  reg        [11:0]   f2t_fsm_addrRam4;
  wire                when_four2three_l314;
  wire                when_four2three_l314_1;
  wire                when_four2three_l314_2;
  wire                when_four2three_l314_3;
  wire                when_four2three_l163;
  wire                when_four2three_l198;
  reg        [2:0]    f2t_fsm_rd_ram_cnt;
  wire                when_four2three_l204;
  wire                when_four2three_l206;
  reg        `f2t_fsm_enumDefinition_binary_sequential_type f2t_fsm_stateReg;
  reg        `f2t_fsm_enumDefinition_binary_sequential_type f2t_fsm_stateNext;
  wire                when_four2three_l288;
  wire                when_four2three_l294;
  wire                when_four2three_l304;
  `ifndef SYNTHESIS
  reg [167:0] f2t_fsm_stateReg_string;
  reg [167:0] f2t_fsm_stateNext_string;
  `endif


  assign _zz_addrb = M_Addr;
  assign _zz_addrb_1 = M_Addr;
  assign _zz_addrb_2 = M_Addr;
  assign _zz_addrb_3 = M_Addr;
  assign _zz_when_four2three_l72_1 = (Channel_Times - 7'h01);
  assign _zz_when_four2three_l72 = {3'd0, _zz_when_four2three_l72_1};
  assign _zz_when_four2three_l89 = (Row_Num_After_Padding - 12'h001);
  assign _zz_when_four2three_l110 = (Row_Num_After_Padding - 12'h002);
  assign _zz_addra = f2t_fsm_addrRam1;
  assign _zz_addra_1 = f2t_fsm_addrRam2;
  assign _zz_addra_2 = f2t_fsm_addrRam3;
  assign _zz_addra_3 = f2t_fsm_addrRam4;
  assign _zz_when_four2three_l204 = (Row_Num_After_Padding - 12'h001);
  assign _zz_when_four2three_l304 = {7'd0, M_Addr};
  assign _zz_when_four2three_l304_1 = (_zz_when_four2three_l304_2 - 19'h00001);
  assign _zz_when_four2three_l304_2 = (Row_Num_After_Padding * Channel_Times);
  mul count_mult (
    .A        (count_mult_A  ), //i
    .B        (count_mult_B  ), //i
    .P        (count_mult_P  ), //o
    .clk      (clk           ), //i
    .reset    (reset         )  //i
  );
  general_fifo_sync fifo (
    .reset             (reset                ), //i
    .clk               (clk                  ), //i
    .data_in           (S_DATA_payload       ), //i
    .wr_en             (S_DATA_valid         ), //i
    .data_in_ready     (fifo_data_in_ready   ), //o
    .data_out          (fifo_data_out        ), //o
    .rd_en             (fifo_rd_en           ), //i
    .data_out_valid    (fifo_data_out_valid  ), //o
    .m_data_count      (fifo_m_data_count    ), //i
    .s_data_count      (fifo_s_data_count    ), //i
    .data_valid        (fifo_data_valid      ), //o
    .full              (fifo_full            ), //o
    .empty             (fifo_empty           )  //o
  );
  sdpram ram1 (
    .doutb    (ram1_doutb     ), //o
    .addra    (ram1_addra     ), //i
    .addrb    (ram1_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram1_ena       ), //i
    .enb      (ram1_enb       ), //i
    .wea      (ram1_wea       ), //i
    .clk      (clk            )  //i
  );
  sdpram ram2 (
    .doutb    (ram2_doutb     ), //o
    .addra    (ram2_addra     ), //i
    .addrb    (ram2_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram2_ena       ), //i
    .enb      (ram2_enb       ), //i
    .wea      (ram2_wea       ), //i
    .clk      (clk            )  //i
  );
  sdpram ram3 (
    .doutb    (ram3_doutb     ), //o
    .addra    (ram3_addra     ), //i
    .addrb    (ram3_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram3_ena       ), //i
    .enb      (ram3_enb       ), //i
    .wea      (ram3_wea       ), //i
    .clk      (clk            )  //i
  );
  sdpram ram4 (
    .doutb    (ram4_doutb     ), //o
    .addra    (ram4_addra     ), //i
    .addrb    (ram4_addrb     ), //i
    .dina     (fifo_data_out  ), //i
    .ena      (ram4_ena       ), //i
    .enb      (ram4_enb       ), //i
    .wea      (ram4_wea       ), //i
    .clk      (clk            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(f2t_fsm_stateReg)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT : f2t_fsm_stateReg_string = "f2t_fsm_BOOT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : f2t_fsm_stateReg_string = "f2t_fsm_IDLE         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : f2t_fsm_stateReg_string = "f2t_fsm_INIT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : f2t_fsm_stateReg_string = "f2t_fsm_Judge_Fifo   ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : f2t_fsm_stateReg_string = "f2t_fsm_Read         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : f2t_fsm_stateReg_string = "f2t_fsm_Judge_Compute";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : f2t_fsm_stateReg_string = "f2t_fsm_Start_Compute";
      default : f2t_fsm_stateReg_string = "?????????????????????";
    endcase
  end
  always @(*) begin
    case(f2t_fsm_stateNext)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT : f2t_fsm_stateNext_string = "f2t_fsm_BOOT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : f2t_fsm_stateNext_string = "f2t_fsm_IDLE         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : f2t_fsm_stateNext_string = "f2t_fsm_INIT         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : f2t_fsm_stateNext_string = "f2t_fsm_Judge_Fifo   ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : f2t_fsm_stateNext_string = "f2t_fsm_Read         ";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : f2t_fsm_stateNext_string = "f2t_fsm_Judge_Compute";
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : f2t_fsm_stateNext_string = "f2t_fsm_Start_Compute";
      default : f2t_fsm_stateNext_string = "?????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_In_Num_REG >>> 3);
  assign count_mult_A = Row_Num_After_Padding;
  assign count_mult_B = Channel_Times;
  assign S_DATA_ready = fifo_data_in_ready;
  assign fifo_m_data_count = count_mult_P;
  assign fifo_s_data_count = count_mult_P;
  assign ram1_addrb = _zz_addrb[9:0];
  assign ram2_addrb = _zz_addrb_1[9:0];
  assign ram3_addrb = _zz_addrb_2[9:0];
  assign ram4_addrb = _zz_addrb_3[9:0];
  assign f2t_fsm_wantExit = 1'b0;
  always @(*) begin
    f2t_fsm_wantStart = 1'b0;
    case(f2t_fsm_stateReg)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : begin
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : begin
      end
      default : begin
        f2t_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign f2t_fsm_wantKill = 1'b0;
  assign when_four2three_l64 = (f2t_fsm_wait_cnt == 6'h05);
  always @(*) begin
    if(when_four2three_l64) begin
      f2t_fsm_init_en = 1'b1;
    end else begin
      f2t_fsm_init_en = 1'b0;
    end
  end

  assign when_four2three_l72 = (f2t_fsm_Cnt_Cin == _zz_when_four2three_l72);
  always @(*) begin
    if(when_four2three_l72) begin
      f2t_fsm_EN_Last_Cin = 1'b1;
    end else begin
      f2t_fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_four2three_l89 = (f2t_fsm_Cnt_Column == _zz_when_four2three_l89);
  always @(*) begin
    if(when_four2three_l89) begin
      f2t_fsm_EN_Read_State = 1'b1;
    end else begin
      f2t_fsm_EN_Read_State = 1'b0;
    end
  end

  assign when_four2three_l110 = (f2t_fsm_Cnt_ROW == _zz_when_four2three_l110);
  always @(*) begin
    if(when_four2three_l110) begin
      f2t_fsm_Last_Row = 1'b1;
    end else begin
      f2t_fsm_Last_Row = 1'b0;
    end
  end

  always @(*) begin
    case(f2t_fsm_En_Ram)
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
    case(f2t_fsm_En_Ram)
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
    case(f2t_fsm_En_Ram)
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
    case(f2t_fsm_En_Ram)
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
    if(when_four2three_l163) begin
      fifo_rd_en = 1'b1;
    end else begin
      fifo_rd_en = 1'b0;
    end
  end

  always @(*) begin
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
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
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
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
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
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
    if(when_four2three_l163) begin
      case(f2t_fsm_En_Ram)
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

  assign when_four2three_l204 = ((f2t_fsm_rd_ram_cnt == 3'b100) && (M_Addr == _zz_when_four2three_l204));
  always @(*) begin
    case(f2t_fsm_rd_ram_cnt)
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
    case(f2t_fsm_rd_ram_cnt)
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
    case(f2t_fsm_rd_ram_cnt)
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
    case(f2t_fsm_rd_ram_cnt)
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
    f2t_fsm_stateNext = f2t_fsm_stateReg;
    case(f2t_fsm_stateReg)
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE : begin
        if(Start) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT : begin
        if(f2t_fsm_init_en) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo : begin
        if(fifo_data_out_valid) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read : begin
        if(when_four2three_l288) begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute;
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute : begin
        if(when_four2three_l294) begin
          if(M_Ready) begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute;
          end else begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute;
          end
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end
      end
      `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute : begin
        if(f2t_fsm_Last_Row) begin
          if(when_four2three_l304) begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE;
          end else begin
            f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute;
          end
        end else begin
          f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Fifo;
        end
      end
      default : begin
      end
    endcase
    if(f2t_fsm_wantStart) begin
      f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE;
    end
    if(f2t_fsm_wantKill) begin
      f2t_fsm_stateNext = `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT;
    end
  end

  assign when_four2three_l288 = (f2t_fsm_EN_Read_State && f2t_fsm_EN_Last_Cin);
  assign when_four2three_l294 = (f2t_fsm_Cnt_Ram == 2'b11);
  assign when_four2three_l304 = (_zz_when_four2three_l304 == _zz_when_four2three_l304_1);
  assign when_four2three_l58 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_INIT);
  assign when_four2three_l77 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l94 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l104 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  assign when_four2three_l106 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_IDLE);
  assign when_four2three_l115 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute));
  assign when_four2three_l117 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  assign when_four2three_l122 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Judge_Compute));
  assign when_four2three_l314 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l314_1 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l314_2 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l314_3 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l163 = (f2t_fsm_stateReg == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Read);
  assign when_four2three_l198 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  assign when_four2three_l206 = ((f2t_fsm_stateNext == `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute) && (f2t_fsm_stateReg != `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_Start_Compute));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      StartRow <= 1'b0;
      M_DATA <= 192'h0;
      M_Valid <= 1'b0;
      f2t_fsm_Cnt_ROW <= 12'h0;
      f2t_fsm_Cnt_Ram <= 2'b00;
      f2t_fsm_En_Ram <= 2'b00;
      f2t_fsm_addrRam1 <= 12'h0;
      f2t_fsm_addrRam2 <= 12'h0;
      f2t_fsm_addrRam3 <= 12'h0;
      f2t_fsm_addrRam4 <= 12'h0;
      f2t_fsm_rd_ram_cnt <= 3'b000;
      f2t_fsm_stateReg <= `f2t_fsm_enumDefinition_binary_sequential_f2t_fsm_BOOT;
    end else begin
      if(when_four2three_l104) begin
        f2t_fsm_Cnt_ROW <= (f2t_fsm_Cnt_ROW + 12'h001);
      end else begin
        if(when_four2three_l106) begin
          f2t_fsm_Cnt_ROW <= 12'h0;
        end else begin
          f2t_fsm_Cnt_ROW <= f2t_fsm_Cnt_ROW;
        end
      end
      if(when_four2three_l115) begin
        f2t_fsm_Cnt_Ram <= (f2t_fsm_Cnt_Ram + 2'b01);
      end else begin
        if(when_four2three_l117) begin
          f2t_fsm_Cnt_Ram <= (f2t_fsm_Cnt_Ram - 2'b01);
        end else begin
          f2t_fsm_Cnt_Ram <= f2t_fsm_Cnt_Ram;
        end
      end
      if(when_four2three_l122) begin
        f2t_fsm_En_Ram <= (f2t_fsm_En_Ram + 2'b01);
      end else begin
        f2t_fsm_En_Ram <= f2t_fsm_En_Ram;
      end
      if(when_four2three_l314) begin
        f2t_fsm_addrRam1 <= (f2t_fsm_addrRam1 + 12'h001);
      end else begin
        f2t_fsm_addrRam1 <= 12'h0;
      end
      if(when_four2three_l314_1) begin
        f2t_fsm_addrRam2 <= (f2t_fsm_addrRam2 + 12'h001);
      end else begin
        f2t_fsm_addrRam2 <= 12'h0;
      end
      if(when_four2three_l314_2) begin
        f2t_fsm_addrRam3 <= (f2t_fsm_addrRam3 + 12'h001);
      end else begin
        f2t_fsm_addrRam3 <= 12'h0;
      end
      if(when_four2three_l314_3) begin
        f2t_fsm_addrRam4 <= (f2t_fsm_addrRam4 + 12'h001);
      end else begin
        f2t_fsm_addrRam4 <= 12'h0;
      end
      if(when_four2three_l198) begin
        StartRow <= 1'b1;
      end else begin
        StartRow <= 1'b0;
      end
      if(when_four2three_l204) begin
        f2t_fsm_rd_ram_cnt <= 3'b000;
      end else begin
        if(when_four2three_l206) begin
          f2t_fsm_rd_ram_cnt <= (f2t_fsm_rd_ram_cnt + 3'b001);
        end else begin
          f2t_fsm_rd_ram_cnt <= f2t_fsm_rd_ram_cnt;
        end
      end
      if(M_rd_en) begin
        M_Valid <= 1'b1;
        case(f2t_fsm_rd_ram_cnt)
          3'b001 : begin
            M_DATA <= {{ram3_doutb,ram2_doutb},ram1_doutb};
          end
          3'b010 : begin
            M_DATA <= {{ram4_doutb,ram3_doutb},ram2_doutb};
          end
          3'b011 : begin
            M_DATA <= {{ram1_doutb,ram4_doutb},ram3_doutb};
          end
          3'b100 : begin
            M_DATA <= {{ram2_doutb,ram1_doutb},ram4_doutb};
          end
          default : begin
            M_DATA <= 192'h0;
          end
        endcase
      end else begin
        M_Valid <= 1'b0;
        M_DATA <= 192'h0;
      end
      f2t_fsm_stateReg <= f2t_fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    if(when_four2three_l58) begin
      f2t_fsm_wait_cnt <= (f2t_fsm_wait_cnt + 6'h01);
    end else begin
      f2t_fsm_wait_cnt <= 6'h0;
    end
    if(when_four2three_l77) begin
      if(f2t_fsm_EN_Last_Cin) begin
        f2t_fsm_Cnt_Cin <= 10'h0;
      end else begin
        f2t_fsm_Cnt_Cin <= (f2t_fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      f2t_fsm_Cnt_Cin <= 10'h0;
    end
    if(when_four2three_l94) begin
      if(f2t_fsm_EN_Last_Cin) begin
        f2t_fsm_Cnt_Column <= (f2t_fsm_Cnt_Column + 12'h001);
      end else begin
        f2t_fsm_Cnt_Column <= f2t_fsm_Cnt_Column;
      end
    end else begin
      f2t_fsm_Cnt_Column <= 12'h0;
    end
  end


endmodule

module padding (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output reg          M_DATA_valid,
  input               M_DATA_ready,
  output reg [63:0]   M_DATA_payload,
  input      [11:0]   Row_Num_In_REG,
  input      [9:0]    Channel_In_Num_REG,
  input               Padding_REG,
  input      [7:0]    Zero_Point_REG,
  input      [7:0]    Zero_Num_REG,
  output     [11:0]   RowNum_After_Padding,
  input               reset,
  input               clk
);
  wire       [6:0]    count_mult_B;
  reg                 fifo_rd_en;
  wire       [11:0]   fifo_m_data_count;
  wire       [11:0]   count_mult_P;
  wire                fifo_data_in_ready;
  wire       [63:0]   fifo_data_out;
  wire                fifo_data_out_valid;
  wire                fifo_data_valid;
  wire                fifo_full;
  wire                fifo_empty;
  wire       [11:0]   _zz_Out_Size;
  wire       [9:0]    _zz_Out_Size_1;
  wire       [11:0]   _zz_when_padding_l103;
  wire       [7:0]    _zz_when_padding_l103_1;
  wire       [11:0]   _zz_when_padding_l103_2;
  wire       [11:0]   _zz_when_padding_l103_3;
  wire       [11:0]   _zz_when_padding_l103_4;
  wire       [7:0]    _zz_when_padding_l103_5;
  wire       [9:0]    _zz_when_padding_l111;
  wire       [6:0]    _zz_when_padding_l111_1;
  wire       [11:0]   _zz_when_padding_l129;
  wire       [11:0]   _zz_when_padding_l145;
  wire       [6:0]    Channel_Times;
  reg        [63:0]   Zero_Point;
  reg                 EN_Row0;
  reg                 EN_Row1;
  reg                 EN_Col0;
  reg                 EN_Col1;
  reg        [11:0]   Row_Num_In_REG_regNext;
  wire       [11:0]   In_Size;
  reg        [11:0]   Out_Size;
  wire                padding_fsm_wantExit;
  reg                 padding_fsm_wantStart;
  wire                padding_fsm_wantKill;
  reg        [5:0]    padding_fsm_wait_cnt;
  wire                when_padding_l82;
  reg                 padding_fsm_init_en;
  wire                when_padding_l88;
  reg        [11:0]   padding_fsm_Cnt_Row;
  wire                when_padding_l95;
  wire                when_padding_l97;
  reg                 padding_fsm_EN_Left_Padding;
  wire                when_padding_l103;
  reg        [9:0]    padding_fsm_Cnt_Cin;
  reg                 padding_fsm_EN_Last_Cin;
  wire                when_padding_l111;
  wire                when_padding_l116;
  reg        [11:0]   padding_fsm_Cnt_Column;
  reg                 padding_fsm_EN_Row_Read;
  wire                when_padding_l129;
  wire                when_padding_l134;
  reg                 padding_fsm_EN_Judge_Row;
  wire                when_padding_l145;
  wire                when_padding_l151;
  wire                when_padding_l157;
  wire                when_padding_l163;
  wire                when_padding_l165;
  reg        `padding_fsm_enumDefinition_binary_sequential_type padding_fsm_stateReg;
  reg        `padding_fsm_enumDefinition_binary_sequential_type padding_fsm_stateNext;
  wire                when_padding_l206;
  wire                when_padding_l236;
  `ifndef SYNTHESIS
  reg [231:0] padding_fsm_stateReg_string;
  reg [231:0] padding_fsm_stateNext_string;
  `endif


  assign _zz_Out_Size_1 = (2'b10 * Zero_Num_REG);
  assign _zz_Out_Size = {2'd0, _zz_Out_Size_1};
  assign _zz_when_padding_l103_1 = Zero_Num_REG;
  assign _zz_when_padding_l103 = {4'd0, _zz_when_padding_l103_1};
  assign _zz_when_padding_l103_2 = (_zz_when_padding_l103_3 - 12'h001);
  assign _zz_when_padding_l103_3 = (Out_Size - _zz_when_padding_l103_4);
  assign _zz_when_padding_l103_5 = Zero_Num_REG;
  assign _zz_when_padding_l103_4 = {4'd0, _zz_when_padding_l103_5};
  assign _zz_when_padding_l111_1 = (Channel_Times - 7'h01);
  assign _zz_when_padding_l111 = {3'd0, _zz_when_padding_l111_1};
  assign _zz_when_padding_l129 = (In_Size - 12'h001);
  assign _zz_when_padding_l145 = (Out_Size - 12'h001);
  mul count_mult (
    .A        (Row_Num_In_REG  ), //i
    .B        (count_mult_B    ), //i
    .P        (count_mult_P    ), //o
    .clk      (clk             ), //i
    .reset    (reset           )  //i
  );
  padding_fifo fifo (
    .reset             (reset                ), //i
    .clk               (clk                  ), //i
    .data_in           (S_DATA_payload       ), //i
    .wr_en             (S_DATA_valid         ), //i
    .data_in_ready     (fifo_data_in_ready   ), //o
    .data_out          (fifo_data_out        ), //o
    .rd_en             (fifo_rd_en           ), //i
    .data_out_valid    (fifo_data_out_valid  ), //o
    .m_data_count      (fifo_m_data_count    ), //i
    .data_valid        (fifo_data_valid      ), //o
    .full              (fifo_full            ), //o
    .empty             (fifo_empty           )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT : padding_fsm_stateReg_string = "padding_fsm_BOOT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : padding_fsm_stateReg_string = "padding_fsm_IDLE             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : padding_fsm_stateReg_string = "padding_fsm_INIT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : padding_fsm_stateReg_string = "padding_fsm_M_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : padding_fsm_stateReg_string = "padding_fsm_S_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : padding_fsm_stateReg_string = "padding_fsm_M_Row_Read       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : padding_fsm_stateReg_string = "padding_fsm_Judge_Row        ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : padding_fsm_stateReg_string = "padding_fsm_S_Left_Padding   ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : padding_fsm_stateReg_string = "padding_fsm_M_Up_Down_Padding";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : padding_fsm_stateReg_string = "padding_fsm_M_Right_Padding  ";
      default : padding_fsm_stateReg_string = "?????????????????????????????";
    endcase
  end
  always @(*) begin
    case(padding_fsm_stateNext)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT : padding_fsm_stateNext_string = "padding_fsm_BOOT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : padding_fsm_stateNext_string = "padding_fsm_IDLE             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : padding_fsm_stateNext_string = "padding_fsm_INIT             ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : padding_fsm_stateNext_string = "padding_fsm_M_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : padding_fsm_stateNext_string = "padding_fsm_S_Row_Wait       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : padding_fsm_stateNext_string = "padding_fsm_M_Row_Read       ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : padding_fsm_stateNext_string = "padding_fsm_Judge_Row        ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : padding_fsm_stateNext_string = "padding_fsm_S_Left_Padding   ";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : padding_fsm_stateNext_string = "padding_fsm_M_Up_Down_Padding";
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : padding_fsm_stateNext_string = "padding_fsm_M_Right_Padding  ";
      default : padding_fsm_stateNext_string = "?????????????????????????????";
    endcase
  end
  `endif

  assign Channel_Times = (Channel_In_Num_REG >>> 3);
  always @(*) begin
    Zero_Point[7 : 0] = Zero_Point_REG;
    Zero_Point[15 : 8] = Zero_Point_REG;
    Zero_Point[23 : 16] = Zero_Point_REG;
    Zero_Point[31 : 24] = Zero_Point_REG;
    Zero_Point[39 : 32] = Zero_Point_REG;
    Zero_Point[47 : 40] = Zero_Point_REG;
    Zero_Point[55 : 48] = Zero_Point_REG;
    Zero_Point[63 : 56] = Zero_Point_REG;
  end

  assign count_mult_B = Channel_Times;
  assign S_DATA_ready = fifo_data_in_ready;
  assign fifo_m_data_count = count_mult_P;
  always @(*) begin
    if(Padding_REG) begin
      EN_Row0 = 1'b1;
    end else begin
      EN_Row0 = 1'b0;
    end
  end

  always @(*) begin
    if(Padding_REG) begin
      EN_Row1 = 1'b1;
    end else begin
      EN_Row1 = 1'b0;
    end
  end

  always @(*) begin
    if(Padding_REG) begin
      EN_Col0 = 1'b1;
    end else begin
      EN_Col0 = 1'b0;
    end
  end

  always @(*) begin
    if(Padding_REG) begin
      EN_Col1 = 1'b1;
    end else begin
      EN_Col1 = 1'b0;
    end
  end

  assign In_Size = Row_Num_In_REG_regNext;
  always @(*) begin
    if(Padding_REG) begin
      Out_Size = (Row_Num_In_REG + _zz_Out_Size);
    end else begin
      Out_Size = Row_Num_In_REG;
    end
  end

  assign RowNum_After_Padding = Out_Size;
  assign padding_fsm_wantExit = 1'b0;
  always @(*) begin
    padding_fsm_wantStart = 1'b0;
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : begin
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : begin
      end
      default : begin
        padding_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign padding_fsm_wantKill = 1'b0;
  assign when_padding_l88 = (padding_fsm_wait_cnt == 6'h05);
  always @(*) begin
    if(when_padding_l88) begin
      padding_fsm_init_en = 1'b1;
    end else begin
      padding_fsm_init_en = 1'b0;
    end
  end

  assign when_padding_l103 = ((EN_Row0 && (padding_fsm_Cnt_Row < _zz_when_padding_l103)) || (EN_Row1 && (_zz_when_padding_l103_2 < padding_fsm_Cnt_Row)));
  always @(*) begin
    if(when_padding_l103) begin
      padding_fsm_EN_Left_Padding = 1'b1;
    end else begin
      padding_fsm_EN_Left_Padding = 1'b0;
    end
  end

  assign when_padding_l111 = (padding_fsm_Cnt_Cin == _zz_when_padding_l111);
  always @(*) begin
    if(when_padding_l111) begin
      padding_fsm_EN_Last_Cin = 1'b1;
    end else begin
      padding_fsm_EN_Last_Cin = 1'b0;
    end
  end

  assign when_padding_l116 = ((((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding));
  assign when_padding_l129 = ((padding_fsm_Cnt_Column == _zz_when_padding_l129) && padding_fsm_EN_Last_Cin);
  always @(*) begin
    if(when_padding_l129) begin
      padding_fsm_EN_Row_Read = 1'b1;
    end else begin
      padding_fsm_EN_Row_Read = 1'b0;
    end
  end

  assign when_padding_l134 = ((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding));
  assign when_padding_l145 = (padding_fsm_Cnt_Row == _zz_when_padding_l145);
  always @(*) begin
    if(when_padding_l145) begin
      padding_fsm_EN_Judge_Row = 1'b1;
    end else begin
      padding_fsm_EN_Judge_Row = 1'b0;
    end
  end

  always @(*) begin
    if(when_padding_l151) begin
      fifo_rd_en = 1'b1;
    end else begin
      fifo_rd_en = 1'b0;
    end
  end

  assign when_padding_l157 = ((((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read));
  always @(*) begin
    if(when_padding_l157) begin
      M_DATA_valid = 1'b1;
    end else begin
      M_DATA_valid = 1'b0;
    end
  end

  assign when_padding_l163 = (((padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding)) || (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding));
  always @(*) begin
    if(when_padding_l163) begin
      M_DATA_payload = Zero_Point;
    end else begin
      if(when_padding_l165) begin
        M_DATA_payload = fifo_data_out;
      end else begin
        M_DATA_payload = 64'h0;
      end
    end
  end

  always @(*) begin
    padding_fsm_stateNext = padding_fsm_stateReg;
    case(padding_fsm_stateReg)
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE : begin
        if(Start) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT : begin
        if(padding_fsm_init_en) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait : begin
        if(M_DATA_ready) begin
          if(EN_Row0) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait : begin
        if(fifo_data_out_valid) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read : begin
        if(padding_fsm_EN_Row_Read) begin
          if(when_padding_l206) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row : begin
        if(padding_fsm_EN_Judge_Row) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Wait;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding : begin
        if(padding_fsm_EN_Left_Padding) begin
          if(padding_fsm_EN_Last_Cin) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding;
          end
        end else begin
          if(padding_fsm_EN_Last_Cin) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Row_Wait;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_S_Left_Padding;
          end
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding : begin
        if(padding_fsm_EN_Row_Read) begin
          if(when_padding_l236) begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
          end else begin
            padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
          end
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Up_Down_Padding;
        end
      end
      `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding : begin
        if(padding_fsm_EN_Last_Cin) begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row;
        end else begin
          padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Right_Padding;
        end
      end
      default : begin
      end
    endcase
    if(padding_fsm_wantStart) begin
      padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE;
    end
    if(padding_fsm_wantKill) begin
      padding_fsm_stateNext = `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT;
    end
  end

  assign when_padding_l206 = (! EN_Col1);
  assign when_padding_l236 = (! EN_Col1);
  assign when_padding_l82 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_INIT);
  assign when_padding_l95 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_Judge_Row);
  assign when_padding_l97 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_IDLE);
  assign when_padding_l151 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read);
  assign when_padding_l165 = (padding_fsm_stateReg == `padding_fsm_enumDefinition_binary_sequential_padding_fsm_M_Row_Read);
  always @(posedge clk) begin
    Row_Num_In_REG_regNext <= Row_Num_In_REG;
    if(when_padding_l82) begin
      padding_fsm_wait_cnt <= (padding_fsm_wait_cnt + 6'h01);
    end else begin
      padding_fsm_wait_cnt <= 6'h0;
    end
    if(when_padding_l95) begin
      padding_fsm_Cnt_Row <= (padding_fsm_Cnt_Row + 12'h001);
    end else begin
      if(when_padding_l97) begin
        padding_fsm_Cnt_Row <= 12'h0;
      end else begin
        padding_fsm_Cnt_Row <= padding_fsm_Cnt_Row;
      end
    end
    if(when_padding_l116) begin
      if(padding_fsm_EN_Last_Cin) begin
        padding_fsm_Cnt_Cin <= 10'h0;
      end else begin
        padding_fsm_Cnt_Cin <= (padding_fsm_Cnt_Cin + 10'h001);
      end
    end else begin
      padding_fsm_Cnt_Cin <= 10'h0;
    end
    if(when_padding_l134) begin
      if(padding_fsm_EN_Last_Cin) begin
        padding_fsm_Cnt_Column <= (padding_fsm_Cnt_Column + 12'h001);
      end else begin
        padding_fsm_Cnt_Column <= padding_fsm_Cnt_Column;
      end
    end else begin
      padding_fsm_Cnt_Column <= 12'h0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      padding_fsm_stateReg <= `padding_fsm_enumDefinition_binary_sequential_padding_fsm_BOOT;
    end else begin
      padding_fsm_stateReg <= padding_fsm_stateNext;
    end
  end


endmodule

module cin_convert (
  input               S_DATA_valid,
  output reg          S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output reg          M_DATA_valid,
  input               M_DATA_ready,
  output reg [63:0]   M_DATA_payload,
  input               EN_Cin_Select_REG,
  input               clk,
  input               reset
);
  reg        [31:0]   M_Feature_Temp;
  reg        [63:0]   S_Feature_Delay;
  reg                 M_Ready_Delay;
  reg                 S_Valid_Delay;
  reg        [0:0]    cnt;
  wire                when_cin_convert_l23;
  wire                S_Ready_temp;
  reg                 M_Valid_temp;

  assign when_cin_convert_l23 = ((! M_Ready_Delay) && M_DATA_ready);
  assign S_Ready_temp = cnt[0];
  always @(*) begin
    if(S_DATA_valid) begin
      M_Valid_temp = S_DATA_valid;
    end else begin
      M_Valid_temp = S_Valid_Delay;
    end
  end

  always @(*) begin
    if(S_DATA_valid) begin
      M_Feature_Temp = S_DATA_payload[31 : 0];
    end else begin
      M_Feature_Temp = S_Feature_Delay[63 : 32];
    end
  end

  always @(*) begin
    if(EN_Cin_Select_REG) begin
      S_DATA_ready = S_Ready_temp;
    end else begin
      S_DATA_ready = M_DATA_ready;
    end
  end

  always @(*) begin
    if(EN_Cin_Select_REG) begin
      M_DATA_valid = M_Valid_temp;
    end else begin
      M_DATA_valid = S_DATA_valid;
    end
  end

  always @(*) begin
    if(EN_Cin_Select_REG) begin
      M_DATA_payload = {32'd0, M_Feature_Temp};
    end else begin
      M_DATA_payload = S_DATA_payload;
    end
  end

  always @(posedge clk) begin
    S_Feature_Delay <= S_DATA_payload;
    M_Ready_Delay <= M_DATA_ready;
    S_Valid_Delay <= S_DATA_valid;
    if(M_DATA_ready) begin
      if(when_cin_convert_l23) begin
        cnt <= 1'b1;
      end else begin
        cnt <= (cnt + 1'b1);
      end
    end else begin
      cnt <= 1'b0;
    end
  end


endmodule

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

module sdpram (
  output     [63:0]   doutb,
  input      [9:0]    addra,
  input      [9:0]    addrb,
  input      [63:0]   dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [63:0]   temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(64),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("distributed"),
    .MEMORY_SIZE(36864),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(64),
    .READ_LATENCY_B(0),
    .READ_RESET_VALUE_B("0"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_EMBEDDED_CONSTRAINT(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep"),
    .WRITE_DATA_WIDTH_A(64),
    .WRITE_MODE_B("read_first") 
  ) temp (
    .dbiterrb          (temp_dbiterrb   ), //o
    .doutb             (temp_doutb      ), //o
    .sbiterrb          (temp_sbiterrb   ), //o
    .addra             (addra           ), //i
    .addrb             (addrb           ), //i
    .clka              (clk             ), //i
    .clkb              (clk             ), //i
    .dina              (dina            ), //i
    .ena               (ena             ), //i
    .enb               (enb             ), //i
    .injectdbiterra    (injectdbiterra  ), //i
    .injectsbiterra    (injectsbiterra  ), //i
    .regceb            (regceb          ), //i
    .rstb              (rstb            ), //i
    .sleep             (sleep           ), //i
    .wea               (wea             )  //i
  );
  assign injectdbiterra = 1'b0;
  assign injectsbiterra = 1'b0;
  assign regceb = 1'b1;
  assign rstb = 1'b0;
  assign sleep = 1'b0;
  assign dbiterrb = temp_dbiterrb;
  assign doutb = temp_doutb;
  assign sbiterrb = temp_sbiterrb;

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
  fifo_sync_1 fifo (
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

//mul replaced by mul

module padding_fifo (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [63:0]   data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [11:0]   m_data_count,
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
  wire                when_padding_fifo_l42;
  wire                when_padding_fifo_l47;

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
  assign when_padding_fifo_l42 = (((! fifo_wr_rst_busy) && (! fifo_full)) && (fifo_wr_data_count < 12'h7f6));
  always @(*) begin
    if(when_padding_fifo_l42) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_padding_fifo_l47 = ((! fifo_rd_rst_busy) && (m_data_count <= fifo_rd_data_count));
  always @(*) begin
    if(when_padding_fifo_l47) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

module mul (
  input      [11:0]   A,
  input      [6:0]    B,
  output     [11:0]   P,
  input               clk,
  input               reset
);
  wire       [18:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [11:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [6:0]    _zz_P_1;
  (* use_dsp = "yes" *) reg        [11:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [6:0]    _zz_P_3;
  (* use_dsp = "yes" *) reg        [18:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [18:0]   _zz_P_5;

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

module fifo_sync_1 (
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
