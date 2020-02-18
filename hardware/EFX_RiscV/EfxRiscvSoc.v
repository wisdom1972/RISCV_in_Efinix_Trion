// Generator : SpinalHDL v1.3.4    git head : 7d280dce7e22c43942ee67566532f582c1c0cfbe
// Date      : 10/05/2019, 10:06:42
// Component : EfxRiscvSoc
// https://www.efinixinc.com


`define Axi4ToApb3BridgePhase_defaultEncoding_type [1:0]
`define Axi4ToApb3BridgePhase_defaultEncoding_SETUP 2'b00
`define Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 2'b01
`define Axi4ToApb3BridgePhase_defaultEncoding_RESPONSE 2'b10

`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define JtagState_defaultEncoding_type [3:0]
`define JtagState_defaultEncoding_RESET 4'b0000
`define JtagState_defaultEncoding_IDLE 4'b0001
`define JtagState_defaultEncoding_IR_SELECT 4'b0010
`define JtagState_defaultEncoding_IR_CAPTURE 4'b0011
`define JtagState_defaultEncoding_IR_SHIFT 4'b0100
`define JtagState_defaultEncoding_IR_EXIT1 4'b0101
`define JtagState_defaultEncoding_IR_PAUSE 4'b0110
`define JtagState_defaultEncoding_IR_EXIT2 4'b0111
`define JtagState_defaultEncoding_IR_UPDATE 4'b1000
`define JtagState_defaultEncoding_DR_SELECT 4'b1001
`define JtagState_defaultEncoding_DR_CAPTURE 4'b1010
`define JtagState_defaultEncoding_DR_SHIFT 4'b1011
`define JtagState_defaultEncoding_DR_EXIT1 4'b1100
`define JtagState_defaultEncoding_DR_PAUSE 4'b1101
`define JtagState_defaultEncoding_DR_EXIT2 4'b1110
`define JtagState_defaultEncoding_DR_UPDATE 4'b1111

`include "Init_file.v"

module BufferCC (
      input   io_initial,
      input   io_dataIn,
      output  io_dataOut,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  buffers_0;
  reg  buffers_1;
  
	initial begin
  	buffers_0	= 0;
  	buffers_1	= 0;
	end
	
  assign io_dataOut = buffers_1;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end

endmodule

module UartCtrlTx (
      input  [2:0] io_configFrame_dataLength,
      input  `UartStopType_defaultEncoding_type io_configFrame_stop,
      input  `UartParityType_defaultEncoding_type io_configFrame_parity,
      input   io_samplingTick,
      input   io_write_valid,
      output reg  io_write_ready,
      input  [7:0] io_write_payload,
      output  io_txd,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_1_;
  wire [0:0] _zz_2_;
  wire [2:0] _zz_3_;
  wire [0:0] _zz_4_;
  wire [2:0] _zz_5_;
  reg  				clockDivider_counter_willIncrement;
  wire  			clockDivider_counter_willClear;
  reg [2:0] 	clockDivider_counter_valueNext;
  reg [2:0] 	clockDivider_counter_value;
  wire  			clockDivider_counter_willOverflowIfInc;
  wire  			clockDivider_willOverflow;
  reg [2:0] 	tickCounter_value;
  reg `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg  				stateMachine_parity;
  reg  				stateMachine_txd;
  reg  				stateMachine_txd_regNext;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif
	
	initial begin
  	clockDivider_counter_willIncrement			= 0;
  	clockDivider_counter_valueNext					= 0;
  	tickCounter_value												= 0;
  	stateMachine_state											= 0;
  	stateMachine_parity											= 0;
  	stateMachine_txd												= 0;
  	stateMachine_txd_regNext								= 0;
  	`ifndef SYNTHESIS                    
  		io_configFrame_stop_string						= 0;
  		io_configFrame_parity_string					= 0;
  		stateMachine_state_string							= 0;
  	`endif
	end	
	
  assign _zz_1_ = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_2_ = clockDivider_counter_willIncrement;
  assign _zz_3_ = {2'd0, _zz_2_};
  assign _zz_4_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_5_ = {2'd0, _zz_4_};
  `ifndef SYNTHESIS
  always @( * ) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @( * ) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @( * ) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ ( * ) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == (3'b111));
  assign clockDivider_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ ( * ) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_3_);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = (3'b000);
    end
  end

  always @ ( * ) begin
    stateMachine_txd = 1'b1;
    io_write_ready = 1'b0;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
        if(clockDivider_willOverflow)begin
          if(_zz_1_)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  assign io_txd = stateMachine_txd_regNext;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      clockDivider_counter_value <= (3'b000);
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      stateMachine_txd_regNext <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if((io_write_valid && clockDivider_willOverflow))begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_willOverflow)begin
            if(_zz_1_)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_willOverflow)begin
            if((tickCounter_value == _zz_5_))begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      stateMachine_txd_regNext <= stateMachine_txd;
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(clockDivider_willOverflow)begin
      tickCounter_value <= (tickCounter_value + (3'b001));
    end
    if(clockDivider_willOverflow)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_willOverflow)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= (3'b000);
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_willOverflow)begin
          if(_zz_1_)begin
            tickCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_willOverflow)begin
          tickCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end

endmodule

module UartCtrlRx (
      input  [2:0] io_configFrame_dataLength,
      input  `UartStopType_defaultEncoding_type io_configFrame_stop,
      input  `UartParityType_defaultEncoding_type io_configFrame_parity,
      input   io_samplingTick,
      output  io_read_valid,
      output [7:0] io_read_payload,
      input   io_rxd,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_1_;
  wire  bufferCC_5__io_dataOut;
  wire  _zz_2_;
  wire  _zz_3_;
  wire [0:0] _zz_4_;
  wire [2:0] _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire  _zz_9_;
  wire  _zz_10_;
  wire  _zz_11_;
  wire  _zz_12_;
  wire  sampler_synchroniser;
  wire  sampler_samples_0;
  reg  sampler_samples_1;
  reg  sampler_samples_2;
  reg  sampler_samples_3;
  reg  sampler_samples_4;
  reg  sampler_value;
  reg  sampler_tick;
  reg [2:0] bitTimer_counter;
  reg  bitTimer_tick;
  reg [2:0] bitCounter_value;
  reg `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg  stateMachine_parity;
  reg [7:0] stateMachine_shifter;
  reg  stateMachine_validReg;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif

	initial begin		
  	sampler_samples_1			= 0;
  	sampler_samples_2			= 0;
  	sampler_samples_3			= 0;
  	sampler_samples_4			= 0;
  	sampler_value					= 0;	
  	sampler_tick					= 0;
  	bitTimer_counter			= 0;
  	bitTimer_tick					= 0;
  	bitCounter_value			= 0;
  	stateMachine_state		= 0;
  	stateMachine_parity		= 0;
  	stateMachine_shifter	= 0;
	  stateMachine_validReg	= 0;
	  `ifndef SYNTHESIS
	  	io_configFrame_stop_string		= 0;
	  	io_configFrame_parity_string	= 0;
	  	stateMachine_state_string			= 0;
	  `endif  
	end
	
  assign _zz_2_ = (sampler_tick && (! sampler_value));
  assign _zz_3_ = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_4_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_5_ = {2'd0, _zz_4_};
  assign _zz_6_ = ((((1'b0 || ((_zz_11_ && sampler_samples_1) && sampler_samples_2)) || (((_zz_12_ && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_7_ = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_8_ = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_9_ = (1'b1 && sampler_samples_1);
  assign _zz_10_ = 1'b1;
  assign _zz_11_ = (1'b1 && sampler_samples_0);
  assign _zz_12_ = 1'b1;
  BufferCC bufferCC_5_ (
    .io_initial(_zz_1_),
    .io_dataIn(io_rxd),
    .io_dataOut(bufferCC_5__io_dataOut),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  `ifndef SYNTHESIS
  always @( * ) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @( * ) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @( * ) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  assign _zz_1_ = 1'b0;
  assign sampler_synchroniser = bufferCC_5__io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ ( * ) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == (3'b000)))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick)begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick)begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_6_ || _zz_7_) || (_zz_8_ && sampler_samples_4)) || ((_zz_9_ && sampler_samples_2) && sampler_samples_4)) || (((_zz_10_ && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(_zz_2_)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_3_)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick)begin
            if((stateMachine_parity == sampler_value))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if((! sampler_value))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if((bitCounter_value == _zz_5_))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - (3'b001));
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + (3'b001));
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_2_)begin
          bitTimer_counter <= (3'b010);
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_3_)begin
            bitCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end

endmodule

module BufferCC_1_ (
      input   io_dataIn,
      output  io_dataOut,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_systemReset);
  reg  buffers_0;
  reg  buffers_1;
  
	initial begin
  	buffers_0	= 0;
  	buffers_1	= 0;
	end
	
  assign io_dataOut = buffers_1;
  always @ (posedge toplevel_io_axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule

module BufferCC_2_ (
      input  [7:0] io_dataIn,
      output [7:0] io_dataOut,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg [7:0] buffers_0;
  reg [7:0] buffers_1;
  
	initial begin
  	buffers_0	= 0;
  	buffers_1	= 0;
	end
	
  assign io_dataOut = buffers_1;
  always @ (posedge toplevel_io_axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule

module UartCtrl (
      input  [2:0] io_config_frame_dataLength,
      input  `UartStopType_defaultEncoding_type io_config_frame_stop,
      input  `UartParityType_defaultEncoding_type io_config_frame_parity,
      input  [19:0] io_config_clockDivider,
      input   io_write_valid,
      output  io_write_ready,
      input  [7:0] io_write_payload,
      output  io_read_valid,
      output [7:0] io_read_payload,
      output  io_uart_txd,
      input   io_uart_rxd,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  			tx_io_write_ready;
  wire  			tx_io_txd;
  wire  			rx_io_read_valid;
  wire [7:0] 	rx_io_read_payload;
  reg [19:0] 	clockDivider_counter;
  wire  			clockDivider_tick;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif
  
	initial begin
  	clockDivider_counter						= 0 ;
	  `ifndef SYNTHESIS  
	  	io_config_frame_stop_string		= 0 ;
	  	io_config_frame_parity_string	= 0 ;
	  `endif
	end
	
  UartCtrlTx tx (
    .io_configFrame_dataLength(io_config_frame_dataLength),
    .io_configFrame_stop(io_config_frame_stop),
    .io_configFrame_parity(io_config_frame_parity),
    .io_samplingTick(clockDivider_tick),
    .io_write_valid(io_write_valid),
    .io_write_ready(tx_io_write_ready),
    .io_write_payload(io_write_payload),
    .io_txd(tx_io_txd),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength(io_config_frame_dataLength),
    .io_configFrame_stop(io_config_frame_stop),
    .io_configFrame_parity(io_config_frame_parity),
    .io_samplingTick(clockDivider_tick),
    .io_read_valid(rx_io_read_valid),
    .io_read_payload(rx_io_read_payload),
    .io_rxd(io_uart_rxd),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  `ifndef SYNTHESIS
  always @( * ) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @( * ) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == (20'b00000000000000000000));
  assign io_write_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      clockDivider_counter <= (20'b00000000000000000000);
    end else begin
      clockDivider_counter <= (clockDivider_counter - (20'b00000000000000000001));
      if(clockDivider_tick)begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end

endmodule

module StreamFifo (
      input   io_push_valid,
      output  io_push_ready,
      input  [7:0] io_push_payload,
      output  io_pop_valid,
      input   io_pop_ready,
      output [7:0] io_pop_payload,
      input   io_flush,
      output [4:0] io_occupancy,
      output [4:0] io_availability,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  	[7:0] _zz_3_;
  wire 	[0:0] _zz_4_;
  wire 	[3:0] _zz_5_;
  wire 	[0:0] _zz_6_;
  wire 	[3:0] _zz_7_;
  wire 	[3:0] _zz_8_;
  wire  			_zz_9_;
  reg  				_zz_1_;
  reg  				logic_pushPtr_willIncrement			;
  reg  				logic_pushPtr_willClear					;
  reg 	[3:0] logic_pushPtr_valueNext					;
  reg 	[3:0] logic_pushPtr_value							;
  wire  			logic_pushPtr_willOverflowIfInc	;
  wire  			logic_pushPtr_willOverflow			;
  reg  				logic_popPtr_willIncrement			;
  reg  				logic_popPtr_willClear					;
  reg 	[3:0] logic_popPtr_valueNext					;
  reg 	[3:0] logic_popPtr_value							;
  wire  			logic_popPtr_willOverflowIfInc	;
  wire  			logic_popPtr_willOverflow				;
  wire  			logic_ptrMatch									;
  reg  				logic_risingOccupancy						;
  wire  			logic_pushing	;
  wire  			logic_popping	;
  wire  			logic_empty		;
  wire  			logic_full		;
  reg  				_zz_2_;
  wire 	[3:0] logic_ptrDif;
  reg 	[7:0] logic_ram [0:15];  
  
  integer i;
  initial begin  //RamInitial
  	for (i=0;i<16;i=i+1)  	logic_ram[i] <= 8'h0;
  end 
  
	initial begin  
  	_zz_3_	= 0;
  	_zz_1_	= 0;
  	logic_pushPtr_willIncrement	= 0;
  	logic_pushPtr_willClear			= 0;
  	logic_pushPtr_valueNext			= 0;
  	logic_pushPtr_value					= 0;
  	logic_popPtr_willIncrement	= 0;
  	logic_popPtr_willClear			= 0;
  	logic_popPtr_valueNext			= 0;
  	logic_popPtr_value					= 0;
  	logic_risingOccupancy				= 0;
  	_zz_2_	= 0 ;
	end
	
  
  assign _zz_4_ = logic_pushPtr_willIncrement;
  assign _zz_5_ = {3'd0, _zz_4_};
  assign _zz_6_ = logic_popPtr_willIncrement;
  assign _zz_7_ = {3'd0, _zz_6_};
  assign _zz_8_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_9_ = 1'b1;
  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_1_) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_9_) begin
      _zz_3_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ ( * ) begin
    _zz_1_ = 1'b0;
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      _zz_1_ = 1'b1;
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ ( * ) begin
    logic_pushPtr_willClear = 1'b0;
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == (4'b1111));
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ ( * ) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5_);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = (4'b0000);
    end
  end

  always @ ( * ) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == (4'b1111));
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ ( * ) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_7_);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = (4'b0000);
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2_ && (! logic_full))));
  assign io_pop_payload = _zz_3_;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_8_};
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      logic_pushPtr_value <= (4'b0000);
      logic_popPtr_value <= (4'b0000);
      logic_risingOccupancy <= 1'b0;
      _zz_2_ <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end

endmodule


//StreamFifo_1_ remplaced by StreamFifo

module Timer (
      input   io_tick,
      input   io_clear,
      input  [31:0] io_limit,
      output  io_full,
      output [31:0] io_value,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [0:0] _zz_1_;
  wire [31:0] _zz_2_;
  reg [31:0] counter;
  wire  limitHit;
  reg  inhibitFull;
  
	initial begin
  	counter			= 0;
  	inhibitFull	= 0;
	end
	
  assign _zz_1_ = (! limitHit);
  assign _zz_2_ = {31'd0, _zz_1_};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick)begin
        inhibitFull <= limitHit;
      end
      if(io_clear)begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(io_tick)begin
      counter <= (counter + _zz_2_);
    end
    if(io_clear)begin
      counter <= (32'b00000000000000000000000000000000);
    end
  end

endmodule

module Timer_1_ (
      input   io_tick,
      input   io_clear,
      input  [15:0] io_limit,
      output  io_full,
      output [15:0] io_value,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [0:0] _zz_1_;
  wire [15:0] _zz_2_;
  reg [15:0] counter;
  wire  limitHit;
  reg  inhibitFull;
  
	initial begin  
  	counter			= 0;
		inhibitFull = 0;
	end
	
  assign _zz_1_ = (! limitHit);
  assign _zz_2_ = {15'd0, _zz_1_};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick)begin
        inhibitFull <= limitHit;
      end
      if(io_clear)begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(io_tick)begin
      counter <= (counter + _zz_2_);
    end
    if(io_clear)begin
      counter <= (16'b0000000000000000);
    end
  end

endmodule

module InterruptCtrl (
      input  [7:0] io_inputs,
      input  [7:0] io_clears,
      input  [7:0] io_masks,
      output [7:0] io_pendings,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg [7:0] pendings;
  
	initial begin
		pendings = 0;
	end
	
  assign io_pendings = (pendings & io_masks);
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      pendings <= (8'b00000000);
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end

endmodule

module StreamFifoLowLatency (
      input   io_push_valid,
      output  io_push_ready,
      input   io_push_payload_error,
      input  [31:0] io_push_payload_inst,
      output reg  io_pop_valid,
      input   io_pop_ready,
      output reg  io_pop_payload_error,
      output reg [31:0] io_pop_payload_inst,
      input   io_flush,
      output [0:0] io_occupancy,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [0:0] _zz_5_;
  reg  _zz_1_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [32:0] _zz_2_;
  wire [32:0] _zz_3_;
  reg [32:0] _zz_4_;
  
	initial begin
  	_zz_1_	= 0;
  	_zz_4_	= 0;
  	pushPtr_willIncrement	= 0;
  	pushPtr_willClear			= 0;
  	popPtr_willIncrement	= 0;
  	popPtr_willClear			= 0;
  	risingOccupancy				= 0;
	end
	
  assign _zz_5_ = _zz_2_[0 : 0];
  always @ ( * ) begin
    _zz_1_ = 1'b0;
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ ( * ) begin
    pushPtr_willClear = 1'b0;
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
      popPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ ( * ) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ ( * ) begin
    if((! empty))begin
      io_pop_valid = 1'b1;
      io_pop_payload_error = _zz_5_[0];
      io_pop_payload_inst = _zz_2_[32 : 1];
    end else begin
      io_pop_valid = io_push_valid;
      io_pop_payload_error = io_push_payload_error;
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign _zz_2_ = _zz_3_;
  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_3_ = _zz_4_;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_1_)begin
      _zz_4_ <= {io_push_payload_inst,io_push_payload_error};
    end
  end

endmodule

module FlowCCByToggle (
      input   io_input_valid,
      input   io_input_payload_last,
      input  [0:0] io_input_payload_fragment,
      output  io_output_valid,
      output  io_output_payload_last,
      output [0:0] io_output_payload_fragment,
      input   _zz_1_,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_systemReset);
  wire  bufferCC_5__io_dataOut;
  wire  outHitSignal;
  reg  inputArea_target = 0;
  reg  inputArea_data_last;
  reg [0:0] inputArea_data_fragment;
  wire  outputArea_target;
  reg  outputArea_hit;
  wire  outputArea_flow_valid;
  wire  outputArea_flow_payload_last;
  wire [0:0] outputArea_flow_payload_fragment;
  reg  outputArea_flow_m2sPipe_valid;
  reg  outputArea_flow_m2sPipe_payload_last;
  reg [0:0] outputArea_flow_m2sPipe_payload_fragment;
  
	initial begin
  	inputArea_target 		= 0;
  	inputArea_data_last	= 0;
  	inputArea_data_fragment = 0;
  	outputArea_hit					= 0;
  	outputArea_flow_m2sPipe_valid							= 0;
  	outputArea_flow_m2sPipe_payload_last			= 0;
  	outputArea_flow_m2sPipe_payload_fragment	= 0;
	end
	
  BufferCC_1_ bufferCC_5_ (
    .io_dataIn(inputArea_target),
    .io_dataOut(bufferCC_5__io_dataOut),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_systemReset(toplevel_resetCtrl_systemReset)
  );
  assign outputArea_target = bufferCC_5__io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @ (posedge _zz_1_) begin
    if(io_input_valid)begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid)begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_systemReset) begin
    if (toplevel_resetCtrl_systemReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end

endmodule

module Axi4SharedErrorSlave (
      input   io_axi_arw_valid,
      output  io_axi_arw_ready,
      input  [31:0] io_axi_arw_payload_addr,
      input  [2:0] io_axi_arw_payload_size,
      input  [3:0] io_axi_arw_payload_cache,
      input  [2:0] io_axi_arw_payload_prot,
      input   io_axi_arw_payload_write,
      input   io_axi_w_valid,
      output  io_axi_w_ready,
      input  [31:0] io_axi_w_payload_data,
      input  [3:0] io_axi_w_payload_strb,
      input   io_axi_w_payload_last,
      output  io_axi_b_valid,
      input   io_axi_b_ready,
      output [1:0] io_axi_b_payload_resp,
      output  io_axi_r_valid,
      input   io_axi_r_ready,
      output [31:0] io_axi_r_payload_data,
      output [1:0] io_axi_r_payload_resp,
      output  io_axi_r_payload_last,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_1_;
  reg  consumeData;
  reg  sendReadRsp;
  reg  sendWriteRsp;
  reg [7:0] remaining;
  wire  remainingZero;
  
	initial begin
  	consumeData		= 0;
  	sendReadRsp		= 0;
  	sendWriteRsp	= 0;
  	remaining   	= 0;
	end
	
  assign _zz_1_ = (io_axi_arw_valid && io_axi_arw_ready);
  assign remainingZero = (remaining == (8'b00000000));
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_w_ready = consumeData;
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = (2'b11);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = (2'b11);
  assign io_axi_r_payload_last = remainingZero;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(_zz_1_)begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(((io_axi_w_valid && io_axi_w_ready) && io_axi_w_payload_last))begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if((io_axi_b_valid && io_axi_b_ready))begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp)begin
        if(io_axi_r_ready)begin
          if(remainingZero)begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_1_)begin
      remaining <= (8'b00000000);
    end
    if(sendReadRsp)begin
      if(io_axi_r_ready)begin
        remaining <= (remaining - (8'b00000001));
      end
    end
  end

endmodule

module StreamArbiter (
      input   io_inputs_0_valid,
      output  io_inputs_0_ready,
      input  [14:0] io_inputs_0_payload_addr,
      input  [3:0] io_inputs_0_payload_id,
      input  [7:0] io_inputs_0_payload_len,
      input  [2:0] io_inputs_0_payload_size,
      input  [1:0] io_inputs_0_payload_burst,
      input   io_inputs_0_payload_write,
      output  io_output_valid,
      input   io_output_ready,
      output [14:0] io_output_payload_addr,
      output [3:0] io_output_payload_id,
      output [7:0] io_output_payload_len,
      output [2:0] io_output_payload_size,
      output [1:0] io_output_payload_burst,
      output  io_output_payload_write,
      output [0:0] io_chosenOH,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [1:0] _zz_4_;
  wire [0:0] _zz_5_;
  wire [1:0] _zz_6_;
  wire [0:0] _zz_7_;
  wire [0:0] _zz_8_;
  reg  locked;
  wire  maskProposal_0;
  reg  maskLocked_0;
  wire  maskRouted_0;
  wire [0:0] _zz_1_;
  wire [1:0] _zz_2_;
  wire [1:0] _zz_3_;
  
	initial begin
  	locked			 = 0;
  	maskLocked_0 = 0;
	end
	
  assign _zz_4_ = (_zz_2_ - _zz_6_);
  assign _zz_5_ = maskLocked_0;
  assign _zz_6_ = {1'd0, _zz_5_};
  assign _zz_7_ = _zz_8_[0 : 0];
  assign _zz_8_ = (_zz_3_[1 : 1] | _zz_3_[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_1_ = io_inputs_0_valid;
  assign _zz_2_ = {_zz_1_,_zz_1_};
  assign _zz_3_ = (_zz_2_ & (~ _zz_4_));
  assign maskProposal_0 = _zz_7_[0];
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end

endmodule

module StreamFork (
      input   io_input_valid,
      output reg  io_input_ready,
      input  [14:0] io_input_payload_addr,
      input  [3:0] io_input_payload_id,
      input  [7:0] io_input_payload_len,
      input  [2:0] io_input_payload_size,
      input  [1:0] io_input_payload_burst,
      input   io_input_payload_write,
      output  io_outputs_0_valid,
      input   io_outputs_0_ready,
      output [14:0] io_outputs_0_payload_addr,
      output [3:0] io_outputs_0_payload_id,
      output [7:0] io_outputs_0_payload_len,
      output [2:0] io_outputs_0_payload_size,
      output [1:0] io_outputs_0_payload_burst,
      output  io_outputs_0_payload_write,
      output  io_outputs_1_valid,
      input   io_outputs_1_ready,
      output [14:0] io_outputs_1_payload_addr,
      output [3:0] io_outputs_1_payload_id,
      output [7:0] io_outputs_1_payload_len,
      output [2:0] io_outputs_1_payload_size,
      output [1:0] io_outputs_1_payload_burst,
      output  io_outputs_1_payload_write,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  linkEnable_0;
  reg  linkEnable_1;
  
	initial begin
		linkEnable_0	= 0;
		linkEnable_1	= 0;
	end
	
  always @ ( * ) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && linkEnable_0))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && linkEnable_1))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && linkEnable_0);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_1_valid = (io_input_valid && linkEnable_1);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      linkEnable_0 <= 1'b1;
      linkEnable_1 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        linkEnable_0 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        linkEnable_1 <= 1'b0;
      end
      if(io_input_ready)begin
        linkEnable_0 <= 1'b1;
        linkEnable_1 <= 1'b1;
      end
    end
  end

endmodule

module StreamFifoLowLatency_1_ (
      input   io_push_valid,
      output  io_push_ready,
      output reg  io_pop_valid,
      input   io_pop_ready,
      input   io_flush,
      output [2:0] io_occupancy,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [0:0] _zz_1_;
  wire [1:0] _zz_2_;
  wire [0:0] _zz_3_;
  wire [1:0] _zz_4_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  reg [1:0] pushPtr_valueNext;
  reg [1:0] pushPtr_value;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  reg [1:0] popPtr_valueNext;
  reg [1:0] popPtr_value;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [1:0] ptrDif;
  
	initial begin		
		pushPtr_willIncrement	= 0;
		pushPtr_willClear			= 0;
		pushPtr_valueNext			= 0;
		pushPtr_value					= 0;
		popPtr_willIncrement	= 0;
		popPtr_willClear			= 0;
		popPtr_valueNext			= 0;
		popPtr_value					= 0;
		risingOccupancy				= 0;
	end
	
  assign _zz_1_ = pushPtr_willIncrement;
  assign _zz_2_ = {1'd0, _zz_1_};
  assign _zz_3_ = popPtr_willIncrement;
  assign _zz_4_ = {1'd0, _zz_3_};
  always @ ( * ) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ ( * ) begin
    pushPtr_willClear = 1'b0;
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
      popPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == (2'b11));
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ ( * ) begin
    pushPtr_valueNext = (pushPtr_value + _zz_2_);
    if(pushPtr_willClear)begin
      pushPtr_valueNext = (2'b00);
    end
  end

  always @ ( * ) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == (2'b11));
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @ ( * ) begin
    popPtr_valueNext = (popPtr_value + _zz_4_);
    if(popPtr_willClear)begin
      popPtr_valueNext = (2'b00);
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ ( * ) begin
    if((! empty))begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      pushPtr_value <= (2'b00);
      popPtr_value <= (2'b00);
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

endmodule

module StreamArbiter_1_ (
      input   io_inputs_0_valid,
      output  io_inputs_0_ready,
      input  [19:0] io_inputs_0_payload_addr,
      input  [3:0] io_inputs_0_payload_id,
      input  [7:0] io_inputs_0_payload_len,
      input  [2:0] io_inputs_0_payload_size,
      input  [1:0] io_inputs_0_payload_burst,
      input   io_inputs_0_payload_write,
      output  io_output_valid,
      input   io_output_ready,
      output [19:0] io_output_payload_addr,
      output [3:0] io_output_payload_id,
      output [7:0] io_output_payload_len,
      output [2:0] io_output_payload_size,
      output [1:0] io_output_payload_burst,
      output  io_output_payload_write,
      output [0:0] io_chosenOH,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [1:0] _zz_4_;
  wire [0:0] _zz_5_;
  wire [1:0] _zz_6_;
  wire [0:0] _zz_7_;
  wire [0:0] _zz_8_;
  reg  locked;
  wire  maskProposal_0;
  reg  maskLocked_0;
  wire  maskRouted_0;
  wire [0:0] _zz_1_;
  wire [1:0] _zz_2_;
  wire [1:0] _zz_3_;
  
	initial begin		
 		locked			 = 0;
 		maskLocked_0 = 0;
	end
	
  assign _zz_4_ = (_zz_2_ - _zz_6_);
  assign _zz_5_ = maskLocked_0;
  assign _zz_6_ = {1'd0, _zz_5_};
  assign _zz_7_ = _zz_8_[0 : 0];
  assign _zz_8_ = (_zz_3_[1 : 1] | _zz_3_[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_1_ = io_inputs_0_valid;
  assign _zz_2_ = {_zz_1_,_zz_1_};
  assign _zz_3_ = (_zz_2_ & (~ _zz_4_));
  assign maskProposal_0 = _zz_7_[0];
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end

endmodule

module StreamFork_1_ (
      input   io_input_valid,
      output reg  io_input_ready,
      input  [19:0] io_input_payload_addr,
      input  [3:0] io_input_payload_id,
      input  [7:0] io_input_payload_len,
      input  [2:0] io_input_payload_size,
      input  [1:0] io_input_payload_burst,
      input   io_input_payload_write,
      output  io_outputs_0_valid,
      input   io_outputs_0_ready,
      output [19:0] io_outputs_0_payload_addr,
      output [3:0] io_outputs_0_payload_id,
      output [7:0] io_outputs_0_payload_len,
      output [2:0] io_outputs_0_payload_size,
      output [1:0] io_outputs_0_payload_burst,
      output  io_outputs_0_payload_write,
      output  io_outputs_1_valid,
      input   io_outputs_1_ready,
      output [19:0] io_outputs_1_payload_addr,
      output [3:0] io_outputs_1_payload_id,
      output [7:0] io_outputs_1_payload_len,
      output [2:0] io_outputs_1_payload_size,
      output [1:0] io_outputs_1_payload_burst,
      output  io_outputs_1_payload_write,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  linkEnable_0;
  reg  linkEnable_1;
  
	initial begin
		linkEnable_0	= 0; 
		linkEnable_1	= 0; 
	end
	
  always @ ( * ) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && linkEnable_0))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && linkEnable_1))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && linkEnable_0);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_1_valid = (io_input_valid && linkEnable_1);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      linkEnable_0 <= 1'b1;
      linkEnable_1 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        linkEnable_0 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        linkEnable_1 <= 1'b0;
      end
      if(io_input_ready)begin
        linkEnable_0 <= 1'b1;
        linkEnable_1 <= 1'b1;
      end
    end
  end

endmodule


//StreamFifoLowLatency_2_ remplaced by StreamFifoLowLatency_1_

module StreamArbiter_2_ (
      input   io_inputs_0_valid,
      output  io_inputs_0_ready,
      input  [31:0] io_inputs_0_payload_addr,
      input  [7:0] io_inputs_0_payload_id,
      input  [3:0] io_inputs_0_payload_region,
      input  [7:0] io_inputs_0_payload_len,
      input  [2:0] io_inputs_0_payload_size,
      input  [1:0] io_inputs_0_payload_burst,
      input  [0:0] io_inputs_0_payload_lock,
      input  [3:0] io_inputs_0_payload_cache,
      input  [3:0] io_inputs_0_payload_qos,
      input  [2:0] io_inputs_0_payload_prot,
      output  io_output_valid,
      input   io_output_ready,
      output [31:0] io_output_payload_addr,
      output [7:0] io_output_payload_id,
      output [3:0] io_output_payload_region,
      output [7:0] io_output_payload_len,
      output [2:0] io_output_payload_size,
      output [1:0] io_output_payload_burst,
      output [0:0] io_output_payload_lock,
      output [3:0] io_output_payload_cache,
      output [3:0] io_output_payload_qos,
      output [2:0] io_output_payload_prot,
      output [0:0] io_chosenOH,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [1:0] _zz_4_;
  wire [0:0] _zz_5_;
  wire [1:0] _zz_6_;
  wire [0:0] _zz_7_;
  wire [0:0] _zz_8_;
  reg  locked;
  wire  maskProposal_0;
  reg  maskLocked_0;
  wire  maskRouted_0;
  wire [0:0] _zz_1_;
  wire [1:0] _zz_2_;
  wire [1:0] _zz_3_;
  
	initial begin		
  	locked				= 0;
  	maskLocked_0	= 0;
	end
	
  assign _zz_4_ = (_zz_2_ - _zz_6_);
  assign _zz_5_ = maskLocked_0;
  assign _zz_6_ = {1'd0, _zz_5_};
  assign _zz_7_ = _zz_8_[0 : 0];
  assign _zz_8_ = (_zz_3_[1 : 1] | _zz_3_[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_1_ = io_inputs_0_valid;
  assign _zz_2_ = {_zz_1_,_zz_1_};
  assign _zz_3_ = (_zz_2_ & (~ _zz_4_));
  assign maskProposal_0 = _zz_7_[0];
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_region = io_inputs_0_payload_region;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_lock = io_inputs_0_payload_lock;
  assign io_output_payload_cache = io_inputs_0_payload_cache;
  assign io_output_payload_qos = io_inputs_0_payload_qos;
  assign io_output_payload_prot = io_inputs_0_payload_prot;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end

endmodule


//StreamArbiter_3_ remplaced by StreamArbiter_2_

module StreamFork_2_ (
      input   io_input_valid,
      output reg  io_input_ready,
      input  [31:0] io_input_payload_addr,
      input  [7:0] io_input_payload_id,
      input  [3:0] io_input_payload_region,
      input  [7:0] io_input_payload_len,
      input  [2:0] io_input_payload_size,
      input  [1:0] io_input_payload_burst,
      input  [0:0] io_input_payload_lock,
      input  [3:0] io_input_payload_cache,
      input  [3:0] io_input_payload_qos,
      input  [2:0] io_input_payload_prot,
      output  io_outputs_0_valid,
      input   io_outputs_0_ready,
      output [31:0] io_outputs_0_payload_addr,
      output [7:0] io_outputs_0_payload_id,
      output [3:0] io_outputs_0_payload_region,
      output [7:0] io_outputs_0_payload_len,
      output [2:0] io_outputs_0_payload_size,
      output [1:0] io_outputs_0_payload_burst,
      output [0:0] io_outputs_0_payload_lock,
      output [3:0] io_outputs_0_payload_cache,
      output [3:0] io_outputs_0_payload_qos,
      output [2:0] io_outputs_0_payload_prot,
      output  io_outputs_1_valid,
      input   io_outputs_1_ready,
      output [31:0] io_outputs_1_payload_addr,
      output [7:0] io_outputs_1_payload_id,
      output [3:0] io_outputs_1_payload_region,
      output [7:0] io_outputs_1_payload_len,
      output [2:0] io_outputs_1_payload_size,
      output [1:0] io_outputs_1_payload_burst,
      output [0:0] io_outputs_1_payload_lock,
      output [3:0] io_outputs_1_payload_cache,
      output [3:0] io_outputs_1_payload_qos,
      output [2:0] io_outputs_1_payload_prot,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  linkEnable_0;
  reg  linkEnable_1;
  
	initial begin
		linkEnable_0	= 0;
		linkEnable_1	= 0;
	end
	
  always @ ( * ) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && linkEnable_0))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && linkEnable_1))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && linkEnable_0);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_region = io_input_payload_region;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_lock = io_input_payload_lock;
  assign io_outputs_0_payload_cache = io_input_payload_cache;
  assign io_outputs_0_payload_qos = io_input_payload_qos;
  assign io_outputs_0_payload_prot = io_input_payload_prot;
  assign io_outputs_1_valid = (io_input_valid && linkEnable_1);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_region = io_input_payload_region;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_lock = io_input_payload_lock;
  assign io_outputs_1_payload_cache = io_input_payload_cache;
  assign io_outputs_1_payload_qos = io_input_payload_qos;
  assign io_outputs_1_payload_prot = io_input_payload_prot;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      linkEnable_0 <= 1'b1;
      linkEnable_1 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        linkEnable_0 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        linkEnable_1 <= 1'b0;
      end
      if(io_input_ready)begin
        linkEnable_0 <= 1'b1;
        linkEnable_1 <= 1'b1;
      end
    end
  end

endmodule


//StreamFifoLowLatency_3_ remplaced by StreamFifoLowLatency_1_

module BufferCC_3_ (
      input   io_dataIn,
      output  io_dataOut,
      input   toplevel_io_axiClk);
  reg  buffers_0;
  reg  buffers_1;
  
	initial begin
		buffers_0 = 0; 
		buffers_1 = 0; 
	end
	
  assign io_dataOut = buffers_1;
  always @ (posedge toplevel_io_axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule


//BufferCC_4_ remplaced by BufferCC_3_

module Axi4SharedOnChipRamMultiPort (
      input   io_axis_0_arw_valid,
      output reg  io_axis_0_arw_ready,
      input  [14:0] io_axis_0_arw_payload_addr,
      input  [3:0] io_axis_0_arw_payload_id,
      input  [7:0] io_axis_0_arw_payload_len,
      input  [2:0] io_axis_0_arw_payload_size,
      input  [1:0] io_axis_0_arw_payload_burst,
      input   io_axis_0_arw_payload_write,
      input   io_axis_0_w_valid,
      output  io_axis_0_w_ready,
      input  [31:0] io_axis_0_w_payload_data,
      input  [3:0] io_axis_0_w_payload_strb,
      input   io_axis_0_w_payload_last,
      output  io_axis_0_b_valid,
      input   io_axis_0_b_ready,
      output [3:0] io_axis_0_b_payload_id,
      output [1:0] io_axis_0_b_payload_resp,
      output  io_axis_0_r_valid,
      input   io_axis_0_r_ready,
      output [31:0] io_axis_0_r_payload_data,
      output [3:0] io_axis_0_r_payload_id,
      output [1:0] io_axis_0_r_payload_resp,
      output  io_axis_0_r_payload_last,
      input   io_axis_1_arw_valid,
      output reg  io_axis_1_arw_ready,
      input  [14:0] io_axis_1_arw_payload_addr,
      input  [3:0] io_axis_1_arw_payload_id,
      input  [7:0] io_axis_1_arw_payload_len,
      input  [2:0] io_axis_1_arw_payload_size,
      input  [1:0] io_axis_1_arw_payload_burst,
      input   io_axis_1_arw_payload_write,
      input   io_axis_1_w_valid,
      output  io_axis_1_w_ready,
      input  [31:0] io_axis_1_w_payload_data,
      input  [3:0] io_axis_1_w_payload_strb,
      input   io_axis_1_w_payload_last,
      output  io_axis_1_b_valid,
      input   io_axis_1_b_ready,
      output [3:0] io_axis_1_b_payload_id,
      output [1:0] io_axis_1_b_payload_resp,
      output  io_axis_1_r_valid,
      input   io_axis_1_r_ready,
      output [31:0] io_axis_1_r_payload_data,
      output [3:0] io_axis_1_r_payload_id,
      output [1:0] io_axis_1_r_payload_resp,
      output  io_axis_1_r_payload_last,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg [31:0] _zz_29_;
  reg [31:0] _zz_30_;
  reg [11:0] _zz_31_;
  reg [11:0] _zz_32_;
  wire  _zz_33_;
  wire  _zz_34_;
  wire [1:0] _zz_35_;
  wire [11:0] _zz_36_;
  wire [11:0] _zz_37_;
  wire [11:0] _zz_38_;
  wire [2:0] _zz_39_;
  wire [2:0] _zz_40_;
  wire [1:0] _zz_41_;
  wire [11:0] _zz_42_;
  wire [11:0] _zz_43_;
  wire [11:0] _zz_44_;
  wire [2:0] _zz_45_;
  wire [2:0] _zz_46_;
  wire  _zz_47_;
  wire  _zz_48_;
  wire  _zz_49_;
  wire  _zz_50_;
  reg  unburstify_result_valid;
  wire  unburstify_result_ready;
  reg  unburstify_result_payload_last;
  reg [14:0] unburstify_result_payload_fragment_addr;
  reg [3:0] unburstify_result_payload_fragment_id;
  reg [2:0] unburstify_result_payload_fragment_size;
  reg [1:0] unburstify_result_payload_fragment_burst;
  reg  unburstify_result_payload_fragment_write;
//  wire  unburstify_doResult;
  reg  unburstify_buffer_valid;
  reg [7:0] unburstify_buffer_len;
  reg [7:0] unburstify_buffer_beat;
  reg [14:0] unburstify_buffer_transaction_addr;
  reg [3:0] unburstify_buffer_transaction_id;
  reg [2:0] unburstify_buffer_transaction_size;
  reg [1:0] unburstify_buffer_transaction_burst;
  reg  unburstify_buffer_transaction_write;
  wire  unburstify_buffer_last;
  wire [1:0] Axi4Incr_validSize;
  reg [14:0] unburstify_buffer_result;
  wire [2:0] Axi4Incr_highCat;
  wire [2:0] Axi4Incr_sizeValue;
  wire [11:0] Axi4Incr_alignMask;
  wire [11:0] Axi4Incr_base;
  wire [11:0] Axi4Incr_baseIncr;
  reg [1:0] _zz_1_;
  wire [2:0] Axi4Incr_wrapCase;
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire [12:0] _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire [3:0] _zz_9_;
  wire  _zz_10_;
  reg  _zz_11_;
  reg  _zz_12_;
  reg [3:0] _zz_13_;
  reg  _zz_14_;
  reg  unburstify_result_valid_1_;
  wire  unburstify_result_ready_1_;
  reg  unburstify_result_payload_last_1_;
  reg [14:0] unburstify_result_payload_fragment_addr_1_;
  reg [3:0] unburstify_result_payload_fragment_id_1_;
  reg [2:0] unburstify_result_payload_fragment_size_1_;
  reg [1:0] unburstify_result_payload_fragment_burst_1_;
  reg  unburstify_result_payload_fragment_write_1_;
//  wire  unburstify_doResult_1_;
  reg  unburstify_buffer_valid_1_;
  reg [7:0] unburstify_buffer_len_1_;
  reg [7:0] unburstify_buffer_beat_1_;
  reg [14:0] unburstify_buffer_transaction_addr_1_;
  reg [3:0] unburstify_buffer_transaction_id_1_;
  reg [2:0] unburstify_buffer_transaction_size_1_;
  reg [1:0] unburstify_buffer_transaction_burst_1_;
  reg  unburstify_buffer_transaction_write_1_;
  wire  unburstify_buffer_last_1_;
  wire [1:0] Axi4Incr_validSize_1_;
  reg [14:0] unburstify_buffer_result_1_;
  wire [2:0] Axi4Incr_highCat_1_;
  wire [2:0] Axi4Incr_sizeValue_1_;
  wire [11:0] Axi4Incr_alignMask_1_;
  wire [11:0] Axi4Incr_base_1_;
  wire [11:0] Axi4Incr_baseIncr_1_;
  reg [1:0] _zz_15_;
  wire [2:0] Axi4Incr_wrapCase_1_;
  wire  _zz_16_;
  wire  _zz_17_;
  wire  _zz_18_;
  wire  _zz_19_;
  wire [12:0] _zz_20_;
  wire  _zz_21_;
  wire  _zz_22_;
  wire [3:0] _zz_23_;
  wire  _zz_24_;
  reg  _zz_25_;
  reg  _zz_26_;
  reg [3:0] _zz_27_;
  reg  _zz_28_;
  reg [7:0] ram_symbol0 [0:8191];
  reg [7:0] ram_symbol1 [0:8191];
  reg [7:0] ram_symbol2 [0:8191];
  reg [7:0] ram_symbol3 [0:8191];
  reg [7:0] _zz_51_;
  reg [7:0] _zz_52_;
  reg [7:0] _zz_53_;
  reg [7:0] _zz_54_;
  reg [7:0] _zz_55_;
  reg [7:0] _zz_56_;
  reg [7:0] _zz_57_;
  reg [7:0] _zz_58_;
  
  
  
	initial begin
  	io_axis_0_arw_ready	= 0;
  	io_axis_1_arw_ready	= 0;
  	_zz_1_	= 0;
  	_zz_11_	= 0;
  	_zz_12_	= 0;
  	_zz_13_	= 0;
  	_zz_14_	= 0;
  	_zz_15_	= 0;
  	_zz_25_	= 0;
  	_zz_26_	= 0;
  	_zz_27_	= 0;
  	_zz_28_	= 0;
  	_zz_29_	= 0;
  	_zz_30_	= 0;
  	_zz_31_	= 0;
  	_zz_32_	= 0;
  	_zz_51_	= 0;
  	_zz_52_	= 0;
  	_zz_53_	= 0;
  	_zz_54_	= 0;
  	_zz_55_	= 0;
  	_zz_56_	= 0;
  	_zz_57_	= 0;
  	_zz_58_	= 0;
  	unburstify_result_valid									 = 0;
  	unburstify_result_payload_last					 = 0;
  	unburstify_result_payload_fragment_addr	 = 0;
  	unburstify_result_payload_fragment_id		 = 0;
  	unburstify_result_payload_fragment_size	 = 0;
  	unburstify_result_payload_fragment_burst = 0;
  	unburstify_result_payload_fragment_write = 0;
  	unburstify_buffer_valid							= 0;
  	unburstify_buffer_len								= 0;
  	unburstify_buffer_beat							= 0;
  	unburstify_buffer_transaction_addr	= 0;
  	unburstify_buffer_transaction_id		= 0;
  	unburstify_buffer_transaction_size	= 0;
  	unburstify_buffer_transaction_burst	= 0;
  	unburstify_buffer_transaction_write	= 0;
  	unburstify_buffer_result						= 0;
  	unburstify_result_valid_1_									= 0;
  	unburstify_result_payload_last_1_						= 0;
  	unburstify_result_payload_fragment_addr_1_	= 0;
  	unburstify_result_payload_fragment_id_1_		= 0;
  	unburstify_result_payload_fragment_size_1_	= 0;
  	unburstify_result_payload_fragment_burst_1_	= 0;
  	unburstify_result_payload_fragment_write_1_	= 0;
  	unburstify_buffer_valid_1_							=0;
  	unburstify_buffer_len_1_								=0;
  	unburstify_buffer_beat_1_								=0;
  	unburstify_buffer_transaction_addr_1_		=0;
  	unburstify_buffer_transaction_id_1_			=0;
  	unburstify_buffer_transaction_size_1_		=0;
  	unburstify_buffer_transaction_burst_1_	=0;
  	unburstify_buffer_transaction_write_1_	=0;
  	unburstify_buffer_result_1_							=0;  
	end
	
  assign _zz_33_ = (io_axis_0_arw_payload_len == (8'b00000000));
  assign _zz_34_ = (io_axis_1_arw_payload_len == (8'b00000000));
  assign _zz_35_ = {((2'b01) < Axi4Incr_validSize),((2'b00) < Axi4Incr_validSize)};
  assign _zz_36_ = unburstify_buffer_transaction_addr[11 : 0];
  assign _zz_37_ = _zz_36_;
  assign _zz_38_ = {9'd0, Axi4Incr_sizeValue};
  assign _zz_39_ = {1'd0, Axi4Incr_validSize};
  assign _zz_40_ = {1'd0, _zz_1_};
  assign _zz_41_ = {((2'b01) < Axi4Incr_validSize_1_),((2'b00) < Axi4Incr_validSize_1_)};
  assign _zz_42_ = unburstify_buffer_transaction_addr_1_[11 : 0];
  assign _zz_43_ = _zz_42_;
  assign _zz_44_ = {9'd0, Axi4Incr_sizeValue_1_};
  assign _zz_45_ = {1'd0, Axi4Incr_validSize_1_};
  assign _zz_46_ = {1'd0, _zz_15_};
  assign _zz_47_ = ((_zz_3_ && _zz_4_) && _zz_5_);
  assign _zz_48_ = 1'b1;
  assign _zz_49_ = ((_zz_17_ && _zz_18_) && _zz_19_);
  assign _zz_50_ = 1'b1;
  
`ifdef Simulation
  integer i;
	reg [7:0]	SoftwareRam0;
	reg [7:0]	SoftwareRam1;
	reg [7:0]	SoftwareRam2;
	reg [7:0]	SoftwareRam3;
	
  integer SoftwareBinFile;
  integer Temp;
  
  initial 
  begin
		SoftwareBinFile=$fopen(`SoftBinFile,"rb");
		
		for(i=0;i<8192;i=i+1)
		begin
			if ($feof(SoftwareBinFile)) SoftwareRam0 = 8'h0 ; else Temp = $fscanf(SoftwareBinFile, "%c", SoftwareRam0); 
			if ($feof(SoftwareBinFile)) SoftwareRam1 = 8'h0 ; else Temp = $fscanf(SoftwareBinFile, "%c", SoftwareRam1); 
			if ($feof(SoftwareBinFile)) SoftwareRam2 = 8'h0 ; else Temp = $fscanf(SoftwareBinFile, "%c", SoftwareRam2); 
			if ($feof(SoftwareBinFile)) SoftwareRam3 = 8'h0 ; else Temp = $fscanf(SoftwareBinFile, "%c", SoftwareRam3); 
			ram_symbol0[i] <= SoftwareRam0;
			ram_symbol1[i] <= SoftwareRam1;
			ram_symbol2[i] <= SoftwareRam2;
			ram_symbol3[i] <= SoftwareRam3;				
		end
		  
		$fclose(SoftwareBinFile);                
  end
  
`else

  initial begin
    $readmemh( `SoftHexFile0 ,ram_symbol0);
    $readmemh( `SoftHexFile1 ,ram_symbol1);
    $readmemh( `SoftHexFile2 ,ram_symbol2);
    $readmemh( `SoftHexFile3 ,ram_symbol3);
  end
  
`endif

	
	
    
  always @ ( * ) begin
    _zz_29_ = {_zz_54_, _zz_53_, _zz_52_, _zz_51_};
  end
  always @ ( * ) begin
    _zz_30_ = {_zz_58_, _zz_57_, _zz_56_, _zz_55_};
  end
  always @ (posedge toplevel_io_axiClk) begin
    if(io_axis_0_w_payload_strb[0] && _zz_47_) begin
      ram_symbol0[_zz_6_] <= io_axis_0_w_payload_data[7 : 0];
    end
    if(io_axis_0_w_payload_strb[1] && _zz_47_) begin
      ram_symbol1[_zz_6_] <= io_axis_0_w_payload_data[15 : 8];
    end
    if(io_axis_0_w_payload_strb[2] && _zz_47_) begin
      ram_symbol2[_zz_6_] <= io_axis_0_w_payload_data[23 : 16];
    end
    if(io_axis_0_w_payload_strb[3] && _zz_47_) begin
      ram_symbol3[_zz_6_] <= io_axis_0_w_payload_data[31 : 24];
    end
    if(io_axis_1_w_payload_strb[0] && _zz_49_) begin
      ram_symbol0[_zz_20_] <= io_axis_1_w_payload_data[7 : 0];
    end
    if(io_axis_1_w_payload_strb[1] && _zz_49_) begin
      ram_symbol1[_zz_20_] <= io_axis_1_w_payload_data[15 : 8];
    end
    if(io_axis_1_w_payload_strb[2] && _zz_49_) begin
      ram_symbol2[_zz_20_] <= io_axis_1_w_payload_data[23 : 16];
    end
    if(io_axis_1_w_payload_strb[3] && _zz_49_) begin
      ram_symbol3[_zz_20_] <= io_axis_1_w_payload_data[31 : 24];
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_48_) begin
      _zz_51_ <= ram_symbol0[_zz_6_];
      _zz_52_ <= ram_symbol1[_zz_6_];
      _zz_53_ <= ram_symbol2[_zz_6_];
      _zz_54_ <= ram_symbol3[_zz_6_];
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_50_) begin
      _zz_55_ <= ram_symbol0[_zz_20_];
      _zz_56_ <= ram_symbol1[_zz_20_];
      _zz_57_ <= ram_symbol2[_zz_20_];
      _zz_58_ <= ram_symbol3[_zz_20_];
    end
  end

  always @( * ) begin
    case(Axi4Incr_wrapCase)
      3'b000 : begin
        _zz_31_ = {Axi4Incr_base[11 : 1],Axi4Incr_baseIncr[0 : 0]};
      end
      3'b001 : begin
        _zz_31_ = {Axi4Incr_base[11 : 2],Axi4Incr_baseIncr[1 : 0]};
      end
      3'b010 : begin
        _zz_31_ = {Axi4Incr_base[11 : 3],Axi4Incr_baseIncr[2 : 0]};
      end
      3'b011 : begin
        _zz_31_ = {Axi4Incr_base[11 : 4],Axi4Incr_baseIncr[3 : 0]};
      end
      3'b100 : begin
        _zz_31_ = {Axi4Incr_base[11 : 5],Axi4Incr_baseIncr[4 : 0]};
      end
      default : begin
        _zz_31_ = {Axi4Incr_base[11 : 6],Axi4Incr_baseIncr[5 : 0]};
      end
    endcase
  end

  always @( * ) begin
    case(Axi4Incr_wrapCase_1_)
      3'b000 : begin
        _zz_32_ = {Axi4Incr_base_1_[11 : 1],Axi4Incr_baseIncr_1_[0 : 0]};
      end
      3'b001 : begin
        _zz_32_ = {Axi4Incr_base_1_[11 : 2],Axi4Incr_baseIncr_1_[1 : 0]};
      end
      3'b010 : begin
        _zz_32_ = {Axi4Incr_base_1_[11 : 3],Axi4Incr_baseIncr_1_[2 : 0]};
      end
      3'b011 : begin
        _zz_32_ = {Axi4Incr_base_1_[11 : 4],Axi4Incr_baseIncr_1_[3 : 0]};
      end
      3'b100 : begin
        _zz_32_ = {Axi4Incr_base_1_[11 : 5],Axi4Incr_baseIncr_1_[4 : 0]};
      end
      default : begin
        _zz_32_ = {Axi4Incr_base_1_[11 : 6],Axi4Incr_baseIncr_1_[5 : 0]};
      end
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == (8'b00000001));
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[14 : 12];
  assign Axi4Incr_sizeValue = {((2'b10) == Axi4Incr_validSize),{((2'b01) == Axi4Incr_validSize),((2'b00) == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_35_};
  assign Axi4Incr_base = (_zz_37_ & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_38_);
  always @ ( * ) begin
    if((((unburstify_buffer_len & (8'b00001000)) == (8'b00001000)))) begin
        _zz_1_ = (2'b11);
    end else if((((unburstify_buffer_len & (8'b00000100)) == (8'b00000100)))) begin
        _zz_1_ = (2'b10);
    end else if((((unburstify_buffer_len & (8'b00000010)) == (8'b00000010)))) begin
        _zz_1_ = (2'b01);
    end else begin
        _zz_1_ = (2'b00);
    end
  end

  assign Axi4Incr_wrapCase = (_zz_39_ + _zz_40_);
  always @ ( * ) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        unburstify_buffer_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        unburstify_buffer_result = {Axi4Incr_highCat,_zz_31_};
      end
      default : begin
        unburstify_buffer_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @ ( * ) begin
    io_axis_0_arw_ready = 1'b0;
    if(! unburstify_buffer_valid) begin
      io_axis_0_arw_ready = unburstify_result_ready;
    end
  end

  always @ ( * ) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_valid = 1'b1;
      unburstify_result_payload_last = unburstify_buffer_last;
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
      unburstify_result_payload_fragment_addr = unburstify_buffer_result;
    end else begin
      unburstify_result_valid = io_axis_0_arw_valid;
      unburstify_result_payload_fragment_addr = io_axis_0_arw_payload_addr;
      unburstify_result_payload_fragment_id = io_axis_0_arw_payload_id;
      unburstify_result_payload_fragment_size = io_axis_0_arw_payload_size;
      unburstify_result_payload_fragment_burst = io_axis_0_arw_payload_burst;
      unburstify_result_payload_fragment_write = io_axis_0_arw_payload_write;
      if(_zz_33_)begin
        unburstify_result_payload_last = 1'b1;
      end else begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  assign _zz_2_ = (! (unburstify_result_payload_fragment_write && (! io_axis_0_w_valid)));
  assign _zz_3_ = (unburstify_result_valid && _zz_2_);
  assign unburstify_result_ready = (_zz_4_ && _zz_2_);
  assign _zz_5_ = unburstify_result_payload_fragment_write;
  assign _zz_6_ = unburstify_result_payload_fragment_addr[14 : 2];
  assign io_axis_0_r_payload_data = _zz_29_;
  assign io_axis_0_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && _zz_4_);
  assign _zz_4_ = ((1'b1 && (! _zz_7_)) || ((io_axis_0_r_ready && (! _zz_10_)) || ((io_axis_0_b_ready || (! _zz_8_)) && _zz_10_)));
  assign _zz_7_ = _zz_11_;
  assign _zz_8_ = _zz_12_;
  assign _zz_9_ = _zz_13_;
  assign _zz_10_ = _zz_14_;
  assign io_axis_0_r_valid = (_zz_7_ && (! _zz_10_));
  assign io_axis_0_r_payload_id = _zz_9_;
  assign io_axis_0_r_payload_last = _zz_8_;
  assign io_axis_0_r_payload_resp = (2'b00);
  assign io_axis_0_b_valid = ((_zz_7_ && _zz_10_) && _zz_8_);
  assign io_axis_0_b_payload_resp = (2'b00);
  assign io_axis_0_b_payload_id = _zz_9_;
  assign unburstify_buffer_last_1_ = (unburstify_buffer_beat_1_ == (8'b00000001));
  assign Axi4Incr_validSize_1_ = unburstify_buffer_transaction_size_1_[1 : 0];
  assign Axi4Incr_highCat_1_ = unburstify_buffer_transaction_addr_1_[14 : 12];
  assign Axi4Incr_sizeValue_1_ = {((2'b10) == Axi4Incr_validSize_1_),{((2'b01) == Axi4Incr_validSize_1_),((2'b00) == Axi4Incr_validSize_1_)}};
  assign Axi4Incr_alignMask_1_ = {10'd0, _zz_41_};
  assign Axi4Incr_base_1_ = (_zz_43_ & (~ Axi4Incr_alignMask_1_));
  assign Axi4Incr_baseIncr_1_ = (Axi4Incr_base_1_ + _zz_44_);
  always @ ( * ) begin
    if((((unburstify_buffer_len_1_ & (8'b00001000)) == (8'b00001000)))) begin
        _zz_15_ = (2'b11);
    end else if((((unburstify_buffer_len_1_ & (8'b00000100)) == (8'b00000100)))) begin
        _zz_15_ = (2'b10);
    end else if((((unburstify_buffer_len_1_ & (8'b00000010)) == (8'b00000010)))) begin
        _zz_15_ = (2'b01);
    end else begin
        _zz_15_ = (2'b00);
    end
  end

  assign Axi4Incr_wrapCase_1_ = (_zz_45_ + _zz_46_);
  always @ ( * ) begin
    case(unburstify_buffer_transaction_burst_1_)
      2'b00 : begin
        unburstify_buffer_result_1_ = unburstify_buffer_transaction_addr_1_;
      end
      2'b10 : begin
        unburstify_buffer_result_1_ = {Axi4Incr_highCat_1_,_zz_32_};
      end
      default : begin
        unburstify_buffer_result_1_ = {Axi4Incr_highCat_1_,Axi4Incr_baseIncr_1_};
      end
    endcase
  end

  always @ ( * ) begin
    io_axis_1_arw_ready = 1'b0;
    if(! unburstify_buffer_valid_1_) begin
      io_axis_1_arw_ready = unburstify_result_ready_1_;
    end
  end

  always @ ( * ) begin
    if(unburstify_buffer_valid_1_)begin
      unburstify_result_valid_1_ = 1'b1;
      unburstify_result_payload_last_1_ = unburstify_buffer_last_1_;
      unburstify_result_payload_fragment_id_1_ = unburstify_buffer_transaction_id_1_;
      unburstify_result_payload_fragment_size_1_ = unburstify_buffer_transaction_size_1_;
      unburstify_result_payload_fragment_burst_1_ = unburstify_buffer_transaction_burst_1_;
      unburstify_result_payload_fragment_write_1_ = unburstify_buffer_transaction_write_1_;
      unburstify_result_payload_fragment_addr_1_ = unburstify_buffer_result_1_;
    end else begin
      unburstify_result_valid_1_ = io_axis_1_arw_valid;
      unburstify_result_payload_fragment_addr_1_ = io_axis_1_arw_payload_addr;
      unburstify_result_payload_fragment_id_1_ = io_axis_1_arw_payload_id;
      unburstify_result_payload_fragment_size_1_ = io_axis_1_arw_payload_size;
      unburstify_result_payload_fragment_burst_1_ = io_axis_1_arw_payload_burst;
      unburstify_result_payload_fragment_write_1_ = io_axis_1_arw_payload_write;
      if(_zz_34_)begin
        unburstify_result_payload_last_1_ = 1'b1;
      end else begin
        unburstify_result_payload_last_1_ = 1'b0;
      end
    end
  end

  assign _zz_16_ = (! (unburstify_result_payload_fragment_write_1_ && (! io_axis_1_w_valid)));
  assign _zz_17_ = (unburstify_result_valid_1_ && _zz_16_);
  assign unburstify_result_ready_1_ = (_zz_18_ && _zz_16_);
  assign _zz_19_ = unburstify_result_payload_fragment_write_1_;
  assign _zz_20_ = unburstify_result_payload_fragment_addr_1_[14 : 2];
  assign io_axis_1_r_payload_data = _zz_30_;
  assign io_axis_1_w_ready = ((unburstify_result_valid_1_ && unburstify_result_payload_fragment_write_1_) && _zz_18_);
  assign _zz_18_ = ((1'b1 && (! _zz_21_)) || ((io_axis_1_r_ready && (! _zz_24_)) || ((io_axis_1_b_ready || (! _zz_22_)) && _zz_24_)));
  assign _zz_21_ = _zz_25_;
  assign _zz_22_ = _zz_26_;
  assign _zz_23_ = _zz_27_;
  assign _zz_24_ = _zz_28_;
  assign io_axis_1_r_valid = (_zz_21_ && (! _zz_24_));
  assign io_axis_1_r_payload_id = _zz_23_;
  assign io_axis_1_r_payload_last = _zz_22_;
  assign io_axis_1_r_payload_resp = (2'b00);
  assign io_axis_1_b_valid = ((_zz_21_ && _zz_24_) && _zz_22_);
  assign io_axis_1_b_payload_resp = (2'b00);
  assign io_axis_1_b_payload_id = _zz_23_;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      unburstify_buffer_valid <= 1'b0;
      _zz_11_ <= 1'b0;
      unburstify_buffer_valid_1_ <= 1'b0;
      _zz_25_ <= 1'b0;
    end else begin
      if(unburstify_result_ready)begin
        if(unburstify_buffer_last)begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(! unburstify_buffer_valid) begin
        if(! _zz_33_) begin
          if(unburstify_result_ready)begin
            unburstify_buffer_valid <= io_axis_0_arw_valid;
          end
        end
      end
      if(_zz_4_)begin
        _zz_11_ <= _zz_3_;
      end
      if(unburstify_result_ready_1_)begin
        if(unburstify_buffer_last_1_)begin
          unburstify_buffer_valid_1_ <= 1'b0;
        end
      end
      if(! unburstify_buffer_valid_1_) begin
        if(! _zz_34_) begin
          if(unburstify_result_ready_1_)begin
            unburstify_buffer_valid_1_ <= io_axis_1_arw_valid;
          end
        end
      end
      if(_zz_18_)begin
        _zz_25_ <= _zz_17_;
      end
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(unburstify_result_ready)begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - (8'b00000001));
      unburstify_buffer_transaction_addr[11 : 0] <= unburstify_buffer_result[11 : 0];
    end
    if(! unburstify_buffer_valid) begin
      if(! _zz_33_) begin
        if(unburstify_result_ready)begin
          unburstify_buffer_transaction_addr <= io_axis_0_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axis_0_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axis_0_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axis_0_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axis_0_arw_payload_write;
          unburstify_buffer_beat <= io_axis_0_arw_payload_len;
          unburstify_buffer_len <= io_axis_0_arw_payload_len;
        end
      end
    end
    if(_zz_4_)begin
      _zz_12_ <= unburstify_result_payload_last;
      _zz_13_ <= unburstify_result_payload_fragment_id;
      _zz_14_ <= _zz_5_;
    end
    if(unburstify_result_ready_1_)begin
      unburstify_buffer_beat_1_ <= (unburstify_buffer_beat_1_ - (8'b00000001));
      unburstify_buffer_transaction_addr_1_[11 : 0] <= unburstify_buffer_result_1_[11 : 0];
    end
    if(! unburstify_buffer_valid_1_) begin
      if(! _zz_34_) begin
        if(unburstify_result_ready_1_)begin
          unburstify_buffer_transaction_addr_1_ <= io_axis_1_arw_payload_addr;
          unburstify_buffer_transaction_id_1_ <= io_axis_1_arw_payload_id;
          unburstify_buffer_transaction_size_1_ <= io_axis_1_arw_payload_size;
          unburstify_buffer_transaction_burst_1_ <= io_axis_1_arw_payload_burst;
          unburstify_buffer_transaction_write_1_ <= io_axis_1_arw_payload_write;
          unburstify_buffer_beat_1_ <= io_axis_1_arw_payload_len;
          unburstify_buffer_len_1_ <= io_axis_1_arw_payload_len;
        end
      end
    end
    if(_zz_18_)begin
      _zz_26_ <= unburstify_result_payload_last_1_;
      _zz_27_ <= unburstify_result_payload_fragment_id_1_;
      _zz_28_ <= _zz_19_;
    end
  end

endmodule

module Axi4SharedToApb3Bridge (
      input   io_axi_arw_valid,
      output reg  io_axi_arw_ready,
      input  [19:0] io_axi_arw_payload_addr,
      input  [3:0] io_axi_arw_payload_id,
      input  [7:0] io_axi_arw_payload_len,
      input  [2:0] io_axi_arw_payload_size,
      input  [1:0] io_axi_arw_payload_burst,
      input   io_axi_arw_payload_write,
      input   io_axi_w_valid,
      output reg  io_axi_w_ready,
      input  [31:0] io_axi_w_payload_data,
      input  [3:0] io_axi_w_payload_strb,
      input   io_axi_w_payload_last,
      output reg  io_axi_b_valid,
      input   io_axi_b_ready,
      output [3:0] io_axi_b_payload_id,
      output [1:0] io_axi_b_payload_resp,
      output reg  io_axi_r_valid,
      input   io_axi_r_ready,
      output [31:0] io_axi_r_payload_data,
      output [3:0] io_axi_r_payload_id,
      output [1:0] io_axi_r_payload_resp,
      output  io_axi_r_payload_last,
      output [19:0] io_apb_PADDR,
      output reg [0:0] io_apb_PSEL,
      output reg  io_apb_PENABLE,
      input   io_apb_PREADY,
      output  io_apb_PWRITE,
      output [31:0] io_apb_PWDATA,
      input  [31:0] io_apb_PRDATA,
      input   io_apb_PSLVERROR,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_1_;
  reg `Axi4ToApb3BridgePhase_defaultEncoding_type phase;
  reg  write;
  reg [31:0] readedData;
  reg [3:0] id;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif

  
	initial begin
  	phase				= 0;
  	write				= 0;
  	readedData	= 0;
  	id					= 0;
  	`ifndef SYNTHESIS
  		phase_string	= 0;
  	`endif
	end
	
  assign _zz_1_ = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  `ifndef SYNTHESIS
  always @( * ) begin
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : phase_string = "SETUP   ";
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : phase_string = "ACCESS_1";
      `Axi4ToApb3BridgePhase_defaultEncoding_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @ ( * ) begin
    io_axi_arw_ready = 1'b0;
    io_axi_w_ready = 1'b0;
    io_axi_b_valid = 1'b0;
    io_axi_r_valid = 1'b0;
    io_apb_PSEL[0] = 1'b0;
    io_apb_PENABLE = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
        if(_zz_1_)begin
          io_apb_PSEL[0] = 1'b1;
        end
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
        io_apb_PENABLE = 1'b1;
        if(io_apb_PREADY)begin
          io_axi_arw_ready = 1'b1;
          io_axi_w_ready = write;
        end
      end
      default : begin
        if(write)begin
          io_axi_b_valid = 1'b1;
        end else begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,(1'b0)};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,(1'b0)};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      phase <= `Axi4ToApb3BridgePhase_defaultEncoding_SETUP;
    end else begin
      case(phase)
        `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
          if(_zz_1_)begin
            phase <= `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1;
          end
        end
        `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
          if(io_apb_PREADY)begin
            phase <= `Axi4ToApb3BridgePhase_defaultEncoding_RESPONSE;
          end
        end
        default : begin
          if(write)begin
            if(io_axi_b_ready)begin
              phase <= `Axi4ToApb3BridgePhase_defaultEncoding_SETUP;
            end
          end else begin
            if(io_axi_r_ready)begin
              phase <= `Axi4ToApb3BridgePhase_defaultEncoding_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        if(io_apb_PREADY)begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end

endmodule

module Apb3Gpio2 (
      input  [7:0] io_gpio_read,
      output reg [7:0] io_gpio_write,
      output reg [7:0] io_gpio_writeEnable,
      input  [11:0] io_bus_PADDR,
      input  [0:0] io_bus_PSEL,
      input   io_bus_PENABLE,
      output  io_bus_PREADY,
      input   io_bus_PWRITE,
      input  [31:0] io_bus_PWDATA,
      output reg [31:0] io_bus_PRDATA,
      output  io_bus_PSLVERROR,
      output reg [7:0] io_interrupt,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire [7:0] bufferCC_5__io_dataOut;
  wire [0:0] _zz_25_;
  wire [0:0] _zz_26_;
  wire [0:0] _zz_27_;
  wire [0:0] _zz_28_;
  wire [0:0] _zz_29_;
  wire [0:0] _zz_30_;
  wire [0:0] _zz_31_;
  wire [0:0] _zz_32_;
  wire [0:0] _zz_33_;
  wire [0:0] _zz_34_;
  wire [0:0] _zz_35_;
  wire [0:0] _zz_36_;
  wire [0:0] _zz_37_;
  wire [0:0] _zz_38_;
  wire [0:0] _zz_39_;
  wire [0:0] _zz_40_;
  wire [0:0] _zz_41_;
  wire [0:0] _zz_42_;
  wire [0:0] _zz_43_;
  wire [0:0] _zz_44_;
  wire [0:0] _zz_45_;
  wire [0:0] _zz_46_;
  wire [0:0] _zz_47_;
  wire [0:0] _zz_48_;
  wire  mapper_askWrite;
  wire  mapper_askRead;
  wire  mapper_doWrite;
  wire  mapper_doRead;
  wire [7:0] syncronized;
  reg [7:0] last;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  _zz_3_;
  reg  _zz_4_;
  reg  _zz_5_;
  reg  _zz_6_;
  reg  _zz_7_;
  reg  _zz_8_;
  reg  _zz_9_;
  reg  _zz_10_;
  reg  _zz_11_;
  reg  _zz_12_;
  reg  _zz_13_;
  reg  _zz_14_;
  reg  _zz_15_;
  reg  _zz_16_;
  reg [7:0] interrupt_enable_high;
  reg [7:0] interrupt_enable_low;
  reg [7:0] interrupt_enable_rise;
  reg [7:0] interrupt_enable_fall;
  wire [7:0] interrupt_valid;
  reg  _zz_17_;
  reg  _zz_18_;
  reg  _zz_19_;
  reg  _zz_20_;
  reg  _zz_21_;
  reg  _zz_22_;
  reg  _zz_23_;
  reg  _zz_24_;
  
	initial begin
		last		= 0;	
		_zz_1_	= 0;
		_zz_2_	= 0;
		_zz_3_	= 0;
		_zz_4_	= 0;
		_zz_5_	= 0;
		_zz_6_	= 0;
		_zz_7_	= 0;
		_zz_8_	= 0;
		_zz_9_	= 0;
		_zz_10_	= 0;
		_zz_11_	= 0;
		_zz_12_	= 0;
		_zz_13_	= 0;
		_zz_14_	= 0;
		_zz_15_	= 0;
		_zz_16_	= 0;
		_zz_17_	= 0;
		_zz_18_	= 0;
		_zz_19_	= 0;
		_zz_20_	= 0;
		_zz_21_	= 0;
		_zz_22_	= 0;
		_zz_23_	= 0;
		_zz_24_	= 0;
		
		io_gpio_write					= 0;
		io_gpio_writeEnable		= 0;
		io_bus_PRDATA					= 0;
		io_interrupt					= 0;
		
		interrupt_enable_high	= 0;
		interrupt_enable_low	= 0;
		interrupt_enable_rise	= 0;
		interrupt_enable_fall	= 0;		
	end
	
  assign _zz_25_ = io_bus_PWDATA[0 : 0];
  assign _zz_26_ = io_bus_PWDATA[1 : 1];
  assign _zz_27_ = io_bus_PWDATA[2 : 2];
  assign _zz_28_ = io_bus_PWDATA[3 : 3];
  assign _zz_29_ = io_bus_PWDATA[4 : 4];
  assign _zz_30_ = io_bus_PWDATA[5 : 5];
  assign _zz_31_ = io_bus_PWDATA[6 : 6];
  assign _zz_32_ = io_bus_PWDATA[7 : 7];
  assign _zz_33_ = io_bus_PWDATA[0 : 0];
  assign _zz_34_ = io_bus_PWDATA[1 : 1];
  assign _zz_35_ = io_bus_PWDATA[2 : 2];
  assign _zz_36_ = io_bus_PWDATA[3 : 3];
  assign _zz_37_ = io_bus_PWDATA[4 : 4];
  assign _zz_38_ = io_bus_PWDATA[5 : 5];
  assign _zz_39_ = io_bus_PWDATA[6 : 6];
  assign _zz_40_ = io_bus_PWDATA[7 : 7];
  assign _zz_41_ = io_bus_PWDATA[0 : 0];
  assign _zz_42_ = io_bus_PWDATA[1 : 1];
  assign _zz_43_ = io_bus_PWDATA[0 : 0];
  assign _zz_44_ = io_bus_PWDATA[1 : 1];
  assign _zz_45_ = io_bus_PWDATA[0 : 0];
  assign _zz_46_ = io_bus_PWDATA[1 : 1];
  assign _zz_47_ = io_bus_PWDATA[0 : 0];
  assign _zz_48_ = io_bus_PWDATA[1 : 1];
  BufferCC_2_ bufferCC_5_ (
    .io_dataIn(io_gpio_read),
    .io_dataOut(bufferCC_5__io_dataOut),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign io_bus_PREADY = 1'b1;
  always @ ( * ) begin
    io_bus_PRDATA = (32'b00000000000000000000000000000000);
    case(io_bus_PADDR)
      12'b000000000000 : begin
        io_bus_PRDATA[0 : 0] = io_gpio_read[0];
        io_bus_PRDATA[1 : 1] = io_gpio_read[1];
        io_bus_PRDATA[2 : 2] = io_gpio_read[2];
        io_bus_PRDATA[3 : 3] = io_gpio_read[3];
        io_bus_PRDATA[4 : 4] = io_gpio_read[4];
        io_bus_PRDATA[5 : 5] = io_gpio_read[5];
        io_bus_PRDATA[6 : 6] = io_gpio_read[6];
        io_bus_PRDATA[7 : 7] = io_gpio_read[7];
      end
      12'b000000000100 : begin
        io_bus_PRDATA[0 : 0] = _zz_1_;
        io_bus_PRDATA[1 : 1] = _zz_3_;
        io_bus_PRDATA[2 : 2] = _zz_5_;
        io_bus_PRDATA[3 : 3] = _zz_7_;
        io_bus_PRDATA[4 : 4] = _zz_9_;
        io_bus_PRDATA[5 : 5] = _zz_11_;
        io_bus_PRDATA[6 : 6] = _zz_13_;
        io_bus_PRDATA[7 : 7] = _zz_15_;
      end
      12'b000000001000 : begin
        io_bus_PRDATA[0 : 0] = _zz_2_;
        io_bus_PRDATA[1 : 1] = _zz_4_;
        io_bus_PRDATA[2 : 2] = _zz_6_;
        io_bus_PRDATA[3 : 3] = _zz_8_;
        io_bus_PRDATA[4 : 4] = _zz_10_;
        io_bus_PRDATA[5 : 5] = _zz_12_;
        io_bus_PRDATA[6 : 6] = _zz_14_;
        io_bus_PRDATA[7 : 7] = _zz_16_;
      end
      12'b000000100000 : begin
        io_bus_PRDATA[0 : 0] = _zz_17_;
        io_bus_PRDATA[1 : 1] = _zz_21_;
      end
      12'b000000100100 : begin
        io_bus_PRDATA[0 : 0] = _zz_18_;
        io_bus_PRDATA[1 : 1] = _zz_22_;
      end
      12'b000000101000 : begin
        io_bus_PRDATA[0 : 0] = _zz_19_;
        io_bus_PRDATA[1 : 1] = _zz_23_;
      end
      12'b000000101100 : begin
        io_bus_PRDATA[0 : 0] = _zz_20_;
        io_bus_PRDATA[1 : 1] = _zz_24_;
      end
      default : begin
      end
    endcase
  end

  assign io_bus_PSLVERROR = 1'b0;
  assign mapper_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign mapper_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign mapper_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign mapper_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign syncronized = bufferCC_5__io_dataOut;
  always @ ( * ) begin
    io_gpio_write[0] = _zz_1_;
    io_gpio_write[1] = _zz_3_;
    io_gpio_write[2] = _zz_5_;
    io_gpio_write[3] = _zz_7_;
    io_gpio_write[4] = _zz_9_;
    io_gpio_write[5] = _zz_11_;
    io_gpio_write[6] = _zz_13_;
    io_gpio_write[7] = _zz_15_;
  end

  always @ ( * ) begin
    io_gpio_writeEnable[0] = _zz_2_;
    io_gpio_writeEnable[1] = _zz_4_;
    io_gpio_writeEnable[2] = _zz_6_;
    io_gpio_writeEnable[3] = _zz_8_;
    io_gpio_writeEnable[4] = _zz_10_;
    io_gpio_writeEnable[5] = _zz_12_;
    io_gpio_writeEnable[6] = _zz_14_;
    io_gpio_writeEnable[7] = _zz_16_;
  end

  assign interrupt_valid = ((((interrupt_enable_high & syncronized) | (interrupt_enable_low & (~ syncronized))) | (interrupt_enable_rise & (syncronized & (~ last)))) | (interrupt_enable_fall & ((~ syncronized) & last)));
  always @ ( * ) begin
    io_interrupt[0] = interrupt_valid[0];
    io_interrupt[1] = interrupt_valid[1];
    io_interrupt[2] = 1'b0;
    io_interrupt[3] = 1'b0;
    io_interrupt[4] = 1'b0;
    io_interrupt[5] = 1'b0;
    io_interrupt[6] = 1'b0;
    io_interrupt[7] = 1'b0;
  end

  always @ ( * ) begin
    interrupt_enable_rise[0] = _zz_17_;
    interrupt_enable_rise[1] = _zz_21_;
    interrupt_enable_rise[2] = 1'b0;
    interrupt_enable_rise[3] = 1'b0;
    interrupt_enable_rise[4] = 1'b0;
    interrupt_enable_rise[5] = 1'b0;
    interrupt_enable_rise[6] = 1'b0;
    interrupt_enable_rise[7] = 1'b0;
  end

  always @ ( * ) begin
    interrupt_enable_fall[0] = _zz_18_;
    interrupt_enable_fall[1] = _zz_22_;
    interrupt_enable_fall[2] = 1'b0;
    interrupt_enable_fall[3] = 1'b0;
    interrupt_enable_fall[4] = 1'b0;
    interrupt_enable_fall[5] = 1'b0;
    interrupt_enable_fall[6] = 1'b0;
    interrupt_enable_fall[7] = 1'b0;
  end

  always @ ( * ) begin
    interrupt_enable_high[0] = _zz_19_;
    interrupt_enable_high[1] = _zz_23_;
    interrupt_enable_high[2] = 1'b0;
    interrupt_enable_high[3] = 1'b0;
    interrupt_enable_high[4] = 1'b0;
    interrupt_enable_high[5] = 1'b0;
    interrupt_enable_high[6] = 1'b0;
    interrupt_enable_high[7] = 1'b0;
  end

  always @ ( * ) begin
    interrupt_enable_low[0] = _zz_20_;
    interrupt_enable_low[1] = _zz_24_;
    interrupt_enable_low[2] = 1'b0;
    interrupt_enable_low[3] = 1'b0;
    interrupt_enable_low[4] = 1'b0;
    interrupt_enable_low[5] = 1'b0;
    interrupt_enable_low[6] = 1'b0;
    interrupt_enable_low[7] = 1'b0;
  end

  always @ (posedge toplevel_io_axiClk) begin
    last <= syncronized;
    case(io_bus_PADDR)
      12'b000000000000 : begin
      end
      12'b000000000100 : begin
        if(mapper_doWrite)begin
          _zz_1_ <= _zz_25_[0];
          _zz_3_ <= _zz_26_[0];
          _zz_5_ <= _zz_27_[0];
          _zz_7_ <= _zz_28_[0];
          _zz_9_ <= _zz_29_[0];
          _zz_11_ <= _zz_30_[0];
          _zz_13_ <= _zz_31_[0];
          _zz_15_ <= _zz_32_[0];
        end
      end
      12'b000000001000 : begin
        if(mapper_doWrite)begin
          _zz_2_ <= _zz_33_[0];
          _zz_4_ <= _zz_34_[0];
          _zz_6_ <= _zz_35_[0];
          _zz_8_ <= _zz_36_[0];
          _zz_10_ <= _zz_37_[0];
          _zz_12_ <= _zz_38_[0];
          _zz_14_ <= _zz_39_[0];
          _zz_16_ <= _zz_40_[0];
        end
      end
      12'b000000100000 : begin
      end
      12'b000000100100 : begin
      end
      12'b000000101000 : begin
      end
      12'b000000101100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      _zz_17_ <= 1'b0;
      _zz_18_ <= 1'b0;
      _zz_19_ <= 1'b0;
      _zz_20_ <= 1'b0;
      _zz_21_ <= 1'b0;
      _zz_22_ <= 1'b0;
      _zz_23_ <= 1'b0;
      _zz_24_ <= 1'b0;
    end else begin
      case(io_bus_PADDR)
        12'b000000000000 : begin
        end
        12'b000000000100 : begin
        end
        12'b000000001000 : begin
        end
        12'b000000100000 : begin
          if(mapper_doWrite)begin
            _zz_17_ <= _zz_41_[0];
            _zz_21_ <= _zz_42_[0];
          end
        end
        12'b000000100100 : begin
          if(mapper_doWrite)begin
            _zz_18_ <= _zz_43_[0];
            _zz_22_ <= _zz_44_[0];
          end
        end
        12'b000000101000 : begin
          if(mapper_doWrite)begin
            _zz_19_ <= _zz_45_[0];
            _zz_23_ <= _zz_46_[0];
          end
        end
        12'b000000101100 : begin
          if(mapper_doWrite)begin
            _zz_20_ <= _zz_47_[0];
            _zz_24_ <= _zz_48_[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

endmodule

module Apb3UartCtrl (
      input  [3:0] io_apb_PADDR,
      input  [0:0] io_apb_PSEL,
      input   io_apb_PENABLE,
      output  io_apb_PREADY,
      input   io_apb_PWRITE,
      input  [31:0] io_apb_PWDATA,
      output reg [31:0] io_apb_PRDATA,
      output  io_uart_txd,
      input   io_uart_rxd,
      output  io_interrupt,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_5_;
  reg  _zz_6_;
  wire  _zz_7_;
  wire  uartCtrl_1__io_write_ready;
  wire  uartCtrl_1__io_read_valid;
  wire [7:0] uartCtrl_1__io_read_payload;
  wire  uartCtrl_1__io_uart_txd;
  wire  bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire  bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire [7:0] bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire [4:0] bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire [4:0] bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire  uartCtrl_1__io_read_queueWithOccupancy_io_push_ready;
  wire  uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid;
  wire [7:0] uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload;
  wire [4:0] uartCtrl_1__io_read_queueWithOccupancy_io_occupancy;
  wire [4:0] uartCtrl_1__io_read_queueWithOccupancy_io_availability;
  wire [19:0] _zz_8_;
  wire [19:0] _zz_9_;
  wire [0:0] _zz_10_;
  wire [0:0] _zz_11_;
  wire [4:0] _zz_12_;
  wire  busCtrl_askWrite;
  wire  busCtrl_askRead;
  wire  busCtrl_doWrite;
  wire  busCtrl_doRead;
  reg [2:0] bridge_uartConfigReg_frame_dataLength;
  reg `UartStopType_defaultEncoding_type bridge_uartConfigReg_frame_stop;
  reg `UartParityType_defaultEncoding_type bridge_uartConfigReg_frame_parity;
  reg [19:0] bridge_uartConfigReg_clockDivider;
  reg  _zz_1_;
  wire  bridge_write_streamUnbuffered_valid;
  wire  bridge_write_streamUnbuffered_ready;
  wire [7:0] bridge_write_streamUnbuffered_payload;
  reg  bridge_interruptCtrl_writeIntEnable;
  reg  bridge_interruptCtrl_readIntEnable;
  wire  bridge_interruptCtrl_readInt;
  wire  bridge_interruptCtrl_writeInt;
  wire  bridge_interruptCtrl_interrupt;
  wire [7:0] _zz_2_;
  wire `UartParityType_defaultEncoding_type _zz_3_;
  wire `UartStopType_defaultEncoding_type _zz_4_;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_3__string;
  reg [23:0] _zz_4__string;
  `endif

  
	initial begin
  	_zz_1_	= 0;
  	_zz_6_	= 0;
  	bridge_uartConfigReg_frame_dataLength	= 0;
  	bridge_uartConfigReg_frame_stop				= 0;
  	bridge_uartConfigReg_frame_parity			= 0;
  	bridge_uartConfigReg_clockDivider			= 0;
  	bridge_interruptCtrl_writeIntEnable		= 0;
  	bridge_interruptCtrl_readIntEnable		= 0;
  	`ifndef SYNTHESIS
  		bridge_uartConfigReg_frame_stop_string	 = 0;
  		bridge_uartConfigReg_frame_parity_string = 0;
  		_zz_3__string = 0;
  		_zz_4__string = 0;
  	`endif
	end
	
  assign _zz_8_ = io_apb_PWDATA[19 : 0];
  assign _zz_9_ = _zz_8_;
  assign _zz_10_ = io_apb_PWDATA[0 : 0];
  assign _zz_11_ = io_apb_PWDATA[1 : 1];
  assign _zz_12_ = ((5'b10000) - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1_ (
    .io_config_frame_dataLength(bridge_uartConfigReg_frame_dataLength),
    .io_config_frame_stop(bridge_uartConfigReg_frame_stop),
    .io_config_frame_parity(bridge_uartConfigReg_frame_parity),
    .io_config_clockDivider(bridge_uartConfigReg_clockDivider),
    .io_write_valid(bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid),
    .io_write_ready(uartCtrl_1__io_write_ready),
    .io_write_payload(bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload),
    .io_read_valid(uartCtrl_1__io_read_valid),
    .io_read_payload(uartCtrl_1__io_read_payload),
    .io_uart_txd(uartCtrl_1__io_uart_txd),
    .io_uart_rxd(io_uart_rxd),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid(bridge_write_streamUnbuffered_valid),
    .io_push_ready(bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready),
    .io_push_payload(bridge_write_streamUnbuffered_payload),
    .io_pop_valid(bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid),
    .io_pop_ready(uartCtrl_1__io_write_ready),
    .io_pop_payload(bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload),
    .io_flush(_zz_5_),
    .io_occupancy(bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy),
    .io_availability(bridge_write_streamUnbuffered_queueWithOccupancy_io_availability),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFifo uartCtrl_1__io_read_queueWithOccupancy (
    .io_push_valid(uartCtrl_1__io_read_valid),
    .io_push_ready(uartCtrl_1__io_read_queueWithOccupancy_io_push_ready),
    .io_push_payload(uartCtrl_1__io_read_payload),
    .io_pop_valid(uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid),
    .io_pop_ready(_zz_6_),
    .io_pop_payload(uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload),
    .io_flush(_zz_7_),
    .io_occupancy(uartCtrl_1__io_read_queueWithOccupancy_io_occupancy),
    .io_availability(uartCtrl_1__io_read_queueWithOccupancy_io_availability),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  `ifndef SYNTHESIS
  always @( * ) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_defaultEncoding_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @( * ) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_defaultEncoding_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_3_)
      `UartParityType_defaultEncoding_NONE : _zz_3__string = "NONE";
      `UartParityType_defaultEncoding_EVEN : _zz_3__string = "EVEN";
      `UartParityType_defaultEncoding_ODD : _zz_3__string = "ODD ";
      default : _zz_3__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_4_)
      `UartStopType_defaultEncoding_ONE : _zz_4__string = "ONE";
      `UartStopType_defaultEncoding_TWO : _zz_4__string = "TWO";
      default : _zz_4__string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1__io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @ ( * ) begin
    io_apb_PRDATA = (32'b00000000000000000000000000000000);
    _zz_1_ = 1'b0;
    _zz_6_ = 1'b0;
    case(io_apb_PADDR)
      4'b1000 : begin
      end
      4'b1100 : begin
      end
      4'b0000 : begin
        if(busCtrl_doWrite)begin
          _zz_1_ = 1'b1;
        end
        if(busCtrl_doRead)begin
          _zz_6_ = 1'b1;
        end
        io_apb_PRDATA[16 : 16] = uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[7 : 0] = uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload;
      end
      4'b0100 : begin
        io_apb_PRDATA[20 : 16] = _zz_12_;
        io_apb_PRDATA[28 : 24] = uartCtrl_1__io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign bridge_write_streamUnbuffered_valid = _zz_1_;
  assign bridge_write_streamUnbuffered_payload = _zz_2_;
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_2_ = io_apb_PWDATA[7 : 0];
  assign _zz_3_ = io_apb_PWDATA[9 : 8];
  assign _zz_4_ = io_apb_PWDATA[16 : 16];
  assign _zz_5_ = 1'b0;
  assign _zz_7_ = 1'b0;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      bridge_uartConfigReg_clockDivider <= (20'b00000000000000000000);
      bridge_uartConfigReg_clockDivider <= (20'b00000000000000110101);
      bridge_uartConfigReg_frame_dataLength <= (3'b111);
      bridge_uartConfigReg_frame_parity <= `UartParityType_defaultEncoding_NONE;
      bridge_uartConfigReg_frame_stop <= `UartStopType_defaultEncoding_ONE;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
    end else begin
      case(io_apb_PADDR)
        4'b1000 : begin
          if(busCtrl_doWrite)begin
            bridge_uartConfigReg_clockDivider[19 : 0] <= _zz_9_;
          end
        end
        4'b1100 : begin
          if(busCtrl_doWrite)begin
            bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
            bridge_uartConfigReg_frame_parity <= _zz_3_;
            bridge_uartConfigReg_frame_stop <= _zz_4_;
          end
        end
        4'b0000 : begin
        end
        4'b0100 : begin
          if(busCtrl_doWrite)begin
            bridge_interruptCtrl_writeIntEnable <= _zz_10_[0];
            bridge_interruptCtrl_readIntEnable <= _zz_11_[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

endmodule

module EfxTimer (
      input  [7:0] io_apb_PADDR,
      input  [0:0] io_apb_PSEL,
      input   io_apb_PENABLE,
      output  io_apb_PREADY,
      input   io_apb_PWRITE,
      input  [31:0] io_apb_PWDATA,
      output reg [31:0] io_apb_PRDATA,
      output  io_apb_PSLVERROR,
      output reg [1:0] io_interrupts,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire  timerA_io_full;
  wire [31:0] timerA_io_value;
  wire  timerB_io_full;
  wire [15:0] timerB_io_value;
  wire  busCtrl_askWrite;
  wire  busCtrl_askRead;
  wire  busCtrl_doWrite;
  wire  busCtrl_doRead;
  reg [0:0] timerABridge_ticksEnable;
  reg [0:0] timerABridge_clearsEnable;
  reg  timerABridge_busClearing;
  reg [31:0] timerA_io_limit_driver;
  reg  _zz_1_;
  reg  _zz_2_;
  reg [0:0] timerBBridge_ticksEnable;
  reg [0:0] timerBBridge_clearsEnable;
  reg  timerBBridge_busClearing;
  reg [15:0] timerB_io_limit_driver;
  reg  _zz_3_;
  reg  _zz_4_;
  
	initial begin
  	timerABridge_ticksEnable	= 0;
  	timerABridge_clearsEnable	= 0;
  	timerABridge_busClearing	= 0;
  	timerA_io_limit_driver		= 0;
  	timerBBridge_ticksEnable	= 0;
  	timerBBridge_clearsEnable	= 0;
  	timerBBridge_busClearing	= 0;
  	timerB_io_limit_driver		= 0;
  	_zz_1_	= 0;
  	_zz_2_	= 0;
  	_zz_3_	= 0;
  	_zz_4_	= 0;
	end
	
  Timer timerA (
    .io_tick(_zz_5_),
    .io_clear(_zz_6_),
    .io_limit(timerA_io_limit_driver),
    .io_full(timerA_io_full),
    .io_value(timerA_io_value),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  Timer_1_ timerB (
    .io_tick(_zz_7_),
    .io_clear(_zz_8_),
    .io_limit(timerB_io_limit_driver),
    .io_full(timerB_io_full),
    .io_value(timerB_io_value),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign io_apb_PREADY = 1'b1;
  always @ ( * ) begin
    io_apb_PRDATA = (32'b00000000000000000000000000000000);
    _zz_1_ = 1'b0;
    _zz_2_ = 1'b0;
    _zz_3_ = 1'b0;
    _zz_4_ = 1'b0;
    case(io_apb_PADDR)
      8'b01000000 : begin
        io_apb_PRDATA[0 : 0] = timerABridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerABridge_clearsEnable;
      end
      8'b01000100 : begin
        if(busCtrl_doWrite)begin
          _zz_1_ = 1'b1;
        end
        io_apb_PRDATA[31 : 0] = timerA_io_limit_driver;
      end
      8'b01001000 : begin
        if(busCtrl_doWrite)begin
          _zz_2_ = 1'b1;
        end
        io_apb_PRDATA[31 : 0] = timerA_io_value;
      end
      8'b01010000 : begin
        io_apb_PRDATA[0 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerBBridge_clearsEnable;
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          _zz_3_ = 1'b1;
        end
        io_apb_PRDATA[15 : 0] = timerB_io_limit_driver;
      end
      8'b01011000 : begin
        if(busCtrl_doWrite)begin
          _zz_4_ = 1'b1;
        end
        io_apb_PRDATA[15 : 0] = timerB_io_value;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ ( * ) begin
    timerABridge_busClearing = 1'b0;
    if(_zz_1_)begin
      timerABridge_busClearing = 1'b1;
    end
    if(_zz_2_)begin
      timerABridge_busClearing = 1'b1;
    end
  end

  assign _zz_6_ = (((timerABridge_clearsEnable & timerA_io_full) != (1'b0)) || timerABridge_busClearing);
  assign _zz_5_ = ((timerABridge_ticksEnable & 1'b1) != (1'b0));
  always @ ( * ) begin
    timerBBridge_busClearing = 1'b0;
    if(_zz_3_)begin
      timerBBridge_busClearing = 1'b1;
    end
    if(_zz_4_)begin
      timerBBridge_busClearing = 1'b1;
    end
  end

  assign _zz_8_ = (((timerBBridge_clearsEnable & timerB_io_full) != (1'b0)) || timerBBridge_busClearing);
  assign _zz_7_ = ((timerBBridge_ticksEnable & 1'b1) != (1'b0));
  always @ ( * ) begin
    io_interrupts[0] = timerA_io_full;
    io_interrupts[1] = timerB_io_full;
  end

  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      timerABridge_ticksEnable <= (1'b0);
      timerABridge_clearsEnable <= (1'b0);
      timerBBridge_ticksEnable <= (1'b0);
      timerBBridge_clearsEnable <= (1'b0);
    end else begin
      case(io_apb_PADDR)
        8'b01000000 : begin
          if(busCtrl_doWrite)begin
            timerABridge_ticksEnable <= io_apb_PWDATA[0 : 0];
            timerABridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'b01000100 : begin
        end
        8'b01001000 : begin
        end
        8'b01010000 : begin
          if(busCtrl_doWrite)begin
            timerBBridge_ticksEnable <= io_apb_PWDATA[0 : 0];
            timerBBridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'b01010100 : begin
        end
        8'b01011000 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    case(io_apb_PADDR)
      8'b01000000 : begin
      end
      8'b01000100 : begin
        if(busCtrl_doWrite)begin
          timerA_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          timerB_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01011000 : begin
      end
      default : begin
      end
    endcase
  end

endmodule

module Apb3InterruptCtrl (
      input  [3:0] io_bus_PADDR,
      input  [0:0] io_bus_PSEL,
      input   io_bus_PENABLE,
      output  io_bus_PREADY,
      input   io_bus_PWRITE,
      input  [31:0] io_bus_PWDATA,
      output reg [31:0] io_bus_PRDATA,
      output  io_bus_PSLVERROR,
      input  [7:0] io_inputs,
      output [7:0] io_pendings,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg [7:0] _zz_1_;
  wire [7:0] ctrl_io_pendings;
  wire  factory_askWrite;
  wire  factory_askRead;
  wire  factory_doWrite;
  wire  factory_doRead;
  reg [7:0] ctrl_io_masks_driver;
  
	initial begin
  	_zz_1_ = 0;
  	ctrl_io_masks_driver = 0;
	end
	
  InterruptCtrl ctrl (
    .io_inputs(io_inputs),
    .io_clears(_zz_1_),
    .io_masks(ctrl_io_masks_driver),
    .io_pendings(ctrl_io_pendings),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign io_pendings = ctrl_io_pendings;
  assign io_bus_PREADY = 1'b1;
  always @ ( * ) begin
    io_bus_PRDATA = (32'b00000000000000000000000000000000);
    _zz_1_ = (8'b00000000);
    case(io_bus_PADDR)
      4'b0000 : begin
        if(factory_doWrite)begin
          _zz_1_ = io_bus_PWDATA[7 : 0];
        end
        io_bus_PRDATA[7 : 0] = ctrl_io_pendings;
      end
      4'b0100 : begin
        io_bus_PRDATA[7 : 0] = ctrl_io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_bus_PSLVERROR = 1'b0;
  assign factory_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign factory_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign factory_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign factory_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      ctrl_io_masks_driver <= (8'b00000000);
    end else begin
      case(io_bus_PADDR)
        4'b0000 : begin
        end
        4'b0100 : begin
          if(factory_doWrite)begin
            ctrl_io_masks_driver <= io_bus_PWDATA[7 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

endmodule

module VexRiscv (
      output  iBus_cmd_valid,
      input   iBus_cmd_ready,
      output [31:0] iBus_cmd_payload_pc,
      input   iBus_rsp_valid,
      input   iBus_rsp_payload_error,
      input  [31:0] iBus_rsp_payload_inst,
      input   timerInterrupt,
      input   externalInterrupt,
      input   softwareInterrupt,
      input   debug_bus_cmd_valid,
      output reg  debug_bus_cmd_ready,
      input   debug_bus_cmd_payload_wr,
      input  [7:0] debug_bus_cmd_payload_address,
      input  [31:0] debug_bus_cmd_payload_data,
      output reg [31:0] debug_bus_rsp_data,
      output  debug_resetOut,
      output  dBus_cmd_valid,
      input   dBus_cmd_ready,
      output  dBus_cmd_payload_wr,
      output [31:0] dBus_cmd_payload_address,
      output [31:0] dBus_cmd_payload_data,
      output [1:0] dBus_cmd_payload_size,
      input   dBus_rsp_ready,
      input   dBus_rsp_error,
      input  [31:0] dBus_rsp_data,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset,
      input   toplevel_resetCtrl_systemReset);
  wire  _zz_207_;
  reg [31:0] _zz_208_;
  reg [31:0] _zz_209_;
  reg [31:0] _zz_210_;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire [0:0] IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire  _zz_211_;
  wire  _zz_212_;
  wire  _zz_213_;
  wire  _zz_214_;
  wire [1:0] _zz_215_;
  wire  _zz_216_;
  wire  _zz_217_;
  wire  _zz_218_;
  wire  _zz_219_;
  wire  _zz_220_;
  wire [5:0] _zz_221_;
  wire  _zz_222_;
  wire  _zz_223_;
  wire [4:0] _zz_224_;
  wire [1:0] _zz_225_;
  wire [1:0] _zz_226_;
  wire [1:0] _zz_227_;
  wire [1:0] _zz_228_;
  wire [1:0] _zz_229_;
  wire  _zz_230_;
  wire [2:0] _zz_231_;
  wire [2:0] _zz_232_;
  wire [31:0] _zz_233_;
  wire [2:0] _zz_234_;
  wire [31:0] _zz_235_;
  wire [31:0] _zz_236_;
  wire [11:0] _zz_237_;
  wire [11:0] _zz_238_;
  wire [2:0] _zz_239_;
  wire [31:0] _zz_240_;
  wire [11:0] _zz_241_;
  wire [31:0] _zz_242_;
  wire [19:0] _zz_243_;
  wire [11:0] _zz_244_;
  wire [2:0] _zz_245_;
  wire [0:0] _zz_246_;
  wire [2:0] _zz_247_;
  wire [0:0] _zz_248_;
  wire [2:0] _zz_249_;
  wire [0:0] _zz_250_;
  wire [2:0] _zz_251_;
  wire [0:0] _zz_252_;
  wire [2:0] _zz_253_;
  wire [0:0] _zz_254_;
  wire [0:0] _zz_255_;
  wire [0:0] _zz_256_;
  wire [0:0] _zz_257_;
  wire [0:0] _zz_258_;
  wire [0:0] _zz_259_;
  wire [0:0] _zz_260_;
  wire [0:0] _zz_261_;
  wire [0:0] _zz_262_;
  wire [0:0] _zz_263_;
  wire [0:0] _zz_264_;
  wire [0:0] _zz_265_;
  wire [0:0] _zz_266_;
  wire [0:0] _zz_267_;
  wire [0:0] _zz_268_;
  wire [0:0] _zz_269_;
  wire [0:0] _zz_270_;
  wire [2:0] _zz_271_;
  wire [4:0] _zz_272_;
  wire [11:0] _zz_273_;
  wire [11:0] _zz_274_;
  wire [31:0] _zz_275_;
  wire [31:0] _zz_276_;
  wire [31:0] _zz_277_;
  wire [31:0] _zz_278_;
  wire [31:0] _zz_279_;
  wire [31:0] _zz_280_;
  wire [31:0] _zz_281_;
  wire [32:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [32:0] _zz_284_;
  wire [51:0] _zz_285_;
  wire [51:0] _zz_286_;
  wire [51:0] _zz_287_;
  wire [32:0] _zz_288_;
  wire [51:0] _zz_289_;
  wire [49:0] _zz_290_;
  wire [51:0] _zz_291_;
  wire [49:0] _zz_292_;
  wire [51:0] _zz_293_;
  wire [65:0] _zz_294_;
  wire [65:0] _zz_295_;
  wire [31:0] _zz_296_;
  wire [31:0] _zz_297_;
  wire [0:0] _zz_298_;
  wire [5:0] _zz_299_;
  wire [32:0] _zz_300_;
  wire [32:0] _zz_301_;
  wire [31:0] _zz_302_;
  wire [31:0] _zz_303_;
  wire [32:0] _zz_304_;
  wire [32:0] _zz_305_;
  wire [32:0] _zz_306_;
  wire [0:0] _zz_307_;
  wire [32:0] _zz_308_;
  wire [0:0] _zz_309_;
  wire [32:0] _zz_310_;
  wire [0:0] _zz_311_;
  wire [31:0] _zz_312_;
  wire [11:0] _zz_313_;
  wire [19:0] _zz_314_;
  wire [11:0] _zz_315_;
  wire [2:0] _zz_316_;
  wire [0:0] _zz_317_;
  wire [0:0] _zz_318_;
  wire [0:0] _zz_319_;
  wire [0:0] _zz_320_;
  wire [0:0] _zz_321_;
  wire [0:0] _zz_322_;
  wire  _zz_323_;
  wire  _zz_324_;
  wire [1:0] _zz_325_;
  wire  _zz_326_;
  wire  _zz_327_;
  wire [6:0] _zz_328_;
  wire [4:0] _zz_329_;
  wire  _zz_330_;
  wire [4:0] _zz_331_;
  wire [0:0] _zz_332_;
  wire [7:0] _zz_333_;
  wire  _zz_334_;
  wire [0:0] _zz_335_;
  wire [0:0] _zz_336_;
  wire [31:0] _zz_337_;
  wire  _zz_338_;
  wire  _zz_339_;
  wire [0:0] _zz_340_;
  wire [1:0] _zz_341_;
  wire [0:0] _zz_342_;
  wire [0:0] _zz_343_;
  wire  _zz_344_;
  wire [0:0] _zz_345_;
  wire [23:0] _zz_346_;
  wire [31:0] _zz_347_;
  wire [31:0] _zz_348_;
  wire [31:0] _zz_349_;
  wire [31:0] _zz_350_;
  wire [31:0] _zz_351_;
  wire [31:0] _zz_352_;
  wire [31:0] _zz_353_;
  wire [31:0] _zz_354_;
  wire [0:0] _zz_355_;
  wire [2:0] _zz_356_;
  wire [4:0] _zz_357_;
  wire [4:0] _zz_358_;
  wire  _zz_359_;
  wire [0:0] _zz_360_;
  wire [20:0] _zz_361_;
  wire [31:0] _zz_362_;
  wire [31:0] _zz_363_;
  wire [31:0] _zz_364_;
  wire  _zz_365_;
  wire  _zz_366_;
  wire [0:0] _zz_367_;
  wire [1:0] _zz_368_;
  wire  _zz_369_;
  wire [0:0] _zz_370_;
  wire [0:0] _zz_371_;
  wire [0:0] _zz_372_;
  wire [0:0] _zz_373_;
  wire [1:0] _zz_374_;
  wire [1:0] _zz_375_;
  wire  _zz_376_;
  wire [0:0] _zz_377_;
  wire [17:0] _zz_378_;
  wire [31:0] _zz_379_;
  wire [31:0] _zz_380_;
  wire [31:0] _zz_381_;
  wire [31:0] _zz_382_;
  wire  _zz_383_;
  wire  _zz_384_;
  wire [31:0] _zz_385_;
  wire [31:0] _zz_386_;
  wire [31:0] _zz_387_;
  wire [31:0] _zz_388_;
  wire [31:0] _zz_389_;
  wire [31:0] _zz_390_;
  wire [31:0] _zz_391_;
  wire [31:0] _zz_392_;
  wire [31:0] _zz_393_;
  wire  _zz_394_;
  wire [0:0] _zz_395_;
  wire [0:0] _zz_396_;
  wire [0:0] _zz_397_;
  wire [0:0] _zz_398_;
  wire  _zz_399_;
  wire [0:0] _zz_400_;
  wire [15:0] _zz_401_;
  wire [31:0] _zz_402_;
  wire [31:0] _zz_403_;
  wire [31:0] _zz_404_;
  wire [31:0] _zz_405_;
  wire [31:0] _zz_406_;
  wire [31:0] _zz_407_;
  wire [31:0] _zz_408_;
  wire [0:0] _zz_409_;
  wire [0:0] _zz_410_;
  wire [0:0] _zz_411_;
  wire [0:0] _zz_412_;
  wire  _zz_413_;
  wire [0:0] _zz_414_;
  wire [13:0] _zz_415_;
  wire [31:0] _zz_416_;
  wire [0:0] _zz_417_;
  wire [4:0] _zz_418_;
  wire [1:0] _zz_419_;
  wire [1:0] _zz_420_;
  wire  _zz_421_;
  wire [0:0] _zz_422_;
  wire [9:0] _zz_423_;
  wire [31:0] _zz_424_;
  wire [31:0] _zz_425_;
  wire  _zz_426_;
  wire [0:0] _zz_427_;
  wire [1:0] _zz_428_;
  wire [31:0] _zz_429_;
  wire [31:0] _zz_430_;
  wire [31:0] _zz_431_;
  wire [31:0] _zz_432_;
  wire [31:0] _zz_433_;
  wire [31:0] _zz_434_;
  wire [1:0] _zz_435_;
  wire [1:0] _zz_436_;
  wire  _zz_437_;
  wire [0:0] _zz_438_;
  wire [6:0] _zz_439_;
  wire [31:0] _zz_440_;
  wire [31:0] _zz_441_;
  wire [31:0] _zz_442_;
  wire [31:0] _zz_443_;
  wire [31:0] _zz_444_;
  wire [31:0] _zz_445_;
  wire [31:0] _zz_446_;
  wire  _zz_447_;
  wire  _zz_448_;
  wire [0:0] _zz_449_;
  wire [0:0] _zz_450_;
  wire  _zz_451_;
  wire [0:0] _zz_452_;
  wire [3:0] _zz_453_;
  wire [31:0] _zz_454_;
  wire [31:0] _zz_455_;
  wire [31:0] _zz_456_;
  wire [0:0] _zz_457_;
  wire [3:0] _zz_458_;
  wire [1:0] _zz_459_;
  wire [1:0] _zz_460_;
  wire  _zz_461_;
  wire [0:0] _zz_462_;
  wire [0:0] _zz_463_;
  wire [31:0] _zz_464_;
  wire  _zz_465_;
  wire [0:0] _zz_466_;
  wire [0:0] _zz_467_;
  wire [31:0] _zz_468_;
  wire [31:0] _zz_469_;
  wire [31:0] _zz_470_;
  wire [31:0] _zz_471_;
  wire  _zz_472_;
  wire  _zz_473_;
  wire  _zz_474_;
  wire  _zz_475_;
  wire  _zz_476_;
  wire  _zz_477_;
  wire [31:0] decode_SRC2;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire  decode_DO_EBREAK;
  wire [31:0] memory_PC;
  wire [31:0] execute_MUL_LL;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_IS_CSR;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire  decode_CSR_READ_OPCODE;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_1_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_2_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_3_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_4_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_5_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_6_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_7_;
  wire [31:0] execute_SHIFT_RIGHT;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire  execute_BRANCH_DO;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_8_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_9_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_10_;
  wire  decode_IS_DIV;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_12_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_13_;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire  decode_SRC2_FORCE_ZERO;
  wire  decode_MEMORY_ENABLE;
  wire [31:0] decode_SRC1;
  wire  decode_SRC_LESS_UNSIGNED;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_14_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_15_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_16_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_17_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_19_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_20_;
  wire [33:0] execute_MUL_HL;
  wire [31:0] execute_BRANCH_CALC;
  wire [51:0] memory_MUL_LOW;
  wire  decode_IS_RS2_SIGNED;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [33:0] execute_MUL_LH;
  wire  decode_IS_RS1_SIGNED;
  wire  decode_MEMORY_STORE;
  wire  decode_CSR_WRITE_OPCODE;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_21_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_22_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_23_;
  wire  _zz_24_;
  wire  _zz_25_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_26_;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_BRANCH_DO;
  wire [31:0] _zz_27_;
  wire  execute_IS_RVC;
  wire [31:0] execute_PC;
  wire  execute_BRANCH_COND_RESULT;
  wire  execute_PREDICTION_HAD_BRANCHED2;
  wire  _zz_28_;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_29_;
  wire  _zz_30_;
  wire  _zz_31_;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  reg [31:0] _zz_32_;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  reg [31:0] decode_RS2;
  reg [31:0] decode_RS1;
  wire  execute_IS_RS1_SIGNED;
  wire [31:0] execute_RS1;
  wire  execute_IS_DIV;
  wire  execute_IS_RS2_SIGNED;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_IS_DIV;
  wire  writeBack_IS_MUL;
  wire [33:0] writeBack_MUL_HH;
  wire [51:0] writeBack_MUL_LOW;
  wire [33:0] memory_MUL_HL;
  wire [33:0] memory_MUL_LH;
  wire [31:0] memory_MUL_LL;
  wire [51:0] _zz_33_;
  wire [33:0] _zz_34_;
  wire [33:0] _zz_35_;
  wire [33:0] _zz_36_;
  wire [31:0] _zz_37_;
  wire [31:0] memory_SHIFT_RIGHT;
  reg [31:0] _zz_38_;
  wire `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_39_;
  wire [31:0] _zz_40_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_41_;
  wire  _zz_42_;
  wire [31:0] _zz_43_;
  wire [31:0] _zz_44_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_45_;
  wire [31:0] _zz_46_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_47_;
  wire [31:0] _zz_48_;
  wire [31:0] _zz_49_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_50_;
  wire [31:0] _zz_51_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_52_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_53_;
  wire [31:0] _zz_54_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_55_;
  wire [31:0] _zz_56_;
  wire  _zz_57_;
  reg  _zz_58_;
  wire [31:0] _zz_59_;
  wire [31:0] _zz_60_;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire  _zz_61_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_62_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire  _zz_66_;
  wire  _zz_67_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_68_;
  wire  _zz_69_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_70_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_74_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_75_;
  wire  _zz_76_;
  wire  _zz_77_;
  wire  _zz_78_;
  wire  _zz_79_;
  wire  _zz_80_;
  wire  _zz_81_;
  wire  _zz_82_;
  wire  _zz_83_;
  wire  writeBack_MEMORY_STORE;
  reg [31:0] _zz_84_;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire  memory_MEMORY_STORE;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_85_;
  wire [31:0] execute_SRC_ADD;
  wire [1:0] _zz_86_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_MEMORY_STORE;
  wire  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_87_;
  reg [31:0] _zz_88_;
  reg [31:0] _zz_89_;
  wire [31:0] decode_PC;
  wire [31:0] _zz_90_;
  wire  _zz_91_;
  wire [31:0] _zz_92_;
  wire [31:0] _zz_93_;
  wire [31:0] decode_INSTRUCTION;
  wire [31:0] _zz_94_;
  wire  decode_IS_RVC;
  wire [31:0] writeBack_PC;
  wire [31:0] writeBack_INSTRUCTION;
  reg  decode_arbitration_haltItself;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushAll;
  reg  decode_arbitration_isValid;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  reg  memory_arbitration_flushAll;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  wire  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushAll;
  reg  writeBack_arbitration_isValid;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring;
  wire [31:0] lastStageInstruction /* verilator public */ ;
  wire [31:0] lastStagePc /* verilator public */ ;
  wire  lastStageIsValid /* verilator public */ ;
  wire  lastStageIsFiring /* verilator public */ ;
  reg  IBusSimplePlugin_fetcherHalt;
  reg  IBusSimplePlugin_fetcherflushIt;
  reg  IBusSimplePlugin_incomingInstruction;
  wire  IBusSimplePlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire [31:0] IBusSimplePlugin_pcs_2 /* synthesis syn_keep = 1 */ ;
  wire  IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire  IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire  IBusSimplePlugin_pcValids_0;
  wire  IBusSimplePlugin_pcValids_1;
  wire  IBusSimplePlugin_pcValids_2;
  wire  IBusSimplePlugin_pcValids_3;
  wire  BranchPlugin_jumpInterface_valid;
  wire [31:0] BranchPlugin_jumpInterface_payload;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
//  wire  CsrPlugin_exceptionPendings_0;
//  wire  CsrPlugin_exceptionPendings_1;
//  wire  CsrPlugin_exceptionPendings_2;
//  wire  CsrPlugin_exceptionPendings_3;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  CsrPlugin_forceMachineWire;
  reg  CsrPlugin_allowInterrupts;
  reg  CsrPlugin_allowException;
  reg  IBusSimplePlugin_injectionPort_valid;
  reg  IBusSimplePlugin_injectionPort_ready;
  wire [31:0] IBusSimplePlugin_injectionPort_payload;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [2:0] _zz_95_;
  wire [2:0] _zz_96_;
  wire  _zz_97_;
  wire  _zz_98_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_99_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_100_;
  reg [31:0] IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire [31:0] IBusSimplePlugin_decodePc_pcPlus;
  reg  IBusSimplePlugin_decodePc_injectedDecode;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg  IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_0_inputSample;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_halt;
//  wire  IBusSimplePlugin_iBusRsp_stages_1_inputSample;
  wire  _zz_101_;
  wire  _zz_102_;
  wire  _zz_103_;
  wire  _zz_104_;
  reg  _zz_105_;
  reg  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_output_valid;
  wire  IBusSimplePlugin_iBusRsp_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire  IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire  IBusSimplePlugin_decompressor_inputBeforeStage_valid;
  wire  IBusSimplePlugin_decompressor_inputBeforeStage_ready;
  wire [31:0] IBusSimplePlugin_decompressor_inputBeforeStage_payload_pc;
  wire  IBusSimplePlugin_decompressor_inputBeforeStage_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_decompressor_inputBeforeStage_payload_rsp_inst;
  wire  IBusSimplePlugin_decompressor_inputBeforeStage_payload_isRvc;
  reg  IBusSimplePlugin_decompressor_bufferValid;
  reg [15:0] IBusSimplePlugin_decompressor_bufferData;
  wire [31:0] IBusSimplePlugin_decompressor_raw;
  wire  IBusSimplePlugin_decompressor_isRvc;
  wire [15:0] _zz_106_;
  reg [31:0] IBusSimplePlugin_decompressor_decompressed;
  wire [4:0] _zz_107_;
  wire [4:0] _zz_108_;
  wire [11:0] _zz_109_;
  wire  _zz_110_;
  reg [11:0] _zz_111_;
  wire  _zz_112_;
  reg [9:0] _zz_113_;
  wire [20:0] _zz_114_;
  wire  _zz_115_;
  reg [14:0] _zz_116_;
  wire  _zz_117_;
  reg [2:0] _zz_118_;
  wire  _zz_119_;
  reg [9:0] _zz_120_;
  wire [20:0] _zz_121_;
  wire  _zz_122_;
  reg [4:0] _zz_123_;
  wire [12:0] _zz_124_;
  wire [4:0] _zz_125_;
  wire [4:0] _zz_126_;
  wire [4:0] _zz_127_;
  wire  _zz_128_;
  reg [2:0] _zz_129_;
  reg [2:0] _zz_130_;
  wire  _zz_131_;
  reg [6:0] _zz_132_;
  wire  IBusSimplePlugin_injector_decodeInput_valid;
  wire  IBusSimplePlugin_injector_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire  IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg  _zz_133_;
  reg [31:0] _zz_134_;
  reg  _zz_135_;
  reg [31:0] _zz_136_;
  reg  _zz_137_;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  reg [31:0] IBusSimplePlugin_injector_formal_rawInDecode;
  wire  _zz_138_;
  reg [18:0] _zz_139_;
  wire  _zz_140_;
  reg [10:0] _zz_141_;
  wire  _zz_142_;
  reg [18:0] _zz_143_;
  wire  IBusSimplePlugin_cmd_valid;
  wire  IBusSimplePlugin_cmd_ready;
  wire [31:0] IBusSimplePlugin_cmd_payload_pc;
  wire  IBusSimplePlugin_cmd_s2mPipe_valid;
  wire  IBusSimplePlugin_cmd_s2mPipe_ready;
  wire [31:0] IBusSimplePlugin_cmd_s2mPipe_payload_pc;
  reg  _zz_144_;
  reg [31:0] _zz_145_;
  reg [2:0] IBusSimplePlugin_pendingCmd;
  wire [2:0] IBusSimplePlugin_pendingCmdNext;
  reg [2:0] IBusSimplePlugin_rspJoin_discardCounter;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_valid;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  wire  iBus_rsp_takeWhen_valid;
  wire  iBus_rsp_takeWhen_payload_error;
  wire [31:0] iBus_rsp_takeWhen_payload_inst;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg  IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire  IBusSimplePlugin_rspJoin_join_valid;
  wire  IBusSimplePlugin_rspJoin_join_ready;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_pc;
  wire  IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire  IBusSimplePlugin_rspJoin_exceptionDetected;
  wire  IBusSimplePlugin_rspJoin_redoRequired;
  wire  _zz_146_;
  wire  _zz_147_;
  reg  execute_DBusSimplePlugin_skipCmd;
  reg [31:0] _zz_148_;
  reg [3:0] _zz_149_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_150_;
  reg [31:0] _zz_151_;
  wire  _zz_152_;
  reg [31:0] _zz_153_;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [29:0] _zz_154_;
  wire  _zz_155_;
  wire  _zz_156_;
  wire  _zz_157_;
  wire  _zz_158_;
  wire  _zz_159_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_160_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_161_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_162_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_163_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_164_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_165_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_166_;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  wire  lastStageRegFileWrite_valid /* verilator public */ ;
  wire [4:0] lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire [31:0] lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_167_;
  reg [31:0] _zz_168_;
  wire  _zz_169_;
  reg [19:0] _zz_170_;
  wire  _zz_171_;
  reg [19:0] _zz_172_;
  reg [31:0] _zz_173_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrelShifterPlugin_amplitude;
  reg [31:0] _zz_174_;
  wire [31:0] execute_FullBarrelShifterPlugin_reversed;
  reg [31:0] _zz_175_;
  reg  execute_MulPlugin_aSigned;
  reg  execute_MulPlugin_bSigned;
  wire [31:0] execute_MulPlugin_a;
  wire [31:0] execute_MulPlugin_b;
  wire [15:0] execute_MulPlugin_aULow;
  wire [15:0] execute_MulPlugin_bULow;
  wire [16:0] execute_MulPlugin_aSLow;
  wire [16:0] execute_MulPlugin_bSLow;
  wire [16:0] execute_MulPlugin_aHigh;
  wire [16:0] execute_MulPlugin_bHigh;
  wire [65:0] writeBack_MulPlugin_result;
  reg [32:0] memory_DivPlugin_rs1;
  reg [31:0] memory_DivPlugin_rs2;
  reg [64:0] memory_DivPlugin_accumulator;
  reg  memory_DivPlugin_div_needRevert;
  reg  memory_DivPlugin_div_counter_willIncrement;
  reg  memory_DivPlugin_div_counter_willClear;
  reg [5:0] memory_DivPlugin_div_counter_valueNext;
  reg [5:0] memory_DivPlugin_div_counter_value;
  wire  memory_DivPlugin_div_counter_willOverflowIfInc;
  wire  memory_DivPlugin_div_counter_willOverflow;
  reg  memory_DivPlugin_div_done;
  reg [31:0] memory_DivPlugin_div_result;
  wire [31:0] _zz_176_;
  wire [32:0] _zz_177_;
  wire [32:0] _zz_178_;
  wire [31:0] _zz_179_;
  wire  _zz_180_;
  wire  _zz_181_;
  reg [32:0] _zz_182_;
  reg  _zz_183_;
  reg  _zz_184_;
  wire  _zz_185_;
  reg  _zz_186_;
  reg [4:0] _zz_187_;
  reg [31:0] _zz_188_;
  wire  _zz_189_;
  wire  _zz_190_;
  wire  _zz_191_;
  wire  _zz_192_;
  wire  _zz_193_;
  wire  _zz_194_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_195_;
  reg  _zz_196_;
  reg  _zz_197_;
  wire  execute_BranchPlugin_missAlignedTarget;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_198_;
  reg [19:0] _zz_199_;
  wire  _zz_200_;
  reg [10:0] _zz_201_;
  wire  _zz_202_;
  reg [18:0] _zz_203_;
  wire [31:0] execute_BranchPlugin_branchAdder;
  wire [1:0] CsrPlugin_misa_base;
  wire [25:0] CsrPlugin_misa_extensions;
  reg [1:0] CsrPlugin_mtvec_mode;
  reg [29:0] CsrPlugin_mtvec_base;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg  CsrPlugin_interrupt;
  reg [3:0] CsrPlugin_interruptCode /* verilator public */ ;
  reg [1:0] CsrPlugin_interruptTargetPrivilege;
  wire  CsrPlugin_exception;
  wire  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  wire [1:0] CsrPlugin_targetPrivilege;
  wire [3:0] CsrPlugin_trapCause;
  reg [1:0] CsrPlugin_xtvec_mode;
  reg [29:0] CsrPlugin_xtvec_base;
  wire  execute_CsrPlugin_inWfi /* verilator public */ ;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  wire [31:0] execute_CsrPlugin_readToWriteData;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  reg  DebugPlugin_firstCycle;
  reg  DebugPlugin_secondCycle;
  reg  DebugPlugin_resetIt;
  reg  DebugPlugin_haltIt;
  reg  DebugPlugin_stepIt;
  reg  DebugPlugin_isPipBusy;
  reg  DebugPlugin_godmode;
  reg  DebugPlugin_haltedByBreak;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_204_;
  reg  _zz_205_;
  reg  DebugPlugin_resetIt_regNext;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_MEMORY_STORE;
  reg  execute_to_memory_MEMORY_STORE;
  reg  memory_to_writeBack_MEMORY_STORE;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg [31:0] decode_to_execute_RS1;
  reg [33:0] execute_to_memory_MUL_LH;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg [51:0] memory_to_writeBack_MUL_LOW;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg [33:0] execute_to_memory_MUL_HL;
  reg  decode_to_execute_IS_RVC;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg [31:0] decode_to_execute_SRC1;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  execute_to_memory_BRANCH_DO;
  reg  decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg [31:0] execute_to_memory_SHIFT_RIGHT;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [31:0] decode_to_execute_RS2;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg [31:0] memory_to_writeBack_MEMORY_READ_DATA;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg [33:0] execute_to_memory_MUL_HH;
  reg [33:0] memory_to_writeBack_MUL_HH;
  reg [31:0] execute_to_memory_MUL_LL;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_DO_EBREAK;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  memory_to_writeBack_IS_MUL;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [31:0] decode_to_execute_SRC2;
  reg [2:0] _zz_206_;
  `ifndef SYNTHESIS
  reg [31:0] _zz_1__string;
  reg [31:0] _zz_2__string;
  reg [71:0] _zz_3__string;
  reg [71:0] _zz_4__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_5__string;
  reg [71:0] _zz_6__string;
  reg [71:0] _zz_7__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_8__string;
  reg [63:0] _zz_9__string;
  reg [63:0] _zz_10__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_11__string;
  reg [39:0] _zz_12__string;
  reg [39:0] _zz_13__string;
  reg [31:0] _zz_14__string;
  reg [31:0] _zz_15__string;
  reg [31:0] _zz_16__string;
  reg [31:0] _zz_17__string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_18__string;
  reg [31:0] _zz_19__string;
  reg [31:0] _zz_20__string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_22__string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_23__string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_26__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_29__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_39__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_41__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_47__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_50__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_53__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_55__string;
  reg [71:0] _zz_62__string;
  reg [39:0] _zz_63__string;
  reg [95:0] _zz_68__string;
  reg [31:0] _zz_70__string;
  reg [31:0] _zz_71__string;
  reg [63:0] _zz_74__string;
  reg [23:0] _zz_75__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_87__string;
  reg [23:0] _zz_160__string;
  reg [63:0] _zz_161__string;
  reg [31:0] _zz_162__string;
  reg [31:0] _zz_163__string;
  reg [95:0] _zz_164__string;
  reg [39:0] _zz_165__string;
  reg [71:0] _zz_166__string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  
  
	initial begin
		
  	_zz_208_	= 0;
  	_zz_209_	= 0;
  	_zz_210_	= 0;
  	_zz_32_		= 0;
  	_zz_38_		= 0;
  	_zz_58_		= 0;
  	_zz_84_		= 0;
  	_zz_88_		= 0;
  	_zz_89_		= 0;
  	_zz_100_	= 0;
  	_zz_105_	= 0;
  	_zz_111_	= 0;
  	_zz_113_	= 0;
  	_zz_116_	= 0;
  	_zz_118_	= 0;
  	_zz_120_	= 0;
  	_zz_123_	= 0;
  	_zz_129_	= 0;
  	_zz_130_	= 0;
  	_zz_132_	= 0;
  	_zz_133_	= 0;
  	_zz_134_	= 0;
  	_zz_135_	= 0;
  	_zz_136_	= 0;
  	_zz_137_	= 0;
  	_zz_139_	= 0;
  	_zz_141_	= 0;
  	_zz_143_	= 0;
  	_zz_144_	= 0;
  	_zz_145_	= 0;
  	_zz_148_	= 0;
  	_zz_149_	= 0;
  	_zz_151_	= 0;
  	_zz_153_	= 0;
  	_zz_167_	= 0;
  	_zz_168_	= 0;
  	_zz_170_	= 0;
  	_zz_172_	= 0;
  	_zz_173_	= 0;
  	_zz_174_	= 0;
  	_zz_175_	= 0;
  	_zz_182_	= 0;
  	_zz_183_	= 0;
  	_zz_184_	= 0;
  	_zz_186_	= 0;
  	_zz_187_	= 0;
  	_zz_188_	= 0;
  	_zz_196_	= 0;
  	_zz_197_	= 0;
  	_zz_199_	= 0;
  	_zz_201_	= 0;
  	_zz_203_	= 0;
  	_zz_204_	= 0;
  	_zz_205_	= 0;
  	_zz_206_	= 0;
  	decode_RS2= 0;
  	decode_RS1= 0;
  	decode_REGFILE_WRITE_VALID			= 0;
  	decode_arbitration_haltItself		= 0;
  	decode_arbitration_haltByOther	= 0;
  	decode_arbitration_removeIt			= 0;
  	decode_arbitration_isValid			= 0;
  	decode_to_execute_MEMORY_STORE	= 0;
  	decode_to_execute_RS1						= 0;
  	decode_to_execute_RS2						= 0;
  	decode_to_execute_SRC1					= 0;
  	decode_to_execute_SRC2					= 0;
  	decode_to_execute_PC						= 0;
  	decode_to_execute_IS_CSR				= 0;
  	decode_to_execute_IS_MUL				= 0;
  	decode_to_execute_IS_RVC				= 0;
  	decode_to_execute_IS_DIV				= 0;
  	decode_to_execute_IS_RS1_SIGNED	= 0;
  	decode_to_execute_IS_RS2_SIGNED	= 0;
  	decode_to_execute_ENV_CTRL			= 0;
  	decode_to_execute_SRC_LESS_UNSIGNED		= 0;
  	decode_to_execute_SRC_USE_SUB_LESS		= 0;
  	decode_to_execute_SRC2_FORCE_ZERO			= 0;
  	decode_to_execute_CSR_READ_OPCODE			= 0;
  	decode_to_execute_INSTRUCTION					= 0;
  	decode_to_execute_REGFILE_WRITE_VALID	= 0;
  	decode_to_execute_ALU_BITWISE_CTRL		= 0;
  	decode_to_execute_ALU_CTRL					= 0;
  	decode_to_execute_SHIFT_CTRL				= 0;
  	decode_to_execute_BRANCH_CTRL				= 0;
  	decode_to_execute_FORMAL_PC_NEXT		= 0;
  	decode_to_execute_DO_EBREAK					= 0;
  	decode_to_execute_MEMORY_ENABLE			= 0;
  	decode_to_execute_CSR_WRITE_OPCODE	= 0;
  	decode_to_execute_PREDICTION_HAD_BRANCHED2	= 0;
  	decode_to_execute_BYPASSABLE_MEMORY_STAGE		= 0;
  	decode_to_execute_BYPASSABLE_EXECUTE_STAGE	= 0;
  	
  	writeBack_arbitration_removeIt	= 0;
  	writeBack_arbitration_isValid		= 0;
  	CsrPlugin_jumpInterface_valid		= 0;
  	CsrPlugin_jumpInterface_payload	= 0;
  	CsrPlugin_privilege							= 0;
  	CsrPlugin_forceMachineWire			= 0;
  	CsrPlugin_allowInterrupts				= 0;
  	CsrPlugin_allowException				= 0;
  	
  	IBusSimplePlugin_fetcherHalt				 	= 0;
  	IBusSimplePlugin_fetcherflushIt			 	= 0;
  	IBusSimplePlugin_incomingInstruction 	= 0;
  	IBusSimplePlugin_injectionPort_valid 	= 0;
  	IBusSimplePlugin_injectionPort_ready 	= 0;
  	IBusSimplePlugin_fetchPc_pcReg 				= 0;
  	IBusSimplePlugin_fetchPc_inc					= 0;
  	IBusSimplePlugin_fetchPc_propagatePc	= 0;
  	IBusSimplePlugin_fetchPc_pc						= 0;
  	IBusSimplePlugin_fetchPc_samplePcNext					= 0;
  	IBusSimplePlugin_decodePc_pcReg								= 0;
  	IBusSimplePlugin_decodePc_injectedDecode			= 0;
  	IBusSimplePlugin_iBusRsp_stages_0_halt				= 0;
  	IBusSimplePlugin_iBusRsp_readyForError				= 0;
  	IBusSimplePlugin_decompressor_bufferValid			= 0;
  	IBusSimplePlugin_decompressor_bufferData			= 0;
  	IBusSimplePlugin_decompressor_decompressed		= 0;
  	IBusSimplePlugin_injector_nextPcCalc_valids_0	= 0;
  	IBusSimplePlugin_injector_nextPcCalc_valids_1	= 0;
  	IBusSimplePlugin_injector_nextPcCalc_valids_2	= 0;
  	IBusSimplePlugin_injector_nextPcCalc_valids_3	= 0;
  	IBusSimplePlugin_injector_decodeRemoved				= 0;
  	IBusSimplePlugin_injector_formal_rawInDecode	= 0;
  	IBusSimplePlugin_pendingCmd										= 0;
  	IBusSimplePlugin_rspJoin_discardCounter				= 0;
  	
  	execute_DBusSimplePlugin_skipCmd				= 0;
  	writeBack_DBusSimplePlugin_rspShifted		= 0;
  	writeBack_DBusSimplePlugin_rspFormated	= 0;
  	CsrPlugin_mtvec_mode						= 0;
  	CsrPlugin_mtvec_base						= 0;
  	CsrPlugin_mepc									= 0;
  	CsrPlugin_mstatus_MIE						= 0;
  	CsrPlugin_mstatus_MPIE					= 0;
  	CsrPlugin_mstatus_MPP						= 0;
  	CsrPlugin_mip_MEIP							= 0;
  	CsrPlugin_mip_MTIP							= 0;
  	CsrPlugin_mip_MSIP							= 0;
  	CsrPlugin_mie_MEIE							= 0;
  	CsrPlugin_mie_MTIE							= 0;
  	CsrPlugin_mie_MSIE							= 0;
  	CsrPlugin_mcause_interrupt			= 0;
  	CsrPlugin_mcause_exceptionCode	= 0;
  	CsrPlugin_mtval						 = 0;
  	CsrPlugin_mcycle					 = 0;
  	CsrPlugin_minstret 				 = 0;
  	CsrPlugin_interrupt				 = 0;
  	CsrPlugin_interruptCode		 = 0;
  	CsrPlugin_interruptTargetPrivilege = 0;
  	CsrPlugin_pipelineLiberator_done	 = 0;
  	CsrPlugin_hadException			= 0;
  	CsrPlugin_xtvec_mode				= 0;
  	CsrPlugin_xtvec_base				= 0;
  	DebugPlugin_firstCycle			= 0;
  	DebugPlugin_secondCycle			= 0;
  	DebugPlugin_resetIt					= 0;
  	DebugPlugin_haltIt					= 0;
  	DebugPlugin_stepIt					= 0;
  	DebugPlugin_isPipBusy				= 0;
  	DebugPlugin_godmode					= 0;
  	DebugPlugin_haltedByBreak		= 0;
  	DebugPlugin_busReadDataReg	= 0;
  	DebugPlugin_resetIt_regNext	= 0;
  	
  	execute_arbitration_haltItself	= 0;
  	execute_arbitration_haltByOther	= 0;
  	execute_arbitration_removeIt		= 0;
  	execute_arbitration_flushAll		= 0;
  	execute_arbitration_isValid			= 0;
  	
  	execute_IntAluPlugin_bitwise		= 0;
  	execute_SrcPlugin_addSub				= 0;
  	execute_MulPlugin_aSigned				= 0;
  	execute_MulPlugin_bSigned				= 0;
  	execute_BranchPlugin_branch_src1= 0;
  	execute_BranchPlugin_branch_src2= 0;
  	
  	execute_CsrPlugin_illegalAccess			= 0;
  	execute_CsrPlugin_illegalInstruction= 0;
  	execute_CsrPlugin_readData					= 0;
  	execute_CsrPlugin_writeData					= 0; 
  	                            				
  	execute_to_memory_BYPASSABLE_MEMORY_STAGE	= 0;
  	execute_to_memory_MEMORY_ADDRESS_LOW			= 0;
  	execute_to_memory_REGFILE_WRITE_VALID			= 0;
  	execute_to_memory_REGFILE_WRITE_DATA			= 0;
  	execute_to_memory_MEMORY_STORE		= 0;
  	execute_to_memory_BRANCH_CALC			= 0;
  	execute_to_memory_INSTRUCTION			= 0;
  	execute_to_memory_ENV_CTRL				= 0;
  	execute_to_memory_BRANCH_DO				= 0;
  	execute_to_memory_SHIFT_CTRL			= 0;
  	execute_to_memory_SHIFT_RIGHT			= 0;
  	execute_to_memory_FORMAL_PC_NEXT	= 0;
  	execute_to_memory_MEMORY_ENABLE		= 0;
  	execute_to_memory_IS_MUL	= 0;
  	execute_to_memory_IS_DIV	= 0;
  	execute_to_memory_MUL_LH	= 0;
  	execute_to_memory_MUL_HL	= 0;
  	execute_to_memory_MUL_HH	= 0;
  	execute_to_memory_MUL_LL	= 0;
  	execute_to_memory_PC			= 0;
  	
  	memory_arbitration_haltItself	= 0;
  	memory_arbitration_removeIt		= 0;
  	memory_arbitration_flushAll		= 0;
  	memory_arbitration_isValid		= 0;
  	memory_DivPlugin_rs1						= 0;
  	memory_DivPlugin_rs2						= 0;
  	memory_DivPlugin_accumulator		= 0;
  	memory_DivPlugin_div_needRevert = 0;
  	memory_DivPlugin_div_counter_willIncrement= 0;
  	memory_DivPlugin_div_counter_willClear		= 0;
  	memory_DivPlugin_div_counter_valueNext		= 0;
  	memory_DivPlugin_div_counter_value				= 0;
  	memory_DivPlugin_div_done									= 0;
  	memory_DivPlugin_div_result								= 0;
  	memory_to_writeBack_MEMORY_STORE				= 0;
  	memory_to_writeBack_MEMORY_ENABLE				= 0;
  	memory_to_writeBack_MEMORY_READ_DATA		= 0;
  	memory_to_writeBack_MEMORY_ADDRESS_LOW	= 0;
  	
  	memory_to_writeBack_PC							= 0;
  	memory_to_writeBack_FORMAL_PC_NEXT	= 0;
  	memory_to_writeBack_IS_MUL			= 0;
  	memory_to_writeBack_MUL_LOW			= 0;
  	memory_to_writeBack_MUL_HH			= 0;
  	memory_to_writeBack_ENV_CTRL		= 0;
  	memory_to_writeBack_INSTRUCTION	= 0;
  	memory_to_writeBack_REGFILE_WRITE_VALID	= 0;
  	memory_to_writeBack_REGFILE_WRITE_DATA	= 0;
  	`ifndef SYNTHESIS
  		_zz_1__string		= 0;
  		_zz_2__string		= 0;
  		_zz_3__string		= 0;
  		_zz_4__string		= 0;
  		_zz_5__string		= 0;
  		_zz_6__string		= 0;
  		_zz_7__string		= 0;
  		_zz_8__string		= 0;
  		_zz_9__string		= 0;
  		_zz_10__string	= 0;
  		_zz_11__string	= 0;
  		_zz_12__string	= 0;
  		_zz_13__string	= 0;
  		_zz_14__string	= 0;
  		_zz_15__string	= 0;
  		_zz_16__string	= 0;
  		_zz_17__string	= 0;
  		_zz_18__string	= 0;
  		_zz_19__string	= 0;
  		_zz_20__string	= 0;
  		_zz_22__string	= 0;
  		_zz_23__string	= 0;
  		_zz_26__string	= 0;
  		_zz_29__string	= 0;
  		_zz_39__string	= 0;
  		_zz_41__string	= 0;
  		_zz_47__string	= 0;
  		_zz_50__string	= 0;
  		_zz_53__string	= 0;
  		_zz_55__string	= 0;
  		_zz_62__string	= 0;
  		_zz_63__string	= 0;
  		_zz_68__string	= 0;
  		_zz_70__string	= 0;
  		_zz_71__string	= 0;
  		_zz_74__string	= 0;
  		_zz_75__string	= 0;
  		_zz_87__string	= 0;
  		_zz_160__string	= 0;
  		_zz_161__string	= 0;
  		_zz_162__string	= 0;
  		_zz_163__string	= 0;
  		_zz_164__string	= 0;
  		_zz_165__string	= 0;
  		_zz_166__string	= 0;
  		memory_ENV_CTRL_string							= 0;
  		memory_SHIFT_CTRL_string						= 0;
  		memory_to_writeBack_ENV_CTRL_string	= 0;
  		decode_SRC1_CTRL_string					= 0;
  		decode_SHIFT_CTRL_string				= 0;
  		decode_ALU_CTRL_string					= 0;
  		decode_ALU_BITWISE_CTRL_string	= 0;
  		decode_ENV_CTRL_string		= 0;
  		decode_SRC2_CTRL_string		= 0;
 			decode_SRC1_CTRL_string		= 0;
  		decode_BRANCH_CTRL_string	= 0;
  		decode_to_execute_ENV_CTRL_string					= 0;
  		decode_to_execute_ALU_CTRL_string					= 0;
  		decode_to_execute_SHIFT_CTRL_string				= 0;
  		decode_to_execute_BRANCH_CTRL_string			= 0;
  		decode_to_execute_ALU_BITWISE_CTRL_string	= 0;
  		execute_ENV_CTRL_string			= 0;
  		execute_BRANCH_CTRL_string	= 0;
  		execute_SHIFT_CTRL_string		= 0;
  		execute_ALU_CTRL_string			= 0;
  		execute_ALU_BITWISE_CTRL_string			= 0;
  		execute_to_memory_ENV_CTRL_string		= 0;
  		execute_to_memory_SHIFT_CTRL_string	= 0;
  		writeBack_ENV_CTRL_string						= 0;
  	`endif
	end
	
  assign _zz_211_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_212_ = (! memory_DivPlugin_div_done);
  assign _zz_213_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_214_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_215_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_216_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_217_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_218_ = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_219_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_220_ = (! memory_arbitration_isStuck);
  assign _zz_221_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_222_ = (IBusSimplePlugin_iBusRsp_output_valid && IBusSimplePlugin_iBusRsp_output_ready);
  assign _zz_223_ = (IBusSimplePlugin_cmd_ready && (! IBusSimplePlugin_cmd_s2mPipe_ready));
  assign _zz_224_ = {_zz_106_[1 : 0],_zz_106_[15 : 13]};
  assign _zz_225_ = _zz_106_[6 : 5];
  assign _zz_226_ = _zz_106_[11 : 10];
  assign _zz_227_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_228_ = execute_INSTRUCTION[13 : 12];
  assign _zz_229_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_230_ = execute_INSTRUCTION[13];
  assign _zz_231_ = (_zz_95_ - (3'b001));
  assign _zz_232_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_233_ = {29'd0, _zz_232_};
  assign _zz_234_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_235_ = {29'd0, _zz_234_};
  assign _zz_236_ = {{_zz_116_,_zz_106_[6 : 2]},(12'b000000000000)};
  assign _zz_237_ = {{{(4'b0000),_zz_106_[8 : 7]},_zz_106_[12 : 9]},(2'b00)};
  assign _zz_238_ = {{{(4'b0000),_zz_106_[8 : 7]},_zz_106_[12 : 9]},(2'b00)};
  assign _zz_239_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_240_ = {29'd0, _zz_239_};
  assign _zz_241_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_242_ = {{_zz_139_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_243_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_244_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_245_ = (IBusSimplePlugin_pendingCmd + _zz_247_);
  assign _zz_246_ = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign _zz_247_ = {2'd0, _zz_246_};
  assign _zz_248_ = iBus_rsp_valid;
  assign _zz_249_ = {2'd0, _zz_248_};
  assign _zz_250_ = (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (3'b000)));
  assign _zz_251_ = {2'd0, _zz_250_};
  assign _zz_252_ = iBus_rsp_valid;
  assign _zz_253_ = {2'd0, _zz_252_};
  assign _zz_254_ = _zz_154_[0 : 0];
  assign _zz_255_ = _zz_154_[1 : 1];
  assign _zz_256_ = _zz_154_[2 : 2];
  assign _zz_257_ = _zz_154_[3 : 3];
  assign _zz_258_ = _zz_154_[4 : 4];
  assign _zz_259_ = _zz_154_[5 : 5];
  assign _zz_260_ = _zz_154_[6 : 6];
  assign _zz_261_ = _zz_154_[7 : 7];
  assign _zz_262_ = _zz_154_[13 : 13];
  assign _zz_263_ = _zz_154_[14 : 14];
  assign _zz_264_ = _zz_154_[18 : 18];
  assign _zz_265_ = _zz_154_[21 : 21];
  assign _zz_266_ = _zz_154_[22 : 22];
  assign _zz_267_ = _zz_154_[23 : 23];
  assign _zz_268_ = _zz_154_[24 : 24];
  assign _zz_269_ = _zz_154_[29 : 29];
  assign _zz_270_ = execute_SRC_LESS;
  assign _zz_271_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_272_ = decode_INSTRUCTION[19 : 15];
  assign _zz_273_ = decode_INSTRUCTION[31 : 20];
  assign _zz_274_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_275_ = ($signed(_zz_276_) + $signed(_zz_279_));
  assign _zz_276_ = ($signed(_zz_277_) + $signed(_zz_278_));
  assign _zz_277_ = execute_SRC1;
  assign _zz_278_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_279_ = (execute_SRC_USE_SUB_LESS ? _zz_280_ : _zz_281_);
  assign _zz_280_ = (32'b00000000000000000000000000000001);
  assign _zz_281_ = (32'b00000000000000000000000000000000);
  assign _zz_282_ = ($signed(_zz_284_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_283_ = _zz_282_[31 : 0];
  assign _zz_284_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_285_ = ($signed(_zz_286_) + $signed(_zz_291_));
  assign _zz_286_ = ($signed(_zz_287_) + $signed(_zz_289_));
  assign _zz_287_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_288_ = {1'b0,memory_MUL_LL};
  assign _zz_289_ = {{19{_zz_288_[32]}}, _zz_288_};
  assign _zz_290_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_291_ = {{2{_zz_290_[49]}}, _zz_290_};
  assign _zz_292_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_293_ = {{2{_zz_292_[49]}}, _zz_292_};
  assign _zz_294_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_295_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_296_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_297_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_298_ = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_299_ = {5'd0, _zz_298_};
  assign _zz_300_ = {1'd0, memory_DivPlugin_rs2};
  assign _zz_301_ = {_zz_176_,(! _zz_178_[32])};
  assign _zz_302_ = _zz_178_[31:0];
  assign _zz_303_ = _zz_177_[31:0];
  assign _zz_304_ = _zz_305_;
  assign _zz_305_ = _zz_306_;
  assign _zz_306_ = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_179_) : _zz_179_)} + _zz_308_);
  assign _zz_307_ = memory_DivPlugin_div_needRevert;
  assign _zz_308_ = {32'd0, _zz_307_};
  assign _zz_309_ = _zz_181_;
  assign _zz_310_ = {32'd0, _zz_309_};
  assign _zz_311_ = _zz_180_;
  assign _zz_312_ = {31'd0, _zz_311_};
  assign _zz_313_ = execute_INSTRUCTION[31 : 20];
  assign _zz_314_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_315_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_316_ = (execute_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_317_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_318_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_319_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_320_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_321_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_322_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_323_ = 1'b1;
  assign _zz_324_ = 1'b1;
  assign _zz_325_ = {_zz_98_,_zz_97_};
  assign _zz_326_ = (_zz_106_[11 : 10] == (2'b01));
  assign _zz_327_ = ((_zz_106_[11 : 10] == (2'b11)) && (_zz_106_[6 : 5] == (2'b00)));
  assign _zz_328_ = (7'b0000000);
  assign _zz_329_ = _zz_106_[6 : 2];
  assign _zz_330_ = _zz_106_[12];
  assign _zz_331_ = _zz_106_[11 : 7];
  assign _zz_332_ = decode_INSTRUCTION[31];
  assign _zz_333_ = decode_INSTRUCTION[19 : 12];
  assign _zz_334_ = decode_INSTRUCTION[20];
  assign _zz_335_ = decode_INSTRUCTION[31];
  assign _zz_336_ = decode_INSTRUCTION[7];
  assign _zz_337_ = (32'b00000010000000000100000001100100);
  assign _zz_338_ = ((decode_INSTRUCTION & (32'b00000000000000000111000000110100)) == (32'b00000000000000000101000000010000));
  assign _zz_339_ = ((decode_INSTRUCTION & (32'b00000010000000000111000001100100)) == (32'b00000000000000000101000000100000));
  assign _zz_340_ = ((decode_INSTRUCTION & _zz_347_) == (32'b01000000000000000001000000010000));
  assign _zz_341_ = {(_zz_348_ == _zz_349_),(_zz_350_ == _zz_351_)};
  assign _zz_342_ = ((decode_INSTRUCTION & _zz_352_) == (32'b00000000000000000001000000000000));
  assign _zz_343_ = (1'b0);
  assign _zz_344_ = ((_zz_353_ == _zz_354_) != (1'b0));
  assign _zz_345_ = ({_zz_355_,_zz_356_} != (4'b0000));
  assign _zz_346_ = {(_zz_357_ != _zz_358_),{_zz_359_,{_zz_360_,_zz_361_}}};
  assign _zz_347_ = (32'b01000000000000000011000001010100);
  assign _zz_348_ = (decode_INSTRUCTION & (32'b00000000000000000111000000110100));
  assign _zz_349_ = (32'b00000000000000000001000000010000);
  assign _zz_350_ = (decode_INSTRUCTION & (32'b00000010000000000111000001010100));
  assign _zz_351_ = (32'b00000000000000000001000000010000);
  assign _zz_352_ = (32'b00000000000000000001000000000000);
  assign _zz_353_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_354_ = (32'b00000000000000000010000000000000);
  assign _zz_355_ = ((decode_INSTRUCTION & _zz_362_) == (32'b00000000000000000000000000000000));
  assign _zz_356_ = {(_zz_363_ == _zz_364_),{_zz_157_,_zz_365_}};
  assign _zz_357_ = {_zz_156_,{_zz_366_,{_zz_367_,_zz_368_}}};
  assign _zz_358_ = (5'b00000);
  assign _zz_359_ = ({_zz_369_,{_zz_370_,_zz_371_}} != (3'b000));
  assign _zz_360_ = ({_zz_372_,_zz_373_} != (2'b00));
  assign _zz_361_ = {(_zz_374_ != _zz_375_),{_zz_376_,{_zz_377_,_zz_378_}}};
  assign _zz_362_ = (32'b00000000000000000000000001000100);
  assign _zz_363_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_364_ = (32'b00000000000000000000000000000000);
  assign _zz_365_ = ((decode_INSTRUCTION & _zz_379_) == (32'b00000000000000000001000000000000));
  assign _zz_366_ = ((decode_INSTRUCTION & _zz_380_) == (32'b00000000000000000010000000010000));
  assign _zz_367_ = (_zz_381_ == _zz_382_);
  assign _zz_368_ = {_zz_383_,_zz_384_};
  assign _zz_369_ = ((decode_INSTRUCTION & _zz_385_) == (32'b00000000000000000000000001000000));
  assign _zz_370_ = (_zz_386_ == _zz_387_);
  assign _zz_371_ = (_zz_388_ == _zz_389_);
  assign _zz_372_ = (_zz_390_ == _zz_391_);
  assign _zz_373_ = (_zz_392_ == _zz_393_);
  assign _zz_374_ = {_zz_394_,_zz_159_};
  assign _zz_375_ = (2'b00);
  assign _zz_376_ = ({_zz_395_,_zz_396_} != (2'b00));
  assign _zz_377_ = (_zz_397_ != _zz_398_);
  assign _zz_378_ = {_zz_399_,{_zz_400_,_zz_401_}};
  assign _zz_379_ = (32'b00000000000000000101000000000100);
  assign _zz_380_ = (32'b00000000000000000010000000110000);
  assign _zz_381_ = (decode_INSTRUCTION & (32'b00000000000000000001000000110000));
  assign _zz_382_ = (32'b00000000000000000000000000010000);
  assign _zz_383_ = ((decode_INSTRUCTION & _zz_402_) == (32'b00000000000000000010000000100000));
  assign _zz_384_ = ((decode_INSTRUCTION & _zz_403_) == (32'b00000000000000000000000000100000));
  assign _zz_385_ = (32'b00000000000000000000000001000100);
  assign _zz_386_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_387_ = (32'b00000000000000000010000000010000);
  assign _zz_388_ = (decode_INSTRUCTION & (32'b01000000000000000000000000110100));
  assign _zz_389_ = (32'b01000000000000000000000000110000);
  assign _zz_390_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_391_ = (32'b00000000000000000010000000000000);
  assign _zz_392_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_393_ = (32'b00000000000000000001000000000000);
  assign _zz_394_ = ((decode_INSTRUCTION & _zz_404_) == (32'b00000000000000000000000000000100));
  assign _zz_395_ = (_zz_405_ == _zz_406_);
  assign _zz_396_ = _zz_159_;
  assign _zz_397_ = (_zz_407_ == _zz_408_);
  assign _zz_398_ = (1'b0);
  assign _zz_399_ = ({_zz_409_,_zz_410_} != (2'b00));
  assign _zz_400_ = (_zz_411_ != _zz_412_);
  assign _zz_401_ = {_zz_413_,{_zz_414_,_zz_415_}};
  assign _zz_402_ = (32'b00000010000000000010000001100000);
  assign _zz_403_ = (32'b00000010000000000011000000100000);
  assign _zz_404_ = (32'b00000000000000000000000000010100);
  assign _zz_405_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_406_ = (32'b00000000000000000000000000000100);
  assign _zz_407_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_408_ = (32'b00000000000000000000000000000000);
  assign _zz_409_ = _zz_158_;
  assign _zz_410_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000011100)) == (32'b00000000000000000000000000000100));
  assign _zz_411_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000001000000));
  assign _zz_412_ = (1'b0);
  assign _zz_413_ = (((decode_INSTRUCTION & _zz_416_) == (32'b00000000000000000000000001010000)) != (1'b0));
  assign _zz_414_ = (_zz_155_ != (1'b0));
  assign _zz_415_ = {({_zz_417_,_zz_418_} != (6'b000000)),{(_zz_419_ != _zz_420_),{_zz_421_,{_zz_422_,_zz_423_}}}};
  assign _zz_416_ = (32'b00000000000100000011000001010000);
  assign _zz_417_ = _zz_158_;
  assign _zz_418_ = {(_zz_424_ == _zz_425_),{_zz_426_,{_zz_427_,_zz_428_}}};
  assign _zz_419_ = {(_zz_429_ == _zz_430_),(_zz_431_ == _zz_432_)};
  assign _zz_420_ = (2'b00);
  assign _zz_421_ = ((_zz_433_ == _zz_434_) != (1'b0));
  assign _zz_422_ = (_zz_157_ != (1'b0));
  assign _zz_423_ = {(_zz_435_ != _zz_436_),{_zz_437_,{_zz_438_,_zz_439_}}};
  assign _zz_424_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_425_ = (32'b00000000000000000001000000010000);
  assign _zz_426_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010000)) == (32'b00000000000000000010000000010000));
  assign _zz_427_ = ((decode_INSTRUCTION & _zz_440_) == (32'b00000000000000000000000000010000));
  assign _zz_428_ = {(_zz_441_ == _zz_442_),(_zz_443_ == _zz_444_)};
  assign _zz_429_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_430_ = (32'b00000000000000000000000001000000);
  assign _zz_431_ = (decode_INSTRUCTION & (32'b00000000000100000011000001000000));
  assign _zz_432_ = (32'b00000000000000000000000001000000);
  assign _zz_433_ = (decode_INSTRUCTION & (32'b00000000000000000100000000000100));
  assign _zz_434_ = (32'b00000000000000000100000000000000);
  assign _zz_435_ = {_zz_156_,(_zz_445_ == _zz_446_)};
  assign _zz_436_ = (2'b00);
  assign _zz_437_ = ({_zz_156_,_zz_447_} != (2'b00));
  assign _zz_438_ = (_zz_448_ != (1'b0));
  assign _zz_439_ = {(_zz_449_ != _zz_450_),{_zz_451_,{_zz_452_,_zz_453_}}};
  assign _zz_440_ = (32'b00000000000000000000000001010000);
  assign _zz_441_ = (decode_INSTRUCTION & (32'b00000000000000000000000000001100));
  assign _zz_442_ = (32'b00000000000000000000000000000100);
  assign _zz_443_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign _zz_444_ = (32'b00000000000000000000000000000000);
  assign _zz_445_ = (decode_INSTRUCTION & (32'b00000000000000000000000001110000));
  assign _zz_446_ = (32'b00000000000000000000000000100000);
  assign _zz_447_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_448_ = ((decode_INSTRUCTION & (32'b00010000000000000011000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_449_ = ((decode_INSTRUCTION & _zz_454_) == (32'b00000000000000000000000000100000));
  assign _zz_450_ = (1'b0);
  assign _zz_451_ = ((_zz_455_ == _zz_456_) != (1'b0));
  assign _zz_452_ = ({_zz_457_,_zz_458_} != (5'b00000));
  assign _zz_453_ = {(_zz_459_ != _zz_460_),{_zz_461_,{_zz_462_,_zz_463_}}};
  assign _zz_454_ = (32'b00000000000000000000000000100000);
  assign _zz_455_ = (decode_INSTRUCTION & (32'b00000010000000000100000001110100));
  assign _zz_456_ = (32'b00000010000000000000000000110000);
  assign _zz_457_ = ((decode_INSTRUCTION & _zz_464_) == (32'b00000000000000000000000001000000));
  assign _zz_458_ = {_zz_156_,{_zz_465_,{_zz_466_,_zz_467_}}};
  assign _zz_459_ = {(_zz_468_ == _zz_469_),(_zz_470_ == _zz_471_)};
  assign _zz_460_ = (2'b00);
  assign _zz_461_ = ({_zz_472_,_zz_473_} != (2'b00));
  assign _zz_462_ = (_zz_155_ != (1'b0));
  assign _zz_463_ = (_zz_474_ != (1'b0));
  assign _zz_464_ = (32'b00000000000000000000000001000000);
  assign _zz_465_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000100000)) == (32'b00000000000000000100000000100000));
  assign _zz_466_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110000)) == (32'b00000000000000000000000000010000));
  assign _zz_467_ = ((decode_INSTRUCTION & (32'b00000010000000000000000000100000)) == (32'b00000000000000000000000000100000));
  assign _zz_468_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_469_ = (32'b00000000000000000001000001010000);
  assign _zz_470_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_471_ = (32'b00000000000000000010000001010000);
  assign _zz_472_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110100)) == (32'b00000000000000000000000000100000));
  assign _zz_473_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100000));
  assign _zz_474_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign _zz_475_ = execute_INSTRUCTION[31];
  assign _zz_476_ = execute_INSTRUCTION[31];
  assign _zz_477_ = execute_INSTRUCTION[7];
  
 	integer i;
  initial begin  	
  	for (i=0;i<32;i=i+1)  	RegFilePlugin_regFile[i] = 32'h0;
  end
  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_58_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_323_) begin
      _zz_208_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_324_) begin
      _zz_209_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid(iBus_rsp_takeWhen_valid),
    .io_push_ready(IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready),
    .io_push_payload_error(iBus_rsp_takeWhen_payload_error),
    .io_push_payload_inst(iBus_rsp_takeWhen_payload_inst),
    .io_pop_valid(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid),
    .io_pop_ready(IBusSimplePlugin_rspJoin_rspBufferOutput_ready),
    .io_pop_payload_error(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error),
    .io_pop_payload_inst(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst),
    .io_flush(_zz_207_),
    .io_occupancy(IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  always @( * ) begin
    case(_zz_325_)
      2'b00 : begin
        _zz_210_ = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_210_ = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_210_ = IBusSimplePlugin_pcs_2;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @( * ) begin
    case(_zz_1_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_1__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_1__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_1__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_1__string = "JALR";
      default : _zz_1__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_2_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_2__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_2__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_2__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_2__string = "JALR";
      default : _zz_2__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_3_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_3__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_3__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_3__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_3__string = "SRA_1    ";
      default : _zz_3__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_4_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_4__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_4__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_4__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_4__string = "SRA_1    ";
      default : _zz_4__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_5_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_5__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_5__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_5__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_5__string = "SRA_1    ";
      default : _zz_5__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_6_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_6__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_6__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_6__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_6__string = "SRA_1    ";
      default : _zz_6__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_7_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_7__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_7__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_7__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_7__string = "SRA_1    ";
      default : _zz_7__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @( * ) begin
    case(_zz_8_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_8__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_8__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_8__string = "BITWISE ";
      default : _zz_8__string = "????????";
    endcase
  end
  always @( * ) begin
    case(_zz_9_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_9__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_9__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_9__string = "BITWISE ";
      default : _zz_9__string = "????????";
    endcase
  end
  always @( * ) begin
    case(_zz_10_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_10__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_10__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_10__string = "BITWISE ";
      default : _zz_10__string = "????????";
    endcase
  end
  always @( * ) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_11_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11__string = "AND_1";
      default : _zz_11__string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_12_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_12__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_12__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_12__string = "AND_1";
      default : _zz_12__string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_13_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_13__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_13__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_13__string = "AND_1";
      default : _zz_13__string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_14_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_14__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_14__string = "XRET";
      default : _zz_14__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_15_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_15__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_15__string = "XRET";
      default : _zz_15__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_16_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16__string = "XRET";
      default : _zz_16__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_17_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17__string = "XRET";
      default : _zz_17__string = "????";
    endcase
  end
  always @( * ) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_18_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_18__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_18__string = "XRET";
      default : _zz_18__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_19_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_19__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_19__string = "XRET";
      default : _zz_19__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_20_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_20__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_20__string = "XRET";
      default : _zz_20__string = "????";
    endcase
  end
  always @( * ) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_22_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_22__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_22__string = "XRET";
      default : _zz_22__string = "????";
    endcase
  end
  always @( * ) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_23_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_23__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_23__string = "XRET";
      default : _zz_23__string = "????";
    endcase
  end
  always @( * ) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_26_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_26__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_26__string = "XRET";
      default : _zz_26__string = "????";
    endcase
  end
  always @( * ) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_29_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_29__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_29__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_29__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_29__string = "JALR";
      default : _zz_29__string = "????";
    endcase
  end
  always @( * ) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_39_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_39__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_39__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_39__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_39__string = "SRA_1    ";
      default : _zz_39__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_41_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_41__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_41__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_41__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_41__string = "SRA_1    ";
      default : _zz_41__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @( * ) begin
    case(_zz_47_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_47__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_47__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_47__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_47__string = "PC ";
      default : _zz_47__string = "???";
    endcase
  end
  always @( * ) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @( * ) begin
    case(_zz_50_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_50__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_50__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_50__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_50__string = "URS1        ";
      default : _zz_50__string = "????????????";
    endcase
  end
  always @( * ) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @( * ) begin
    case(_zz_53_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_53__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_53__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_53__string = "BITWISE ";
      default : _zz_53__string = "????????";
    endcase
  end
  always @( * ) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_55_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_55__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_55__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_55__string = "AND_1";
      default : _zz_55__string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_62_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_62__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_62__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_62__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_62__string = "SRA_1    ";
      default : _zz_62__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(_zz_63_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_63__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_63__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_63__string = "AND_1";
      default : _zz_63__string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_68_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_68__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_68__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_68__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_68__string = "URS1        ";
      default : _zz_68__string = "????????????";
    endcase
  end
  always @( * ) begin
    case(_zz_70_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_70__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_70__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_70__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_70__string = "JALR";
      default : _zz_70__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_71_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_71__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_71__string = "XRET";
      default : _zz_71__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_74_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_74__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_74__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_74__string = "BITWISE ";
      default : _zz_74__string = "????????";
    endcase
  end
  always @( * ) begin
    case(_zz_75_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_75__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_75__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_75__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_75__string = "PC ";
      default : _zz_75__string = "???";
    endcase
  end
  always @( * ) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_87_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_87__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_87__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_87__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_87__string = "JALR";
      default : _zz_87__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_160_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_160__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_160__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_160__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_160__string = "PC ";
      default : _zz_160__string = "???";
    endcase
  end
  always @( * ) begin
    case(_zz_161_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_161__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_161__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_161__string = "BITWISE ";
      default : _zz_161__string = "????????";
    endcase
  end
  always @( * ) begin
    case(_zz_162_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_162__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_162__string = "XRET";
      default : _zz_162__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_163_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_163__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_163__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_163__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_163__string = "JALR";
      default : _zz_163__string = "????";
    endcase
  end
  always @( * ) begin
    case(_zz_164_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_164__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_164__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_164__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_164__string = "URS1        ";
      default : _zz_164__string = "????????????";
    endcase
  end
  always @( * ) begin
    case(_zz_165_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_165__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_165__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_165__string = "AND_1";
      default : _zz_165__string = "?????";
    endcase
  end
  always @( * ) begin
    case(_zz_166_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_166__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_166__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_166__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_166__string = "SRA_1    ";
      default : _zz_166__string = "?????????";
    endcase
  end
  always @( * ) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @( * ) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @( * ) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @( * ) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @( * ) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @( * ) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign decode_SRC2 = _zz_48_;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_86_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_78_;
  assign decode_DO_EBREAK = _zz_21_;
  assign memory_PC = execute_to_memory_PC;
  assign execute_MUL_LL = _zz_37_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = _zz_34_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_90_;
  assign decode_IS_CSR = _zz_80_;
  assign memory_MEMORY_READ_DATA = _zz_85_;
  assign decode_CSR_READ_OPCODE = _zz_24_;
  assign _zz_1_ = _zz_2_;
  assign _zz_3_ = _zz_4_;
  assign decode_SHIFT_CTRL = _zz_5_;
  assign _zz_6_ = _zz_7_;
  assign execute_SHIFT_RIGHT = _zz_40_;
  assign decode_PREDICTION_HAD_BRANCHED2 = _zz_31_;
  assign execute_BRANCH_DO = _zz_28_;
  assign decode_ALU_CTRL = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign decode_IS_DIV = _zz_61_;
  assign decode_ALU_BITWISE_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_65_;
  assign decode_SRC2_FORCE_ZERO = _zz_52_;
  assign decode_MEMORY_ENABLE = _zz_69_;
  assign decode_SRC1 = _zz_51_;
  assign decode_SRC_LESS_UNSIGNED = _zz_67_;
  assign _zz_14_ = _zz_15_;
  assign _zz_16_ = _zz_17_;
  assign decode_ENV_CTRL = _zz_18_;
  assign _zz_19_ = _zz_20_;
  assign execute_MUL_HL = _zz_35_;
  assign execute_BRANCH_CALC = _zz_27_;
  assign memory_MUL_LOW = _zz_33_;
  assign decode_IS_RS2_SIGNED = _zz_82_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_54_;
  assign execute_MUL_LH = _zz_36_;
  assign decode_IS_RS1_SIGNED = _zz_72_;
  assign decode_MEMORY_STORE = _zz_77_;
  assign decode_CSR_WRITE_OPCODE = _zz_25_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_79_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_76_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_22_;
  assign execute_ENV_CTRL = _zz_23_;
  assign writeBack_ENV_CTRL = _zz_26_;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_30_;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_29_;
  assign decode_RS2_USE = _zz_81_;
  assign decode_RS1_USE = _zz_64_;
  always @ ( * ) begin
    _zz_32_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_147_)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_32_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ ( * ) begin
    decode_RS2 = _zz_59_;
    decode_RS1 = _zz_60_;
    if(_zz_186_)begin
      if((_zz_187_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_188_;
      end
      if((_zz_187_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_188_;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if(1'b1)begin
        if(_zz_189_)begin
          decode_RS1 = _zz_84_;
        end
        if(_zz_190_)begin
          decode_RS2 = _zz_84_;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_191_)begin
          decode_RS1 = _zz_38_;
        end
        if(_zz_192_)begin
          decode_RS2 = _zz_38_;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_193_)begin
          decode_RS1 = _zz_32_;
        end
        if(_zz_194_)begin
          decode_RS2 = _zz_32_;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ ( * ) begin
    _zz_38_ = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_38_ = _zz_175_;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_38_ = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_211_)begin
      if(_zz_212_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
      _zz_38_ = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_39_;
  assign execute_SHIFT_CTRL = _zz_41_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_45_ = decode_PC;
  assign _zz_46_ = decode_RS2;
  assign decode_SRC2_CTRL = _zz_47_;
  assign _zz_49_ = decode_RS1;
  assign decode_SRC1_CTRL = _zz_50_;
  assign decode_SRC_USE_SUB_LESS = _zz_66_;
  assign decode_SRC_ADD_ZERO = _zz_83_;
  assign execute_SRC_ADD_SUB = _zz_44_;
  assign execute_SRC_LESS = _zz_42_;
  assign execute_ALU_CTRL = _zz_53_;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_55_;
  assign _zz_56_ = writeBack_INSTRUCTION;
  assign _zz_57_ = writeBack_REGFILE_WRITE_VALID;
  always @ ( * ) begin
    _zz_58_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_58_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = _zz_94_;
  always @ ( * ) begin
    decode_REGFILE_WRITE_VALID = _zz_73_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ ( * ) begin
    _zz_84_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_84_ = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_229_)
        2'b00 : begin
          _zz_84_ = _zz_296_;
        end
        default : begin
          _zz_84_ = _zz_297_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = _zz_43_;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_BRANCH_CTRL = _zz_87_;
  always @ ( * ) begin
    _zz_88_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_88_ = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ ( * ) begin
    _zz_89_ = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_89_ = IBusSimplePlugin_pcs_2;
    end
  end

  assign decode_PC = _zz_93_;
  assign decode_INSTRUCTION = _zz_92_;
  assign decode_IS_RVC = _zz_91_;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ ( * ) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusSimplePlugin_injector_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_206_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ ( * ) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_183_ || _zz_184_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_interrupt)begin
      decode_arbitration_haltByOther = decode_arbitration_isValid;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ ( * ) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_205_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushAll = 1'b0;
  always @ ( * ) begin
    execute_arbitration_haltByOther = 1'b0;
    memory_arbitration_flushAll = 1'b0;
    IBusSimplePlugin_fetcherHalt = 1'b0;
    IBusSimplePlugin_fetcherflushIt = 1'b0;
    CsrPlugin_jumpInterface_valid = 1'b0;
    CsrPlugin_jumpInterface_payload = (32'b00000000000000000000000000000000);
    if(_zz_213_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_214_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      memory_arbitration_flushAll = 1'b1;
      case(_zz_215_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
    if(_zz_216_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_217_)begin
        IBusSimplePlugin_fetcherflushIt = 1'b1;
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_218_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ ( * ) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ ( * ) begin
    execute_arbitration_flushAll = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
    if(_zz_216_)begin
      if(_zz_217_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ ( * ) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ ( * ) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushAll = 1'b0;
  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ ( * ) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if((IBusSimplePlugin_decompressor_bufferValid && (IBusSimplePlugin_decompressor_bufferData[1 : 0] != (2'b11))))begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  always @ ( * ) begin
    CsrPlugin_forceMachineWire = 1'b0;
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ ( * ) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != (3'b000));
  assign _zz_95_ = {IBusSimplePlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_96_ = (_zz_95_ & (~ _zz_231_));
  assign _zz_97_ = _zz_96_[1];
  assign _zz_98_ = _zz_96_[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_210_;
  assign _zz_99_ = (! IBusSimplePlugin_fetcherHalt);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_99_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_99_);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_preOutput_payload;
  always @ ( * ) begin
    IBusSimplePlugin_fetchPc_propagatePc = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_iBusRsp_stages_1_input_ready))begin
      IBusSimplePlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ ( * ) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_233_);
    IBusSimplePlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_219_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_100_;
  assign IBusSimplePlugin_fetchPc_preOutput_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_235_);
  always @ ( * ) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if((_zz_206_ != (3'b000)))begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_inputSample = 1'b1;
  always @ ( * ) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmd_valid) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_101_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_101_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_101_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_102_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_102_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_102_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_103_;
  assign _zz_103_ = ((1'b0 && (! _zz_104_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_104_ = _zz_105_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_104_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ ( * ) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if((IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isRvc))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValid ? {IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[31 : 16],(IBusSimplePlugin_iBusRsp_output_payload_pc[1] ? IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[31 : 16] : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != (2'b11));
  assign _zz_106_ = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ ( * ) begin
    IBusSimplePlugin_decompressor_decompressed = (32'b00000000000000000000000000000000);
    case(_zz_224_)
      5'b00000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{(2'b00),_zz_106_[10 : 7]},_zz_106_[12 : 11]},_zz_106_[5]},_zz_106_[6]},(2'b00)},(5'b00010)},(3'b000)},_zz_108_},(7'b0010011)};
      end
      5'b00010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_109_,_zz_107_},(3'b010)},_zz_108_},(7'b0000011)};
      end
      5'b00110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_109_[11 : 5],_zz_108_},_zz_107_},(3'b010)},_zz_109_[4 : 0]},(7'b0100011)};
      end
      5'b01000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_111_,_zz_106_[11 : 7]},(3'b000)},_zz_106_[11 : 7]},(7'b0010011)};
      end
      5'b01001 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_114_[20],_zz_114_[10 : 1]},_zz_114_[11]},_zz_114_[19 : 12]},_zz_126_},(7'b1101111)};
      end
      5'b01010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_111_,(5'b00000)},(3'b000)},_zz_106_[11 : 7]},(7'b0010011)};
      end
      5'b01011 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_106_[11 : 7] == (5'b00010)) ? {{{{{{{{{_zz_118_,_zz_106_[4 : 3]},_zz_106_[5]},_zz_106_[2]},_zz_106_[6]},(4'b0000)},_zz_106_[11 : 7]},(3'b000)},_zz_106_[11 : 7]},(7'b0010011)} : {{_zz_236_[31 : 12],_zz_106_[11 : 7]},(7'b0110111)});
      end
      5'b01100 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_106_[11 : 10] == (2'b10)) ? _zz_132_ : {{(1'b0),(_zz_326_ || _zz_327_)},(5'b00000)}),(((! _zz_106_[11]) || _zz_128_) ? _zz_106_[6 : 2] : _zz_108_)},_zz_107_},_zz_130_},_zz_107_},(_zz_128_ ? (7'b0010011) : (7'b0110011))};
      end
      5'b01101 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_121_[20],_zz_121_[10 : 1]},_zz_121_[11]},_zz_121_[19 : 12]},_zz_125_},(7'b1101111)};
      end
      5'b01110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_124_[12],_zz_124_[10 : 5]},_zz_125_},_zz_107_},(3'b000)},_zz_124_[4 : 1]},_zz_124_[11]},(7'b1100011)};
      end
      5'b01111 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_124_[12],_zz_124_[10 : 5]},_zz_125_},_zz_107_},(3'b001)},_zz_124_[4 : 1]},_zz_124_[11]},(7'b1100011)};
      end
      5'b10000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{(7'b0000000),_zz_106_[6 : 2]},_zz_106_[11 : 7]},(3'b001)},_zz_106_[11 : 7]},(7'b0010011)};
      end
      5'b10010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{(4'b0000),_zz_106_[3 : 2]},_zz_106_[12]},_zz_106_[6 : 4]},(2'b00)},_zz_127_},(3'b010)},_zz_106_[11 : 7]},(7'b0000011)};
      end
      5'b10100 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_106_[12 : 2] == (11'b10000000000)) ? (32'b00000000000100000000000001110011) : ((_zz_106_[6 : 2] == (5'b00000)) ? {{{{(12'b000000000000),_zz_106_[11 : 7]},(3'b000)},(_zz_106_[12] ? _zz_126_ : _zz_125_)},(7'b1100111)} : {{{{{_zz_328_,_zz_329_},(_zz_330_ ? _zz_331_ : _zz_125_)},(3'b000)},_zz_106_[11 : 7]},(7'b0110011)}));
      end
      5'b10110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_237_[11 : 5],_zz_106_[6 : 2]},_zz_127_},(3'b010)},_zz_238_[4 : 0]},(7'b0100011)};
      end
      default : begin
      end
    endcase
  end

  assign _zz_107_ = {(2'b01),_zz_106_[9 : 7]};
  assign _zz_108_ = {(2'b01),_zz_106_[4 : 2]};
  assign _zz_109_ = {{{{(5'b00000),_zz_106_[5]},_zz_106_[12 : 10]},_zz_106_[6]},(2'b00)};
  assign _zz_110_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_111_[11] = _zz_110_;
    _zz_111_[10] = _zz_110_;
    _zz_111_[9] = _zz_110_;
    _zz_111_[8] = _zz_110_;
    _zz_111_[7] = _zz_110_;
    _zz_111_[6] = _zz_110_;
    _zz_111_[5] = _zz_110_;
    _zz_111_[4 : 0] = _zz_106_[6 : 2];
  end

  assign _zz_112_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_113_[9] = _zz_112_;
    _zz_113_[8] = _zz_112_;
    _zz_113_[7] = _zz_112_;
    _zz_113_[6] = _zz_112_;
    _zz_113_[5] = _zz_112_;
    _zz_113_[4] = _zz_112_;
    _zz_113_[3] = _zz_112_;
    _zz_113_[2] = _zz_112_;
    _zz_113_[1] = _zz_112_;
    _zz_113_[0] = _zz_112_;
  end

  assign _zz_114_ = {{{{{{{{_zz_113_,_zz_106_[8]},_zz_106_[10 : 9]},_zz_106_[6]},_zz_106_[7]},_zz_106_[2]},_zz_106_[11]},_zz_106_[5 : 3]},(1'b0)};
  assign _zz_115_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_116_[14] = _zz_115_;
    _zz_116_[13] = _zz_115_;
    _zz_116_[12] = _zz_115_;
    _zz_116_[11] = _zz_115_;
    _zz_116_[10] = _zz_115_;
    _zz_116_[9] = _zz_115_;
    _zz_116_[8] = _zz_115_;
    _zz_116_[7] = _zz_115_;
    _zz_116_[6] = _zz_115_;
    _zz_116_[5] = _zz_115_;
    _zz_116_[4] = _zz_115_;
    _zz_116_[3] = _zz_115_;
    _zz_116_[2] = _zz_115_;
    _zz_116_[1] = _zz_115_;
    _zz_116_[0] = _zz_115_;
  end

  assign _zz_117_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_118_[2] = _zz_117_;
    _zz_118_[1] = _zz_117_;
    _zz_118_[0] = _zz_117_;
  end

  assign _zz_119_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_120_[9] = _zz_119_;
    _zz_120_[8] = _zz_119_;
    _zz_120_[7] = _zz_119_;
    _zz_120_[6] = _zz_119_;
    _zz_120_[5] = _zz_119_;
    _zz_120_[4] = _zz_119_;
    _zz_120_[3] = _zz_119_;
    _zz_120_[2] = _zz_119_;
    _zz_120_[1] = _zz_119_;
    _zz_120_[0] = _zz_119_;
  end

  assign _zz_121_ = {{{{{{{{_zz_120_,_zz_106_[8]},_zz_106_[10 : 9]},_zz_106_[6]},_zz_106_[7]},_zz_106_[2]},_zz_106_[11]},_zz_106_[5 : 3]},(1'b0)};
  assign _zz_122_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_123_[4] = _zz_122_;
    _zz_123_[3] = _zz_122_;
    _zz_123_[2] = _zz_122_;
    _zz_123_[1] = _zz_122_;
    _zz_123_[0] = _zz_122_;
  end

  assign _zz_124_ = {{{{{_zz_123_,_zz_106_[6 : 5]},_zz_106_[2]},_zz_106_[11 : 10]},_zz_106_[4 : 3]},(1'b0)};
  assign _zz_125_ = (5'b00000);
  assign _zz_126_ = (5'b00001);
  assign _zz_127_ = (5'b00010);
  assign _zz_128_ = (_zz_106_[11 : 10] != (2'b11));
  always @ ( * ) begin
    case(_zz_225_)
      2'b00 : begin
        _zz_129_ = (3'b000);
      end
      2'b01 : begin
        _zz_129_ = (3'b100);
      end
      2'b10 : begin
        _zz_129_ = (3'b110);
      end
      default : begin
        _zz_129_ = (3'b111);
      end
    endcase
  end

  always @ ( * ) begin
    case(_zz_226_)
      2'b00 : begin
        _zz_130_ = (3'b101);
      end
      2'b01 : begin
        _zz_130_ = (3'b101);
      end
      2'b10 : begin
        _zz_130_ = (3'b111);
      end
      default : begin
        _zz_130_ = _zz_129_;
      end
    endcase
  end

  assign _zz_131_ = _zz_106_[12];
  always @ ( * ) begin
    _zz_132_[6] = _zz_131_;
    _zz_132_[5] = _zz_131_;
    _zz_132_[4] = _zz_131_;
    _zz_132_[3] = _zz_131_;
    _zz_132_[2] = _zz_131_;
    _zz_132_[1] = _zz_131_;
    _zz_132_[0] = _zz_131_;
  end

  assign IBusSimplePlugin_decompressor_inputBeforeStage_valid = (IBusSimplePlugin_decompressor_isRvc ? (IBusSimplePlugin_decompressor_bufferValid || IBusSimplePlugin_iBusRsp_output_valid) : (IBusSimplePlugin_iBusRsp_output_valid && (IBusSimplePlugin_decompressor_bufferValid || (! IBusSimplePlugin_iBusRsp_output_payload_pc[1]))));
  assign IBusSimplePlugin_decompressor_inputBeforeStage_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_inputBeforeStage_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_inputBeforeStage_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_iBusRsp_output_ready = ((! IBusSimplePlugin_decompressor_inputBeforeStage_valid) || (! (((! IBusSimplePlugin_decompressor_inputBeforeStage_ready) || ((IBusSimplePlugin_decompressor_isRvc && (! IBusSimplePlugin_iBusRsp_output_payload_pc[1])) && (IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11)))) || (((! IBusSimplePlugin_decompressor_isRvc) && IBusSimplePlugin_decompressor_bufferValid) && (IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11))))));
  assign IBusSimplePlugin_decompressor_inputBeforeStage_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_133_;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_134_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_135_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_136_;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_137_;
  assign _zz_94_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_inputBeforeStage_payload_rsp_inst);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_93_ = IBusSimplePlugin_decodePc_pcReg;
  assign _zz_92_ = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign _zz_91_ = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign _zz_90_ = (decode_PC + _zz_240_);
  assign _zz_138_ = _zz_241_[11];
  always @ ( * ) begin
    _zz_139_[18] = _zz_138_;
    _zz_139_[17] = _zz_138_;
    _zz_139_[16] = _zz_138_;
    _zz_139_[15] = _zz_138_;
    _zz_139_[14] = _zz_138_;
    _zz_139_[13] = _zz_138_;
    _zz_139_[12] = _zz_138_;
    _zz_139_[11] = _zz_138_;
    _zz_139_[10] = _zz_138_;
    _zz_139_[9] = _zz_138_;
    _zz_139_[8] = _zz_138_;
    _zz_139_[7] = _zz_138_;
    _zz_139_[6] = _zz_138_;
    _zz_139_[5] = _zz_138_;
    _zz_139_[4] = _zz_138_;
    _zz_139_[3] = _zz_138_;
    _zz_139_[2] = _zz_138_;
    _zz_139_[1] = _zz_138_;
    _zz_139_[0] = _zz_138_;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_242_[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (IBusSimplePlugin_decodePrediction_cmd_hadBranch && decode_arbitration_isFiring);
  assign _zz_140_ = _zz_243_[19];
  always @ ( * ) begin
    _zz_141_[10] = _zz_140_;
    _zz_141_[9] = _zz_140_;
    _zz_141_[8] = _zz_140_;
    _zz_141_[7] = _zz_140_;
    _zz_141_[6] = _zz_140_;
    _zz_141_[5] = _zz_140_;
    _zz_141_[4] = _zz_140_;
    _zz_141_[3] = _zz_140_;
    _zz_141_[2] = _zz_140_;
    _zz_141_[1] = _zz_140_;
    _zz_141_[0] = _zz_140_;
  end

  assign _zz_142_ = _zz_244_[11];
  always @ ( * ) begin
    _zz_143_[18] = _zz_142_;
    _zz_143_[17] = _zz_142_;
    _zz_143_[16] = _zz_142_;
    _zz_143_[15] = _zz_142_;
    _zz_143_[14] = _zz_142_;
    _zz_143_[13] = _zz_142_;
    _zz_143_[12] = _zz_142_;
    _zz_143_[11] = _zz_142_;
    _zz_143_[10] = _zz_142_;
    _zz_143_[9] = _zz_142_;
    _zz_143_[8] = _zz_142_;
    _zz_143_[7] = _zz_142_;
    _zz_143_[6] = _zz_142_;
    _zz_143_[5] = _zz_142_;
    _zz_143_[4] = _zz_142_;
    _zz_143_[3] = _zz_142_;
    _zz_143_[2] = _zz_142_;
    _zz_143_[1] = _zz_142_;
    _zz_143_[0] = _zz_142_;
  end

  assign IBusSimplePlugin_pcs_2 = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_141_,{{{_zz_332_,_zz_333_},_zz_334_},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_143_,{{{_zz_335_,_zz_336_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign IBusSimplePlugin_cmd_s2mPipe_valid = (IBusSimplePlugin_cmd_valid || _zz_144_);
  assign IBusSimplePlugin_cmd_ready = (! _zz_144_);
  assign IBusSimplePlugin_cmd_s2mPipe_payload_pc = (_zz_144_ ? _zz_145_ : IBusSimplePlugin_cmd_payload_pc);
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_s2mPipe_valid;
  assign IBusSimplePlugin_cmd_s2mPipe_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_s2mPipe_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_245_ - _zz_249_);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_iBusRsp_stages_0_output_ready) && (IBusSimplePlugin_pendingCmd != (3'b111)));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign iBus_rsp_takeWhen_valid = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != (3'b000))));
  assign iBus_rsp_takeWhen_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_takeWhen_payload_inst = iBus_rsp_payload_inst;
  assign _zz_207_ = (IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_valid = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ ( * ) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBufferOutput_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_redoRequired = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBufferOutput_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_146_ = (! (IBusSimplePlugin_rspJoin_exceptionDetected || IBusSimplePlugin_rspJoin_redoRequired));
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_146_);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_146_);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_147_ = 1'b0;
  always @ ( * ) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_147_));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ ( * ) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_148_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_148_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_148_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_148_;
  assign _zz_86_ = dBus_cmd_payload_address[1 : 0];
  always @ ( * ) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_149_ = (4'b0001);
      end
      2'b01 : begin
        _zz_149_ = (4'b0011);
      end
      default : begin
        _zz_149_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_149_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign _zz_85_ = dBus_rsp_data;
  always @ ( * ) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_150_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ ( * ) begin
    _zz_151_[31] = _zz_150_;
    _zz_151_[30] = _zz_150_;
    _zz_151_[29] = _zz_150_;
    _zz_151_[28] = _zz_150_;
    _zz_151_[27] = _zz_150_;
    _zz_151_[26] = _zz_150_;
    _zz_151_[25] = _zz_150_;
    _zz_151_[24] = _zz_150_;
    _zz_151_[23] = _zz_150_;
    _zz_151_[22] = _zz_150_;
    _zz_151_[21] = _zz_150_;
    _zz_151_[20] = _zz_150_;
    _zz_151_[19] = _zz_150_;
    _zz_151_[18] = _zz_150_;
    _zz_151_[17] = _zz_150_;
    _zz_151_[16] = _zz_150_;
    _zz_151_[15] = _zz_150_;
    _zz_151_[14] = _zz_150_;
    _zz_151_[13] = _zz_150_;
    _zz_151_[12] = _zz_150_;
    _zz_151_[11] = _zz_150_;
    _zz_151_[10] = _zz_150_;
    _zz_151_[9] = _zz_150_;
    _zz_151_[8] = _zz_150_;
    _zz_151_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_152_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ ( * ) begin
    _zz_153_[31] = _zz_152_;
    _zz_153_[30] = _zz_152_;
    _zz_153_[29] = _zz_152_;
    _zz_153_[28] = _zz_152_;
    _zz_153_[27] = _zz_152_;
    _zz_153_[26] = _zz_152_;
    _zz_153_[25] = _zz_152_;
    _zz_153_[24] = _zz_152_;
    _zz_153_[23] = _zz_152_;
    _zz_153_[22] = _zz_152_;
    _zz_153_[21] = _zz_152_;
    _zz_153_[20] = _zz_152_;
    _zz_153_[19] = _zz_152_;
    _zz_153_[18] = _zz_152_;
    _zz_153_[17] = _zz_152_;
    _zz_153_[16] = _zz_152_;
    _zz_153_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ ( * ) begin
    case(_zz_227_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_151_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_153_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_155_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_156_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_157_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000));
  assign _zz_158_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_159_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_154_ = {(((decode_INSTRUCTION & _zz_337_) == (32'b00000010000000000100000000100000)) != (1'b0)),{({_zz_338_,_zz_339_} != (2'b00)),{({_zz_340_,_zz_341_} != (3'b000)),{(_zz_342_ != _zz_343_),{_zz_344_,{_zz_345_,_zz_346_}}}}}};
  assign _zz_83_ = _zz_254_[0];
  assign _zz_82_ = _zz_255_[0];
  assign _zz_81_ = _zz_256_[0];
  assign _zz_80_ = _zz_257_[0];
  assign _zz_79_ = _zz_258_[0];
  assign _zz_78_ = _zz_259_[0];
  assign _zz_77_ = _zz_260_[0];
  assign _zz_76_ = _zz_261_[0];
  assign _zz_160_ = _zz_154_[9 : 8];
  assign _zz_75_ = _zz_160_;
  assign _zz_161_ = _zz_154_[11 : 10];
  assign _zz_74_ = _zz_161_;
  assign _zz_73_ = _zz_262_[0];
  assign _zz_72_ = _zz_263_[0];
  assign _zz_162_ = _zz_154_[15 : 15];
  assign _zz_71_ = _zz_162_;
  assign _zz_163_ = _zz_154_[17 : 16];
  assign _zz_70_ = _zz_163_;
  assign _zz_69_ = _zz_264_[0];
  assign _zz_164_ = _zz_154_[20 : 19];
  assign _zz_68_ = _zz_164_;
  assign _zz_67_ = _zz_265_[0];
  assign _zz_66_ = _zz_266_[0];
  assign _zz_65_ = _zz_267_[0];
  assign _zz_64_ = _zz_268_[0];
  assign _zz_165_ = _zz_154_[26 : 25];
  assign _zz_63_ = _zz_165_;
  assign _zz_166_ = _zz_154_[28 : 27];
  assign _zz_62_ = _zz_166_;
  assign _zz_61_ = _zz_269_[0];
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_208_;
  assign decode_RegFilePlugin_rs2Data = _zz_209_;
  assign _zz_60_ = decode_RegFilePlugin_rs1Data;
  assign _zz_59_ = decode_RegFilePlugin_rs2Data;
  assign lastStageRegFileWrite_valid = (_zz_57_ && writeBack_arbitration_isFiring);
  assign lastStageRegFileWrite_payload_address = _zz_56_[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_84_;
  always @ ( * ) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ ( * ) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_167_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_167_ = {31'd0, _zz_270_};
      end
      default : begin
        _zz_167_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_54_ = _zz_167_;
  assign _zz_52_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ ( * ) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_168_ = _zz_49_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_168_ = {29'd0, _zz_271_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_168_ = {decode_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_168_ = {27'd0, _zz_272_};
      end
    endcase
  end

  assign _zz_51_ = _zz_168_;
  assign _zz_169_ = _zz_273_[11];
  always @ ( * ) begin
    _zz_170_[19] = _zz_169_;
    _zz_170_[18] = _zz_169_;
    _zz_170_[17] = _zz_169_;
    _zz_170_[16] = _zz_169_;
    _zz_170_[15] = _zz_169_;
    _zz_170_[14] = _zz_169_;
    _zz_170_[13] = _zz_169_;
    _zz_170_[12] = _zz_169_;
    _zz_170_[11] = _zz_169_;
    _zz_170_[10] = _zz_169_;
    _zz_170_[9] = _zz_169_;
    _zz_170_[8] = _zz_169_;
    _zz_170_[7] = _zz_169_;
    _zz_170_[6] = _zz_169_;
    _zz_170_[5] = _zz_169_;
    _zz_170_[4] = _zz_169_;
    _zz_170_[3] = _zz_169_;
    _zz_170_[2] = _zz_169_;
    _zz_170_[1] = _zz_169_;
    _zz_170_[0] = _zz_169_;
  end

  assign _zz_171_ = _zz_274_[11];
  always @ ( * ) begin
    _zz_172_[19] = _zz_171_;
    _zz_172_[18] = _zz_171_;
    _zz_172_[17] = _zz_171_;
    _zz_172_[16] = _zz_171_;
    _zz_172_[15] = _zz_171_;
    _zz_172_[14] = _zz_171_;
    _zz_172_[13] = _zz_171_;
    _zz_172_[12] = _zz_171_;
    _zz_172_[11] = _zz_171_;
    _zz_172_[10] = _zz_171_;
    _zz_172_[9] = _zz_171_;
    _zz_172_[8] = _zz_171_;
    _zz_172_[7] = _zz_171_;
    _zz_172_[6] = _zz_171_;
    _zz_172_[5] = _zz_171_;
    _zz_172_[4] = _zz_171_;
    _zz_172_[3] = _zz_171_;
    _zz_172_[2] = _zz_171_;
    _zz_172_[1] = _zz_171_;
    _zz_172_[0] = _zz_171_;
  end

  always @ ( * ) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_173_ = _zz_46_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_173_ = {_zz_170_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_173_ = {_zz_172_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_173_ = _zz_45_;
      end
    endcase
  end

  assign _zz_48_ = _zz_173_;
  always @ ( * ) begin
    execute_SrcPlugin_addSub = _zz_275_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_44_ = execute_SrcPlugin_addSub;
  assign _zz_43_ = execute_SrcPlugin_addSub;
  assign _zz_42_ = execute_SrcPlugin_less;
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ ( * ) begin
    _zz_174_[0] = execute_SRC1[31];
    _zz_174_[1] = execute_SRC1[30];
    _zz_174_[2] = execute_SRC1[29];
    _zz_174_[3] = execute_SRC1[28];
    _zz_174_[4] = execute_SRC1[27];
    _zz_174_[5] = execute_SRC1[26];
    _zz_174_[6] = execute_SRC1[25];
    _zz_174_[7] = execute_SRC1[24];
    _zz_174_[8] = execute_SRC1[23];
    _zz_174_[9] = execute_SRC1[22];
    _zz_174_[10] = execute_SRC1[21];
    _zz_174_[11] = execute_SRC1[20];
    _zz_174_[12] = execute_SRC1[19];
    _zz_174_[13] = execute_SRC1[18];
    _zz_174_[14] = execute_SRC1[17];
    _zz_174_[15] = execute_SRC1[16];
    _zz_174_[16] = execute_SRC1[15];
    _zz_174_[17] = execute_SRC1[14];
    _zz_174_[18] = execute_SRC1[13];
    _zz_174_[19] = execute_SRC1[12];
    _zz_174_[20] = execute_SRC1[11];
    _zz_174_[21] = execute_SRC1[10];
    _zz_174_[22] = execute_SRC1[9];
    _zz_174_[23] = execute_SRC1[8];
    _zz_174_[24] = execute_SRC1[7];
    _zz_174_[25] = execute_SRC1[6];
    _zz_174_[26] = execute_SRC1[5];
    _zz_174_[27] = execute_SRC1[4];
    _zz_174_[28] = execute_SRC1[3];
    _zz_174_[29] = execute_SRC1[2];
    _zz_174_[30] = execute_SRC1[1];
    _zz_174_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_174_ : execute_SRC1);
  assign _zz_40_ = _zz_283_;
  always @ ( * ) begin
    _zz_175_[0] = memory_SHIFT_RIGHT[31];
    _zz_175_[1] = memory_SHIFT_RIGHT[30];
    _zz_175_[2] = memory_SHIFT_RIGHT[29];
    _zz_175_[3] = memory_SHIFT_RIGHT[28];
    _zz_175_[4] = memory_SHIFT_RIGHT[27];
    _zz_175_[5] = memory_SHIFT_RIGHT[26];
    _zz_175_[6] = memory_SHIFT_RIGHT[25];
    _zz_175_[7] = memory_SHIFT_RIGHT[24];
    _zz_175_[8] = memory_SHIFT_RIGHT[23];
    _zz_175_[9] = memory_SHIFT_RIGHT[22];
    _zz_175_[10] = memory_SHIFT_RIGHT[21];
    _zz_175_[11] = memory_SHIFT_RIGHT[20];
    _zz_175_[12] = memory_SHIFT_RIGHT[19];
    _zz_175_[13] = memory_SHIFT_RIGHT[18];
    _zz_175_[14] = memory_SHIFT_RIGHT[17];
    _zz_175_[15] = memory_SHIFT_RIGHT[16];
    _zz_175_[16] = memory_SHIFT_RIGHT[15];
    _zz_175_[17] = memory_SHIFT_RIGHT[14];
    _zz_175_[18] = memory_SHIFT_RIGHT[13];
    _zz_175_[19] = memory_SHIFT_RIGHT[12];
    _zz_175_[20] = memory_SHIFT_RIGHT[11];
    _zz_175_[21] = memory_SHIFT_RIGHT[10];
    _zz_175_[22] = memory_SHIFT_RIGHT[9];
    _zz_175_[23] = memory_SHIFT_RIGHT[8];
    _zz_175_[24] = memory_SHIFT_RIGHT[7];
    _zz_175_[25] = memory_SHIFT_RIGHT[6];
    _zz_175_[26] = memory_SHIFT_RIGHT[5];
    _zz_175_[27] = memory_SHIFT_RIGHT[4];
    _zz_175_[28] = memory_SHIFT_RIGHT[3];
    _zz_175_[29] = memory_SHIFT_RIGHT[2];
    _zz_175_[30] = memory_SHIFT_RIGHT[1];
    _zz_175_[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ ( * ) begin
    case(_zz_228_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign _zz_37_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_36_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_35_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_34_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_33_ = ($signed(_zz_285_) + $signed(_zz_293_));
  assign writeBack_MulPlugin_result = ($signed(_zz_294_) + $signed(_zz_295_));
  always @ ( * ) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_220_)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == (6'b100001));
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ ( * ) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_299_);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_176_ = memory_DivPlugin_rs1[31 : 0];
  assign _zz_177_ = {memory_DivPlugin_accumulator[31 : 0],_zz_176_[31]};
  assign _zz_178_ = (_zz_177_ - _zz_300_);
  assign _zz_179_ = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_180_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_181_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ ( * ) begin
    _zz_182_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_182_[31 : 0] = execute_RS1;
  end

  always @ ( * ) begin
    _zz_183_ = 1'b0;
    _zz_184_ = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! 1'b1)))begin
        if(_zz_189_)begin
          _zz_183_ = 1'b1;
        end
        if(_zz_190_)begin
          _zz_184_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if(_zz_191_)begin
          _zz_183_ = 1'b1;
        end
        if(_zz_192_)begin
          _zz_184_ = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE)))begin
        if(_zz_193_)begin
          _zz_183_ = 1'b1;
        end
        if(_zz_194_)begin
          _zz_184_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_183_ = 1'b0;
    end
    if((! decode_RS2_USE))begin
      _zz_184_ = 1'b0;
    end
  end

  assign _zz_185_ = (_zz_57_ && writeBack_arbitration_isFiring);
  assign _zz_189_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_190_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_191_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_192_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_193_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_194_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_31_ = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_195_ = execute_INSTRUCTION[14 : 12];
  always @ ( * ) begin
    if((_zz_195_ == (3'b000))) begin
        _zz_196_ = execute_BranchPlugin_eq;
    end else if((_zz_195_ == (3'b001))) begin
        _zz_196_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_195_ & (3'b101)) == (3'b101)))) begin
        _zz_196_ = (! execute_SRC_LESS);
    end else begin
        _zz_196_ = execute_SRC_LESS;
    end
  end

  always @ ( * ) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_197_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_197_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_197_ = 1'b1;
      end
      default : begin
        _zz_197_ = _zz_196_;
      end
    endcase
  end

  assign _zz_30_ = _zz_197_;
  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  assign _zz_28_ = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  always @ ( * ) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
        execute_BranchPlugin_branch_src2 = {_zz_199_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_201_,{{{_zz_475_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_203_,{{{_zz_476_,_zz_477_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_316_};
        end
      end
    endcase
  end

  assign _zz_198_ = _zz_313_[11];
  always @ ( * ) begin
    _zz_199_[19] = _zz_198_;
    _zz_199_[18] = _zz_198_;
    _zz_199_[17] = _zz_198_;
    _zz_199_[16] = _zz_198_;
    _zz_199_[15] = _zz_198_;
    _zz_199_[14] = _zz_198_;
    _zz_199_[13] = _zz_198_;
    _zz_199_[12] = _zz_198_;
    _zz_199_[11] = _zz_198_;
    _zz_199_[10] = _zz_198_;
    _zz_199_[9] = _zz_198_;
    _zz_199_[8] = _zz_198_;
    _zz_199_[7] = _zz_198_;
    _zz_199_[6] = _zz_198_;
    _zz_199_[5] = _zz_198_;
    _zz_199_[4] = _zz_198_;
    _zz_199_[3] = _zz_198_;
    _zz_199_[2] = _zz_198_;
    _zz_199_[1] = _zz_198_;
    _zz_199_[0] = _zz_198_;
  end

  assign _zz_200_ = _zz_314_[19];
  always @ ( * ) begin
    _zz_201_[10] = _zz_200_;
    _zz_201_[9] = _zz_200_;
    _zz_201_[8] = _zz_200_;
    _zz_201_[7] = _zz_200_;
    _zz_201_[6] = _zz_200_;
    _zz_201_[5] = _zz_200_;
    _zz_201_[4] = _zz_200_;
    _zz_201_[3] = _zz_200_;
    _zz_201_[2] = _zz_200_;
    _zz_201_[1] = _zz_200_;
    _zz_201_[0] = _zz_200_;
  end

  assign _zz_202_ = _zz_315_[11];
  always @ ( * ) begin
    _zz_203_[18] = _zz_202_;
    _zz_203_[17] = _zz_202_;
    _zz_203_[16] = _zz_202_;
    _zz_203_[15] = _zz_202_;
    _zz_203_[14] = _zz_202_;
    _zz_203_[13] = _zz_202_;
    _zz_203_[12] = _zz_202_;
    _zz_203_[11] = _zz_202_;
    _zz_203_[10] = _zz_202_;
    _zz_203_[9] = _zz_202_;
    _zz_203_[8] = _zz_202_;
    _zz_203_[7] = _zz_202_;
    _zz_203_[6] = _zz_202_;
    _zz_203_[5] = _zz_202_;
    _zz_203_[4] = _zz_202_;
    _zz_203_[3] = _zz_202_;
    _zz_203_[2] = _zz_202_;
    _zz_203_[1] = _zz_202_;
    _zz_203_[0] = _zz_202_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_27_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && (! memory_arbitration_isStuckByOthers)) && memory_BRANCH_DO);
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ ( * ) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  always @ ( * ) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'b0000);
    CsrPlugin_interruptTargetPrivilege = (2'b00);
    if((CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11))))begin
      if((((CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0111);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b1011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
    end
    if((! CsrPlugin_allowInterrupts))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ ( * ) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusSimplePlugin_pcValids_0);
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = (CsrPlugin_interrupt && CsrPlugin_pipelineLiberator_done);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interruptTargetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interruptCode;
  always @ ( * ) begin
    CsrPlugin_xtvec_mode = (2'b00);
    CsrPlugin_xtvec_base = (30'b000000000000000000000000000000);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign _zz_25_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_24_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_inWfi = 1'b0;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ ( * ) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b001100000101 : begin
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ ( * ) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ ( * ) begin
    case(_zz_230_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ ( * ) begin
    debug_bus_cmd_ready = 1'b1;
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_221_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ ( * ) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_204_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign _zz_21_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_20_ = decode_ENV_CTRL;
  assign _zz_17_ = execute_ENV_CTRL;
  assign _zz_15_ = memory_ENV_CTRL;
  assign _zz_18_ = _zz_71_;
  assign _zz_23_ = decode_to_execute_ENV_CTRL;
  assign _zz_22_ = execute_to_memory_ENV_CTRL;
  assign _zz_26_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_50_ = _zz_68_;
  assign _zz_13_ = decode_ALU_BITWISE_CTRL;
  assign _zz_11_ = _zz_63_;
  assign _zz_55_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_10_ = decode_ALU_CTRL;
  assign _zz_8_ = _zz_74_;
  assign _zz_53_ = decode_to_execute_ALU_CTRL;
  assign _zz_7_ = decode_SHIFT_CTRL;
  assign _zz_4_ = execute_SHIFT_CTRL;
  assign _zz_5_ = _zz_62_;
  assign _zz_41_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_39_ = execute_to_memory_SHIFT_CTRL;
  assign _zz_47_ = _zz_75_;
  assign _zz_2_ = decode_BRANCH_CTRL;
  assign _zz_87_ = _zz_70_;
  assign _zz_29_ = decode_to_execute_BRANCH_CTRL;
  assign decode_arbitration_isFlushed = ({writeBack_arbitration_flushAll,{memory_arbitration_flushAll,{execute_arbitration_flushAll,decode_arbitration_flushAll}}} != (4'b0000));
  assign execute_arbitration_isFlushed = ({writeBack_arbitration_flushAll,{memory_arbitration_flushAll,execute_arbitration_flushAll}} != (3'b000));
  assign memory_arbitration_isFlushed = ({writeBack_arbitration_flushAll,memory_arbitration_flushAll} != (2'b00));
  assign writeBack_arbitration_isFlushed = (writeBack_arbitration_flushAll != (1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      IBusSimplePlugin_fetchPc_pcReg <= (32'b10000000000000000000000000000000);
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_100_ <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= (32'b10000000000000000000000000000000);
      _zz_105_ <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      _zz_133_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      _zz_144_ <= 1'b0;
      IBusSimplePlugin_pendingCmd <= (3'b000);
      IBusSimplePlugin_rspJoin_discardCounter <= (3'b000);
      memory_DivPlugin_div_counter_value <= (6'b000000);
      _zz_186_ <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_206_ <= (3'b000);
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_219_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_100_ <= 1'b1;
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        _zz_105_ <= 1'b0;
      end
      if(_zz_103_)begin
        _zz_105_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusSimplePlugin_decompressor_inputBeforeStage_valid && IBusSimplePlugin_decompressor_inputBeforeStage_ready))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_222_)begin
        IBusSimplePlugin_decompressor_bufferValid <= ((! (((! IBusSimplePlugin_decompressor_isRvc) && (! IBusSimplePlugin_iBusRsp_output_payload_pc[1])) && (! IBusSimplePlugin_decompressor_bufferValid))) && (! ((IBusSimplePlugin_decompressor_isRvc && IBusSimplePlugin_iBusRsp_output_payload_pc[1]) && IBusSimplePlugin_decompressor_inputBeforeStage_ready)));
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_inputBeforeStage_ready)begin
        _zz_133_ <= IBusSimplePlugin_decompressor_inputBeforeStage_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        _zz_133_ <= 1'b0;
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      if(IBusSimplePlugin_cmd_s2mPipe_ready)begin
        _zz_144_ <= 1'b0;
      end
      if(_zz_223_)begin
        _zz_144_ <= IBusSimplePlugin_cmd_valid;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - _zz_251_);
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_pendingCmd - _zz_253_);
      end
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      _zz_186_ <= _zz_185_;
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_213_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_214_)begin
        case(_zz_215_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if((((! IBusSimplePlugin_iBusRsp_output_ready) && (IBusSimplePlugin_decompressor_inputBeforeStage_valid && IBusSimplePlugin_decompressor_inputBeforeStage_ready)) && (! (IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))))begin
        IBusSimplePlugin_fetchPc_pcReg[1] <= 1'b1;
      end
      case(_zz_206_)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_206_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_206_ <= (3'b010);
        end
        3'b010 : begin
          _zz_206_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_206_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_206_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_317_[0];
            CsrPlugin_mstatus_MIE <= _zz_318_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_320_[0];
            CsrPlugin_mie_MTIE <= _zz_321_[0];
            CsrPlugin_mie_MSIE <= _zz_322_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(_zz_222_)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_inputBeforeStage_ready)begin
      _zz_134_ <= IBusSimplePlugin_decompressor_inputBeforeStage_payload_pc;
      _zz_135_ <= IBusSimplePlugin_decompressor_inputBeforeStage_payload_rsp_error;
      _zz_136_ <= IBusSimplePlugin_decompressor_inputBeforeStage_payload_rsp_inst;
      _zz_137_ <= IBusSimplePlugin_decompressor_inputBeforeStage_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    if(_zz_223_)begin
      _zz_145_ <= IBusSimplePlugin_cmd_payload_pc;
    end
    if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow writeback stage stall when read happend");
    end
    if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_211_)begin
      if(_zz_212_)begin
        memory_DivPlugin_rs1[31 : 0] <= _zz_301_[31:0];
        memory_DivPlugin_accumulator[31 : 0] <= ((! _zz_178_[32]) ? _zz_302_ : _zz_303_);
        if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
          memory_DivPlugin_div_result <= _zz_304_[31:0];
        end
      end
    end
    if(_zz_220_)begin
      memory_DivPlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_DivPlugin_rs1 <= ((_zz_181_ ? (~ _zz_182_) : _zz_182_) + _zz_310_);
      memory_DivPlugin_rs2 <= ((_zz_180_ ? (~ execute_RS2) : execute_RS2) + _zz_312_);
      memory_DivPlugin_div_needRevert <= ((_zz_181_ ^ (_zz_180_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if(_zz_185_)begin
      _zz_187_ <= _zz_56_[11 : 7];
      _zz_188_ <= _zz_84_;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(_zz_213_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_49_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_32_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_38_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_19_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_16_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_14_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_12_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_9_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_6_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_3_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_1_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_46_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_89_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_88_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_45_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((_zz_206_ != (3'b000)))begin
      _zz_136_ <= IBusSimplePlugin_injectionPort_payload;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
      end
      12'b001101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_319_[0];
        end
      end
      12'b001100000100 : begin
      end
      12'b001101000010 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (posedge toplevel_io_axiClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000)) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_84_;
    end
    _zz_204_ <= debug_bus_cmd_payload_address[2];
    if(_zz_216_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_systemReset) begin
    if (toplevel_resetCtrl_systemReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      _zz_205_ <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_221_)
          6'b000000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          default : begin
          end
        endcase
      end
      if(_zz_216_)begin
        if(_zz_217_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_218_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_205_ <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end

endmodule

module StreamFork_3_ (
      input   io_input_valid,
      output reg  io_input_ready,
      input   io_input_payload_wr,
      input  [31:0] io_input_payload_address,
      input  [31:0] io_input_payload_data,
      input  [1:0] io_input_payload_size,
      output  io_outputs_0_valid,
      input   io_outputs_0_ready,
      output  io_outputs_0_payload_wr,
      output [31:0] io_outputs_0_payload_address,
      output [31:0] io_outputs_0_payload_data,
      output [1:0] io_outputs_0_payload_size,
      output  io_outputs_1_valid,
      input   io_outputs_1_ready,
      output  io_outputs_1_payload_wr,
      output [31:0] io_outputs_1_payload_address,
      output [31:0] io_outputs_1_payload_data,
      output [1:0] io_outputs_1_payload_size,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  linkEnable_0;
  reg  linkEnable_1;
  
	initial begin
		linkEnable_0	<= 0; 
		linkEnable_1	<= 0; 
	end
	
  always @ ( * ) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && linkEnable_0))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && linkEnable_1))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && linkEnable_0);
  assign io_outputs_0_payload_wr = io_input_payload_wr;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_1_valid = (io_input_valid && linkEnable_1);
  assign io_outputs_1_payload_wr = io_input_payload_wr;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_size = io_input_payload_size;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      linkEnable_0 <= 1'b1;
      linkEnable_1 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        linkEnable_0 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        linkEnable_1 <= 1'b0;
      end
      if(io_input_ready)begin
        linkEnable_0 <= 1'b1;
        linkEnable_1 <= 1'b1;
      end
    end
  end

endmodule

module JtagBridge (
      input   io_jtag_tms,
      input   io_jtag_tdi,
      output reg  io_jtag_tdo,
      input   io_jtag_tck,
      output  io_remote_cmd_valid,
      input   io_remote_cmd_ready,
      output  io_remote_cmd_payload_last,
      output [0:0] io_remote_cmd_payload_fragment,
      input   io_remote_rsp_valid,
      output  io_remote_rsp_ready,
      input   io_remote_rsp_payload_error,
      input  [31:0] io_remote_rsp_payload_data,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_systemReset);
  wire  flowCCByToggle_1__io_output_valid;
  wire  flowCCByToggle_1__io_output_payload_last;
  wire [0:0] flowCCByToggle_1__io_output_payload_fragment;
  wire  _zz_2_;
  wire  _zz_3_;
  wire [3:0] _zz_4_;
  wire [3:0] _zz_5_;
  wire [3:0] _zz_6_;
  wire  system_cmd_valid;
  wire  system_cmd_payload_last;
  wire [0:0] system_cmd_payload_fragment;
  reg  system_rsp_valid;
  reg  system_rsp_payload_error;
  reg [31:0] system_rsp_payload_data;
  wire `JtagState_defaultEncoding_type jtag_tap_fsm_stateNext;
  reg `JtagState_defaultEncoding_type jtag_tap_fsm_state = `JtagState_defaultEncoding_RESET;
  reg `JtagState_defaultEncoding_type _zz_1_;
  reg [3:0] jtag_tap_instruction;
  reg [3:0] jtag_tap_instructionShift;
  reg  jtag_tap_bypass;
  wire [0:0] jtag_idcodeArea_instructionId;
  wire  jtag_idcodeArea_instructionHit;
  reg [31:0] jtag_idcodeArea_shifter;
  wire [1:0] jtag_writeArea_instructionId;
  wire  jtag_writeArea_instructionHit;
  reg  jtag_writeArea_source_valid;
  wire  jtag_writeArea_source_payload_last;
  wire [0:0] jtag_writeArea_source_payload_fragment;
  wire [1:0] jtag_readArea_instructionId;
  wire  jtag_readArea_instructionHit;
  reg [33:0] jtag_readArea_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_1__string;
  `endif

  
	initial begin
  	_zz_1_ = 0;
  	system_rsp_valid					= 0;
  	system_rsp_payload_error	= 0;
  	system_rsp_payload_data		= 0;
  	jtag_tap_fsm_state = `JtagState_defaultEncoding_RESET;
  	jtag_tap_instruction			= 0;
  	jtag_tap_instructionShift	= 0;
  	jtag_tap_bypass						= 0;
  	jtag_idcodeArea_shifter		= 0;
  	jtag_writeArea_source_valid	= 0;
  	jtag_readArea_shifter				= 0;
  	`ifndef SYNTHESIS
  		jtag_tap_fsm_stateNext_string	= 0;
  		jtag_tap_fsm_state_string			= 0;
  		_zz_1__string									= 0;
  	`endif
	end
	
  assign _zz_2_ = (jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT);
  assign _zz_3_ = (jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT);
  assign _zz_4_ = {3'd0, jtag_idcodeArea_instructionId};
  assign _zz_5_ = {2'd0, jtag_writeArea_instructionId};
  assign _zz_6_ = {2'd0, jtag_readArea_instructionId};
  FlowCCByToggle flowCCByToggle_1_ (
    .io_input_valid(jtag_writeArea_source_valid),
    .io_input_payload_last(jtag_writeArea_source_payload_last),
    .io_input_payload_fragment(jtag_writeArea_source_payload_fragment),
    .io_output_valid(flowCCByToggle_1__io_output_valid),
    .io_output_payload_last(flowCCByToggle_1__io_output_payload_last),
    .io_output_payload_fragment(flowCCByToggle_1__io_output_payload_fragment),
    ._zz_1_(io_jtag_tck),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_systemReset(toplevel_resetCtrl_systemReset)
  );
  `ifndef SYNTHESIS
  always @( * ) begin
    case(jtag_tap_fsm_stateNext)
      `JtagState_defaultEncoding_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @( * ) begin
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_RESET : jtag_tap_fsm_state_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @( * ) begin
    case(_zz_1_)
      `JtagState_defaultEncoding_RESET : _zz_1__string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : _zz_1__string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : _zz_1__string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : _zz_1__string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : _zz_1__string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : _zz_1__string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : _zz_1__string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : _zz_1__string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : _zz_1__string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : _zz_1__string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : _zz_1__string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : _zz_1__string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : _zz_1__string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : _zz_1__string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : _zz_1__string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : _zz_1__string = "DR_UPDATE ";
      default : _zz_1__string = "??????????";
    endcase
  end
  `endif

  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_ready = 1'b1;
  always @ ( * ) begin
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IDLE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      `JtagState_defaultEncoding_IR_SELECT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_RESET : `JtagState_defaultEncoding_IR_CAPTURE);
      end
      `JtagState_defaultEncoding_IR_CAPTURE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT1 : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT1 : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_EXIT1 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_UPDATE : `JtagState_defaultEncoding_IR_PAUSE);
      end
      `JtagState_defaultEncoding_IR_PAUSE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT2 : `JtagState_defaultEncoding_IR_PAUSE);
      end
      `JtagState_defaultEncoding_IR_EXIT2 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_UPDATE : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      `JtagState_defaultEncoding_DR_SELECT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_SELECT : `JtagState_defaultEncoding_DR_CAPTURE);
      end
      `JtagState_defaultEncoding_DR_CAPTURE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT1 : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT1 : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_EXIT1 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_UPDATE : `JtagState_defaultEncoding_DR_PAUSE);
      end
      `JtagState_defaultEncoding_DR_PAUSE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT2 : `JtagState_defaultEncoding_DR_PAUSE);
      end
      `JtagState_defaultEncoding_DR_EXIT2 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_UPDATE : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_UPDATE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      default : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_RESET : `JtagState_defaultEncoding_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_1_;
  always @ ( * ) begin
    io_jtag_tdo = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IR_CAPTURE : begin
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        io_jtag_tdo = jtag_tap_instructionShift[0];
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_instructionHit)begin
      if(_zz_2_)begin
        io_jtag_tdo = jtag_idcodeArea_shifter[0];
      end
    end
    if(jtag_readArea_instructionHit)begin
      if(_zz_3_)begin
        io_jtag_tdo = jtag_readArea_shifter[0];
      end
    end
  end

  assign jtag_idcodeArea_instructionId = (1'b1);
  assign jtag_idcodeArea_instructionHit = (jtag_tap_instruction == _zz_4_);
  assign jtag_writeArea_instructionId = (2'b10);
  assign jtag_writeArea_instructionHit = (jtag_tap_instruction == _zz_5_);
  always @ ( * ) begin
    jtag_writeArea_source_valid = 1'b0;
    if(jtag_writeArea_instructionHit)begin
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT))begin
        jtag_writeArea_source_valid = 1'b1;
      end
    end
  end

  assign jtag_writeArea_source_payload_last = io_jtag_tms;
  assign jtag_writeArea_source_payload_fragment[0] = io_jtag_tdi;
  assign system_cmd_valid = flowCCByToggle_1__io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1__io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1__io_output_payload_fragment;
  assign jtag_readArea_instructionId = (2'b11);
  assign jtag_readArea_instructionHit = (jtag_tap_instruction == _zz_6_);
  always @ (posedge toplevel_io_axiClk) begin
    if(io_remote_cmd_valid)begin
      system_rsp_valid <= 1'b0;
    end
    if((io_remote_rsp_valid && io_remote_rsp_ready))begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @ (posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IR_CAPTURE : begin
        jtag_tap_instructionShift <= jtag_tap_instruction;
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
        jtag_tap_bypass <= io_jtag_tdi;
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_instructionHit)begin
      if(_zz_2_)begin
        jtag_idcodeArea_shifter <= ({io_jtag_tdi,jtag_idcodeArea_shifter} >>> 1);
      end
    end
    if((jtag_tap_fsm_state == `JtagState_defaultEncoding_RESET))begin
      jtag_idcodeArea_shifter <= (32'b00010000000000000001111111111111);
      jtag_tap_instruction <= {3'd0, jtag_idcodeArea_instructionId};
    end
    if(jtag_readArea_instructionHit)begin
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_CAPTURE))begin
        jtag_readArea_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(_zz_3_)begin
        jtag_readArea_shifter <= ({io_jtag_tdi,jtag_readArea_shifter} >>> 1);
      end
    end
  end

endmodule

module SystemDebugger (
      input   io_remote_cmd_valid,
      output  io_remote_cmd_ready,
      input   io_remote_cmd_payload_last,
      input  [0:0] io_remote_cmd_payload_fragment,
      output  io_remote_rsp_valid,
      input   io_remote_rsp_ready,
      output  io_remote_rsp_payload_error,
      output [31:0] io_remote_rsp_payload_data,
      output  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output [31:0] io_mem_cmd_payload_address,
      output [31:0] io_mem_cmd_payload_data,
      output  io_mem_cmd_payload_wr,
      output [1:0] io_mem_cmd_payload_size,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_systemReset);
  wire  _zz_2_;
  wire [0:0] _zz_3_;
  reg [66:0] dispatcher_dataShifter;
  reg  dispatcher_dataLoaded;
  reg [7:0] dispatcher_headerShifter;
  wire [7:0] dispatcher_header;
  reg  dispatcher_headerLoaded;
  reg [2:0] dispatcher_counter;
  wire [66:0] _zz_1_;
  
	initial begin
  	dispatcher_dataShifter		= 0;
  	dispatcher_dataLoaded			= 0;
  	dispatcher_headerShifter	= 0;
  	dispatcher_headerLoaded		= 0;
  	dispatcher_counter				= 0;
	end
	
  assign _zz_2_ = (dispatcher_headerLoaded == 1'b0);
  assign _zz_3_ = _zz_1_[64 : 64];
  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_1_ = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_1_[31 : 0];
  assign io_mem_cmd_payload_data = _zz_1_[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_3_[0];
  assign io_mem_cmd_payload_size = _zz_1_[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == (8'b00000000)));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_systemReset) begin
    if (toplevel_resetCtrl_systemReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= (3'b000);
    end else begin
      if(io_remote_cmd_valid)begin
        if(_zz_2_)begin
          dispatcher_counter <= (dispatcher_counter + (3'b001));
          if((dispatcher_counter == (3'b111)))begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last)begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= (3'b000);
        end
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @ (posedge toplevel_io_axiClk) begin
    if(io_remote_cmd_valid)begin
      if(_zz_2_)begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end

endmodule

module Axi4SharedDecoder (
      input   io_input_arw_valid,
      output  io_input_arw_ready,
      input  [31:0] io_input_arw_payload_addr,
      input  [2:0] io_input_arw_payload_size,
      input  [3:0] io_input_arw_payload_cache,
      input  [2:0] io_input_arw_payload_prot,
      input   io_input_arw_payload_write,
      input   io_input_w_valid,
      output  io_input_w_ready,
      input  [31:0] io_input_w_payload_data,
      input  [3:0] io_input_w_payload_strb,
      input   io_input_w_payload_last,
      output  io_input_b_valid,
      input   io_input_b_ready,
      output reg [1:0] io_input_b_payload_resp,
      output  io_input_r_valid,
      input   io_input_r_ready,
      output [31:0] io_input_r_payload_data,
      output reg [1:0] io_input_r_payload_resp,
      output reg  io_input_r_payload_last,
      output  io_readOutputs_0_ar_valid,
      input   io_readOutputs_0_ar_ready,
      output [31:0] io_readOutputs_0_ar_payload_addr,
      output [2:0] io_readOutputs_0_ar_payload_size,
      output [3:0] io_readOutputs_0_ar_payload_cache,
      output [2:0] io_readOutputs_0_ar_payload_prot,
      input   io_readOutputs_0_r_valid,
      output  io_readOutputs_0_r_ready,
      input  [31:0] io_readOutputs_0_r_payload_data,
      input  [1:0] io_readOutputs_0_r_payload_resp,
      input   io_readOutputs_0_r_payload_last,
      output  io_writeOutputs_0_aw_valid,
      input   io_writeOutputs_0_aw_ready,
      output [31:0] io_writeOutputs_0_aw_payload_addr,
      output [2:0] io_writeOutputs_0_aw_payload_size,
      output [3:0] io_writeOutputs_0_aw_payload_cache,
      output [2:0] io_writeOutputs_0_aw_payload_prot,
      output  io_writeOutputs_0_w_valid,
      input   io_writeOutputs_0_w_ready,
      output [31:0] io_writeOutputs_0_w_payload_data,
      output [3:0] io_writeOutputs_0_w_payload_strb,
      output  io_writeOutputs_0_w_payload_last,
      input   io_writeOutputs_0_b_valid,
      output  io_writeOutputs_0_b_ready,
      input  [1:0] io_writeOutputs_0_b_payload_resp,
      output  io_sharedOutputs_0_arw_valid,
      input   io_sharedOutputs_0_arw_ready,
      output [31:0] io_sharedOutputs_0_arw_payload_addr,
      output [2:0] io_sharedOutputs_0_arw_payload_size,
      output [3:0] io_sharedOutputs_0_arw_payload_cache,
      output [2:0] io_sharedOutputs_0_arw_payload_prot,
      output  io_sharedOutputs_0_arw_payload_write,
      output  io_sharedOutputs_0_w_valid,
      input   io_sharedOutputs_0_w_ready,
      output [31:0] io_sharedOutputs_0_w_payload_data,
      output [3:0] io_sharedOutputs_0_w_payload_strb,
      output  io_sharedOutputs_0_w_payload_last,
      input   io_sharedOutputs_0_b_valid,
      output  io_sharedOutputs_0_b_ready,
      input  [1:0] io_sharedOutputs_0_b_payload_resp,
      input   io_sharedOutputs_0_r_valid,
      output  io_sharedOutputs_0_r_ready,
      input  [31:0] io_sharedOutputs_0_r_payload_data,
      input  [1:0] io_sharedOutputs_0_r_payload_resp,
      input   io_sharedOutputs_0_r_payload_last,
      output  io_sharedOutputs_1_arw_valid,
      input   io_sharedOutputs_1_arw_ready,
      output [31:0] io_sharedOutputs_1_arw_payload_addr,
      output [2:0] io_sharedOutputs_1_arw_payload_size,
      output [3:0] io_sharedOutputs_1_arw_payload_cache,
      output [2:0] io_sharedOutputs_1_arw_payload_prot,
      output  io_sharedOutputs_1_arw_payload_write,
      output  io_sharedOutputs_1_w_valid,
      input   io_sharedOutputs_1_w_ready,
      output [31:0] io_sharedOutputs_1_w_payload_data,
      output [3:0] io_sharedOutputs_1_w_payload_strb,
      output  io_sharedOutputs_1_w_payload_last,
      input   io_sharedOutputs_1_b_valid,
      output  io_sharedOutputs_1_b_ready,
      input  [1:0] io_sharedOutputs_1_b_payload_resp,
      input   io_sharedOutputs_1_r_valid,
      output  io_sharedOutputs_1_r_ready,
      input  [31:0] io_sharedOutputs_1_r_payload_data,
      input  [1:0] io_sharedOutputs_1_r_payload_resp,
      input   io_sharedOutputs_1_r_payload_last,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_14_;
  wire  _zz_15_;
  reg [1:0] _zz_16_;
  reg [31:0] _zz_17_;
  reg [1:0] _zz_18_;
  reg  _zz_19_;
  wire  errorSlave_io_axi_arw_ready;
  wire  errorSlave_io_axi_w_ready;
  wire  errorSlave_io_axi_b_valid;
  wire [1:0] errorSlave_io_axi_b_payload_resp;
  wire  errorSlave_io_axi_r_valid;
  wire [31:0] errorSlave_io_axi_r_payload_data;
  wire [1:0] errorSlave_io_axi_r_payload_resp;
  wire  errorSlave_io_axi_r_payload_last;
  wire [31:0] _zz_20_;
  wire [31:0] _zz_21_;
  wire [31:0] _zz_22_;
  wire [31:0] _zz_23_;
  wire [0:0] _zz_24_;
  wire [0:0] _zz_25_;
  wire [0:0] _zz_26_;
  wire [31:0] _zz_27_;
  wire [31:0] _zz_28_;
  reg [2:0] _zz_1_;
  reg [2:0] _zz_2_;
  reg [2:0] _zz_3_;
  wire  cmdAllowedStart;
  reg [2:0] pendingCmdCounter;
  wire [2:0] _zz_4_;
  reg  pendingDataCounter_incrementIt;
  reg  pendingDataCounter_decrementIt;
  wire [2:0] pendingDataCounter_valueNext;
  reg [2:0] pendingDataCounter_value;
  wire  pendingDataCounter_willOverflowIfInc;
  wire  pendingDataCounter_willOverflow;
  reg [2:0] pendingDataCounter_finalIncrement;
  wire [3:0] decodedCmdSels;
  wire  decodedCmdError;
  reg [3:0] pendingSels;
  reg  pendingError;
  wire  allowCmd;
  reg  allowData;
  reg  _zz_5_;
  wire [1:0] _zz_6_;
  wire [1:0] _zz_7_;
  wire [2:0] _zz_8_;
  wire  _zz_9_;
  wire  _zz_10_;
  wire [1:0] writeRspIndex;
  wire [2:0] _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire [1:0] readRspIndex;
  
	initial begin
		_zz_16_	= 0;
		_zz_17_	= 0;
		_zz_18_	= 0;
		_zz_19_	= 0;
		_zz_1_	= 0;
		_zz_2_	= 0;
		_zz_3_	= 0;
		_zz_5_	= 0;
		pendingCmdCounter	= 0;
		pendingDataCounter_incrementIt		= 0;
		pendingDataCounter_decrementIt		= 0;
		pendingDataCounter_value					= 0;
		pendingDataCounter_finalIncrement	= 0;
		pendingSels		= 0;
		pendingError	= 0;
		allowData			= 0;
	end
	
  assign _zz_20_ = (32'b11111111111100000000000000000000);
  assign _zz_21_ = (32'b11111111111111111000000000000000);
  assign _zz_22_ = (32'b10000000000000000000000000000000);
  assign _zz_23_ = (32'b10000000000000000000000000000000);
  assign _zz_24_ = decodedCmdSels[0 : 0];
  assign _zz_25_ = decodedCmdSels[1 : 1];
  assign _zz_26_ = pendingSels[1 : 1];
  assign _zz_27_ = _zz_22_;
  assign _zz_28_ = _zz_23_;
  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid(_zz_14_),
    .io_axi_arw_ready(errorSlave_io_axi_arw_ready),
    .io_axi_arw_payload_addr(io_input_arw_payload_addr),
    .io_axi_arw_payload_size(io_input_arw_payload_size),
    .io_axi_arw_payload_cache(io_input_arw_payload_cache),
    .io_axi_arw_payload_prot(io_input_arw_payload_prot),
    .io_axi_arw_payload_write(io_input_arw_payload_write),
    .io_axi_w_valid(_zz_15_),
    .io_axi_w_ready(errorSlave_io_axi_w_ready),
    .io_axi_w_payload_data(io_input_w_payload_data),
    .io_axi_w_payload_strb(io_input_w_payload_strb),
    .io_axi_w_payload_last(io_input_w_payload_last),
    .io_axi_b_valid(errorSlave_io_axi_b_valid),
    .io_axi_b_ready(io_input_b_ready),
    .io_axi_b_payload_resp(errorSlave_io_axi_b_payload_resp),
    .io_axi_r_valid(errorSlave_io_axi_r_valid),
    .io_axi_r_ready(io_input_r_ready),
    .io_axi_r_payload_data(errorSlave_io_axi_r_payload_data),
    .io_axi_r_payload_resp(errorSlave_io_axi_r_payload_resp),
    .io_axi_r_payload_last(errorSlave_io_axi_r_payload_last),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  always @( * ) begin
    case(writeRspIndex)
      2'b00 : begin
        _zz_16_ = io_writeOutputs_0_b_payload_resp;
      end
      2'b01 : begin
        _zz_16_ = io_sharedOutputs_0_b_payload_resp;
      end
      default : begin
        _zz_16_ = io_sharedOutputs_1_b_payload_resp;
      end
    endcase
  end

  always @( * ) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_17_ = io_readOutputs_0_r_payload_data;
        _zz_18_ = io_readOutputs_0_r_payload_resp;
        _zz_19_ = io_readOutputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_17_ = io_sharedOutputs_0_r_payload_data;
        _zz_18_ = io_sharedOutputs_0_r_payload_resp;
        _zz_19_ = io_sharedOutputs_0_r_payload_last;
      end
      default : begin
        _zz_17_ = io_sharedOutputs_1_r_payload_data;
        _zz_18_ = io_sharedOutputs_1_r_payload_resp;
        _zz_19_ = io_sharedOutputs_1_r_payload_last;
      end
    endcase
  end

  always @ ( * ) begin
    _zz_1_ = _zz_2_;
    if(((io_input_r_valid && io_input_r_ready) && io_input_r_payload_last))begin
      _zz_1_ = (_zz_2_ - (3'b001));
    end
  end

  always @ ( * ) begin
    _zz_2_ = _zz_3_;
    if((io_input_b_valid && io_input_b_ready))begin
      _zz_2_ = (_zz_3_ - (3'b001));
    end
  end

  always @ ( * ) begin
    _zz_3_ = _zz_4_;
    if((io_input_arw_valid && io_input_arw_ready))begin
      _zz_3_ = (_zz_4_ + (3'b001));
    end
  end

  assign _zz_4_ = pendingCmdCounter;
  always @ ( * ) begin
    pendingDataCounter_incrementIt = 1'b0;
    if((cmdAllowedStart && io_input_arw_payload_write))begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @ ( * ) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(((io_input_w_valid && io_input_w_ready) && io_input_w_payload_last))begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_willOverflowIfInc = ((pendingDataCounter_value == (3'b111)) && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  always @ ( * ) begin
    if((pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt)))begin
      pendingDataCounter_finalIncrement = (3'b001);
    end else begin
      if(((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt))begin
        pendingDataCounter_finalIncrement = (3'b111);
      end else begin
        pendingDataCounter_finalIncrement = (3'b000);
      end
    end
  end

  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {{((io_input_arw_payload_addr & _zz_20_) == (32'b11110000000000000000000000000000)),((io_input_arw_payload_addr & _zz_21_) == (32'b10000000000000000000000000000000))},{(((io_input_arw_payload_addr & _zz_27_) == (32'b00000000000000000000000000000000)) && io_input_arw_payload_write),(((io_input_arw_payload_addr & _zz_28_) == (32'b00000000000000000000000000000000)) && (! io_input_arw_payload_write))}};
  assign decodedCmdError = (decodedCmdSels == (4'b0000));
  assign allowCmd = ((pendingCmdCounter == (3'b000)) || ((pendingCmdCounter != (3'b111)) && (pendingSels == decodedCmdSels)));
  always @ ( * ) begin
    allowData = (pendingDataCounter_value != (3'b000));
    if(((allowCmd && io_input_arw_valid) && io_input_arw_payload_write))begin
      allowData = 1'b1;
    end
  end

  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_5_);
  assign io_input_arw_ready = ((((decodedCmdSels & {io_sharedOutputs_1_arw_ready,{io_sharedOutputs_0_arw_ready,{io_writeOutputs_0_aw_ready,io_readOutputs_0_ar_ready}}}) != (4'b0000)) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign _zz_14_ = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign io_readOutputs_0_ar_valid = ((io_input_arw_valid && _zz_24_[0]) && allowCmd);
  assign io_readOutputs_0_ar_payload_addr = io_input_arw_payload_addr;
  assign io_readOutputs_0_ar_payload_size = io_input_arw_payload_size;
  assign io_readOutputs_0_ar_payload_cache = io_input_arw_payload_cache;
  assign io_readOutputs_0_ar_payload_prot = io_input_arw_payload_prot;
  assign io_writeOutputs_0_aw_valid = ((io_input_arw_valid && _zz_25_[0]) && allowCmd);
  assign io_writeOutputs_0_aw_payload_addr = io_input_arw_payload_addr;
  assign io_writeOutputs_0_aw_payload_size = io_input_arw_payload_size;
  assign io_writeOutputs_0_aw_payload_cache = io_input_arw_payload_cache;
  assign io_writeOutputs_0_aw_payload_prot = io_input_arw_payload_prot;
  assign _zz_6_ = decodedCmdSels[3 : 2];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_6_[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_6_[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((({pendingSels[3 : 2],pendingSels[1 : 1]} & {io_sharedOutputs_1_w_ready,{io_sharedOutputs_0_w_ready,io_writeOutputs_0_w_ready}}) != (3'b000)) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign _zz_15_ = ((io_input_w_valid && pendingError) && allowData);
  assign io_writeOutputs_0_w_valid = ((io_input_w_valid && _zz_26_[0]) && allowData);
  assign io_writeOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_writeOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_writeOutputs_0_w_payload_last = io_input_w_payload_last;
  assign _zz_7_ = pendingSels[3 : 2];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_7_[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_7_[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign _zz_8_ = {pendingSels[3 : 2],pendingSels[1 : 1]};
  assign _zz_9_ = _zz_8_[1];
  assign _zz_10_ = _zz_8_[2];
  assign writeRspIndex = {_zz_10_,_zz_9_};
  assign io_input_b_valid = (({io_sharedOutputs_1_b_valid,{io_sharedOutputs_0_b_valid,io_writeOutputs_0_b_valid}} != (3'b000)) || errorSlave_io_axi_b_valid);
  always @ ( * ) begin
    io_input_b_payload_resp = _zz_16_;
    if(pendingError)begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_writeOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign _zz_11_ = {pendingSels[3 : 2],pendingSels[0 : 0]};
  assign _zz_12_ = _zz_11_[1];
  assign _zz_13_ = _zz_11_[2];
  assign readRspIndex = {_zz_13_,_zz_12_};
  assign io_input_r_valid = (({io_sharedOutputs_1_r_valid,{io_sharedOutputs_0_r_valid,io_readOutputs_0_r_valid}} != (3'b000)) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_17_;
  always @ ( * ) begin
    io_input_r_payload_resp = _zz_18_;
    io_input_r_payload_last = _zz_19_;
    if(pendingError)begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_readOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  always @ (posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      pendingCmdCounter <= (3'b000);
      pendingDataCounter_value <= (3'b000);
      pendingSels <= (4'b0000);
      pendingError <= 1'b0;
      _zz_5_ <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_1_;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart)begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart)begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart)begin
        _zz_5_ <= 1'b0;
      end
      if(io_input_arw_ready)begin
        _zz_5_ <= 1'b1;
      end
    end
  end

endmodule

module Axi4SharedArbiter (
      input   io_sharedInputs_0_arw_valid,
      output  io_sharedInputs_0_arw_ready,
      input  [14:0] io_sharedInputs_0_arw_payload_addr,
      input  [3:0] io_sharedInputs_0_arw_payload_id,
      input  [7:0] io_sharedInputs_0_arw_payload_len,
      input  [2:0] io_sharedInputs_0_arw_payload_size,
      input  [1:0] io_sharedInputs_0_arw_payload_burst,
      input   io_sharedInputs_0_arw_payload_write,
      input   io_sharedInputs_0_w_valid,
      output  io_sharedInputs_0_w_ready,
      input  [31:0] io_sharedInputs_0_w_payload_data,
      input  [3:0] io_sharedInputs_0_w_payload_strb,
      input   io_sharedInputs_0_w_payload_last,
      output  io_sharedInputs_0_b_valid,
      input   io_sharedInputs_0_b_ready,
      output [3:0] io_sharedInputs_0_b_payload_id,
      output [1:0] io_sharedInputs_0_b_payload_resp,
      output  io_sharedInputs_0_r_valid,
      input   io_sharedInputs_0_r_ready,
      output [31:0] io_sharedInputs_0_r_payload_data,
      output [3:0] io_sharedInputs_0_r_payload_id,
      output [1:0] io_sharedInputs_0_r_payload_resp,
      output  io_sharedInputs_0_r_payload_last,
      output  io_output_arw_valid,
      input   io_output_arw_ready,
      output [14:0] io_output_arw_payload_addr,
      output [3:0] io_output_arw_payload_id,
      output [7:0] io_output_arw_payload_len,
      output [2:0] io_output_arw_payload_size,
      output [1:0] io_output_arw_payload_burst,
      output  io_output_arw_payload_write,
      output  io_output_w_valid,
      input   io_output_w_ready,
      output [31:0] io_output_w_payload_data,
      output [3:0] io_output_w_payload_strb,
      output  io_output_w_payload_last,
      input   io_output_b_valid,
      output  io_output_b_ready,
      input  [3:0] io_output_b_payload_id,
      input  [1:0] io_output_b_payload_resp,
      input   io_output_r_valid,
      output  io_output_r_ready,
      input  [31:0] io_output_r_payload_data,
      input  [3:0] io_output_r_payload_id,
      input  [1:0] io_output_r_payload_resp,
      input   io_output_r_payload_last,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  cmdArbiter_io_inputs_0_ready;
  wire  cmdArbiter_io_output_valid;
  wire [14:0] cmdArbiter_io_output_payload_addr;
  wire [3:0] cmdArbiter_io_output_payload_id;
  wire [7:0] cmdArbiter_io_output_payload_len;
  wire [2:0] cmdArbiter_io_output_payload_size;
  wire [1:0] cmdArbiter_io_output_payload_burst;
  wire  cmdArbiter_io_output_payload_write;
  wire [0:0] cmdArbiter_io_chosenOH;
  wire  streamFork_4__io_input_ready;
  wire  streamFork_4__io_outputs_0_valid;
  wire [14:0] streamFork_4__io_outputs_0_payload_addr;
  wire [3:0] streamFork_4__io_outputs_0_payload_id;
  wire [7:0] streamFork_4__io_outputs_0_payload_len;
  wire [2:0] streamFork_4__io_outputs_0_payload_size;
  wire [1:0] streamFork_4__io_outputs_0_payload_burst;
  wire  streamFork_4__io_outputs_0_payload_write;
  wire  streamFork_4__io_outputs_1_valid;
  wire [14:0] streamFork_4__io_outputs_1_payload_addr;
  wire [3:0] streamFork_4__io_outputs_1_payload_id;
  wire [7:0] streamFork_4__io_outputs_1_payload_len;
  wire [2:0] streamFork_4__io_outputs_1_payload_size;
  wire [1:0] streamFork_4__io_outputs_1_payload_burst;
  wire  streamFork_4__io_outputs_1_payload_write;
  wire  streamFifoLowLatency_4__io_push_ready;
  wire  streamFifoLowLatency_4__io_pop_valid;
  wire [2:0] streamFifoLowLatency_4__io_occupancy;
  wire  inputsCmd_0_valid;
  wire  inputsCmd_0_ready;
  wire [14:0] inputsCmd_0_payload_addr;
  wire [3:0] inputsCmd_0_payload_id;
  wire [7:0] inputsCmd_0_payload_len;
  wire [2:0] inputsCmd_0_payload_size;
  wire [1:0] inputsCmd_0_payload_burst;
  wire  inputsCmd_0_payload_write;
  reg  _zz_1_;
  wire  _zz_2_;
  wire  writeLogic_routeDataInput_valid;
  wire  writeLogic_routeDataInput_ready;
  wire [31:0] writeLogic_routeDataInput_payload_data;
  wire [3:0] writeLogic_routeDataInput_payload_strb;
  wire  writeLogic_routeDataInput_payload_last;
  wire  writeLogic_writeRspSels_0;
  wire  readRspSels_0;
  
	initial begin
  	_zz_1_	= 0;
  	_zz_3_	= 0;
	end
	
  StreamArbiter cmdArbiter (
    .io_inputs_0_valid(inputsCmd_0_valid),
    .io_inputs_0_ready(cmdArbiter_io_inputs_0_ready),
    .io_inputs_0_payload_addr(inputsCmd_0_payload_addr),
    .io_inputs_0_payload_id(inputsCmd_0_payload_id),
    .io_inputs_0_payload_len(inputsCmd_0_payload_len),
    .io_inputs_0_payload_size(inputsCmd_0_payload_size),
    .io_inputs_0_payload_burst(inputsCmd_0_payload_burst),
    .io_inputs_0_payload_write(inputsCmd_0_payload_write),
    .io_output_valid(cmdArbiter_io_output_valid),
    .io_output_ready(streamFork_4__io_input_ready),
    .io_output_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_output_payload_id(cmdArbiter_io_output_payload_id),
    .io_output_payload_len(cmdArbiter_io_output_payload_len),
    .io_output_payload_size(cmdArbiter_io_output_payload_size),
    .io_output_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_output_payload_write(cmdArbiter_io_output_payload_write),
    .io_chosenOH(cmdArbiter_io_chosenOH),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFork streamFork_4_ (
    .io_input_valid(cmdArbiter_io_output_valid),
    .io_input_ready(streamFork_4__io_input_ready),
    .io_input_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_input_payload_id(cmdArbiter_io_output_payload_id),
    .io_input_payload_len(cmdArbiter_io_output_payload_len),
    .io_input_payload_size(cmdArbiter_io_output_payload_size),
    .io_input_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_input_payload_write(cmdArbiter_io_output_payload_write),
    .io_outputs_0_valid(streamFork_4__io_outputs_0_valid),
    .io_outputs_0_ready(io_output_arw_ready),
    .io_outputs_0_payload_addr(streamFork_4__io_outputs_0_payload_addr),
    .io_outputs_0_payload_id(streamFork_4__io_outputs_0_payload_id),
    .io_outputs_0_payload_len(streamFork_4__io_outputs_0_payload_len),
    .io_outputs_0_payload_size(streamFork_4__io_outputs_0_payload_size),
    .io_outputs_0_payload_burst(streamFork_4__io_outputs_0_payload_burst),
    .io_outputs_0_payload_write(streamFork_4__io_outputs_0_payload_write),
    .io_outputs_1_valid(streamFork_4__io_outputs_1_valid),
    .io_outputs_1_ready(_zz_3_),
    .io_outputs_1_payload_addr(streamFork_4__io_outputs_1_payload_addr),
    .io_outputs_1_payload_id(streamFork_4__io_outputs_1_payload_id),
    .io_outputs_1_payload_len(streamFork_4__io_outputs_1_payload_len),
    .io_outputs_1_payload_size(streamFork_4__io_outputs_1_payload_size),
    .io_outputs_1_payload_burst(streamFork_4__io_outputs_1_payload_burst),
    .io_outputs_1_payload_write(streamFork_4__io_outputs_1_payload_write),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFifoLowLatency_1_ streamFifoLowLatency_4_ (
    .io_push_valid(_zz_1_),
    .io_push_ready(streamFifoLowLatency_4__io_push_ready),
    .io_pop_valid(streamFifoLowLatency_4__io_pop_valid),
    .io_pop_ready(_zz_4_),
    .io_flush(_zz_5_),
    .io_occupancy(streamFifoLowLatency_4__io_occupancy),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign io_output_arw_valid = streamFork_4__io_outputs_0_valid;
  assign io_output_arw_payload_addr = streamFork_4__io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = streamFork_4__io_outputs_0_payload_len;
  assign io_output_arw_payload_size = streamFork_4__io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = streamFork_4__io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = streamFork_4__io_outputs_0_payload_write;
  assign io_output_arw_payload_id = (streamFork_4__io_outputs_0_payload_write ? streamFork_4__io_outputs_0_payload_id : streamFork_4__io_outputs_0_payload_id);
  always @ ( * ) begin
    _zz_1_ = streamFork_4__io_outputs_1_valid;
    _zz_3_ = _zz_2_;
    if((! streamFork_4__io_outputs_1_payload_write))begin
      _zz_1_ = 1'b0;
      _zz_3_ = 1'b1;
    end
  end

  assign _zz_2_ = streamFifoLowLatency_4__io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (streamFifoLowLatency_4__io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((streamFifoLowLatency_4__io_pop_valid && io_output_w_ready) && 1'b1);
  assign _zz_4_ = ((io_output_w_valid && io_output_w_ready) && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  assign _zz_5_ = 1'b0;
endmodule

module Axi4SharedArbiter_1_ (
      input   io_sharedInputs_0_arw_valid,
      output  io_sharedInputs_0_arw_ready,
      input  [19:0] io_sharedInputs_0_arw_payload_addr,
      input  [3:0] io_sharedInputs_0_arw_payload_id,
      input  [7:0] io_sharedInputs_0_arw_payload_len,
      input  [2:0] io_sharedInputs_0_arw_payload_size,
      input  [1:0] io_sharedInputs_0_arw_payload_burst,
      input   io_sharedInputs_0_arw_payload_write,
      input   io_sharedInputs_0_w_valid,
      output  io_sharedInputs_0_w_ready,
      input  [31:0] io_sharedInputs_0_w_payload_data,
      input  [3:0] io_sharedInputs_0_w_payload_strb,
      input   io_sharedInputs_0_w_payload_last,
      output  io_sharedInputs_0_b_valid,
      input   io_sharedInputs_0_b_ready,
      output [3:0] io_sharedInputs_0_b_payload_id,
      output [1:0] io_sharedInputs_0_b_payload_resp,
      output  io_sharedInputs_0_r_valid,
      input   io_sharedInputs_0_r_ready,
      output [31:0] io_sharedInputs_0_r_payload_data,
      output [3:0] io_sharedInputs_0_r_payload_id,
      output [1:0] io_sharedInputs_0_r_payload_resp,
      output  io_sharedInputs_0_r_payload_last,
      output  io_output_arw_valid,
      input   io_output_arw_ready,
      output [19:0] io_output_arw_payload_addr,
      output [3:0] io_output_arw_payload_id,
      output [7:0] io_output_arw_payload_len,
      output [2:0] io_output_arw_payload_size,
      output [1:0] io_output_arw_payload_burst,
      output  io_output_arw_payload_write,
      output  io_output_w_valid,
      input   io_output_w_ready,
      output [31:0] io_output_w_payload_data,
      output [3:0] io_output_w_payload_strb,
      output  io_output_w_payload_last,
      input   io_output_b_valid,
      output  io_output_b_ready,
      input  [3:0] io_output_b_payload_id,
      input  [1:0] io_output_b_payload_resp,
      input   io_output_r_valid,
      output  io_output_r_ready,
      input  [31:0] io_output_r_payload_data,
      input  [3:0] io_output_r_payload_id,
      input  [1:0] io_output_r_payload_resp,
      input   io_output_r_payload_last,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_4_;
  wire  _zz_5_;
  wire  cmdArbiter_io_inputs_0_ready;
  wire  cmdArbiter_io_output_valid;
  wire [19:0] cmdArbiter_io_output_payload_addr;
  wire [3:0] cmdArbiter_io_output_payload_id;
  wire [7:0] cmdArbiter_io_output_payload_len;
  wire [2:0] cmdArbiter_io_output_payload_size;
  wire [1:0] cmdArbiter_io_output_payload_burst;
  wire  cmdArbiter_io_output_payload_write;
  wire [0:0] cmdArbiter_io_chosenOH;
  wire  streamFork_4__io_input_ready;
  wire  streamFork_4__io_outputs_0_valid;
  wire [19:0] streamFork_4__io_outputs_0_payload_addr;
  wire [3:0] streamFork_4__io_outputs_0_payload_id;
  wire [7:0] streamFork_4__io_outputs_0_payload_len;
  wire [2:0] streamFork_4__io_outputs_0_payload_size;
  wire [1:0] streamFork_4__io_outputs_0_payload_burst;
  wire  streamFork_4__io_outputs_0_payload_write;
  wire  streamFork_4__io_outputs_1_valid;
  wire [19:0] streamFork_4__io_outputs_1_payload_addr;
  wire [3:0] streamFork_4__io_outputs_1_payload_id;
  wire [7:0] streamFork_4__io_outputs_1_payload_len;
  wire [2:0] streamFork_4__io_outputs_1_payload_size;
  wire [1:0] streamFork_4__io_outputs_1_payload_burst;
  wire  streamFork_4__io_outputs_1_payload_write;
  wire  streamFifoLowLatency_4__io_push_ready;
  wire  streamFifoLowLatency_4__io_pop_valid;
  wire [2:0] streamFifoLowLatency_4__io_occupancy;
  wire  inputsCmd_0_valid;
  wire  inputsCmd_0_ready;
  wire [19:0] inputsCmd_0_payload_addr;
  wire [3:0] inputsCmd_0_payload_id;
  wire [7:0] inputsCmd_0_payload_len;
  wire [2:0] inputsCmd_0_payload_size;
  wire [1:0] inputsCmd_0_payload_burst;
  wire  inputsCmd_0_payload_write;
  wire  _zz_2_;
  wire  writeLogic_routeDataInput_valid;
  wire  writeLogic_routeDataInput_ready;
  wire [31:0] writeLogic_routeDataInput_payload_data;
  wire [3:0] writeLogic_routeDataInput_payload_strb;
  wire  writeLogic_routeDataInput_payload_last;
  wire  writeLogic_writeRspSels_0;
  wire  readRspSels_0;
  
  reg	_zz_1_	; 
	reg	_zz_3_	; 
	
	initial begin
    _zz_1_ = 0;
    _zz_3_ = 0;
  end
  
  
	
	
  StreamArbiter_1_ cmdArbiter (
    .io_inputs_0_valid(inputsCmd_0_valid),
    .io_inputs_0_ready(cmdArbiter_io_inputs_0_ready),
    .io_inputs_0_payload_addr(inputsCmd_0_payload_addr),
    .io_inputs_0_payload_id(inputsCmd_0_payload_id),
    .io_inputs_0_payload_len(inputsCmd_0_payload_len),
    .io_inputs_0_payload_size(inputsCmd_0_payload_size),
    .io_inputs_0_payload_burst(inputsCmd_0_payload_burst),
    .io_inputs_0_payload_write(inputsCmd_0_payload_write),
    .io_output_valid(cmdArbiter_io_output_valid),
    .io_output_ready(streamFork_4__io_input_ready),
    .io_output_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_output_payload_id(cmdArbiter_io_output_payload_id),
    .io_output_payload_len(cmdArbiter_io_output_payload_len),
    .io_output_payload_size(cmdArbiter_io_output_payload_size),
    .io_output_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_output_payload_write(cmdArbiter_io_output_payload_write),
    .io_chosenOH(cmdArbiter_io_chosenOH),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFork_1_ streamFork_4_ (
    .io_input_valid(cmdArbiter_io_output_valid),
    .io_input_ready(streamFork_4__io_input_ready),
    .io_input_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_input_payload_id(cmdArbiter_io_output_payload_id),
    .io_input_payload_len(cmdArbiter_io_output_payload_len),
    .io_input_payload_size(cmdArbiter_io_output_payload_size),
    .io_input_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_input_payload_write(cmdArbiter_io_output_payload_write),
    .io_outputs_0_valid(streamFork_4__io_outputs_0_valid),
    .io_outputs_0_ready(io_output_arw_ready),
    .io_outputs_0_payload_addr(streamFork_4__io_outputs_0_payload_addr),
    .io_outputs_0_payload_id(streamFork_4__io_outputs_0_payload_id),
    .io_outputs_0_payload_len(streamFork_4__io_outputs_0_payload_len),
    .io_outputs_0_payload_size(streamFork_4__io_outputs_0_payload_size),
    .io_outputs_0_payload_burst(streamFork_4__io_outputs_0_payload_burst),
    .io_outputs_0_payload_write(streamFork_4__io_outputs_0_payload_write),
    .io_outputs_1_valid(streamFork_4__io_outputs_1_valid),
    .io_outputs_1_ready(_zz_3_),
    .io_outputs_1_payload_addr(streamFork_4__io_outputs_1_payload_addr),
    .io_outputs_1_payload_id(streamFork_4__io_outputs_1_payload_id),
    .io_outputs_1_payload_len(streamFork_4__io_outputs_1_payload_len),
    .io_outputs_1_payload_size(streamFork_4__io_outputs_1_payload_size),
    .io_outputs_1_payload_burst(streamFork_4__io_outputs_1_payload_burst),
    .io_outputs_1_payload_write(streamFork_4__io_outputs_1_payload_write),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFifoLowLatency_1_ streamFifoLowLatency_4_ (
    .io_push_valid(_zz_1_),
    .io_push_ready(streamFifoLowLatency_4__io_push_ready),
    .io_pop_valid(streamFifoLowLatency_4__io_pop_valid),
    .io_pop_ready(_zz_4_),
    .io_flush(_zz_5_),
    .io_occupancy(streamFifoLowLatency_4__io_occupancy),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign io_output_arw_valid = streamFork_4__io_outputs_0_valid;
  assign io_output_arw_payload_addr = streamFork_4__io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = streamFork_4__io_outputs_0_payload_len;
  assign io_output_arw_payload_size = streamFork_4__io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = streamFork_4__io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = streamFork_4__io_outputs_0_payload_write;
  assign io_output_arw_payload_id = (streamFork_4__io_outputs_0_payload_write ? streamFork_4__io_outputs_0_payload_id : streamFork_4__io_outputs_0_payload_id);
  always @ ( * ) begin
    _zz_1_ = streamFork_4__io_outputs_1_valid;
    _zz_3_ = _zz_2_;
    if((! streamFork_4__io_outputs_1_payload_write))begin
      _zz_1_ = 1'b0;
      _zz_3_ = 1'b1;
    end
  end

  assign _zz_2_ = streamFifoLowLatency_4__io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (streamFifoLowLatency_4__io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((streamFifoLowLatency_4__io_pop_valid && io_output_w_ready) && 1'b1);
  assign _zz_4_ = ((io_output_w_valid && io_output_w_ready) && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  assign _zz_5_ = 1'b0;
endmodule

module Axi4ReadOnlyArbiter (
      input   io_inputs_0_ar_valid,
      output  io_inputs_0_ar_ready,
      input  [31:0] io_inputs_0_ar_payload_addr,
      input  [7:0] io_inputs_0_ar_payload_id,
      input  [3:0] io_inputs_0_ar_payload_region,
      input  [7:0] io_inputs_0_ar_payload_len,
      input  [2:0] io_inputs_0_ar_payload_size,
      input  [1:0] io_inputs_0_ar_payload_burst,
      input  [0:0] io_inputs_0_ar_payload_lock,
      input  [3:0] io_inputs_0_ar_payload_cache,
      input  [3:0] io_inputs_0_ar_payload_qos,
      input  [2:0] io_inputs_0_ar_payload_prot,
      output  io_inputs_0_r_valid,
      input   io_inputs_0_r_ready,
      output [31:0] io_inputs_0_r_payload_data,
      output [7:0] io_inputs_0_r_payload_id,
      output [1:0] io_inputs_0_r_payload_resp,
      output  io_inputs_0_r_payload_last,
      output  io_output_ar_valid,
      input   io_output_ar_ready,
      output [31:0] io_output_ar_payload_addr,
      output [7:0] io_output_ar_payload_id,
      output [3:0] io_output_ar_payload_region,
      output [7:0] io_output_ar_payload_len,
      output [2:0] io_output_ar_payload_size,
      output [1:0] io_output_ar_payload_burst,
      output [0:0] io_output_ar_payload_lock,
      output [3:0] io_output_ar_payload_cache,
      output [3:0] io_output_ar_payload_qos,
      output [2:0] io_output_ar_payload_prot,
      input   io_output_r_valid,
      output  io_output_r_ready,
      input  [31:0] io_output_r_payload_data,
      input  [7:0] io_output_r_payload_id,
      input  [1:0] io_output_r_payload_resp,
      input   io_output_r_payload_last,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  cmdArbiter_io_inputs_0_ready;
  wire  cmdArbiter_io_output_valid;
  wire [31:0] cmdArbiter_io_output_payload_addr;
  wire [7:0] cmdArbiter_io_output_payload_id;
  wire [3:0] cmdArbiter_io_output_payload_region;
  wire [7:0] cmdArbiter_io_output_payload_len;
  wire [2:0] cmdArbiter_io_output_payload_size;
  wire [1:0] cmdArbiter_io_output_payload_burst;
  wire [0:0] cmdArbiter_io_output_payload_lock;
  wire [3:0] cmdArbiter_io_output_payload_cache;
  wire [3:0] cmdArbiter_io_output_payload_qos;
  wire [2:0] cmdArbiter_io_output_payload_prot;
  wire [0:0] cmdArbiter_io_chosenOH;
  wire  readRspSels_0;
  StreamArbiter_2_ cmdArbiter (
    .io_inputs_0_valid(io_inputs_0_ar_valid),
    .io_inputs_0_ready(cmdArbiter_io_inputs_0_ready),
    .io_inputs_0_payload_addr(io_inputs_0_ar_payload_addr),
    .io_inputs_0_payload_id(io_inputs_0_ar_payload_id),
    .io_inputs_0_payload_region(io_inputs_0_ar_payload_region),
    .io_inputs_0_payload_len(io_inputs_0_ar_payload_len),
    .io_inputs_0_payload_size(io_inputs_0_ar_payload_size),
    .io_inputs_0_payload_burst(io_inputs_0_ar_payload_burst),
    .io_inputs_0_payload_lock(io_inputs_0_ar_payload_lock),
    .io_inputs_0_payload_cache(io_inputs_0_ar_payload_cache),
    .io_inputs_0_payload_qos(io_inputs_0_ar_payload_qos),
    .io_inputs_0_payload_prot(io_inputs_0_ar_payload_prot),
    .io_output_valid(cmdArbiter_io_output_valid),
    .io_output_ready(io_output_ar_ready),
    .io_output_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_output_payload_id(cmdArbiter_io_output_payload_id),
    .io_output_payload_region(cmdArbiter_io_output_payload_region),
    .io_output_payload_len(cmdArbiter_io_output_payload_len),
    .io_output_payload_size(cmdArbiter_io_output_payload_size),
    .io_output_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_output_payload_lock(cmdArbiter_io_output_payload_lock),
    .io_output_payload_cache(cmdArbiter_io_output_payload_cache),
    .io_output_payload_qos(cmdArbiter_io_output_payload_qos),
    .io_output_payload_prot(cmdArbiter_io_output_payload_prot),
    .io_chosenOH(cmdArbiter_io_chosenOH),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign io_inputs_0_ar_ready = cmdArbiter_io_inputs_0_ready;
  assign io_output_ar_valid = cmdArbiter_io_output_valid;
  assign io_output_ar_payload_addr = cmdArbiter_io_output_payload_addr;
  assign io_output_ar_payload_region = cmdArbiter_io_output_payload_region;
  assign io_output_ar_payload_len = cmdArbiter_io_output_payload_len;
  assign io_output_ar_payload_size = cmdArbiter_io_output_payload_size;
  assign io_output_ar_payload_burst = cmdArbiter_io_output_payload_burst;
  assign io_output_ar_payload_lock = cmdArbiter_io_output_payload_lock;
  assign io_output_ar_payload_cache = cmdArbiter_io_output_payload_cache;
  assign io_output_ar_payload_qos = cmdArbiter_io_output_payload_qos;
  assign io_output_ar_payload_prot = cmdArbiter_io_output_payload_prot;
  assign io_output_ar_payload_id = cmdArbiter_io_output_payload_id;
  assign readRspSels_0 = 1'b1;
  assign io_inputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_inputs_0_r_payload_data = io_output_r_payload_data;
  assign io_inputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_0_r_payload_last = io_output_r_payload_last;
  assign io_inputs_0_r_payload_id = io_output_r_payload_id[7 : 0];
  assign io_output_r_ready = io_inputs_0_r_ready;
endmodule

module Axi4WriteOnlyArbiter (
      input   io_inputs_0_aw_valid,
      output  io_inputs_0_aw_ready,
      input  [31:0] io_inputs_0_aw_payload_addr,
      input  [7:0] io_inputs_0_aw_payload_id,
      input  [3:0] io_inputs_0_aw_payload_region,
      input  [7:0] io_inputs_0_aw_payload_len,
      input  [2:0] io_inputs_0_aw_payload_size,
      input  [1:0] io_inputs_0_aw_payload_burst,
      input  [0:0] io_inputs_0_aw_payload_lock,
      input  [3:0] io_inputs_0_aw_payload_cache,
      input  [3:0] io_inputs_0_aw_payload_qos,
      input  [2:0] io_inputs_0_aw_payload_prot,
      input   io_inputs_0_w_valid,
      output  io_inputs_0_w_ready,
      input  [31:0] io_inputs_0_w_payload_data,
      input  [3:0] io_inputs_0_w_payload_strb,
      input   io_inputs_0_w_payload_last,
      output  io_inputs_0_b_valid,
      input   io_inputs_0_b_ready,
      output [7:0] io_inputs_0_b_payload_id,
      output [1:0] io_inputs_0_b_payload_resp,
      output  io_output_aw_valid,
      input   io_output_aw_ready,
      output [31:0] io_output_aw_payload_addr,
      output [7:0] io_output_aw_payload_id,
      output [3:0] io_output_aw_payload_region,
      output [7:0] io_output_aw_payload_len,
      output [2:0] io_output_aw_payload_size,
      output [1:0] io_output_aw_payload_burst,
      output [0:0] io_output_aw_payload_lock,
      output [3:0] io_output_aw_payload_cache,
      output [3:0] io_output_aw_payload_qos,
      output [2:0] io_output_aw_payload_prot,
      output  io_output_w_valid,
      input   io_output_w_ready,
      output [31:0] io_output_w_payload_data,
      output [3:0] io_output_w_payload_strb,
      output  io_output_w_payload_last,
      input   io_output_b_valid,
      output  io_output_b_ready,
      input  [7:0] io_output_b_payload_id,
      input  [1:0] io_output_b_payload_resp,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  wire  _zz_1_;
  wire  _zz_2_;
  wire  cmdArbiter_io_inputs_0_ready;
  wire  cmdArbiter_io_output_valid;
  wire [31:0] cmdArbiter_io_output_payload_addr;
  wire [7:0] cmdArbiter_io_output_payload_id;
  wire [3:0] cmdArbiter_io_output_payload_region;
  wire [7:0] cmdArbiter_io_output_payload_len;
  wire [2:0] cmdArbiter_io_output_payload_size;
  wire [1:0] cmdArbiter_io_output_payload_burst;
  wire [0:0] cmdArbiter_io_output_payload_lock;
  wire [3:0] cmdArbiter_io_output_payload_cache;
  wire [3:0] cmdArbiter_io_output_payload_qos;
  wire [2:0] cmdArbiter_io_output_payload_prot;
  wire [0:0] cmdArbiter_io_chosenOH;
  wire  streamFork_4__io_input_ready;
  wire  streamFork_4__io_outputs_0_valid;
  wire [31:0] streamFork_4__io_outputs_0_payload_addr;
  wire [7:0] streamFork_4__io_outputs_0_payload_id;
  wire [3:0] streamFork_4__io_outputs_0_payload_region;
  wire [7:0] streamFork_4__io_outputs_0_payload_len;
  wire [2:0] streamFork_4__io_outputs_0_payload_size;
  wire [1:0] streamFork_4__io_outputs_0_payload_burst;
  wire [0:0] streamFork_4__io_outputs_0_payload_lock;
  wire [3:0] streamFork_4__io_outputs_0_payload_cache;
  wire [3:0] streamFork_4__io_outputs_0_payload_qos;
  wire [2:0] streamFork_4__io_outputs_0_payload_prot;
  wire  streamFork_4__io_outputs_1_valid;
  wire [31:0] streamFork_4__io_outputs_1_payload_addr;
  wire [7:0] streamFork_4__io_outputs_1_payload_id;
  wire [3:0] streamFork_4__io_outputs_1_payload_region;
  wire [7:0] streamFork_4__io_outputs_1_payload_len;
  wire [2:0] streamFork_4__io_outputs_1_payload_size;
  wire [1:0] streamFork_4__io_outputs_1_payload_burst;
  wire [0:0] streamFork_4__io_outputs_1_payload_lock;
  wire [3:0] streamFork_4__io_outputs_1_payload_cache;
  wire [3:0] streamFork_4__io_outputs_1_payload_qos;
  wire [2:0] streamFork_4__io_outputs_1_payload_prot;
  wire  streamFifoLowLatency_4__io_push_ready;
  wire  streamFifoLowLatency_4__io_pop_valid;
  wire [2:0] streamFifoLowLatency_4__io_occupancy;
  wire  routeDataInput_valid;
  wire  routeDataInput_ready;
  wire [31:0] routeDataInput_payload_data;
  wire [3:0] routeDataInput_payload_strb;
  wire  routeDataInput_payload_last;
  wire  writeRspSels_0;
  StreamArbiter_2_ cmdArbiter (
    .io_inputs_0_valid(io_inputs_0_aw_valid),
    .io_inputs_0_ready(cmdArbiter_io_inputs_0_ready),
    .io_inputs_0_payload_addr(io_inputs_0_aw_payload_addr),
    .io_inputs_0_payload_id(io_inputs_0_aw_payload_id),
    .io_inputs_0_payload_region(io_inputs_0_aw_payload_region),
    .io_inputs_0_payload_len(io_inputs_0_aw_payload_len),
    .io_inputs_0_payload_size(io_inputs_0_aw_payload_size),
    .io_inputs_0_payload_burst(io_inputs_0_aw_payload_burst),
    .io_inputs_0_payload_lock(io_inputs_0_aw_payload_lock),
    .io_inputs_0_payload_cache(io_inputs_0_aw_payload_cache),
    .io_inputs_0_payload_qos(io_inputs_0_aw_payload_qos),
    .io_inputs_0_payload_prot(io_inputs_0_aw_payload_prot),
    .io_output_valid(cmdArbiter_io_output_valid),
    .io_output_ready(streamFork_4__io_input_ready),
    .io_output_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_output_payload_id(cmdArbiter_io_output_payload_id),
    .io_output_payload_region(cmdArbiter_io_output_payload_region),
    .io_output_payload_len(cmdArbiter_io_output_payload_len),
    .io_output_payload_size(cmdArbiter_io_output_payload_size),
    .io_output_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_output_payload_lock(cmdArbiter_io_output_payload_lock),
    .io_output_payload_cache(cmdArbiter_io_output_payload_cache),
    .io_output_payload_qos(cmdArbiter_io_output_payload_qos),
    .io_output_payload_prot(cmdArbiter_io_output_payload_prot),
    .io_chosenOH(cmdArbiter_io_chosenOH),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFork_2_ streamFork_4_ (
    .io_input_valid(cmdArbiter_io_output_valid),
    .io_input_ready(streamFork_4__io_input_ready),
    .io_input_payload_addr(cmdArbiter_io_output_payload_addr),
    .io_input_payload_id(cmdArbiter_io_output_payload_id),
    .io_input_payload_region(cmdArbiter_io_output_payload_region),
    .io_input_payload_len(cmdArbiter_io_output_payload_len),
    .io_input_payload_size(cmdArbiter_io_output_payload_size),
    .io_input_payload_burst(cmdArbiter_io_output_payload_burst),
    .io_input_payload_lock(cmdArbiter_io_output_payload_lock),
    .io_input_payload_cache(cmdArbiter_io_output_payload_cache),
    .io_input_payload_qos(cmdArbiter_io_output_payload_qos),
    .io_input_payload_prot(cmdArbiter_io_output_payload_prot),
    .io_outputs_0_valid(streamFork_4__io_outputs_0_valid),
    .io_outputs_0_ready(io_output_aw_ready),
    .io_outputs_0_payload_addr(streamFork_4__io_outputs_0_payload_addr),
    .io_outputs_0_payload_id(streamFork_4__io_outputs_0_payload_id),
    .io_outputs_0_payload_region(streamFork_4__io_outputs_0_payload_region),
    .io_outputs_0_payload_len(streamFork_4__io_outputs_0_payload_len),
    .io_outputs_0_payload_size(streamFork_4__io_outputs_0_payload_size),
    .io_outputs_0_payload_burst(streamFork_4__io_outputs_0_payload_burst),
    .io_outputs_0_payload_lock(streamFork_4__io_outputs_0_payload_lock),
    .io_outputs_0_payload_cache(streamFork_4__io_outputs_0_payload_cache),
    .io_outputs_0_payload_qos(streamFork_4__io_outputs_0_payload_qos),
    .io_outputs_0_payload_prot(streamFork_4__io_outputs_0_payload_prot),
    .io_outputs_1_valid(streamFork_4__io_outputs_1_valid),
    .io_outputs_1_ready(streamFifoLowLatency_4__io_push_ready),
    .io_outputs_1_payload_addr(streamFork_4__io_outputs_1_payload_addr),
    .io_outputs_1_payload_id(streamFork_4__io_outputs_1_payload_id),
    .io_outputs_1_payload_region(streamFork_4__io_outputs_1_payload_region),
    .io_outputs_1_payload_len(streamFork_4__io_outputs_1_payload_len),
    .io_outputs_1_payload_size(streamFork_4__io_outputs_1_payload_size),
    .io_outputs_1_payload_burst(streamFork_4__io_outputs_1_payload_burst),
    .io_outputs_1_payload_lock(streamFork_4__io_outputs_1_payload_lock),
    .io_outputs_1_payload_cache(streamFork_4__io_outputs_1_payload_cache),
    .io_outputs_1_payload_qos(streamFork_4__io_outputs_1_payload_qos),
    .io_outputs_1_payload_prot(streamFork_4__io_outputs_1_payload_prot),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  StreamFifoLowLatency_1_ streamFifoLowLatency_4_ (
    .io_push_valid(streamFork_4__io_outputs_1_valid),
    .io_push_ready(streamFifoLowLatency_4__io_push_ready),
    .io_pop_valid(streamFifoLowLatency_4__io_pop_valid),
    .io_pop_ready(_zz_1_),
    .io_flush(_zz_2_),
    .io_occupancy(streamFifoLowLatency_4__io_occupancy),
    .toplevel_io_axiClk(toplevel_io_axiClk),
    .toplevel_resetCtrl_axiReset(toplevel_resetCtrl_axiReset)
  );
  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  assign io_output_aw_valid = streamFork_4__io_outputs_0_valid;
  assign io_output_aw_payload_addr = streamFork_4__io_outputs_0_payload_addr;
  assign io_output_aw_payload_region = streamFork_4__io_outputs_0_payload_region;
  assign io_output_aw_payload_len = streamFork_4__io_outputs_0_payload_len;
  assign io_output_aw_payload_size = streamFork_4__io_outputs_0_payload_size;
  assign io_output_aw_payload_burst = streamFork_4__io_outputs_0_payload_burst;
  assign io_output_aw_payload_lock = streamFork_4__io_outputs_0_payload_lock;
  assign io_output_aw_payload_cache = streamFork_4__io_outputs_0_payload_cache;
  assign io_output_aw_payload_qos = streamFork_4__io_outputs_0_payload_qos;
  assign io_output_aw_payload_prot = streamFork_4__io_outputs_0_payload_prot;
  assign io_output_aw_payload_id = cmdArbiter_io_output_payload_id;
  assign routeDataInput_valid = io_inputs_0_w_valid;
  assign routeDataInput_ready = io_inputs_0_w_ready;
  assign routeDataInput_payload_data = io_inputs_0_w_payload_data;
  assign routeDataInput_payload_strb = io_inputs_0_w_payload_strb;
  assign routeDataInput_payload_last = io_inputs_0_w_payload_last;
  assign io_output_w_valid = (streamFifoLowLatency_4__io_pop_valid && routeDataInput_valid);
  assign io_output_w_payload_data = routeDataInput_payload_data;
  assign io_output_w_payload_strb = routeDataInput_payload_strb;
  assign io_output_w_payload_last = routeDataInput_payload_last;
  assign io_inputs_0_w_ready = ((streamFifoLowLatency_4__io_pop_valid && io_output_w_ready) && 1'b1);
  assign _zz_1_ = ((io_output_w_valid && io_output_w_ready) && io_output_w_payload_last);
  assign writeRspSels_0 = 1'b1;
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[7 : 0];
  assign io_output_b_ready = io_inputs_0_b_ready;
  assign _zz_2_ = 1'b0;
endmodule

module Apb3Decoder (
      input  [19:0] io_input_PADDR,
      input  [0:0] io_input_PSEL,
      input   io_input_PENABLE,
      output reg  io_input_PREADY,
      input   io_input_PWRITE,
      input  [31:0] io_input_PWDATA,
      output [31:0] io_input_PRDATA,
      output reg  io_input_PSLVERROR,
      output [19:0] io_output_PADDR,
      output reg [3:0] io_output_PSEL,
      output  io_output_PENABLE,
      input   io_output_PREADY,
      output  io_output_PWRITE,
      output [31:0] io_output_PWDATA,
      input  [31:0] io_output_PRDATA,
      input   io_output_PSLVERROR);
  wire [19:0] _zz_1_;
  wire [19:0] _zz_2_;
  wire [19:0] _zz_3_;
  wire [19:0] _zz_4_;
  assign _zz_1_ = (20'b11111111000000000000);
  assign _zz_2_ = (20'b11111111000000000000);
  assign _zz_3_ = (20'b11111111000000000000);
  assign _zz_4_ = (20'b11111111000000000000);
  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @ ( * ) begin
    io_output_PSEL[0] = (((io_input_PADDR & _zz_1_) == (20'b00000000000000000000)) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & _zz_2_) == (20'b00010000000000000000)) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & _zz_3_) == (20'b00100000000000000000)) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & _zz_4_) == (20'b11110000000000000000)) && io_input_PSEL[0]);
  end

  always @ ( * ) begin
    io_input_PREADY = io_output_PREADY;
    io_input_PSLVERROR = io_output_PSLVERROR;
    if((io_input_PSEL[0] && (io_output_PSEL == (4'b0000))))begin
      io_input_PREADY = 1'b1;
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
endmodule

module Apb3Router (
      input  [19:0] io_input_PADDR,
      input  [3:0] io_input_PSEL,
      input   io_input_PENABLE,
      output  io_input_PREADY,
      input   io_input_PWRITE,
      input  [31:0] io_input_PWDATA,
      output [31:0] io_input_PRDATA,
      output  io_input_PSLVERROR,
      output [19:0] io_outputs_0_PADDR,
      output [0:0] io_outputs_0_PSEL,
      output  io_outputs_0_PENABLE,
      input   io_outputs_0_PREADY,
      output  io_outputs_0_PWRITE,
      output [31:0] io_outputs_0_PWDATA,
      input  [31:0] io_outputs_0_PRDATA,
      input   io_outputs_0_PSLVERROR,
      output [19:0] io_outputs_1_PADDR,
      output [0:0] io_outputs_1_PSEL,
      output  io_outputs_1_PENABLE,
      input   io_outputs_1_PREADY,
      output  io_outputs_1_PWRITE,
      output [31:0] io_outputs_1_PWDATA,
      input  [31:0] io_outputs_1_PRDATA,
      input   io_outputs_1_PSLVERROR,
      output [19:0] io_outputs_2_PADDR,
      output [0:0] io_outputs_2_PSEL,
      output  io_outputs_2_PENABLE,
      input   io_outputs_2_PREADY,
      output  io_outputs_2_PWRITE,
      output [31:0] io_outputs_2_PWDATA,
      input  [31:0] io_outputs_2_PRDATA,
      input   io_outputs_2_PSLVERROR,
      output [19:0] io_outputs_3_PADDR,
      output [0:0] io_outputs_3_PSEL,
      output  io_outputs_3_PENABLE,
      input   io_outputs_3_PREADY,
      output  io_outputs_3_PWRITE,
      output [31:0] io_outputs_3_PWDATA,
      input  [31:0] io_outputs_3_PRDATA,
      input   io_outputs_3_PSLVERROR,
      input   toplevel_io_axiClk,
      input   toplevel_resetCtrl_axiReset);
  reg  _zz_4_;
  reg [31:0] _zz_5_;
  reg  _zz_6_;
  wire  _zz_1_;
  wire  _zz_2_;
  wire  _zz_3_;
  reg [1:0] selIndex;
  
	initial begin  
		_zz_4_		= 0;
	  _zz_5_		= 0;
	  _zz_6_		= 0;
	  selIndex	= 0;
	end
	
  always @( * ) begin
    case(selIndex)
      2'b00 : begin
        _zz_4_ = io_outputs_0_PREADY;
        _zz_5_ = io_outputs_0_PRDATA;
        _zz_6_ = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_4_ = io_outputs_1_PREADY;
        _zz_5_ = io_outputs_1_PRDATA;
        _zz_6_ = io_outputs_1_PSLVERROR;
      end
      2'b10 : begin
        _zz_4_ = io_outputs_2_PREADY;
        _zz_5_ = io_outputs_2_PRDATA;
        _zz_6_ = io_outputs_2_PSLVERROR;
      end
      default : begin
        _zz_4_ = io_outputs_3_PREADY;
        _zz_5_ = io_outputs_3_PRDATA;
        _zz_6_ = io_outputs_3_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign _zz_1_ = io_input_PSEL[3];
  assign _zz_2_ = (io_input_PSEL[1] || _zz_1_);
  assign _zz_3_ = (io_input_PSEL[2] || _zz_1_);
  assign io_input_PREADY = _zz_4_;
  assign io_input_PRDATA = _zz_5_;
  assign io_input_PSLVERROR = _zz_6_;
  always @ (posedge toplevel_io_axiClk) begin
    selIndex <= {_zz_3_,_zz_2_};
  end

endmodule

module EfxRiscvSoc (
      input   io_asyncReset,
      input   io_axiClk,
      output  io_axiReset,
      input   io_jtag_tms,
      input   io_jtag_tdi,
      output  io_jtag_tdo,
      input   io_jtag_tck,
      input  [7:0] io_gpioA_read,
      output [7:0] io_gpioA_write,
      output [7:0] io_gpioA_writeEnable,
      output  io_uartA_txd,
      input   io_uartA_rxd,
      output  axiA_awvalid,
      input   axiA_awready,
      output [31:0] axiA_awaddr,
      output [7:0] axiA_awid,
      output [3:0] axiA_awregion,
      output [7:0] axiA_awlen,
      output [2:0] axiA_awsize,
      output [1:0] axiA_awburst,
      output [0:0] axiA_awlock,
      output [3:0] axiA_awcache,
      output [3:0] axiA_awqos,
      output [2:0] axiA_awprot,
      output  axiA_wvalid,
      input   axiA_wready,
      output [31:0] axiA_wdata,
      output [3:0] axiA_wstrb,
      output  axiA_wlast,
      input   axiA_bvalid,
      output  axiA_bready,
      input  [7:0] axiA_bid,
      input  [1:0] axiA_bresp,
      output  axiA_arvalid,
      input   axiA_arready,
      output [31:0] axiA_araddr,
      output [7:0] axiA_arid,
      output [3:0] axiA_arregion,
      output [7:0] axiA_arlen,
      output [2:0] axiA_arsize,
      output [1:0] axiA_arburst,
      output [0:0] axiA_arlock,
      output [3:0] axiA_arcache,
      output [3:0] axiA_arqos,
      output [2:0] axiA_arprot,
      input   axiA_rvalid,
      output  axiA_rready,
      input  [31:0] axiA_rdata,
      input  [7:0] axiA_rid,
      input  [1:0] axiA_rresp,
      input   axiA_rlast,
      input   io_axiAInterrupt);
  wire  _zz_37_;
  wire  _zz_38_;
  wire [31:0] _zz_39_;
  wire [3:0] _zz_40_;
  wire  _zz_41_;
  wire  _zz_42_;
  wire [11:0] _zz_43_;
  wire [3:0] _zz_44_;
  wire [7:0] _zz_45_;
  wire [3:0] _zz_46_;
  reg [7:0] _zz_47_;
  wire  _zz_48_;
  wire  _zz_49_;
  wire  _zz_50_;
  wire  _zz_51_;
  wire [7:0] _zz_52_;
  wire  _zz_53_;
  wire  _zz_54_;
  wire  _zz_55_;
  reg  _zz_56_;
  wire [14:0] _zz_57_;
  wire [1:0] _zz_58_;
  wire [19:0] _zz_59_;
  wire [1:0] _zz_60_;
  wire [1:0] _zz_61_;
  wire [0:0] _zz_62_;
  wire [3:0] _zz_63_;
  wire [1:0] _zz_64_;
  wire [0:0] _zz_65_;
  wire [3:0] _zz_66_;
  wire  _zz_67_;
  wire  bufferCC_5__io_dataOut;
  wire  bufferCC_6__io_dataOut;
  wire  axi_ram_io_axis_0_arw_ready;
  wire  axi_ram_io_axis_0_w_ready;
  wire  axi_ram_io_axis_0_b_valid;
  wire [3:0] axi_ram_io_axis_0_b_payload_id;
  wire [1:0] axi_ram_io_axis_0_b_payload_resp;
  wire  axi_ram_io_axis_0_r_valid;
  wire [31:0] axi_ram_io_axis_0_r_payload_data;
  wire [3:0] axi_ram_io_axis_0_r_payload_id;
  wire [1:0] axi_ram_io_axis_0_r_payload_resp;
  wire  axi_ram_io_axis_0_r_payload_last;
  wire  axi_ram_io_axis_1_arw_ready;
  wire  axi_ram_io_axis_1_w_ready;
  wire  axi_ram_io_axis_1_b_valid;
  wire [3:0] axi_ram_io_axis_1_b_payload_id;
  wire [1:0] axi_ram_io_axis_1_b_payload_resp;
  wire  axi_ram_io_axis_1_r_valid;
  wire [31:0] axi_ram_io_axis_1_r_payload_data;
  wire [3:0] axi_ram_io_axis_1_r_payload_id;
  wire [1:0] axi_ram_io_axis_1_r_payload_resp;
  wire  axi_ram_io_axis_1_r_payload_last;
  wire  axi_apbBridge_io_axi_arw_ready;
  wire  axi_apbBridge_io_axi_w_ready;
  wire  axi_apbBridge_io_axi_b_valid;
  wire [3:0] axi_apbBridge_io_axi_b_payload_id;
  wire [1:0] axi_apbBridge_io_axi_b_payload_resp;
  wire  axi_apbBridge_io_axi_r_valid;
  wire [31:0] axi_apbBridge_io_axi_r_payload_data;
  wire [3:0] axi_apbBridge_io_axi_r_payload_id;
  wire [1:0] axi_apbBridge_io_axi_r_payload_resp;
  wire  axi_apbBridge_io_axi_r_payload_last;
  wire [19:0] axi_apbBridge_io_apb_PADDR;
  wire [0:0] axi_apbBridge_io_apb_PSEL;
  wire  axi_apbBridge_io_apb_PENABLE;
  wire  axi_apbBridge_io_apb_PWRITE;
  wire [31:0] axi_apbBridge_io_apb_PWDATA;
  wire [7:0] axi_gpioACtrl_io_gpio_write;
  wire [7:0] axi_gpioACtrl_io_gpio_writeEnable;
  wire  axi_gpioACtrl_io_bus_PREADY;
  wire [31:0] axi_gpioACtrl_io_bus_PRDATA;
  wire  axi_gpioACtrl_io_bus_PSLVERROR;
  wire [7:0] axi_gpioACtrl_io_interrupt;
  wire  axi_uartCtrl_io_apb_PREADY;
  wire [31:0] axi_uartCtrl_io_apb_PRDATA;
  wire  axi_uartCtrl_io_uart_txd;
  wire  axi_uartCtrl_io_interrupt;
  wire  axi_timerCtrl_io_apb_PREADY;
  wire [31:0] axi_timerCtrl_io_apb_PRDATA;
  wire  axi_timerCtrl_io_apb_PSLVERROR;
  wire [1:0] axi_timerCtrl_io_interrupts;
  wire  axi_interruptController_io_bus_PREADY;
  wire [31:0] axi_interruptController_io_bus_PRDATA;
  wire  axi_interruptController_io_bus_PSLVERROR;
  wire [7:0] axi_interruptController_io_pendings;
  wire  axi_core_cpu_iBus_cmd_valid;
  wire [31:0] axi_core_cpu_iBus_cmd_payload_pc;
  wire  axi_core_cpu_debug_bus_cmd_ready;
  wire [31:0] axi_core_cpu_debug_bus_rsp_data;
  wire  axi_core_cpu_debug_resetOut;
  wire  axi_core_cpu_dBus_cmd_valid;
  wire  axi_core_cpu_dBus_cmd_payload_wr;
  wire [31:0] axi_core_cpu_dBus_cmd_payload_address;
  wire [31:0] axi_core_cpu_dBus_cmd_payload_data;
  wire [1:0] axi_core_cpu_dBus_cmd_payload_size;
  wire  streamFork_4__io_input_ready;
  wire  streamFork_4__io_outputs_0_valid;
  wire  streamFork_4__io_outputs_0_payload_wr;
  wire [31:0] streamFork_4__io_outputs_0_payload_address;
  wire [31:0] streamFork_4__io_outputs_0_payload_data;
  wire [1:0] streamFork_4__io_outputs_0_payload_size;
  wire  streamFork_4__io_outputs_1_valid;
  wire  streamFork_4__io_outputs_1_payload_wr;
  wire [31:0] streamFork_4__io_outputs_1_payload_address;
  wire [31:0] streamFork_4__io_outputs_1_payload_data;
  wire [1:0] streamFork_4__io_outputs_1_payload_size;
  wire  jtagBridge_1__io_jtag_tdo;
  wire  jtagBridge_1__io_remote_cmd_valid;
  wire  jtagBridge_1__io_remote_cmd_payload_last;
  wire [0:0] jtagBridge_1__io_remote_cmd_payload_fragment;
  wire  jtagBridge_1__io_remote_rsp_ready;
  wire  systemDebugger_1__io_remote_cmd_ready;
  wire  systemDebugger_1__io_remote_rsp_valid;
  wire  systemDebugger_1__io_remote_rsp_payload_error;
  wire [31:0] systemDebugger_1__io_remote_rsp_payload_data;
  wire  systemDebugger_1__io_mem_cmd_valid;
  wire [31:0] systemDebugger_1__io_mem_cmd_payload_address;
  wire [31:0] systemDebugger_1__io_mem_cmd_payload_data;
  wire  systemDebugger_1__io_mem_cmd_payload_wr;
  wire [1:0] systemDebugger_1__io_mem_cmd_payload_size;
  wire  axi_core_dBus_decoder_io_input_arw_ready;
  wire  axi_core_dBus_decoder_io_input_w_ready;
  wire  axi_core_dBus_decoder_io_input_b_valid;
  wire [1:0] axi_core_dBus_decoder_io_input_b_payload_resp;
  wire  axi_core_dBus_decoder_io_input_r_valid;
  wire [31:0] axi_core_dBus_decoder_io_input_r_payload_data;
  wire [1:0] axi_core_dBus_decoder_io_input_r_payload_resp;
  wire  axi_core_dBus_decoder_io_input_r_payload_last;
  wire  axi_core_dBus_decoder_io_readOutputs_0_ar_valid;
  wire [31:0] axi_core_dBus_decoder_io_readOutputs_0_ar_payload_addr;
  wire [2:0] axi_core_dBus_decoder_io_readOutputs_0_ar_payload_size;
  wire [3:0] axi_core_dBus_decoder_io_readOutputs_0_ar_payload_cache;
  wire [2:0] axi_core_dBus_decoder_io_readOutputs_0_ar_payload_prot;
  wire  axi_core_dBus_decoder_io_readOutputs_0_r_ready;
  wire  axi_core_dBus_decoder_io_writeOutputs_0_aw_valid;
  wire [31:0] axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_addr;
  wire [2:0] axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_size;
  wire [3:0] axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_cache;
  wire [2:0] axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_prot;
  wire  axi_core_dBus_decoder_io_writeOutputs_0_w_valid;
  wire [31:0] axi_core_dBus_decoder_io_writeOutputs_0_w_payload_data;
  wire [3:0] axi_core_dBus_decoder_io_writeOutputs_0_w_payload_strb;
  wire  axi_core_dBus_decoder_io_writeOutputs_0_w_payload_last;
  wire  axi_core_dBus_decoder_io_writeOutputs_0_b_ready;
  wire  axi_core_dBus_decoder_io_sharedOutputs_0_arw_valid;
  wire [31:0] axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_addr;
  wire [2:0] axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_size;
  wire [3:0] axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_cache;
  wire [2:0] axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_prot;
  wire  axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_write;
  wire  axi_core_dBus_decoder_io_sharedOutputs_0_w_valid;
  wire [31:0] axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_data;
  wire [3:0] axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_strb;
  wire  axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_last;
  wire  axi_core_dBus_decoder_io_sharedOutputs_0_b_ready;
  wire  axi_core_dBus_decoder_io_sharedOutputs_0_r_ready;
  wire  axi_core_dBus_decoder_io_sharedOutputs_1_arw_valid;
  wire [31:0] axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_addr;
  wire [2:0] axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_size;
  wire [3:0] axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_cache;
  wire [2:0] axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_prot;
  wire  axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_write;
  wire  axi_core_dBus_decoder_io_sharedOutputs_1_w_valid;
  wire [31:0] axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_data;
  wire [3:0] axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_strb;
  wire  axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_last;
  wire  axi_core_dBus_decoder_io_sharedOutputs_1_b_ready;
  wire  axi_core_dBus_decoder_io_sharedOutputs_1_r_ready;
  wire  axi_ram_io_axis_1_arbiter_io_sharedInputs_0_arw_ready;
  wire  axi_ram_io_axis_1_arbiter_io_sharedInputs_0_w_ready;
  wire  axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_valid;
  wire [3:0] axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_payload_id;
  wire [1:0] axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_payload_resp;
  wire  axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_valid;
  wire [31:0] axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_data;
  wire [3:0] axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_id;
  wire [1:0] axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_resp;
  wire  axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_last;
  wire  axi_ram_io_axis_1_arbiter_io_output_arw_valid;
  wire [14:0] axi_ram_io_axis_1_arbiter_io_output_arw_payload_addr;
  wire [3:0] axi_ram_io_axis_1_arbiter_io_output_arw_payload_id;
  wire [7:0] axi_ram_io_axis_1_arbiter_io_output_arw_payload_len;
  wire [2:0] axi_ram_io_axis_1_arbiter_io_output_arw_payload_size;
  wire [1:0] axi_ram_io_axis_1_arbiter_io_output_arw_payload_burst;
  wire  axi_ram_io_axis_1_arbiter_io_output_arw_payload_write;
  wire  axi_ram_io_axis_1_arbiter_io_output_w_valid;
  wire [31:0] axi_ram_io_axis_1_arbiter_io_output_w_payload_data;
  wire [3:0] axi_ram_io_axis_1_arbiter_io_output_w_payload_strb;
  wire  axi_ram_io_axis_1_arbiter_io_output_w_payload_last;
  wire  axi_ram_io_axis_1_arbiter_io_output_b_ready;
  wire  axi_ram_io_axis_1_arbiter_io_output_r_ready;
  wire  axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire  axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire  axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire [3:0] axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire [1:0] axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire  axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire [31:0] axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire [3:0] axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire [1:0] axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire  axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire  axi_apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire [19:0] axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire [3:0] axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire [7:0] axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire [2:0] axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire [1:0] axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire  axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire  axi_apbBridge_io_axi_arbiter_io_output_w_valid;
  wire [31:0] axi_apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire [3:0] axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire  axi_apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire  axi_apbBridge_io_axi_arbiter_io_output_b_ready;
  wire  axi_apbBridge_io_axi_arbiter_io_output_r_ready;
  wire  axi4ReadOnlyArbiter_1__io_inputs_0_ar_ready;
  wire  axi4ReadOnlyArbiter_1__io_inputs_0_r_valid;
  wire [31:0] axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_data;
  wire [7:0] axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_id;
  wire [1:0] axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_resp;
  wire  axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_last;
  wire  axi4ReadOnlyArbiter_1__io_output_ar_valid;
  wire [31:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_addr;
  wire [7:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_id;
  wire [3:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_region;
  wire [7:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_len;
  wire [2:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_size;
  wire [1:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_burst;
  wire [0:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_lock;
  wire [3:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_cache;
  wire [3:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_qos;
  wire [2:0] axi4ReadOnlyArbiter_1__io_output_ar_payload_prot;
  wire  axi4ReadOnlyArbiter_1__io_output_r_ready;
  wire  axi4WriteOnlyArbiter_1__io_inputs_0_aw_ready;
  wire  axi4WriteOnlyArbiter_1__io_inputs_0_w_ready;
  wire  axi4WriteOnlyArbiter_1__io_inputs_0_b_valid;
  wire [7:0] axi4WriteOnlyArbiter_1__io_inputs_0_b_payload_id;
  wire [1:0] axi4WriteOnlyArbiter_1__io_inputs_0_b_payload_resp;
  wire  axi4WriteOnlyArbiter_1__io_output_aw_valid;
  wire [31:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_addr;
  wire [7:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_id;
  wire [3:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_region;
  wire [7:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_len;
  wire [2:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_size;
  wire [1:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_burst;
  wire [0:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_lock;
  wire [3:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_cache;
  wire [3:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_qos;
  wire [2:0] axi4WriteOnlyArbiter_1__io_output_aw_payload_prot;
  wire  axi4WriteOnlyArbiter_1__io_output_w_valid;
  wire [31:0] axi4WriteOnlyArbiter_1__io_output_w_payload_data;
  wire [3:0] axi4WriteOnlyArbiter_1__io_output_w_payload_strb;
  wire  axi4WriteOnlyArbiter_1__io_output_w_payload_last;
  wire  axi4WriteOnlyArbiter_1__io_output_b_ready;
  wire  io_apb_decoder_io_input_PREADY;
  wire [31:0] io_apb_decoder_io_input_PRDATA;
  wire  io_apb_decoder_io_input_PSLVERROR;
  wire [19:0] io_apb_decoder_io_output_PADDR;
  wire [3:0] io_apb_decoder_io_output_PSEL;
  wire  io_apb_decoder_io_output_PENABLE;
  wire  io_apb_decoder_io_output_PWRITE;
  wire [31:0] io_apb_decoder_io_output_PWDATA;
  wire  apb3Router_1__io_input_PREADY;
  wire [31:0] apb3Router_1__io_input_PRDATA;
  wire  apb3Router_1__io_input_PSLVERROR;
  wire [19:0] apb3Router_1__io_outputs_0_PADDR;
  wire [0:0] apb3Router_1__io_outputs_0_PSEL;
  wire  apb3Router_1__io_outputs_0_PENABLE;
  wire  apb3Router_1__io_outputs_0_PWRITE;
  wire [31:0] apb3Router_1__io_outputs_0_PWDATA;
  wire [19:0] apb3Router_1__io_outputs_1_PADDR;
  wire [0:0] apb3Router_1__io_outputs_1_PSEL;
  wire  apb3Router_1__io_outputs_1_PENABLE;
  wire  apb3Router_1__io_outputs_1_PWRITE;
  wire [31:0] apb3Router_1__io_outputs_1_PWDATA;
  wire [19:0] apb3Router_1__io_outputs_2_PADDR;
  wire [0:0] apb3Router_1__io_outputs_2_PSEL;
  wire  apb3Router_1__io_outputs_2_PENABLE;
  wire  apb3Router_1__io_outputs_2_PWRITE;
  wire [31:0] apb3Router_1__io_outputs_2_PWDATA;
  wire [19:0] apb3Router_1__io_outputs_3_PADDR;
  wire [0:0] apb3Router_1__io_outputs_3_PSEL;
  wire  apb3Router_1__io_outputs_3_PENABLE;
  wire  apb3Router_1__io_outputs_3_PWRITE;
  wire [31:0] apb3Router_1__io_outputs_3_PWDATA;
  wire  _zz_68_;
  wire  _zz_69_;
  wire  _zz_70_;
  wire [6:0] _zz_71_;
  reg  resetCtrl_systemResetUnbuffered;
  reg [5:0] resetCtrl_systemResetCounter = (6'b000000);
  wire [5:0] _zz_1_;
  reg  resetCtrl_systemReset;
  reg  resetCtrl_axiReset;
  wire  resetCtrl_vgaReset;
  wire  axi_ramReadOnlyPort_ar_valid;
  wire  axi_ramReadOnlyPort_ar_ready;
  wire [14:0] axi_ramReadOnlyPort_ar_payload_addr;
  wire [3:0] axi_ramReadOnlyPort_ar_payload_id;
  wire [7:0] axi_ramReadOnlyPort_ar_payload_len;
  wire [2:0] axi_ramReadOnlyPort_ar_payload_size;
  wire [1:0] axi_ramReadOnlyPort_ar_payload_burst;
  wire  axi_ramReadOnlyPort_r_valid;
  wire  axi_ramReadOnlyPort_r_ready;
  wire [31:0] axi_ramReadOnlyPort_r_payload_data;
  wire [3:0] axi_ramReadOnlyPort_r_payload_id;
  wire [1:0] axi_ramReadOnlyPort_r_payload_resp;
  wire  axi_ramReadOnlyPort_r_payload_last;
  reg  io_axiAInterrupt_regNext;
  wire  axi_core_iBus_ar_valid;
  wire  axi_core_iBus_ar_ready;
  wire [31:0] axi_core_iBus_ar_payload_addr;
  wire [3:0] axi_core_iBus_ar_payload_cache;
  wire [2:0] axi_core_iBus_ar_payload_prot;
  wire  axi_core_iBus_r_valid;
  wire  axi_core_iBus_r_ready;
  wire [31:0] axi_core_iBus_r_payload_data;
  wire [1:0] axi_core_iBus_r_payload_resp;
  wire  axi_core_iBus_r_payload_last;
  wire  axi_core_dBus_arw_valid;
  wire  axi_core_dBus_arw_ready;
  wire [31:0] axi_core_dBus_arw_payload_addr;
  wire [2:0] axi_core_dBus_arw_payload_size;
  wire [3:0] axi_core_dBus_arw_payload_cache;
  wire [2:0] axi_core_dBus_arw_payload_prot;
  wire  axi_core_dBus_arw_payload_write;
  wire  axi_core_dBus_w_valid;
  wire  axi_core_dBus_w_ready;
  wire [31:0] axi_core_dBus_w_payload_data;
  wire [3:0] axi_core_dBus_w_payload_strb;
  wire  axi_core_dBus_w_payload_last;
  wire  axi_core_dBus_b_valid;
  wire  axi_core_dBus_b_ready;
  wire [1:0] axi_core_dBus_b_payload_resp;
  wire  axi_core_dBus_r_valid;
  wire  axi_core_dBus_r_ready;
  wire [31:0] axi_core_dBus_r_payload_data;
  wire [1:0] axi_core_dBus_r_payload_resp;
  wire  axi_core_dBus_r_payload_last;
  reg  _zz_2_;
  reg  _zz_3_;
  reg [2:0] _zz_4_;
  reg [2:0] _zz_5_;
  wire [2:0] _zz_6_;
  wire  _zz_7_;
  reg  _zz_8_;
  reg [3:0] _zz_9_;
  reg  axi_core_cpu_debug_resetOut_regNext;
  reg  _zz_10_;
  wire [3:0] _zz_11_;
  wire [7:0] _zz_12_;
  wire  axi_core_dBus_arw_m2sPipe_valid;
  wire  axi_core_dBus_arw_m2sPipe_ready;
  wire [31:0] axi_core_dBus_arw_m2sPipe_payload_addr;
  wire [2:0] axi_core_dBus_arw_m2sPipe_payload_size;
  wire [3:0] axi_core_dBus_arw_m2sPipe_payload_cache;
  wire [2:0] axi_core_dBus_arw_m2sPipe_payload_prot;
  wire  axi_core_dBus_arw_m2sPipe_payload_write;
  reg  _zz_13_;
  reg [31:0] _zz_14_;
  reg [2:0] _zz_15_;
  reg [3:0] _zz_16_;
  reg [2:0] _zz_17_;
  reg  _zz_18_;
  wire  axi_core_dBus_w_m2sPipe_valid;
  wire  axi_core_dBus_w_m2sPipe_ready;
  wire [31:0] axi_core_dBus_w_m2sPipe_payload_data;
  wire [3:0] axi_core_dBus_w_m2sPipe_payload_strb;
  wire  axi_core_dBus_w_m2sPipe_payload_last;
  reg  _zz_19_;
  reg [31:0] _zz_20_;
  reg [3:0] _zz_21_;
  reg  _zz_22_;
  wire [3:0] _zz_23_;
  wire [7:0] _zz_24_;
  wire [3:0] _zz_25_;
  wire [7:0] _zz_26_;
  wire  axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire  axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire [19:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire [3:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire [7:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire [2:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire [1:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire  axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg  axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  reg  axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready;
  reg [19:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  reg [3:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  reg [7:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  reg [2:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  reg [1:0] axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  reg  axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  wire  axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid;
  wire  axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready;
  wire [31:0] axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data;
  wire [3:0] axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb;
  wire  axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last;
  reg  axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid;
  reg  axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready;
  reg [31:0] axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data;
  reg [3:0] axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb;
  reg  axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last;
  wire [7:0] _zz_27_;
  wire [3:0] _zz_28_;
  wire [7:0] _zz_29_;
  wire [31:0] _zz_30_;
  wire [7:0] _zz_31_;
  wire [7:0] _zz_32_;
  wire [3:0] _zz_33_;
  wire [7:0] _zz_34_;
  wire [31:0] _zz_35_;
  wire [7:0] _zz_36_;
  
	initial begin
  	_zz_2_	= 0;
  	_zz_3_	= 0;
  	_zz_4_	= 0;
  	_zz_5_	= 0;
  	_zz_8_	= 0;
  	_zz_9_	= 0;
  	_zz_10_	= 0;
  	_zz_13_	= 0;
  	_zz_14_	= 0;
  	_zz_15_	= 0;
  	_zz_16_	= 0;
  	_zz_17_	= 0;
  	_zz_18_	= 0;
  	_zz_19_	= 0;
  	_zz_20_	= 0;
  	_zz_21_	= 0;
  	_zz_22_	= 0;
  	_zz_56_	= 0;
  	_zz_47_	= 0;
		resetCtrl_systemReset						= 0;
		resetCtrl_axiReset							= 0;
		io_axiAInterrupt_regNext				= 0;
		resetCtrl_systemResetUnbuffered	= 0;
		resetCtrl_systemResetCounter 		= (6'b000000);
		axi_core_cpu_debug_resetOut_regNext = 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid					= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready					= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr		= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id			= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len		= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size		= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst	= 0;
		axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write	= 0;
		axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid				= 0;
		axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready				= 0;
		axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data	= 0;
		axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb	= 0;
		axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last	= 0;
	end
	
  assign _zz_68_ = (resetCtrl_systemResetCounter != _zz_1_);
  assign _zz_69_ = (! axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid);
  assign _zz_70_ = (! axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid);
  assign _zz_71_ = ({3'd0,_zz_9_} <<< streamFork_4__io_outputs_1_payload_address[1 : 0]);
  BufferCC_3_ bufferCC_5_ (
    .io_dataIn(io_asyncReset),
    .io_dataOut(bufferCC_5__io_dataOut),
    .toplevel_io_axiClk(io_axiClk)
  );
  BufferCC_3_ bufferCC_6_ (
    .io_dataIn(resetCtrl_axiReset),
    .io_dataOut(bufferCC_6__io_dataOut),
    .toplevel_io_axiClk(io_axiClk)
  );
  Axi4SharedOnChipRamMultiPort axi_ram (
    .io_axis_0_arw_valid(axi_ramReadOnlyPort_ar_valid),
    .io_axis_0_arw_ready(axi_ram_io_axis_0_arw_ready),
    .io_axis_0_arw_payload_addr(axi_ramReadOnlyPort_ar_payload_addr),
    .io_axis_0_arw_payload_id(axi_ramReadOnlyPort_ar_payload_id),
    .io_axis_0_arw_payload_len(axi_ramReadOnlyPort_ar_payload_len),
    .io_axis_0_arw_payload_size(axi_ramReadOnlyPort_ar_payload_size),
    .io_axis_0_arw_payload_burst(axi_ramReadOnlyPort_ar_payload_burst),
    .io_axis_0_arw_payload_write(_zz_37_),
    .io_axis_0_w_valid(_zz_38_),
    .io_axis_0_w_ready(axi_ram_io_axis_0_w_ready),
    .io_axis_0_w_payload_data(_zz_39_),
    .io_axis_0_w_payload_strb(_zz_40_),
    .io_axis_0_w_payload_last(_zz_41_),
    .io_axis_0_b_valid(axi_ram_io_axis_0_b_valid),
    .io_axis_0_b_ready(_zz_42_),
    .io_axis_0_b_payload_id(axi_ram_io_axis_0_b_payload_id),
    .io_axis_0_b_payload_resp(axi_ram_io_axis_0_b_payload_resp),
    .io_axis_0_r_valid(axi_ram_io_axis_0_r_valid),
    .io_axis_0_r_ready(axi_ramReadOnlyPort_r_ready),
    .io_axis_0_r_payload_data(axi_ram_io_axis_0_r_payload_data),
    .io_axis_0_r_payload_id(axi_ram_io_axis_0_r_payload_id),
    .io_axis_0_r_payload_resp(axi_ram_io_axis_0_r_payload_resp),
    .io_axis_0_r_payload_last(axi_ram_io_axis_0_r_payload_last),
    .io_axis_1_arw_valid(axi_ram_io_axis_1_arbiter_io_output_arw_valid),
    .io_axis_1_arw_ready(axi_ram_io_axis_1_arw_ready),
    .io_axis_1_arw_payload_addr(axi_ram_io_axis_1_arbiter_io_output_arw_payload_addr),
    .io_axis_1_arw_payload_id(axi_ram_io_axis_1_arbiter_io_output_arw_payload_id),
    .io_axis_1_arw_payload_len(axi_ram_io_axis_1_arbiter_io_output_arw_payload_len),
    .io_axis_1_arw_payload_size(axi_ram_io_axis_1_arbiter_io_output_arw_payload_size),
    .io_axis_1_arw_payload_burst(axi_ram_io_axis_1_arbiter_io_output_arw_payload_burst),
    .io_axis_1_arw_payload_write(axi_ram_io_axis_1_arbiter_io_output_arw_payload_write),
    .io_axis_1_w_valid(axi_ram_io_axis_1_arbiter_io_output_w_valid),
    .io_axis_1_w_ready(axi_ram_io_axis_1_w_ready),
    .io_axis_1_w_payload_data(axi_ram_io_axis_1_arbiter_io_output_w_payload_data),
    .io_axis_1_w_payload_strb(axi_ram_io_axis_1_arbiter_io_output_w_payload_strb),
    .io_axis_1_w_payload_last(axi_ram_io_axis_1_arbiter_io_output_w_payload_last),
    .io_axis_1_b_valid(axi_ram_io_axis_1_b_valid),
    .io_axis_1_b_ready(axi_ram_io_axis_1_arbiter_io_output_b_ready),
    .io_axis_1_b_payload_id(axi_ram_io_axis_1_b_payload_id),
    .io_axis_1_b_payload_resp(axi_ram_io_axis_1_b_payload_resp),
    .io_axis_1_r_valid(axi_ram_io_axis_1_r_valid),
    .io_axis_1_r_ready(axi_ram_io_axis_1_arbiter_io_output_r_ready),
    .io_axis_1_r_payload_data(axi_ram_io_axis_1_r_payload_data),
    .io_axis_1_r_payload_id(axi_ram_io_axis_1_r_payload_id),
    .io_axis_1_r_payload_resp(axi_ram_io_axis_1_r_payload_resp),
    .io_axis_1_r_payload_last(axi_ram_io_axis_1_r_payload_last),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Axi4SharedToApb3Bridge axi_apbBridge (
    .io_axi_arw_valid(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid),
    .io_axi_arw_ready(axi_apbBridge_io_axi_arw_ready),
    .io_axi_arw_payload_addr(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr),
    .io_axi_arw_payload_id(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id),
    .io_axi_arw_payload_len(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len),
    .io_axi_arw_payload_size(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size),
    .io_axi_arw_payload_burst(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst),
    .io_axi_arw_payload_write(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write),
    .io_axi_w_valid(axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid),
    .io_axi_w_ready(axi_apbBridge_io_axi_w_ready),
    .io_axi_w_payload_data(axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data),
    .io_axi_w_payload_strb(axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb),
    .io_axi_w_payload_last(axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last),
    .io_axi_b_valid(axi_apbBridge_io_axi_b_valid),
    .io_axi_b_ready(axi_apbBridge_io_axi_arbiter_io_output_b_ready),
    .io_axi_b_payload_id(axi_apbBridge_io_axi_b_payload_id),
    .io_axi_b_payload_resp(axi_apbBridge_io_axi_b_payload_resp),
    .io_axi_r_valid(axi_apbBridge_io_axi_r_valid),
    .io_axi_r_ready(axi_apbBridge_io_axi_arbiter_io_output_r_ready),
    .io_axi_r_payload_data(axi_apbBridge_io_axi_r_payload_data),
    .io_axi_r_payload_id(axi_apbBridge_io_axi_r_payload_id),
    .io_axi_r_payload_resp(axi_apbBridge_io_axi_r_payload_resp),
    .io_axi_r_payload_last(axi_apbBridge_io_axi_r_payload_last),
    .io_apb_PADDR(axi_apbBridge_io_apb_PADDR),
    .io_apb_PSEL(axi_apbBridge_io_apb_PSEL),
    .io_apb_PENABLE(axi_apbBridge_io_apb_PENABLE),
    .io_apb_PREADY(io_apb_decoder_io_input_PREADY),
    .io_apb_PWRITE(axi_apbBridge_io_apb_PWRITE),
    .io_apb_PWDATA(axi_apbBridge_io_apb_PWDATA),
    .io_apb_PRDATA(io_apb_decoder_io_input_PRDATA),
    .io_apb_PSLVERROR(io_apb_decoder_io_input_PSLVERROR),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Apb3Gpio2 axi_gpioACtrl (
    .io_gpio_read(io_gpioA_read),
    .io_gpio_write(axi_gpioACtrl_io_gpio_write),
    .io_gpio_writeEnable(axi_gpioACtrl_io_gpio_writeEnable),
    .io_bus_PADDR(_zz_43_),
    .io_bus_PSEL(apb3Router_1__io_outputs_0_PSEL),
    .io_bus_PENABLE(apb3Router_1__io_outputs_0_PENABLE),
    .io_bus_PREADY(axi_gpioACtrl_io_bus_PREADY),
    .io_bus_PWRITE(apb3Router_1__io_outputs_0_PWRITE),
    .io_bus_PWDATA(apb3Router_1__io_outputs_0_PWDATA),
    .io_bus_PRDATA(axi_gpioACtrl_io_bus_PRDATA),
    .io_bus_PSLVERROR(axi_gpioACtrl_io_bus_PSLVERROR),
    .io_interrupt(axi_gpioACtrl_io_interrupt),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Apb3UartCtrl axi_uartCtrl (
    .io_apb_PADDR(_zz_44_),
    .io_apb_PSEL(apb3Router_1__io_outputs_1_PSEL),
    .io_apb_PENABLE(apb3Router_1__io_outputs_1_PENABLE),
    .io_apb_PREADY(axi_uartCtrl_io_apb_PREADY),
    .io_apb_PWRITE(apb3Router_1__io_outputs_1_PWRITE),
    .io_apb_PWDATA(apb3Router_1__io_outputs_1_PWDATA),
    .io_apb_PRDATA(axi_uartCtrl_io_apb_PRDATA),
    .io_uart_txd(axi_uartCtrl_io_uart_txd),
    .io_uart_rxd(io_uartA_rxd),
    .io_interrupt(axi_uartCtrl_io_interrupt),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  EfxTimer axi_timerCtrl (
    .io_apb_PADDR(_zz_45_),
    .io_apb_PSEL(apb3Router_1__io_outputs_2_PSEL),
    .io_apb_PENABLE(apb3Router_1__io_outputs_2_PENABLE),
    .io_apb_PREADY(axi_timerCtrl_io_apb_PREADY),
    .io_apb_PWRITE(apb3Router_1__io_outputs_2_PWRITE),
    .io_apb_PWDATA(apb3Router_1__io_outputs_2_PWDATA),
    .io_apb_PRDATA(axi_timerCtrl_io_apb_PRDATA),
    .io_apb_PSLVERROR(axi_timerCtrl_io_apb_PSLVERROR),
    .io_interrupts(axi_timerCtrl_io_interrupts),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Apb3InterruptCtrl axi_interruptController (
    .io_bus_PADDR(_zz_46_),
    .io_bus_PSEL(apb3Router_1__io_outputs_3_PSEL),
    .io_bus_PENABLE(apb3Router_1__io_outputs_3_PENABLE),
    .io_bus_PREADY(axi_interruptController_io_bus_PREADY),
    .io_bus_PWRITE(apb3Router_1__io_outputs_3_PWRITE),
    .io_bus_PWDATA(apb3Router_1__io_outputs_3_PWDATA),
    .io_bus_PRDATA(axi_interruptController_io_bus_PRDATA),
    .io_bus_PSLVERROR(axi_interruptController_io_bus_PSLVERROR),
    .io_inputs(_zz_47_),
    .io_pendings(axi_interruptController_io_pendings),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  VexRiscv axi_core_cpu (
    .iBus_cmd_valid(axi_core_cpu_iBus_cmd_valid),
    .iBus_cmd_ready(axi_core_iBus_ar_ready),
    .iBus_cmd_payload_pc(axi_core_cpu_iBus_cmd_payload_pc),
    .iBus_rsp_valid(axi_core_iBus_r_valid),
    .iBus_rsp_payload_error(_zz_48_),
    .iBus_rsp_payload_inst(axi_core_iBus_r_payload_data),
    .timerInterrupt(_zz_49_),
    .externalInterrupt(_zz_50_),
    .softwareInterrupt(_zz_51_),
    .debug_bus_cmd_valid(systemDebugger_1__io_mem_cmd_valid),
    .debug_bus_cmd_ready(axi_core_cpu_debug_bus_cmd_ready),
    .debug_bus_cmd_payload_wr(systemDebugger_1__io_mem_cmd_payload_wr),
    .debug_bus_cmd_payload_address(_zz_52_),
    .debug_bus_cmd_payload_data(systemDebugger_1__io_mem_cmd_payload_data),
    .debug_bus_rsp_data(axi_core_cpu_debug_bus_rsp_data),
    .debug_resetOut(axi_core_cpu_debug_resetOut),
    .dBus_cmd_valid(axi_core_cpu_dBus_cmd_valid),
    .dBus_cmd_ready(_zz_53_),
    .dBus_cmd_payload_wr(axi_core_cpu_dBus_cmd_payload_wr),
    .dBus_cmd_payload_address(axi_core_cpu_dBus_cmd_payload_address),
    .dBus_cmd_payload_data(axi_core_cpu_dBus_cmd_payload_data),
    .dBus_cmd_payload_size(axi_core_cpu_dBus_cmd_payload_size),
    .dBus_rsp_ready(axi_core_dBus_r_valid),
    .dBus_rsp_error(_zz_54_),
    .dBus_rsp_data(axi_core_dBus_r_payload_data),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset),
    .toplevel_resetCtrl_systemReset(resetCtrl_systemReset)
  );
  StreamFork_3_ streamFork_4_ (
    .io_input_valid(_zz_55_),
    .io_input_ready(streamFork_4__io_input_ready),
    .io_input_payload_wr(axi_core_cpu_dBus_cmd_payload_wr),
    .io_input_payload_address(axi_core_cpu_dBus_cmd_payload_address),
    .io_input_payload_data(axi_core_cpu_dBus_cmd_payload_data),
    .io_input_payload_size(axi_core_cpu_dBus_cmd_payload_size),
    .io_outputs_0_valid(streamFork_4__io_outputs_0_valid),
    .io_outputs_0_ready(axi_core_dBus_arw_ready),
    .io_outputs_0_payload_wr(streamFork_4__io_outputs_0_payload_wr),
    .io_outputs_0_payload_address(streamFork_4__io_outputs_0_payload_address),
    .io_outputs_0_payload_data(streamFork_4__io_outputs_0_payload_data),
    .io_outputs_0_payload_size(streamFork_4__io_outputs_0_payload_size),
    .io_outputs_1_valid(streamFork_4__io_outputs_1_valid),
    .io_outputs_1_ready(_zz_56_),
    .io_outputs_1_payload_wr(streamFork_4__io_outputs_1_payload_wr),
    .io_outputs_1_payload_address(streamFork_4__io_outputs_1_payload_address),
    .io_outputs_1_payload_data(streamFork_4__io_outputs_1_payload_data),
    .io_outputs_1_payload_size(streamFork_4__io_outputs_1_payload_size),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  JtagBridge jtagBridge_1_ (
    .io_jtag_tms(io_jtag_tms),
    .io_jtag_tdi(io_jtag_tdi),
    .io_jtag_tdo(jtagBridge_1__io_jtag_tdo),
    .io_jtag_tck(io_jtag_tck),
    .io_remote_cmd_valid(jtagBridge_1__io_remote_cmd_valid),
    .io_remote_cmd_ready(systemDebugger_1__io_remote_cmd_ready),
    .io_remote_cmd_payload_last(jtagBridge_1__io_remote_cmd_payload_last),
    .io_remote_cmd_payload_fragment(jtagBridge_1__io_remote_cmd_payload_fragment),
    .io_remote_rsp_valid(systemDebugger_1__io_remote_rsp_valid),
    .io_remote_rsp_ready(jtagBridge_1__io_remote_rsp_ready),
    .io_remote_rsp_payload_error(systemDebugger_1__io_remote_rsp_payload_error),
    .io_remote_rsp_payload_data(systemDebugger_1__io_remote_rsp_payload_data),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_systemReset(resetCtrl_systemReset)
  );
  SystemDebugger systemDebugger_1_ (
    .io_remote_cmd_valid(jtagBridge_1__io_remote_cmd_valid),
    .io_remote_cmd_ready(systemDebugger_1__io_remote_cmd_ready),
    .io_remote_cmd_payload_last(jtagBridge_1__io_remote_cmd_payload_last),
    .io_remote_cmd_payload_fragment(jtagBridge_1__io_remote_cmd_payload_fragment),
    .io_remote_rsp_valid(systemDebugger_1__io_remote_rsp_valid),
    .io_remote_rsp_ready(jtagBridge_1__io_remote_rsp_ready),
    .io_remote_rsp_payload_error(systemDebugger_1__io_remote_rsp_payload_error),
    .io_remote_rsp_payload_data(systemDebugger_1__io_remote_rsp_payload_data),
    .io_mem_cmd_valid(systemDebugger_1__io_mem_cmd_valid),
    .io_mem_cmd_ready(axi_core_cpu_debug_bus_cmd_ready),
    .io_mem_cmd_payload_address(systemDebugger_1__io_mem_cmd_payload_address),
    .io_mem_cmd_payload_data(systemDebugger_1__io_mem_cmd_payload_data),
    .io_mem_cmd_payload_wr(systemDebugger_1__io_mem_cmd_payload_wr),
    .io_mem_cmd_payload_size(systemDebugger_1__io_mem_cmd_payload_size),
    .io_mem_rsp_valid(_zz_10_),
    .io_mem_rsp_payload(axi_core_cpu_debug_bus_rsp_data),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_systemReset(resetCtrl_systemReset)
  );
  Axi4SharedDecoder axi_core_dBus_decoder (
    .io_input_arw_valid(axi_core_dBus_arw_m2sPipe_valid),
    .io_input_arw_ready(axi_core_dBus_decoder_io_input_arw_ready),
    .io_input_arw_payload_addr(axi_core_dBus_arw_m2sPipe_payload_addr),
    .io_input_arw_payload_size(axi_core_dBus_arw_m2sPipe_payload_size),
    .io_input_arw_payload_cache(axi_core_dBus_arw_m2sPipe_payload_cache),
    .io_input_arw_payload_prot(axi_core_dBus_arw_m2sPipe_payload_prot),
    .io_input_arw_payload_write(axi_core_dBus_arw_m2sPipe_payload_write),
    .io_input_w_valid(axi_core_dBus_w_m2sPipe_valid),
    .io_input_w_ready(axi_core_dBus_decoder_io_input_w_ready),
    .io_input_w_payload_data(axi_core_dBus_w_m2sPipe_payload_data),
    .io_input_w_payload_strb(axi_core_dBus_w_m2sPipe_payload_strb),
    .io_input_w_payload_last(axi_core_dBus_w_m2sPipe_payload_last),
    .io_input_b_valid(axi_core_dBus_decoder_io_input_b_valid),
    .io_input_b_ready(axi_core_dBus_b_ready),
    .io_input_b_payload_resp(axi_core_dBus_decoder_io_input_b_payload_resp),
    .io_input_r_valid(axi_core_dBus_decoder_io_input_r_valid),
    .io_input_r_ready(axi_core_dBus_r_ready),
    .io_input_r_payload_data(axi_core_dBus_decoder_io_input_r_payload_data),
    .io_input_r_payload_resp(axi_core_dBus_decoder_io_input_r_payload_resp),
    .io_input_r_payload_last(axi_core_dBus_decoder_io_input_r_payload_last),
    .io_readOutputs_0_ar_valid(axi_core_dBus_decoder_io_readOutputs_0_ar_valid),
    .io_readOutputs_0_ar_ready(axi4ReadOnlyArbiter_1__io_inputs_0_ar_ready),
    .io_readOutputs_0_ar_payload_addr(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_addr),
    .io_readOutputs_0_ar_payload_size(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_size),
    .io_readOutputs_0_ar_payload_cache(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_cache),
    .io_readOutputs_0_ar_payload_prot(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_prot),
    .io_readOutputs_0_r_valid(axi4ReadOnlyArbiter_1__io_inputs_0_r_valid),
    .io_readOutputs_0_r_ready(axi_core_dBus_decoder_io_readOutputs_0_r_ready),
    .io_readOutputs_0_r_payload_data(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_data),
    .io_readOutputs_0_r_payload_resp(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_resp),
    .io_readOutputs_0_r_payload_last(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_last),
    .io_writeOutputs_0_aw_valid(axi_core_dBus_decoder_io_writeOutputs_0_aw_valid),
    .io_writeOutputs_0_aw_ready(axi4WriteOnlyArbiter_1__io_inputs_0_aw_ready),
    .io_writeOutputs_0_aw_payload_addr(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_addr),
    .io_writeOutputs_0_aw_payload_size(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_size),
    .io_writeOutputs_0_aw_payload_cache(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_cache),
    .io_writeOutputs_0_aw_payload_prot(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_prot),
    .io_writeOutputs_0_w_valid(axi_core_dBus_decoder_io_writeOutputs_0_w_valid),
    .io_writeOutputs_0_w_ready(axi4WriteOnlyArbiter_1__io_inputs_0_w_ready),
    .io_writeOutputs_0_w_payload_data(axi_core_dBus_decoder_io_writeOutputs_0_w_payload_data),
    .io_writeOutputs_0_w_payload_strb(axi_core_dBus_decoder_io_writeOutputs_0_w_payload_strb),
    .io_writeOutputs_0_w_payload_last(axi_core_dBus_decoder_io_writeOutputs_0_w_payload_last),
    .io_writeOutputs_0_b_valid(axi4WriteOnlyArbiter_1__io_inputs_0_b_valid),
    .io_writeOutputs_0_b_ready(axi_core_dBus_decoder_io_writeOutputs_0_b_ready),
    .io_writeOutputs_0_b_payload_resp(axi4WriteOnlyArbiter_1__io_inputs_0_b_payload_resp),
    .io_sharedOutputs_0_arw_valid(axi_core_dBus_decoder_io_sharedOutputs_0_arw_valid),
    .io_sharedOutputs_0_arw_ready(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_arw_ready),
    .io_sharedOutputs_0_arw_payload_addr(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_addr),
    .io_sharedOutputs_0_arw_payload_size(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_size),
    .io_sharedOutputs_0_arw_payload_cache(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_cache),
    .io_sharedOutputs_0_arw_payload_prot(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_prot),
    .io_sharedOutputs_0_arw_payload_write(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_write),
    .io_sharedOutputs_0_w_valid(axi_core_dBus_decoder_io_sharedOutputs_0_w_valid),
    .io_sharedOutputs_0_w_ready(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_w_ready),
    .io_sharedOutputs_0_w_payload_data(axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_data),
    .io_sharedOutputs_0_w_payload_strb(axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_strb),
    .io_sharedOutputs_0_w_payload_last(axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_last),
    .io_sharedOutputs_0_b_valid(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_valid),
    .io_sharedOutputs_0_b_ready(axi_core_dBus_decoder_io_sharedOutputs_0_b_ready),
    .io_sharedOutputs_0_b_payload_resp(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_payload_resp),
    .io_sharedOutputs_0_r_valid(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_valid),
    .io_sharedOutputs_0_r_ready(axi_core_dBus_decoder_io_sharedOutputs_0_r_ready),
    .io_sharedOutputs_0_r_payload_data(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_data),
    .io_sharedOutputs_0_r_payload_resp(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_resp),
    .io_sharedOutputs_0_r_payload_last(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_last),
    .io_sharedOutputs_1_arw_valid(axi_core_dBus_decoder_io_sharedOutputs_1_arw_valid),
    .io_sharedOutputs_1_arw_ready(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready),
    .io_sharedOutputs_1_arw_payload_addr(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_addr),
    .io_sharedOutputs_1_arw_payload_size(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_size),
    .io_sharedOutputs_1_arw_payload_cache(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_cache),
    .io_sharedOutputs_1_arw_payload_prot(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_prot),
    .io_sharedOutputs_1_arw_payload_write(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_write),
    .io_sharedOutputs_1_w_valid(axi_core_dBus_decoder_io_sharedOutputs_1_w_valid),
    .io_sharedOutputs_1_w_ready(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready),
    .io_sharedOutputs_1_w_payload_data(axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_data),
    .io_sharedOutputs_1_w_payload_strb(axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_strb),
    .io_sharedOutputs_1_w_payload_last(axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_last),
    .io_sharedOutputs_1_b_valid(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid),
    .io_sharedOutputs_1_b_ready(axi_core_dBus_decoder_io_sharedOutputs_1_b_ready),
    .io_sharedOutputs_1_b_payload_resp(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp),
    .io_sharedOutputs_1_r_valid(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid),
    .io_sharedOutputs_1_r_ready(axi_core_dBus_decoder_io_sharedOutputs_1_r_ready),
    .io_sharedOutputs_1_r_payload_data(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data),
    .io_sharedOutputs_1_r_payload_resp(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp),
    .io_sharedOutputs_1_r_payload_last(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Axi4SharedArbiter axi_ram_io_axis_1_arbiter (
    .io_sharedInputs_0_arw_valid(axi_core_dBus_decoder_io_sharedOutputs_0_arw_valid),
    .io_sharedInputs_0_arw_ready(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_arw_ready),
    .io_sharedInputs_0_arw_payload_addr(_zz_57_),
    .io_sharedInputs_0_arw_payload_id(_zz_23_),
    .io_sharedInputs_0_arw_payload_len(_zz_24_),
    .io_sharedInputs_0_arw_payload_size(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_size),
    .io_sharedInputs_0_arw_payload_burst(_zz_58_),
    .io_sharedInputs_0_arw_payload_write(axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_write),
    .io_sharedInputs_0_w_valid(axi_core_dBus_decoder_io_sharedOutputs_0_w_valid),
    .io_sharedInputs_0_w_ready(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_w_ready),
    .io_sharedInputs_0_w_payload_data(axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_data),
    .io_sharedInputs_0_w_payload_strb(axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_strb),
    .io_sharedInputs_0_w_payload_last(axi_core_dBus_decoder_io_sharedOutputs_0_w_payload_last),
    .io_sharedInputs_0_b_valid(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_valid),
    .io_sharedInputs_0_b_ready(axi_core_dBus_decoder_io_sharedOutputs_0_b_ready),
    .io_sharedInputs_0_b_payload_id(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_payload_id),
    .io_sharedInputs_0_b_payload_resp(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_b_payload_resp),
    .io_sharedInputs_0_r_valid(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_valid),
    .io_sharedInputs_0_r_ready(axi_core_dBus_decoder_io_sharedOutputs_0_r_ready),
    .io_sharedInputs_0_r_payload_data(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_data),
    .io_sharedInputs_0_r_payload_id(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_id),
    .io_sharedInputs_0_r_payload_resp(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_resp),
    .io_sharedInputs_0_r_payload_last(axi_ram_io_axis_1_arbiter_io_sharedInputs_0_r_payload_last),
    .io_output_arw_valid(axi_ram_io_axis_1_arbiter_io_output_arw_valid),
    .io_output_arw_ready(axi_ram_io_axis_1_arw_ready),
    .io_output_arw_payload_addr(axi_ram_io_axis_1_arbiter_io_output_arw_payload_addr),
    .io_output_arw_payload_id(axi_ram_io_axis_1_arbiter_io_output_arw_payload_id),
    .io_output_arw_payload_len(axi_ram_io_axis_1_arbiter_io_output_arw_payload_len),
    .io_output_arw_payload_size(axi_ram_io_axis_1_arbiter_io_output_arw_payload_size),
    .io_output_arw_payload_burst(axi_ram_io_axis_1_arbiter_io_output_arw_payload_burst),
    .io_output_arw_payload_write(axi_ram_io_axis_1_arbiter_io_output_arw_payload_write),
    .io_output_w_valid(axi_ram_io_axis_1_arbiter_io_output_w_valid),
    .io_output_w_ready(axi_ram_io_axis_1_w_ready),
    .io_output_w_payload_data(axi_ram_io_axis_1_arbiter_io_output_w_payload_data),
    .io_output_w_payload_strb(axi_ram_io_axis_1_arbiter_io_output_w_payload_strb),
    .io_output_w_payload_last(axi_ram_io_axis_1_arbiter_io_output_w_payload_last),
    .io_output_b_valid(axi_ram_io_axis_1_b_valid),
    .io_output_b_ready(axi_ram_io_axis_1_arbiter_io_output_b_ready),
    .io_output_b_payload_id(axi_ram_io_axis_1_b_payload_id),
    .io_output_b_payload_resp(axi_ram_io_axis_1_b_payload_resp),
    .io_output_r_valid(axi_ram_io_axis_1_r_valid),
    .io_output_r_ready(axi_ram_io_axis_1_arbiter_io_output_r_ready),
    .io_output_r_payload_data(axi_ram_io_axis_1_r_payload_data),
    .io_output_r_payload_id(axi_ram_io_axis_1_r_payload_id),
    .io_output_r_payload_resp(axi_ram_io_axis_1_r_payload_resp),
    .io_output_r_payload_last(axi_ram_io_axis_1_r_payload_last),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Axi4SharedArbiter_1_ axi_apbBridge_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid(axi_core_dBus_decoder_io_sharedOutputs_1_arw_valid),
    .io_sharedInputs_0_arw_ready(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready),
    .io_sharedInputs_0_arw_payload_addr(_zz_59_),
    .io_sharedInputs_0_arw_payload_id(_zz_25_),
    .io_sharedInputs_0_arw_payload_len(_zz_26_),
    .io_sharedInputs_0_arw_payload_size(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_size),
    .io_sharedInputs_0_arw_payload_burst(_zz_60_),
    .io_sharedInputs_0_arw_payload_write(axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_write),
    .io_sharedInputs_0_w_valid(axi_core_dBus_decoder_io_sharedOutputs_1_w_valid),
    .io_sharedInputs_0_w_ready(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready),
    .io_sharedInputs_0_w_payload_data(axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_data),
    .io_sharedInputs_0_w_payload_strb(axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_strb),
    .io_sharedInputs_0_w_payload_last(axi_core_dBus_decoder_io_sharedOutputs_1_w_payload_last),
    .io_sharedInputs_0_b_valid(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid),
    .io_sharedInputs_0_b_ready(axi_core_dBus_decoder_io_sharedOutputs_1_b_ready),
    .io_sharedInputs_0_b_payload_id(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id),
    .io_sharedInputs_0_b_payload_resp(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp),
    .io_sharedInputs_0_r_valid(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid),
    .io_sharedInputs_0_r_ready(axi_core_dBus_decoder_io_sharedOutputs_1_r_ready),
    .io_sharedInputs_0_r_payload_data(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data),
    .io_sharedInputs_0_r_payload_id(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id),
    .io_sharedInputs_0_r_payload_resp(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp),
    .io_sharedInputs_0_r_payload_last(axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last),
    .io_output_arw_valid(axi_apbBridge_io_axi_arbiter_io_output_arw_valid),
    .io_output_arw_ready(axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready),
    .io_output_arw_payload_addr(axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr),
    .io_output_arw_payload_id(axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id),
    .io_output_arw_payload_len(axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len),
    .io_output_arw_payload_size(axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size),
    .io_output_arw_payload_burst(axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst),
    .io_output_arw_payload_write(axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write),
    .io_output_w_valid(axi_apbBridge_io_axi_arbiter_io_output_w_valid),
    .io_output_w_ready(axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready),
    .io_output_w_payload_data(axi_apbBridge_io_axi_arbiter_io_output_w_payload_data),
    .io_output_w_payload_strb(axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb),
    .io_output_w_payload_last(axi_apbBridge_io_axi_arbiter_io_output_w_payload_last),
    .io_output_b_valid(axi_apbBridge_io_axi_b_valid),
    .io_output_b_ready(axi_apbBridge_io_axi_arbiter_io_output_b_ready),
    .io_output_b_payload_id(axi_apbBridge_io_axi_b_payload_id),
    .io_output_b_payload_resp(axi_apbBridge_io_axi_b_payload_resp),
    .io_output_r_valid(axi_apbBridge_io_axi_r_valid),
    .io_output_r_ready(axi_apbBridge_io_axi_arbiter_io_output_r_ready),
    .io_output_r_payload_data(axi_apbBridge_io_axi_r_payload_data),
    .io_output_r_payload_id(axi_apbBridge_io_axi_r_payload_id),
    .io_output_r_payload_resp(axi_apbBridge_io_axi_r_payload_resp),
    .io_output_r_payload_last(axi_apbBridge_io_axi_r_payload_last),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_1_ (
    .io_inputs_0_ar_valid(axi_core_dBus_decoder_io_readOutputs_0_ar_valid),
    .io_inputs_0_ar_ready(axi4ReadOnlyArbiter_1__io_inputs_0_ar_ready),
    .io_inputs_0_ar_payload_addr(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_addr),
    .io_inputs_0_ar_payload_id(_zz_27_),
    .io_inputs_0_ar_payload_region(_zz_28_),
    .io_inputs_0_ar_payload_len(_zz_29_),
    .io_inputs_0_ar_payload_size(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_size),
    .io_inputs_0_ar_payload_burst(_zz_61_),
    .io_inputs_0_ar_payload_lock(_zz_62_),
    .io_inputs_0_ar_payload_cache(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_cache),
    .io_inputs_0_ar_payload_qos(_zz_63_),
    .io_inputs_0_ar_payload_prot(axi_core_dBus_decoder_io_readOutputs_0_ar_payload_prot),
    .io_inputs_0_r_valid(axi4ReadOnlyArbiter_1__io_inputs_0_r_valid),
    .io_inputs_0_r_ready(axi_core_dBus_decoder_io_readOutputs_0_r_ready),
    .io_inputs_0_r_payload_data(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_data),
    .io_inputs_0_r_payload_id(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_id),
    .io_inputs_0_r_payload_resp(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_resp),
    .io_inputs_0_r_payload_last(axi4ReadOnlyArbiter_1__io_inputs_0_r_payload_last),
    .io_output_ar_valid(axi4ReadOnlyArbiter_1__io_output_ar_valid),
    .io_output_ar_ready(axiA_arready),
    .io_output_ar_payload_addr(axi4ReadOnlyArbiter_1__io_output_ar_payload_addr),
    .io_output_ar_payload_id(axi4ReadOnlyArbiter_1__io_output_ar_payload_id),
    .io_output_ar_payload_region(axi4ReadOnlyArbiter_1__io_output_ar_payload_region),
    .io_output_ar_payload_len(axi4ReadOnlyArbiter_1__io_output_ar_payload_len),
    .io_output_ar_payload_size(axi4ReadOnlyArbiter_1__io_output_ar_payload_size),
    .io_output_ar_payload_burst(axi4ReadOnlyArbiter_1__io_output_ar_payload_burst),
    .io_output_ar_payload_lock(axi4ReadOnlyArbiter_1__io_output_ar_payload_lock),
    .io_output_ar_payload_cache(axi4ReadOnlyArbiter_1__io_output_ar_payload_cache),
    .io_output_ar_payload_qos(axi4ReadOnlyArbiter_1__io_output_ar_payload_qos),
    .io_output_ar_payload_prot(axi4ReadOnlyArbiter_1__io_output_ar_payload_prot),
    .io_output_r_valid(axiA_rvalid),
    .io_output_r_ready(axi4ReadOnlyArbiter_1__io_output_r_ready),
    .io_output_r_payload_data(axiA_rdata),
    .io_output_r_payload_id(axiA_rid),
    .io_output_r_payload_resp(axiA_rresp),
    .io_output_r_payload_last(axiA_rlast),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Axi4WriteOnlyArbiter axi4WriteOnlyArbiter_1_ (
    .io_inputs_0_aw_valid(axi_core_dBus_decoder_io_writeOutputs_0_aw_valid),
    .io_inputs_0_aw_ready(axi4WriteOnlyArbiter_1__io_inputs_0_aw_ready),
    .io_inputs_0_aw_payload_addr(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_addr),
    .io_inputs_0_aw_payload_id(_zz_32_),
    .io_inputs_0_aw_payload_region(_zz_33_),
    .io_inputs_0_aw_payload_len(_zz_34_),
    .io_inputs_0_aw_payload_size(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_size),
    .io_inputs_0_aw_payload_burst(_zz_64_),
    .io_inputs_0_aw_payload_lock(_zz_65_),
    .io_inputs_0_aw_payload_cache(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_cache),
    .io_inputs_0_aw_payload_qos(_zz_66_),
    .io_inputs_0_aw_payload_prot(axi_core_dBus_decoder_io_writeOutputs_0_aw_payload_prot),
    .io_inputs_0_w_valid(axi_core_dBus_decoder_io_writeOutputs_0_w_valid),
    .io_inputs_0_w_ready(axi4WriteOnlyArbiter_1__io_inputs_0_w_ready),
    .io_inputs_0_w_payload_data(axi_core_dBus_decoder_io_writeOutputs_0_w_payload_data),
    .io_inputs_0_w_payload_strb(axi_core_dBus_decoder_io_writeOutputs_0_w_payload_strb),
    .io_inputs_0_w_payload_last(axi_core_dBus_decoder_io_writeOutputs_0_w_payload_last),
    .io_inputs_0_b_valid(axi4WriteOnlyArbiter_1__io_inputs_0_b_valid),
    .io_inputs_0_b_ready(axi_core_dBus_decoder_io_writeOutputs_0_b_ready),
    .io_inputs_0_b_payload_id(axi4WriteOnlyArbiter_1__io_inputs_0_b_payload_id),
    .io_inputs_0_b_payload_resp(axi4WriteOnlyArbiter_1__io_inputs_0_b_payload_resp),
    .io_output_aw_valid(axi4WriteOnlyArbiter_1__io_output_aw_valid),
    .io_output_aw_ready(axiA_awready),
    .io_output_aw_payload_addr(axi4WriteOnlyArbiter_1__io_output_aw_payload_addr),
    .io_output_aw_payload_id(axi4WriteOnlyArbiter_1__io_output_aw_payload_id),
    .io_output_aw_payload_region(axi4WriteOnlyArbiter_1__io_output_aw_payload_region),
    .io_output_aw_payload_len(axi4WriteOnlyArbiter_1__io_output_aw_payload_len),
    .io_output_aw_payload_size(axi4WriteOnlyArbiter_1__io_output_aw_payload_size),
    .io_output_aw_payload_burst(axi4WriteOnlyArbiter_1__io_output_aw_payload_burst),
    .io_output_aw_payload_lock(axi4WriteOnlyArbiter_1__io_output_aw_payload_lock),
    .io_output_aw_payload_cache(axi4WriteOnlyArbiter_1__io_output_aw_payload_cache),
    .io_output_aw_payload_qos(axi4WriteOnlyArbiter_1__io_output_aw_payload_qos),
    .io_output_aw_payload_prot(axi4WriteOnlyArbiter_1__io_output_aw_payload_prot),
    .io_output_w_valid(axi4WriteOnlyArbiter_1__io_output_w_valid),
    .io_output_w_ready(axiA_wready),
    .io_output_w_payload_data(axi4WriteOnlyArbiter_1__io_output_w_payload_data),
    .io_output_w_payload_strb(axi4WriteOnlyArbiter_1__io_output_w_payload_strb),
    .io_output_w_payload_last(axi4WriteOnlyArbiter_1__io_output_w_payload_last),
    .io_output_b_valid(axiA_bvalid),
    .io_output_b_ready(axi4WriteOnlyArbiter_1__io_output_b_ready),
    .io_output_b_payload_id(axiA_bid),
    .io_output_b_payload_resp(axiA_bresp),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR(axi_apbBridge_io_apb_PADDR),
    .io_input_PSEL(axi_apbBridge_io_apb_PSEL),
    .io_input_PENABLE(axi_apbBridge_io_apb_PENABLE),
    .io_input_PREADY(io_apb_decoder_io_input_PREADY),
    .io_input_PWRITE(axi_apbBridge_io_apb_PWRITE),
    .io_input_PWDATA(axi_apbBridge_io_apb_PWDATA),
    .io_input_PRDATA(io_apb_decoder_io_input_PRDATA),
    .io_input_PSLVERROR(io_apb_decoder_io_input_PSLVERROR),
    .io_output_PADDR(io_apb_decoder_io_output_PADDR),
    .io_output_PSEL(io_apb_decoder_io_output_PSEL),
    .io_output_PENABLE(io_apb_decoder_io_output_PENABLE),
    .io_output_PREADY(apb3Router_1__io_input_PREADY),
    .io_output_PWRITE(io_apb_decoder_io_output_PWRITE),
    .io_output_PWDATA(io_apb_decoder_io_output_PWDATA),
    .io_output_PRDATA(apb3Router_1__io_input_PRDATA),
    .io_output_PSLVERROR(apb3Router_1__io_input_PSLVERROR)
  );
  Apb3Router apb3Router_1_ (
    .io_input_PADDR(io_apb_decoder_io_output_PADDR),
    .io_input_PSEL(io_apb_decoder_io_output_PSEL),
    .io_input_PENABLE(io_apb_decoder_io_output_PENABLE),
    .io_input_PREADY(apb3Router_1__io_input_PREADY),
    .io_input_PWRITE(io_apb_decoder_io_output_PWRITE),
    .io_input_PWDATA(io_apb_decoder_io_output_PWDATA),
    .io_input_PRDATA(apb3Router_1__io_input_PRDATA),
    .io_input_PSLVERROR(apb3Router_1__io_input_PSLVERROR),
    .io_outputs_0_PADDR(apb3Router_1__io_outputs_0_PADDR),
    .io_outputs_0_PSEL(apb3Router_1__io_outputs_0_PSEL),
    .io_outputs_0_PENABLE(apb3Router_1__io_outputs_0_PENABLE),
    .io_outputs_0_PREADY(axi_gpioACtrl_io_bus_PREADY),
    .io_outputs_0_PWRITE(apb3Router_1__io_outputs_0_PWRITE),
    .io_outputs_0_PWDATA(apb3Router_1__io_outputs_0_PWDATA),
    .io_outputs_0_PRDATA(axi_gpioACtrl_io_bus_PRDATA),
    .io_outputs_0_PSLVERROR(axi_gpioACtrl_io_bus_PSLVERROR),
    .io_outputs_1_PADDR(apb3Router_1__io_outputs_1_PADDR),
    .io_outputs_1_PSEL(apb3Router_1__io_outputs_1_PSEL),
    .io_outputs_1_PENABLE(apb3Router_1__io_outputs_1_PENABLE),
    .io_outputs_1_PREADY(axi_uartCtrl_io_apb_PREADY),
    .io_outputs_1_PWRITE(apb3Router_1__io_outputs_1_PWRITE),
    .io_outputs_1_PWDATA(apb3Router_1__io_outputs_1_PWDATA),
    .io_outputs_1_PRDATA(axi_uartCtrl_io_apb_PRDATA),
    .io_outputs_1_PSLVERROR(_zz_67_),
    .io_outputs_2_PADDR(apb3Router_1__io_outputs_2_PADDR),
    .io_outputs_2_PSEL(apb3Router_1__io_outputs_2_PSEL),
    .io_outputs_2_PENABLE(apb3Router_1__io_outputs_2_PENABLE),
    .io_outputs_2_PREADY(axi_timerCtrl_io_apb_PREADY),
    .io_outputs_2_PWRITE(apb3Router_1__io_outputs_2_PWRITE),
    .io_outputs_2_PWDATA(apb3Router_1__io_outputs_2_PWDATA),
    .io_outputs_2_PRDATA(axi_timerCtrl_io_apb_PRDATA),
    .io_outputs_2_PSLVERROR(axi_timerCtrl_io_apb_PSLVERROR),
    .io_outputs_3_PADDR(apb3Router_1__io_outputs_3_PADDR),
    .io_outputs_3_PSEL(apb3Router_1__io_outputs_3_PSEL),
    .io_outputs_3_PENABLE(apb3Router_1__io_outputs_3_PENABLE),
    .io_outputs_3_PREADY(axi_interruptController_io_bus_PREADY),
    .io_outputs_3_PWRITE(apb3Router_1__io_outputs_3_PWRITE),
    .io_outputs_3_PWDATA(apb3Router_1__io_outputs_3_PWDATA),
    .io_outputs_3_PRDATA(axi_interruptController_io_bus_PRDATA),
    .io_outputs_3_PSLVERROR(axi_interruptController_io_bus_PSLVERROR),
    .toplevel_io_axiClk(io_axiClk),
    .toplevel_resetCtrl_axiReset(resetCtrl_axiReset)
  );
  always @ ( * ) begin
    resetCtrl_systemResetUnbuffered = 1'b0;
    if(_zz_68_)begin
      resetCtrl_systemResetUnbuffered = 1'b1;
    end
  end

  assign _zz_1_[5 : 0] = (6'b111111);
  assign resetCtrl_vgaReset = bufferCC_6__io_dataOut;
  assign axi_ramReadOnlyPort_ar_ready = axi_ram_io_axis_0_arw_ready;
  assign _zz_37_ = 1'b0;
  assign axi_ramReadOnlyPort_r_valid = axi_ram_io_axis_0_r_valid;
  assign axi_ramReadOnlyPort_r_payload_data = axi_ram_io_axis_0_r_payload_data;
  assign axi_ramReadOnlyPort_r_payload_id = axi_ram_io_axis_0_r_payload_id;
  assign axi_ramReadOnlyPort_r_payload_resp = axi_ram_io_axis_0_r_payload_resp;
  assign axi_ramReadOnlyPort_r_payload_last = axi_ram_io_axis_0_r_payload_last;
  assign _zz_38_ = 1'b0;
  assign _zz_39_ = (32'b00000000000000000000000000000000);
  assign _zz_40_ = (4'b0000);
  assign _zz_41_ = 1'b0;
  assign _zz_42_ = 1'b1;
  always @ ( * ) begin
    _zz_47_ = (8'b00000000);
    _zz_47_[2] = axi_timerCtrl_io_interrupts[1];
    _zz_47_[7] = axi_gpioACtrl_io_interrupt[1];
    _zz_47_[1] = axi_timerCtrl_io_interrupts[0];
    _zz_47_[3] = io_axiAInterrupt_regNext;
    _zz_47_[6] = axi_gpioACtrl_io_interrupt[0];
    _zz_47_[0] = axi_uartCtrl_io_interrupt;
  end

  assign axi_core_iBus_ar_valid = axi_core_cpu_iBus_cmd_valid;
  assign axi_core_iBus_ar_payload_addr = {axi_core_cpu_iBus_cmd_payload_pc[31 : 2],(2'b00)};
  assign axi_core_iBus_ar_payload_prot = (3'b110);
  assign axi_core_iBus_ar_payload_cache = (4'b1111);
  assign _zz_48_ = (! (axi_core_iBus_r_payload_resp == (2'b00)));
  assign axi_core_iBus_r_ready = 1'b1;
  always @ ( * ) begin
    _zz_2_ = 1'b0;
    if(((axi_core_dBus_arw_valid && axi_core_dBus_arw_ready) && axi_core_dBus_arw_payload_write))begin
      _zz_2_ = 1'b1;
    end
  end

  always @ ( * ) begin
    _zz_3_ = 1'b0;
    if((axi_core_dBus_b_valid && axi_core_dBus_b_ready))begin
      _zz_3_ = 1'b1;
    end
  end

  always @ ( * ) begin
    if((_zz_2_ && (! _zz_3_)))begin
      _zz_5_ = (3'b001);
    end else begin
      if(((! _zz_2_) && _zz_3_))begin
        _zz_5_ = (3'b111);
      end else begin
        _zz_5_ = (3'b000);
      end
    end
  end

  assign _zz_6_ = (_zz_4_ + _zz_5_);
  assign _zz_7_ = (! ((((_zz_4_ != (3'b000)) && axi_core_cpu_dBus_cmd_valid) && (! axi_core_cpu_dBus_cmd_payload_wr)) || (_zz_4_ == (3'b111))));
  assign _zz_53_ = (streamFork_4__io_input_ready && _zz_7_);
  assign _zz_55_ = (axi_core_cpu_dBus_cmd_valid && _zz_7_);
  assign axi_core_dBus_arw_valid = streamFork_4__io_outputs_0_valid;
  assign axi_core_dBus_arw_payload_write = streamFork_4__io_outputs_0_payload_wr;
  assign axi_core_dBus_arw_payload_prot = (3'b010);
  assign axi_core_dBus_arw_payload_cache = (4'b1111);
  assign axi_core_dBus_arw_payload_size = {1'd0, streamFork_4__io_outputs_0_payload_size};
  assign axi_core_dBus_arw_payload_addr = streamFork_4__io_outputs_0_payload_address;
  always @ ( * ) begin
    _zz_8_ = streamFork_4__io_outputs_1_valid;
    _zz_56_ = axi_core_dBus_w_ready;
    if((! streamFork_4__io_outputs_1_payload_wr))begin
      _zz_8_ = 1'b0;
      _zz_56_ = 1'b1;
    end
  end

  assign axi_core_dBus_w_valid = _zz_8_;
  assign axi_core_dBus_w_payload_last = 1'b1;
  assign axi_core_dBus_w_payload_data = streamFork_4__io_outputs_1_payload_data;
  always @ ( * ) begin
    case(streamFork_4__io_outputs_1_payload_size)
      2'b00 : begin
        _zz_9_ = (4'b0001);
      end
      2'b01 : begin
        _zz_9_ = (4'b0011);
      end
      default : begin
        _zz_9_ = (4'b1111);
      end
    endcase
  end

  assign axi_core_dBus_w_payload_strb = _zz_71_[3:0];
  assign _zz_54_ = (! (axi_core_dBus_r_payload_resp == (2'b00)));
  assign axi_core_dBus_r_ready = 1'b1;
  assign axi_core_dBus_b_ready = 1'b1;
  assign _zz_50_ = (axi_interruptController_io_pendings != (8'b00000000));
  assign _zz_49_ = (axi_timerCtrl_io_interrupts != (2'b00));
  assign _zz_52_ = systemDebugger_1__io_mem_cmd_payload_address[7:0];
  assign io_jtag_tdo = jtagBridge_1__io_jtag_tdo;
  assign axi_ramReadOnlyPort_ar_valid = axi_core_iBus_ar_valid;
  assign axi_core_iBus_ar_ready = axi_ramReadOnlyPort_ar_ready;
  assign axi_ramReadOnlyPort_ar_payload_addr = axi_core_iBus_ar_payload_addr[14:0];
  assign _zz_11_[3 : 0] = (4'b0000);
  assign axi_ramReadOnlyPort_ar_payload_id = _zz_11_;
  assign _zz_12_[7 : 0] = (8'b00000000);
  assign axi_ramReadOnlyPort_ar_payload_len = _zz_12_;
  assign axi_ramReadOnlyPort_ar_payload_size = (3'b010);
  assign axi_ramReadOnlyPort_ar_payload_burst = (2'b01);
  assign axi_core_iBus_r_valid = axi_ramReadOnlyPort_r_valid;
  assign axi_ramReadOnlyPort_r_ready = axi_core_iBus_r_ready;
  assign axi_core_iBus_r_payload_data = axi_ramReadOnlyPort_r_payload_data;
  assign axi_core_iBus_r_payload_last = axi_ramReadOnlyPort_r_payload_last;
  assign axi_core_iBus_r_payload_resp = axi_ramReadOnlyPort_r_payload_resp;
  assign axiA_arvalid = axi4ReadOnlyArbiter_1__io_output_ar_valid;
  assign axiA_araddr = _zz_30_;
  assign axiA_arid = _zz_31_;
  assign axiA_arregion = axi4ReadOnlyArbiter_1__io_output_ar_payload_region;
  assign axiA_arlen = axi4ReadOnlyArbiter_1__io_output_ar_payload_len;
  assign axiA_arsize = axi4ReadOnlyArbiter_1__io_output_ar_payload_size;
  assign axiA_arburst = axi4ReadOnlyArbiter_1__io_output_ar_payload_burst;
  assign axiA_arlock = axi4ReadOnlyArbiter_1__io_output_ar_payload_lock;
  assign axiA_arcache = axi4ReadOnlyArbiter_1__io_output_ar_payload_cache;
  assign axiA_arqos = axi4ReadOnlyArbiter_1__io_output_ar_payload_qos;
  assign axiA_arprot = axi4ReadOnlyArbiter_1__io_output_ar_payload_prot;
  assign axiA_rready = axi4ReadOnlyArbiter_1__io_output_r_ready;
  assign axiA_awvalid = axi4WriteOnlyArbiter_1__io_output_aw_valid;
  assign axiA_awaddr = _zz_35_;
  assign axiA_awid = _zz_36_;
  assign axiA_awregion = axi4WriteOnlyArbiter_1__io_output_aw_payload_region;
  assign axiA_awlen = axi4WriteOnlyArbiter_1__io_output_aw_payload_len;
  assign axiA_awsize = axi4WriteOnlyArbiter_1__io_output_aw_payload_size;
  assign axiA_awburst = axi4WriteOnlyArbiter_1__io_output_aw_payload_burst;
  assign axiA_awlock = axi4WriteOnlyArbiter_1__io_output_aw_payload_lock;
  assign axiA_awcache = axi4WriteOnlyArbiter_1__io_output_aw_payload_cache;
  assign axiA_awqos = axi4WriteOnlyArbiter_1__io_output_aw_payload_qos;
  assign axiA_awprot = axi4WriteOnlyArbiter_1__io_output_aw_payload_prot;
  assign axiA_wvalid = axi4WriteOnlyArbiter_1__io_output_w_valid;
  assign axiA_wdata = axi4WriteOnlyArbiter_1__io_output_w_payload_data;
  assign axiA_wstrb = axi4WriteOnlyArbiter_1__io_output_w_payload_strb;
  assign axiA_wlast = axi4WriteOnlyArbiter_1__io_output_w_payload_last;
  assign axiA_bready = axi4WriteOnlyArbiter_1__io_output_b_ready;
  assign axi_core_dBus_arw_ready = ((1'b1 && (! axi_core_dBus_arw_m2sPipe_valid)) || axi_core_dBus_arw_m2sPipe_ready);
  assign axi_core_dBus_arw_m2sPipe_valid = _zz_13_;
  assign axi_core_dBus_arw_m2sPipe_payload_addr = _zz_14_;
  assign axi_core_dBus_arw_m2sPipe_payload_size = _zz_15_;
  assign axi_core_dBus_arw_m2sPipe_payload_cache = _zz_16_;
  assign axi_core_dBus_arw_m2sPipe_payload_prot = _zz_17_;
  assign axi_core_dBus_arw_m2sPipe_payload_write = _zz_18_;
  assign axi_core_dBus_arw_m2sPipe_ready = axi_core_dBus_decoder_io_input_arw_ready;
  assign axi_core_dBus_w_ready = ((1'b1 && (! axi_core_dBus_w_m2sPipe_valid)) || axi_core_dBus_w_m2sPipe_ready);
  assign axi_core_dBus_w_m2sPipe_valid = _zz_19_;
  assign axi_core_dBus_w_m2sPipe_payload_data = _zz_20_;
  assign axi_core_dBus_w_m2sPipe_payload_strb = _zz_21_;
  assign axi_core_dBus_w_m2sPipe_payload_last = _zz_22_;
  assign axi_core_dBus_w_m2sPipe_ready = axi_core_dBus_decoder_io_input_w_ready;
  assign axi_core_dBus_b_valid = axi_core_dBus_decoder_io_input_b_valid;
  assign axi_core_dBus_b_payload_resp = axi_core_dBus_decoder_io_input_b_payload_resp;
  assign axi_core_dBus_r_valid = axi_core_dBus_decoder_io_input_r_valid;
  assign axi_core_dBus_r_payload_data = axi_core_dBus_decoder_io_input_r_payload_data;
  assign axi_core_dBus_r_payload_resp = axi_core_dBus_decoder_io_input_r_payload_resp;
  assign axi_core_dBus_r_payload_last = axi_core_dBus_decoder_io_input_r_payload_last;
  assign _zz_57_ = axi_core_dBus_decoder_io_sharedOutputs_0_arw_payload_addr[14:0];
  assign _zz_23_[3 : 0] = (4'b0000);
  assign _zz_24_[7 : 0] = (8'b00000000);
  assign _zz_58_ = (2'b01);
  assign _zz_59_ = axi_core_dBus_decoder_io_sharedOutputs_1_arw_payload_addr[19:0];
  assign _zz_25_[3 : 0] = (4'b0000);
  assign _zz_26_[7 : 0] = (8'b00000000);
  assign _zz_60_ = (2'b01);
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready = axi_apbBridge_io_axi_arw_ready;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready = axi_apbBridge_io_axi_w_ready;
  assign _zz_27_[7 : 0] = (8'b00000000);
  assign _zz_28_[3 : 0] = (4'b0000);
  assign _zz_29_[7 : 0] = (8'b00000000);
  assign _zz_61_ = (2'b01);
  assign _zz_62_ = (1'b0);
  assign _zz_63_ = (4'b0000);
  assign _zz_30_ = axi4ReadOnlyArbiter_1__io_output_ar_payload_addr;
  assign _zz_31_ = axi4ReadOnlyArbiter_1__io_output_ar_payload_id;
  assign _zz_32_[7 : 0] = (8'b00000000);
  assign _zz_33_[3 : 0] = (4'b0000);
  assign _zz_34_[7 : 0] = (8'b00000000);
  assign _zz_64_ = (2'b01);
  assign _zz_65_ = (1'b0);
  assign _zz_66_ = (4'b0000);
  assign _zz_35_ = axi4WriteOnlyArbiter_1__io_output_aw_payload_addr;
  assign _zz_36_ = axi4WriteOnlyArbiter_1__io_output_aw_payload_id;
  assign _zz_43_ = apb3Router_1__io_outputs_0_PADDR[11:0];
  assign _zz_44_ = apb3Router_1__io_outputs_1_PADDR[3:0];
  assign _zz_67_ = 1'b0;
  assign _zz_45_ = apb3Router_1__io_outputs_2_PADDR[7:0];
  assign _zz_46_ = apb3Router_1__io_outputs_3_PADDR[3:0];
  assign io_gpioA_write = axi_gpioACtrl_io_gpio_write;
  assign io_gpioA_writeEnable = axi_gpioACtrl_io_gpio_writeEnable;
  assign io_uartA_txd = axi_uartCtrl_io_uart_txd;
  assign io_axiReset = resetCtrl_axiReset;
  assign _zz_51_ = 1'b0;
  always @ (posedge io_axiClk) begin
    if(_zz_68_)begin
      resetCtrl_systemResetCounter <= (resetCtrl_systemResetCounter + (6'b000001));
    end
    if(bufferCC_5__io_dataOut)begin
      resetCtrl_systemResetCounter <= (6'b000000);
    end
  end

  always @ (posedge io_axiClk) begin
    resetCtrl_systemReset <= resetCtrl_systemResetUnbuffered;
    resetCtrl_axiReset <= resetCtrl_systemResetUnbuffered;
    if(axi_core_cpu_debug_resetOut_regNext)begin
      resetCtrl_axiReset <= 1'b1;
    end
  end

  always @ (posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      io_axiAInterrupt_regNext <= 1'b0;
      _zz_4_ <= (3'b000);
      _zz_13_ <= 1'b0;
      _zz_19_ <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= 1'b1;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready <= 1'b1;
    end else begin
      io_axiAInterrupt_regNext <= io_axiAInterrupt;
      _zz_4_ <= _zz_6_;
      if(axi_core_dBus_arw_ready)begin
        _zz_13_ <= axi_core_dBus_arw_valid;
      end
      if(axi_core_dBus_w_ready)begin
        _zz_19_ <= axi_core_dBus_w_valid;
      end
      if(_zz_69_)begin
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= axi_apbBridge_io_axi_arbiter_io_output_arw_valid;
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= (! axi_apbBridge_io_axi_arbiter_io_output_arw_valid);
      end else begin
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= (! axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready);
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready;
      end
      if(_zz_70_)begin
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid <= axi_apbBridge_io_axi_arbiter_io_output_w_valid;
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready <= (! axi_apbBridge_io_axi_arbiter_io_output_w_valid);
      end else begin
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid <= (! axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready);
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready <= axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready;
      end
    end
  end

  always @ (posedge io_axiClk) begin
    axi_core_cpu_debug_resetOut_regNext <= axi_core_cpu_debug_resetOut;
  end

  always @ (posedge io_axiClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      _zz_10_ <= 1'b0;
    end else begin
      _zz_10_ <= (systemDebugger_1__io_mem_cmd_valid && axi_core_cpu_debug_bus_cmd_ready);
    end
  end

  always @ (posedge io_axiClk) begin
    if(axi_core_dBus_arw_ready)begin
      _zz_14_ <= axi_core_dBus_arw_payload_addr;
      _zz_15_ <= axi_core_dBus_arw_payload_size;
      _zz_16_ <= axi_core_dBus_arw_payload_cache;
      _zz_17_ <= axi_core_dBus_arw_payload_prot;
      _zz_18_ <= axi_core_dBus_arw_payload_write;
    end
    if(axi_core_dBus_w_ready)begin
      _zz_20_ <= axi_core_dBus_w_payload_data;
      _zz_21_ <= axi_core_dBus_w_payload_strb;
      _zz_22_ <= axi_core_dBus_w_payload_last;
    end
    if(_zz_69_)begin
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(_zz_70_)begin
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_data;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_last;
    end
  end

endmodule

