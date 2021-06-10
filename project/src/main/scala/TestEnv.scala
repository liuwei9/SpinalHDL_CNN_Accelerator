import spinal.core._
class TestEnv extends Component{
    val io = new Bundle {
        val a = in Bool()
        val b = out Bool()
    }
    noIoPrefix()
    io.b := io.a;
}
object TestEnv {
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            mode = Verilog,
            targetDirectory = "./verilog/temp"
        ).generate(new TestEnv)
    }

}
