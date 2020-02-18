//--------------------------------------------------------------------------
// https://www.efinixinc.com
// Copyright@2019. All rights reserved. Efinix, Inc.
//--------------------------------------------------------------------------
// Module : EFX_Riscv.v
// Reviser : Bruce Chen
// Contact: brucec@efinixinc.com
// Version: V1.1
// Date   : Jul.29th.2019
//--------------------------------------------------------------------------
// Decription : EFX RISC-V V1.0 Top module
//--------------------------------------------------------------------------


module EFX_Riscv 
(
	input          io_asyncReset            ,
	input          io_axiClk                ,
	
	input          io_jtag_tms              ,
	input          io_jtag_tdi              ,
	output         io_jtag_tdo              ,
	input          io_jtag_tck              ,
	
	input  [7:0]   io_gpioA_read            ,
	output [7:0]   io_gpioA_write           ,
	output [7:0]   io_gpioA_writeEnable     ,
	
	output         io_uartA_txd             ,
	input          io_uartA_rxd
);
  
  wire              soc_io_axiReset          ;
  wire [7:0]        soc_io_gpioA_write       ;
  wire [7:0]        soc_io_gpioA_writeEnable ;
  wire              soc_io_uartA_txd         ;
  
  wire              soc_axiA_arvalid         ;
  wire              soc_axiA_arready         ;
  wire [31:0]       soc_axiA_araddr          ;
  wire [7:0]        soc_axiA_arid            ;
  wire [3:0]        soc_axiA_arregion        ;
  wire [7:0]        soc_axiA_arlen           ;
  wire [2:0]        soc_axiA_arsize          ;
  wire [1:0]        soc_axiA_arburst         ;
  wire [0:0]        soc_axiA_arlock          ;
  wire [3:0]        soc_axiA_arcache         ;
  wire [3:0]        soc_axiA_arqos           ;
  wire [2:0]        soc_axiA_arprot          ;

  wire              soc_axiA_rvalid          ;
  wire              soc_axiA_rready          ;
  wire [31:0]       soc_axiA_rdata           ;
  wire [7:0]        soc_axiA_rid             ;
  wire [1:0]        soc_axiA_rresp           ;
  wire              soc_axiA_rlast           ;

  wire              soc_axiA_awvalid         ;
  wire              soc_axiA_awready         ;
  wire [31:0]       soc_axiA_awaddr          ;
  wire [7:0]        soc_axiA_awid            ;
  wire [3:0]        soc_axiA_awregion        ;
  wire [7:0]        soc_axiA_awlen           ;
  wire [2:0]        soc_axiA_awsize          ;
  wire [1:0]        soc_axiA_awburst         ;
  wire [0:0]        soc_axiA_awlock          ;
  wire [3:0]        soc_axiA_awcache         ;
  wire [3:0]        soc_axiA_awqos           ;
  wire [2:0]        soc_axiA_awprot          ;

  wire              soc_axiA_wvalid          ;  
  wire              soc_axiA_wready          ;
  wire [31:0]       soc_axiA_wdata           ;
  wire [3:0]        soc_axiA_wstrb           ;
  wire              soc_axiA_wlast           ;
  
  wire              soc_axiA_bvalid          ;
  wire              soc_axiA_bready          ;
  wire [7:0]        soc_axiA_bid             ;
  wire [1:0]        soc_axiA_bresp           ;
  
  wire              soc_axiA_interrupt       ;

  EfxRiscvSoc soc ( 
    .io_asyncReset            (io_asyncReset           ),
    .io_axiClk                (io_axiClk               ),
    .io_axiReset              (soc_io_axiReset         ),
                              
    .io_jtag_tms              (io_jtag_tms             ),
    .io_jtag_tdi              (io_jtag_tdi             ),
    .io_jtag_tdo              (io_jtag_tdo             ),
    .io_jtag_tck              (io_jtag_tck             ),
    
    .io_gpioA_read            (io_gpioA_read           ),
    .io_gpioA_write           (soc_io_gpioA_write      ),
    .io_gpioA_writeEnable     (soc_io_gpioA_writeEnable),
    
    .io_uartA_txd             (soc_io_uartA_txd        ),
    .io_uartA_rxd             (io_uartA_rxd            ),
 //AXI write address channal   
    .axiA_awvalid             (soc_axiA_awvalid        ),
    .axiA_awready             (soc_axiA_awready        ),
    .axiA_awaddr              (soc_axiA_awaddr         ),
    .axiA_awid                (soc_axiA_awid           ),
    .axiA_awregion            (soc_axiA_awregion       ),
    .axiA_awlen               (soc_axiA_awlen          ),
    .axiA_awsize              (soc_axiA_awsize         ),
    .axiA_awburst             (soc_axiA_awburst        ),
    .axiA_awlock              (soc_axiA_awlock         ),
    .axiA_awcache             (soc_axiA_awcache        ),
    .axiA_awqos               (soc_axiA_awqos          ),
    .axiA_awprot              (soc_axiA_awprot         ),
 //AXI write data channal   
    .axiA_wvalid              (soc_axiA_wvalid         ),
    .axiA_wready              (soc_axiA_wready         ),
    .axiA_wdata               (soc_axiA_wdata          ),
    .axiA_wstrb               (soc_axiA_wstrb          ),
    .axiA_wlast               (soc_axiA_wlast          ),
 //AXI response channal   
    .axiA_bvalid              (soc_axiA_bvalid         ),
    .axiA_bready              (soc_axiA_bready         ),
    .axiA_bid                 (soc_axiA_bid            ),
    .axiA_bresp               (soc_axiA_bresp          ),
 //AXI read address channal   
    .axiA_arvalid             (soc_axiA_arvalid        ),
    .axiA_arready             (soc_axiA_arready        ),
    .axiA_araddr              (soc_axiA_araddr         ),
    .axiA_arid                (soc_axiA_arid           ),
    .axiA_arregion            (soc_axiA_arregion       ),
    .axiA_arlen               (soc_axiA_arlen          ),
    .axiA_arsize              (soc_axiA_arsize         ),
    .axiA_arburst             (soc_axiA_arburst        ),
    .axiA_arlock              (soc_axiA_arlock         ),
    .axiA_arcache             (soc_axiA_arcache        ),
    .axiA_arqos               (soc_axiA_arqos          ),
    .axiA_arprot              (soc_axiA_arprot         ),
 //AXI read data channal  
    .axiA_rvalid              (soc_axiA_rvalid         ),
    .axiA_rready              (soc_axiA_rready         ),
    .axiA_rdata               (soc_axiA_rdata          ),
    .axiA_rid                 (soc_axiA_rid            ),  
    .axiA_rresp               (soc_axiA_rresp          ),
    .axiA_rlast               (soc_axiA_rlast          ),
    
    .io_axiAInterrupt         (soc_axiA_interrupt      )
  );

  assign io_gpioA_write       = soc_io_gpioA_write;
  assign io_gpioA_writeEnable = soc_io_gpioA_writeEnable;
  assign io_uartA_txd         = soc_io_uartA_txd;

  assign soc_axiA_rvalid      = 1'b0;
  assign soc_axiA_rdata       = (32'h00000000);
  assign soc_axiA_rid         = (8'h00);
  assign soc_axiA_rresp       = (2'b00);
  assign soc_axiA_rlast       = 1'b0;
  assign soc_axiA_bvalid      = 1'b0;
  assign soc_axiA_bid         = (8'h00);
  assign soc_axiA_bresp       = (2'b00);
  assign soc_axiA_arready     = 1'b1;
  assign soc_axiA_awready     = 1'b1;
  assign soc_axiA_wready      = 1'b1;
  assign soc_axiA_interrupt   = 1'b0;
  
endmodule


