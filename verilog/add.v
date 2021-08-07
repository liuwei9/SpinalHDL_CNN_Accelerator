// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add
// Git hash  : 627187c3e57e5afa461430fb3119888a5e0edda4
// Date      : 06/08/2021, 19:31:58


module add (
  input      [19:0]   A,
  input      [19:0]   B,
  output     [19:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [19:0]   A_q;
  (* use_dsp = "yes" *) wire       [19:0]   B_q;
  (* use_dsp = "yes" *) reg        [19:0]   A_qq;
  (* use_dsp = "yes" *) reg        [19:0]   B_qq;
  (* use_dsp = "yes" *) reg        [19:0]   P_q;

  assign A_q = A;
  assign B_q = B;
  assign P = P_q;
  always @(posedge clk) begin
    A_qq <= A_q;
    B_qq <= B_q;
    P_q <= ($signed(A_qq) + $signed(B_qq));
  end


endmodule
