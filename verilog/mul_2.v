// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : mul_2
// Git hash  : 6a036d116ed8ed37e64ac312cea61447972676ed


module mul_2 (
  input      [11:0]   A,
  input      [11:0]   B,
  output     [11:0]   P,
  input               clk,
  input               reset
);
  wire       [23:0]   _zz_P_6;
  (* use_dsp = "yes" *) wire       [11:0]   _zz_P;
  (* use_dsp = "yes" *) wire       [11:0]   _zz_P_1;
  (* use_dsp = "yes" *) reg        [11:0]   _zz_P_2;
  (* use_dsp = "yes" *) reg        [11:0]   _zz_P_3;
  (* use_dsp = "yes" *) reg        [23:0]   _zz_P_4;
  (* use_dsp = "yes" *) reg        [23:0]   _zz_P_5;

  assign _zz_P_6 = _zz_P_5;
  assign _zz_P = A;
  assign _zz_P_1 = B;
  assign P = _zz_P_6[11:0];
  always @(posedge clk) begin
    _zz_P_2 <= _zz_P;
    _zz_P_3 <= _zz_P_1;
    _zz_P_4 <= (_zz_P_2 * _zz_P_3);
    _zz_P_5 <= _zz_P_4;
  end


endmodule
