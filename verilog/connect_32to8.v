// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : connect_32to8
// Git hash  : 0e6a3ebbe013921c1c094a4a70c6b764aaf2f29f


module connect_32to8 (
  input      [255:0]  data_in,
  output reg [63:0]   data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_data_out;
  reg        [7:0]    _zz_data_out_1;
  wire                when_connect_32to8_l17;
  wire                when_connect_32to8_l19;
  wire       [31:0]   _zz_data_out_2;
  reg        [7:0]    _zz_data_out_3;
  wire                when_connect_32to8_l17_1;
  wire                when_connect_32to8_l19_1;
  wire       [31:0]   _zz_data_out_4;
  reg        [7:0]    _zz_data_out_5;
  wire                when_connect_32to8_l17_2;
  wire                when_connect_32to8_l19_2;
  wire       [31:0]   _zz_data_out_6;
  reg        [7:0]    _zz_data_out_7;
  wire                when_connect_32to8_l17_3;
  wire                when_connect_32to8_l19_3;
  wire       [31:0]   _zz_data_out_8;
  reg        [7:0]    _zz_data_out_9;
  wire                when_connect_32to8_l17_4;
  wire                when_connect_32to8_l19_4;
  wire       [31:0]   _zz_data_out_10;
  reg        [7:0]    _zz_data_out_11;
  wire                when_connect_32to8_l17_5;
  wire                when_connect_32to8_l19_5;
  wire       [31:0]   _zz_data_out_12;
  reg        [7:0]    _zz_data_out_13;
  wire                when_connect_32to8_l17_6;
  wire                when_connect_32to8_l19_6;
  wire       [31:0]   _zz_data_out_14;
  reg        [7:0]    _zz_data_out_15;
  wire                when_connect_32to8_l17_7;
  wire                when_connect_32to8_l19_7;

  assign _zz_data_out = data_in[31 : 0];
  assign when_connect_32to8_l17 = _zz_data_out[31];
  assign when_connect_32to8_l19 = (_zz_data_out[30 : 8] != 23'h0);
  always @(*) begin
    data_out[7 : 0] = _zz_data_out_1;
    data_out[15 : 8] = _zz_data_out_3;
    data_out[23 : 16] = _zz_data_out_5;
    data_out[31 : 24] = _zz_data_out_7;
    data_out[39 : 32] = _zz_data_out_9;
    data_out[47 : 40] = _zz_data_out_11;
    data_out[55 : 48] = _zz_data_out_13;
    data_out[63 : 56] = _zz_data_out_15;
  end

  assign _zz_data_out_2 = data_in[63 : 32];
  assign when_connect_32to8_l17_1 = _zz_data_out_2[31];
  assign when_connect_32to8_l19_1 = (_zz_data_out_2[30 : 8] != 23'h0);
  assign _zz_data_out_4 = data_in[95 : 64];
  assign when_connect_32to8_l17_2 = _zz_data_out_4[31];
  assign when_connect_32to8_l19_2 = (_zz_data_out_4[30 : 8] != 23'h0);
  assign _zz_data_out_6 = data_in[127 : 96];
  assign when_connect_32to8_l17_3 = _zz_data_out_6[31];
  assign when_connect_32to8_l19_3 = (_zz_data_out_6[30 : 8] != 23'h0);
  assign _zz_data_out_8 = data_in[159 : 128];
  assign when_connect_32to8_l17_4 = _zz_data_out_8[31];
  assign when_connect_32to8_l19_4 = (_zz_data_out_8[30 : 8] != 23'h0);
  assign _zz_data_out_10 = data_in[191 : 160];
  assign when_connect_32to8_l17_5 = _zz_data_out_10[31];
  assign when_connect_32to8_l19_5 = (_zz_data_out_10[30 : 8] != 23'h0);
  assign _zz_data_out_12 = data_in[223 : 192];
  assign when_connect_32to8_l17_6 = _zz_data_out_12[31];
  assign when_connect_32to8_l19_6 = (_zz_data_out_12[30 : 8] != 23'h0);
  assign _zz_data_out_14 = data_in[255 : 224];
  assign when_connect_32to8_l17_7 = _zz_data_out_14[31];
  assign when_connect_32to8_l19_7 = (_zz_data_out_14[30 : 8] != 23'h0);
  always @(posedge clk) begin
    if(when_connect_32to8_l17) begin
      _zz_data_out_1 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19) begin
        _zz_data_out_1 <= 8'hff;
      end else begin
        _zz_data_out_1 <= _zz_data_out[7 : 0];
      end
    end
    if(when_connect_32to8_l17_1) begin
      _zz_data_out_3 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_1) begin
        _zz_data_out_3 <= 8'hff;
      end else begin
        _zz_data_out_3 <= _zz_data_out_2[7 : 0];
      end
    end
    if(when_connect_32to8_l17_2) begin
      _zz_data_out_5 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_2) begin
        _zz_data_out_5 <= 8'hff;
      end else begin
        _zz_data_out_5 <= _zz_data_out_4[7 : 0];
      end
    end
    if(when_connect_32to8_l17_3) begin
      _zz_data_out_7 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_3) begin
        _zz_data_out_7 <= 8'hff;
      end else begin
        _zz_data_out_7 <= _zz_data_out_6[7 : 0];
      end
    end
    if(when_connect_32to8_l17_4) begin
      _zz_data_out_9 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_4) begin
        _zz_data_out_9 <= 8'hff;
      end else begin
        _zz_data_out_9 <= _zz_data_out_8[7 : 0];
      end
    end
    if(when_connect_32to8_l17_5) begin
      _zz_data_out_11 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_5) begin
        _zz_data_out_11 <= 8'hff;
      end else begin
        _zz_data_out_11 <= _zz_data_out_10[7 : 0];
      end
    end
    if(when_connect_32to8_l17_6) begin
      _zz_data_out_13 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_6) begin
        _zz_data_out_13 <= 8'hff;
      end else begin
        _zz_data_out_13 <= _zz_data_out_12[7 : 0];
      end
    end
    if(when_connect_32to8_l17_7) begin
      _zz_data_out_15 <= 8'h0;
    end else begin
      if(when_connect_32to8_l19_7) begin
        _zz_data_out_15 <= 8'hff;
      end else begin
        _zz_data_out_15 <= _zz_data_out_14[7 : 0];
      end
    end
  end


endmodule
