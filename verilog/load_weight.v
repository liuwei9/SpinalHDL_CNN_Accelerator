// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : load_weight
// Git hash  : b694a57c8f5c199d7fd0af5809d5f7d2954eb351


module load_weight (
  input               Start_Pa,
  input      [15:0]   Weight_Single_Num_REG,
  input      [8:0]    Bias_Num_REG,
  output reg          Write_Block_Complete,
  input               S_Para_Data_valid,
  output reg          S_Para_Data_ready,
  input      [63:0]   S_Para_Data_payload,
  input      [14:0]   Weight_Addrb,
  output     [2047:0] Data_Out_Weight_0,
  input      [8:0]    Bias_Addrb,
  output     [255:0]  Data_Out_Bias,
  output     [255:0]  Data_Out_Scale,
  output     [255:0]  Data_Out_Shift,
  input               clk,
  input               reset
);
  wire       [7:0]    fsm_Bias_ram_addra;
  wire       [5:0]    fsm_Bias_ram_addrb;
  wire       [0:0]    fsm_Bias_ram_wea;
  wire       [7:0]    fsm_Scale_ram_addra;
  wire       [5:0]    fsm_Scale_ram_addrb;
  wire       [0:0]    fsm_Scale_ram_wea;
  wire       [7:0]    fsm_Shift_ram_addra;
  wire       [5:0]    fsm_Shift_ram_addrb;
  wire       [0:0]    fsm_Shift_ram_wea;
  wire       [2047:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_0;
  wire       [255:0]  fsm_Bias_ram_doutb;
  wire       [255:0]  fsm_Scale_ram_doutb;
  wire       [255:0]  fsm_Shift_ram_doutb;
  wire       [15:0]   _zz_when_load_weight_l47;
  wire       [15:0]   _zz_when_load_weight_l78;
  wire       [8:0]    _zz_when_load_weight_l86;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [15:0]   fsm_Cnt_Single_Weight;
  reg                 fsm_En_Single_Ram;
  reg                 fsm_En_Single_Ram_Temp;
  wire                when_load_weight_l47;
  wire                when_load_weight_l54;
  reg        [0:0]    fsm_Cnt_Ram_Weight_Num;
  wire                when_load_weight_l67;
  reg                 fsm_En_Weight;
  wire                when_load_weight_l78;
  reg        [8:0]    fsm_Cnt_Bias;
  reg                 fsm_En_Bias;
  wire                when_load_weight_l86;
  wire                when_load_weight_l91;
  wire                when_load_weight_l99;
  wire                when_load_weight_l107;
  wire                when_load_weight_l119;
  wire                when_load_weight_l121;
  wire                when_load_weight_l126;
  reg        [0:0]    fsm_En_Weight_Nine_Temp;
  wire                when_load_weight_l133;
  wire                when_load_weight_l135;
  reg                 fsm_En_Wr_Weight;
  wire                when_load_weight_l145;
  reg        [0:0]    fsm_En_Weight_Nine;
  reg        [14:0]   fsm_Weight_Addra_Temp;
  wire                when_load_weight_l161;
  reg        [14:0]   fsm_Weight_Addra;
  reg        [63:0]   fsm_S_Data_One;
  reg                 fsm_En_Wr_Bias;
  wire                when_load_weight_l183;
  reg        [8:0]    fsm_Bias_Addra_Temp;
  wire                when_load_weight_l193;
  reg        [8:0]    fsm_Bias_Addra;
  reg        [63:0]   fsm_Bias_data;
  reg                 fsm_En_Wr_Scale;
  wire                when_load_weight_l216;
  reg        [8:0]    fsm_Scale_Addra_Temp;
  wire                when_load_weight_l226;
  reg        [8:0]    fsm_Scale_Addra;
  reg        [63:0]   fsm_Scale_data;
  reg                 fsm_En_Wr_Shift;
  wire                when_load_weight_l249;
  reg        [255:0]  fsm_Shift_Addra_Temp;
  wire                when_load_weight_l259;
  reg        [255:0]  fsm_Shift_Addra;
  reg        [63:0]   fsm_Shift_data;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_when_load_weight_l47 = (Weight_Single_Num_REG - 16'h0001);
  assign _zz_when_load_weight_l78 = (Weight_Single_Num_REG - 16'h0001);
  assign _zz_when_load_weight_l86 = (Bias_Num_REG - 9'h001);
  Compute_33Weight fsm_Compute_3_3_Weight (
    .io_weight_data_One          (fsm_S_Data_One                                   ), //i
    .io_weight_wr                (fsm_En_Weight_Nine                               ), //i
    .io_weight_addra             (fsm_Weight_Addra                                 ), //i
    .io_weight_addrb             (Weight_Addrb                                     ), //i
    .io_weight_ram_data_out_0    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_0  ), //o
    .clk                         (clk                                              )  //i
  );
  sdpram_1 fsm_Bias_ram (
    .doutb    (fsm_Bias_ram_doutb  ), //o
    .addra    (fsm_Bias_ram_addra  ), //i
    .addrb    (fsm_Bias_ram_addrb  ), //i
    .dina     (fsm_Bias_data       ), //i
    .ena      (fsm_En_Wr_Bias      ), //i
    .enb      (1'b1                ), //i
    .wea      (fsm_Bias_ram_wea    ), //i
    .clk      (clk                 )  //i
  );
  sdpram_1 fsm_Scale_ram (
    .doutb    (fsm_Scale_ram_doutb  ), //o
    .addra    (fsm_Scale_ram_addra  ), //i
    .addrb    (fsm_Scale_ram_addrb  ), //i
    .dina     (fsm_Scale_data       ), //i
    .ena      (fsm_En_Wr_Scale      ), //i
    .enb      (1'b1                 ), //i
    .wea      (fsm_Scale_ram_wea    ), //i
    .clk      (clk                  )  //i
  );
  sdpram_1 fsm_Shift_ram (
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
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : fsm_stateReg_string = "fsm_Copy_Weight";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : fsm_stateReg_string = "fsm_Copy_Bias  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : fsm_stateReg_string = "fsm_Copy_Scale ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : fsm_stateReg_string = "fsm_Copy_Shift ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : fsm_stateNext_string = "fsm_Copy_Weight";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : fsm_stateNext_string = "fsm_Copy_Bias  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : fsm_stateNext_string = "fsm_Copy_Scale ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : fsm_stateNext_string = "fsm_Copy_Shift ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : begin
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

  assign when_load_weight_l78 = ((fsm_Cnt_Single_Weight == _zz_when_load_weight_l78) && (fsm_Cnt_Ram_Weight_Num == 1'b0));
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

  assign when_load_weight_l121 = (((fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_1_binary_sequential_fsm_IDLE)) && (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift));
  assign when_load_weight_l126 = (((fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_1_binary_sequential_fsm_IDLE)) && (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift));
  always @(*) begin
    if(fsm_En_Wr_Weight) begin
      fsm_En_Weight_Nine = fsm_En_Weight_Nine_Temp;
    end else begin
      fsm_En_Weight_Nine = 1'b0;
    end
  end

  assign Data_Out_Weight_0 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_0;
  assign fsm_Bias_ram_wea = 1'b1;
  assign fsm_Bias_ram_addra = fsm_Bias_Addra[7:0];
  assign Data_Out_Bias = fsm_Bias_ram_doutb;
  assign fsm_Bias_ram_addrb = Bias_Addrb[5:0];
  assign fsm_Scale_ram_wea = 1'b1;
  assign fsm_Scale_ram_addra = fsm_Scale_Addra[7:0];
  assign Data_Out_Scale = fsm_Scale_ram_doutb;
  assign fsm_Scale_ram_addrb = Bias_Addrb[5:0];
  assign fsm_Shift_ram_wea = 1'b1;
  assign fsm_Shift_ram_addra = fsm_Shift_Addra[7:0];
  assign Data_Out_Shift = fsm_Shift_ram_doutb;
  assign fsm_Shift_ram_addrb = Bias_Addrb[5:0];
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
        if(Start_Pa) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : begin
        if(fsm_En_Weight) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : begin
        if(fsm_En_Bias) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : begin
        if(fsm_En_Bias) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : begin
        if(fsm_En_Bias) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end
  end

  assign when_load_weight_l54 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l67 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l91 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l99 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l107 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift);
  assign when_load_weight_l119 = ((fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight) && (fsm_stateReg != `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight));
  assign when_load_weight_l133 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_IDLE);
  assign when_load_weight_l135 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l145 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l161 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l183 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l193 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l216 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l226 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l249 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift);
  assign when_load_weight_l259 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift);
  always @(posedge clk) begin
    if(reset) begin
      S_Para_Data_ready <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
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
        fsm_Cnt_Single_Weight <= 16'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Cnt_Single_Weight <= (fsm_Cnt_Single_Weight + 16'h0001);
        end else begin
          fsm_Cnt_Single_Weight <= fsm_Cnt_Single_Weight;
        end
      end
    end else begin
      fsm_Cnt_Single_Weight <= 16'h0;
    end
    if(when_load_weight_l67) begin
      if(fsm_En_Single_Ram) begin
        fsm_Cnt_Ram_Weight_Num <= (fsm_Cnt_Ram_Weight_Num + 1'b1);
      end else begin
        fsm_Cnt_Ram_Weight_Num <= fsm_Cnt_Ram_Weight_Num;
      end
    end else begin
      fsm_Cnt_Ram_Weight_Num <= 1'b0;
    end
    if(when_load_weight_l91) begin
      if(fsm_En_Bias) begin
        fsm_Cnt_Bias <= 9'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Cnt_Bias <= (fsm_Cnt_Bias + 9'h001);
        end else begin
          fsm_Cnt_Bias <= fsm_Cnt_Bias;
        end
      end
    end else begin
      if(when_load_weight_l99) begin
        if(fsm_En_Bias) begin
          fsm_Cnt_Bias <= 9'h0;
        end else begin
          if(S_Para_Data_valid) begin
            fsm_Cnt_Bias <= (fsm_Cnt_Bias + 9'h001);
          end else begin
            fsm_Cnt_Bias <= fsm_Cnt_Bias;
          end
        end
      end else begin
        if(when_load_weight_l107) begin
          if(fsm_En_Bias) begin
            fsm_Cnt_Bias <= 9'h0;
          end else begin
            if(S_Para_Data_valid) begin
              fsm_Cnt_Bias <= (fsm_Cnt_Bias + 9'h001);
            end else begin
              fsm_Cnt_Bias <= fsm_Cnt_Bias;
            end
          end
        end else begin
          fsm_Cnt_Bias <= 9'h0;
        end
      end
    end
    if(when_load_weight_l126) begin
      Write_Block_Complete <= 1'b1;
    end else begin
      Write_Block_Complete <= 1'b0;
    end
    if(when_load_weight_l133) begin
      fsm_En_Weight_Nine_Temp <= 1'b1;
    end else begin
      if(when_load_weight_l135) begin
        if(fsm_En_Single_Ram_Temp) begin
          fsm_En_Weight_Nine_Temp <= fsm_En_Weight_Nine_Temp[0];
        end else begin
          fsm_En_Weight_Nine_Temp <= fsm_En_Weight_Nine_Temp;
        end
      end else begin
        fsm_En_Weight_Nine_Temp <= 1'b1;
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
        fsm_Weight_Addra_Temp <= 15'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Weight_Addra_Temp <= (fsm_Weight_Addra_Temp + 15'h0001);
        end else begin
          fsm_Weight_Addra_Temp <= fsm_Weight_Addra_Temp;
        end
      end
    end else begin
      fsm_Weight_Addra_Temp <= 15'h0;
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
        fsm_Bias_Addra_Temp <= (fsm_Bias_Addra_Temp + 9'h001);
      end else begin
        fsm_Bias_Addra_Temp <= fsm_Bias_Addra_Temp;
      end
    end else begin
      fsm_Bias_Addra_Temp <= 9'h0;
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
        fsm_Scale_Addra_Temp <= (fsm_Scale_Addra_Temp + 9'h001);
      end else begin
        fsm_Scale_Addra_Temp <= fsm_Scale_Addra_Temp;
      end
    end else begin
      fsm_Scale_Addra_Temp <= 9'h0;
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
