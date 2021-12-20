package wa

import spinal.core.{Data, HardType, out, when}
import spinal.lib.StreamFifo
object WaStreamFifo{
    def apply[T <: Data](dataType: T, depth: Int) = new WaStreamFifo(dataType,depth)
}
class WaStreamFifo [T <: Data](dataType: HardType[T], depth: Int) extends StreamFifo[T](dataType: HardType[T], depth: Int){
    val almost_full = out Bool()
    when(io.availability <= 1){
        almost_full.set()
    } otherwise{
        almost_full.clear()
    }
    noIoPrefix()
}
