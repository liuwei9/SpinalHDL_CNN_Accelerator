import spinal.core._
import spinal.lib.{master, slave}
object FpgaDevice {
    val vendor = "xilinx"
    val A7 = "A7"
    val K7 = "K7"
    val V7="V7"
    val VU="VU"
    val KU="KU"
    val ZYNQ = "ZYNQ"

}
case class DataGenerateConfig(DATA_WIDTH: Int, PICTURE_NUM: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, KERNEL_NUM :Int,FEATURE_RAM_ADDR_WIDTH:Int,device: Device){
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
    val paddingConfig = PaddingConfig(DATA_WIDTH,PICTURE_NUM,CHANNEL_WIDTH,COMPUTE_CHANNEL_NUM,FEATURE_WIDTH)
    val featureGenerateConfig = FeatureGenerateConfig(DATA_WIDTH,PICTURE_NUM,CHANNEL_WIDTH,COMPUTE_CHANNEL_NUM,FEATURE_WIDTH,KERNEL_NUM,FEATURE_RAM_ADDR_WIDTH,device: Device)
}
class DataGenerate(dataGenerateConfig: DataGenerateConfig) extends Component {
    val io = new Bundle{
        val sData = slave Stream(Bits(dataGenerateConfig.STREAM_DATA_WIDTH bits))
        val start = in Bool()
        val enPadding = in Bool()
        val channelIn = in UInt (dataGenerateConfig.CHANNEL_WIDTH bits)
        val rowNumIn = in UInt (dataGenerateConfig.FEATURE_WIDTH bits)
        val zeroDara = in Bits (dataGenerateConfig.DATA_WIDTH bits)
        val zeroNum = in UInt (dataGenerateConfig.paddingConfig.ZERO_NUM_WIDTH bits)
        val mData = master(FeaturePort(dataGenerateConfig.STREAM_DATA_WIDTH, dataGenerateConfig.KERNEL_NUM))
    }
    noIoPrefix()
    val padding = new Padding(dataGenerateConfig.paddingConfig)
    padding.io.sData <> io.sData
    padding.io.start <> io.start
    padding.io.enPadding <> io.enPadding
    padding.io.channelIn <> io.channelIn
    padding.io.rowNumIn <> io.rowNumIn
    padding.io.zeroNum <> io.zeroNum
    padding.io.zeroDara <> io.zeroDara
    val featureGenerate = new FeatureGenerate(dataGenerateConfig.featureGenerateConfig)
    featureGenerate.io.mData <> io.mData
    padding >> featureGenerate
}
object DataGenerate{
    def main(args: Array[String]): Unit = {
        val  device = Device(vendor=FpgaDevice.vendor,family = FpgaDevice.K7)
        SpinalConfig(
            device = device
        ).generateVerilog(new DataGenerate(DataGenerateConfig(8,1,12,8,10,9,11,device)))
    }
}
