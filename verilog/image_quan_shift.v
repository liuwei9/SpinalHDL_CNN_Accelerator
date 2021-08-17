// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_shift
// Git hash  : 27666a2ca9cd05f729dd3f96470cda679b8843ec
// Date      : 17/08/2021, 15:19:16


module image_quan_shift (
  input      [31:0]   shift_data_in,
  input      [31:0]   data_in,
  output reg [15:0]   shift_data_out,
  input               clk,
  input               reset
);
  wire       [15:0]   _zz_shift_data_out;
  wire       [31:0]   data_out_temp;
  wire                when_image_quan_shift_l17;

  assign _zz_shift_data_out = ({data_out_temp[31],data_out_temp[15 : 1]} + 16'h0001);
  assign data_out_temp = (shift_data_in >>> data_in);
  assign when_image_quan_shift_l17 = (data_out_temp[0] == 1'b1);
  always @(posedge clk) begin
    if(reset) begin
      shift_data_out <= 16'h0;
    end else begin
      if(when_image_quan_shift_l17) begin
        shift_data_out <= _zz_shift_data_out;
      end else begin
        shift_data_out <= {data_out_temp[31],data_out_temp[15 : 1]};
      end
    end
  end


endmodule
