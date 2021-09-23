// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_shift
// Git hash  : 6a036d116ed8ed37e64ac312cea61447972676ed


module Conv_shift (
  input      [255:0]  shift_data_in,
  input      [255:0]  data_in,
  output reg [127:0]  data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   shift_8_shift_data_in;
  wire       [31:0]   shift_8_data_in;
  wire       [31:0]   shift_9_shift_data_in;
  wire       [31:0]   shift_9_data_in;
  wire       [31:0]   shift_10_shift_data_in;
  wire       [31:0]   shift_10_data_in;
  wire       [31:0]   shift_11_shift_data_in;
  wire       [31:0]   shift_11_data_in;
  wire       [31:0]   shift_12_shift_data_in;
  wire       [31:0]   shift_12_data_in;
  wire       [31:0]   shift_13_shift_data_in;
  wire       [31:0]   shift_13_data_in;
  wire       [31:0]   shift_14_shift_data_in;
  wire       [31:0]   shift_14_data_in;
  wire       [31:0]   shift_15_shift_data_in;
  wire       [31:0]   shift_15_data_in;
  wire       [15:0]   shift_8_data_out;
  wire       [15:0]   shift_9_data_out;
  wire       [15:0]   shift_10_data_out;
  wire       [15:0]   shift_11_data_out;
  wire       [15:0]   shift_12_data_out;
  wire       [15:0]   shift_13_data_out;
  wire       [15:0]   shift_14_data_out;
  wire       [15:0]   shift_15_data_out;

  shift shift_8 (
    .shift_data_in    (shift_8_shift_data_in  ), //i
    .data_in          (shift_8_data_in        ), //i
    .data_out         (shift_8_data_out       ), //o
    .clk              (clk                    ), //i
    .reset            (reset                  )  //i
  );
  shift shift_9 (
    .shift_data_in    (shift_9_shift_data_in  ), //i
    .data_in          (shift_9_data_in        ), //i
    .data_out         (shift_9_data_out       ), //o
    .clk              (clk                    ), //i
    .reset            (reset                  )  //i
  );
  shift shift_10 (
    .shift_data_in    (shift_10_shift_data_in  ), //i
    .data_in          (shift_10_data_in        ), //i
    .data_out         (shift_10_data_out       ), //o
    .clk              (clk                     ), //i
    .reset            (reset                   )  //i
  );
  shift shift_11 (
    .shift_data_in    (shift_11_shift_data_in  ), //i
    .data_in          (shift_11_data_in        ), //i
    .data_out         (shift_11_data_out       ), //o
    .clk              (clk                     ), //i
    .reset            (reset                   )  //i
  );
  shift shift_12 (
    .shift_data_in    (shift_12_shift_data_in  ), //i
    .data_in          (shift_12_data_in        ), //i
    .data_out         (shift_12_data_out       ), //o
    .clk              (clk                     ), //i
    .reset            (reset                   )  //i
  );
  shift shift_13 (
    .shift_data_in    (shift_13_shift_data_in  ), //i
    .data_in          (shift_13_data_in        ), //i
    .data_out         (shift_13_data_out       ), //o
    .clk              (clk                     ), //i
    .reset            (reset                   )  //i
  );
  shift shift_14 (
    .shift_data_in    (shift_14_shift_data_in  ), //i
    .data_in          (shift_14_data_in        ), //i
    .data_out         (shift_14_data_out       ), //o
    .clk              (clk                     ), //i
    .reset            (reset                   )  //i
  );
  shift shift_15 (
    .shift_data_in    (shift_15_shift_data_in  ), //i
    .data_in          (shift_15_data_in        ), //i
    .data_out         (shift_15_data_out       ), //o
    .clk              (clk                     ), //i
    .reset            (reset                   )  //i
  );
  assign shift_8_data_in = data_in[31 : 0];
  assign shift_8_shift_data_in = shift_data_in[31 : 0];
  always @(*) begin
    data_out[15 : 0] = shift_8_data_out;
    data_out[31 : 16] = shift_9_data_out;
    data_out[47 : 32] = shift_10_data_out;
    data_out[63 : 48] = shift_11_data_out;
    data_out[79 : 64] = shift_12_data_out;
    data_out[95 : 80] = shift_13_data_out;
    data_out[111 : 96] = shift_14_data_out;
    data_out[127 : 112] = shift_15_data_out;
  end

  assign shift_9_data_in = data_in[63 : 32];
  assign shift_9_shift_data_in = shift_data_in[63 : 32];
  assign shift_10_data_in = data_in[95 : 64];
  assign shift_10_shift_data_in = shift_data_in[95 : 64];
  assign shift_11_data_in = data_in[127 : 96];
  assign shift_11_shift_data_in = shift_data_in[127 : 96];
  assign shift_12_data_in = data_in[159 : 128];
  assign shift_12_shift_data_in = shift_data_in[159 : 128];
  assign shift_13_data_in = data_in[191 : 160];
  assign shift_13_shift_data_in = shift_data_in[191 : 160];
  assign shift_14_data_in = data_in[223 : 192];
  assign shift_14_shift_data_in = shift_data_in[223 : 192];
  assign shift_15_data_in = data_in[255 : 224];
  assign shift_15_shift_data_in = shift_data_in[255 : 224];

endmodule
