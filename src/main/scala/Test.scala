import spinal.core._
import spinal.lib.bus.amba4.axilite._
import spinal.lib._

class Test extends Component{
    val io = new Bundle{
        val S_AXI = slave (AxiLite4(AxiLite4Config(32,32)))
        val dma_addr = out Bits(32 bits) setAsReg() init 0
        val intr = in Bool()
        val state = out Bool() setAsReg() init False
    }
    noIoPrefix()
    AxiLite4SpecRenamer(io.S_AXI)
    val factory = new AxiLite4SlaveFactory(io.S_AXI)
    factory.read(io.intr,0x0,0,"bool")
    factory.write(io.dma_addr,0x4,0,"dma_addr")
    io.state.clear()
    factory.read(io.state,0x8,0,"state")
}
object Test{
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new Test)
    }
}
