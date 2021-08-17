// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_leaky_relu
// Git hash  : 27666a2ca9cd05f729dd3f96470cda679b8843ec
// Date      : 17/08/2021, 15:19:16


module image_leaky_relu (
  input      [63:0]   data_in,
  input      [7:0]    zero_data_in,
  output reg [63:0]   data_out,
  input               clk
);
  wire       [7:0]    leaky_relu_8_data_in;
  wire       [7:0]    leaky_relu_9_data_in;
  wire       [7:0]    leaky_relu_10_data_in;
  wire       [7:0]    leaky_relu_11_data_in;
  wire       [7:0]    leaky_relu_12_data_in;
  wire       [7:0]    leaky_relu_13_data_in;
  wire       [7:0]    leaky_relu_14_data_in;
  wire       [7:0]    leaky_relu_15_data_in;
  wire       [7:0]    leaky_relu_8_data_out;
  wire       [7:0]    leaky_relu_9_data_out;
  wire       [7:0]    leaky_relu_10_data_out;
  wire       [7:0]    leaky_relu_11_data_out;
  wire       [7:0]    leaky_relu_12_data_out;
  wire       [7:0]    leaky_relu_13_data_out;
  wire       [7:0]    leaky_relu_14_data_out;
  wire       [7:0]    leaky_relu_15_data_out;

  leaky_relu leaky_relu_8 (
    .data_in         (leaky_relu_8_data_in   ), //i
    .zero_data_in    (zero_data_in           ), //i
    .data_out        (leaky_relu_8_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_9 (
    .data_in         (leaky_relu_9_data_in   ), //i
    .zero_data_in    (zero_data_in           ), //i
    .data_out        (leaky_relu_9_data_out  ), //o
    .clk             (clk                    )  //i
  );
  leaky_relu leaky_relu_10 (
    .data_in         (leaky_relu_10_data_in   ), //i
    .zero_data_in    (zero_data_in            ), //i
    .data_out        (leaky_relu_10_data_out  ), //o
    .clk             (clk                     )  //i
  );
  leaky_relu leaky_relu_11 (
    .data_in         (leaky_relu_11_data_in   ), //i
    .zero_data_in    (zero_data_in            ), //i
    .data_out        (leaky_relu_11_data_out  ), //o
    .clk             (clk                     )  //i
  );
  leaky_relu leaky_relu_12 (
    .data_in         (leaky_relu_12_data_in   ), //i
    .zero_data_in    (zero_data_in            ), //i
    .data_out        (leaky_relu_12_data_out  ), //o
    .clk             (clk                     )  //i
  );
  leaky_relu leaky_relu_13 (
    .data_in         (leaky_relu_13_data_in   ), //i
    .zero_data_in    (zero_data_in            ), //i
    .data_out        (leaky_relu_13_data_out  ), //o
    .clk             (clk                     )  //i
  );
  leaky_relu leaky_relu_14 (
    .data_in         (leaky_relu_14_data_in   ), //i
    .zero_data_in    (zero_data_in            ), //i
    .data_out        (leaky_relu_14_data_out  ), //o
    .clk             (clk                     )  //i
  );
  leaky_relu leaky_relu_15 (
    .data_in         (leaky_relu_15_data_in   ), //i
    .zero_data_in    (zero_data_in            ), //i
    .data_out        (leaky_relu_15_data_out  ), //o
    .clk             (clk                     )  //i
  );
  assign leaky_relu_8_data_in = data_in[7 : 0];
  always @(*) begin
    data_out[7 : 0] = leaky_relu_8_data_out;
    data_out[15 : 8] = leaky_relu_9_data_out;
    data_out[23 : 16] = leaky_relu_10_data_out;
    data_out[31 : 24] = leaky_relu_11_data_out;
    data_out[39 : 32] = leaky_relu_12_data_out;
    data_out[47 : 40] = leaky_relu_13_data_out;
    data_out[55 : 48] = leaky_relu_14_data_out;
    data_out[63 : 56] = leaky_relu_15_data_out;
  end

  assign leaky_relu_9_data_in = data_in[15 : 8];
  assign leaky_relu_10_data_in = data_in[23 : 16];
  assign leaky_relu_11_data_in = data_in[31 : 24];
  assign leaky_relu_12_data_in = data_in[39 : 32];
  assign leaky_relu_13_data_in = data_in[47 : 40];
  assign leaky_relu_14_data_in = data_in[55 : 48];
  assign leaky_relu_15_data_in = data_in[63 : 56];

endmodule
