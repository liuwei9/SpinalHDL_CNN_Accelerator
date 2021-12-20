package conv

import spinal.core._
import spinal.lib._

case class ConvConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int,COMPUTE_CHANNEL_IN_NUM:Int,COMPUTE_CHANNEL_OUT_NUM:Int,FEATURE_WIDTH: Int,CONV_TYPE:String="conv33"){
    require(CONV_TYPE == "conv33" || CONV_TYPE == "conv11","CONV_TYPE只支持conv33和conv11类型")
    val KERNEL_NUM = if(CONV_TYPE == "conv33") 9 else 1
    val PICTURE_NUM = 1
    val S_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_IN_NUM * PICTURE_NUM
    val M_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_OUT_NUM * PICTURE_NUM


}

case class ConvCtrl(convConfig: ConvConfig) extends Component{
    val io = new Bundle{
        val start = in Bool()

    }
    noIoPrefix()

}

class Conv(convConfig: ConvConfig) extends Component {

}
object Conv{
    def main(args: Array[String]): Unit = {
    }
}
