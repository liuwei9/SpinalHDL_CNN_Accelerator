// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : load_weight
// Git hash  : ac67abb90ebb1eeb849e342f10702203438ff1d9


`define fsm_enumDefinition_binary_sequential_type [2:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 3'b000
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 3'b001
`define fsm_enumDefinition_binary_sequential_fsm_Copy_Weight 3'b010
`define fsm_enumDefinition_binary_sequential_fsm_Copy_Bias 3'b011
`define fsm_enumDefinition_binary_sequential_fsm_Copy_Scale 3'b100
`define fsm_enumDefinition_binary_sequential_fsm_Copy_Shift 3'b101


module load_weight (
  input               Start_Pa,
  input      [14:0]   Weight_Single_Num_REG,
  input      [14:0]   Bias_Num_REG,
  output reg          Write_Block_Complete,
  input               S_Para_Data_valid,
  output reg          S_Para_Data_ready,
  input      [63:0]   S_Para_Data_payload,
  input      [12:0]   Weight_Addrb,
  output     [1023:0] Data_Out_Weight_0,
  output     [1023:0] Data_Out_Weight_1,
  output     [1023:0] Data_Out_Weight_2,
  output     [1023:0] Data_Out_Weight_3,
  output     [1023:0] Data_Out_Weight_4,
  output     [1023:0] Data_Out_Weight_5,
  output     [1023:0] Data_Out_Weight_6,
  output     [1023:0] Data_Out_Weight_7,
  output     [1023:0] Data_Out_Weight_8,
  input      [14:0]   Bias_Addrb,
  output     [255:0]  Data_Out_Bias,
  output     [255:0]  Data_Out_Scale,
  output     [255:0]  Data_Out_Shift,
  input               clk,
  input               reset
);
  wire       [6:0]    fsm_Bias_ram_addra;
  wire       [4:0]    fsm_Bias_ram_addrb;
  wire       [0:0]    fsm_Bias_ram_wea;
  wire       [6:0]    fsm_Scale_ram_addra;
  wire       [4:0]    fsm_Scale_ram_addrb;
  wire       [0:0]    fsm_Scale_ram_wea;
  wire       [6:0]    fsm_Shift_ram_addra;
  wire       [4:0]    fsm_Shift_ram_addrb;
  wire       [0:0]    fsm_Shift_ram_wea;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_0;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_1;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_2;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_3;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_4;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_5;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_6;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_7;
  wire       [1023:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_8;
  wire       [255:0]  fsm_Bias_ram_doutb;
  wire       [255:0]  fsm_Scale_ram_doutb;
  wire       [255:0]  fsm_Shift_ram_doutb;
  wire       [14:0]   _zz_when_load_weight_l47;
  wire       [14:0]   _zz_when_load_weight_l78;
  wire       [14:0]   _zz_when_load_weight_l86;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [14:0]   fsm_Cnt_Single_Weight;
  reg                 fsm_En_Single_Ram;
  reg                 fsm_En_Single_Ram_Temp;
  wire                when_load_weight_l47;
  wire                when_load_weight_l54;
  reg        [8:0]    fsm_Cnt_Ram_Weight_Num;
  wire                when_load_weight_l67;
  reg                 fsm_En_Weight;
  wire                when_load_weight_l78;
  reg        [14:0]   fsm_Cnt_Bias;
  reg                 fsm_En_Bias;
  wire                when_load_weight_l86;
  wire                when_load_weight_l91;
  wire                when_load_weight_l99;
  wire                when_load_weight_l107;
  wire                when_load_weight_l119;
  wire                when_load_weight_l121;
  wire                when_load_weight_l126;
  reg        [8:0]    fsm_En_Weight_Nine_Temp;
  wire                when_load_weight_l133;
  wire                when_load_weight_l135;
  reg                 fsm_En_Wr_Weight;
  wire                when_load_weight_l145;
  reg        [8:0]    fsm_En_Weight_Nine;
  reg        [12:0]   fsm_Weight_Addra_Temp;
  wire                when_load_weight_l161;
  reg        [12:0]   fsm_Weight_Addra;
  reg        [63:0]   fsm_S_Data_One;
  reg                 fsm_En_Wr_Bias;
  wire                when_load_weight_l183;
  reg        [14:0]   fsm_Bias_Addra_Temp;
  wire                when_load_weight_l193;
  reg        [14:0]   fsm_Bias_Addra;
  reg        [63:0]   fsm_Bias_data;
  reg                 fsm_En_Wr_Scale;
  wire                when_load_weight_l216;
  reg        [14:0]   fsm_Scale_Addra_Temp;
  wire                when_load_weight_l226;
  reg        [14:0]   fsm_Scale_Addra;
  reg        [63:0]   fsm_Scale_data;
  reg                 fsm_En_Wr_Shift;
  wire                when_load_weight_l249;
  reg        [255:0]  fsm_Shift_Addra_Temp;
  wire                when_load_weight_l259;
  reg        [255:0]  fsm_Shift_Addra;
  reg        [63:0]   fsm_Shift_data;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_when_load_weight_l47 = (Weight_Single_Num_REG - 15'h0001);
  assign _zz_when_load_weight_l78 = (Weight_Single_Num_REG - 15'h0001);
  assign _zz_when_load_weight_l86 = (Bias_Num_REG - 15'h0001);
  Compute_33Weight fsm_Compute_3_3_Weight (
    .io_weight_data_One          (fsm_S_Data_One                                   ), //i
    .io_weight_wr                (fsm_En_Weight_Nine                               ), //i
    .io_weight_addra             (fsm_Weight_Addra                                 ), //i
    .io_weight_addrb             (Weight_Addrb                                     ), //i
    .io_weight_ram_data_out_0    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_0  ), //o
    .io_weight_ram_data_out_1    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_1  ), //o
    .io_weight_ram_data_out_2    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_2  ), //o
    .io_weight_ram_data_out_3    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_3  ), //o
    .io_weight_ram_data_out_4    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_4  ), //o
    .io_weight_ram_data_out_5    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_5  ), //o
    .io_weight_ram_data_out_6    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_6  ), //o
    .io_weight_ram_data_out_7    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_7  ), //o
    .io_weight_ram_data_out_8    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_8  ), //o
    .clk                         (clk                                              )  //i
  );
  sdpram_9 fsm_Bias_ram (
    .doutb    (fsm_Bias_ram_doutb  ), //o
    .addra    (fsm_Bias_ram_addra  ), //i
    .addrb    (fsm_Bias_ram_addrb  ), //i
    .dina     (fsm_Bias_data       ), //i
    .ena      (fsm_En_Wr_Bias      ), //i
    .enb      (1'b1                ), //i
    .wea      (fsm_Bias_ram_wea    ), //i
    .clk      (clk                 )  //i
  );
  sdpram_9 fsm_Scale_ram (
    .doutb    (fsm_Scale_ram_doutb  ), //o
    .addra    (fsm_Scale_ram_addra  ), //i
    .addrb    (fsm_Scale_ram_addrb  ), //i
    .dina     (fsm_Scale_data       ), //i
    .ena      (fsm_En_Wr_Scale      ), //i
    .enb      (1'b1                 ), //i
    .wea      (fsm_Scale_ram_wea    ), //i
    .clk      (clk                  )  //i
  );
  sdpram_9 fsm_Shift_ram (
    .doutb    (fsm_Shift_ram_doutb  ), //o
    .addra    (fsm_Shift_ram_addra  ), //i
    .addrb    (fsm_Shift_ram_addrb  ), //i
    .dina     (fsm_Shift_data       ), //i
    .ena      (fsm_En_Wr_Shift      ), //i
    .enb      (1'b1                 ), //i
    .wea      (fsm_Shift_ram_wea    ), //i
    .clk      (clk                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT       ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE       ";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight : fsm_stateReg_string = "fsm_Copy_Weight";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias : fsm_stateReg_string = "fsm_Copy_Bias  ";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale : fsm_stateReg_string = "fsm_Copy_Scale ";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift : fsm_stateReg_string = "fsm_Copy_Shift ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT       ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE       ";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight : fsm_stateNext_string = "fsm_Copy_Weight";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias : fsm_stateNext_string = "fsm_Copy_Bias  ";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale : fsm_stateNext_string = "fsm_Copy_Scale ";
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift : fsm_stateNext_string = "fsm_Copy_Shift ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_load_weight_l47 = (fsm_Cnt_Single_Weight == _zz_when_load_weight_l47);
  always @(*) begin
    if(when_load_weight_l47) begin
      fsm_En_Single_Ram = 1'b1;
    end else begin
      fsm_En_Single_Ram = 1'b0;
    end
  end

  assign when_load_weight_l78 = ((fsm_Cnt_Single_Weight == _zz_when_load_weight_l78) && (fsm_Cnt_Ram_Weight_Num == 9'h008));
  always @(*) begin
    if(when_load_weight_l78) begin
      fsm_En_Weight = 1'b1;
    end else begin
      fsm_En_Weight = 1'b0;
    end
  end

  assign when_load_weight_l86 = (fsm_Cnt_Bias == _zz_when_load_weight_l86);
  always @(*) begin
    if(when_load_weight_l86) begin
      fsm_En_Bias = 1'b1;
    end else begin
      fsm_En_Bias = 1'b0;
    end
  end

  assign when_load_weight_l121 = (((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_IDLE)) && (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift));
  assign when_load_weight_l126 = (((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_IDLE)) && (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift));
  always @(*) begin
    if(fsm_En_Wr_Weight) begin
      fsm_En_Weight_Nine = fsm_En_Weight_Nine_Temp;
    end else begin
      fsm_En_Weight_Nine = 9'h0;
    end
  end

  assign Data_Out_Weight_0 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_0;
  assign Data_Out_Weight_1 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_1;
  assign Data_Out_Weight_2 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_2;
  assign Data_Out_Weight_3 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_3;
  assign Data_Out_Weight_4 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_4;
  assign Data_Out_Weight_5 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_5;
  assign Data_Out_Weight_6 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_6;
  assign Data_Out_Weight_7 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_7;
  assign Data_Out_Weight_8 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_8;
  assign fsm_Bias_ram_wea = 1'b1;
  assign fsm_Bias_ram_addra = fsm_Bias_Addra[6:0];
  assign Data_Out_Bias = fsm_Bias_ram_doutb;
  assign fsm_Bias_ram_addrb = Bias_Addrb[4:0];
  assign fsm_Scale_ram_wea = 1'b1;
  assign fsm_Scale_ram_addra = fsm_Scale_Addra[6:0];
  assign Data_Out_Scale = fsm_Scale_ram_doutb;
  assign fsm_Scale_ram_addrb = Bias_Addrb[4:0];
  assign fsm_Shift_ram_wea = 1'b1;
  assign fsm_Shift_ram_addra = fsm_Shift_Addra[6:0];
  assign Data_Out_Shift = fsm_Shift_ram_doutb;
  assign fsm_Shift_ram_addrb = Bias_Addrb[4:0];
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(Start_Pa) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight : begin
        if(fsm_En_Weight) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias : begin
        if(fsm_En_Weight) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale : begin
        if(fsm_En_Weight) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift : begin
        if(fsm_En_Weight) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift;
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

  assign when_load_weight_l54 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l67 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l91 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l99 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l107 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift);
  assign when_load_weight_l119 = ((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight));
  assign when_load_weight_l133 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_IDLE);
  assign when_load_weight_l135 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l145 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l161 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l183 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l193 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l216 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l226 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l249 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift);
  assign when_load_weight_l259 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Copy_Shift);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      S_Para_Data_ready <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      if(when_load_weight_l119) begin
        S_Para_Data_ready <= 1'b1;
      end else begin
        if(when_load_weight_l121) begin
          S_Para_Data_ready <= 1'b0;
        end else begin
          S_Para_Data_ready <= S_Para_Data_ready;
        end
      end
      fsm_stateReg <= fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    if(when_load_weight_l47) begin
      fsm_En_Single_Ram_Temp <= 1'b1;
    end else begin
      fsm_En_Single_Ram_Temp <= 1'b0;
    end
    if(when_load_weight_l54) begin
      if(fsm_En_Single_Ram) begin
        fsm_Cnt_Single_Weight <= 15'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Cnt_Single_Weight <= (fsm_Cnt_Single_Weight + 15'h0001);
        end else begin
          fsm_Cnt_Single_Weight <= fsm_Cnt_Single_Weight;
        end
      end
    end else begin
      fsm_Cnt_Single_Weight <= 15'h0;
    end
    if(when_load_weight_l67) begin
      if(fsm_En_Single_Ram) begin
        fsm_Cnt_Ram_Weight_Num <= (fsm_Cnt_Ram_Weight_Num + 9'h001);
      end else begin
        fsm_Cnt_Ram_Weight_Num <= fsm_Cnt_Ram_Weight_Num;
      end
    end else begin
      fsm_Cnt_Ram_Weight_Num <= 9'h0;
    end
    if(when_load_weight_l91) begin
      if(fsm_En_Bias) begin
        fsm_Cnt_Bias <= 15'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Cnt_Bias <= (fsm_Cnt_Bias + 15'h0001);
        end else begin
          fsm_Cnt_Bias <= fsm_Cnt_Bias;
        end
      end
    end else begin
      if(when_load_weight_l99) begin
        if(fsm_En_Bias) begin
          fsm_Cnt_Bias <= 15'h0;
        end else begin
          if(S_Para_Data_valid) begin
            fsm_Cnt_Bias <= (fsm_Cnt_Bias + 15'h0001);
          end else begin
            fsm_Cnt_Bias <= fsm_Cnt_Bias;
          end
        end
      end else begin
        if(when_load_weight_l107) begin
          if(fsm_En_Bias) begin
            fsm_Cnt_Bias <= 15'h0;
          end else begin
            if(S_Para_Data_valid) begin
              fsm_Cnt_Bias <= (fsm_Cnt_Bias + 15'h0001);
            end else begin
              fsm_Cnt_Bias <= fsm_Cnt_Bias;
            end
          end
        end else begin
          fsm_Cnt_Bias <= 15'h0;
        end
      end
    end
    if(when_load_weight_l126) begin
      Write_Block_Complete <= 1'b1;
    end else begin
      Write_Block_Complete <= 1'b0;
    end
    if(when_load_weight_l133) begin
      fsm_En_Weight_Nine_Temp <= 9'h001;
    end else begin
      if(when_load_weight_l135) begin
        if(fsm_En_Single_Ram_Temp) begin
          fsm_En_Weight_Nine_Temp <= {fsm_En_Weight_Nine_Temp[7 : 0],fsm_En_Weight_Nine_Temp[8]};
        end else begin
          fsm_En_Weight_Nine_Temp <= fsm_En_Weight_Nine_Temp;
        end
      end else begin
        fsm_En_Weight_Nine_Temp <= 9'h001;
      end
    end
    if(when_load_weight_l145) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Weight <= 1'b1;
      end else begin
        fsm_En_Wr_Weight <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Weight <= 1'b0;
    end
    if(when_load_weight_l161) begin
      if(fsm_En_Single_Ram) begin
        fsm_Weight_Addra_Temp <= 13'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Weight_Addra_Temp <= (fsm_Weight_Addra_Temp + 13'h0001);
        end else begin
          fsm_Weight_Addra_Temp <= fsm_Weight_Addra_Temp;
        end
      end
    end else begin
      fsm_Weight_Addra_Temp <= 13'h0;
    end
    fsm_Weight_Addra <= fsm_Weight_Addra_Temp;
    fsm_S_Data_One <= S_Para_Data_payload;
    if(when_load_weight_l183) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Bias <= 1'b1;
      end else begin
        fsm_En_Wr_Bias <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Bias <= 1'b0;
    end
    if(when_load_weight_l193) begin
      if(S_Para_Data_valid) begin
        fsm_Bias_Addra_Temp <= (fsm_Bias_Addra_Temp + 15'h0001);
      end else begin
        fsm_Bias_Addra_Temp <= fsm_Bias_Addra_Temp;
      end
    end else begin
      fsm_Bias_Addra_Temp <= 15'h0;
    end
    fsm_Bias_Addra <= fsm_Bias_Addra_Temp;
    fsm_Bias_data <= S_Para_Data_payload;
    if(when_load_weight_l216) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Scale <= 1'b1;
      end else begin
        fsm_En_Wr_Scale <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Scale <= 1'b0;
    end
    if(when_load_weight_l226) begin
      if(S_Para_Data_valid) begin
        fsm_Scale_Addra_Temp <= (fsm_Scale_Addra_Temp + 15'h0001);
      end else begin
        fsm_Scale_Addra_Temp <= fsm_Scale_Addra_Temp;
      end
    end else begin
      fsm_Scale_Addra_Temp <= 15'h0;
    end
    fsm_Scale_Addra <= fsm_Scale_Addra_Temp;
    fsm_Scale_data <= S_Para_Data_payload;
    if(when_load_weight_l249) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Shift <= 1'b1;
      end else begin
        fsm_En_Wr_Shift <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Shift <= 1'b0;
    end
    if(when_load_weight_l259) begin
      if(S_Para_Data_valid) begin
        fsm_Shift_Addra_Temp <= (fsm_Shift_Addra_Temp + 256'h0000000000000000000000000000000000000000000000000000000000000001);
      end else begin
        fsm_Shift_Addra_Temp <= fsm_Shift_Addra_Temp;
      end
    end else begin
      fsm_Shift_Addra_Temp <= 256'h0;
    end
    fsm_Shift_Addra <= fsm_Shift_Addra_Temp;
    fsm_Shift_data <= S_Para_Data_payload;
  end


endmodule

//sdpram_9 replaced by sdpram_9

//sdpram_9 replaced by sdpram_9

module sdpram_9 (
  output     [255:0]  doutb,
  input      [6:0]    addra,
  input      [4:0]    addrb,
  input      [63:0]   dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [255:0]  temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(7),
    .ADDR_WIDTH_B(5),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(64),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("block"),
    .MEMORY_SIZE(8192),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(256),
    .READ_LATENCY_B(1),
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

module Compute_33Weight (
  input      [63:0]   io_weight_data_One,
  input      [8:0]    io_weight_wr,
  input      [12:0]   io_weight_addra,
  input      [12:0]   io_weight_addrb,
  output     [1023:0] io_weight_ram_data_out_0,
  output     [1023:0] io_weight_ram_data_out_1,
  output     [1023:0] io_weight_ram_data_out_2,
  output     [1023:0] io_weight_ram_data_out_3,
  output     [1023:0] io_weight_ram_data_out_4,
  output     [1023:0] io_weight_ram_data_out_5,
  output     [1023:0] io_weight_ram_data_out_6,
  output     [1023:0] io_weight_ram_data_out_7,
  output     [1023:0] io_weight_ram_data_out_8,
  input               clk
);
  wire       [8:0]    sdpram_12_addrb;
  wire       [0:0]    sdpram_12_wea;
  wire       [8:0]    sdpram_13_addrb;
  wire       [0:0]    sdpram_13_wea;
  wire       [8:0]    sdpram_14_addrb;
  wire       [0:0]    sdpram_14_wea;
  wire       [8:0]    sdpram_15_addrb;
  wire       [0:0]    sdpram_15_wea;
  wire       [8:0]    sdpram_16_addrb;
  wire       [0:0]    sdpram_16_wea;
  wire       [8:0]    sdpram_17_addrb;
  wire       [0:0]    sdpram_17_wea;
  wire       [8:0]    sdpram_18_addrb;
  wire       [0:0]    sdpram_18_wea;
  wire       [8:0]    sdpram_19_addrb;
  wire       [0:0]    sdpram_19_wea;
  wire       [8:0]    sdpram_20_addrb;
  wire       [0:0]    sdpram_20_wea;
  wire       [1023:0] sdpram_12_doutb;
  wire       [1023:0] sdpram_13_doutb;
  wire       [1023:0] sdpram_14_doutb;
  wire       [1023:0] sdpram_15_doutb;
  wire       [1023:0] sdpram_16_doutb;
  wire       [1023:0] sdpram_17_doutb;
  wire       [1023:0] sdpram_18_doutb;
  wire       [1023:0] sdpram_19_doutb;
  wire       [1023:0] sdpram_20_doutb;

  sdpram sdpram_12 (
    .doutb    (sdpram_12_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_12_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_12_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_13 (
    .doutb    (sdpram_13_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_13_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_13_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_14 (
    .doutb    (sdpram_14_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_14_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_14_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_15 (
    .doutb    (sdpram_15_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_15_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_15_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_16 (
    .doutb    (sdpram_16_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_16_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_16_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_17 (
    .doutb    (sdpram_17_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_17_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_17_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_18 (
    .doutb    (sdpram_18_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_18_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_18_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_19 (
    .doutb    (sdpram_19_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_19_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_19_wea       ), //i
    .clk      (clk                 )  //i
  );
  sdpram sdpram_20 (
    .doutb    (sdpram_20_doutb     ), //o
    .addra    (io_weight_addra     ), //i
    .addrb    (sdpram_20_addrb     ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_20_wea       ), //i
    .clk      (clk                 )  //i
  );
  assign sdpram_12_wea = io_weight_wr[0];
  assign sdpram_12_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_0 = sdpram_12_doutb;
  assign sdpram_13_wea = io_weight_wr[1];
  assign sdpram_13_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_1 = sdpram_13_doutb;
  assign sdpram_14_wea = io_weight_wr[2];
  assign sdpram_14_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_2 = sdpram_14_doutb;
  assign sdpram_15_wea = io_weight_wr[3];
  assign sdpram_15_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_3 = sdpram_15_doutb;
  assign sdpram_16_wea = io_weight_wr[4];
  assign sdpram_16_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_4 = sdpram_16_doutb;
  assign sdpram_17_wea = io_weight_wr[5];
  assign sdpram_17_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_5 = sdpram_17_doutb;
  assign sdpram_18_wea = io_weight_wr[6];
  assign sdpram_18_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_6 = sdpram_18_doutb;
  assign sdpram_19_wea = io_weight_wr[7];
  assign sdpram_19_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_7 = sdpram_19_doutb;
  assign sdpram_20_wea = io_weight_wr[8];
  assign sdpram_20_addrb = io_weight_addrb[8:0];
  assign io_weight_ram_data_out_8 = sdpram_20_doutb;

endmodule

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

//sdpram replaced by sdpram

module sdpram (
  output     [1023:0] doutb,
  input      [12:0]   addra,
  input      [8:0]    addrb,
  input      [63:0]   dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [1023:0] temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(13),
    .ADDR_WIDTH_B(9),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(64),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("block"),
    .MEMORY_SIZE(524288),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(1024),
    .READ_LATENCY_B(1),
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
