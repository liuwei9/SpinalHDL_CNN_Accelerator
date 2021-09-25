// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Conv_Norm
// Git hash  : 568b368e2ab1f99c683b6cc582c6fa980adb3c3c


`define fsm_enumDefinition_binary_sequential_type [2:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 3'b000
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 3'b001
`define fsm_enumDefinition_binary_sequential_fsm_Wait 3'b010
`define fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo 3'b011
`define fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo 3'b100
`define fsm_enumDefinition_binary_sequential_fsm_Compute 3'b101
`define fsm_enumDefinition_binary_sequential_fsm_Judge_Row 3'b110

`define fsm_enumDefinition_1_binary_sequential_type [2:0]
`define fsm_enumDefinition_1_binary_sequential_fsm_BOOT 3'b000
`define fsm_enumDefinition_1_binary_sequential_fsm_IDLE 3'b001
`define fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight 3'b010
`define fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias 3'b011
`define fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale 3'b100
`define fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift 3'b101


module Conv_Norm (
  input               Start_Cu,
  input               Start_Pa,
  input               para_data_valid,
  output              para_data_ready,
  input      [63:0]   para_data_payload,
  output              Write_Block_Complete,
  output              Compute_Complete,
  input      [63:0]   S_DATA,
  input      [0:0]    S_DATA_Valid,
  output              S_DATA_Ready,
  output              M_DATA_valid,
  input               M_DATA_ready,
  output reg [255:0]  M_DATA_payload,
  input      [11:0]   Row_Num_Out_REG,
  input      [11:0]   RowNum_After_Padding,
  input      [9:0]    Channel_In_Num_REG,
  input      [9:0]    Channel_Out_Num_REG,
  input      [14:0]   Weight_Single_Num_REG,
  input      [7:0]    Bias_Num_REG,
  input      [7:0]    Bias_Addrb,
  output     [255:0]  Data_Out_Bias,
  output     [255:0]  Data_Out_Scale,
  output     [255:0]  Data_Out_Shift,
  input               clk,
  input               reset
);
  wire       [11:0]   compute_ctrl_1_COMPUTE_TIMES_CHANNEL_IN_REG;
  wire       [11:0]   compute_ctrl_1_COMPUTE_TIMES_CHANNEL_IN_REG_8;
  wire       [11:0]   compute_ctrl_1_COMPUTE_TIMES_CHANNEL_OUT_REG;
  wire       [63:0]   general_fifo_sync_1_data_in;
  wire                general_fifo_sync_1_wr_en;
  wire       [11:0]   general_fifo_sync_1_m_data_count;
  wire       [11:0]   general_fifo_sync_1_s_data_count;
  wire       [0:0]    Configurable_RAM_Norm_wea;
  wire       [7:0]    mul_add_simd_256_weightIn;
  wire       [7:0]    mul_add_simd_257_weightIn;
  wire       [7:0]    mul_add_simd_258_weightIn;
  wire       [7:0]    mul_add_simd_259_weightIn;
  wire       [7:0]    mul_add_simd_260_weightIn;
  wire       [7:0]    mul_add_simd_261_weightIn;
  wire       [7:0]    mul_add_simd_262_weightIn;
  wire       [7:0]    mul_add_simd_263_weightIn;
  wire       [7:0]    mul_add_simd_264_weightIn;
  wire       [7:0]    mul_add_simd_265_weightIn;
  wire       [7:0]    mul_add_simd_266_weightIn;
  wire       [7:0]    mul_add_simd_267_weightIn;
  wire       [7:0]    mul_add_simd_268_weightIn;
  wire       [7:0]    mul_add_simd_269_weightIn;
  wire       [7:0]    mul_add_simd_270_weightIn;
  wire       [7:0]    mul_add_simd_271_weightIn;
  wire       [7:0]    mul_add_simd_272_weightIn;
  wire       [7:0]    mul_add_simd_273_weightIn;
  wire       [7:0]    mul_add_simd_274_weightIn;
  wire       [7:0]    mul_add_simd_275_weightIn;
  wire       [7:0]    mul_add_simd_276_weightIn;
  wire       [7:0]    mul_add_simd_277_weightIn;
  wire       [7:0]    mul_add_simd_278_weightIn;
  wire       [7:0]    mul_add_simd_279_weightIn;
  wire       [7:0]    mul_add_simd_280_weightIn;
  wire       [7:0]    mul_add_simd_281_weightIn;
  wire       [7:0]    mul_add_simd_282_weightIn;
  wire       [7:0]    mul_add_simd_283_weightIn;
  wire       [7:0]    mul_add_simd_284_weightIn;
  wire       [7:0]    mul_add_simd_285_weightIn;
  wire       [7:0]    mul_add_simd_286_weightIn;
  wire       [7:0]    mul_add_simd_287_weightIn;
  wire       [7:0]    mul_add_simd_288_weightIn;
  wire       [7:0]    mul_add_simd_289_weightIn;
  wire       [7:0]    mul_add_simd_290_weightIn;
  wire       [7:0]    mul_add_simd_291_weightIn;
  wire       [7:0]    mul_add_simd_292_weightIn;
  wire       [7:0]    mul_add_simd_293_weightIn;
  wire       [7:0]    mul_add_simd_294_weightIn;
  wire       [7:0]    mul_add_simd_295_weightIn;
  wire       [7:0]    mul_add_simd_296_weightIn;
  wire       [7:0]    mul_add_simd_297_weightIn;
  wire       [7:0]    mul_add_simd_298_weightIn;
  wire       [7:0]    mul_add_simd_299_weightIn;
  wire       [7:0]    mul_add_simd_300_weightIn;
  wire       [7:0]    mul_add_simd_301_weightIn;
  wire       [7:0]    mul_add_simd_302_weightIn;
  wire       [7:0]    mul_add_simd_303_weightIn;
  wire       [7:0]    mul_add_simd_304_weightIn;
  wire       [7:0]    mul_add_simd_305_weightIn;
  wire       [7:0]    mul_add_simd_306_weightIn;
  wire       [7:0]    mul_add_simd_307_weightIn;
  wire       [7:0]    mul_add_simd_308_weightIn;
  wire       [7:0]    mul_add_simd_309_weightIn;
  wire       [7:0]    mul_add_simd_310_weightIn;
  wire       [7:0]    mul_add_simd_311_weightIn;
  wire       [7:0]    mul_add_simd_312_weightIn;
  wire       [7:0]    mul_add_simd_313_weightIn;
  wire       [7:0]    mul_add_simd_314_weightIn;
  wire       [7:0]    mul_add_simd_315_weightIn;
  wire       [7:0]    mul_add_simd_316_weightIn;
  wire       [7:0]    mul_add_simd_317_weightIn;
  wire       [7:0]    mul_add_simd_318_weightIn;
  wire       [7:0]    mul_add_simd_319_weightIn;
  wire       [7:0]    mul_add_simd_320_weightIn;
  wire       [7:0]    mul_add_simd_321_weightIn;
  wire       [7:0]    mul_add_simd_322_weightIn;
  wire       [7:0]    mul_add_simd_323_weightIn;
  wire       [7:0]    mul_add_simd_324_weightIn;
  wire       [7:0]    mul_add_simd_325_weightIn;
  wire       [7:0]    mul_add_simd_326_weightIn;
  wire       [7:0]    mul_add_simd_327_weightIn;
  wire       [7:0]    mul_add_simd_328_weightIn;
  wire       [7:0]    mul_add_simd_329_weightIn;
  wire       [7:0]    mul_add_simd_330_weightIn;
  wire       [7:0]    mul_add_simd_331_weightIn;
  wire       [7:0]    mul_add_simd_332_weightIn;
  wire       [7:0]    mul_add_simd_333_weightIn;
  wire       [7:0]    mul_add_simd_334_weightIn;
  wire       [7:0]    mul_add_simd_335_weightIn;
  wire       [7:0]    mul_add_simd_336_weightIn;
  wire       [7:0]    mul_add_simd_337_weightIn;
  wire       [7:0]    mul_add_simd_338_weightIn;
  wire       [7:0]    mul_add_simd_339_weightIn;
  wire       [7:0]    mul_add_simd_340_weightIn;
  wire       [7:0]    mul_add_simd_341_weightIn;
  wire       [7:0]    mul_add_simd_342_weightIn;
  wire       [7:0]    mul_add_simd_343_weightIn;
  wire       [7:0]    mul_add_simd_344_weightIn;
  wire       [7:0]    mul_add_simd_345_weightIn;
  wire       [7:0]    mul_add_simd_346_weightIn;
  wire       [7:0]    mul_add_simd_347_weightIn;
  wire       [7:0]    mul_add_simd_348_weightIn;
  wire       [7:0]    mul_add_simd_349_weightIn;
  wire       [7:0]    mul_add_simd_350_weightIn;
  wire       [7:0]    mul_add_simd_351_weightIn;
  wire       [7:0]    mul_add_simd_352_weightIn;
  wire       [7:0]    mul_add_simd_353_weightIn;
  wire       [7:0]    mul_add_simd_354_weightIn;
  wire       [7:0]    mul_add_simd_355_weightIn;
  wire       [7:0]    mul_add_simd_356_weightIn;
  wire       [7:0]    mul_add_simd_357_weightIn;
  wire       [7:0]    mul_add_simd_358_weightIn;
  wire       [7:0]    mul_add_simd_359_weightIn;
  wire       [7:0]    mul_add_simd_360_weightIn;
  wire       [7:0]    mul_add_simd_361_weightIn;
  wire       [7:0]    mul_add_simd_362_weightIn;
  wire       [7:0]    mul_add_simd_363_weightIn;
  wire       [7:0]    mul_add_simd_364_weightIn;
  wire       [7:0]    mul_add_simd_365_weightIn;
  wire       [7:0]    mul_add_simd_366_weightIn;
  wire       [7:0]    mul_add_simd_367_weightIn;
  wire       [7:0]    mul_add_simd_368_weightIn;
  wire       [7:0]    mul_add_simd_369_weightIn;
  wire       [7:0]    mul_add_simd_370_weightIn;
  wire       [7:0]    mul_add_simd_371_weightIn;
  wire       [7:0]    mul_add_simd_372_weightIn;
  wire       [7:0]    mul_add_simd_373_weightIn;
  wire       [7:0]    mul_add_simd_374_weightIn;
  wire       [7:0]    mul_add_simd_375_weightIn;
  wire       [7:0]    mul_add_simd_376_weightIn;
  wire       [7:0]    mul_add_simd_377_weightIn;
  wire       [7:0]    mul_add_simd_378_weightIn;
  wire       [7:0]    mul_add_simd_379_weightIn;
  wire       [7:0]    mul_add_simd_380_weightIn;
  wire       [7:0]    mul_add_simd_381_weightIn;
  wire       [7:0]    mul_add_simd_382_weightIn;
  wire       [7:0]    mul_add_simd_383_weightIn;
  wire       [7:0]    mul_add_simd_384_weightIn;
  wire       [7:0]    mul_add_simd_385_weightIn;
  wire       [7:0]    mul_add_simd_386_weightIn;
  wire       [7:0]    mul_add_simd_387_weightIn;
  wire       [7:0]    mul_add_simd_388_weightIn;
  wire       [7:0]    mul_add_simd_389_weightIn;
  wire       [7:0]    mul_add_simd_390_weightIn;
  wire       [7:0]    mul_add_simd_391_weightIn;
  wire       [7:0]    mul_add_simd_392_weightIn;
  wire       [7:0]    mul_add_simd_393_weightIn;
  wire       [7:0]    mul_add_simd_394_weightIn;
  wire       [7:0]    mul_add_simd_395_weightIn;
  wire       [7:0]    mul_add_simd_396_weightIn;
  wire       [7:0]    mul_add_simd_397_weightIn;
  wire       [7:0]    mul_add_simd_398_weightIn;
  wire       [7:0]    mul_add_simd_399_weightIn;
  wire       [7:0]    mul_add_simd_400_weightIn;
  wire       [7:0]    mul_add_simd_401_weightIn;
  wire       [7:0]    mul_add_simd_402_weightIn;
  wire       [7:0]    mul_add_simd_403_weightIn;
  wire       [7:0]    mul_add_simd_404_weightIn;
  wire       [7:0]    mul_add_simd_405_weightIn;
  wire       [7:0]    mul_add_simd_406_weightIn;
  wire       [7:0]    mul_add_simd_407_weightIn;
  wire       [7:0]    mul_add_simd_408_weightIn;
  wire       [7:0]    mul_add_simd_409_weightIn;
  wire       [7:0]    mul_add_simd_410_weightIn;
  wire       [7:0]    mul_add_simd_411_weightIn;
  wire       [7:0]    mul_add_simd_412_weightIn;
  wire       [7:0]    mul_add_simd_413_weightIn;
  wire       [7:0]    mul_add_simd_414_weightIn;
  wire       [7:0]    mul_add_simd_415_weightIn;
  wire       [7:0]    mul_add_simd_416_weightIn;
  wire       [7:0]    mul_add_simd_417_weightIn;
  wire       [7:0]    mul_add_simd_418_weightIn;
  wire       [7:0]    mul_add_simd_419_weightIn;
  wire       [7:0]    mul_add_simd_420_weightIn;
  wire       [7:0]    mul_add_simd_421_weightIn;
  wire       [7:0]    mul_add_simd_422_weightIn;
  wire       [7:0]    mul_add_simd_423_weightIn;
  wire       [7:0]    mul_add_simd_424_weightIn;
  wire       [7:0]    mul_add_simd_425_weightIn;
  wire       [7:0]    mul_add_simd_426_weightIn;
  wire       [7:0]    mul_add_simd_427_weightIn;
  wire       [7:0]    mul_add_simd_428_weightIn;
  wire       [7:0]    mul_add_simd_429_weightIn;
  wire       [7:0]    mul_add_simd_430_weightIn;
  wire       [7:0]    mul_add_simd_431_weightIn;
  wire       [7:0]    mul_add_simd_432_weightIn;
  wire       [7:0]    mul_add_simd_433_weightIn;
  wire       [7:0]    mul_add_simd_434_weightIn;
  wire       [7:0]    mul_add_simd_435_weightIn;
  wire       [7:0]    mul_add_simd_436_weightIn;
  wire       [7:0]    mul_add_simd_437_weightIn;
  wire       [7:0]    mul_add_simd_438_weightIn;
  wire       [7:0]    mul_add_simd_439_weightIn;
  wire       [7:0]    mul_add_simd_440_weightIn;
  wire       [7:0]    mul_add_simd_441_weightIn;
  wire       [7:0]    mul_add_simd_442_weightIn;
  wire       [7:0]    mul_add_simd_443_weightIn;
  wire       [7:0]    mul_add_simd_444_weightIn;
  wire       [7:0]    mul_add_simd_445_weightIn;
  wire       [7:0]    mul_add_simd_446_weightIn;
  wire       [7:0]    mul_add_simd_447_weightIn;
  wire       [7:0]    mul_add_simd_448_weightIn;
  wire       [7:0]    mul_add_simd_449_weightIn;
  wire       [7:0]    mul_add_simd_450_weightIn;
  wire       [7:0]    mul_add_simd_451_weightIn;
  wire       [7:0]    mul_add_simd_452_weightIn;
  wire       [7:0]    mul_add_simd_453_weightIn;
  wire       [7:0]    mul_add_simd_454_weightIn;
  wire       [7:0]    mul_add_simd_455_weightIn;
  wire       [7:0]    mul_add_simd_456_weightIn;
  wire       [7:0]    mul_add_simd_457_weightIn;
  wire       [7:0]    mul_add_simd_458_weightIn;
  wire       [7:0]    mul_add_simd_459_weightIn;
  wire       [7:0]    mul_add_simd_460_weightIn;
  wire       [7:0]    mul_add_simd_461_weightIn;
  wire       [7:0]    mul_add_simd_462_weightIn;
  wire       [7:0]    mul_add_simd_463_weightIn;
  wire       [7:0]    mul_add_simd_464_weightIn;
  wire       [7:0]    mul_add_simd_465_weightIn;
  wire       [7:0]    mul_add_simd_466_weightIn;
  wire       [7:0]    mul_add_simd_467_weightIn;
  wire       [7:0]    mul_add_simd_468_weightIn;
  wire       [7:0]    mul_add_simd_469_weightIn;
  wire       [7:0]    mul_add_simd_470_weightIn;
  wire       [7:0]    mul_add_simd_471_weightIn;
  wire       [7:0]    mul_add_simd_472_weightIn;
  wire       [7:0]    mul_add_simd_473_weightIn;
  wire       [7:0]    mul_add_simd_474_weightIn;
  wire       [7:0]    mul_add_simd_475_weightIn;
  wire       [7:0]    mul_add_simd_476_weightIn;
  wire       [7:0]    mul_add_simd_477_weightIn;
  wire       [7:0]    mul_add_simd_478_weightIn;
  wire       [7:0]    mul_add_simd_479_weightIn;
  wire       [7:0]    mul_add_simd_480_weightIn;
  wire       [7:0]    mul_add_simd_481_weightIn;
  wire       [7:0]    mul_add_simd_482_weightIn;
  wire       [7:0]    mul_add_simd_483_weightIn;
  wire       [7:0]    mul_add_simd_484_weightIn;
  wire       [7:0]    mul_add_simd_485_weightIn;
  wire       [7:0]    mul_add_simd_486_weightIn;
  wire       [7:0]    mul_add_simd_487_weightIn;
  wire       [7:0]    mul_add_simd_488_weightIn;
  wire       [7:0]    mul_add_simd_489_weightIn;
  wire       [7:0]    mul_add_simd_490_weightIn;
  wire       [7:0]    mul_add_simd_491_weightIn;
  wire       [7:0]    mul_add_simd_492_weightIn;
  wire       [7:0]    mul_add_simd_493_weightIn;
  wire       [7:0]    mul_add_simd_494_weightIn;
  wire       [7:0]    mul_add_simd_495_weightIn;
  wire       [7:0]    mul_add_simd_496_weightIn;
  wire       [7:0]    mul_add_simd_497_weightIn;
  wire       [7:0]    mul_add_simd_498_weightIn;
  wire       [7:0]    mul_add_simd_499_weightIn;
  wire       [7:0]    mul_add_simd_500_weightIn;
  wire       [7:0]    mul_add_simd_501_weightIn;
  wire       [7:0]    mul_add_simd_502_weightIn;
  wire       [7:0]    mul_add_simd_503_weightIn;
  wire       [7:0]    mul_add_simd_504_weightIn;
  wire       [7:0]    mul_add_simd_505_weightIn;
  wire       [7:0]    mul_add_simd_506_weightIn;
  wire       [7:0]    mul_add_simd_507_weightIn;
  wire       [7:0]    mul_add_simd_508_weightIn;
  wire       [7:0]    mul_add_simd_509_weightIn;
  wire       [7:0]    mul_add_simd_510_weightIn;
  wire       [7:0]    mul_add_simd_511_weightIn;
  wire                compute_ctrl_1_Compute_Complete;
  wire                compute_ctrl_1_First_Compute_Complete;
  wire                compute_ctrl_1_rd_en_fifo;
  wire                compute_ctrl_1_M_Valid;
  wire       [14:0]   compute_ctrl_1_weight_addrb;
  wire       [11:0]   compute_ctrl_1_ram_temp_read_address;
  wire       [11:0]   compute_ctrl_1_ram_temp_write_address;
  wire       [11:0]   compute_ctrl_1_S_Count_Fifo;
  wire       [11:0]   compute_ctrl_1_M_Count_Fifo;
  wire                load_weight_1_Write_Block_Complete;
  wire                load_weight_1_S_Para_Data_ready;
  wire       [2047:0] load_weight_1_Data_Out_Weight_0;
  wire       [255:0]  load_weight_1_Data_Out_Bias;
  wire       [255:0]  load_weight_1_Data_Out_Scale;
  wire       [255:0]  load_weight_1_Data_Out_Shift;
  wire                general_fifo_sync_1_data_in_ready;
  wire       [255:0]  general_fifo_sync_1_data_out;
  wire                general_fifo_sync_1_data_out_valid;
  wire                general_fifo_sync_1_data_valid;
  wire                general_fifo_sync_1_full;
  wire                general_fifo_sync_1_empty;
  wire       [255:0]  Configurable_RAM_Norm_doutb;
  wire       [15:0]   mul_add_simd_256_dataOut;
  wire       [15:0]   mul_add_simd_257_dataOut;
  wire       [15:0]   mul_add_simd_258_dataOut;
  wire       [15:0]   mul_add_simd_259_dataOut;
  wire       [15:0]   mul_add_simd_260_dataOut;
  wire       [15:0]   mul_add_simd_261_dataOut;
  wire       [15:0]   mul_add_simd_262_dataOut;
  wire       [15:0]   mul_add_simd_263_dataOut;
  wire       [15:0]   mul_add_simd_264_dataOut;
  wire       [15:0]   mul_add_simd_265_dataOut;
  wire       [15:0]   mul_add_simd_266_dataOut;
  wire       [15:0]   mul_add_simd_267_dataOut;
  wire       [15:0]   mul_add_simd_268_dataOut;
  wire       [15:0]   mul_add_simd_269_dataOut;
  wire       [15:0]   mul_add_simd_270_dataOut;
  wire       [15:0]   mul_add_simd_271_dataOut;
  wire       [15:0]   mul_add_simd_272_dataOut;
  wire       [15:0]   mul_add_simd_273_dataOut;
  wire       [15:0]   mul_add_simd_274_dataOut;
  wire       [15:0]   mul_add_simd_275_dataOut;
  wire       [15:0]   mul_add_simd_276_dataOut;
  wire       [15:0]   mul_add_simd_277_dataOut;
  wire       [15:0]   mul_add_simd_278_dataOut;
  wire       [15:0]   mul_add_simd_279_dataOut;
  wire       [15:0]   mul_add_simd_280_dataOut;
  wire       [15:0]   mul_add_simd_281_dataOut;
  wire       [15:0]   mul_add_simd_282_dataOut;
  wire       [15:0]   mul_add_simd_283_dataOut;
  wire       [15:0]   mul_add_simd_284_dataOut;
  wire       [15:0]   mul_add_simd_285_dataOut;
  wire       [15:0]   mul_add_simd_286_dataOut;
  wire       [15:0]   mul_add_simd_287_dataOut;
  wire       [15:0]   mul_add_simd_288_dataOut;
  wire       [15:0]   mul_add_simd_289_dataOut;
  wire       [15:0]   mul_add_simd_290_dataOut;
  wire       [15:0]   mul_add_simd_291_dataOut;
  wire       [15:0]   mul_add_simd_292_dataOut;
  wire       [15:0]   mul_add_simd_293_dataOut;
  wire       [15:0]   mul_add_simd_294_dataOut;
  wire       [15:0]   mul_add_simd_295_dataOut;
  wire       [15:0]   mul_add_simd_296_dataOut;
  wire       [15:0]   mul_add_simd_297_dataOut;
  wire       [15:0]   mul_add_simd_298_dataOut;
  wire       [15:0]   mul_add_simd_299_dataOut;
  wire       [15:0]   mul_add_simd_300_dataOut;
  wire       [15:0]   mul_add_simd_301_dataOut;
  wire       [15:0]   mul_add_simd_302_dataOut;
  wire       [15:0]   mul_add_simd_303_dataOut;
  wire       [15:0]   mul_add_simd_304_dataOut;
  wire       [15:0]   mul_add_simd_305_dataOut;
  wire       [15:0]   mul_add_simd_306_dataOut;
  wire       [15:0]   mul_add_simd_307_dataOut;
  wire       [15:0]   mul_add_simd_308_dataOut;
  wire       [15:0]   mul_add_simd_309_dataOut;
  wire       [15:0]   mul_add_simd_310_dataOut;
  wire       [15:0]   mul_add_simd_311_dataOut;
  wire       [15:0]   mul_add_simd_312_dataOut;
  wire       [15:0]   mul_add_simd_313_dataOut;
  wire       [15:0]   mul_add_simd_314_dataOut;
  wire       [15:0]   mul_add_simd_315_dataOut;
  wire       [15:0]   mul_add_simd_316_dataOut;
  wire       [15:0]   mul_add_simd_317_dataOut;
  wire       [15:0]   mul_add_simd_318_dataOut;
  wire       [15:0]   mul_add_simd_319_dataOut;
  wire       [15:0]   mul_add_simd_320_dataOut;
  wire       [15:0]   mul_add_simd_321_dataOut;
  wire       [15:0]   mul_add_simd_322_dataOut;
  wire       [15:0]   mul_add_simd_323_dataOut;
  wire       [15:0]   mul_add_simd_324_dataOut;
  wire       [15:0]   mul_add_simd_325_dataOut;
  wire       [15:0]   mul_add_simd_326_dataOut;
  wire       [15:0]   mul_add_simd_327_dataOut;
  wire       [15:0]   mul_add_simd_328_dataOut;
  wire       [15:0]   mul_add_simd_329_dataOut;
  wire       [15:0]   mul_add_simd_330_dataOut;
  wire       [15:0]   mul_add_simd_331_dataOut;
  wire       [15:0]   mul_add_simd_332_dataOut;
  wire       [15:0]   mul_add_simd_333_dataOut;
  wire       [15:0]   mul_add_simd_334_dataOut;
  wire       [15:0]   mul_add_simd_335_dataOut;
  wire       [15:0]   mul_add_simd_336_dataOut;
  wire       [15:0]   mul_add_simd_337_dataOut;
  wire       [15:0]   mul_add_simd_338_dataOut;
  wire       [15:0]   mul_add_simd_339_dataOut;
  wire       [15:0]   mul_add_simd_340_dataOut;
  wire       [15:0]   mul_add_simd_341_dataOut;
  wire       [15:0]   mul_add_simd_342_dataOut;
  wire       [15:0]   mul_add_simd_343_dataOut;
  wire       [15:0]   mul_add_simd_344_dataOut;
  wire       [15:0]   mul_add_simd_345_dataOut;
  wire       [15:0]   mul_add_simd_346_dataOut;
  wire       [15:0]   mul_add_simd_347_dataOut;
  wire       [15:0]   mul_add_simd_348_dataOut;
  wire       [15:0]   mul_add_simd_349_dataOut;
  wire       [15:0]   mul_add_simd_350_dataOut;
  wire       [15:0]   mul_add_simd_351_dataOut;
  wire       [15:0]   mul_add_simd_352_dataOut;
  wire       [15:0]   mul_add_simd_353_dataOut;
  wire       [15:0]   mul_add_simd_354_dataOut;
  wire       [15:0]   mul_add_simd_355_dataOut;
  wire       [15:0]   mul_add_simd_356_dataOut;
  wire       [15:0]   mul_add_simd_357_dataOut;
  wire       [15:0]   mul_add_simd_358_dataOut;
  wire       [15:0]   mul_add_simd_359_dataOut;
  wire       [15:0]   mul_add_simd_360_dataOut;
  wire       [15:0]   mul_add_simd_361_dataOut;
  wire       [15:0]   mul_add_simd_362_dataOut;
  wire       [15:0]   mul_add_simd_363_dataOut;
  wire       [15:0]   mul_add_simd_364_dataOut;
  wire       [15:0]   mul_add_simd_365_dataOut;
  wire       [15:0]   mul_add_simd_366_dataOut;
  wire       [15:0]   mul_add_simd_367_dataOut;
  wire       [15:0]   mul_add_simd_368_dataOut;
  wire       [15:0]   mul_add_simd_369_dataOut;
  wire       [15:0]   mul_add_simd_370_dataOut;
  wire       [15:0]   mul_add_simd_371_dataOut;
  wire       [15:0]   mul_add_simd_372_dataOut;
  wire       [15:0]   mul_add_simd_373_dataOut;
  wire       [15:0]   mul_add_simd_374_dataOut;
  wire       [15:0]   mul_add_simd_375_dataOut;
  wire       [15:0]   mul_add_simd_376_dataOut;
  wire       [15:0]   mul_add_simd_377_dataOut;
  wire       [15:0]   mul_add_simd_378_dataOut;
  wire       [15:0]   mul_add_simd_379_dataOut;
  wire       [15:0]   mul_add_simd_380_dataOut;
  wire       [15:0]   mul_add_simd_381_dataOut;
  wire       [15:0]   mul_add_simd_382_dataOut;
  wire       [15:0]   mul_add_simd_383_dataOut;
  wire       [15:0]   mul_add_simd_384_dataOut;
  wire       [15:0]   mul_add_simd_385_dataOut;
  wire       [15:0]   mul_add_simd_386_dataOut;
  wire       [15:0]   mul_add_simd_387_dataOut;
  wire       [15:0]   mul_add_simd_388_dataOut;
  wire       [15:0]   mul_add_simd_389_dataOut;
  wire       [15:0]   mul_add_simd_390_dataOut;
  wire       [15:0]   mul_add_simd_391_dataOut;
  wire       [15:0]   mul_add_simd_392_dataOut;
  wire       [15:0]   mul_add_simd_393_dataOut;
  wire       [15:0]   mul_add_simd_394_dataOut;
  wire       [15:0]   mul_add_simd_395_dataOut;
  wire       [15:0]   mul_add_simd_396_dataOut;
  wire       [15:0]   mul_add_simd_397_dataOut;
  wire       [15:0]   mul_add_simd_398_dataOut;
  wire       [15:0]   mul_add_simd_399_dataOut;
  wire       [15:0]   mul_add_simd_400_dataOut;
  wire       [15:0]   mul_add_simd_401_dataOut;
  wire       [15:0]   mul_add_simd_402_dataOut;
  wire       [15:0]   mul_add_simd_403_dataOut;
  wire       [15:0]   mul_add_simd_404_dataOut;
  wire       [15:0]   mul_add_simd_405_dataOut;
  wire       [15:0]   mul_add_simd_406_dataOut;
  wire       [15:0]   mul_add_simd_407_dataOut;
  wire       [15:0]   mul_add_simd_408_dataOut;
  wire       [15:0]   mul_add_simd_409_dataOut;
  wire       [15:0]   mul_add_simd_410_dataOut;
  wire       [15:0]   mul_add_simd_411_dataOut;
  wire       [15:0]   mul_add_simd_412_dataOut;
  wire       [15:0]   mul_add_simd_413_dataOut;
  wire       [15:0]   mul_add_simd_414_dataOut;
  wire       [15:0]   mul_add_simd_415_dataOut;
  wire       [15:0]   mul_add_simd_416_dataOut;
  wire       [15:0]   mul_add_simd_417_dataOut;
  wire       [15:0]   mul_add_simd_418_dataOut;
  wire       [15:0]   mul_add_simd_419_dataOut;
  wire       [15:0]   mul_add_simd_420_dataOut;
  wire       [15:0]   mul_add_simd_421_dataOut;
  wire       [15:0]   mul_add_simd_422_dataOut;
  wire       [15:0]   mul_add_simd_423_dataOut;
  wire       [15:0]   mul_add_simd_424_dataOut;
  wire       [15:0]   mul_add_simd_425_dataOut;
  wire       [15:0]   mul_add_simd_426_dataOut;
  wire       [15:0]   mul_add_simd_427_dataOut;
  wire       [15:0]   mul_add_simd_428_dataOut;
  wire       [15:0]   mul_add_simd_429_dataOut;
  wire       [15:0]   mul_add_simd_430_dataOut;
  wire       [15:0]   mul_add_simd_431_dataOut;
  wire       [15:0]   mul_add_simd_432_dataOut;
  wire       [15:0]   mul_add_simd_433_dataOut;
  wire       [15:0]   mul_add_simd_434_dataOut;
  wire       [15:0]   mul_add_simd_435_dataOut;
  wire       [15:0]   mul_add_simd_436_dataOut;
  wire       [15:0]   mul_add_simd_437_dataOut;
  wire       [15:0]   mul_add_simd_438_dataOut;
  wire       [15:0]   mul_add_simd_439_dataOut;
  wire       [15:0]   mul_add_simd_440_dataOut;
  wire       [15:0]   mul_add_simd_441_dataOut;
  wire       [15:0]   mul_add_simd_442_dataOut;
  wire       [15:0]   mul_add_simd_443_dataOut;
  wire       [15:0]   mul_add_simd_444_dataOut;
  wire       [15:0]   mul_add_simd_445_dataOut;
  wire       [15:0]   mul_add_simd_446_dataOut;
  wire       [15:0]   mul_add_simd_447_dataOut;
  wire       [15:0]   mul_add_simd_448_dataOut;
  wire       [15:0]   mul_add_simd_449_dataOut;
  wire       [15:0]   mul_add_simd_450_dataOut;
  wire       [15:0]   mul_add_simd_451_dataOut;
  wire       [15:0]   mul_add_simd_452_dataOut;
  wire       [15:0]   mul_add_simd_453_dataOut;
  wire       [15:0]   mul_add_simd_454_dataOut;
  wire       [15:0]   mul_add_simd_455_dataOut;
  wire       [15:0]   mul_add_simd_456_dataOut;
  wire       [15:0]   mul_add_simd_457_dataOut;
  wire       [15:0]   mul_add_simd_458_dataOut;
  wire       [15:0]   mul_add_simd_459_dataOut;
  wire       [15:0]   mul_add_simd_460_dataOut;
  wire       [15:0]   mul_add_simd_461_dataOut;
  wire       [15:0]   mul_add_simd_462_dataOut;
  wire       [15:0]   mul_add_simd_463_dataOut;
  wire       [15:0]   mul_add_simd_464_dataOut;
  wire       [15:0]   mul_add_simd_465_dataOut;
  wire       [15:0]   mul_add_simd_466_dataOut;
  wire       [15:0]   mul_add_simd_467_dataOut;
  wire       [15:0]   mul_add_simd_468_dataOut;
  wire       [15:0]   mul_add_simd_469_dataOut;
  wire       [15:0]   mul_add_simd_470_dataOut;
  wire       [15:0]   mul_add_simd_471_dataOut;
  wire       [15:0]   mul_add_simd_472_dataOut;
  wire       [15:0]   mul_add_simd_473_dataOut;
  wire       [15:0]   mul_add_simd_474_dataOut;
  wire       [15:0]   mul_add_simd_475_dataOut;
  wire       [15:0]   mul_add_simd_476_dataOut;
  wire       [15:0]   mul_add_simd_477_dataOut;
  wire       [15:0]   mul_add_simd_478_dataOut;
  wire       [15:0]   mul_add_simd_479_dataOut;
  wire       [15:0]   mul_add_simd_480_dataOut;
  wire       [15:0]   mul_add_simd_481_dataOut;
  wire       [15:0]   mul_add_simd_482_dataOut;
  wire       [15:0]   mul_add_simd_483_dataOut;
  wire       [15:0]   mul_add_simd_484_dataOut;
  wire       [15:0]   mul_add_simd_485_dataOut;
  wire       [15:0]   mul_add_simd_486_dataOut;
  wire       [15:0]   mul_add_simd_487_dataOut;
  wire       [15:0]   mul_add_simd_488_dataOut;
  wire       [15:0]   mul_add_simd_489_dataOut;
  wire       [15:0]   mul_add_simd_490_dataOut;
  wire       [15:0]   mul_add_simd_491_dataOut;
  wire       [15:0]   mul_add_simd_492_dataOut;
  wire       [15:0]   mul_add_simd_493_dataOut;
  wire       [15:0]   mul_add_simd_494_dataOut;
  wire       [15:0]   mul_add_simd_495_dataOut;
  wire       [15:0]   mul_add_simd_496_dataOut;
  wire       [15:0]   mul_add_simd_497_dataOut;
  wire       [15:0]   mul_add_simd_498_dataOut;
  wire       [15:0]   mul_add_simd_499_dataOut;
  wire       [15:0]   mul_add_simd_500_dataOut;
  wire       [15:0]   mul_add_simd_501_dataOut;
  wire       [15:0]   mul_add_simd_502_dataOut;
  wire       [15:0]   mul_add_simd_503_dataOut;
  wire       [15:0]   mul_add_simd_504_dataOut;
  wire       [15:0]   mul_add_simd_505_dataOut;
  wire       [15:0]   mul_add_simd_506_dataOut;
  wire       [15:0]   mul_add_simd_507_dataOut;
  wire       [15:0]   mul_add_simd_508_dataOut;
  wire       [15:0]   mul_add_simd_509_dataOut;
  wire       [15:0]   mul_add_simd_510_dataOut;
  wire       [15:0]   mul_add_simd_511_dataOut;
  wire       [31:0]   channel_in_acc_8_data_out;
  wire       [31:0]   channel_in_acc_9_data_out;
  wire       [31:0]   channel_in_acc_10_data_out;
  wire       [31:0]   channel_in_acc_11_data_out;
  wire       [31:0]   channel_in_acc_12_data_out;
  wire       [31:0]   channel_in_acc_13_data_out;
  wire       [31:0]   channel_in_acc_14_data_out;
  wire       [31:0]   channel_in_acc_15_data_out;
  wire       [31:0]   channel_out_acc_8_data_out;
  wire       [31:0]   channel_out_acc_9_data_out;
  wire       [31:0]   channel_out_acc_10_data_out;
  wire       [31:0]   channel_out_acc_11_data_out;
  wire       [31:0]   channel_out_acc_12_data_out;
  wire       [31:0]   channel_out_acc_13_data_out;
  wire       [31:0]   channel_out_acc_14_data_out;
  wire       [31:0]   channel_out_acc_15_data_out;
  wire       [4:0]    COMPUTE_TIMES_CHANNEL_IN_REG;
  wire       [6:0]    COMPUTE_TIMES_CHANNEL_IN_REG_8;
  wire       [6:0]    COMPUTE_TIMES_CHANNEL_OUT_REG;
  wire       [255:0]  data_fifo_out;
  wire       [255:0]  ram_temp_output_data;
  reg        [255:0]  ram_temp_output_data_delay_1;
  reg        [255:0]  ram_temp_output_data_delay;
  wire       [7:0]    compute_data_in_0;
  wire       [7:0]    compute_data_in_1;
  wire       [7:0]    compute_data_in_2;
  wire       [7:0]    compute_data_in_3;
  wire       [7:0]    compute_data_in_4;
  wire       [7:0]    compute_data_in_5;
  wire       [7:0]    compute_data_in_6;
  wire       [7:0]    compute_data_in_7;
  wire       [7:0]    compute_data_in_8;
  wire       [7:0]    compute_data_in_9;
  wire       [7:0]    compute_data_in_10;
  wire       [7:0]    compute_data_in_11;
  wire       [7:0]    compute_data_in_12;
  wire       [7:0]    compute_data_in_13;
  wire       [7:0]    compute_data_in_14;
  wire       [7:0]    compute_data_in_15;
  wire       [7:0]    compute_data_in_16;
  wire       [7:0]    compute_data_in_17;
  wire       [7:0]    compute_data_in_18;
  wire       [7:0]    compute_data_in_19;
  wire       [7:0]    compute_data_in_20;
  wire       [7:0]    compute_data_in_21;
  wire       [7:0]    compute_data_in_22;
  wire       [7:0]    compute_data_in_23;
  wire       [7:0]    compute_data_in_24;
  wire       [7:0]    compute_data_in_25;
  wire       [7:0]    compute_data_in_26;
  wire       [7:0]    compute_data_in_27;
  wire       [7:0]    compute_data_in_28;
  wire       [7:0]    compute_data_in_29;
  wire       [7:0]    compute_data_in_30;
  wire       [7:0]    compute_data_in_31;
  reg        [255:0]  compute_weight_in_0;
  reg        [255:0]  compute_weight_in_1;
  reg        [255:0]  compute_weight_in_2;
  reg        [255:0]  compute_weight_in_3;
  reg        [255:0]  compute_weight_in_4;
  reg        [255:0]  compute_weight_in_5;
  reg        [255:0]  compute_weight_in_6;
  reg        [255:0]  compute_weight_in_7;
  wire       [255:0]  compute_weight_in_delay_0;
  wire       [255:0]  compute_weight_in_delay_1;
  wire       [255:0]  compute_weight_in_delay_2;
  wire       [255:0]  compute_weight_in_delay_3;
  wire       [255:0]  compute_weight_in_delay_4;
  wire       [255:0]  compute_weight_in_delay_5;
  wire       [255:0]  compute_weight_in_delay_6;
  wire       [255:0]  compute_weight_in_delay_7;
  reg        [255:0]  compute_weight_in_0_regNext;
  reg        [255:0]  compute_weight_in_1_regNext;
  reg        [255:0]  compute_weight_in_2_regNext;
  reg        [255:0]  compute_weight_in_3_regNext;
  reg        [255:0]  compute_weight_in_4_regNext;
  reg        [255:0]  compute_weight_in_5_regNext;
  reg        [255:0]  compute_weight_in_6_regNext;
  reg        [255:0]  compute_weight_in_7_regNext;
  reg        [511:0]  compute_data_out_0;
  reg        [511:0]  compute_data_out_1;
  reg        [511:0]  compute_data_out_2;
  reg        [511:0]  compute_data_out_3;
  reg        [511:0]  compute_data_out_4;
  reg        [511:0]  compute_data_out_5;
  reg        [511:0]  compute_data_out_6;
  reg        [511:0]  compute_data_out_7;
  wire       [31:0]   data_result_temp_0;
  wire       [31:0]   data_result_temp_1;
  wire       [31:0]   data_result_temp_2;
  wire       [31:0]   data_result_temp_3;
  wire       [31:0]   data_result_temp_4;
  wire       [31:0]   data_result_temp_5;
  wire       [31:0]   data_result_temp_6;
  wire       [31:0]   data_result_temp_7;

  compute_ctrl compute_ctrl_1 (
    .Start_Cu                          (Start_Cu                                       ), //i
    .Compute_Complete                  (compute_ctrl_1_Compute_Complete                ), //o
    .First_Compute_Complete            (compute_ctrl_1_First_Compute_Complete          ), //o
    .compute_fifo_ready                (general_fifo_sync_1_data_out_valid             ), //i
    .rd_en_fifo                        (compute_ctrl_1_rd_en_fifo                      ), //o
    .M_ready                           (M_DATA_ready                                   ), //i
    .M_Valid                           (compute_ctrl_1_M_Valid                         ), //o
    .weight_addrb                      (compute_ctrl_1_weight_addrb                    ), //o
    .ram_temp_read_address             (compute_ctrl_1_ram_temp_read_address           ), //o
    .ram_temp_write_address            (compute_ctrl_1_ram_temp_write_address          ), //o
    .COMPUTE_TIMES_CHANNEL_IN_REG      (compute_ctrl_1_COMPUTE_TIMES_CHANNEL_IN_REG    ), //i
    .COMPUTE_TIMES_CHANNEL_IN_REG_8    (compute_ctrl_1_COMPUTE_TIMES_CHANNEL_IN_REG_8  ), //i
    .COMPUTE_TIMES_CHANNEL_OUT_REG     (compute_ctrl_1_COMPUTE_TIMES_CHANNEL_OUT_REG   ), //i
    .ROW_NUM_CHANNEL_OUT_REG           (Row_Num_Out_REG                                ), //i
    .S_Count_Fifo                      (compute_ctrl_1_S_Count_Fifo                    ), //o
    .M_Count_Fifo                      (compute_ctrl_1_M_Count_Fifo                    ), //o
    .clk                               (clk                                            ), //i
    .reset                             (reset                                          )  //i
  );
  load_weight load_weight_1 (
    .Start_Pa                 (Start_Pa                            ), //i
    .Weight_Single_Num_REG    (Weight_Single_Num_REG               ), //i
    .Bias_Num_REG             (Bias_Num_REG                        ), //i
    .Write_Block_Complete     (load_weight_1_Write_Block_Complete  ), //o
    .S_Para_Data_valid        (para_data_valid                     ), //i
    .S_Para_Data_ready        (load_weight_1_S_Para_Data_ready     ), //o
    .S_Para_Data_payload      (para_data_payload                   ), //i
    .Weight_Addrb             (compute_ctrl_1_weight_addrb         ), //i
    .Data_Out_Weight_0        (load_weight_1_Data_Out_Weight_0     ), //o
    .Bias_Addrb               (Bias_Addrb                          ), //i
    .Data_Out_Bias            (load_weight_1_Data_Out_Bias         ), //o
    .Data_Out_Scale           (load_weight_1_Data_Out_Scale        ), //o
    .Data_Out_Shift           (load_weight_1_Data_Out_Shift        ), //o
    .clk                      (clk                                 ), //i
    .reset                    (reset                               )  //i
  );
  general_fifo_sync general_fifo_sync_1 (
    .reset             (reset                               ), //i
    .clk               (clk                                 ), //i
    .data_in           (general_fifo_sync_1_data_in         ), //i
    .wr_en             (general_fifo_sync_1_wr_en           ), //i
    .data_in_ready     (general_fifo_sync_1_data_in_ready   ), //o
    .data_out          (general_fifo_sync_1_data_out        ), //o
    .rd_en             (compute_ctrl_1_rd_en_fifo           ), //i
    .data_out_valid    (general_fifo_sync_1_data_out_valid  ), //o
    .m_data_count      (general_fifo_sync_1_m_data_count    ), //i
    .s_data_count      (general_fifo_sync_1_s_data_count    ), //i
    .data_valid        (general_fifo_sync_1_data_valid      ), //o
    .full              (general_fifo_sync_1_full            ), //o
    .empty             (general_fifo_sync_1_empty           )  //o
  );
  sdpram_4 Configurable_RAM_Norm (
    .doutb    (Configurable_RAM_Norm_doutb            ), //o
    .addra    (compute_ctrl_1_ram_temp_write_address  ), //i
    .addrb    (compute_ctrl_1_ram_temp_read_address   ), //i
    .dina     (data_fifo_out                          ), //i
    .ena      (1'b1                                   ), //i
    .enb      (1'b1                                   ), //i
    .wea      (Configurable_RAM_Norm_wea              ), //i
    .clk      (clk                                    )  //i
  );
  mul_add_simd mul_add_simd_256 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_256_weightIn  ), //i
    .dataOut     (mul_add_simd_256_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_257 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_257_weightIn  ), //i
    .dataOut     (mul_add_simd_257_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_258 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_258_weightIn  ), //i
    .dataOut     (mul_add_simd_258_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_259 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_259_weightIn  ), //i
    .dataOut     (mul_add_simd_259_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_260 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_260_weightIn  ), //i
    .dataOut     (mul_add_simd_260_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_261 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_261_weightIn  ), //i
    .dataOut     (mul_add_simd_261_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_262 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_262_weightIn  ), //i
    .dataOut     (mul_add_simd_262_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_263 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_263_weightIn  ), //i
    .dataOut     (mul_add_simd_263_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_264 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_264_weightIn  ), //i
    .dataOut     (mul_add_simd_264_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_265 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_265_weightIn  ), //i
    .dataOut     (mul_add_simd_265_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_266 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_266_weightIn  ), //i
    .dataOut     (mul_add_simd_266_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_267 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_267_weightIn  ), //i
    .dataOut     (mul_add_simd_267_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_268 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_268_weightIn  ), //i
    .dataOut     (mul_add_simd_268_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_269 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_269_weightIn  ), //i
    .dataOut     (mul_add_simd_269_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_270 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_270_weightIn  ), //i
    .dataOut     (mul_add_simd_270_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_271 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_271_weightIn  ), //i
    .dataOut     (mul_add_simd_271_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_272 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_272_weightIn  ), //i
    .dataOut     (mul_add_simd_272_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_273 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_273_weightIn  ), //i
    .dataOut     (mul_add_simd_273_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_274 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_274_weightIn  ), //i
    .dataOut     (mul_add_simd_274_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_275 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_275_weightIn  ), //i
    .dataOut     (mul_add_simd_275_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_276 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_276_weightIn  ), //i
    .dataOut     (mul_add_simd_276_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_277 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_277_weightIn  ), //i
    .dataOut     (mul_add_simd_277_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_278 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_278_weightIn  ), //i
    .dataOut     (mul_add_simd_278_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_279 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_279_weightIn  ), //i
    .dataOut     (mul_add_simd_279_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_280 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_280_weightIn  ), //i
    .dataOut     (mul_add_simd_280_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_281 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_281_weightIn  ), //i
    .dataOut     (mul_add_simd_281_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_282 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_282_weightIn  ), //i
    .dataOut     (mul_add_simd_282_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_283 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_283_weightIn  ), //i
    .dataOut     (mul_add_simd_283_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_284 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_284_weightIn  ), //i
    .dataOut     (mul_add_simd_284_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_285 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_285_weightIn  ), //i
    .dataOut     (mul_add_simd_285_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_286 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_286_weightIn  ), //i
    .dataOut     (mul_add_simd_286_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_287 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_287_weightIn  ), //i
    .dataOut     (mul_add_simd_287_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_288 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_288_weightIn  ), //i
    .dataOut     (mul_add_simd_288_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_289 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_289_weightIn  ), //i
    .dataOut     (mul_add_simd_289_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_290 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_290_weightIn  ), //i
    .dataOut     (mul_add_simd_290_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_291 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_291_weightIn  ), //i
    .dataOut     (mul_add_simd_291_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_292 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_292_weightIn  ), //i
    .dataOut     (mul_add_simd_292_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_293 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_293_weightIn  ), //i
    .dataOut     (mul_add_simd_293_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_294 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_294_weightIn  ), //i
    .dataOut     (mul_add_simd_294_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_295 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_295_weightIn  ), //i
    .dataOut     (mul_add_simd_295_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_296 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_296_weightIn  ), //i
    .dataOut     (mul_add_simd_296_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_297 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_297_weightIn  ), //i
    .dataOut     (mul_add_simd_297_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_298 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_298_weightIn  ), //i
    .dataOut     (mul_add_simd_298_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_299 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_299_weightIn  ), //i
    .dataOut     (mul_add_simd_299_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_300 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_300_weightIn  ), //i
    .dataOut     (mul_add_simd_300_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_301 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_301_weightIn  ), //i
    .dataOut     (mul_add_simd_301_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_302 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_302_weightIn  ), //i
    .dataOut     (mul_add_simd_302_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_303 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_303_weightIn  ), //i
    .dataOut     (mul_add_simd_303_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_304 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_304_weightIn  ), //i
    .dataOut     (mul_add_simd_304_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_305 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_305_weightIn  ), //i
    .dataOut     (mul_add_simd_305_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_306 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_306_weightIn  ), //i
    .dataOut     (mul_add_simd_306_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_307 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_307_weightIn  ), //i
    .dataOut     (mul_add_simd_307_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_308 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_308_weightIn  ), //i
    .dataOut     (mul_add_simd_308_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_309 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_309_weightIn  ), //i
    .dataOut     (mul_add_simd_309_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_310 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_310_weightIn  ), //i
    .dataOut     (mul_add_simd_310_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_311 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_311_weightIn  ), //i
    .dataOut     (mul_add_simd_311_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_312 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_312_weightIn  ), //i
    .dataOut     (mul_add_simd_312_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_313 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_313_weightIn  ), //i
    .dataOut     (mul_add_simd_313_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_314 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_314_weightIn  ), //i
    .dataOut     (mul_add_simd_314_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_315 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_315_weightIn  ), //i
    .dataOut     (mul_add_simd_315_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_316 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_316_weightIn  ), //i
    .dataOut     (mul_add_simd_316_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_317 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_317_weightIn  ), //i
    .dataOut     (mul_add_simd_317_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_318 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_318_weightIn  ), //i
    .dataOut     (mul_add_simd_318_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_319 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_319_weightIn  ), //i
    .dataOut     (mul_add_simd_319_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_320 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_320_weightIn  ), //i
    .dataOut     (mul_add_simd_320_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_321 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_321_weightIn  ), //i
    .dataOut     (mul_add_simd_321_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_322 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_322_weightIn  ), //i
    .dataOut     (mul_add_simd_322_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_323 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_323_weightIn  ), //i
    .dataOut     (mul_add_simd_323_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_324 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_324_weightIn  ), //i
    .dataOut     (mul_add_simd_324_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_325 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_325_weightIn  ), //i
    .dataOut     (mul_add_simd_325_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_326 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_326_weightIn  ), //i
    .dataOut     (mul_add_simd_326_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_327 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_327_weightIn  ), //i
    .dataOut     (mul_add_simd_327_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_328 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_328_weightIn  ), //i
    .dataOut     (mul_add_simd_328_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_329 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_329_weightIn  ), //i
    .dataOut     (mul_add_simd_329_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_330 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_330_weightIn  ), //i
    .dataOut     (mul_add_simd_330_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_331 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_331_weightIn  ), //i
    .dataOut     (mul_add_simd_331_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_332 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_332_weightIn  ), //i
    .dataOut     (mul_add_simd_332_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_333 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_333_weightIn  ), //i
    .dataOut     (mul_add_simd_333_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_334 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_334_weightIn  ), //i
    .dataOut     (mul_add_simd_334_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_335 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_335_weightIn  ), //i
    .dataOut     (mul_add_simd_335_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_336 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_336_weightIn  ), //i
    .dataOut     (mul_add_simd_336_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_337 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_337_weightIn  ), //i
    .dataOut     (mul_add_simd_337_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_338 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_338_weightIn  ), //i
    .dataOut     (mul_add_simd_338_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_339 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_339_weightIn  ), //i
    .dataOut     (mul_add_simd_339_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_340 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_340_weightIn  ), //i
    .dataOut     (mul_add_simd_340_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_341 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_341_weightIn  ), //i
    .dataOut     (mul_add_simd_341_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_342 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_342_weightIn  ), //i
    .dataOut     (mul_add_simd_342_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_343 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_343_weightIn  ), //i
    .dataOut     (mul_add_simd_343_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_344 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_344_weightIn  ), //i
    .dataOut     (mul_add_simd_344_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_345 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_345_weightIn  ), //i
    .dataOut     (mul_add_simd_345_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_346 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_346_weightIn  ), //i
    .dataOut     (mul_add_simd_346_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_347 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_347_weightIn  ), //i
    .dataOut     (mul_add_simd_347_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_348 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_348_weightIn  ), //i
    .dataOut     (mul_add_simd_348_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_349 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_349_weightIn  ), //i
    .dataOut     (mul_add_simd_349_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_350 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_350_weightIn  ), //i
    .dataOut     (mul_add_simd_350_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_351 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_351_weightIn  ), //i
    .dataOut     (mul_add_simd_351_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_352 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_352_weightIn  ), //i
    .dataOut     (mul_add_simd_352_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_353 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_353_weightIn  ), //i
    .dataOut     (mul_add_simd_353_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_354 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_354_weightIn  ), //i
    .dataOut     (mul_add_simd_354_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_355 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_355_weightIn  ), //i
    .dataOut     (mul_add_simd_355_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_356 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_356_weightIn  ), //i
    .dataOut     (mul_add_simd_356_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_357 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_357_weightIn  ), //i
    .dataOut     (mul_add_simd_357_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_358 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_358_weightIn  ), //i
    .dataOut     (mul_add_simd_358_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_359 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_359_weightIn  ), //i
    .dataOut     (mul_add_simd_359_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_360 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_360_weightIn  ), //i
    .dataOut     (mul_add_simd_360_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_361 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_361_weightIn  ), //i
    .dataOut     (mul_add_simd_361_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_362 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_362_weightIn  ), //i
    .dataOut     (mul_add_simd_362_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_363 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_363_weightIn  ), //i
    .dataOut     (mul_add_simd_363_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_364 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_364_weightIn  ), //i
    .dataOut     (mul_add_simd_364_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_365 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_365_weightIn  ), //i
    .dataOut     (mul_add_simd_365_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_366 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_366_weightIn  ), //i
    .dataOut     (mul_add_simd_366_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_367 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_367_weightIn  ), //i
    .dataOut     (mul_add_simd_367_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_368 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_368_weightIn  ), //i
    .dataOut     (mul_add_simd_368_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_369 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_369_weightIn  ), //i
    .dataOut     (mul_add_simd_369_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_370 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_370_weightIn  ), //i
    .dataOut     (mul_add_simd_370_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_371 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_371_weightIn  ), //i
    .dataOut     (mul_add_simd_371_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_372 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_372_weightIn  ), //i
    .dataOut     (mul_add_simd_372_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_373 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_373_weightIn  ), //i
    .dataOut     (mul_add_simd_373_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_374 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_374_weightIn  ), //i
    .dataOut     (mul_add_simd_374_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_375 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_375_weightIn  ), //i
    .dataOut     (mul_add_simd_375_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_376 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_376_weightIn  ), //i
    .dataOut     (mul_add_simd_376_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_377 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_377_weightIn  ), //i
    .dataOut     (mul_add_simd_377_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_378 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_378_weightIn  ), //i
    .dataOut     (mul_add_simd_378_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_379 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_379_weightIn  ), //i
    .dataOut     (mul_add_simd_379_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_380 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_380_weightIn  ), //i
    .dataOut     (mul_add_simd_380_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_381 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_381_weightIn  ), //i
    .dataOut     (mul_add_simd_381_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_382 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_382_weightIn  ), //i
    .dataOut     (mul_add_simd_382_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_383 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_383_weightIn  ), //i
    .dataOut     (mul_add_simd_383_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_384 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_384_weightIn  ), //i
    .dataOut     (mul_add_simd_384_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_385 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_385_weightIn  ), //i
    .dataOut     (mul_add_simd_385_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_386 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_386_weightIn  ), //i
    .dataOut     (mul_add_simd_386_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_387 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_387_weightIn  ), //i
    .dataOut     (mul_add_simd_387_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_388 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_388_weightIn  ), //i
    .dataOut     (mul_add_simd_388_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_389 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_389_weightIn  ), //i
    .dataOut     (mul_add_simd_389_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_390 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_390_weightIn  ), //i
    .dataOut     (mul_add_simd_390_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_391 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_391_weightIn  ), //i
    .dataOut     (mul_add_simd_391_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_392 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_392_weightIn  ), //i
    .dataOut     (mul_add_simd_392_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_393 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_393_weightIn  ), //i
    .dataOut     (mul_add_simd_393_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_394 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_394_weightIn  ), //i
    .dataOut     (mul_add_simd_394_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_395 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_395_weightIn  ), //i
    .dataOut     (mul_add_simd_395_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_396 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_396_weightIn  ), //i
    .dataOut     (mul_add_simd_396_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_397 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_397_weightIn  ), //i
    .dataOut     (mul_add_simd_397_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_398 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_398_weightIn  ), //i
    .dataOut     (mul_add_simd_398_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_399 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_399_weightIn  ), //i
    .dataOut     (mul_add_simd_399_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_400 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_400_weightIn  ), //i
    .dataOut     (mul_add_simd_400_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_401 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_401_weightIn  ), //i
    .dataOut     (mul_add_simd_401_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_402 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_402_weightIn  ), //i
    .dataOut     (mul_add_simd_402_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_403 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_403_weightIn  ), //i
    .dataOut     (mul_add_simd_403_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_404 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_404_weightIn  ), //i
    .dataOut     (mul_add_simd_404_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_405 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_405_weightIn  ), //i
    .dataOut     (mul_add_simd_405_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_406 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_406_weightIn  ), //i
    .dataOut     (mul_add_simd_406_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_407 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_407_weightIn  ), //i
    .dataOut     (mul_add_simd_407_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_408 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_408_weightIn  ), //i
    .dataOut     (mul_add_simd_408_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_409 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_409_weightIn  ), //i
    .dataOut     (mul_add_simd_409_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_410 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_410_weightIn  ), //i
    .dataOut     (mul_add_simd_410_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_411 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_411_weightIn  ), //i
    .dataOut     (mul_add_simd_411_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_412 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_412_weightIn  ), //i
    .dataOut     (mul_add_simd_412_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_413 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_413_weightIn  ), //i
    .dataOut     (mul_add_simd_413_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_414 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_414_weightIn  ), //i
    .dataOut     (mul_add_simd_414_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_415 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_415_weightIn  ), //i
    .dataOut     (mul_add_simd_415_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_416 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_416_weightIn  ), //i
    .dataOut     (mul_add_simd_416_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_417 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_417_weightIn  ), //i
    .dataOut     (mul_add_simd_417_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_418 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_418_weightIn  ), //i
    .dataOut     (mul_add_simd_418_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_419 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_419_weightIn  ), //i
    .dataOut     (mul_add_simd_419_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_420 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_420_weightIn  ), //i
    .dataOut     (mul_add_simd_420_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_421 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_421_weightIn  ), //i
    .dataOut     (mul_add_simd_421_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_422 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_422_weightIn  ), //i
    .dataOut     (mul_add_simd_422_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_423 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_423_weightIn  ), //i
    .dataOut     (mul_add_simd_423_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_424 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_424_weightIn  ), //i
    .dataOut     (mul_add_simd_424_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_425 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_425_weightIn  ), //i
    .dataOut     (mul_add_simd_425_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_426 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_426_weightIn  ), //i
    .dataOut     (mul_add_simd_426_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_427 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_427_weightIn  ), //i
    .dataOut     (mul_add_simd_427_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_428 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_428_weightIn  ), //i
    .dataOut     (mul_add_simd_428_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_429 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_429_weightIn  ), //i
    .dataOut     (mul_add_simd_429_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_430 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_430_weightIn  ), //i
    .dataOut     (mul_add_simd_430_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_431 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_431_weightIn  ), //i
    .dataOut     (mul_add_simd_431_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_432 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_432_weightIn  ), //i
    .dataOut     (mul_add_simd_432_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_433 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_433_weightIn  ), //i
    .dataOut     (mul_add_simd_433_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_434 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_434_weightIn  ), //i
    .dataOut     (mul_add_simd_434_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_435 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_435_weightIn  ), //i
    .dataOut     (mul_add_simd_435_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_436 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_436_weightIn  ), //i
    .dataOut     (mul_add_simd_436_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_437 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_437_weightIn  ), //i
    .dataOut     (mul_add_simd_437_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_438 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_438_weightIn  ), //i
    .dataOut     (mul_add_simd_438_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_439 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_439_weightIn  ), //i
    .dataOut     (mul_add_simd_439_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_440 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_440_weightIn  ), //i
    .dataOut     (mul_add_simd_440_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_441 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_441_weightIn  ), //i
    .dataOut     (mul_add_simd_441_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_442 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_442_weightIn  ), //i
    .dataOut     (mul_add_simd_442_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_443 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_443_weightIn  ), //i
    .dataOut     (mul_add_simd_443_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_444 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_444_weightIn  ), //i
    .dataOut     (mul_add_simd_444_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_445 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_445_weightIn  ), //i
    .dataOut     (mul_add_simd_445_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_446 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_446_weightIn  ), //i
    .dataOut     (mul_add_simd_446_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_447 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_447_weightIn  ), //i
    .dataOut     (mul_add_simd_447_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_448 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_448_weightIn  ), //i
    .dataOut     (mul_add_simd_448_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_449 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_449_weightIn  ), //i
    .dataOut     (mul_add_simd_449_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_450 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_450_weightIn  ), //i
    .dataOut     (mul_add_simd_450_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_451 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_451_weightIn  ), //i
    .dataOut     (mul_add_simd_451_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_452 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_452_weightIn  ), //i
    .dataOut     (mul_add_simd_452_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_453 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_453_weightIn  ), //i
    .dataOut     (mul_add_simd_453_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_454 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_454_weightIn  ), //i
    .dataOut     (mul_add_simd_454_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_455 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_455_weightIn  ), //i
    .dataOut     (mul_add_simd_455_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_456 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_456_weightIn  ), //i
    .dataOut     (mul_add_simd_456_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_457 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_457_weightIn  ), //i
    .dataOut     (mul_add_simd_457_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_458 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_458_weightIn  ), //i
    .dataOut     (mul_add_simd_458_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_459 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_459_weightIn  ), //i
    .dataOut     (mul_add_simd_459_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_460 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_460_weightIn  ), //i
    .dataOut     (mul_add_simd_460_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_461 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_461_weightIn  ), //i
    .dataOut     (mul_add_simd_461_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_462 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_462_weightIn  ), //i
    .dataOut     (mul_add_simd_462_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_463 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_463_weightIn  ), //i
    .dataOut     (mul_add_simd_463_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_464 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_464_weightIn  ), //i
    .dataOut     (mul_add_simd_464_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_465 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_465_weightIn  ), //i
    .dataOut     (mul_add_simd_465_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_466 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_466_weightIn  ), //i
    .dataOut     (mul_add_simd_466_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_467 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_467_weightIn  ), //i
    .dataOut     (mul_add_simd_467_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_468 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_468_weightIn  ), //i
    .dataOut     (mul_add_simd_468_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_469 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_469_weightIn  ), //i
    .dataOut     (mul_add_simd_469_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_470 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_470_weightIn  ), //i
    .dataOut     (mul_add_simd_470_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_471 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_471_weightIn  ), //i
    .dataOut     (mul_add_simd_471_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_472 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_472_weightIn  ), //i
    .dataOut     (mul_add_simd_472_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_473 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_473_weightIn  ), //i
    .dataOut     (mul_add_simd_473_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_474 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_474_weightIn  ), //i
    .dataOut     (mul_add_simd_474_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_475 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_475_weightIn  ), //i
    .dataOut     (mul_add_simd_475_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_476 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_476_weightIn  ), //i
    .dataOut     (mul_add_simd_476_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_477 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_477_weightIn  ), //i
    .dataOut     (mul_add_simd_477_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_478 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_478_weightIn  ), //i
    .dataOut     (mul_add_simd_478_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_479 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_479_weightIn  ), //i
    .dataOut     (mul_add_simd_479_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_480 (
    .dataIn      (compute_data_in_0          ), //i
    .weightIn    (mul_add_simd_480_weightIn  ), //i
    .dataOut     (mul_add_simd_480_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_481 (
    .dataIn      (compute_data_in_1          ), //i
    .weightIn    (mul_add_simd_481_weightIn  ), //i
    .dataOut     (mul_add_simd_481_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_482 (
    .dataIn      (compute_data_in_2          ), //i
    .weightIn    (mul_add_simd_482_weightIn  ), //i
    .dataOut     (mul_add_simd_482_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_483 (
    .dataIn      (compute_data_in_3          ), //i
    .weightIn    (mul_add_simd_483_weightIn  ), //i
    .dataOut     (mul_add_simd_483_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_484 (
    .dataIn      (compute_data_in_4          ), //i
    .weightIn    (mul_add_simd_484_weightIn  ), //i
    .dataOut     (mul_add_simd_484_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_485 (
    .dataIn      (compute_data_in_5          ), //i
    .weightIn    (mul_add_simd_485_weightIn  ), //i
    .dataOut     (mul_add_simd_485_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_486 (
    .dataIn      (compute_data_in_6          ), //i
    .weightIn    (mul_add_simd_486_weightIn  ), //i
    .dataOut     (mul_add_simd_486_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_487 (
    .dataIn      (compute_data_in_7          ), //i
    .weightIn    (mul_add_simd_487_weightIn  ), //i
    .dataOut     (mul_add_simd_487_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_488 (
    .dataIn      (compute_data_in_8          ), //i
    .weightIn    (mul_add_simd_488_weightIn  ), //i
    .dataOut     (mul_add_simd_488_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_489 (
    .dataIn      (compute_data_in_9          ), //i
    .weightIn    (mul_add_simd_489_weightIn  ), //i
    .dataOut     (mul_add_simd_489_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_490 (
    .dataIn      (compute_data_in_10         ), //i
    .weightIn    (mul_add_simd_490_weightIn  ), //i
    .dataOut     (mul_add_simd_490_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_491 (
    .dataIn      (compute_data_in_11         ), //i
    .weightIn    (mul_add_simd_491_weightIn  ), //i
    .dataOut     (mul_add_simd_491_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_492 (
    .dataIn      (compute_data_in_12         ), //i
    .weightIn    (mul_add_simd_492_weightIn  ), //i
    .dataOut     (mul_add_simd_492_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_493 (
    .dataIn      (compute_data_in_13         ), //i
    .weightIn    (mul_add_simd_493_weightIn  ), //i
    .dataOut     (mul_add_simd_493_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_494 (
    .dataIn      (compute_data_in_14         ), //i
    .weightIn    (mul_add_simd_494_weightIn  ), //i
    .dataOut     (mul_add_simd_494_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_495 (
    .dataIn      (compute_data_in_15         ), //i
    .weightIn    (mul_add_simd_495_weightIn  ), //i
    .dataOut     (mul_add_simd_495_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_496 (
    .dataIn      (compute_data_in_16         ), //i
    .weightIn    (mul_add_simd_496_weightIn  ), //i
    .dataOut     (mul_add_simd_496_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_497 (
    .dataIn      (compute_data_in_17         ), //i
    .weightIn    (mul_add_simd_497_weightIn  ), //i
    .dataOut     (mul_add_simd_497_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_498 (
    .dataIn      (compute_data_in_18         ), //i
    .weightIn    (mul_add_simd_498_weightIn  ), //i
    .dataOut     (mul_add_simd_498_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_499 (
    .dataIn      (compute_data_in_19         ), //i
    .weightIn    (mul_add_simd_499_weightIn  ), //i
    .dataOut     (mul_add_simd_499_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_500 (
    .dataIn      (compute_data_in_20         ), //i
    .weightIn    (mul_add_simd_500_weightIn  ), //i
    .dataOut     (mul_add_simd_500_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_501 (
    .dataIn      (compute_data_in_21         ), //i
    .weightIn    (mul_add_simd_501_weightIn  ), //i
    .dataOut     (mul_add_simd_501_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_502 (
    .dataIn      (compute_data_in_22         ), //i
    .weightIn    (mul_add_simd_502_weightIn  ), //i
    .dataOut     (mul_add_simd_502_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_503 (
    .dataIn      (compute_data_in_23         ), //i
    .weightIn    (mul_add_simd_503_weightIn  ), //i
    .dataOut     (mul_add_simd_503_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_504 (
    .dataIn      (compute_data_in_24         ), //i
    .weightIn    (mul_add_simd_504_weightIn  ), //i
    .dataOut     (mul_add_simd_504_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_505 (
    .dataIn      (compute_data_in_25         ), //i
    .weightIn    (mul_add_simd_505_weightIn  ), //i
    .dataOut     (mul_add_simd_505_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_506 (
    .dataIn      (compute_data_in_26         ), //i
    .weightIn    (mul_add_simd_506_weightIn  ), //i
    .dataOut     (mul_add_simd_506_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_507 (
    .dataIn      (compute_data_in_27         ), //i
    .weightIn    (mul_add_simd_507_weightIn  ), //i
    .dataOut     (mul_add_simd_507_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_508 (
    .dataIn      (compute_data_in_28         ), //i
    .weightIn    (mul_add_simd_508_weightIn  ), //i
    .dataOut     (mul_add_simd_508_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_509 (
    .dataIn      (compute_data_in_29         ), //i
    .weightIn    (mul_add_simd_509_weightIn  ), //i
    .dataOut     (mul_add_simd_509_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_510 (
    .dataIn      (compute_data_in_30         ), //i
    .weightIn    (mul_add_simd_510_weightIn  ), //i
    .dataOut     (mul_add_simd_510_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  mul_add_simd mul_add_simd_511 (
    .dataIn      (compute_data_in_31         ), //i
    .weightIn    (mul_add_simd_511_weightIn  ), //i
    .dataOut     (mul_add_simd_511_dataOut   ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  channel_in_acc channel_in_acc_8 (
    .data_in     (compute_data_out_0         ), //i
    .data_out    (channel_in_acc_8_data_out  ), //o
    .clk         (clk                        )  //i
  );
  channel_in_acc channel_in_acc_9 (
    .data_in     (compute_data_out_1         ), //i
    .data_out    (channel_in_acc_9_data_out  ), //o
    .clk         (clk                        )  //i
  );
  channel_in_acc channel_in_acc_10 (
    .data_in     (compute_data_out_2          ), //i
    .data_out    (channel_in_acc_10_data_out  ), //o
    .clk         (clk                         )  //i
  );
  channel_in_acc channel_in_acc_11 (
    .data_in     (compute_data_out_3          ), //i
    .data_out    (channel_in_acc_11_data_out  ), //o
    .clk         (clk                         )  //i
  );
  channel_in_acc channel_in_acc_12 (
    .data_in     (compute_data_out_4          ), //i
    .data_out    (channel_in_acc_12_data_out  ), //o
    .clk         (clk                         )  //i
  );
  channel_in_acc channel_in_acc_13 (
    .data_in     (compute_data_out_5          ), //i
    .data_out    (channel_in_acc_13_data_out  ), //o
    .clk         (clk                         )  //i
  );
  channel_in_acc channel_in_acc_14 (
    .data_in     (compute_data_out_6          ), //i
    .data_out    (channel_in_acc_14_data_out  ), //o
    .clk         (clk                         )  //i
  );
  channel_in_acc channel_in_acc_15 (
    .data_in     (compute_data_out_7          ), //i
    .data_out    (channel_in_acc_15_data_out  ), //o
    .clk         (clk                         )  //i
  );
  channel_out_acc channel_out_acc_8 (
    .data_in                   (channel_in_acc_8_data_out              ), //i
    .data_out                  (channel_out_acc_8_data_out             ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_9 (
    .data_in                   (channel_in_acc_9_data_out              ), //i
    .data_out                  (channel_out_acc_9_data_out             ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_10 (
    .data_in                   (channel_in_acc_10_data_out             ), //i
    .data_out                  (channel_out_acc_10_data_out            ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_11 (
    .data_in                   (channel_in_acc_11_data_out             ), //i
    .data_out                  (channel_out_acc_11_data_out            ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_12 (
    .data_in                   (channel_in_acc_12_data_out             ), //i
    .data_out                  (channel_out_acc_12_data_out            ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_13 (
    .data_in                   (channel_in_acc_13_data_out             ), //i
    .data_out                  (channel_out_acc_13_data_out            ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_14 (
    .data_in                   (channel_in_acc_14_data_out             ), //i
    .data_out                  (channel_out_acc_14_data_out            ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  channel_out_acc channel_out_acc_15 (
    .data_in                   (channel_in_acc_15_data_out             ), //i
    .data_out                  (channel_out_acc_15_data_out            ), //o
    .First_Compute_Complete    (compute_ctrl_1_First_Compute_Complete  ), //i
    .clk                       (clk                                    ), //i
    .reset                     (reset                                  )  //i
  );
  assign COMPUTE_TIMES_CHANNEL_IN_REG = (Channel_In_Num_REG >>> 5);
  assign COMPUTE_TIMES_CHANNEL_IN_REG_8 = (Channel_In_Num_REG >>> 3);
  assign COMPUTE_TIMES_CHANNEL_OUT_REG = (Channel_Out_Num_REG >>> 3);
  assign M_DATA_valid = compute_ctrl_1_M_Valid;
  assign compute_ctrl_1_COMPUTE_TIMES_CHANNEL_IN_REG = {7'd0, COMPUTE_TIMES_CHANNEL_IN_REG};
  assign compute_ctrl_1_COMPUTE_TIMES_CHANNEL_IN_REG_8 = {5'd0, COMPUTE_TIMES_CHANNEL_IN_REG_8};
  assign compute_ctrl_1_COMPUTE_TIMES_CHANNEL_OUT_REG = {5'd0, COMPUTE_TIMES_CHANNEL_OUT_REG};
  assign Compute_Complete = compute_ctrl_1_Compute_Complete;
  assign Write_Block_Complete = load_weight_1_Write_Block_Complete;
  assign para_data_ready = load_weight_1_S_Para_Data_ready;
  assign Data_Out_Bias = load_weight_1_Data_Out_Bias;
  assign Data_Out_Scale = load_weight_1_Data_Out_Scale;
  assign Data_Out_Shift = load_weight_1_Data_Out_Shift;
  assign general_fifo_sync_1_wr_en = S_DATA_Valid[0];
  assign general_fifo_sync_1_data_in = S_DATA[63 : 0];
  assign general_fifo_sync_1_m_data_count = compute_ctrl_1_M_Count_Fifo;
  assign general_fifo_sync_1_s_data_count = compute_ctrl_1_S_Count_Fifo;
  assign data_fifo_out[255 : 0] = general_fifo_sync_1_data_out;
  assign S_DATA_Ready = general_fifo_sync_1_data_in_ready;
  assign Configurable_RAM_Norm_wea = compute_ctrl_1_rd_en_fifo;
  assign ram_temp_output_data = Configurable_RAM_Norm_doutb;
  assign compute_data_in_0[7 : 0] = ram_temp_output_data_delay[7 : 0];
  assign compute_data_in_1[7 : 0] = ram_temp_output_data_delay[15 : 8];
  assign compute_data_in_2[7 : 0] = ram_temp_output_data_delay[23 : 16];
  assign compute_data_in_3[7 : 0] = ram_temp_output_data_delay[31 : 24];
  assign compute_data_in_4[7 : 0] = ram_temp_output_data_delay[39 : 32];
  assign compute_data_in_5[7 : 0] = ram_temp_output_data_delay[47 : 40];
  assign compute_data_in_6[7 : 0] = ram_temp_output_data_delay[55 : 48];
  assign compute_data_in_7[7 : 0] = ram_temp_output_data_delay[63 : 56];
  assign compute_data_in_8[7 : 0] = ram_temp_output_data_delay[71 : 64];
  assign compute_data_in_9[7 : 0] = ram_temp_output_data_delay[79 : 72];
  assign compute_data_in_10[7 : 0] = ram_temp_output_data_delay[87 : 80];
  assign compute_data_in_11[7 : 0] = ram_temp_output_data_delay[95 : 88];
  assign compute_data_in_12[7 : 0] = ram_temp_output_data_delay[103 : 96];
  assign compute_data_in_13[7 : 0] = ram_temp_output_data_delay[111 : 104];
  assign compute_data_in_14[7 : 0] = ram_temp_output_data_delay[119 : 112];
  assign compute_data_in_15[7 : 0] = ram_temp_output_data_delay[127 : 120];
  assign compute_data_in_16[7 : 0] = ram_temp_output_data_delay[135 : 128];
  assign compute_data_in_17[7 : 0] = ram_temp_output_data_delay[143 : 136];
  assign compute_data_in_18[7 : 0] = ram_temp_output_data_delay[151 : 144];
  assign compute_data_in_19[7 : 0] = ram_temp_output_data_delay[159 : 152];
  assign compute_data_in_20[7 : 0] = ram_temp_output_data_delay[167 : 160];
  assign compute_data_in_21[7 : 0] = ram_temp_output_data_delay[175 : 168];
  assign compute_data_in_22[7 : 0] = ram_temp_output_data_delay[183 : 176];
  assign compute_data_in_23[7 : 0] = ram_temp_output_data_delay[191 : 184];
  assign compute_data_in_24[7 : 0] = ram_temp_output_data_delay[199 : 192];
  assign compute_data_in_25[7 : 0] = ram_temp_output_data_delay[207 : 200];
  assign compute_data_in_26[7 : 0] = ram_temp_output_data_delay[215 : 208];
  assign compute_data_in_27[7 : 0] = ram_temp_output_data_delay[223 : 216];
  assign compute_data_in_28[7 : 0] = ram_temp_output_data_delay[231 : 224];
  assign compute_data_in_29[7 : 0] = ram_temp_output_data_delay[239 : 232];
  assign compute_data_in_30[7 : 0] = ram_temp_output_data_delay[247 : 240];
  assign compute_data_in_31[7 : 0] = ram_temp_output_data_delay[255 : 248];
  always @(*) begin
    compute_weight_in_0[7 : 0] = load_weight_1_Data_Out_Weight_0[7 : 0];
    compute_weight_in_0[15 : 8] = load_weight_1_Data_Out_Weight_0[15 : 8];
    compute_weight_in_0[23 : 16] = load_weight_1_Data_Out_Weight_0[23 : 16];
    compute_weight_in_0[31 : 24] = load_weight_1_Data_Out_Weight_0[31 : 24];
    compute_weight_in_0[39 : 32] = load_weight_1_Data_Out_Weight_0[39 : 32];
    compute_weight_in_0[47 : 40] = load_weight_1_Data_Out_Weight_0[47 : 40];
    compute_weight_in_0[55 : 48] = load_weight_1_Data_Out_Weight_0[55 : 48];
    compute_weight_in_0[63 : 56] = load_weight_1_Data_Out_Weight_0[63 : 56];
    compute_weight_in_0[71 : 64] = load_weight_1_Data_Out_Weight_0[71 : 64];
    compute_weight_in_0[79 : 72] = load_weight_1_Data_Out_Weight_0[79 : 72];
    compute_weight_in_0[87 : 80] = load_weight_1_Data_Out_Weight_0[87 : 80];
    compute_weight_in_0[95 : 88] = load_weight_1_Data_Out_Weight_0[95 : 88];
    compute_weight_in_0[103 : 96] = load_weight_1_Data_Out_Weight_0[103 : 96];
    compute_weight_in_0[111 : 104] = load_weight_1_Data_Out_Weight_0[111 : 104];
    compute_weight_in_0[119 : 112] = load_weight_1_Data_Out_Weight_0[119 : 112];
    compute_weight_in_0[127 : 120] = load_weight_1_Data_Out_Weight_0[127 : 120];
    compute_weight_in_0[135 : 128] = load_weight_1_Data_Out_Weight_0[135 : 128];
    compute_weight_in_0[143 : 136] = load_weight_1_Data_Out_Weight_0[143 : 136];
    compute_weight_in_0[151 : 144] = load_weight_1_Data_Out_Weight_0[151 : 144];
    compute_weight_in_0[159 : 152] = load_weight_1_Data_Out_Weight_0[159 : 152];
    compute_weight_in_0[167 : 160] = load_weight_1_Data_Out_Weight_0[167 : 160];
    compute_weight_in_0[175 : 168] = load_weight_1_Data_Out_Weight_0[175 : 168];
    compute_weight_in_0[183 : 176] = load_weight_1_Data_Out_Weight_0[183 : 176];
    compute_weight_in_0[191 : 184] = load_weight_1_Data_Out_Weight_0[191 : 184];
    compute_weight_in_0[199 : 192] = load_weight_1_Data_Out_Weight_0[199 : 192];
    compute_weight_in_0[207 : 200] = load_weight_1_Data_Out_Weight_0[207 : 200];
    compute_weight_in_0[215 : 208] = load_weight_1_Data_Out_Weight_0[215 : 208];
    compute_weight_in_0[223 : 216] = load_weight_1_Data_Out_Weight_0[223 : 216];
    compute_weight_in_0[231 : 224] = load_weight_1_Data_Out_Weight_0[231 : 224];
    compute_weight_in_0[239 : 232] = load_weight_1_Data_Out_Weight_0[239 : 232];
    compute_weight_in_0[247 : 240] = load_weight_1_Data_Out_Weight_0[247 : 240];
    compute_weight_in_0[255 : 248] = load_weight_1_Data_Out_Weight_0[255 : 248];
  end

  always @(*) begin
    compute_weight_in_1[7 : 0] = load_weight_1_Data_Out_Weight_0[263 : 256];
    compute_weight_in_1[15 : 8] = load_weight_1_Data_Out_Weight_0[271 : 264];
    compute_weight_in_1[23 : 16] = load_weight_1_Data_Out_Weight_0[279 : 272];
    compute_weight_in_1[31 : 24] = load_weight_1_Data_Out_Weight_0[287 : 280];
    compute_weight_in_1[39 : 32] = load_weight_1_Data_Out_Weight_0[295 : 288];
    compute_weight_in_1[47 : 40] = load_weight_1_Data_Out_Weight_0[303 : 296];
    compute_weight_in_1[55 : 48] = load_weight_1_Data_Out_Weight_0[311 : 304];
    compute_weight_in_1[63 : 56] = load_weight_1_Data_Out_Weight_0[319 : 312];
    compute_weight_in_1[71 : 64] = load_weight_1_Data_Out_Weight_0[327 : 320];
    compute_weight_in_1[79 : 72] = load_weight_1_Data_Out_Weight_0[335 : 328];
    compute_weight_in_1[87 : 80] = load_weight_1_Data_Out_Weight_0[343 : 336];
    compute_weight_in_1[95 : 88] = load_weight_1_Data_Out_Weight_0[351 : 344];
    compute_weight_in_1[103 : 96] = load_weight_1_Data_Out_Weight_0[359 : 352];
    compute_weight_in_1[111 : 104] = load_weight_1_Data_Out_Weight_0[367 : 360];
    compute_weight_in_1[119 : 112] = load_weight_1_Data_Out_Weight_0[375 : 368];
    compute_weight_in_1[127 : 120] = load_weight_1_Data_Out_Weight_0[383 : 376];
    compute_weight_in_1[135 : 128] = load_weight_1_Data_Out_Weight_0[391 : 384];
    compute_weight_in_1[143 : 136] = load_weight_1_Data_Out_Weight_0[399 : 392];
    compute_weight_in_1[151 : 144] = load_weight_1_Data_Out_Weight_0[407 : 400];
    compute_weight_in_1[159 : 152] = load_weight_1_Data_Out_Weight_0[415 : 408];
    compute_weight_in_1[167 : 160] = load_weight_1_Data_Out_Weight_0[423 : 416];
    compute_weight_in_1[175 : 168] = load_weight_1_Data_Out_Weight_0[431 : 424];
    compute_weight_in_1[183 : 176] = load_weight_1_Data_Out_Weight_0[439 : 432];
    compute_weight_in_1[191 : 184] = load_weight_1_Data_Out_Weight_0[447 : 440];
    compute_weight_in_1[199 : 192] = load_weight_1_Data_Out_Weight_0[455 : 448];
    compute_weight_in_1[207 : 200] = load_weight_1_Data_Out_Weight_0[463 : 456];
    compute_weight_in_1[215 : 208] = load_weight_1_Data_Out_Weight_0[471 : 464];
    compute_weight_in_1[223 : 216] = load_weight_1_Data_Out_Weight_0[479 : 472];
    compute_weight_in_1[231 : 224] = load_weight_1_Data_Out_Weight_0[487 : 480];
    compute_weight_in_1[239 : 232] = load_weight_1_Data_Out_Weight_0[495 : 488];
    compute_weight_in_1[247 : 240] = load_weight_1_Data_Out_Weight_0[503 : 496];
    compute_weight_in_1[255 : 248] = load_weight_1_Data_Out_Weight_0[511 : 504];
  end

  always @(*) begin
    compute_weight_in_2[7 : 0] = load_weight_1_Data_Out_Weight_0[519 : 512];
    compute_weight_in_2[15 : 8] = load_weight_1_Data_Out_Weight_0[527 : 520];
    compute_weight_in_2[23 : 16] = load_weight_1_Data_Out_Weight_0[535 : 528];
    compute_weight_in_2[31 : 24] = load_weight_1_Data_Out_Weight_0[543 : 536];
    compute_weight_in_2[39 : 32] = load_weight_1_Data_Out_Weight_0[551 : 544];
    compute_weight_in_2[47 : 40] = load_weight_1_Data_Out_Weight_0[559 : 552];
    compute_weight_in_2[55 : 48] = load_weight_1_Data_Out_Weight_0[567 : 560];
    compute_weight_in_2[63 : 56] = load_weight_1_Data_Out_Weight_0[575 : 568];
    compute_weight_in_2[71 : 64] = load_weight_1_Data_Out_Weight_0[583 : 576];
    compute_weight_in_2[79 : 72] = load_weight_1_Data_Out_Weight_0[591 : 584];
    compute_weight_in_2[87 : 80] = load_weight_1_Data_Out_Weight_0[599 : 592];
    compute_weight_in_2[95 : 88] = load_weight_1_Data_Out_Weight_0[607 : 600];
    compute_weight_in_2[103 : 96] = load_weight_1_Data_Out_Weight_0[615 : 608];
    compute_weight_in_2[111 : 104] = load_weight_1_Data_Out_Weight_0[623 : 616];
    compute_weight_in_2[119 : 112] = load_weight_1_Data_Out_Weight_0[631 : 624];
    compute_weight_in_2[127 : 120] = load_weight_1_Data_Out_Weight_0[639 : 632];
    compute_weight_in_2[135 : 128] = load_weight_1_Data_Out_Weight_0[647 : 640];
    compute_weight_in_2[143 : 136] = load_weight_1_Data_Out_Weight_0[655 : 648];
    compute_weight_in_2[151 : 144] = load_weight_1_Data_Out_Weight_0[663 : 656];
    compute_weight_in_2[159 : 152] = load_weight_1_Data_Out_Weight_0[671 : 664];
    compute_weight_in_2[167 : 160] = load_weight_1_Data_Out_Weight_0[679 : 672];
    compute_weight_in_2[175 : 168] = load_weight_1_Data_Out_Weight_0[687 : 680];
    compute_weight_in_2[183 : 176] = load_weight_1_Data_Out_Weight_0[695 : 688];
    compute_weight_in_2[191 : 184] = load_weight_1_Data_Out_Weight_0[703 : 696];
    compute_weight_in_2[199 : 192] = load_weight_1_Data_Out_Weight_0[711 : 704];
    compute_weight_in_2[207 : 200] = load_weight_1_Data_Out_Weight_0[719 : 712];
    compute_weight_in_2[215 : 208] = load_weight_1_Data_Out_Weight_0[727 : 720];
    compute_weight_in_2[223 : 216] = load_weight_1_Data_Out_Weight_0[735 : 728];
    compute_weight_in_2[231 : 224] = load_weight_1_Data_Out_Weight_0[743 : 736];
    compute_weight_in_2[239 : 232] = load_weight_1_Data_Out_Weight_0[751 : 744];
    compute_weight_in_2[247 : 240] = load_weight_1_Data_Out_Weight_0[759 : 752];
    compute_weight_in_2[255 : 248] = load_weight_1_Data_Out_Weight_0[767 : 760];
  end

  always @(*) begin
    compute_weight_in_3[7 : 0] = load_weight_1_Data_Out_Weight_0[775 : 768];
    compute_weight_in_3[15 : 8] = load_weight_1_Data_Out_Weight_0[783 : 776];
    compute_weight_in_3[23 : 16] = load_weight_1_Data_Out_Weight_0[791 : 784];
    compute_weight_in_3[31 : 24] = load_weight_1_Data_Out_Weight_0[799 : 792];
    compute_weight_in_3[39 : 32] = load_weight_1_Data_Out_Weight_0[807 : 800];
    compute_weight_in_3[47 : 40] = load_weight_1_Data_Out_Weight_0[815 : 808];
    compute_weight_in_3[55 : 48] = load_weight_1_Data_Out_Weight_0[823 : 816];
    compute_weight_in_3[63 : 56] = load_weight_1_Data_Out_Weight_0[831 : 824];
    compute_weight_in_3[71 : 64] = load_weight_1_Data_Out_Weight_0[839 : 832];
    compute_weight_in_3[79 : 72] = load_weight_1_Data_Out_Weight_0[847 : 840];
    compute_weight_in_3[87 : 80] = load_weight_1_Data_Out_Weight_0[855 : 848];
    compute_weight_in_3[95 : 88] = load_weight_1_Data_Out_Weight_0[863 : 856];
    compute_weight_in_3[103 : 96] = load_weight_1_Data_Out_Weight_0[871 : 864];
    compute_weight_in_3[111 : 104] = load_weight_1_Data_Out_Weight_0[879 : 872];
    compute_weight_in_3[119 : 112] = load_weight_1_Data_Out_Weight_0[887 : 880];
    compute_weight_in_3[127 : 120] = load_weight_1_Data_Out_Weight_0[895 : 888];
    compute_weight_in_3[135 : 128] = load_weight_1_Data_Out_Weight_0[903 : 896];
    compute_weight_in_3[143 : 136] = load_weight_1_Data_Out_Weight_0[911 : 904];
    compute_weight_in_3[151 : 144] = load_weight_1_Data_Out_Weight_0[919 : 912];
    compute_weight_in_3[159 : 152] = load_weight_1_Data_Out_Weight_0[927 : 920];
    compute_weight_in_3[167 : 160] = load_weight_1_Data_Out_Weight_0[935 : 928];
    compute_weight_in_3[175 : 168] = load_weight_1_Data_Out_Weight_0[943 : 936];
    compute_weight_in_3[183 : 176] = load_weight_1_Data_Out_Weight_0[951 : 944];
    compute_weight_in_3[191 : 184] = load_weight_1_Data_Out_Weight_0[959 : 952];
    compute_weight_in_3[199 : 192] = load_weight_1_Data_Out_Weight_0[967 : 960];
    compute_weight_in_3[207 : 200] = load_weight_1_Data_Out_Weight_0[975 : 968];
    compute_weight_in_3[215 : 208] = load_weight_1_Data_Out_Weight_0[983 : 976];
    compute_weight_in_3[223 : 216] = load_weight_1_Data_Out_Weight_0[991 : 984];
    compute_weight_in_3[231 : 224] = load_weight_1_Data_Out_Weight_0[999 : 992];
    compute_weight_in_3[239 : 232] = load_weight_1_Data_Out_Weight_0[1007 : 1000];
    compute_weight_in_3[247 : 240] = load_weight_1_Data_Out_Weight_0[1015 : 1008];
    compute_weight_in_3[255 : 248] = load_weight_1_Data_Out_Weight_0[1023 : 1016];
  end

  always @(*) begin
    compute_weight_in_4[7 : 0] = load_weight_1_Data_Out_Weight_0[1031 : 1024];
    compute_weight_in_4[15 : 8] = load_weight_1_Data_Out_Weight_0[1039 : 1032];
    compute_weight_in_4[23 : 16] = load_weight_1_Data_Out_Weight_0[1047 : 1040];
    compute_weight_in_4[31 : 24] = load_weight_1_Data_Out_Weight_0[1055 : 1048];
    compute_weight_in_4[39 : 32] = load_weight_1_Data_Out_Weight_0[1063 : 1056];
    compute_weight_in_4[47 : 40] = load_weight_1_Data_Out_Weight_0[1071 : 1064];
    compute_weight_in_4[55 : 48] = load_weight_1_Data_Out_Weight_0[1079 : 1072];
    compute_weight_in_4[63 : 56] = load_weight_1_Data_Out_Weight_0[1087 : 1080];
    compute_weight_in_4[71 : 64] = load_weight_1_Data_Out_Weight_0[1095 : 1088];
    compute_weight_in_4[79 : 72] = load_weight_1_Data_Out_Weight_0[1103 : 1096];
    compute_weight_in_4[87 : 80] = load_weight_1_Data_Out_Weight_0[1111 : 1104];
    compute_weight_in_4[95 : 88] = load_weight_1_Data_Out_Weight_0[1119 : 1112];
    compute_weight_in_4[103 : 96] = load_weight_1_Data_Out_Weight_0[1127 : 1120];
    compute_weight_in_4[111 : 104] = load_weight_1_Data_Out_Weight_0[1135 : 1128];
    compute_weight_in_4[119 : 112] = load_weight_1_Data_Out_Weight_0[1143 : 1136];
    compute_weight_in_4[127 : 120] = load_weight_1_Data_Out_Weight_0[1151 : 1144];
    compute_weight_in_4[135 : 128] = load_weight_1_Data_Out_Weight_0[1159 : 1152];
    compute_weight_in_4[143 : 136] = load_weight_1_Data_Out_Weight_0[1167 : 1160];
    compute_weight_in_4[151 : 144] = load_weight_1_Data_Out_Weight_0[1175 : 1168];
    compute_weight_in_4[159 : 152] = load_weight_1_Data_Out_Weight_0[1183 : 1176];
    compute_weight_in_4[167 : 160] = load_weight_1_Data_Out_Weight_0[1191 : 1184];
    compute_weight_in_4[175 : 168] = load_weight_1_Data_Out_Weight_0[1199 : 1192];
    compute_weight_in_4[183 : 176] = load_weight_1_Data_Out_Weight_0[1207 : 1200];
    compute_weight_in_4[191 : 184] = load_weight_1_Data_Out_Weight_0[1215 : 1208];
    compute_weight_in_4[199 : 192] = load_weight_1_Data_Out_Weight_0[1223 : 1216];
    compute_weight_in_4[207 : 200] = load_weight_1_Data_Out_Weight_0[1231 : 1224];
    compute_weight_in_4[215 : 208] = load_weight_1_Data_Out_Weight_0[1239 : 1232];
    compute_weight_in_4[223 : 216] = load_weight_1_Data_Out_Weight_0[1247 : 1240];
    compute_weight_in_4[231 : 224] = load_weight_1_Data_Out_Weight_0[1255 : 1248];
    compute_weight_in_4[239 : 232] = load_weight_1_Data_Out_Weight_0[1263 : 1256];
    compute_weight_in_4[247 : 240] = load_weight_1_Data_Out_Weight_0[1271 : 1264];
    compute_weight_in_4[255 : 248] = load_weight_1_Data_Out_Weight_0[1279 : 1272];
  end

  always @(*) begin
    compute_weight_in_5[7 : 0] = load_weight_1_Data_Out_Weight_0[1287 : 1280];
    compute_weight_in_5[15 : 8] = load_weight_1_Data_Out_Weight_0[1295 : 1288];
    compute_weight_in_5[23 : 16] = load_weight_1_Data_Out_Weight_0[1303 : 1296];
    compute_weight_in_5[31 : 24] = load_weight_1_Data_Out_Weight_0[1311 : 1304];
    compute_weight_in_5[39 : 32] = load_weight_1_Data_Out_Weight_0[1319 : 1312];
    compute_weight_in_5[47 : 40] = load_weight_1_Data_Out_Weight_0[1327 : 1320];
    compute_weight_in_5[55 : 48] = load_weight_1_Data_Out_Weight_0[1335 : 1328];
    compute_weight_in_5[63 : 56] = load_weight_1_Data_Out_Weight_0[1343 : 1336];
    compute_weight_in_5[71 : 64] = load_weight_1_Data_Out_Weight_0[1351 : 1344];
    compute_weight_in_5[79 : 72] = load_weight_1_Data_Out_Weight_0[1359 : 1352];
    compute_weight_in_5[87 : 80] = load_weight_1_Data_Out_Weight_0[1367 : 1360];
    compute_weight_in_5[95 : 88] = load_weight_1_Data_Out_Weight_0[1375 : 1368];
    compute_weight_in_5[103 : 96] = load_weight_1_Data_Out_Weight_0[1383 : 1376];
    compute_weight_in_5[111 : 104] = load_weight_1_Data_Out_Weight_0[1391 : 1384];
    compute_weight_in_5[119 : 112] = load_weight_1_Data_Out_Weight_0[1399 : 1392];
    compute_weight_in_5[127 : 120] = load_weight_1_Data_Out_Weight_0[1407 : 1400];
    compute_weight_in_5[135 : 128] = load_weight_1_Data_Out_Weight_0[1415 : 1408];
    compute_weight_in_5[143 : 136] = load_weight_1_Data_Out_Weight_0[1423 : 1416];
    compute_weight_in_5[151 : 144] = load_weight_1_Data_Out_Weight_0[1431 : 1424];
    compute_weight_in_5[159 : 152] = load_weight_1_Data_Out_Weight_0[1439 : 1432];
    compute_weight_in_5[167 : 160] = load_weight_1_Data_Out_Weight_0[1447 : 1440];
    compute_weight_in_5[175 : 168] = load_weight_1_Data_Out_Weight_0[1455 : 1448];
    compute_weight_in_5[183 : 176] = load_weight_1_Data_Out_Weight_0[1463 : 1456];
    compute_weight_in_5[191 : 184] = load_weight_1_Data_Out_Weight_0[1471 : 1464];
    compute_weight_in_5[199 : 192] = load_weight_1_Data_Out_Weight_0[1479 : 1472];
    compute_weight_in_5[207 : 200] = load_weight_1_Data_Out_Weight_0[1487 : 1480];
    compute_weight_in_5[215 : 208] = load_weight_1_Data_Out_Weight_0[1495 : 1488];
    compute_weight_in_5[223 : 216] = load_weight_1_Data_Out_Weight_0[1503 : 1496];
    compute_weight_in_5[231 : 224] = load_weight_1_Data_Out_Weight_0[1511 : 1504];
    compute_weight_in_5[239 : 232] = load_weight_1_Data_Out_Weight_0[1519 : 1512];
    compute_weight_in_5[247 : 240] = load_weight_1_Data_Out_Weight_0[1527 : 1520];
    compute_weight_in_5[255 : 248] = load_weight_1_Data_Out_Weight_0[1535 : 1528];
  end

  always @(*) begin
    compute_weight_in_6[7 : 0] = load_weight_1_Data_Out_Weight_0[1543 : 1536];
    compute_weight_in_6[15 : 8] = load_weight_1_Data_Out_Weight_0[1551 : 1544];
    compute_weight_in_6[23 : 16] = load_weight_1_Data_Out_Weight_0[1559 : 1552];
    compute_weight_in_6[31 : 24] = load_weight_1_Data_Out_Weight_0[1567 : 1560];
    compute_weight_in_6[39 : 32] = load_weight_1_Data_Out_Weight_0[1575 : 1568];
    compute_weight_in_6[47 : 40] = load_weight_1_Data_Out_Weight_0[1583 : 1576];
    compute_weight_in_6[55 : 48] = load_weight_1_Data_Out_Weight_0[1591 : 1584];
    compute_weight_in_6[63 : 56] = load_weight_1_Data_Out_Weight_0[1599 : 1592];
    compute_weight_in_6[71 : 64] = load_weight_1_Data_Out_Weight_0[1607 : 1600];
    compute_weight_in_6[79 : 72] = load_weight_1_Data_Out_Weight_0[1615 : 1608];
    compute_weight_in_6[87 : 80] = load_weight_1_Data_Out_Weight_0[1623 : 1616];
    compute_weight_in_6[95 : 88] = load_weight_1_Data_Out_Weight_0[1631 : 1624];
    compute_weight_in_6[103 : 96] = load_weight_1_Data_Out_Weight_0[1639 : 1632];
    compute_weight_in_6[111 : 104] = load_weight_1_Data_Out_Weight_0[1647 : 1640];
    compute_weight_in_6[119 : 112] = load_weight_1_Data_Out_Weight_0[1655 : 1648];
    compute_weight_in_6[127 : 120] = load_weight_1_Data_Out_Weight_0[1663 : 1656];
    compute_weight_in_6[135 : 128] = load_weight_1_Data_Out_Weight_0[1671 : 1664];
    compute_weight_in_6[143 : 136] = load_weight_1_Data_Out_Weight_0[1679 : 1672];
    compute_weight_in_6[151 : 144] = load_weight_1_Data_Out_Weight_0[1687 : 1680];
    compute_weight_in_6[159 : 152] = load_weight_1_Data_Out_Weight_0[1695 : 1688];
    compute_weight_in_6[167 : 160] = load_weight_1_Data_Out_Weight_0[1703 : 1696];
    compute_weight_in_6[175 : 168] = load_weight_1_Data_Out_Weight_0[1711 : 1704];
    compute_weight_in_6[183 : 176] = load_weight_1_Data_Out_Weight_0[1719 : 1712];
    compute_weight_in_6[191 : 184] = load_weight_1_Data_Out_Weight_0[1727 : 1720];
    compute_weight_in_6[199 : 192] = load_weight_1_Data_Out_Weight_0[1735 : 1728];
    compute_weight_in_6[207 : 200] = load_weight_1_Data_Out_Weight_0[1743 : 1736];
    compute_weight_in_6[215 : 208] = load_weight_1_Data_Out_Weight_0[1751 : 1744];
    compute_weight_in_6[223 : 216] = load_weight_1_Data_Out_Weight_0[1759 : 1752];
    compute_weight_in_6[231 : 224] = load_weight_1_Data_Out_Weight_0[1767 : 1760];
    compute_weight_in_6[239 : 232] = load_weight_1_Data_Out_Weight_0[1775 : 1768];
    compute_weight_in_6[247 : 240] = load_weight_1_Data_Out_Weight_0[1783 : 1776];
    compute_weight_in_6[255 : 248] = load_weight_1_Data_Out_Weight_0[1791 : 1784];
  end

  always @(*) begin
    compute_weight_in_7[7 : 0] = load_weight_1_Data_Out_Weight_0[1799 : 1792];
    compute_weight_in_7[15 : 8] = load_weight_1_Data_Out_Weight_0[1807 : 1800];
    compute_weight_in_7[23 : 16] = load_weight_1_Data_Out_Weight_0[1815 : 1808];
    compute_weight_in_7[31 : 24] = load_weight_1_Data_Out_Weight_0[1823 : 1816];
    compute_weight_in_7[39 : 32] = load_weight_1_Data_Out_Weight_0[1831 : 1824];
    compute_weight_in_7[47 : 40] = load_weight_1_Data_Out_Weight_0[1839 : 1832];
    compute_weight_in_7[55 : 48] = load_weight_1_Data_Out_Weight_0[1847 : 1840];
    compute_weight_in_7[63 : 56] = load_weight_1_Data_Out_Weight_0[1855 : 1848];
    compute_weight_in_7[71 : 64] = load_weight_1_Data_Out_Weight_0[1863 : 1856];
    compute_weight_in_7[79 : 72] = load_weight_1_Data_Out_Weight_0[1871 : 1864];
    compute_weight_in_7[87 : 80] = load_weight_1_Data_Out_Weight_0[1879 : 1872];
    compute_weight_in_7[95 : 88] = load_weight_1_Data_Out_Weight_0[1887 : 1880];
    compute_weight_in_7[103 : 96] = load_weight_1_Data_Out_Weight_0[1895 : 1888];
    compute_weight_in_7[111 : 104] = load_weight_1_Data_Out_Weight_0[1903 : 1896];
    compute_weight_in_7[119 : 112] = load_weight_1_Data_Out_Weight_0[1911 : 1904];
    compute_weight_in_7[127 : 120] = load_weight_1_Data_Out_Weight_0[1919 : 1912];
    compute_weight_in_7[135 : 128] = load_weight_1_Data_Out_Weight_0[1927 : 1920];
    compute_weight_in_7[143 : 136] = load_weight_1_Data_Out_Weight_0[1935 : 1928];
    compute_weight_in_7[151 : 144] = load_weight_1_Data_Out_Weight_0[1943 : 1936];
    compute_weight_in_7[159 : 152] = load_weight_1_Data_Out_Weight_0[1951 : 1944];
    compute_weight_in_7[167 : 160] = load_weight_1_Data_Out_Weight_0[1959 : 1952];
    compute_weight_in_7[175 : 168] = load_weight_1_Data_Out_Weight_0[1967 : 1960];
    compute_weight_in_7[183 : 176] = load_weight_1_Data_Out_Weight_0[1975 : 1968];
    compute_weight_in_7[191 : 184] = load_weight_1_Data_Out_Weight_0[1983 : 1976];
    compute_weight_in_7[199 : 192] = load_weight_1_Data_Out_Weight_0[1991 : 1984];
    compute_weight_in_7[207 : 200] = load_weight_1_Data_Out_Weight_0[1999 : 1992];
    compute_weight_in_7[215 : 208] = load_weight_1_Data_Out_Weight_0[2007 : 2000];
    compute_weight_in_7[223 : 216] = load_weight_1_Data_Out_Weight_0[2015 : 2008];
    compute_weight_in_7[231 : 224] = load_weight_1_Data_Out_Weight_0[2023 : 2016];
    compute_weight_in_7[239 : 232] = load_weight_1_Data_Out_Weight_0[2031 : 2024];
    compute_weight_in_7[247 : 240] = load_weight_1_Data_Out_Weight_0[2039 : 2032];
    compute_weight_in_7[255 : 248] = load_weight_1_Data_Out_Weight_0[2047 : 2040];
  end

  assign compute_weight_in_delay_0 = compute_weight_in_0_regNext;
  assign compute_weight_in_delay_1 = compute_weight_in_1_regNext;
  assign compute_weight_in_delay_2 = compute_weight_in_2_regNext;
  assign compute_weight_in_delay_3 = compute_weight_in_3_regNext;
  assign compute_weight_in_delay_4 = compute_weight_in_4_regNext;
  assign compute_weight_in_delay_5 = compute_weight_in_5_regNext;
  assign compute_weight_in_delay_6 = compute_weight_in_6_regNext;
  assign compute_weight_in_delay_7 = compute_weight_in_7_regNext;
  assign mul_add_simd_256_weightIn = compute_weight_in_delay_0[7 : 0];
  always @(*) begin
    compute_data_out_0[15 : 0] = mul_add_simd_256_dataOut;
    compute_data_out_0[31 : 16] = mul_add_simd_257_dataOut;
    compute_data_out_0[47 : 32] = mul_add_simd_258_dataOut;
    compute_data_out_0[63 : 48] = mul_add_simd_259_dataOut;
    compute_data_out_0[79 : 64] = mul_add_simd_260_dataOut;
    compute_data_out_0[95 : 80] = mul_add_simd_261_dataOut;
    compute_data_out_0[111 : 96] = mul_add_simd_262_dataOut;
    compute_data_out_0[127 : 112] = mul_add_simd_263_dataOut;
    compute_data_out_0[143 : 128] = mul_add_simd_264_dataOut;
    compute_data_out_0[159 : 144] = mul_add_simd_265_dataOut;
    compute_data_out_0[175 : 160] = mul_add_simd_266_dataOut;
    compute_data_out_0[191 : 176] = mul_add_simd_267_dataOut;
    compute_data_out_0[207 : 192] = mul_add_simd_268_dataOut;
    compute_data_out_0[223 : 208] = mul_add_simd_269_dataOut;
    compute_data_out_0[239 : 224] = mul_add_simd_270_dataOut;
    compute_data_out_0[255 : 240] = mul_add_simd_271_dataOut;
    compute_data_out_0[271 : 256] = mul_add_simd_272_dataOut;
    compute_data_out_0[287 : 272] = mul_add_simd_273_dataOut;
    compute_data_out_0[303 : 288] = mul_add_simd_274_dataOut;
    compute_data_out_0[319 : 304] = mul_add_simd_275_dataOut;
    compute_data_out_0[335 : 320] = mul_add_simd_276_dataOut;
    compute_data_out_0[351 : 336] = mul_add_simd_277_dataOut;
    compute_data_out_0[367 : 352] = mul_add_simd_278_dataOut;
    compute_data_out_0[383 : 368] = mul_add_simd_279_dataOut;
    compute_data_out_0[399 : 384] = mul_add_simd_280_dataOut;
    compute_data_out_0[415 : 400] = mul_add_simd_281_dataOut;
    compute_data_out_0[431 : 416] = mul_add_simd_282_dataOut;
    compute_data_out_0[447 : 432] = mul_add_simd_283_dataOut;
    compute_data_out_0[463 : 448] = mul_add_simd_284_dataOut;
    compute_data_out_0[479 : 464] = mul_add_simd_285_dataOut;
    compute_data_out_0[495 : 480] = mul_add_simd_286_dataOut;
    compute_data_out_0[511 : 496] = mul_add_simd_287_dataOut;
  end

  assign mul_add_simd_257_weightIn = compute_weight_in_delay_0[15 : 8];
  assign mul_add_simd_258_weightIn = compute_weight_in_delay_0[23 : 16];
  assign mul_add_simd_259_weightIn = compute_weight_in_delay_0[31 : 24];
  assign mul_add_simd_260_weightIn = compute_weight_in_delay_0[39 : 32];
  assign mul_add_simd_261_weightIn = compute_weight_in_delay_0[47 : 40];
  assign mul_add_simd_262_weightIn = compute_weight_in_delay_0[55 : 48];
  assign mul_add_simd_263_weightIn = compute_weight_in_delay_0[63 : 56];
  assign mul_add_simd_264_weightIn = compute_weight_in_delay_0[71 : 64];
  assign mul_add_simd_265_weightIn = compute_weight_in_delay_0[79 : 72];
  assign mul_add_simd_266_weightIn = compute_weight_in_delay_0[87 : 80];
  assign mul_add_simd_267_weightIn = compute_weight_in_delay_0[95 : 88];
  assign mul_add_simd_268_weightIn = compute_weight_in_delay_0[103 : 96];
  assign mul_add_simd_269_weightIn = compute_weight_in_delay_0[111 : 104];
  assign mul_add_simd_270_weightIn = compute_weight_in_delay_0[119 : 112];
  assign mul_add_simd_271_weightIn = compute_weight_in_delay_0[127 : 120];
  assign mul_add_simd_272_weightIn = compute_weight_in_delay_0[135 : 128];
  assign mul_add_simd_273_weightIn = compute_weight_in_delay_0[143 : 136];
  assign mul_add_simd_274_weightIn = compute_weight_in_delay_0[151 : 144];
  assign mul_add_simd_275_weightIn = compute_weight_in_delay_0[159 : 152];
  assign mul_add_simd_276_weightIn = compute_weight_in_delay_0[167 : 160];
  assign mul_add_simd_277_weightIn = compute_weight_in_delay_0[175 : 168];
  assign mul_add_simd_278_weightIn = compute_weight_in_delay_0[183 : 176];
  assign mul_add_simd_279_weightIn = compute_weight_in_delay_0[191 : 184];
  assign mul_add_simd_280_weightIn = compute_weight_in_delay_0[199 : 192];
  assign mul_add_simd_281_weightIn = compute_weight_in_delay_0[207 : 200];
  assign mul_add_simd_282_weightIn = compute_weight_in_delay_0[215 : 208];
  assign mul_add_simd_283_weightIn = compute_weight_in_delay_0[223 : 216];
  assign mul_add_simd_284_weightIn = compute_weight_in_delay_0[231 : 224];
  assign mul_add_simd_285_weightIn = compute_weight_in_delay_0[239 : 232];
  assign mul_add_simd_286_weightIn = compute_weight_in_delay_0[247 : 240];
  assign mul_add_simd_287_weightIn = compute_weight_in_delay_0[255 : 248];
  assign mul_add_simd_288_weightIn = compute_weight_in_delay_1[7 : 0];
  always @(*) begin
    compute_data_out_1[15 : 0] = mul_add_simd_288_dataOut;
    compute_data_out_1[31 : 16] = mul_add_simd_289_dataOut;
    compute_data_out_1[47 : 32] = mul_add_simd_290_dataOut;
    compute_data_out_1[63 : 48] = mul_add_simd_291_dataOut;
    compute_data_out_1[79 : 64] = mul_add_simd_292_dataOut;
    compute_data_out_1[95 : 80] = mul_add_simd_293_dataOut;
    compute_data_out_1[111 : 96] = mul_add_simd_294_dataOut;
    compute_data_out_1[127 : 112] = mul_add_simd_295_dataOut;
    compute_data_out_1[143 : 128] = mul_add_simd_296_dataOut;
    compute_data_out_1[159 : 144] = mul_add_simd_297_dataOut;
    compute_data_out_1[175 : 160] = mul_add_simd_298_dataOut;
    compute_data_out_1[191 : 176] = mul_add_simd_299_dataOut;
    compute_data_out_1[207 : 192] = mul_add_simd_300_dataOut;
    compute_data_out_1[223 : 208] = mul_add_simd_301_dataOut;
    compute_data_out_1[239 : 224] = mul_add_simd_302_dataOut;
    compute_data_out_1[255 : 240] = mul_add_simd_303_dataOut;
    compute_data_out_1[271 : 256] = mul_add_simd_304_dataOut;
    compute_data_out_1[287 : 272] = mul_add_simd_305_dataOut;
    compute_data_out_1[303 : 288] = mul_add_simd_306_dataOut;
    compute_data_out_1[319 : 304] = mul_add_simd_307_dataOut;
    compute_data_out_1[335 : 320] = mul_add_simd_308_dataOut;
    compute_data_out_1[351 : 336] = mul_add_simd_309_dataOut;
    compute_data_out_1[367 : 352] = mul_add_simd_310_dataOut;
    compute_data_out_1[383 : 368] = mul_add_simd_311_dataOut;
    compute_data_out_1[399 : 384] = mul_add_simd_312_dataOut;
    compute_data_out_1[415 : 400] = mul_add_simd_313_dataOut;
    compute_data_out_1[431 : 416] = mul_add_simd_314_dataOut;
    compute_data_out_1[447 : 432] = mul_add_simd_315_dataOut;
    compute_data_out_1[463 : 448] = mul_add_simd_316_dataOut;
    compute_data_out_1[479 : 464] = mul_add_simd_317_dataOut;
    compute_data_out_1[495 : 480] = mul_add_simd_318_dataOut;
    compute_data_out_1[511 : 496] = mul_add_simd_319_dataOut;
  end

  assign mul_add_simd_289_weightIn = compute_weight_in_delay_1[15 : 8];
  assign mul_add_simd_290_weightIn = compute_weight_in_delay_1[23 : 16];
  assign mul_add_simd_291_weightIn = compute_weight_in_delay_1[31 : 24];
  assign mul_add_simd_292_weightIn = compute_weight_in_delay_1[39 : 32];
  assign mul_add_simd_293_weightIn = compute_weight_in_delay_1[47 : 40];
  assign mul_add_simd_294_weightIn = compute_weight_in_delay_1[55 : 48];
  assign mul_add_simd_295_weightIn = compute_weight_in_delay_1[63 : 56];
  assign mul_add_simd_296_weightIn = compute_weight_in_delay_1[71 : 64];
  assign mul_add_simd_297_weightIn = compute_weight_in_delay_1[79 : 72];
  assign mul_add_simd_298_weightIn = compute_weight_in_delay_1[87 : 80];
  assign mul_add_simd_299_weightIn = compute_weight_in_delay_1[95 : 88];
  assign mul_add_simd_300_weightIn = compute_weight_in_delay_1[103 : 96];
  assign mul_add_simd_301_weightIn = compute_weight_in_delay_1[111 : 104];
  assign mul_add_simd_302_weightIn = compute_weight_in_delay_1[119 : 112];
  assign mul_add_simd_303_weightIn = compute_weight_in_delay_1[127 : 120];
  assign mul_add_simd_304_weightIn = compute_weight_in_delay_1[135 : 128];
  assign mul_add_simd_305_weightIn = compute_weight_in_delay_1[143 : 136];
  assign mul_add_simd_306_weightIn = compute_weight_in_delay_1[151 : 144];
  assign mul_add_simd_307_weightIn = compute_weight_in_delay_1[159 : 152];
  assign mul_add_simd_308_weightIn = compute_weight_in_delay_1[167 : 160];
  assign mul_add_simd_309_weightIn = compute_weight_in_delay_1[175 : 168];
  assign mul_add_simd_310_weightIn = compute_weight_in_delay_1[183 : 176];
  assign mul_add_simd_311_weightIn = compute_weight_in_delay_1[191 : 184];
  assign mul_add_simd_312_weightIn = compute_weight_in_delay_1[199 : 192];
  assign mul_add_simd_313_weightIn = compute_weight_in_delay_1[207 : 200];
  assign mul_add_simd_314_weightIn = compute_weight_in_delay_1[215 : 208];
  assign mul_add_simd_315_weightIn = compute_weight_in_delay_1[223 : 216];
  assign mul_add_simd_316_weightIn = compute_weight_in_delay_1[231 : 224];
  assign mul_add_simd_317_weightIn = compute_weight_in_delay_1[239 : 232];
  assign mul_add_simd_318_weightIn = compute_weight_in_delay_1[247 : 240];
  assign mul_add_simd_319_weightIn = compute_weight_in_delay_1[255 : 248];
  assign mul_add_simd_320_weightIn = compute_weight_in_delay_2[7 : 0];
  always @(*) begin
    compute_data_out_2[15 : 0] = mul_add_simd_320_dataOut;
    compute_data_out_2[31 : 16] = mul_add_simd_321_dataOut;
    compute_data_out_2[47 : 32] = mul_add_simd_322_dataOut;
    compute_data_out_2[63 : 48] = mul_add_simd_323_dataOut;
    compute_data_out_2[79 : 64] = mul_add_simd_324_dataOut;
    compute_data_out_2[95 : 80] = mul_add_simd_325_dataOut;
    compute_data_out_2[111 : 96] = mul_add_simd_326_dataOut;
    compute_data_out_2[127 : 112] = mul_add_simd_327_dataOut;
    compute_data_out_2[143 : 128] = mul_add_simd_328_dataOut;
    compute_data_out_2[159 : 144] = mul_add_simd_329_dataOut;
    compute_data_out_2[175 : 160] = mul_add_simd_330_dataOut;
    compute_data_out_2[191 : 176] = mul_add_simd_331_dataOut;
    compute_data_out_2[207 : 192] = mul_add_simd_332_dataOut;
    compute_data_out_2[223 : 208] = mul_add_simd_333_dataOut;
    compute_data_out_2[239 : 224] = mul_add_simd_334_dataOut;
    compute_data_out_2[255 : 240] = mul_add_simd_335_dataOut;
    compute_data_out_2[271 : 256] = mul_add_simd_336_dataOut;
    compute_data_out_2[287 : 272] = mul_add_simd_337_dataOut;
    compute_data_out_2[303 : 288] = mul_add_simd_338_dataOut;
    compute_data_out_2[319 : 304] = mul_add_simd_339_dataOut;
    compute_data_out_2[335 : 320] = mul_add_simd_340_dataOut;
    compute_data_out_2[351 : 336] = mul_add_simd_341_dataOut;
    compute_data_out_2[367 : 352] = mul_add_simd_342_dataOut;
    compute_data_out_2[383 : 368] = mul_add_simd_343_dataOut;
    compute_data_out_2[399 : 384] = mul_add_simd_344_dataOut;
    compute_data_out_2[415 : 400] = mul_add_simd_345_dataOut;
    compute_data_out_2[431 : 416] = mul_add_simd_346_dataOut;
    compute_data_out_2[447 : 432] = mul_add_simd_347_dataOut;
    compute_data_out_2[463 : 448] = mul_add_simd_348_dataOut;
    compute_data_out_2[479 : 464] = mul_add_simd_349_dataOut;
    compute_data_out_2[495 : 480] = mul_add_simd_350_dataOut;
    compute_data_out_2[511 : 496] = mul_add_simd_351_dataOut;
  end

  assign mul_add_simd_321_weightIn = compute_weight_in_delay_2[15 : 8];
  assign mul_add_simd_322_weightIn = compute_weight_in_delay_2[23 : 16];
  assign mul_add_simd_323_weightIn = compute_weight_in_delay_2[31 : 24];
  assign mul_add_simd_324_weightIn = compute_weight_in_delay_2[39 : 32];
  assign mul_add_simd_325_weightIn = compute_weight_in_delay_2[47 : 40];
  assign mul_add_simd_326_weightIn = compute_weight_in_delay_2[55 : 48];
  assign mul_add_simd_327_weightIn = compute_weight_in_delay_2[63 : 56];
  assign mul_add_simd_328_weightIn = compute_weight_in_delay_2[71 : 64];
  assign mul_add_simd_329_weightIn = compute_weight_in_delay_2[79 : 72];
  assign mul_add_simd_330_weightIn = compute_weight_in_delay_2[87 : 80];
  assign mul_add_simd_331_weightIn = compute_weight_in_delay_2[95 : 88];
  assign mul_add_simd_332_weightIn = compute_weight_in_delay_2[103 : 96];
  assign mul_add_simd_333_weightIn = compute_weight_in_delay_2[111 : 104];
  assign mul_add_simd_334_weightIn = compute_weight_in_delay_2[119 : 112];
  assign mul_add_simd_335_weightIn = compute_weight_in_delay_2[127 : 120];
  assign mul_add_simd_336_weightIn = compute_weight_in_delay_2[135 : 128];
  assign mul_add_simd_337_weightIn = compute_weight_in_delay_2[143 : 136];
  assign mul_add_simd_338_weightIn = compute_weight_in_delay_2[151 : 144];
  assign mul_add_simd_339_weightIn = compute_weight_in_delay_2[159 : 152];
  assign mul_add_simd_340_weightIn = compute_weight_in_delay_2[167 : 160];
  assign mul_add_simd_341_weightIn = compute_weight_in_delay_2[175 : 168];
  assign mul_add_simd_342_weightIn = compute_weight_in_delay_2[183 : 176];
  assign mul_add_simd_343_weightIn = compute_weight_in_delay_2[191 : 184];
  assign mul_add_simd_344_weightIn = compute_weight_in_delay_2[199 : 192];
  assign mul_add_simd_345_weightIn = compute_weight_in_delay_2[207 : 200];
  assign mul_add_simd_346_weightIn = compute_weight_in_delay_2[215 : 208];
  assign mul_add_simd_347_weightIn = compute_weight_in_delay_2[223 : 216];
  assign mul_add_simd_348_weightIn = compute_weight_in_delay_2[231 : 224];
  assign mul_add_simd_349_weightIn = compute_weight_in_delay_2[239 : 232];
  assign mul_add_simd_350_weightIn = compute_weight_in_delay_2[247 : 240];
  assign mul_add_simd_351_weightIn = compute_weight_in_delay_2[255 : 248];
  assign mul_add_simd_352_weightIn = compute_weight_in_delay_3[7 : 0];
  always @(*) begin
    compute_data_out_3[15 : 0] = mul_add_simd_352_dataOut;
    compute_data_out_3[31 : 16] = mul_add_simd_353_dataOut;
    compute_data_out_3[47 : 32] = mul_add_simd_354_dataOut;
    compute_data_out_3[63 : 48] = mul_add_simd_355_dataOut;
    compute_data_out_3[79 : 64] = mul_add_simd_356_dataOut;
    compute_data_out_3[95 : 80] = mul_add_simd_357_dataOut;
    compute_data_out_3[111 : 96] = mul_add_simd_358_dataOut;
    compute_data_out_3[127 : 112] = mul_add_simd_359_dataOut;
    compute_data_out_3[143 : 128] = mul_add_simd_360_dataOut;
    compute_data_out_3[159 : 144] = mul_add_simd_361_dataOut;
    compute_data_out_3[175 : 160] = mul_add_simd_362_dataOut;
    compute_data_out_3[191 : 176] = mul_add_simd_363_dataOut;
    compute_data_out_3[207 : 192] = mul_add_simd_364_dataOut;
    compute_data_out_3[223 : 208] = mul_add_simd_365_dataOut;
    compute_data_out_3[239 : 224] = mul_add_simd_366_dataOut;
    compute_data_out_3[255 : 240] = mul_add_simd_367_dataOut;
    compute_data_out_3[271 : 256] = mul_add_simd_368_dataOut;
    compute_data_out_3[287 : 272] = mul_add_simd_369_dataOut;
    compute_data_out_3[303 : 288] = mul_add_simd_370_dataOut;
    compute_data_out_3[319 : 304] = mul_add_simd_371_dataOut;
    compute_data_out_3[335 : 320] = mul_add_simd_372_dataOut;
    compute_data_out_3[351 : 336] = mul_add_simd_373_dataOut;
    compute_data_out_3[367 : 352] = mul_add_simd_374_dataOut;
    compute_data_out_3[383 : 368] = mul_add_simd_375_dataOut;
    compute_data_out_3[399 : 384] = mul_add_simd_376_dataOut;
    compute_data_out_3[415 : 400] = mul_add_simd_377_dataOut;
    compute_data_out_3[431 : 416] = mul_add_simd_378_dataOut;
    compute_data_out_3[447 : 432] = mul_add_simd_379_dataOut;
    compute_data_out_3[463 : 448] = mul_add_simd_380_dataOut;
    compute_data_out_3[479 : 464] = mul_add_simd_381_dataOut;
    compute_data_out_3[495 : 480] = mul_add_simd_382_dataOut;
    compute_data_out_3[511 : 496] = mul_add_simd_383_dataOut;
  end

  assign mul_add_simd_353_weightIn = compute_weight_in_delay_3[15 : 8];
  assign mul_add_simd_354_weightIn = compute_weight_in_delay_3[23 : 16];
  assign mul_add_simd_355_weightIn = compute_weight_in_delay_3[31 : 24];
  assign mul_add_simd_356_weightIn = compute_weight_in_delay_3[39 : 32];
  assign mul_add_simd_357_weightIn = compute_weight_in_delay_3[47 : 40];
  assign mul_add_simd_358_weightIn = compute_weight_in_delay_3[55 : 48];
  assign mul_add_simd_359_weightIn = compute_weight_in_delay_3[63 : 56];
  assign mul_add_simd_360_weightIn = compute_weight_in_delay_3[71 : 64];
  assign mul_add_simd_361_weightIn = compute_weight_in_delay_3[79 : 72];
  assign mul_add_simd_362_weightIn = compute_weight_in_delay_3[87 : 80];
  assign mul_add_simd_363_weightIn = compute_weight_in_delay_3[95 : 88];
  assign mul_add_simd_364_weightIn = compute_weight_in_delay_3[103 : 96];
  assign mul_add_simd_365_weightIn = compute_weight_in_delay_3[111 : 104];
  assign mul_add_simd_366_weightIn = compute_weight_in_delay_3[119 : 112];
  assign mul_add_simd_367_weightIn = compute_weight_in_delay_3[127 : 120];
  assign mul_add_simd_368_weightIn = compute_weight_in_delay_3[135 : 128];
  assign mul_add_simd_369_weightIn = compute_weight_in_delay_3[143 : 136];
  assign mul_add_simd_370_weightIn = compute_weight_in_delay_3[151 : 144];
  assign mul_add_simd_371_weightIn = compute_weight_in_delay_3[159 : 152];
  assign mul_add_simd_372_weightIn = compute_weight_in_delay_3[167 : 160];
  assign mul_add_simd_373_weightIn = compute_weight_in_delay_3[175 : 168];
  assign mul_add_simd_374_weightIn = compute_weight_in_delay_3[183 : 176];
  assign mul_add_simd_375_weightIn = compute_weight_in_delay_3[191 : 184];
  assign mul_add_simd_376_weightIn = compute_weight_in_delay_3[199 : 192];
  assign mul_add_simd_377_weightIn = compute_weight_in_delay_3[207 : 200];
  assign mul_add_simd_378_weightIn = compute_weight_in_delay_3[215 : 208];
  assign mul_add_simd_379_weightIn = compute_weight_in_delay_3[223 : 216];
  assign mul_add_simd_380_weightIn = compute_weight_in_delay_3[231 : 224];
  assign mul_add_simd_381_weightIn = compute_weight_in_delay_3[239 : 232];
  assign mul_add_simd_382_weightIn = compute_weight_in_delay_3[247 : 240];
  assign mul_add_simd_383_weightIn = compute_weight_in_delay_3[255 : 248];
  assign mul_add_simd_384_weightIn = compute_weight_in_delay_4[7 : 0];
  always @(*) begin
    compute_data_out_4[15 : 0] = mul_add_simd_384_dataOut;
    compute_data_out_4[31 : 16] = mul_add_simd_385_dataOut;
    compute_data_out_4[47 : 32] = mul_add_simd_386_dataOut;
    compute_data_out_4[63 : 48] = mul_add_simd_387_dataOut;
    compute_data_out_4[79 : 64] = mul_add_simd_388_dataOut;
    compute_data_out_4[95 : 80] = mul_add_simd_389_dataOut;
    compute_data_out_4[111 : 96] = mul_add_simd_390_dataOut;
    compute_data_out_4[127 : 112] = mul_add_simd_391_dataOut;
    compute_data_out_4[143 : 128] = mul_add_simd_392_dataOut;
    compute_data_out_4[159 : 144] = mul_add_simd_393_dataOut;
    compute_data_out_4[175 : 160] = mul_add_simd_394_dataOut;
    compute_data_out_4[191 : 176] = mul_add_simd_395_dataOut;
    compute_data_out_4[207 : 192] = mul_add_simd_396_dataOut;
    compute_data_out_4[223 : 208] = mul_add_simd_397_dataOut;
    compute_data_out_4[239 : 224] = mul_add_simd_398_dataOut;
    compute_data_out_4[255 : 240] = mul_add_simd_399_dataOut;
    compute_data_out_4[271 : 256] = mul_add_simd_400_dataOut;
    compute_data_out_4[287 : 272] = mul_add_simd_401_dataOut;
    compute_data_out_4[303 : 288] = mul_add_simd_402_dataOut;
    compute_data_out_4[319 : 304] = mul_add_simd_403_dataOut;
    compute_data_out_4[335 : 320] = mul_add_simd_404_dataOut;
    compute_data_out_4[351 : 336] = mul_add_simd_405_dataOut;
    compute_data_out_4[367 : 352] = mul_add_simd_406_dataOut;
    compute_data_out_4[383 : 368] = mul_add_simd_407_dataOut;
    compute_data_out_4[399 : 384] = mul_add_simd_408_dataOut;
    compute_data_out_4[415 : 400] = mul_add_simd_409_dataOut;
    compute_data_out_4[431 : 416] = mul_add_simd_410_dataOut;
    compute_data_out_4[447 : 432] = mul_add_simd_411_dataOut;
    compute_data_out_4[463 : 448] = mul_add_simd_412_dataOut;
    compute_data_out_4[479 : 464] = mul_add_simd_413_dataOut;
    compute_data_out_4[495 : 480] = mul_add_simd_414_dataOut;
    compute_data_out_4[511 : 496] = mul_add_simd_415_dataOut;
  end

  assign mul_add_simd_385_weightIn = compute_weight_in_delay_4[15 : 8];
  assign mul_add_simd_386_weightIn = compute_weight_in_delay_4[23 : 16];
  assign mul_add_simd_387_weightIn = compute_weight_in_delay_4[31 : 24];
  assign mul_add_simd_388_weightIn = compute_weight_in_delay_4[39 : 32];
  assign mul_add_simd_389_weightIn = compute_weight_in_delay_4[47 : 40];
  assign mul_add_simd_390_weightIn = compute_weight_in_delay_4[55 : 48];
  assign mul_add_simd_391_weightIn = compute_weight_in_delay_4[63 : 56];
  assign mul_add_simd_392_weightIn = compute_weight_in_delay_4[71 : 64];
  assign mul_add_simd_393_weightIn = compute_weight_in_delay_4[79 : 72];
  assign mul_add_simd_394_weightIn = compute_weight_in_delay_4[87 : 80];
  assign mul_add_simd_395_weightIn = compute_weight_in_delay_4[95 : 88];
  assign mul_add_simd_396_weightIn = compute_weight_in_delay_4[103 : 96];
  assign mul_add_simd_397_weightIn = compute_weight_in_delay_4[111 : 104];
  assign mul_add_simd_398_weightIn = compute_weight_in_delay_4[119 : 112];
  assign mul_add_simd_399_weightIn = compute_weight_in_delay_4[127 : 120];
  assign mul_add_simd_400_weightIn = compute_weight_in_delay_4[135 : 128];
  assign mul_add_simd_401_weightIn = compute_weight_in_delay_4[143 : 136];
  assign mul_add_simd_402_weightIn = compute_weight_in_delay_4[151 : 144];
  assign mul_add_simd_403_weightIn = compute_weight_in_delay_4[159 : 152];
  assign mul_add_simd_404_weightIn = compute_weight_in_delay_4[167 : 160];
  assign mul_add_simd_405_weightIn = compute_weight_in_delay_4[175 : 168];
  assign mul_add_simd_406_weightIn = compute_weight_in_delay_4[183 : 176];
  assign mul_add_simd_407_weightIn = compute_weight_in_delay_4[191 : 184];
  assign mul_add_simd_408_weightIn = compute_weight_in_delay_4[199 : 192];
  assign mul_add_simd_409_weightIn = compute_weight_in_delay_4[207 : 200];
  assign mul_add_simd_410_weightIn = compute_weight_in_delay_4[215 : 208];
  assign mul_add_simd_411_weightIn = compute_weight_in_delay_4[223 : 216];
  assign mul_add_simd_412_weightIn = compute_weight_in_delay_4[231 : 224];
  assign mul_add_simd_413_weightIn = compute_weight_in_delay_4[239 : 232];
  assign mul_add_simd_414_weightIn = compute_weight_in_delay_4[247 : 240];
  assign mul_add_simd_415_weightIn = compute_weight_in_delay_4[255 : 248];
  assign mul_add_simd_416_weightIn = compute_weight_in_delay_5[7 : 0];
  always @(*) begin
    compute_data_out_5[15 : 0] = mul_add_simd_416_dataOut;
    compute_data_out_5[31 : 16] = mul_add_simd_417_dataOut;
    compute_data_out_5[47 : 32] = mul_add_simd_418_dataOut;
    compute_data_out_5[63 : 48] = mul_add_simd_419_dataOut;
    compute_data_out_5[79 : 64] = mul_add_simd_420_dataOut;
    compute_data_out_5[95 : 80] = mul_add_simd_421_dataOut;
    compute_data_out_5[111 : 96] = mul_add_simd_422_dataOut;
    compute_data_out_5[127 : 112] = mul_add_simd_423_dataOut;
    compute_data_out_5[143 : 128] = mul_add_simd_424_dataOut;
    compute_data_out_5[159 : 144] = mul_add_simd_425_dataOut;
    compute_data_out_5[175 : 160] = mul_add_simd_426_dataOut;
    compute_data_out_5[191 : 176] = mul_add_simd_427_dataOut;
    compute_data_out_5[207 : 192] = mul_add_simd_428_dataOut;
    compute_data_out_5[223 : 208] = mul_add_simd_429_dataOut;
    compute_data_out_5[239 : 224] = mul_add_simd_430_dataOut;
    compute_data_out_5[255 : 240] = mul_add_simd_431_dataOut;
    compute_data_out_5[271 : 256] = mul_add_simd_432_dataOut;
    compute_data_out_5[287 : 272] = mul_add_simd_433_dataOut;
    compute_data_out_5[303 : 288] = mul_add_simd_434_dataOut;
    compute_data_out_5[319 : 304] = mul_add_simd_435_dataOut;
    compute_data_out_5[335 : 320] = mul_add_simd_436_dataOut;
    compute_data_out_5[351 : 336] = mul_add_simd_437_dataOut;
    compute_data_out_5[367 : 352] = mul_add_simd_438_dataOut;
    compute_data_out_5[383 : 368] = mul_add_simd_439_dataOut;
    compute_data_out_5[399 : 384] = mul_add_simd_440_dataOut;
    compute_data_out_5[415 : 400] = mul_add_simd_441_dataOut;
    compute_data_out_5[431 : 416] = mul_add_simd_442_dataOut;
    compute_data_out_5[447 : 432] = mul_add_simd_443_dataOut;
    compute_data_out_5[463 : 448] = mul_add_simd_444_dataOut;
    compute_data_out_5[479 : 464] = mul_add_simd_445_dataOut;
    compute_data_out_5[495 : 480] = mul_add_simd_446_dataOut;
    compute_data_out_5[511 : 496] = mul_add_simd_447_dataOut;
  end

  assign mul_add_simd_417_weightIn = compute_weight_in_delay_5[15 : 8];
  assign mul_add_simd_418_weightIn = compute_weight_in_delay_5[23 : 16];
  assign mul_add_simd_419_weightIn = compute_weight_in_delay_5[31 : 24];
  assign mul_add_simd_420_weightIn = compute_weight_in_delay_5[39 : 32];
  assign mul_add_simd_421_weightIn = compute_weight_in_delay_5[47 : 40];
  assign mul_add_simd_422_weightIn = compute_weight_in_delay_5[55 : 48];
  assign mul_add_simd_423_weightIn = compute_weight_in_delay_5[63 : 56];
  assign mul_add_simd_424_weightIn = compute_weight_in_delay_5[71 : 64];
  assign mul_add_simd_425_weightIn = compute_weight_in_delay_5[79 : 72];
  assign mul_add_simd_426_weightIn = compute_weight_in_delay_5[87 : 80];
  assign mul_add_simd_427_weightIn = compute_weight_in_delay_5[95 : 88];
  assign mul_add_simd_428_weightIn = compute_weight_in_delay_5[103 : 96];
  assign mul_add_simd_429_weightIn = compute_weight_in_delay_5[111 : 104];
  assign mul_add_simd_430_weightIn = compute_weight_in_delay_5[119 : 112];
  assign mul_add_simd_431_weightIn = compute_weight_in_delay_5[127 : 120];
  assign mul_add_simd_432_weightIn = compute_weight_in_delay_5[135 : 128];
  assign mul_add_simd_433_weightIn = compute_weight_in_delay_5[143 : 136];
  assign mul_add_simd_434_weightIn = compute_weight_in_delay_5[151 : 144];
  assign mul_add_simd_435_weightIn = compute_weight_in_delay_5[159 : 152];
  assign mul_add_simd_436_weightIn = compute_weight_in_delay_5[167 : 160];
  assign mul_add_simd_437_weightIn = compute_weight_in_delay_5[175 : 168];
  assign mul_add_simd_438_weightIn = compute_weight_in_delay_5[183 : 176];
  assign mul_add_simd_439_weightIn = compute_weight_in_delay_5[191 : 184];
  assign mul_add_simd_440_weightIn = compute_weight_in_delay_5[199 : 192];
  assign mul_add_simd_441_weightIn = compute_weight_in_delay_5[207 : 200];
  assign mul_add_simd_442_weightIn = compute_weight_in_delay_5[215 : 208];
  assign mul_add_simd_443_weightIn = compute_weight_in_delay_5[223 : 216];
  assign mul_add_simd_444_weightIn = compute_weight_in_delay_5[231 : 224];
  assign mul_add_simd_445_weightIn = compute_weight_in_delay_5[239 : 232];
  assign mul_add_simd_446_weightIn = compute_weight_in_delay_5[247 : 240];
  assign mul_add_simd_447_weightIn = compute_weight_in_delay_5[255 : 248];
  assign mul_add_simd_448_weightIn = compute_weight_in_delay_6[7 : 0];
  always @(*) begin
    compute_data_out_6[15 : 0] = mul_add_simd_448_dataOut;
    compute_data_out_6[31 : 16] = mul_add_simd_449_dataOut;
    compute_data_out_6[47 : 32] = mul_add_simd_450_dataOut;
    compute_data_out_6[63 : 48] = mul_add_simd_451_dataOut;
    compute_data_out_6[79 : 64] = mul_add_simd_452_dataOut;
    compute_data_out_6[95 : 80] = mul_add_simd_453_dataOut;
    compute_data_out_6[111 : 96] = mul_add_simd_454_dataOut;
    compute_data_out_6[127 : 112] = mul_add_simd_455_dataOut;
    compute_data_out_6[143 : 128] = mul_add_simd_456_dataOut;
    compute_data_out_6[159 : 144] = mul_add_simd_457_dataOut;
    compute_data_out_6[175 : 160] = mul_add_simd_458_dataOut;
    compute_data_out_6[191 : 176] = mul_add_simd_459_dataOut;
    compute_data_out_6[207 : 192] = mul_add_simd_460_dataOut;
    compute_data_out_6[223 : 208] = mul_add_simd_461_dataOut;
    compute_data_out_6[239 : 224] = mul_add_simd_462_dataOut;
    compute_data_out_6[255 : 240] = mul_add_simd_463_dataOut;
    compute_data_out_6[271 : 256] = mul_add_simd_464_dataOut;
    compute_data_out_6[287 : 272] = mul_add_simd_465_dataOut;
    compute_data_out_6[303 : 288] = mul_add_simd_466_dataOut;
    compute_data_out_6[319 : 304] = mul_add_simd_467_dataOut;
    compute_data_out_6[335 : 320] = mul_add_simd_468_dataOut;
    compute_data_out_6[351 : 336] = mul_add_simd_469_dataOut;
    compute_data_out_6[367 : 352] = mul_add_simd_470_dataOut;
    compute_data_out_6[383 : 368] = mul_add_simd_471_dataOut;
    compute_data_out_6[399 : 384] = mul_add_simd_472_dataOut;
    compute_data_out_6[415 : 400] = mul_add_simd_473_dataOut;
    compute_data_out_6[431 : 416] = mul_add_simd_474_dataOut;
    compute_data_out_6[447 : 432] = mul_add_simd_475_dataOut;
    compute_data_out_6[463 : 448] = mul_add_simd_476_dataOut;
    compute_data_out_6[479 : 464] = mul_add_simd_477_dataOut;
    compute_data_out_6[495 : 480] = mul_add_simd_478_dataOut;
    compute_data_out_6[511 : 496] = mul_add_simd_479_dataOut;
  end

  assign mul_add_simd_449_weightIn = compute_weight_in_delay_6[15 : 8];
  assign mul_add_simd_450_weightIn = compute_weight_in_delay_6[23 : 16];
  assign mul_add_simd_451_weightIn = compute_weight_in_delay_6[31 : 24];
  assign mul_add_simd_452_weightIn = compute_weight_in_delay_6[39 : 32];
  assign mul_add_simd_453_weightIn = compute_weight_in_delay_6[47 : 40];
  assign mul_add_simd_454_weightIn = compute_weight_in_delay_6[55 : 48];
  assign mul_add_simd_455_weightIn = compute_weight_in_delay_6[63 : 56];
  assign mul_add_simd_456_weightIn = compute_weight_in_delay_6[71 : 64];
  assign mul_add_simd_457_weightIn = compute_weight_in_delay_6[79 : 72];
  assign mul_add_simd_458_weightIn = compute_weight_in_delay_6[87 : 80];
  assign mul_add_simd_459_weightIn = compute_weight_in_delay_6[95 : 88];
  assign mul_add_simd_460_weightIn = compute_weight_in_delay_6[103 : 96];
  assign mul_add_simd_461_weightIn = compute_weight_in_delay_6[111 : 104];
  assign mul_add_simd_462_weightIn = compute_weight_in_delay_6[119 : 112];
  assign mul_add_simd_463_weightIn = compute_weight_in_delay_6[127 : 120];
  assign mul_add_simd_464_weightIn = compute_weight_in_delay_6[135 : 128];
  assign mul_add_simd_465_weightIn = compute_weight_in_delay_6[143 : 136];
  assign mul_add_simd_466_weightIn = compute_weight_in_delay_6[151 : 144];
  assign mul_add_simd_467_weightIn = compute_weight_in_delay_6[159 : 152];
  assign mul_add_simd_468_weightIn = compute_weight_in_delay_6[167 : 160];
  assign mul_add_simd_469_weightIn = compute_weight_in_delay_6[175 : 168];
  assign mul_add_simd_470_weightIn = compute_weight_in_delay_6[183 : 176];
  assign mul_add_simd_471_weightIn = compute_weight_in_delay_6[191 : 184];
  assign mul_add_simd_472_weightIn = compute_weight_in_delay_6[199 : 192];
  assign mul_add_simd_473_weightIn = compute_weight_in_delay_6[207 : 200];
  assign mul_add_simd_474_weightIn = compute_weight_in_delay_6[215 : 208];
  assign mul_add_simd_475_weightIn = compute_weight_in_delay_6[223 : 216];
  assign mul_add_simd_476_weightIn = compute_weight_in_delay_6[231 : 224];
  assign mul_add_simd_477_weightIn = compute_weight_in_delay_6[239 : 232];
  assign mul_add_simd_478_weightIn = compute_weight_in_delay_6[247 : 240];
  assign mul_add_simd_479_weightIn = compute_weight_in_delay_6[255 : 248];
  assign mul_add_simd_480_weightIn = compute_weight_in_delay_7[7 : 0];
  always @(*) begin
    compute_data_out_7[15 : 0] = mul_add_simd_480_dataOut;
    compute_data_out_7[31 : 16] = mul_add_simd_481_dataOut;
    compute_data_out_7[47 : 32] = mul_add_simd_482_dataOut;
    compute_data_out_7[63 : 48] = mul_add_simd_483_dataOut;
    compute_data_out_7[79 : 64] = mul_add_simd_484_dataOut;
    compute_data_out_7[95 : 80] = mul_add_simd_485_dataOut;
    compute_data_out_7[111 : 96] = mul_add_simd_486_dataOut;
    compute_data_out_7[127 : 112] = mul_add_simd_487_dataOut;
    compute_data_out_7[143 : 128] = mul_add_simd_488_dataOut;
    compute_data_out_7[159 : 144] = mul_add_simd_489_dataOut;
    compute_data_out_7[175 : 160] = mul_add_simd_490_dataOut;
    compute_data_out_7[191 : 176] = mul_add_simd_491_dataOut;
    compute_data_out_7[207 : 192] = mul_add_simd_492_dataOut;
    compute_data_out_7[223 : 208] = mul_add_simd_493_dataOut;
    compute_data_out_7[239 : 224] = mul_add_simd_494_dataOut;
    compute_data_out_7[255 : 240] = mul_add_simd_495_dataOut;
    compute_data_out_7[271 : 256] = mul_add_simd_496_dataOut;
    compute_data_out_7[287 : 272] = mul_add_simd_497_dataOut;
    compute_data_out_7[303 : 288] = mul_add_simd_498_dataOut;
    compute_data_out_7[319 : 304] = mul_add_simd_499_dataOut;
    compute_data_out_7[335 : 320] = mul_add_simd_500_dataOut;
    compute_data_out_7[351 : 336] = mul_add_simd_501_dataOut;
    compute_data_out_7[367 : 352] = mul_add_simd_502_dataOut;
    compute_data_out_7[383 : 368] = mul_add_simd_503_dataOut;
    compute_data_out_7[399 : 384] = mul_add_simd_504_dataOut;
    compute_data_out_7[415 : 400] = mul_add_simd_505_dataOut;
    compute_data_out_7[431 : 416] = mul_add_simd_506_dataOut;
    compute_data_out_7[447 : 432] = mul_add_simd_507_dataOut;
    compute_data_out_7[463 : 448] = mul_add_simd_508_dataOut;
    compute_data_out_7[479 : 464] = mul_add_simd_509_dataOut;
    compute_data_out_7[495 : 480] = mul_add_simd_510_dataOut;
    compute_data_out_7[511 : 496] = mul_add_simd_511_dataOut;
  end

  assign mul_add_simd_481_weightIn = compute_weight_in_delay_7[15 : 8];
  assign mul_add_simd_482_weightIn = compute_weight_in_delay_7[23 : 16];
  assign mul_add_simd_483_weightIn = compute_weight_in_delay_7[31 : 24];
  assign mul_add_simd_484_weightIn = compute_weight_in_delay_7[39 : 32];
  assign mul_add_simd_485_weightIn = compute_weight_in_delay_7[47 : 40];
  assign mul_add_simd_486_weightIn = compute_weight_in_delay_7[55 : 48];
  assign mul_add_simd_487_weightIn = compute_weight_in_delay_7[63 : 56];
  assign mul_add_simd_488_weightIn = compute_weight_in_delay_7[71 : 64];
  assign mul_add_simd_489_weightIn = compute_weight_in_delay_7[79 : 72];
  assign mul_add_simd_490_weightIn = compute_weight_in_delay_7[87 : 80];
  assign mul_add_simd_491_weightIn = compute_weight_in_delay_7[95 : 88];
  assign mul_add_simd_492_weightIn = compute_weight_in_delay_7[103 : 96];
  assign mul_add_simd_493_weightIn = compute_weight_in_delay_7[111 : 104];
  assign mul_add_simd_494_weightIn = compute_weight_in_delay_7[119 : 112];
  assign mul_add_simd_495_weightIn = compute_weight_in_delay_7[127 : 120];
  assign mul_add_simd_496_weightIn = compute_weight_in_delay_7[135 : 128];
  assign mul_add_simd_497_weightIn = compute_weight_in_delay_7[143 : 136];
  assign mul_add_simd_498_weightIn = compute_weight_in_delay_7[151 : 144];
  assign mul_add_simd_499_weightIn = compute_weight_in_delay_7[159 : 152];
  assign mul_add_simd_500_weightIn = compute_weight_in_delay_7[167 : 160];
  assign mul_add_simd_501_weightIn = compute_weight_in_delay_7[175 : 168];
  assign mul_add_simd_502_weightIn = compute_weight_in_delay_7[183 : 176];
  assign mul_add_simd_503_weightIn = compute_weight_in_delay_7[191 : 184];
  assign mul_add_simd_504_weightIn = compute_weight_in_delay_7[199 : 192];
  assign mul_add_simd_505_weightIn = compute_weight_in_delay_7[207 : 200];
  assign mul_add_simd_506_weightIn = compute_weight_in_delay_7[215 : 208];
  assign mul_add_simd_507_weightIn = compute_weight_in_delay_7[223 : 216];
  assign mul_add_simd_508_weightIn = compute_weight_in_delay_7[231 : 224];
  assign mul_add_simd_509_weightIn = compute_weight_in_delay_7[239 : 232];
  assign mul_add_simd_510_weightIn = compute_weight_in_delay_7[247 : 240];
  assign mul_add_simd_511_weightIn = compute_weight_in_delay_7[255 : 248];
  assign data_result_temp_0 = channel_in_acc_8_data_out;
  assign data_result_temp_1 = channel_in_acc_9_data_out;
  assign data_result_temp_2 = channel_in_acc_10_data_out;
  assign data_result_temp_3 = channel_in_acc_11_data_out;
  assign data_result_temp_4 = channel_in_acc_12_data_out;
  assign data_result_temp_5 = channel_in_acc_13_data_out;
  assign data_result_temp_6 = channel_in_acc_14_data_out;
  assign data_result_temp_7 = channel_in_acc_15_data_out;
  always @(*) begin
    M_DATA_payload[31 : 0] = channel_out_acc_8_data_out;
    M_DATA_payload[63 : 32] = channel_out_acc_9_data_out;
    M_DATA_payload[95 : 64] = channel_out_acc_10_data_out;
    M_DATA_payload[127 : 96] = channel_out_acc_11_data_out;
    M_DATA_payload[159 : 128] = channel_out_acc_12_data_out;
    M_DATA_payload[191 : 160] = channel_out_acc_13_data_out;
    M_DATA_payload[223 : 192] = channel_out_acc_14_data_out;
    M_DATA_payload[255 : 224] = channel_out_acc_15_data_out;
  end

  always @(posedge clk) begin
    ram_temp_output_data_delay_1 <= ram_temp_output_data;
    ram_temp_output_data_delay <= ram_temp_output_data_delay_1;
    compute_weight_in_0_regNext <= compute_weight_in_0;
    compute_weight_in_1_regNext <= compute_weight_in_1;
    compute_weight_in_2_regNext <= compute_weight_in_2;
    compute_weight_in_3_regNext <= compute_weight_in_3;
    compute_weight_in_4_regNext <= compute_weight_in_4;
    compute_weight_in_5_regNext <= compute_weight_in_5;
    compute_weight_in_6_regNext <= compute_weight_in_6;
    compute_weight_in_7_regNext <= compute_weight_in_7;
  end


endmodule

//channel_out_acc replaced by channel_out_acc

//channel_out_acc replaced by channel_out_acc

//channel_out_acc replaced by channel_out_acc

//channel_out_acc replaced by channel_out_acc

//channel_out_acc replaced by channel_out_acc

//channel_out_acc replaced by channel_out_acc

//channel_out_acc replaced by channel_out_acc

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

//channel_in_acc replaced by channel_in_acc

//channel_in_acc replaced by channel_in_acc

//channel_in_acc replaced by channel_in_acc

//channel_in_acc replaced by channel_in_acc

//channel_in_acc replaced by channel_in_acc

//channel_in_acc replaced by channel_in_acc

//channel_in_acc replaced by channel_in_acc

module channel_in_acc (
  input      [511:0]  data_in,
  output     [31:0]   data_out,
  input               clk
);
  wire       [31:0]   channel_in_thirty_two_times_acc_8_data_out;

  channel_in_thirty_two_times_acc channel_in_thirty_two_times_acc_8 (
    .data_in     (data_in                                     ), //i
    .data_out    (channel_in_thirty_two_times_acc_8_data_out  ), //o
    .clk         (clk                                         )  //i
  );
  assign data_out = channel_in_thirty_two_times_acc_8_data_out;

endmodule

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

//mul_add_simd replaced by mul_add_simd

module mul_add_simd (
  input      [7:0]    dataIn,
  input      [7:0]    weightIn,
  output     [15:0]   dataOut,
  input               clk,
  input               reset
);
  wire       [7:0]    mul_simd_256_data_in;
  wire       [7:0]    mul_simd_256_weight_in;
  wire       [15:0]   mul_simd_256_data_out;
  wire       [15:0]   mul_data_out_0;
  reg        [15:0]   mul_data_out_0_delay_1;
  reg        [15:0]   mul_data_out_0_delay_2;
  reg        [15:0]   mul_data_out_0_delay_3;
  reg        [15:0]   mul_data_out_0_delay_4;
  reg        [15:0]   mul_data_out_0_delay_5;
  reg        [15:0]   mul_data_out_0_delay_6;
  reg        [15:0]   mul_data_out_0_delay_7;
  reg        [15:0]   mul_data_out_0_delay_8;

  mul_simd mul_simd_256 (
    .data_in      (mul_simd_256_data_in    ), //i
    .weight_in    (mul_simd_256_weight_in  ), //i
    .data_out     (mul_simd_256_data_out   ), //o
    .clk          (clk                     )  //i
  );
  assign mul_simd_256_data_in = dataIn[7 : 0];
  assign mul_simd_256_weight_in = weightIn[7 : 0];
  assign mul_data_out_0 = mul_simd_256_data_out;
  assign dataOut = mul_data_out_0_delay_8;
  always @(posedge clk) begin
    mul_data_out_0_delay_1 <= mul_data_out_0;
    mul_data_out_0_delay_2 <= mul_data_out_0_delay_1;
    mul_data_out_0_delay_3 <= mul_data_out_0_delay_2;
    mul_data_out_0_delay_4 <= mul_data_out_0_delay_3;
    mul_data_out_0_delay_5 <= mul_data_out_0_delay_4;
    mul_data_out_0_delay_6 <= mul_data_out_0_delay_5;
    mul_data_out_0_delay_7 <= mul_data_out_0_delay_6;
    mul_data_out_0_delay_8 <= mul_data_out_0_delay_7;
  end


endmodule

module sdpram_4 (
  output     [255:0]  doutb,
  input      [11:0]   addra,
  input      [11:0]   addrb,
  input      [255:0]  dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [255:0]  temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(12),
    .ADDR_WIDTH_B(12),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(256),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("distributed"),
    .MEMORY_SIZE(1048576),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(256),
    .READ_LATENCY_B(0),
    .READ_RESET_VALUE_B("0"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_EMBEDDED_CONSTRAINT(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep"),
    .WRITE_DATA_WIDTH_A(256),
    .WRITE_MODE_B("read_first") 
  ) temp (
    .dbiterrb          (temp_dbiterrb   ), //o
    .doutb             (temp_doutb      ), //o
    .sbiterrb          (temp_sbiterrb   ), //o
    .addra             (addra           ), //i
    .addrb             (addrb           ), //i
    .clka              (clk             ), //i
    .clkb              (clk             ), //i
    .dina              (dina            ), //i
    .ena               (ena             ), //i
    .enb               (enb             ), //i
    .injectdbiterra    (injectdbiterra  ), //i
    .injectsbiterra    (injectsbiterra  ), //i
    .regceb            (regceb          ), //i
    .rstb              (rstb            ), //i
    .sleep             (sleep           ), //i
    .wea               (wea             )  //i
  );
  assign injectdbiterra = 1'b0;
  assign injectsbiterra = 1'b0;
  assign regceb = 1'b1;
  assign rstb = 1'b0;
  assign sleep = 1'b0;
  assign dbiterrb = temp_dbiterrb;
  assign doutb = temp_doutb;
  assign sbiterrb = temp_sbiterrb;

endmodule

module general_fifo_sync (
  input               reset,
  input               clk,
  input      [63:0]   data_in,
  input               wr_en,
  output reg          data_in_ready,
  output     [255:0]  data_out,
  input               rd_en,
  output reg          data_out_valid,
  input      [11:0]   m_data_count,
  input      [11:0]   s_data_count,
  output              data_valid,
  output              full,
  output              empty
);
  wire                fifo_full;
  wire                fifo_empty;
  wire       [255:0]  fifo_dout;
  wire       [11:0]   fifo_wr_data_count;
  wire       [9:0]    fifo_rd_data_count;
  wire                fifo_data_valid;
  wire                fifo_rd_rst_busy;
  wire                fifo_wr_rst_busy;
  wire       [11:0]   _zz_when_general_fifo_sync_l39;
  wire       [11:0]   _zz_when_general_fifo_sync_l49;
  wire       [9:0]    _zz_when_general_fifo_sync_l49_1;
  wire                when_general_fifo_sync_l39;
  wire                when_general_fifo_sync_l49;

  assign _zz_when_general_fifo_sync_l39 = (fifo_wr_data_count + s_data_count);
  assign _zz_when_general_fifo_sync_l49_1 = fifo_rd_data_count;
  assign _zz_when_general_fifo_sync_l49 = {2'd0, _zz_when_general_fifo_sync_l49_1};
  fifo_sync fifo (
    .full             (fifo_full           ), //o
    .wr_en            (wr_en               ), //i
    .din              (data_in             ), //i
    .empty            (fifo_empty          ), //o
    .dout             (fifo_dout           ), //o
    .rd_en            (rd_en               ), //i
    .wr_data_count    (fifo_wr_data_count  ), //o
    .rd_data_count    (fifo_rd_data_count  ), //o
    .data_valid       (fifo_data_valid     ), //o
    .rd_rst_busy      (fifo_rd_rst_busy    ), //o
    .wr_rst_busy      (fifo_wr_rst_busy    ), //o
    .reset            (reset               ), //i
    .clk              (clk                 )  //i
  );
  assign data_valid = fifo_data_valid;
  assign full = fifo_full;
  assign empty = fifo_empty;
  assign data_out = fifo_dout;
  assign when_general_fifo_sync_l39 = (((! fifo_wr_rst_busy) && (_zz_when_general_fifo_sync_l39 < 12'h800)) && (! fifo_full));
  always @(*) begin
    if(when_general_fifo_sync_l39) begin
      data_in_ready = 1'b1;
    end else begin
      data_in_ready = 1'b0;
    end
  end

  assign when_general_fifo_sync_l49 = ((! fifo_rd_rst_busy) && (m_data_count <= _zz_when_general_fifo_sync_l49));
  always @(*) begin
    if(when_general_fifo_sync_l49) begin
      data_out_valid = 1'b1;
    end else begin
      data_out_valid = 1'b0;
    end
  end


endmodule

module load_weight (
  input               Start_Pa,
  input      [14:0]   Weight_Single_Num_REG,
  input      [7:0]    Bias_Num_REG,
  output reg          Write_Block_Complete,
  input               S_Para_Data_valid,
  output reg          S_Para_Data_ready,
  input      [63:0]   S_Para_Data_payload,
  input      [14:0]   Weight_Addrb,
  output     [2047:0] Data_Out_Weight_0,
  input      [7:0]    Bias_Addrb,
  output     [255:0]  Data_Out_Bias,
  output     [255:0]  Data_Out_Scale,
  output     [255:0]  Data_Out_Shift,
  input               clk,
  input               reset
);
  wire       [10:0]   fsm_Bias_ram_addra;
  wire       [8:0]    fsm_Bias_ram_addrb;
  wire       [0:0]    fsm_Bias_ram_wea;
  wire       [10:0]   fsm_Scale_ram_addra;
  wire       [8:0]    fsm_Scale_ram_addrb;
  wire       [0:0]    fsm_Scale_ram_wea;
  wire       [10:0]   fsm_Shift_ram_addra;
  wire       [8:0]    fsm_Shift_ram_addrb;
  wire       [0:0]    fsm_Shift_ram_wea;
  wire       [2047:0] fsm_Compute_3_3_Weight_io_weight_ram_data_out_0;
  wire       [255:0]  fsm_Bias_ram_doutb;
  wire       [255:0]  fsm_Scale_ram_doutb;
  wire       [255:0]  fsm_Shift_ram_doutb;
  wire       [14:0]   _zz_when_load_weight_l47;
  wire       [14:0]   _zz_when_load_weight_l78;
  wire       [7:0]    _zz_when_load_weight_l86;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [14:0]   fsm_Cnt_Single_Weight;
  reg                 fsm_En_Single_Ram;
  reg                 fsm_En_Single_Ram_Temp;
  wire                when_load_weight_l47;
  wire                when_load_weight_l54;
  reg        [0:0]    fsm_Cnt_Ram_Weight_Num;
  wire                when_load_weight_l67;
  reg                 fsm_En_Weight;
  wire                when_load_weight_l78;
  reg        [7:0]    fsm_Cnt_Bias;
  reg                 fsm_En_Bias;
  wire                when_load_weight_l86;
  wire                when_load_weight_l91;
  wire                when_load_weight_l99;
  wire                when_load_weight_l107;
  wire                when_load_weight_l119;
  wire                when_load_weight_l121;
  wire                when_load_weight_l126;
  reg        [0:0]    fsm_En_Weight_Nine_Temp;
  wire                when_load_weight_l133;
  wire                when_load_weight_l135;
  reg                 fsm_En_Wr_Weight;
  wire                when_load_weight_l145;
  reg        [0:0]    fsm_En_Weight_Nine;
  reg        [14:0]   fsm_Weight_Addra_Temp;
  wire                when_load_weight_l161;
  reg        [14:0]   fsm_Weight_Addra;
  reg        [63:0]   fsm_S_Data_One;
  reg                 fsm_En_Wr_Bias;
  wire                when_load_weight_l183;
  reg        [7:0]    fsm_Bias_Addra_Temp;
  wire                when_load_weight_l193;
  reg        [7:0]    fsm_Bias_Addra;
  reg        [63:0]   fsm_Bias_data;
  reg                 fsm_En_Wr_Scale;
  wire                when_load_weight_l216;
  reg        [7:0]    fsm_Scale_Addra_Temp;
  wire                when_load_weight_l226;
  reg        [7:0]    fsm_Scale_Addra;
  reg        [63:0]   fsm_Scale_data;
  reg                 fsm_En_Wr_Shift;
  wire                when_load_weight_l249;
  reg        [255:0]  fsm_Shift_Addra_Temp;
  wire                when_load_weight_l259;
  reg        [255:0]  fsm_Shift_Addra;
  reg        [63:0]   fsm_Shift_data;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_when_load_weight_l47 = (Weight_Single_Num_REG - 15'h0001);
  assign _zz_when_load_weight_l78 = (Weight_Single_Num_REG - 15'h0001);
  assign _zz_when_load_weight_l86 = (Bias_Num_REG - 8'h01);
  Compute_33Weight fsm_Compute_3_3_Weight (
    .io_weight_data_One          (fsm_S_Data_One                                   ), //i
    .io_weight_wr                (fsm_En_Weight_Nine                               ), //i
    .io_weight_addra             (fsm_Weight_Addra                                 ), //i
    .io_weight_addrb             (Weight_Addrb                                     ), //i
    .io_weight_ram_data_out_0    (fsm_Compute_3_3_Weight_io_weight_ram_data_out_0  ), //o
    .clk                         (clk                                              )  //i
  );
  sdpram_1 fsm_Bias_ram (
    .doutb    (fsm_Bias_ram_doutb  ), //o
    .addra    (fsm_Bias_ram_addra  ), //i
    .addrb    (fsm_Bias_ram_addrb  ), //i
    .dina     (fsm_Bias_data       ), //i
    .ena      (fsm_En_Wr_Bias      ), //i
    .enb      (1'b1                ), //i
    .wea      (fsm_Bias_ram_wea    ), //i
    .clk      (clk                 )  //i
  );
  sdpram_1 fsm_Scale_ram (
    .doutb    (fsm_Scale_ram_doutb  ), //o
    .addra    (fsm_Scale_ram_addra  ), //i
    .addrb    (fsm_Scale_ram_addrb  ), //i
    .dina     (fsm_Scale_data       ), //i
    .ena      (fsm_En_Wr_Scale      ), //i
    .enb      (1'b1                 ), //i
    .wea      (fsm_Scale_ram_wea    ), //i
    .clk      (clk                  )  //i
  );
  sdpram_1 fsm_Shift_ram (
    .doutb    (fsm_Shift_ram_doutb  ), //o
    .addra    (fsm_Shift_ram_addra  ), //i
    .addrb    (fsm_Shift_ram_addrb  ), //i
    .dina     (fsm_Shift_data       ), //i
    .ena      (fsm_En_Wr_Shift      ), //i
    .enb      (1'b1                 ), //i
    .wea      (fsm_Shift_ram_wea    ), //i
    .clk      (clk                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : fsm_stateReg_string = "fsm_Copy_Weight";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : fsm_stateReg_string = "fsm_Copy_Bias  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : fsm_stateReg_string = "fsm_Copy_Scale ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : fsm_stateReg_string = "fsm_Copy_Shift ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE       ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : fsm_stateNext_string = "fsm_Copy_Weight";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : fsm_stateNext_string = "fsm_Copy_Bias  ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : fsm_stateNext_string = "fsm_Copy_Scale ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : fsm_stateNext_string = "fsm_Copy_Shift ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_load_weight_l47 = (fsm_Cnt_Single_Weight == _zz_when_load_weight_l47);
  always @(*) begin
    if(when_load_weight_l47) begin
      fsm_En_Single_Ram = 1'b1;
    end else begin
      fsm_En_Single_Ram = 1'b0;
    end
  end

  assign when_load_weight_l78 = ((fsm_Cnt_Single_Weight == _zz_when_load_weight_l78) && (fsm_Cnt_Ram_Weight_Num == 1'b0));
  always @(*) begin
    if(when_load_weight_l78) begin
      fsm_En_Weight = 1'b1;
    end else begin
      fsm_En_Weight = 1'b0;
    end
  end

  assign when_load_weight_l86 = (fsm_Cnt_Bias == _zz_when_load_weight_l86);
  always @(*) begin
    if(when_load_weight_l86) begin
      fsm_En_Bias = 1'b1;
    end else begin
      fsm_En_Bias = 1'b0;
    end
  end

  assign when_load_weight_l121 = (((fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_1_binary_sequential_fsm_IDLE)) && (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift));
  assign when_load_weight_l126 = (((fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_1_binary_sequential_fsm_IDLE)) && (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift));
  always @(*) begin
    if(fsm_En_Wr_Weight) begin
      fsm_En_Weight_Nine = fsm_En_Weight_Nine_Temp;
    end else begin
      fsm_En_Weight_Nine = 1'b0;
    end
  end

  assign Data_Out_Weight_0 = fsm_Compute_3_3_Weight_io_weight_ram_data_out_0;
  assign fsm_Bias_ram_wea = 1'b1;
  assign fsm_Bias_ram_addra = {3'd0, fsm_Bias_Addra};
  assign Data_Out_Bias = fsm_Bias_ram_doutb;
  assign fsm_Bias_ram_addrb = {1'd0, Bias_Addrb};
  assign fsm_Scale_ram_wea = 1'b1;
  assign fsm_Scale_ram_addra = {3'd0, fsm_Scale_Addra};
  assign Data_Out_Scale = fsm_Scale_ram_doutb;
  assign fsm_Scale_ram_addrb = {1'd0, Bias_Addrb};
  assign fsm_Shift_ram_wea = 1'b1;
  assign fsm_Shift_ram_addra = fsm_Shift_Addra[10:0];
  assign Data_Out_Shift = fsm_Shift_ram_doutb;
  assign fsm_Shift_ram_addrb = {1'd0, Bias_Addrb};
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_IDLE : begin
        if(Start_Pa) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight : begin
        if(fsm_En_Weight) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias : begin
        if(fsm_En_Bias) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale : begin
        if(fsm_En_Bias) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift : begin
        if(fsm_En_Bias) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end
  end

  assign when_load_weight_l54 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l67 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l91 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l99 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l107 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift);
  assign when_load_weight_l119 = ((fsm_stateNext == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight) && (fsm_stateReg != `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight));
  assign when_load_weight_l133 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_IDLE);
  assign when_load_weight_l135 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l145 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l161 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Weight);
  assign when_load_weight_l183 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l193 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Bias);
  assign when_load_weight_l216 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l226 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Scale);
  assign when_load_weight_l249 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift);
  assign when_load_weight_l259 = (fsm_stateReg == `fsm_enumDefinition_1_binary_sequential_fsm_Copy_Shift);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      S_Para_Data_ready <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end else begin
      if(when_load_weight_l119) begin
        S_Para_Data_ready <= 1'b1;
      end else begin
        if(when_load_weight_l121) begin
          S_Para_Data_ready <= 1'b0;
        end else begin
          S_Para_Data_ready <= S_Para_Data_ready;
        end
      end
      fsm_stateReg <= fsm_stateNext;
    end
  end

  always @(posedge clk) begin
    if(when_load_weight_l47) begin
      fsm_En_Single_Ram_Temp <= 1'b1;
    end else begin
      fsm_En_Single_Ram_Temp <= 1'b0;
    end
    if(when_load_weight_l54) begin
      if(fsm_En_Single_Ram) begin
        fsm_Cnt_Single_Weight <= 15'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Cnt_Single_Weight <= (fsm_Cnt_Single_Weight + 15'h0001);
        end else begin
          fsm_Cnt_Single_Weight <= fsm_Cnt_Single_Weight;
        end
      end
    end else begin
      fsm_Cnt_Single_Weight <= 15'h0;
    end
    if(when_load_weight_l67) begin
      if(fsm_En_Single_Ram) begin
        fsm_Cnt_Ram_Weight_Num <= (fsm_Cnt_Ram_Weight_Num + 1'b1);
      end else begin
        fsm_Cnt_Ram_Weight_Num <= fsm_Cnt_Ram_Weight_Num;
      end
    end else begin
      fsm_Cnt_Ram_Weight_Num <= 1'b0;
    end
    if(when_load_weight_l91) begin
      if(fsm_En_Bias) begin
        fsm_Cnt_Bias <= 8'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Cnt_Bias <= (fsm_Cnt_Bias + 8'h01);
        end else begin
          fsm_Cnt_Bias <= fsm_Cnt_Bias;
        end
      end
    end else begin
      if(when_load_weight_l99) begin
        if(fsm_En_Bias) begin
          fsm_Cnt_Bias <= 8'h0;
        end else begin
          if(S_Para_Data_valid) begin
            fsm_Cnt_Bias <= (fsm_Cnt_Bias + 8'h01);
          end else begin
            fsm_Cnt_Bias <= fsm_Cnt_Bias;
          end
        end
      end else begin
        if(when_load_weight_l107) begin
          if(fsm_En_Bias) begin
            fsm_Cnt_Bias <= 8'h0;
          end else begin
            if(S_Para_Data_valid) begin
              fsm_Cnt_Bias <= (fsm_Cnt_Bias + 8'h01);
            end else begin
              fsm_Cnt_Bias <= fsm_Cnt_Bias;
            end
          end
        end else begin
          fsm_Cnt_Bias <= 8'h0;
        end
      end
    end
    if(when_load_weight_l126) begin
      Write_Block_Complete <= 1'b1;
    end else begin
      Write_Block_Complete <= 1'b0;
    end
    if(when_load_weight_l133) begin
      fsm_En_Weight_Nine_Temp <= 1'b1;
    end else begin
      if(when_load_weight_l135) begin
        if(fsm_En_Single_Ram_Temp) begin
          fsm_En_Weight_Nine_Temp <= fsm_En_Weight_Nine_Temp[0];
        end else begin
          fsm_En_Weight_Nine_Temp <= fsm_En_Weight_Nine_Temp;
        end
      end else begin
        fsm_En_Weight_Nine_Temp <= 1'b1;
      end
    end
    if(when_load_weight_l145) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Weight <= 1'b1;
      end else begin
        fsm_En_Wr_Weight <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Weight <= 1'b0;
    end
    if(when_load_weight_l161) begin
      if(fsm_En_Single_Ram) begin
        fsm_Weight_Addra_Temp <= 15'h0;
      end else begin
        if(S_Para_Data_valid) begin
          fsm_Weight_Addra_Temp <= (fsm_Weight_Addra_Temp + 15'h0001);
        end else begin
          fsm_Weight_Addra_Temp <= fsm_Weight_Addra_Temp;
        end
      end
    end else begin
      fsm_Weight_Addra_Temp <= 15'h0;
    end
    fsm_Weight_Addra <= fsm_Weight_Addra_Temp;
    fsm_S_Data_One <= S_Para_Data_payload;
    if(when_load_weight_l183) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Bias <= 1'b1;
      end else begin
        fsm_En_Wr_Bias <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Bias <= 1'b0;
    end
    if(when_load_weight_l193) begin
      if(S_Para_Data_valid) begin
        fsm_Bias_Addra_Temp <= (fsm_Bias_Addra_Temp + 8'h01);
      end else begin
        fsm_Bias_Addra_Temp <= fsm_Bias_Addra_Temp;
      end
    end else begin
      fsm_Bias_Addra_Temp <= 8'h0;
    end
    fsm_Bias_Addra <= fsm_Bias_Addra_Temp;
    fsm_Bias_data <= S_Para_Data_payload;
    if(when_load_weight_l216) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Scale <= 1'b1;
      end else begin
        fsm_En_Wr_Scale <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Scale <= 1'b0;
    end
    if(when_load_weight_l226) begin
      if(S_Para_Data_valid) begin
        fsm_Scale_Addra_Temp <= (fsm_Scale_Addra_Temp + 8'h01);
      end else begin
        fsm_Scale_Addra_Temp <= fsm_Scale_Addra_Temp;
      end
    end else begin
      fsm_Scale_Addra_Temp <= 8'h0;
    end
    fsm_Scale_Addra <= fsm_Scale_Addra_Temp;
    fsm_Scale_data <= S_Para_Data_payload;
    if(when_load_weight_l249) begin
      if(S_Para_Data_valid) begin
        fsm_En_Wr_Shift <= 1'b1;
      end else begin
        fsm_En_Wr_Shift <= 1'b0;
      end
    end else begin
      fsm_En_Wr_Shift <= 1'b0;
    end
    if(when_load_weight_l259) begin
      if(S_Para_Data_valid) begin
        fsm_Shift_Addra_Temp <= (fsm_Shift_Addra_Temp + 256'h0000000000000000000000000000000000000000000000000000000000000001);
      end else begin
        fsm_Shift_Addra_Temp <= fsm_Shift_Addra_Temp;
      end
    end else begin
      fsm_Shift_Addra_Temp <= 256'h0;
    end
    fsm_Shift_Addra <= fsm_Shift_Addra_Temp;
    fsm_Shift_data <= S_Para_Data_payload;
  end


endmodule

module compute_ctrl (
  input               Start_Cu,
  output reg          Compute_Complete,
  output              First_Compute_Complete,
  input               compute_fifo_ready,
  output reg          rd_en_fifo,
  input               M_ready,
  output              M_Valid,
  output     [14:0]   weight_addrb,
  output     [11:0]   ram_temp_read_address,
  output reg [11:0]   ram_temp_write_address,
  input      [11:0]   COMPUTE_TIMES_CHANNEL_IN_REG,
  input      [11:0]   COMPUTE_TIMES_CHANNEL_IN_REG_8,
  input      [11:0]   COMPUTE_TIMES_CHANNEL_OUT_REG,
  input      [11:0]   ROW_NUM_CHANNEL_OUT_REG,
  output     [11:0]   S_Count_Fifo,
  output     [11:0]   M_Count_Fifo,
  input               clk,
  input               reset
);
  wire       [11:0]   count_mult_P;
  wire       [9:0]    _zz_M_Count_Fifo;
  wire       [11:0]   _zz_when_compute_ctrl_l67;
  wire       [11:0]   _zz_when_compute_ctrl_l67_1;
  wire       [11:0]   _zz_when_compute_ctrl_l76;
  wire       [11:0]   _zz_when_compute_ctrl_l76_1;
  wire       [11:0]   _zz_when_compute_ctrl_l77;
  wire       [11:0]   _zz_when_compute_ctrl_l77_1;
  wire       [11:0]   _zz_when_compute_ctrl_l91;
  wire       [11:0]   _zz_when_compute_ctrl_l91_1;
  wire       [11:0]   _zz_when_compute_ctrl_l91_2;
  wire       [11:0]   _zz_when_compute_ctrl_l91_3;
  wire       [11:0]   _zz_when_compute_ctrl_l108;
  wire       [11:0]   _zz_when_compute_ctrl_l108_1;
  wire       [11:0]   _zz_when_compute_ctrl_l108_2;
  wire       [11:0]   _zz_when_compute_ctrl_l108_3;
  wire       [11:0]   _zz_when_compute_ctrl_l108_4;
  wire       [11:0]   _zz_when_compute_ctrl_l114;
  wire       [11:0]   _zz_ram_temp_write_address;
  wire       [11:0]   _zz_when_compute_ctrl_l143;
  wire       [11:0]   _zz_when_compute_ctrl_l143_1;
  wire       [11:0]   _zz_when_compute_ctrl_l155;
  wire       [11:0]   _zz_when_compute_ctrl_l155_1;
  wire       [11:0]   _zz_when_compute_ctrl_l155_2;
  wire       [11:0]   _zz_when_compute_ctrl_l155_3;
  wire       [11:0]   _zz_when_compute_ctrl_l167;
  wire       [11:0]   _zz_when_compute_ctrl_l167_1;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [4:0]    fsm_wait_cnt;
  reg                 fsm_wait_en;
  wire                when_compute_ctrl_l53;
  wire                when_compute_ctrl_l58;
  reg        [9:0]    fsm_Cnt_Channel_In_Num;
  reg        [9:0]    fsm_Cnt_Channel_Out_Num;
  wire                when_compute_ctrl_l66;
  wire                when_compute_ctrl_l67;
  wire                when_compute_ctrl_l75;
  wire                when_compute_ctrl_l76;
  wire                when_compute_ctrl_l77;
  reg        [11:0]   fsm_Cnt_Column;
  wire                when_compute_ctrl_l90;
  wire                when_compute_ctrl_l91;
  reg        [11:0]   fsm_Cnt_Row;
  wire                when_compute_ctrl_l100;
  wire                when_compute_ctrl_l102;
  reg                 fsm_En_Compute_Column;
  wire                when_compute_ctrl_l108;
  reg                 fsm_En_Compute_Row;
  wire                when_compute_ctrl_l114;
  wire                when_compute_ctrl_l120;
  wire                when_compute_ctrl_l126;
  wire                when_compute_ctrl_l127;
  wire                when_compute_ctrl_l135;
  reg        [11:0]   fsm_ram_temp_read_address_temp;
  wire                when_compute_ctrl_l142;
  wire                when_compute_ctrl_l143;
  reg        [11:0]   _zz_ram_temp_read_address;
  reg        [11:0]   _zz_ram_temp_read_address_1;
  reg        [14:0]   fsm_weight_addrb_temp;
  wire                when_compute_ctrl_l154;
  wire                when_compute_ctrl_l155;
  reg        [14:0]   _zz_weight_addrb;
  reg        [14:0]   _zz_weight_addrb_1;
  reg                 fsm_M_Fifo_Valid;
  wire                when_compute_ctrl_l166;
  wire                when_compute_ctrl_l167;
  reg                 fsm_M_Fifo_Valid_delay_1;
  reg                 fsm_M_Fifo_Valid_delay_2;
  reg                 fsm_M_Fifo_Valid_delay_3;
  reg                 fsm_M_Fifo_Valid_delay_4;
  reg                 fsm_M_Fifo_Valid_delay_5;
  reg                 fsm_M_Fifo_Valid_delay_6;
  reg                 fsm_M_Fifo_Valid_delay_7;
  reg                 fsm_M_Fifo_Valid_delay_8;
  reg                 fsm_M_Fifo_Valid_delay_9;
  reg                 fsm_M_Fifo_Valid_delay_10;
  reg                 fsm_M_Fifo_Valid_delay_11;
  reg                 fsm_M_Fifo_Valid_delay_12;
  reg                 fsm_M_Fifo_Valid_delay_13;
  reg                 fsm_M_Fifo_Valid_delay_14;
  reg                 fsm_M_Fifo_Valid_delay_15;
  reg                 fsm_M_Fifo_Valid_delay_16;
  reg                 fsm_M_Fifo_Valid_delay_17;
  reg                 fsm_M_Fifo_Valid_delay_18;
  reg                 fsm_M_Fifo_Valid_delay_19;
  reg                 fsm_M_Fifo_Valid_delay_20;
  reg                 fsm_M_Fifo_Valid_delay_21;
  reg                 fsm_M_Fifo_Valid_delay_22;
  reg                 fsm_M_Fifo_Valid_delay_23;
  reg                 fsm_M_Fifo_Valid_delay_24;
  reg                 fsm_First_Complete;
  wire                when_compute_ctrl_l178;
  wire                when_compute_ctrl_l179;
  reg                 fsm_First_Complete_delay_1;
  reg                 fsm_First_Complete_delay_2;
  reg                 fsm_First_Complete_delay_3;
  reg                 fsm_First_Complete_delay_4;
  reg                 fsm_First_Complete_delay_5;
  reg                 fsm_First_Complete_delay_6;
  reg                 fsm_First_Complete_delay_7;
  reg                 fsm_First_Complete_delay_8;
  reg                 fsm_First_Complete_delay_9;
  reg                 fsm_First_Complete_delay_10;
  reg                 fsm_First_Complete_delay_11;
  reg                 fsm_First_Complete_delay_12;
  reg                 fsm_First_Complete_delay_13;
  reg                 fsm_First_Complete_delay_14;
  reg                 fsm_First_Complete_delay_15;
  reg                 fsm_First_Complete_delay_16;
  reg                 fsm_First_Complete_delay_17;
  reg                 fsm_First_Complete_delay_18;
  reg                 fsm_First_Complete_delay_19;
  reg                 fsm_First_Complete_delay_20;
  reg                 fsm_First_Complete_delay_21;
  reg                 fsm_First_Complete_delay_22;
  reg                 fsm_First_Complete_delay_23;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [167:0] fsm_stateReg_string;
  reg [167:0] fsm_stateNext_string;
  `endif


  assign _zz_M_Count_Fifo = (count_mult_P >>> 2);
  assign _zz_when_compute_ctrl_l67 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l67_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l76 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l76_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l77 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l77_1 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l91 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l91_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l91_2 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l91_3 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l108 = (ROW_NUM_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l108_1 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l108_2 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l108_3 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l108_4 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l114 = (ROW_NUM_CHANNEL_OUT_REG - 12'h001);
  assign _zz_ram_temp_write_address = (ram_temp_write_address + 12'h001);
  assign _zz_when_compute_ctrl_l143 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l143_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l155 = {2'd0, fsm_Cnt_Channel_Out_Num};
  assign _zz_when_compute_ctrl_l155_1 = (COMPUTE_TIMES_CHANNEL_OUT_REG - 12'h001);
  assign _zz_when_compute_ctrl_l155_2 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l155_3 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  assign _zz_when_compute_ctrl_l167 = {2'd0, fsm_Cnt_Channel_In_Num};
  assign _zz_when_compute_ctrl_l167_1 = (COMPUTE_TIMES_CHANNEL_IN_REG - 12'h001);
  mul count_mult (
    .A        (ROW_NUM_CHANNEL_OUT_REG         ), //i
    .B        (COMPUTE_TIMES_CHANNEL_IN_REG_8  ), //i
    .P        (count_mult_P                    ), //o
    .clk      (clk                             ), //i
    .reset    (reset                           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT             ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE             ";
      `fsm_enumDefinition_binary_sequential_fsm_Wait : fsm_stateReg_string = "fsm_Wait             ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : fsm_stateReg_string = "fsm_Judge_Before_Fifo";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : fsm_stateReg_string = "fsm_Judge_After_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_Compute : fsm_stateReg_string = "fsm_Compute          ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : fsm_stateReg_string = "fsm_Judge_Row        ";
      default : fsm_stateReg_string = "?????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT             ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE             ";
      `fsm_enumDefinition_binary_sequential_fsm_Wait : fsm_stateNext_string = "fsm_Wait             ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : fsm_stateNext_string = "fsm_Judge_Before_Fifo";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : fsm_stateNext_string = "fsm_Judge_After_Fifo ";
      `fsm_enumDefinition_binary_sequential_fsm_Compute : fsm_stateNext_string = "fsm_Compute          ";
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : fsm_stateNext_string = "fsm_Judge_Row        ";
      default : fsm_stateNext_string = "?????????????????????";
    endcase
  end
  `endif

  assign S_Count_Fifo = count_mult_P;
  assign M_Count_Fifo = {2'd0, _zz_M_Count_Fifo};
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Wait : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Compute : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign when_compute_ctrl_l53 = (fsm_wait_cnt == 5'h05);
  always @(*) begin
    if(when_compute_ctrl_l53) begin
      fsm_wait_en = 1'b1;
    end else begin
      fsm_wait_en = 1'b0;
    end
  end

  assign when_compute_ctrl_l67 = (_zz_when_compute_ctrl_l67 == _zz_when_compute_ctrl_l67_1);
  assign when_compute_ctrl_l76 = (_zz_when_compute_ctrl_l76 == _zz_when_compute_ctrl_l76_1);
  assign when_compute_ctrl_l77 = (_zz_when_compute_ctrl_l77 == _zz_when_compute_ctrl_l77_1);
  assign when_compute_ctrl_l91 = ((_zz_when_compute_ctrl_l91 == _zz_when_compute_ctrl_l91_1) && (_zz_when_compute_ctrl_l91_2 == _zz_when_compute_ctrl_l91_3));
  assign when_compute_ctrl_l108 = (((fsm_Cnt_Column == _zz_when_compute_ctrl_l108) && (_zz_when_compute_ctrl_l108_1 == _zz_when_compute_ctrl_l108_2)) && (_zz_when_compute_ctrl_l108_3 == _zz_when_compute_ctrl_l108_4));
  always @(*) begin
    if(when_compute_ctrl_l108) begin
      fsm_En_Compute_Column = 1'b1;
    end else begin
      fsm_En_Compute_Column = 1'b0;
    end
  end

  assign when_compute_ctrl_l114 = (fsm_Cnt_Row == _zz_when_compute_ctrl_l114);
  always @(*) begin
    if(when_compute_ctrl_l114) begin
      fsm_En_Compute_Row = 1'b1;
    end else begin
      fsm_En_Compute_Row = 1'b0;
    end
  end

  assign when_compute_ctrl_l120 = ((fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_Row) && ((fsm_stateNext == `fsm_enumDefinition_binary_sequential_fsm_IDLE) && (fsm_stateReg != `fsm_enumDefinition_binary_sequential_fsm_IDLE)));
  assign when_compute_ctrl_l127 = (fsm_Cnt_Channel_Out_Num == 10'h0);
  assign when_compute_ctrl_l135 = ((fsm_Cnt_Channel_Out_Num == 10'h0) && (fsm_Cnt_Channel_In_Num == 10'h0));
  assign when_compute_ctrl_l143 = (_zz_when_compute_ctrl_l143 == _zz_when_compute_ctrl_l143_1);
  assign ram_temp_read_address = _zz_ram_temp_read_address_1;
  assign when_compute_ctrl_l155 = ((_zz_when_compute_ctrl_l155 == _zz_when_compute_ctrl_l155_1) && (_zz_when_compute_ctrl_l155_2 == _zz_when_compute_ctrl_l155_3));
  assign weight_addrb = _zz_weight_addrb_1;
  assign when_compute_ctrl_l167 = (_zz_when_compute_ctrl_l167 == _zz_when_compute_ctrl_l167_1);
  assign M_Valid = fsm_M_Fifo_Valid_delay_24;
  assign when_compute_ctrl_l179 = (fsm_Cnt_Channel_In_Num == 10'h0);
  assign First_Compute_Complete = fsm_First_Complete_delay_23;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(Start_Cu) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Wait : begin
        if(fsm_wait_en) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo : begin
        if(compute_fifo_ready) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo : begin
        if(M_ready) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Compute;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_After_Fifo;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Compute : begin
        if(fsm_En_Compute_Column) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Row;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Compute;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Judge_Row : begin
        if(fsm_En_Compute_Row) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Judge_Before_Fifo;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign when_compute_ctrl_l58 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Wait);
  assign when_compute_ctrl_l66 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l75 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l90 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l100 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Judge_Row);
  assign when_compute_ctrl_l102 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_IDLE);
  assign when_compute_ctrl_l126 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l142 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l154 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l166 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  assign when_compute_ctrl_l178 = (fsm_stateReg == `fsm_enumDefinition_binary_sequential_fsm_Compute);
  always @(posedge clk) begin
    if(when_compute_ctrl_l58) begin
      fsm_wait_cnt <= (fsm_wait_cnt + 5'h01);
    end else begin
      fsm_wait_cnt <= 5'h0;
    end
    if(when_compute_ctrl_l66) begin
      if(when_compute_ctrl_l67) begin
        fsm_Cnt_Channel_In_Num <= 10'h0;
      end else begin
        fsm_Cnt_Channel_In_Num <= (fsm_Cnt_Channel_In_Num + 10'h001);
      end
    end else begin
      fsm_Cnt_Channel_In_Num <= 10'h0;
    end
    if(when_compute_ctrl_l75) begin
      if(when_compute_ctrl_l76) begin
        if(when_compute_ctrl_l77) begin
          fsm_Cnt_Channel_Out_Num <= 10'h0;
        end else begin
          fsm_Cnt_Channel_Out_Num <= (fsm_Cnt_Channel_Out_Num + 10'h001);
        end
      end else begin
        fsm_Cnt_Channel_Out_Num <= fsm_Cnt_Channel_Out_Num;
      end
    end else begin
      fsm_Cnt_Channel_Out_Num <= 10'h0;
    end
    if(when_compute_ctrl_l90) begin
      if(when_compute_ctrl_l91) begin
        fsm_Cnt_Column <= (fsm_Cnt_Column + 12'h001);
      end else begin
        fsm_Cnt_Column <= fsm_Cnt_Column;
      end
    end else begin
      fsm_Cnt_Column <= 12'h0;
    end
    if(when_compute_ctrl_l100) begin
      fsm_Cnt_Row <= (fsm_Cnt_Row + 12'h001);
    end else begin
      if(when_compute_ctrl_l102) begin
        fsm_Cnt_Row <= 12'h0;
      end else begin
        fsm_Cnt_Row <= fsm_Cnt_Row;
      end
    end
    if(when_compute_ctrl_l120) begin
      Compute_Complete <= 1'b1;
    end else begin
      Compute_Complete <= 1'b0;
    end
    if(when_compute_ctrl_l126) begin
      if(when_compute_ctrl_l127) begin
        rd_en_fifo <= 1'b1;
      end else begin
        rd_en_fifo <= 1'b0;
      end
    end else begin
      rd_en_fifo <= 1'b0;
    end
    if(when_compute_ctrl_l135) begin
      ram_temp_write_address <= 12'h0;
    end else begin
      if(rd_en_fifo) begin
        ram_temp_write_address <= _zz_ram_temp_write_address;
      end
    end
    if(when_compute_ctrl_l142) begin
      if(when_compute_ctrl_l143) begin
        fsm_ram_temp_read_address_temp <= 12'h0;
      end else begin
        fsm_ram_temp_read_address_temp <= (fsm_ram_temp_read_address_temp + 12'h001);
      end
    end else begin
      fsm_ram_temp_read_address_temp <= 12'h0;
    end
    _zz_ram_temp_read_address <= fsm_ram_temp_read_address_temp;
    _zz_ram_temp_read_address_1 <= _zz_ram_temp_read_address;
    if(when_compute_ctrl_l154) begin
      if(when_compute_ctrl_l155) begin
        fsm_weight_addrb_temp <= 15'h0;
      end else begin
        fsm_weight_addrb_temp <= (fsm_weight_addrb_temp + 15'h0001);
      end
    end else begin
      fsm_weight_addrb_temp <= 15'h0;
    end
    _zz_weight_addrb <= fsm_weight_addrb_temp;
    _zz_weight_addrb_1 <= _zz_weight_addrb;
    if(when_compute_ctrl_l166) begin
      if(when_compute_ctrl_l167) begin
        fsm_M_Fifo_Valid <= 1'b1;
      end else begin
        fsm_M_Fifo_Valid <= 1'b0;
      end
    end else begin
      fsm_M_Fifo_Valid <= 1'b0;
    end
    fsm_M_Fifo_Valid_delay_1 <= fsm_M_Fifo_Valid;
    fsm_M_Fifo_Valid_delay_2 <= fsm_M_Fifo_Valid_delay_1;
    fsm_M_Fifo_Valid_delay_3 <= fsm_M_Fifo_Valid_delay_2;
    fsm_M_Fifo_Valid_delay_4 <= fsm_M_Fifo_Valid_delay_3;
    fsm_M_Fifo_Valid_delay_5 <= fsm_M_Fifo_Valid_delay_4;
    fsm_M_Fifo_Valid_delay_6 <= fsm_M_Fifo_Valid_delay_5;
    fsm_M_Fifo_Valid_delay_7 <= fsm_M_Fifo_Valid_delay_6;
    fsm_M_Fifo_Valid_delay_8 <= fsm_M_Fifo_Valid_delay_7;
    fsm_M_Fifo_Valid_delay_9 <= fsm_M_Fifo_Valid_delay_8;
    fsm_M_Fifo_Valid_delay_10 <= fsm_M_Fifo_Valid_delay_9;
    fsm_M_Fifo_Valid_delay_11 <= fsm_M_Fifo_Valid_delay_10;
    fsm_M_Fifo_Valid_delay_12 <= fsm_M_Fifo_Valid_delay_11;
    fsm_M_Fifo_Valid_delay_13 <= fsm_M_Fifo_Valid_delay_12;
    fsm_M_Fifo_Valid_delay_14 <= fsm_M_Fifo_Valid_delay_13;
    fsm_M_Fifo_Valid_delay_15 <= fsm_M_Fifo_Valid_delay_14;
    fsm_M_Fifo_Valid_delay_16 <= fsm_M_Fifo_Valid_delay_15;
    fsm_M_Fifo_Valid_delay_17 <= fsm_M_Fifo_Valid_delay_16;
    fsm_M_Fifo_Valid_delay_18 <= fsm_M_Fifo_Valid_delay_17;
    fsm_M_Fifo_Valid_delay_19 <= fsm_M_Fifo_Valid_delay_18;
    fsm_M_Fifo_Valid_delay_20 <= fsm_M_Fifo_Valid_delay_19;
    fsm_M_Fifo_Valid_delay_21 <= fsm_M_Fifo_Valid_delay_20;
    fsm_M_Fifo_Valid_delay_22 <= fsm_M_Fifo_Valid_delay_21;
    fsm_M_Fifo_Valid_delay_23 <= fsm_M_Fifo_Valid_delay_22;
    fsm_M_Fifo_Valid_delay_24 <= fsm_M_Fifo_Valid_delay_23;
    if(when_compute_ctrl_l178) begin
      if(when_compute_ctrl_l179) begin
        fsm_First_Complete <= 1'b1;
      end else begin
        fsm_First_Complete <= 1'b0;
      end
    end else begin
      fsm_First_Complete <= 1'b0;
    end
    fsm_First_Complete_delay_1 <= fsm_First_Complete;
    fsm_First_Complete_delay_2 <= fsm_First_Complete_delay_1;
    fsm_First_Complete_delay_3 <= fsm_First_Complete_delay_2;
    fsm_First_Complete_delay_4 <= fsm_First_Complete_delay_3;
    fsm_First_Complete_delay_5 <= fsm_First_Complete_delay_4;
    fsm_First_Complete_delay_6 <= fsm_First_Complete_delay_5;
    fsm_First_Complete_delay_7 <= fsm_First_Complete_delay_6;
    fsm_First_Complete_delay_8 <= fsm_First_Complete_delay_7;
    fsm_First_Complete_delay_9 <= fsm_First_Complete_delay_8;
    fsm_First_Complete_delay_10 <= fsm_First_Complete_delay_9;
    fsm_First_Complete_delay_11 <= fsm_First_Complete_delay_10;
    fsm_First_Complete_delay_12 <= fsm_First_Complete_delay_11;
    fsm_First_Complete_delay_13 <= fsm_First_Complete_delay_12;
    fsm_First_Complete_delay_14 <= fsm_First_Complete_delay_13;
    fsm_First_Complete_delay_15 <= fsm_First_Complete_delay_14;
    fsm_First_Complete_delay_16 <= fsm_First_Complete_delay_15;
    fsm_First_Complete_delay_17 <= fsm_First_Complete_delay_16;
    fsm_First_Complete_delay_18 <= fsm_First_Complete_delay_17;
    fsm_First_Complete_delay_19 <= fsm_First_Complete_delay_18;
    fsm_First_Complete_delay_20 <= fsm_First_Complete_delay_19;
    fsm_First_Complete_delay_21 <= fsm_First_Complete_delay_20;
    fsm_First_Complete_delay_22 <= fsm_First_Complete_delay_21;
    fsm_First_Complete_delay_23 <= fsm_First_Complete_delay_22;
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

//channel_in_thirty_two_times_acc replaced by channel_in_thirty_two_times_acc

module channel_in_thirty_two_times_acc (
  input      [511:0]  data_in,
  output     [31:0]   data_out,
  input               clk
);
  wire       [31:0]   xadd_S;
  wire       [31:0]   xadd_1_S;
  wire       [31:0]   xadd_2_S;
  wire       [31:0]   xadd_3_S;
  wire       [31:0]   xadd_4_S;
  wire       [31:0]   xadd_5_S;
  wire       [31:0]   xadd_6_S;
  wire       [31:0]   xadd_7_S;
  wire       [31:0]   xadd_8_S;
  wire       [31:0]   xadd_9_S;
  wire       [31:0]   xadd_10_S;
  wire       [31:0]   xadd_11_S;
  wire       [31:0]   xadd_12_S;
  wire       [31:0]   xadd_13_S;
  wire       [31:0]   xadd_14_S;
  wire       [31:0]   xadd_15_S;
  wire       [31:0]   xadd_16_S;
  wire       [31:0]   xadd_17_S;
  wire       [31:0]   xadd_18_S;
  wire       [31:0]   xadd_19_S;
  wire       [31:0]   xadd_20_S;
  wire       [31:0]   xadd_21_S;
  wire       [31:0]   xadd_22_S;
  wire       [31:0]   xadd_23_S;
  wire       [31:0]   xadd_24_S;
  wire       [31:0]   xadd_25_S;
  wire       [31:0]   xadd_26_S;
  wire       [31:0]   xadd_27_S;
  wire       [31:0]   xadd_28_S;
  wire       [31:0]   xadd_29_S;
  wire       [31:0]   xadd_30_S;
  wire       [31:0]   _zz_temp_0;
  wire       [15:0]   _zz_temp_0_1;
  wire       [31:0]   _zz_temp_1;
  wire       [15:0]   _zz_temp_1_1;
  wire       [31:0]   _zz_temp_2;
  wire       [15:0]   _zz_temp_2_1;
  wire       [31:0]   _zz_temp_3;
  wire       [15:0]   _zz_temp_3_1;
  wire       [31:0]   _zz_temp_4;
  wire       [15:0]   _zz_temp_4_1;
  wire       [31:0]   _zz_temp_5;
  wire       [15:0]   _zz_temp_5_1;
  wire       [31:0]   _zz_temp_6;
  wire       [15:0]   _zz_temp_6_1;
  wire       [31:0]   _zz_temp_7;
  wire       [15:0]   _zz_temp_7_1;
  wire       [31:0]   _zz_temp_8;
  wire       [15:0]   _zz_temp_8_1;
  wire       [31:0]   _zz_temp_9;
  wire       [15:0]   _zz_temp_9_1;
  wire       [31:0]   _zz_temp_10;
  wire       [15:0]   _zz_temp_10_1;
  wire       [31:0]   _zz_temp_11;
  wire       [15:0]   _zz_temp_11_1;
  wire       [31:0]   _zz_temp_12;
  wire       [15:0]   _zz_temp_12_1;
  wire       [31:0]   _zz_temp_13;
  wire       [15:0]   _zz_temp_13_1;
  wire       [31:0]   _zz_temp_14;
  wire       [15:0]   _zz_temp_14_1;
  wire       [31:0]   _zz_temp_15;
  wire       [15:0]   _zz_temp_15_1;
  wire       [31:0]   _zz_temp_16;
  wire       [15:0]   _zz_temp_16_1;
  wire       [31:0]   _zz_temp_17;
  wire       [15:0]   _zz_temp_17_1;
  wire       [31:0]   _zz_temp_18;
  wire       [15:0]   _zz_temp_18_1;
  wire       [31:0]   _zz_temp_19;
  wire       [15:0]   _zz_temp_19_1;
  wire       [31:0]   _zz_temp_20;
  wire       [15:0]   _zz_temp_20_1;
  wire       [31:0]   _zz_temp_21;
  wire       [15:0]   _zz_temp_21_1;
  wire       [31:0]   _zz_temp_22;
  wire       [15:0]   _zz_temp_22_1;
  wire       [31:0]   _zz_temp_23;
  wire       [15:0]   _zz_temp_23_1;
  wire       [31:0]   _zz_temp_24;
  wire       [15:0]   _zz_temp_24_1;
  wire       [31:0]   _zz_temp_25;
  wire       [15:0]   _zz_temp_25_1;
  wire       [31:0]   _zz_temp_26;
  wire       [15:0]   _zz_temp_26_1;
  wire       [31:0]   _zz_temp_27;
  wire       [15:0]   _zz_temp_27_1;
  wire       [31:0]   _zz_temp_28;
  wire       [15:0]   _zz_temp_28_1;
  wire       [31:0]   _zz_temp_29;
  wire       [15:0]   _zz_temp_29_1;
  wire       [31:0]   _zz_temp_30;
  wire       [15:0]   _zz_temp_30_1;
  wire       [31:0]   _zz_temp_31;
  wire       [15:0]   _zz_temp_31_1;
  wire       [15:0]   temp_t_0;
  wire       [15:0]   temp_t_1;
  wire       [15:0]   temp_t_2;
  wire       [15:0]   temp_t_3;
  wire       [15:0]   temp_t_4;
  wire       [15:0]   temp_t_5;
  wire       [15:0]   temp_t_6;
  wire       [15:0]   temp_t_7;
  wire       [15:0]   temp_t_8;
  wire       [15:0]   temp_t_9;
  wire       [15:0]   temp_t_10;
  wire       [15:0]   temp_t_11;
  wire       [15:0]   temp_t_12;
  wire       [15:0]   temp_t_13;
  wire       [15:0]   temp_t_14;
  wire       [15:0]   temp_t_15;
  wire       [15:0]   temp_t_16;
  wire       [15:0]   temp_t_17;
  wire       [15:0]   temp_t_18;
  wire       [15:0]   temp_t_19;
  wire       [15:0]   temp_t_20;
  wire       [15:0]   temp_t_21;
  wire       [15:0]   temp_t_22;
  wire       [15:0]   temp_t_23;
  wire       [15:0]   temp_t_24;
  wire       [15:0]   temp_t_25;
  wire       [15:0]   temp_t_26;
  wire       [15:0]   temp_t_27;
  wire       [15:0]   temp_t_28;
  wire       [15:0]   temp_t_29;
  wire       [15:0]   temp_t_30;
  wire       [15:0]   temp_t_31;
  wire       [31:0]   temp_0;
  wire       [31:0]   temp_1;
  wire       [31:0]   temp_2;
  wire       [31:0]   temp_3;
  wire       [31:0]   temp_4;
  wire       [31:0]   temp_5;
  wire       [31:0]   temp_6;
  wire       [31:0]   temp_7;
  wire       [31:0]   temp_8;
  wire       [31:0]   temp_9;
  wire       [31:0]   temp_10;
  wire       [31:0]   temp_11;
  wire       [31:0]   temp_12;
  wire       [31:0]   temp_13;
  wire       [31:0]   temp_14;
  wire       [31:0]   temp_15;
  wire       [31:0]   temp_16;
  wire       [31:0]   temp_17;
  wire       [31:0]   temp_18;
  wire       [31:0]   temp_19;
  wire       [31:0]   temp_20;
  wire       [31:0]   temp_21;
  wire       [31:0]   temp_22;
  wire       [31:0]   temp_23;
  wire       [31:0]   temp_24;
  wire       [31:0]   temp_25;
  wire       [31:0]   temp_26;
  wire       [31:0]   temp_27;
  wire       [31:0]   temp_28;
  wire       [31:0]   temp_29;
  wire       [31:0]   temp_30;
  wire       [31:0]   temp_31;

  assign _zz_temp_0_1 = temp_t_0;
  assign _zz_temp_0 = {{16{_zz_temp_0_1[15]}}, _zz_temp_0_1};
  assign _zz_temp_1_1 = temp_t_1;
  assign _zz_temp_1 = {{16{_zz_temp_1_1[15]}}, _zz_temp_1_1};
  assign _zz_temp_2_1 = temp_t_2;
  assign _zz_temp_2 = {{16{_zz_temp_2_1[15]}}, _zz_temp_2_1};
  assign _zz_temp_3_1 = temp_t_3;
  assign _zz_temp_3 = {{16{_zz_temp_3_1[15]}}, _zz_temp_3_1};
  assign _zz_temp_4_1 = temp_t_4;
  assign _zz_temp_4 = {{16{_zz_temp_4_1[15]}}, _zz_temp_4_1};
  assign _zz_temp_5_1 = temp_t_5;
  assign _zz_temp_5 = {{16{_zz_temp_5_1[15]}}, _zz_temp_5_1};
  assign _zz_temp_6_1 = temp_t_6;
  assign _zz_temp_6 = {{16{_zz_temp_6_1[15]}}, _zz_temp_6_1};
  assign _zz_temp_7_1 = temp_t_7;
  assign _zz_temp_7 = {{16{_zz_temp_7_1[15]}}, _zz_temp_7_1};
  assign _zz_temp_8_1 = temp_t_8;
  assign _zz_temp_8 = {{16{_zz_temp_8_1[15]}}, _zz_temp_8_1};
  assign _zz_temp_9_1 = temp_t_9;
  assign _zz_temp_9 = {{16{_zz_temp_9_1[15]}}, _zz_temp_9_1};
  assign _zz_temp_10_1 = temp_t_10;
  assign _zz_temp_10 = {{16{_zz_temp_10_1[15]}}, _zz_temp_10_1};
  assign _zz_temp_11_1 = temp_t_11;
  assign _zz_temp_11 = {{16{_zz_temp_11_1[15]}}, _zz_temp_11_1};
  assign _zz_temp_12_1 = temp_t_12;
  assign _zz_temp_12 = {{16{_zz_temp_12_1[15]}}, _zz_temp_12_1};
  assign _zz_temp_13_1 = temp_t_13;
  assign _zz_temp_13 = {{16{_zz_temp_13_1[15]}}, _zz_temp_13_1};
  assign _zz_temp_14_1 = temp_t_14;
  assign _zz_temp_14 = {{16{_zz_temp_14_1[15]}}, _zz_temp_14_1};
  assign _zz_temp_15_1 = temp_t_15;
  assign _zz_temp_15 = {{16{_zz_temp_15_1[15]}}, _zz_temp_15_1};
  assign _zz_temp_16_1 = temp_t_16;
  assign _zz_temp_16 = {{16{_zz_temp_16_1[15]}}, _zz_temp_16_1};
  assign _zz_temp_17_1 = temp_t_17;
  assign _zz_temp_17 = {{16{_zz_temp_17_1[15]}}, _zz_temp_17_1};
  assign _zz_temp_18_1 = temp_t_18;
  assign _zz_temp_18 = {{16{_zz_temp_18_1[15]}}, _zz_temp_18_1};
  assign _zz_temp_19_1 = temp_t_19;
  assign _zz_temp_19 = {{16{_zz_temp_19_1[15]}}, _zz_temp_19_1};
  assign _zz_temp_20_1 = temp_t_20;
  assign _zz_temp_20 = {{16{_zz_temp_20_1[15]}}, _zz_temp_20_1};
  assign _zz_temp_21_1 = temp_t_21;
  assign _zz_temp_21 = {{16{_zz_temp_21_1[15]}}, _zz_temp_21_1};
  assign _zz_temp_22_1 = temp_t_22;
  assign _zz_temp_22 = {{16{_zz_temp_22_1[15]}}, _zz_temp_22_1};
  assign _zz_temp_23_1 = temp_t_23;
  assign _zz_temp_23 = {{16{_zz_temp_23_1[15]}}, _zz_temp_23_1};
  assign _zz_temp_24_1 = temp_t_24;
  assign _zz_temp_24 = {{16{_zz_temp_24_1[15]}}, _zz_temp_24_1};
  assign _zz_temp_25_1 = temp_t_25;
  assign _zz_temp_25 = {{16{_zz_temp_25_1[15]}}, _zz_temp_25_1};
  assign _zz_temp_26_1 = temp_t_26;
  assign _zz_temp_26 = {{16{_zz_temp_26_1[15]}}, _zz_temp_26_1};
  assign _zz_temp_27_1 = temp_t_27;
  assign _zz_temp_27 = {{16{_zz_temp_27_1[15]}}, _zz_temp_27_1};
  assign _zz_temp_28_1 = temp_t_28;
  assign _zz_temp_28 = {{16{_zz_temp_28_1[15]}}, _zz_temp_28_1};
  assign _zz_temp_29_1 = temp_t_29;
  assign _zz_temp_29 = {{16{_zz_temp_29_1[15]}}, _zz_temp_29_1};
  assign _zz_temp_30_1 = temp_t_30;
  assign _zz_temp_30 = {{16{_zz_temp_30_1[15]}}, _zz_temp_30_1};
  assign _zz_temp_31_1 = temp_t_31;
  assign _zz_temp_31 = {{16{_zz_temp_31_1[15]}}, _zz_temp_31_1};
  add_32_32 xadd (
    .A      (temp_0  ), //i
    .B      (temp_1  ), //i
    .S      (xadd_S  ), //o
    .CLK    (clk     )  //i
  );
  add_32_32 xadd_1 (
    .A      (temp_2    ), //i
    .B      (temp_3    ), //i
    .S      (xadd_1_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_2 (
    .A      (temp_4    ), //i
    .B      (temp_5    ), //i
    .S      (xadd_2_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_3 (
    .A      (temp_6    ), //i
    .B      (temp_7    ), //i
    .S      (xadd_3_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_4 (
    .A      (temp_8    ), //i
    .B      (temp_9    ), //i
    .S      (xadd_4_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_5 (
    .A      (temp_10   ), //i
    .B      (temp_11   ), //i
    .S      (xadd_5_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_6 (
    .A      (temp_12   ), //i
    .B      (temp_13   ), //i
    .S      (xadd_6_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_7 (
    .A      (temp_14   ), //i
    .B      (temp_15   ), //i
    .S      (xadd_7_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_8 (
    .A      (temp_16   ), //i
    .B      (temp_17   ), //i
    .S      (xadd_8_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_9 (
    .A      (temp_18   ), //i
    .B      (temp_19   ), //i
    .S      (xadd_9_S  ), //o
    .CLK    (clk       )  //i
  );
  add_32_32 xadd_10 (
    .A      (temp_20    ), //i
    .B      (temp_21    ), //i
    .S      (xadd_10_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_11 (
    .A      (temp_22    ), //i
    .B      (temp_23    ), //i
    .S      (xadd_11_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_12 (
    .A      (temp_24    ), //i
    .B      (temp_25    ), //i
    .S      (xadd_12_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_13 (
    .A      (temp_26    ), //i
    .B      (temp_27    ), //i
    .S      (xadd_13_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_14 (
    .A      (temp_28    ), //i
    .B      (temp_29    ), //i
    .S      (xadd_14_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_15 (
    .A      (temp_30    ), //i
    .B      (temp_31    ), //i
    .S      (xadd_15_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_16 (
    .A      (xadd_S     ), //i
    .B      (xadd_1_S   ), //i
    .S      (xadd_16_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_17 (
    .A      (xadd_2_S   ), //i
    .B      (xadd_3_S   ), //i
    .S      (xadd_17_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_18 (
    .A      (xadd_4_S   ), //i
    .B      (xadd_5_S   ), //i
    .S      (xadd_18_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_19 (
    .A      (xadd_6_S   ), //i
    .B      (xadd_7_S   ), //i
    .S      (xadd_19_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_20 (
    .A      (xadd_8_S   ), //i
    .B      (xadd_9_S   ), //i
    .S      (xadd_20_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_21 (
    .A      (xadd_10_S  ), //i
    .B      (xadd_11_S  ), //i
    .S      (xadd_21_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_22 (
    .A      (xadd_12_S  ), //i
    .B      (xadd_13_S  ), //i
    .S      (xadd_22_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_23 (
    .A      (xadd_14_S  ), //i
    .B      (xadd_15_S  ), //i
    .S      (xadd_23_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_24 (
    .A      (xadd_16_S  ), //i
    .B      (xadd_17_S  ), //i
    .S      (xadd_24_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_25 (
    .A      (xadd_18_S  ), //i
    .B      (xadd_19_S  ), //i
    .S      (xadd_25_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_26 (
    .A      (xadd_20_S  ), //i
    .B      (xadd_21_S  ), //i
    .S      (xadd_26_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_27 (
    .A      (xadd_22_S  ), //i
    .B      (xadd_23_S  ), //i
    .S      (xadd_27_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_28 (
    .A      (xadd_24_S  ), //i
    .B      (xadd_25_S  ), //i
    .S      (xadd_28_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_29 (
    .A      (xadd_26_S  ), //i
    .B      (xadd_27_S  ), //i
    .S      (xadd_29_S  ), //o
    .CLK    (clk        )  //i
  );
  add_32_32 xadd_30 (
    .A      (xadd_28_S  ), //i
    .B      (xadd_29_S  ), //i
    .S      (xadd_30_S  ), //o
    .CLK    (clk        )  //i
  );
  assign temp_t_0 = data_in[15 : 0];
  assign temp_t_1 = data_in[31 : 16];
  assign temp_t_2 = data_in[47 : 32];
  assign temp_t_3 = data_in[63 : 48];
  assign temp_t_4 = data_in[79 : 64];
  assign temp_t_5 = data_in[95 : 80];
  assign temp_t_6 = data_in[111 : 96];
  assign temp_t_7 = data_in[127 : 112];
  assign temp_t_8 = data_in[143 : 128];
  assign temp_t_9 = data_in[159 : 144];
  assign temp_t_10 = data_in[175 : 160];
  assign temp_t_11 = data_in[191 : 176];
  assign temp_t_12 = data_in[207 : 192];
  assign temp_t_13 = data_in[223 : 208];
  assign temp_t_14 = data_in[239 : 224];
  assign temp_t_15 = data_in[255 : 240];
  assign temp_t_16 = data_in[271 : 256];
  assign temp_t_17 = data_in[287 : 272];
  assign temp_t_18 = data_in[303 : 288];
  assign temp_t_19 = data_in[319 : 304];
  assign temp_t_20 = data_in[335 : 320];
  assign temp_t_21 = data_in[351 : 336];
  assign temp_t_22 = data_in[367 : 352];
  assign temp_t_23 = data_in[383 : 368];
  assign temp_t_24 = data_in[399 : 384];
  assign temp_t_25 = data_in[415 : 400];
  assign temp_t_26 = data_in[431 : 416];
  assign temp_t_27 = data_in[447 : 432];
  assign temp_t_28 = data_in[463 : 448];
  assign temp_t_29 = data_in[479 : 464];
  assign temp_t_30 = data_in[495 : 480];
  assign temp_t_31 = data_in[511 : 496];
  assign temp_0 = _zz_temp_0;
  assign temp_1 = _zz_temp_1;
  assign temp_2 = _zz_temp_2;
  assign temp_3 = _zz_temp_3;
  assign temp_4 = _zz_temp_4;
  assign temp_5 = _zz_temp_5;
  assign temp_6 = _zz_temp_6;
  assign temp_7 = _zz_temp_7;
  assign temp_8 = _zz_temp_8;
  assign temp_9 = _zz_temp_9;
  assign temp_10 = _zz_temp_10;
  assign temp_11 = _zz_temp_11;
  assign temp_12 = _zz_temp_12;
  assign temp_13 = _zz_temp_13;
  assign temp_14 = _zz_temp_14;
  assign temp_15 = _zz_temp_15;
  assign temp_16 = _zz_temp_16;
  assign temp_17 = _zz_temp_17;
  assign temp_18 = _zz_temp_18;
  assign temp_19 = _zz_temp_19;
  assign temp_20 = _zz_temp_20;
  assign temp_21 = _zz_temp_21;
  assign temp_22 = _zz_temp_22;
  assign temp_23 = _zz_temp_23;
  assign temp_24 = _zz_temp_24;
  assign temp_25 = _zz_temp_25;
  assign temp_26 = _zz_temp_26;
  assign temp_27 = _zz_temp_27;
  assign temp_28 = _zz_temp_28;
  assign temp_29 = _zz_temp_29;
  assign temp_30 = _zz_temp_30;
  assign temp_31 = _zz_temp_31;
  assign data_out = xadd_30_S;

endmodule

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

//mul_simd replaced by mul_simd

module mul_simd (
  input      [7:0]    data_in,
  input      [7:0]    weight_in,
  output     [15:0]   data_out,
  input               clk
);
  wire       [15:0]   mult_8_8_16_1_P;
  wire       [15:0]   _zz_data_out_q;
  reg        [15:0]   data_out_q;

  assign _zz_data_out_q = mult_8_8_16_1_P;
  mult_8_8_16 mult_8_8_16_1 (
    .A      (data_in          ), //i
    .B      (weight_in        ), //i
    .P      (mult_8_8_16_1_P  ), //o
    .CLK    (clk              )  //i
  );
  assign data_out = data_out_q;
  always @(posedge clk) begin
    data_out_q <= _zz_data_out_q;
  end


endmodule

module fifo_sync (
  output              full,
  input               wr_en,
  input      [63:0]   din,
  output              empty,
  output     [255:0]  dout,
  input               rd_en,
  output     [11:0]   wr_data_count,
  output     [9:0]    rd_data_count,
  output              data_valid,
  output              rd_rst_busy,
  output              wr_rst_busy,
  input               reset,
  input               clk
);
  wire                temp_almost_empty;
  wire                temp_almost_full;
  wire                temp_data_valid;
  wire                temp_dbiterr;
  wire       [255:0]  temp_dout;
  wire                temp_empty;
  wire                temp_full;
  wire                temp_overflow;
  wire                temp_prog_empty;
  wire                temp_prog_full;
  wire       [9:0]    temp_rd_data_count;
  wire                temp_rd_rst_busy;
  wire                temp_sbiterr;
  wire                temp_underflow;
  wire                temp_wr_ack;
  wire       [11:0]   temp_wr_data_count;
  wire                temp_wr_rst_busy;
  wire                almost_empty;
  wire                almost_full;
  wire                dbiterr;
  wire                overflow;
  wire                prog_empty;
  wire                prog_full;
  wire                sbiterr;
  wire                underflow;
  wire                wr_ack;
  wire                injectdbiterr;
  wire                injectsbiterr;
  wire                sleep;

  xpm_fifo_sync #(
    .DOUT_RESET_VALUE("0"),
    .ECC_MODE("no_ecc"),
    .FIFO_MEMORY_TYPE("block"),
    .FIFO_READ_LATENCY(0),
    .FIFO_WRITE_DEPTH(2048),
    .FULL_RESET_VALUE(0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(2037),
    .RD_DATA_COUNT_WIDTH(10),
    .READ_DATA_WIDTH(256),
    .READ_MODE("fwft"),
    .SIM_ASSERT_CHK(0),
    .USE_ADV_FEATURES("1404"),
    .WAKEUP_TIME(0),
    .WRITE_DATA_WIDTH(64),
    .WR_DATA_COUNT_WIDTH(12) 
  ) temp (
    .almost_empty     (temp_almost_empty   ), //o
    .almost_full      (temp_almost_full    ), //o
    .data_valid       (temp_data_valid     ), //o
    .dbiterr          (temp_dbiterr        ), //o
    .dout             (temp_dout           ), //o
    .empty            (temp_empty          ), //o
    .full             (temp_full           ), //o
    .overflow         (temp_overflow       ), //o
    .prog_empty       (temp_prog_empty     ), //o
    .prog_full        (temp_prog_full      ), //o
    .rd_data_count    (temp_rd_data_count  ), //o
    .rd_rst_busy      (temp_rd_rst_busy    ), //o
    .sbiterr          (temp_sbiterr        ), //o
    .underflow        (temp_underflow      ), //o
    .wr_ack           (temp_wr_ack         ), //o
    .wr_data_count    (temp_wr_data_count  ), //o
    .wr_rst_busy      (temp_wr_rst_busy    ), //o
    .din              (din                 ), //i
    .injectdbiterr    (injectdbiterr       ), //i
    .injectsbiterr    (injectsbiterr       ), //i
    .rd_en            (rd_en               ), //i
    .rst              (reset               ), //i
    .sleep            (sleep               ), //i
    .wr_clk           (clk                 ), //i
    .wr_en            (wr_en               )  //i
  );
  assign injectdbiterr = 1'b0;
  assign injectsbiterr = 1'b0;
  assign sleep = 1'b0;
  assign almost_empty = temp_almost_empty;
  assign almost_full = temp_almost_full;
  assign data_valid = temp_data_valid;
  assign dbiterr = temp_dbiterr;
  assign dout = temp_dout;
  assign empty = temp_empty;
  assign full = temp_full;
  assign overflow = temp_overflow;
  assign prog_empty = temp_prog_empty;
  assign prog_full = temp_prog_full;
  assign rd_data_count = temp_rd_data_count;
  assign rd_rst_busy = temp_rd_rst_busy;
  assign sbiterr = temp_sbiterr;
  assign underflow = temp_underflow;
  assign wr_ack = temp_wr_ack;
  assign wr_data_count = temp_wr_data_count;
  assign wr_rst_busy = temp_wr_rst_busy;

endmodule

//sdpram_1 replaced by sdpram_1

//sdpram_1 replaced by sdpram_1

module sdpram_1 (
  output     [255:0]  doutb,
  input      [10:0]   addra,
  input      [8:0]    addrb,
  input      [63:0]   dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [255:0]  temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(11),
    .ADDR_WIDTH_B(9),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(64),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("block"),
    .MEMORY_SIZE(131072),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(256),
    .READ_LATENCY_B(1),
    .READ_RESET_VALUE_B("0"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_EMBEDDED_CONSTRAINT(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep"),
    .WRITE_DATA_WIDTH_A(64),
    .WRITE_MODE_B("read_first") 
  ) temp (
    .dbiterrb          (temp_dbiterrb   ), //o
    .doutb             (temp_doutb      ), //o
    .sbiterrb          (temp_sbiterrb   ), //o
    .addra             (addra           ), //i
    .addrb             (addrb           ), //i
    .clka              (clk             ), //i
    .clkb              (clk             ), //i
    .dina              (dina            ), //i
    .ena               (ena             ), //i
    .enb               (enb             ), //i
    .injectdbiterra    (injectdbiterra  ), //i
    .injectsbiterra    (injectsbiterra  ), //i
    .regceb            (regceb          ), //i
    .rstb              (rstb            ), //i
    .sleep             (sleep           ), //i
    .wea               (wea             )  //i
  );
  assign injectdbiterra = 1'b0;
  assign injectsbiterra = 1'b0;
  assign regceb = 1'b1;
  assign rstb = 1'b0;
  assign sleep = 1'b0;
  assign dbiterrb = temp_dbiterrb;
  assign doutb = temp_doutb;
  assign sbiterrb = temp_sbiterrb;

endmodule

module Compute_33Weight (
  input      [63:0]   io_weight_data_One,
  input      [0:0]    io_weight_wr,
  input      [14:0]   io_weight_addra,
  input      [14:0]   io_weight_addrb,
  output     [2047:0] io_weight_ram_data_out_0,
  input               clk
);
  wire       [10:0]   sdpram_5_addra;
  wire       [5:0]    sdpram_5_addrb;
  wire       [0:0]    sdpram_5_wea;
  wire       [2047:0] sdpram_5_doutb;

  sdpram sdpram_5 (
    .doutb    (sdpram_5_doutb      ), //o
    .addra    (sdpram_5_addra      ), //i
    .addrb    (sdpram_5_addrb      ), //i
    .dina     (io_weight_data_One  ), //i
    .ena      (1'b1                ), //i
    .enb      (1'b1                ), //i
    .wea      (sdpram_5_wea        ), //i
    .clk      (clk                 )  //i
  );
  assign sdpram_5_wea = io_weight_wr[0];
  assign sdpram_5_addra = io_weight_addra[10:0];
  assign sdpram_5_addrb = io_weight_addrb[5:0];
  assign io_weight_ram_data_out_0 = sdpram_5_doutb;

endmodule

module mul (
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

module sdpram (
  output     [2047:0] doutb,
  input      [10:0]   addra,
  input      [5:0]    addrb,
  input      [63:0]   dina,
  input               ena,
  input               enb,
  input      [0:0]    wea,
  input               clk
);
  wire                temp_dbiterrb;
  wire       [2047:0] temp_doutb;
  wire                temp_sbiterrb;
  wire                dbiterrb;
  wire                sbiterrb;
  wire                injectdbiterra;
  wire                injectsbiterra;
  wire                regceb;
  wire                rstb;
  wire                sleep;

  xpm_memory_sdpram #(
    .ADDR_WIDTH_A(11),
    .ADDR_WIDTH_B(6),
    .AUTO_SLEEP_TIME(0),
    .BYTE_WRITE_WIDTH_A(64),
    .CASCADE_HEIGHT(0),
    .CLOCKING_MODE("common_clock"),
    .ECC_MODE("no_ecc"),
    .MEMORY_INIT_FILE("none"),
    .MEMORY_INIT_PARAM("0"),
    .MEMORY_OPTIMIZATION("true"),
    .MEMORY_PRIMITIVE("block"),
    .MEMORY_SIZE(131072),
    .MESSAGE_CONTROL(0),
    .READ_DATA_WIDTH_B(2048),
    .READ_LATENCY_B(1),
    .READ_RESET_VALUE_B("0"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SIM_ASSERT_CHK(0),
    .USE_EMBEDDED_CONSTRAINT(0),
    .USE_MEM_INIT(1),
    .WAKEUP_TIME("disable_sleep"),
    .WRITE_DATA_WIDTH_A(64),
    .WRITE_MODE_B("read_first") 
  ) temp (
    .dbiterrb          (temp_dbiterrb   ), //o
    .doutb             (temp_doutb      ), //o
    .sbiterrb          (temp_sbiterrb   ), //o
    .addra             (addra           ), //i
    .addrb             (addrb           ), //i
    .clka              (clk             ), //i
    .clkb              (clk             ), //i
    .dina              (dina            ), //i
    .ena               (ena             ), //i
    .enb               (enb             ), //i
    .injectdbiterra    (injectdbiterra  ), //i
    .injectsbiterra    (injectsbiterra  ), //i
    .regceb            (regceb          ), //i
    .rstb              (rstb            ), //i
    .sleep             (sleep           ), //i
    .wea               (wea             )  //i
  );
  assign injectdbiterra = 1'b0;
  assign injectsbiterra = 1'b0;
  assign regceb = 1'b1;
  assign rstb = 1'b0;
  assign sleep = 1'b0;
  assign dbiterrb = temp_dbiterrb;
  assign doutb = temp_doutb;
  assign sbiterrb = temp_sbiterrb;

endmodule
