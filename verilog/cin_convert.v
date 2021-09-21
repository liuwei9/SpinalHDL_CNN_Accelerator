// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : cin_convert
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:43


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
