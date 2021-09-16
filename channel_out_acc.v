// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : channel_out_acc
// Git hash  : efc1c477d46adc8af190bd5f1fd3546169f4e71c



module channel_out_acc (
  input      [31:0]   data_in,
  output reg [31:0]   data_out,
  input               First_Compute_Complete,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_data_out;

  assign _zz_data_out = (data_out + data_in);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      data_out <= 32'h0;
    end else begin
      if(First_Compute_Complete) begin
        data_out <= data_in;
      end else begin
        data_out <= _zz_data_out;
      end
    end
  end


endmodule
