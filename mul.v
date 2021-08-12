// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul
// Git hash  : 1f716ebaa633331a8a58580f430a0af20bffbabd



module mul (
  input      [7:0]    A,
  input      [7:0]    B,
  output     [15:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) reg        [15:0]   P_q;
  (* use_dsp = "yes" *) reg        [15:0]   P_qq;

  assign P = P_qq;
  always @(posedge clk) begin
    P_q <= ($signed(A) * $signed(B));
    P_qq <= P_q;
  end


endmodule
