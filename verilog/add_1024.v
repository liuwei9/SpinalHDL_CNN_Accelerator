// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : add_1024
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:41


module add_1024 (
  input      [31:0]   A,
  input      [31:0]   B,
  output     [31:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [31:0]   A_q;
  (* use_dsp = "yes" *) wire       [31:0]   B_q;
  (* use_dsp = "yes" *) reg        [31:0]   A_qq;
  (* use_dsp = "yes" *) reg        [31:0]   B_qq;
  (* use_dsp = "yes" *) reg        [31:0]   P_q;

  assign A_q = A;
  assign B_q = B;
  assign P = P_q;
  always @(posedge clk) begin
    A_qq <= A_q;
    B_qq <= B_q;
    P_q <= ($signed(A_qq) + $signed(B_qq));
  end


endmodule
