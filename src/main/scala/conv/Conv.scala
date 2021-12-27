package conv

import conv.ConvComputeCtrlEnum.{IDLE, newElement}
import conv.dataGenerate._
import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import wa.WaCounter
import xmemory._

object ConvType {
    val conv33 = "conv33"
    val conv11 = "conv11"
}

/**
 *
 * @param DATA_WIDTH              数据位宽，8bit
 * @param COMPUTE_CHANNEL_IN_NUM  一次可计算的一个卷积核的通道数
 * @param COMPUTE_CHANNEL_OUT_NUM 一次可计算的卷积核数量
 * @param MAX_CHANNEL_IN          支持的最大的卷积核通道数
 * @param MAX_CHANNEL_OUT         支持的最大的卷积核数量
 * @param CONV_TYPE               卷积类型
 *
 */
case class ConvConfig(DATA_WIDTH: Int, COMPUTE_CHANNEL_IN_NUM: Int, COMPUTE_CHANNEL_OUT_NUM: Int, CHANNEL_WIDTH: Int, WEIGHT_DEPTH: Int, QUAN_DEPTH: Int, FEATURE: Int, FEATURE_RAM_DEPTH: Int, ZERO_NUM: Int, CONV_TYPE: String = ConvType.conv33) {
    require(CONV_TYPE == ConvType.conv33 || CONV_TYPE == ConvType.conv11, "CONV_TYPE只支持conv33和conv11类型")
    val KERNEL_NUM = CONV_TYPE match {
        case ConvType.conv33 => 9
        case ConvType.conv11 => 1
        case _ => -1
    }
    val FEATURE_WIDTH = log2Up(FEATURE)
    val PICTURE_NUM = 1
    val FEATURE_S_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_IN_NUM * PICTURE_NUM
    //    val FEATURE_NINE_DEPTH =
    val FEATURE_M_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_OUT_NUM * PICTURE_NUM
    val WEIGHT_S_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_IN_NUM * PICTURE_NUM
    val WEIGHT_S_DATA_DEPTH = WEIGHT_DEPTH
    val WEIGHT_M_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_IN_NUM * COMPUTE_CHANNEL_OUT_NUM
    val WEIGHT_M_DATA_DEPTH = WEIGHT_S_DATA_WIDTH * WEIGHT_S_DATA_DEPTH / WEIGHT_M_DATA_WIDTH
    val QUAN_S_DATA_WIDTH = DATA_WIDTH * COMPUTE_CHANNEL_IN_NUM * PICTURE_NUM
    val QUAN_S_DATA_DEPTH = QUAN_DEPTH
    val QUAN_M_DATA_WIDTH = 32 * COMPUTE_CHANNEL_OUT_NUM
    val QUAN_M_DATA_DEPTH = QUAN_S_DATA_WIDTH * QUAN_S_DATA_DEPTH / QUAN_M_DATA_WIDTH


    val dataGenerateConfig = DataGenerateConfig(DATA_WIDTH, CHANNEL_WIDTH, COMPUTE_CHANNEL_IN_NUM, FEATURE_WIDTH, KERNEL_NUM, FEATURE_RAM_DEPTH, ZERO_NUM)

}

object ConvComputeCtrlEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, DATA_READY, FIFO_READY, COMPUTE, END = newElement
}

case class ConvComputeCtrlFsm() extends Area {
    val start = Bool()
    val dataReady = Bool()
    val fifoReady = Bool()
    val initEnd = Bool()


    val currentState = Reg(ConvComputeCtrlEnum()) init ConvComputeCtrlEnum.IDLE
    val nextState = ConvComputeCtrlEnum()
    currentState := nextState
    switch(currentState) {
        is(ConvComputeCtrlEnum.IDLE) {
            when(start) {
                nextState := ConvComputeCtrlEnum.INIT
            } otherwise {
                nextState := ConvComputeCtrlEnum.IDLE
            }
        }
        is(ConvComputeCtrlEnum.INIT) {
            when(initEnd) {
                nextState := ConvComputeCtrlEnum.DATA_READY
            } otherwise {
                nextState := ConvComputeCtrlEnum.INIT
            }
        }
        is(ConvComputeCtrlEnum.DATA_READY) {
            when(dataReady) {
                nextState := ConvComputeCtrlEnum.FIFO_READY
            } otherwise {
                nextState := ConvComputeCtrlEnum.DATA_READY
            }
        }
        is(ConvComputeCtrlEnum.FIFO_READY) {
            when(fifoReady) {
                nextState := ConvComputeCtrlEnum.COMPUTE
            } otherwise {
                nextState := ConvComputeCtrlEnum.FIFO_READY
            }
        }
        is(ConvComputeCtrlEnum.COMPUTE) {

        }
    }

}


case class ConvComputeCtrl(convConfig: ConvConfig) extends Component {

    val io = new Bundle {
        val start = in Bool()
        val mDataValid = out Bool()
        val mDataReady = in Bool()
        val normValid = out Bool()
        val normPreValid = out Bool()
        val sDataValid = in Bool()
        val sDataReady = in Bool()
        val rowNumIn = in UInt (convConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (convConfig.FEATURE_WIDTH bits)
        val channelIn = in UInt (convConfig.CHANNEL_WIDTH bits)
        val channelOut = in UInt (convConfig.CHANNEL_WIDTH bits)
        val sCount = out UInt (log2Up(convConfig.FEATURE_RAM_DEPTH) bits)
        val mCount = out UInt (log2Up(convConfig.FEATURE_RAM_DEPTH) bits)
    }
    noIoPrefix()
    val computeChannelInTimes = RegNext(io.channelIn >> log2Up(convConfig.COMPUTE_CHANNEL_IN_NUM))
    val computeChannelOutTimes = RegNext(io.channelOut >> log2Up(convConfig.COMPUTE_CHANNEL_OUT_NUM))
    io.sCount := RegNext(io.colNumIn * computeChannelInTimes)
    io.mCount := io.sCount


}

class ConvCompute(convConfig: ConvConfig) extends Component {

    val io = new Bundle {
        val startPa = in Bool()
        val startCu = in Bool()
        val sParaData = slave Stream UInt(convConfig.WEIGHT_S_DATA_WIDTH bits)
        val sFeatureData = slave Stream UInt(convConfig.FEATURE_S_DATA_WIDTH bits)
        val mFeatureData = master Stream UInt(convConfig.FEATURE_M_DATA_WIDTH bits)

        val rowNumIn = in UInt (convConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (convConfig.FEATURE_WIDTH bits)
        val channelIn = in UInt (convConfig.CHANNEL_WIDTH bits)
        val channelOut = in UInt (convConfig.CHANNEL_WIDTH bits)
        val enPadding = in Bool()
        val zeroDara = in Bits (convConfig.dataGenerateConfig.DATA_WIDTH bits)
        val zeroNum = in UInt (convConfig.dataGenerateConfig.paddingConfig.ZERO_NUM_WIDTH bits)
    }
    noIoPrefix()

    val dataGenerate = new DataGenerate(convConfig.dataGenerateConfig)
    dataGenerate.io.sData <> io.sFeatureData
    dataGenerate.io.start <> io.startCu
    dataGenerate.io.rowNumIn <> io.rowNumIn
    dataGenerate.io.colNumIn <> io.colNumIn
    dataGenerate.io.channelIn <> io.channelIn
    dataGenerate.io.zeroDara <> io.zeroDara
    dataGenerate.io.zeroNum <> io.zeroNum

    val loadWeight = LoadWeight(convConfig)
    loadWeight.io.sData <> io.sParaData

    val computeCtrl = ConvComputeCtrl(convConfig)

}


class Conv(convConfig: ConvConfig) extends Component {
    val io = new Bundle {
        val sData = Vec(slave Stream UInt(convConfig.FEATURE_S_DATA_WIDTH bits), convConfig.KERNEL_NUM)
        val mData = master Stream UInt(convConfig.FEATURE_M_DATA_WIDTH bits)
        val start = in Bool()


    }
    noIoPrefix()

    val convState = ConvState(convConfig)


}

case class WeightReadPort[T <: Data](dataType: HardType[T], depth: Int) extends Bundle {
    val addr = in UInt (log2Up(depth) bits)
    //    val en = in Bool()
    val data = out(cloneOf(dataType))
}

object LoadWeightEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, COPY_WEIGHT, COPY_BIAS, COPY_SCALE, COPY_SHIFT = newElement
}

case class LoadWeightFsm(start: Bool) extends Area {

    val copyWeightEnd = Bool()
    val copyBiasEnd = Bool()
    val copyScaleEnd = Bool()
    val copyShiftEnd = Bool()

    val currentState = Reg(LoadWeightEnum()) init LoadWeightEnum.IDLE
    val nextState = LoadWeightEnum()
    currentState := nextState
    switch(currentState) {
        is(LoadWeightEnum.IDLE) {
            when(start) {
                nextState := LoadWeightEnum.COPY_WEIGHT
            } otherwise {
                nextState := LoadWeightEnum.IDLE
            }
        }
        is(LoadWeightEnum.COPY_WEIGHT) {
            when(copyWeightEnd) {
                nextState := LoadWeightEnum.COPY_BIAS
            } otherwise {
                nextState := LoadWeightEnum.COPY_WEIGHT
            }
        }
        is(LoadWeightEnum.COPY_BIAS) {
            when(copyBiasEnd) {
                nextState := LoadWeightEnum.COPY_SCALE
            } otherwise {
                nextState := LoadWeightEnum.COPY_BIAS
            }
        }
        is(LoadWeightEnum.COPY_SCALE) {
            when(copyScaleEnd) {
                nextState := LoadWeightEnum.COPY_SHIFT
            } otherwise {
                nextState := LoadWeightEnum.COPY_SCALE
            }
        }
        is(LoadWeightEnum.COPY_SHIFT) {
            when(copyShiftEnd) {
                nextState := LoadWeightEnum.IDLE
            } otherwise {
                nextState := LoadWeightEnum.COPY_SHIFT
            }
        }
    }
}

case class LoadWeight(convConfig: ConvConfig) extends Component {
    val io = new Bundle {
        val start = in Bool()
        val sData = slave Stream UInt(convConfig.WEIGHT_S_DATA_WIDTH bits)
        val weightNum = in UInt (log2Up(convConfig.WEIGHT_S_DATA_DEPTH) bits)
        val quanNum = in UInt (log2Up(convConfig.QUAN_S_DATA_DEPTH) bits)
        val weightRead = Vec(WeightReadPort(UInt(convConfig.WEIGHT_M_DATA_WIDTH bits), convConfig.WEIGHT_M_DATA_DEPTH), convConfig.KERNEL_NUM)
        val biasRead = WeightReadPort(UInt(convConfig.QUAN_M_DATA_WIDTH bits), convConfig.QUAN_M_DATA_DEPTH)
        val scaleRead = WeightReadPort(UInt(convConfig.QUAN_M_DATA_WIDTH bits), convConfig.QUAN_M_DATA_DEPTH)
        val shiftRead = WeightReadPort(UInt(convConfig.QUAN_M_DATA_WIDTH bits), convConfig.QUAN_M_DATA_DEPTH)

    }
    noIoPrefix()

    val fsm = LoadWeightFsm(io.start)
    val copyWeightCnt = WaCounter(fsm.currentState === LoadWeightEnum.COPY_WEIGHT && io.sData.fire, log2Up(convConfig.WEIGHT_S_DATA_DEPTH), io.weightNum - 1)
    val copyWeightTimes = WaCounter(copyWeightCnt.valid, convConfig.KERNEL_NUM.toBinaryString.length, convConfig.KERNEL_NUM)
    fsm.copyWeightEnd := copyWeightCnt.valid && copyWeightTimes.valid

    when(fsm.currentState === LoadWeightEnum.COPY_WEIGHT || fsm.currentState === LoadWeightEnum.COPY_SHIFT || fsm.currentState === LoadWeightEnum.COPY_BIAS || fsm.currentState === LoadWeightEnum.COPY_SCALE) {
        io.sData.ready := True
    } otherwise {
        io.sData.ready := False
    }


    val weav = Vec(Bool(), convConfig.KERNEL_NUM)
    when(io.sData.fire) {
        switch(copyWeightTimes.count) {
            (0 until convConfig.KERNEL_NUM).foreach(i => {
                is(i) {
                    (0 until convConfig.KERNEL_NUM).foreach(j => {
                        if (i == j) {
                            weav(j) := True
                        } else {
                            weav(j) := False
                        }
                    }
                    )
                }
            })
            default {
                weav.map(_ := False)
            }

        }

    } otherwise {
        weav.map(_ := False)
    }
    val weightRam = Array.tabulate(convConfig.KERNEL_NUM) { i =>
        def gen = {
            val temp = new sdpram(convConfig.WEIGHT_S_DATA_WIDTH, convConfig.WEIGHT_S_DATA_DEPTH, convConfig.WEIGHT_M_DATA_WIDTH, convConfig.WEIGHT_M_DATA_DEPTH, MEM_TYPE.block, 1, CLOCK_MODE.common_clock, this.clockDomain, this.clockDomain)
            temp.io.wea <> weav(i).asBits
            temp.io.ena := True
            temp.io.enb := True
            temp.io.addra := copyWeightCnt.count.asBits
            temp.io.addrb := io.weightRead(i).addr.asBits
            temp.io.dina <> io.sData.payload.asBits
            temp.io.doutb.asUInt <> io.weightRead(i).data
            temp
        }

        gen
    }

    case class copyQuan(enCnt: Bool, wea: Bool, dina: UInt, addrb: UInt, doutb: UInt, clk: ClockDomain) extends Area {
        val copyCnt = WaCounter(enCnt, log2Up(convConfig.QUAN_S_DATA_DEPTH), io.quanNum - 1)
        val ram = new sdpram(convConfig.QUAN_S_DATA_WIDTH, convConfig.QUAN_S_DATA_DEPTH, convConfig.QUAN_M_DATA_WIDTH, convConfig.QUAN_M_DATA_DEPTH, MEM_TYPE.distributed, 0, CLOCK_MODE.common_clock, clk, clk)
        ram.io.ena <> True
        ram.io.wea <> wea.asBits
        ram.io.dina <> dina.asBits
        ram.io.addra <> copyCnt.count.asBits
        ram.io.addrb <> addrb.asBits
        ram.io.doutb.asUInt <> doutb
        ram.io.enb <> True
    }

    val copyBias = copyQuan(fsm.currentState === LoadWeightEnum.COPY_BIAS && io.sData.fire, fsm.currentState === LoadWeightEnum.COPY_BIAS && io.sData.fire, io.sData.payload, io.biasRead.addr, io.biasRead.data, this.clockDomain)
    fsm.copyBiasEnd := copyBias.copyCnt.valid
    val copyScale = copyQuan(fsm.currentState === LoadWeightEnum.COPY_SCALE && io.sData.fire, fsm.currentState === LoadWeightEnum.COPY_SCALE && io.sData.fire, io.sData.payload, io.scaleRead.addr, io.scaleRead.data, this.clockDomain)
    fsm.copyScaleEnd := copyScale.copyCnt.valid
    val copyShift = copyQuan(fsm.currentState === LoadWeightEnum.COPY_SHIFT && io.sData.fire, fsm.currentState === LoadWeightEnum.COPY_SHIFT && io.sData.fire, io.sData.payload, io.shiftRead.addr, io.shiftRead.data, this.clockDomain)
    fsm.copyShiftEnd := copyShift.copyCnt.valid


}

object ConvStateEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, PARA, PARA_IRQ, COMPUTE, COMPUTE_IRQ = newElement
}

object CONV_STATE extends Area {
    val START_PA = 1
    val START_CU = 2
    val END_IRQ = 15

    val END_PA = 1
    val END_CU = 2

    val IDLE_STATE = 0
    val PARA_STATE = 1
    val COMPUTE_STATE = 2
    val IRQ_STATE = 15

    val PARA_SIGN = 1
    val COMPUTE_SIGN = 2
    val IDLE_SIGN = 0
}

case class ConvStateFsm(control: Bits, complete: Bits) extends Area {

    //    val control = Bits(4 bits)
    //    val complete = Bits(4 bits)

    val currentState = Reg(ConvStateEnum()) init ConvStateEnum.IDLE
    val nextState = ConvStateEnum()
    currentState := nextState
    switch(currentState) {
        is(ConvStateEnum.IDLE) {
            when(control === CONV_STATE.START_PA) {
                nextState := ConvStateEnum.PARA
            } elsewhen (control === CONV_STATE.START_CU) {
                nextState := ConvStateEnum.COMPUTE
            } otherwise {
                nextState := ConvStateEnum.IDLE
            }
        }
        is(ConvStateEnum.PARA) {
            when(complete === CONV_STATE.END_PA) {
                nextState := ConvStateEnum.PARA_IRQ
            } otherwise {
                nextState := ConvStateEnum.PARA
            }
        }
        is(ConvStateEnum.PARA_IRQ) {
            when(control === CONV_STATE.END_IRQ) {
                nextState := ConvStateEnum.IDLE
            } otherwise {
                nextState := ConvStateEnum.PARA_IRQ
            }
        }
        is(ConvStateEnum.COMPUTE) {
            when(complete === CONV_STATE.END_CU) {
                nextState := ConvStateEnum.COMPUTE_IRQ
            } otherwise {
                nextState := ConvStateEnum.COMPUTE
            }
        }
        is(ConvStateEnum.COMPUTE_IRQ) {
            when(control === CONV_STATE.END_IRQ) {
                nextState := ConvStateEnum.IDLE
            } otherwise {
                nextState := ConvStateEnum.COMPUTE_IRQ
            }
        }

    }
}

case class ConvState(convConfig: ConvConfig) extends Component {
    val io = new Bundle {
        val control = in Bits (4 bits)
        val complete = in Bits (4 bits)
        val state = out(Reg(Bits(4 bits)))
        val sign = out(Reg(Bits(4 bits)))
        val dmaReadValid = out Bool()
        val dmaWriteValid = out Bool()
    }
    noIoPrefix()
    val fsm = ConvStateFsm(io.control, io.complete)
    switch(fsm.currentState) {
        is(ConvStateEnum.IDLE) {
            io.state := CONV_STATE.IDLE_STATE
        }
        is(ConvStateEnum.PARA) {
            io.state := CONV_STATE.PARA_STATE
        }
        is(ConvStateEnum.COMPUTE) {
            io.state := CONV_STATE.COMPUTE_STATE
        }
        is(ConvStateEnum.COMPUTE_IRQ) {
            io.state := CONV_STATE.IRQ_STATE
        }
        is(ConvStateEnum.PARA_IRQ) {
            io.state := CONV_STATE.IRQ_STATE
        }
        //        default {
        //            io.state := CONV_STATE.IDLE_STATE
        //        }
    }

    when(fsm.currentState === ConvStateEnum.IDLE && fsm.nextState === ConvStateEnum.PARA) {
        io.sign := CONV_STATE.PARA_SIGN
        io.dmaReadValid.set()
        io.dmaWriteValid.clear()
    } elsewhen (fsm.currentState === ConvStateEnum.IDLE && fsm.nextState === ConvStateEnum.COMPUTE) {
        io.sign := CONV_STATE.COMPUTE_SIGN
        io.dmaWriteValid.set()
        io.dmaReadValid.set()
    } otherwise {
        io.sign := CONV_STATE.IDLE_SIGN
        io.dmaReadValid.clear()
        io.dmaWriteValid.clear()
    }


}

//object Conv {
//    def main(args: Array[String]): Unit = {
//        SpinalVerilog(ConvState(ConvConfig(8, 16, 8, 12, 2048, 512, 640, 2048, ConvType.conv33)))
//    }
//}
