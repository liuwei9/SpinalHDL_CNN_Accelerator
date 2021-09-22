// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : leaky_relu
// Git hash  : 038b51e1758bac70ab39881905296db1cc09842a
// Date      : 22/09/2021, 16:16:39



module leaky_relu (
  input      [7:0]    data_in,
  input      [7:0]    zero_data_in,
  output reg [7:0]    data_out,
  input               clk,
  input               reset
);
  wire       [15:0]   sub_zero_S;
  wire       [29:0]   mul_leaky_P;
  wire       [15:0]   add_zero_S;
  wire       [15:0]   _zz_odd_temp;
  reg        [15:0]   data_after1;
  wire       [13:0]   MUL_LEAKY_DATA;
  reg        [15:0]   sub_zero_S_delay_1;
  reg        [15:0]   sub_zero_S_delay_2;
  reg        [15:0]   sub_zero_S_delay_3;
  reg        [15:0]   data_after_zero;
  reg        [15:0]   data_after_mul;
  wire       [2:0]    temp_data;
  wire       [15:0]   odd_temp;
  wire       [15:0]   even_temp;
  wire                when_leaky_relu_l34;
  wire                when_leaky_relu_l39;
  wire                when_leaky_relu_l36;
  reg        [15:0]   data_negative;
  wire                when_leaky_relu_l46;
  wire                when_leaky_relu_l54;
  wire                when_leaky_relu_l56;

  assign _zz_odd_temp = ({temp_data,mul_leaky_P[29 : 17]} + 16'h0001);
  sub_16_u8 sub_zero (
    .A      (data_after1   ), //i
    .B      (zero_data_in  ), //i
    .S      (sub_zero_S    ), //o
    .CLK    (clk           )  //i
  );
  mult_leaky mul_leaky (
    .A      (sub_zero_S      ), //i
    .B      (MUL_LEAKY_DATA  ), //i
    .P      (mul_leaky_P     ), //o
    .CLK    (clk             )  //i
  );
  add_16_u8_16 add_zero (
    .A      (data_negative  ), //i
    .B      (zero_data_in   ), //i
    .S      (add_zero_S     ), //o
    .CLK    (clk            )  //i
  );
  assign MUL_LEAKY_DATA = 14'h3333;
  assign temp_data = 3'b111;
  assign odd_temp = _zz_odd_temp;
  assign even_temp = {temp_data,mul_leaky_P[29 : 17]};
  assign when_leaky_relu_l34 = (mul_leaky_P[16 : 0] <= 17'h0fae1);
  assign when_leaky_relu_l39 = mul_leaky_P[17];
  assign when_leaky_relu_l36 = (17'h1051e <= mul_leaky_P[16 : 0]);
  assign when_leaky_relu_l46 = data_after_zero[15];
  always @(*) begin
    if(when_leaky_relu_l46) begin
      data_negative = data_after_mul;
    end else begin
      data_negative = data_after_zero;
    end
  end

  assign when_leaky_relu_l54 = add_zero_S[15];
  assign when_leaky_relu_l56 = (add_zero_S[14 : 8] != 7'h0);
  always @(posedge clk) begin
    data_after1 <= {8'd0, data_in};
    sub_zero_S_delay_1 <= sub_zero_S;
    sub_zero_S_delay_2 <= sub_zero_S_delay_1;
    sub_zero_S_delay_3 <= sub_zero_S_delay_2;
    data_after_zero <= sub_zero_S_delay_3;
    if(when_leaky_relu_l34) begin
      data_after_mul <= even_temp;
    end else begin
      if(when_leaky_relu_l36) begin
        data_after_mul <= odd_temp;
      end else begin
        if(when_leaky_relu_l39) begin
          data_after_mul <= odd_temp;
        end else begin
          data_after_mul <= even_temp;
        end
      end
    end
    if(when_leaky_relu_l54) begin
      data_out <= 8'h0;
    end else begin
      if(when_leaky_relu_l56) begin
        data_out <= 8'hff;
      end else begin
        data_out <= add_zero_S[7 : 0];
      end
    end
  end


endmodule
