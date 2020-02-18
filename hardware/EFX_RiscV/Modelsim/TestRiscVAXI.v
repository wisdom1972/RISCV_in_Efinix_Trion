
//--------------------------------------------------------------------------
// https://www.efinixinc.com
// Copyright@2019. All rights reserved. Efinix, Inc.
//--------------------------------------------------------------------------
// Module : TestRiscVAXI.v
// Author : Richard Zhu
// Contact: brucec@efinixinc.com
// Version: V1.1
// Date   : Jul.29th.2019
//--------------------------------------------------------------------------
// Decription : EFX RISC-V V1.0 Test Bench
//--------------------------------------------------------------------------

`timescale 100ps/1ps  

module TestRiscVAxi;

	
	//1111111111111111111111111111111111111111111111111111111
	
	/*++++++++++++++++++++++++++++++++++
	输入：
	输出：SysClkA,SysClkB
	++++++++++++++++++++++++++++++++++*/		
	
	parameter		SysClkT_C			= 100;		//设置系统时钟A的周期
	
	/***************************************************
	目的概述：
	功能实现：
	***************************************************/   
	reg	SysClk;	//系统时钟A
		
	task SysClkGen;
		forever 
		begin           
			 # SysClkT_C  SysClk = 	~SysClk;
		end
	endtask
	
	/***************************************************
	目的概述：
	功能实现：
	***************************************************/   
	reg	Reset_N;
	
	task SysReset_N;
		begin                             
			# 0 		Reset_N	= 0;
			# 1000	Reset_N = 1;
		end
	endtask
	
		
	//1111111111111111111111111111111111111111111111111111111
	
	
	
	//2222222222222222222222222222222222222222222222222222222
	
	/***************************************************
	目的概述：
	功能描述：
	***************************************************/   
	wire  			io_jtag_tdo					;
	wire  [7:0] io_gpioA_read				= 8'h0;
	wire 	[7:0] io_gpioA_write			;
	wire 	[7:0] io_gpioA_writeEnable;
	wire  			io_uartA_txd				;
  wire  			io_uartA_rxd				= 1'h1;
	
	EFX_Riscv  U1_RiscV
	(
		.io_asyncReset				(~Reset_N),
		.io_axiClk						(SysClk),
		.io_jtag_tms					(1'h0),
		.io_jtag_tdi					(1'h1),
		.io_jtag_tdo					(io_jtag_tdo),
		.io_jtag_tck					(1'h0),
		.io_gpioA_read				(io_gpioA_read),
		.io_gpioA_write				(io_gpioA_write),
		.io_gpioA_writeEnable	(io_gpioA_writeEnable),
		.io_uartA_txd					(io_uartA_txd),
		.io_uartA_rxd					(io_uartA_rxd)
	);      
      
	//2222222222222222222222222222222222222222222222222222222



	//3333333333333333333333333333333333333333333333333333333
	
	/*++++++++++++++++++++++++++++++++++
	输入：
	输出：
	++++++++++++++++++++++++++++++++++*/	
	
	/***************************************************
	目的概述：
	功能描述：
	***************************************************/   
	/***************************************************
	目的概述：
	功能描述：
	***************************************************/
	/***************************************************
	目的概述：
	功能描述：
	***************************************************/ 
	//3333333333333333333333333333333333333333333333333333333
	
	//NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
	
	/*++++++++++++++++++++++++++++++++++
	平台任务
	++++++++++++++++++++++++++++++++++*/		
	
	
//  integer i;
//	reg [7:0]	TestRam0;
//	reg [7:0]	TestRam1;
//	reg [7:0]	TestRam2;
//	reg [7:0]	TestRam3;
//
//	tri1 [7:0]	TestRamA0 = TestRam0;
//	tri1 [7:0]	TestRamA1 = TestRam1;
//	tri1 [7:0]	TestRamA2 = TestRam2;
//	tri1 [7:0]	TestRamA3 = TestRam3;
//	
//  integer SoftwareBinFile;
//  
//  initial 
//  begin
//		SoftwareBinFile=$fopen(`SoftBinFile,"rb");
//		
//		for(i=0;i<128;i=i+1)
//		begin
//			$fscanf(SoftwareBinFile, "%c", TestRam0); 
//			$fscanf(SoftwareBinFile, "%c", TestRam1); 
//			$fscanf(SoftwareBinFile, "%c", TestRam2); 
//			$fscanf(SoftwareBinFile, "%c", TestRam3); 
////			if ($feof(SoftwareBinFile)) TestRam0 = 8'h0 ; else $fscanf(SoftwareBinFile, "%c", TestRam0); 
////			if ($feof(SoftwareBinFile)) TestRam1 = 8'h0 ; else $fscanf(SoftwareBinFile, "%c", TestRam1); 
////			if ($feof(SoftwareBinFile)) TestRam2 = 8'h0 ; else $fscanf(SoftwareBinFile, "%c", TestRam2); 
////			if ($feof(SoftwareBinFile)) TestRam3 = 8'h0 ; else $fscanf(SoftwareBinFile, "%c", TestRam3); 
//			ram_symbol0[i] = TestRamA0;
//			ram_symbol1[i] = TestRamA1;
//			ram_symbol2[i] = TestRamA2;
//			ram_symbol3[i] = TestRamA3;
//			$display ("%h%h%h%h",TestRam0,TestRam1,TestRam2,TestRam3);
//		end
//		
//		$fclose(SoftwareBinFile);                
//  end
//	
    
	
	
	
	
	
	
	
	
	
	initial
	begin
	end
	
	initial
	begin
	end
	
	/***************************************************
	目的概述：仿真程序
	功能描述：	
	***************************************************/
	initial 
	begin
		SysClk 		= 0;  
		Reset_N		= 0;
		fork
		 	SysClkGen;
		 	SysReset_N;
		 join
	end
	
	//NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
	
endmodule

