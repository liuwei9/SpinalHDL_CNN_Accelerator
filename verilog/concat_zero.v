// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : concat_zero
// Git hash  : 0e6a3ebbe013921c1c094a4a70c6b764aaf2f29f


module concat_zero (
  input      [255:0]  data_in,
  input      [31:0]   zero,
  output reg [255:0]  data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   add_simd_16_A;
  wire       [31:0]   add_simd_17_A;
  wire       [31:0]   add_simd_18_A;
  wire       [31:0]   add_simd_19_A;
  wire       [31:0]   add_simd_20_A;
  wire       [31:0]   add_simd_21_A;
  wire       [31:0]   add_simd_22_A;
  wire       [31:0]   add_simd_23_A;
  wire       [31:0]   add_simd_16_P;
  wire       [31:0]   add_simd_17_P;
  wire       [31:0]   add_simd_18_P;
  wire       [31:0]   add_simd_19_P;
  wire       [31:0]   add_simd_20_P;
  wire       [31:0]   add_simd_21_P;
  wire       [31:0]   add_simd_22_P;
  wire       [31:0]   add_simd_23_P;

  add_simd add_simd_16 (
    .A        (add_simd_16_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_16_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_17 (
    .A        (add_simd_17_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_17_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_18 (
    .A        (add_simd_18_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_18_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_19 (
    .A        (add_simd_19_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_19_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_20 (
    .A        (add_simd_20_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_20_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_21 (
    .A        (add_simd_21_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_21_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_22 (
    .A        (add_simd_22_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_22_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  add_simd add_simd_23 (
    .A        (add_simd_23_A  ), //i
    .B        (zero           ), //i
    .P        (add_simd_23_P  ), //o
    .clk      (clk            ), //i
    .reset    (reset          )  //i
  );
  assign add_simd_16_A = data_in[31 : 0];
  always @(*) begin
    data_out[31 : 0] = add_simd_16_P;
    data_out[63 : 32] = add_simd_17_P;
    data_out[95 : 64] = add_simd_18_P;
    data_out[127 : 96] = add_simd_19_P;
    data_out[159 : 128] = add_simd_20_P;
    data_out[191 : 160] = add_simd_21_P;
    data_out[223 : 192] = add_simd_22_P;
    data_out[255 : 224] = add_simd_23_P;
  end

  assign add_simd_17_A = data_in[63 : 32];
  assign add_simd_18_A = data_in[95 : 64];
  assign add_simd_19_A = data_in[127 : 96];
  assign add_simd_20_A = data_in[159 : 128];
  assign add_simd_21_A = data_in[191 : 160];
  assign add_simd_22_A = data_in[223 : 192];
  assign add_simd_23_A = data_in[255 : 224];

endmodule
