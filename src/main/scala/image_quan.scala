import spinal.core._
import spinal.lib._

class image_quan(
                    S_DATA_WIDTH: Int,
                    M_DATA_WIDTH: Int,
                    FEATURE_MAP_SIZE:Int,
                    ROW_COL_DATA_COUNT_WIDTH: Int,
                    CHANNEL_OUT_TIMES: Int
                ) extends Component {

    val io = new Bundle {
        val S_DATA = slave Stream Bits(S_DATA_WIDTH bits)
        val M_DATA = master Stream Bits(M_DATA_WIDTH bits)

    }
    noIoPrefix()
    val bias_data_0 = B"256'hffffd79200001657000040b7ffffe72bffffd3c2ffffdc260000293d00003d10"
    val bias_data_1 = B"256'hfffff231000048a5fffff70100002e42fffffeb8fffff75dffffc50cfffff8d0"
    val bias_data_2 = B"256'hffffe61c000051a7ffffff2d00003b670000035e00000f3a00001999ffffff08"
    val bias_data_3 = B"256'h000013cf000001c6ffffd6dffffffbabffffc82400002274fffffbebffffdfff"
    val scale_data_0 = B"256'h9081a1009c6814006028a8007242d8006b430400a0a4a9006d986980621aec80"
    val scale_data_1 = B"256'hb26ca600a675090075bf3d0071cad480b17612007bf28d80b2614d0087565d00"
    val scale_data_2 = B"256'h620e66806d985580b2258b00b013a3005de8a600ac71ea00acd98d007323ce80"
    val scale_data_3 = B"256'h7539b280b43299007f6ce380a325fc0065362b00aee988006752a480af316500"
    val shift_data_0 = B"256'h00000009000000090000000a0000000800000009000000090000000900000009"
    val shift_data_1 = B"256'h000000080000000a000000070000000900000007000000070000000a00000007"
    val shift_data_2 = B"256'h000000080000000a000000060000000a00000006000000080000000900000007"
    val shift_data_3 = B"256'h0000000800000006000000090000000700000009000000090000000700000009"
    val zero_point = B"8'd68"

    val ctrl = new image_quan_ctrl(ROW_COL_DATA_COUNT_WIDTH,CHANNEL_OUT_TIMES,FEATURE_MAP_SIZE)
    ctrl.io.M_Ready <> io.M_DATA.ready
    ctrl.io.M_Valid <> io.M_DATA.valid


    val bias_data_in = Bits(S_DATA_WIDTH bits) setAsReg() init 0
    switch(ctrl.io.para_select){
        is(1){
            bias_data_in := bias_data_0
        }
        is(2){
            bias_data_in := bias_data_1
        }
        is(3){
            bias_data_in := bias_data_2
        }
        is(4){
            bias_data_in := bias_data_3
        }
        default{
            bias_data_in := 0
        }
    }


}
