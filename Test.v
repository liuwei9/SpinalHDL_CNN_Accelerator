// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Test
// Git hash  : 0adb3aea27648d3f8101fea65c789292141927cb



module Test (
  input               S_AXI_awvalid,
  output              S_AXI_awready,
  input      [31:0]   S_AXI_awaddr,
  input      [2:0]    S_AXI_awprot,
  input               S_AXI_wvalid,
  output              S_AXI_wready,
  input      [31:0]   S_AXI_wdata,
  input      [3:0]    S_AXI_wstrb,
  output              S_AXI_bvalid,
  input               S_AXI_bready,
  output     [1:0]    S_AXI_bresp,
  input               S_AXI_arvalid,
  output reg          S_AXI_arready,
  input      [31:0]   S_AXI_araddr,
  input      [2:0]    S_AXI_arprot,
  output              S_AXI_rvalid,
  input               S_AXI_rready,
  output     [31:0]   S_AXI_rdata,
  output     [1:0]    S_AXI_rresp,
  output reg [31:0]   dma_addr,
  input               intr,
  output reg          state,
  input               clk,
  input               reset
);
  wire                factory_readHaltRequest;
  wire                factory_writeHaltRequest;
  wire                factory_writeJoinEvent_valid;
  wire                factory_writeJoinEvent_ready;
  wire                factory_writeJoinEvent_fire;
  wire       [1:0]    factory_writeRsp_resp;
  wire                factory_writeJoinEvent_translated_valid;
  wire                factory_writeJoinEvent_translated_ready;
  wire       [1:0]    factory_writeJoinEvent_translated_payload_resp;
  wire                _zz_S_AXI_bvalid;
  reg                 _zz_factory_writeJoinEvent_translated_ready;
  wire                _zz_S_AXI_bvalid_1;
  reg                 _zz_S_AXI_bvalid_2;
  reg        [1:0]    _zz_S_AXI_bresp;
  wire                when_Stream_l342;
  wire                S_AXI_ar_readDataStage_valid;
  wire                S_AXI_ar_readDataStage_ready;
  wire       [31:0]   S_AXI_ar_readDataStage_payload_addr;
  wire       [2:0]    S_AXI_ar_readDataStage_payload_prot;
  reg                 S_AXI_ar_rValid;
  reg        [31:0]   S_AXI_ar_rData_addr;
  reg        [2:0]    S_AXI_ar_rData_prot;
  wire                when_Stream_l342_1;
  reg        [31:0]   factory_readRsp_data;
  wire       [1:0]    factory_readRsp_resp;
  wire                _zz_S_AXI_rvalid;
  wire                factory_writeOccur;
  wire                factory_readOccur;

  assign factory_readHaltRequest = 1'b0;
  assign factory_writeHaltRequest = 1'b0;
  assign factory_writeJoinEvent_fire = (factory_writeJoinEvent_valid && factory_writeJoinEvent_ready);
  assign factory_writeJoinEvent_valid = (S_AXI_awvalid && S_AXI_wvalid);
  assign S_AXI_awready = factory_writeJoinEvent_fire;
  assign S_AXI_wready = factory_writeJoinEvent_fire;
  assign factory_writeJoinEvent_translated_valid = factory_writeJoinEvent_valid;
  assign factory_writeJoinEvent_ready = factory_writeJoinEvent_translated_ready;
  assign factory_writeJoinEvent_translated_payload_resp = factory_writeRsp_resp;
  assign _zz_S_AXI_bvalid = (! factory_writeHaltRequest);
  assign factory_writeJoinEvent_translated_ready = (_zz_factory_writeJoinEvent_translated_ready && _zz_S_AXI_bvalid);
  always @(*) begin
    _zz_factory_writeJoinEvent_translated_ready = S_AXI_bready;
    if(when_Stream_l342) begin
      _zz_factory_writeJoinEvent_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! _zz_S_AXI_bvalid_1);
  assign _zz_S_AXI_bvalid_1 = _zz_S_AXI_bvalid_2;
  assign S_AXI_bvalid = _zz_S_AXI_bvalid_1;
  assign S_AXI_bresp = _zz_S_AXI_bresp;
  always @(*) begin
    S_AXI_arready = S_AXI_ar_readDataStage_ready;
    if(when_Stream_l342_1) begin
      S_AXI_arready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! S_AXI_ar_readDataStage_valid);
  assign S_AXI_ar_readDataStage_valid = S_AXI_ar_rValid;
  assign S_AXI_ar_readDataStage_payload_addr = S_AXI_ar_rData_addr;
  assign S_AXI_ar_readDataStage_payload_prot = S_AXI_ar_rData_prot;
  assign _zz_S_AXI_rvalid = (! factory_readHaltRequest);
  assign S_AXI_ar_readDataStage_ready = (S_AXI_rready && _zz_S_AXI_rvalid);
  assign S_AXI_rvalid = (S_AXI_ar_readDataStage_valid && _zz_S_AXI_rvalid);
  assign S_AXI_rdata = factory_readRsp_data;
  assign S_AXI_rresp = factory_readRsp_resp;
  assign factory_writeRsp_resp = 2'b00;
  assign factory_readRsp_resp = 2'b00;
  always @(*) begin
    factory_readRsp_data = 32'h0;
    case(S_AXI_ar_readDataStage_payload_addr)
      32'h0 : begin
        factory_readRsp_data[0 : 0] = intr;
      end
      32'h00000008 : begin
        factory_readRsp_data[0 : 0] = state;
      end
      default : begin
      end
    endcase
  end

  assign factory_writeOccur = (factory_writeJoinEvent_valid && factory_writeJoinEvent_ready);
  assign factory_readOccur = (S_AXI_rvalid && S_AXI_rready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dma_addr <= 32'h0;
      state <= 1'b0;
      _zz_S_AXI_bvalid_2 <= 1'b0;
      S_AXI_ar_rValid <= 1'b0;
    end else begin
      if(_zz_factory_writeJoinEvent_translated_ready) begin
        _zz_S_AXI_bvalid_2 <= (factory_writeJoinEvent_translated_valid && _zz_S_AXI_bvalid);
      end
      if(S_AXI_arready) begin
        S_AXI_ar_rValid <= S_AXI_arvalid;
      end
      state <= 1'b0;
      case(S_AXI_awaddr)
        32'h00000004 : begin
          if(factory_writeOccur) begin
            dma_addr <= S_AXI_wdata[31 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(_zz_factory_writeJoinEvent_translated_ready) begin
      _zz_S_AXI_bresp <= factory_writeJoinEvent_translated_payload_resp;
    end
    if(S_AXI_arready) begin
      S_AXI_ar_rData_addr <= S_AXI_araddr;
      S_AXI_ar_rData_prot <= S_AXI_arprot;
    end
  end


endmodule
