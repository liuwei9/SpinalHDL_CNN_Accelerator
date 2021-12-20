package wa

import spinal.core._
import spinal.lib._

object WaStreamMem {
    def apply[T <: Data](dataType: T, depth: Int) = new WaStreamMem(dataType, depth)
}

class WaStreamMem[T <: Data](dataType: HardType[T], depth: Int) extends Component {
    val readPort = new Bundle {
        val data = master Stream dataType
        val addr = slave Stream UInt(depth.toBinaryString.length bits)
    }
    val writePort = new Bundle {
        val addr = in UInt (depth.toBinaryString.length bits)
        val en = in Bool()
        val data = in(cloneOf(dataType))
    }
    val readAddr = Stream(UInt(depth.toBinaryString.length bits))
    readAddr.valid := readPort.addr.valid
    readPort.addr.ready := readAddr.ready
    val k = Mem(dataType, wordCount = depth)
    val z = k.streamReadSync(readAddr.translateWith(readPort.addr.payload))
    val readData: T = dataType()
    readData := z.payload
    readPort.data <> z.translateWith(readData)
    k.write(writePort.addr, writePort.data, writePort.en)

}

class WaPingPongStreamMem[T <: Data](dataType: T, depth: Int, pingPongCount: Int) extends Component {
    val read = new Bundle {
        val data = master Stream dataType
        val addr = slave Stream UInt(depth.toBinaryString.length bits)
    }
    val write = new Bundle {
        val addr = in UInt (depth.toBinaryString.length bits)
        val en = in Bool()
        val data = in(cloneOf(dataType))
    }
    val mem = List.fill(pingPongCount)(WaStreamMem(dataType, depth))
    val selectMemIndex = in Bits (pingPongCount.toBinaryString.length bits)
    switch(selectMemIndex) {
        (0 until pingPongCount).foreach { i =>
            is(i) {
                mem.indices.foreach { j =>
                    if (i == j) {
                        mem(j).readPort.addr <> read.addr
                        mem(j).readPort.data <> read.data
                        mem(j).writePort.data <> write.data
                        mem(j).writePort.addr <> write.addr
                        mem(j).writePort.en <> write.en
                    } else {
                        setDefault(mem(j))
                    }
                }
            }

        }
        default {
            mem.indices.foreach { j =>
                setDefault(mem(j))
            }
            read.data.valid := False
            read.data.payload.assignFromBits(B(0, dataType.getBitsWidth bits))
            read.addr.ready := False
        }
    }

    def setDefault(t: WaStreamMem[T]) = {
        t.readPort.addr.valid := False
        t.readPort.addr.payload := 0
        t.readPort.data.ready := False
        t.writePort.data.assignFromBits(B(0, dataType.getBitsWidth bits))
        t.writePort.addr := 0
        t.writePort.en := False
    }
}
