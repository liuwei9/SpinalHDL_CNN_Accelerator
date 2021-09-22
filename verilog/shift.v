// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : shift
// Git hash  : 038b51e1758bac70ab39881905296db1cc09842a
// Date      : 22/09/2021, 16:16:35


module shift (
  input      [31:0]   shift_data_in,
  input      [31:0]   data_in,
  output reg [15:0]   data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_data_out_temp;
  wire       [15:0]   _zz_data_out;
  wire       [14:0]   _zz_data_out_1;
  wire       [14:0]   _zz_data_out_2;
  wire       [31:0]   data_out_temp;
  wire                when_shift_l15;

  assign _zz_data_out_temp = data_in;
  assign _zz_data_out = ({data_out_temp[31],_zz_data_out_1} + 16'h0001);
  assign _zz_data_out_1 = data_out_temp[15 : 1];
  assign _zz_data_out_2 = data_out_temp[15 : 1];
  assign data_out_temp = ($signed(_zz_data_out_temp) >>> shift_data_in);
  assign when_shift_l15 = (data_out_temp[0] == 1'b1);
  always @(posedge clk) begin
    if(when_shift_l15) begin
      data_out <= _zz_data_out;
    end else begin
      data_out <= {data_out_temp[31],_zz_data_out_2};
    end
  end


endmodule
