// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul
// Git hash  : 771888fb29272bd153a0d0311d54890fe226a373



module mul (
  input      [7:0]    A,
  input      [7:0]    B,
  output     [15:0]   P,
  input               clk,
  input               reset
);
  (* use_dsp = "yes" *) wire       [7:0]    _zz_P;
  (* use_dsp = "yes" *) wire       [7:0]    _zz_P_1;
  (* use_dsp = "yes" *) reg        [7:0]    _zz_P_2;
  (* use_dsp = "yes" *) reg        [7:0]    _zz_P_3;
  (* use_dsp = "yes" *) reg        [15:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [15:0]   _zz_P_5;

  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_5;
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule
