// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul
// Git hash  : bc062f697134f4961659217c1401f6128ee86f11



module mul (
  input      [7:0]    A,
  input      [7:0]    B,
  output     [15:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [7:0]    A_q;
  (* use_dsp = "yes" *) wire       [7:0]    B_q;
  (* use_dsp = "yes" *) reg        [7:0]    A_qq;
  (* use_dsp = "yes" *) reg        [7:0]    B_qq;
  (* use_dsp = "yes" *) reg        [15:0]   P_q;
  (* use_dsp = "yes" *) reg        [15:0]   P_qq;

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
