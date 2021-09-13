// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : image_quan_shift
// Git hash  : 3de18e70bd50589bd21035e4fb7a1c12a3bd4cfa
// Date      : 13/09/2021, 21:49:40


module image_quan_shift (
  input      [31:0]   shift_data_in,
  input      [31:0]   data_in,
  output reg [15:0]   shift_data_out,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_data_out_temp;
  wire       [15:0]   _zz_shift_data_out;
  wire       [14:0]   _zz_shift_data_out_1;
  wire       [14:0]   _zz_shift_data_out_2;
  wire       [31:0]   data_out_temp;
  wire                when_image_quan_shift_l17;

  assign _zz_data_out_temp = data_in;
  assign _zz_shift_data_out = ({data_out_temp[31],_zz_shift_data_out_1} + 16'h0001);
  assign _zz_shift_data_out_1 = data_out_temp[15 : 1];
  assign _zz_shift_data_out_2 = data_out_temp[15 : 1];
  assign data_out_temp = ($signed(_zz_data_out_temp) >>> shift_data_in);
  assign when_image_quan_shift_l17 = (data_out_temp[0] == 1'b1);
  always @(posedge clk) begin
    if(reset) begin
      shift_data_out <= 16'h0;
    end else begin
      if(when_image_quan_shift_l17) begin
        shift_data_out <= _zz_shift_data_out;
      end else begin
        shift_data_out <= {data_out_temp[31],_zz_shift_data_out_2};
      end
    end
  end


endmodule
