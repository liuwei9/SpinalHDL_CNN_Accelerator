package xip

import spinal.core._
import spinal.core.Ram_1wrs
class xadd (
               A_WIDTH:Int,
               B_WIDTH:Int,
               S_WIDTH:Int,
               clk:ClockDomain
           )extends BlackBox {
    val io = new Bundle{
        val A = in Bits(A_WIDTH bits)
        val B = in Bits(B_WIDTH bits)
        val S = out Bits(S_WIDTH bits)
        val CLK = in Bool()
    }
    noIoPrefix()
    mapClockDomain(clk ,io.CLK)
//    this.setDefinitionName("a")
//    this.setBlackBoxName("a")
//    this.setName("a")
//
//    override def setDefinitionName(name: String): xadd.this.type = super.setDefinitionName(name+"a")
}
