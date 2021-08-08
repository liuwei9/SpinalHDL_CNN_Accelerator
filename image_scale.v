// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_scale
// Git hash  : 1384860c0036c73e3b86ea43dc3bd8aef24bc981



module image_scale (
  input      [255:0]  S_DATA,
  input      [255:0]  scale_data_in,
  output reg [255:0]  M_DATA,
  input               clk,
  input               reset
);
  wire       [31:0]   mul_8_A;
  wire       [31:0]   mul_8_B;
  wire       [31:0]   mul_9_A;
  wire       [31:0]   mul_9_B;
  wire       [31:0]   mul_10_A;
  wire       [31:0]   mul_10_B;
  wire       [31:0]   mul_11_A;
  wire       [31:0]   mul_11_B;
  wire       [31:0]   mul_12_A;
  wire       [31:0]   mul_12_B;
  wire       [31:0]   mul_13_A;
  wire       [31:0]   mul_13_B;
  wire       [31:0]   mul_14_A;
  wire       [31:0]   mul_14_B;
  wire       [31:0]   mul_15_A;
  wire       [31:0]   mul_15_B;
  wire       [63:0]   mul_8_P;
  wire       [63:0]   mul_9_P;
  wire       [63:0]   mul_10_P;
  wire       [63:0]   mul_11_P;
  wire       [63:0]   mul_12_P;
  wire       [63:0]   mul_13_P;
  wire       [63:0]   mul_14_P;
  wire       [63:0]   mul_15_P;

  mul mul_8 (
    .A        (mul_8_A  ), //i
    .B        (mul_8_B  ), //i
    .P        (mul_8_P  ), //o
    .clk      (clk      ), //i
    .reset    (reset    )  //i
  );
  mul mul_9 (
    .A        (mul_9_A  ), //i
    .B        (mul_9_B  ), //i
    .P        (mul_9_P  ), //o
    .clk      (clk      ), //i
    .reset    (reset    )  //i
  );
  mul mul_10 (
    .A        (mul_10_A  ), //i
    .B        (mul_10_B  ), //i
    .P        (mul_10_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  mul mul_11 (
    .A        (mul_11_A  ), //i
    .B        (mul_11_B  ), //i
    .P        (mul_11_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  mul mul_12 (
    .A        (mul_12_A  ), //i
    .B        (mul_12_B  ), //i
    .P        (mul_12_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  mul mul_13 (
    .A        (mul_13_A  ), //i
    .B        (mul_13_B  ), //i
    .P        (mul_13_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  mul mul_14 (
    .A        (mul_14_A  ), //i
    .B        (mul_14_B  ), //i
    .P        (mul_14_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  mul mul_15 (
    .A        (mul_15_A  ), //i
    .B        (mul_15_B  ), //i
    .P        (mul_15_P  ), //o
    .clk      (clk       ), //i
    .reset    (reset     )  //i
  );
  assign mul_8_A = S_DATA[31 : 0];
  assign mul_8_B = scale_data_in[31 : 0];
  always @(*) begin
    M_DATA[31 : 0] = mul_8_P[63 : 32];
    M_DATA[63 : 32] = mul_9_P[63 : 32];
    M_DATA[95 : 64] = mul_10_P[63 : 32];
    M_DATA[127 : 96] = mul_11_P[63 : 32];
    M_DATA[159 : 128] = mul_12_P[63 : 32];
    M_DATA[191 : 160] = mul_13_P[63 : 32];
    M_DATA[223 : 192] = mul_14_P[63 : 32];
    M_DATA[255 : 224] = mul_15_P[63 : 32];
  end

  assign mul_9_A = S_DATA[63 : 32];
  assign mul_9_B = scale_data_in[63 : 32];
  assign mul_10_A = S_DATA[95 : 64];
  assign mul_10_B = scale_data_in[95 : 64];
  assign mul_11_A = S_DATA[127 : 96];
  assign mul_11_B = scale_data_in[127 : 96];
  assign mul_12_A = S_DATA[159 : 128];
  assign mul_12_B = scale_data_in[159 : 128];
  assign mul_13_A = S_DATA[191 : 160];
  assign mul_13_B = scale_data_in[191 : 160];
  assign mul_14_A = S_DATA[223 : 192];
  assign mul_14_B = scale_data_in[223 : 192];
  assign mul_15_A = S_DATA[255 : 224];
  assign mul_15_B = scale_data_in[255 : 224];

endmodule

//mul replaced by mul

//mul replaced by mul

//mul replaced by mul

//mul replaced by mul

//mul replaced by mul

//mul replaced by mul

//mul replaced by mul

module mul (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [63:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [31:0]   A_q;
  (* use_dsp = "yes" *) wire       [31:0]   B_q;
  (* use_dsp = "yes" *) reg        [31:0]   A_qq;
  (* use_dsp = "yes" *) reg        [31:0]   B_qq;
  (* use_dsp = "yes" *) reg        [63:0]   P_q;
  (* use_dsp = "yes" *) reg        [63:0]   P_qq;

  assign A_q = A;
  assign B_q = B;
  assign P = P_qq;
  always @(posedge clk) begin
    A_qq <= A_q;
    B_qq <= B_q;
    P_q <= (A_qq * B_qq);
    P_qq <= P_q;
  end


endmodule
