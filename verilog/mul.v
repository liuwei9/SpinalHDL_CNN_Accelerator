// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul
// Git hash  : d32cde3db027d89428574702988f88c1cdde3b16
// Date      : 16/09/2021, 21:40:13


module mul (
  input      [10:0]   A,
  input      [6:0]    B,
  output     [10:0]   P,
  input               clk,
  input               reset
);
  wire       [17:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [10:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [6:0]    _zz_P_1;
  (* use_dsp = "yes" *) reg        [10:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [6:0]    _zz_P_3;
  (* use_dsp = "yes" *) reg        [17:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [17:0]   _zz_P_5;

  assign _zz_P_6 = _zz_P_5;
  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_6[10:0];
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule
