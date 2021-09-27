// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_leaky_relu
// Git hash  : fbf001df014e844f818dd31ebd5c3686888b43b3


module Conv_leaky_relu (
  input      [63:0]   data_in,
  input      [7:0]    zero_point,
  output reg [63:0]   data_out,
  input               clk
);
  wire       [7:0]    leaky_relu_1_data_in;
  wire       [7:0]    leaky_relu_2_data_in;
  wire       [7:0]    leaky_relu_3_data_in;
  wire       [7:0]    leaky_relu_4_data_in;
  wire       [7:0]    leaky_relu_5_data_in;
  wire       [7:0]    leaky_relu_6_data_in;
  wire       [7:0]    leaky_relu_7_data_in;
  wire       [7:0]    leaky_relu_8_data_in;
  wire       [7:0]    leaky_relu_1_data_out;
  wire       [7:0]    leaky_relu_2_data_out;
  wire       [7:0]    leaky_relu_3_data_out;
  wire       [7:0]    leaky_relu_4_data_out;
  wire       [7:0]    leaky_relu_5_data_out;
  wire       [7:0]    leaky_relu_6_data_out;
  wire       [7:0]    leaky_relu_7_data_out;
  wire       [7:0]    leaky_relu_8_data_out;

  leaky_relu leaky_relu_1 (
    .data_in         (leaky_relu_1_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_1_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_2 (
    .data_in         (leaky_relu_2_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_2_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_3 (
    .data_in         (leaky_relu_3_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_3_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_4 (
    .data_in         (leaky_relu_4_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_4_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_5 (
    .data_in         (leaky_relu_5_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_5_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_6 (
    .data_in         (leaky_relu_6_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_6_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_7 (
    .data_in         (leaky_relu_7_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_7_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_8 (
    .data_in         (leaky_relu_8_data_in   ), //i
    .zero_data_in    (zero_point             ), //i
    .data_out        (leaky_relu_8_data_out  ), //o
    .clk             (clk                    )  //i
  );
  assign leaky_relu_1_data_in = data_in[7 : 0];
  always @(*) begin
    data_out[7 : 0] = leaky_relu_1_data_out;
    data_out[15 : 8] = leaky_relu_2_data_out;
    data_out[23 : 16] = leaky_relu_3_data_out;
    data_out[31 : 24] = leaky_relu_4_data_out;
    data_out[39 : 32] = leaky_relu_5_data_out;
    data_out[47 : 40] = leaky_relu_6_data_out;
    data_out[55 : 48] = leaky_relu_7_data_out;
    data_out[63 : 56] = leaky_relu_8_data_out;
  end

  assign leaky_relu_2_data_in = data_in[15 : 8];
  assign leaky_relu_3_data_in = data_in[23 : 16];
  assign leaky_relu_4_data_in = data_in[31 : 24];
  assign leaky_relu_5_data_in = data_in[39 : 32];
  assign leaky_relu_6_data_in = data_in[47 : 40];
  assign leaky_relu_7_data_in = data_in[55 : 48];
  assign leaky_relu_8_data_in = data_in[63 : 56];

endmodule
