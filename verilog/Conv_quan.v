// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_quan
// Git hash  : 9280a3666f54ba2ee3d8bf18d251133191d332e6
// Date      : 21/09/2021, 23:40:46


module Conv_quan (
  input               Strat,
  input               S_DATA_valid,
  output              S_DATA_ready,
  input      [255:0]  S_DATA_payload,
  input      [255:0]  bias_data_in,
  input      [255:0]  scale_data_in,
  input      [255:0]  shift_data_in,
  input      [7:0]    Zero_Point_REG3,
  output     [7:0]    bias_addrb,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output     [63:0]   M_DATA_payload,
  input      [10:0]   Row_Num_Out_REG,
  input      [9:0]    Channel_Out_Num_REG,
  input               reset,
  input               clk
);
  wire       [7:0]    quan_ctrl_bias_addrb;
  wire                quan_ctrl_EN_Rd_Fifo;
  wire                quan_ctrl_M_Valid;
  wire       [10:0]   quan_ctrl_S_Count_Fifo;
  wire                bias_S_DATA_ready;
  wire                bias_fifo_ready;
  wire       [255:0]  bias_M_Data;
  wire       [255:0]  scale_M_Data;
  wire       [127:0]  shift_8_data_out;
  wire       [63:0]   zero_data_out;
  wire       [63:0]   leaky_data_out;
  reg        [255:0]  scale_data_in_delay_1;
  reg        [255:0]  scale_data_in_delay_2;
  reg        [255:0]  shift_data_in_delay_1;
  reg        [255:0]  shift_data_in_delay_2;
  reg        [255:0]  shift_data_in_delay_3;
  reg        [255:0]  shift_data_in_delay_4;
  reg        [255:0]  shift_data_in_delay_5;

  Conv_quan_ctrl quan_ctrl (
    .Start                  (Strat                   ), //i
    .bias_addrb             (quan_ctrl_bias_addrb    ), //o
    .EN_Rd_Fifo             (quan_ctrl_EN_Rd_Fifo    ), //o
    .Fifo_Ready             (bias_fifo_ready         ), //i
    .M_Ready                (M_DATA_ready            ), //i
    .M_Valid                (quan_ctrl_M_Valid       ), //o
    .Row_Num_Out_REG        (Row_Num_Out_REG         ), //i
    .Channel_Out_Num_REG    (Channel_Out_Num_REG     ), //i
    .S_Count_Fifo           (quan_ctrl_S_Count_Fifo  ), //o
    .clk                    (clk                     ), //i
    .reset                  (reset                   )  //i
  );
  Conv_Bias bias (
    .S_DATA_valid           (S_DATA_valid            ), //i
    .S_DATA_ready           (bias_S_DATA_ready       ), //o
    .S_DATA_payload         (S_DATA_payload          ), //i
    .fifo_ready             (bias_fifo_ready         ), //o
    .rd_en_fifo             (quan_ctrl_EN_Rd_Fifo    ), //i
    .bias_data_in           (bias_data_in            ), //i
    .M_Data                 (bias_M_Data             ), //o
    .Channel_Out_Num_REG    (Channel_Out_Num_REG     ), //i
    .S_Count_Fifo           (quan_ctrl_S_Count_Fifo  ), //i
    .reset                  (reset                   ), //i
    .clk                    (clk                     )  //i
  );
  Conv_scale scale (
    .S_Data           (bias_M_Data            ), //i
    .Scale_Data_In    (scale_data_in_delay_2  ), //i
    .M_Data           (scale_M_Data           ), //o
    .clk              (clk                    )  //i
  );
  Conv_shift shift_8 (
    .shift_data_in    (shift_data_in_delay_5  ), //i
    .data_in          (scale_M_Data           ), //i
    .data_out         (shift_8_data_out       ), //o
    .clk              (clk                    ), //i
    .reset            (reset                  )  //i
  );
  Conv_zero zero (
    .data_in         (shift_8_data_out  ), //i
    .zero_data_in    (Zero_Point_REG3   ), //i
    .data_out        (zero_data_out     ), //o
    .clk             (clk               )  //i
  );
  Conv_leaky_relu leaky (
    .data_in       (zero_data_out    ), //i
    .zero_point    (Zero_Point_REG3  ), //i
    .data_out      (leaky_data_out   ), //o
    .clk           (clk              )  //i
  );
  assign bias_addrb = quan_ctrl_bias_addrb;
  assign M_DATA_valid = quan_ctrl_M_Valid;
  assign S_DATA_ready = bias_S_DATA_ready;
  assign M_DATA_payload = leaky_data_out;
  always @(posedge clk) begin
    scale_data_in_delay_1 <= scale_data_in;
    scale_data_in_delay_2 <= scale_data_in_delay_1;
    shift_data_in_delay_1 <= shift_data_in;
    shift_data_in_delay_2 <= shift_data_in_delay_1;
    shift_data_in_delay_3 <= shift_data_in_delay_2;
    shift_data_in_delay_4 <= shift_data_in_delay_3;
    shift_data_in_delay_5 <= shift_data_in_delay_4;
  end


endmodule
