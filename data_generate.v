// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : data_generate
// Git hash  : c60024fe29736d8af469cca625eebc0a2cd28ca2



module data_generate (
  input               Start,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [63:0]   S_DATA_payload,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input      [11:0]   Row_Num_In_REG,
  input               Padding_REG,
  input      [7:0]    Zero_Point_REG,
  input      [7:0]    Zero_Num_REG,
  input      [9:0]    Channel_In_Num_REG,
  input               EN_Cin_Select_REG,
  output     [11:0]   RowNum_After_Padding,
  input               clk,
  input               reset
);
  wire                cin_convert_1_S_DATA_ready;
  wire                cin_convert_1_M_DATA_valid;
  wire       [63:0]   cin_convert_1_M_DATA_payload;

  cin_convert cin_convert_1 (
    .S_DATA_valid         (S_DATA_valid                  ), //i
    .S_DATA_ready         (cin_convert_1_S_DATA_ready    ), //o
    .S_DATA_payload       (S_DATA_payload                ), //i
    .M_DATA_valid         (cin_convert_1_M_DATA_valid    ), //o
    .M_DATA_ready         (M_DATA_ready                  ), //i
    .M_DATA_payload       (cin_convert_1_M_DATA_payload  ), //o
    .EN_Cin_Select_REG    (EN_Cin_Select_REG             ), //i
    .clk                  (clk                           ), //i
    .reset                (reset                         )  //i
  );
  assign S_DATA_ready = cin_convert_1_S_DATA_ready;
  assign M_DATA_valid = cin_convert_1_M_DATA_valid;
  assign M_DATA_payload = cin_convert_1_M_DATA_payload;
  assign RowNum_After_Padding = 12'h0;

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
