import spinal.core._
class Test extends Component {
    val b = Bits(8 bits)
    b:=B"3'd0"##Bits(5 bits).setAll()


}
object Test{
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            targetDirectory = "verilog"
        ).generateVerilog(new Test)
    }
}

