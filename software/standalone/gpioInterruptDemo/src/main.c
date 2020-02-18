#include <stdint.h>

#include <efx_riscv.h>


void init();
void main();
void trap();
void crash();
void trap_entry();
void externalInterrupt();

void init(){
    //UART init
    Uart_Config uartA;
    uartA.dataLength = BITS_8; //8 bits
    uartA.parity = NONE;
    uartA.stop = ONE;
    uartA.clockDivider = CORE_HZ/(115200*UART_A_SAMPLE_PER_BAUD)-1;
    uart_applyConfig(UART_A, &uartA);

    //GPIO_A init
    GPIO_A->OUTPUT = 0;
	GPIO_A->OUTPUT_ENABLE = 3; //Pin 0 and 1 as output
	GPIO_A->INTERRUPT_RISE_ENABLE = 1; //Pin 0 interrupt on rising edge
	GPIO_A->INTERRUPT_FALL_ENABLE = 2; //Pin 1 interrupt on falling edge

	//Interrupt controller init
	INTERRUPT_CTRL->PENDINGS = GPIO_A_0_INTERRUPT_MASK | GPIO_A_1_INTERRUPT_MASK; //Clear  GPIO_A pendings
	INTERRUPT_CTRL->MASKS   |= GPIO_A_0_INTERRUPT_MASK | GPIO_A_1_INTERRUPT_MASK; //Enable GPIO_A interrupts

	//configure RISC-V interrupt CSR
	csr_write(mtvec, trap_entry); //Set the machine trap vector (trap.S)
	csr_write(mie, MIE_MEIE); //Enable machine external interrupts
	csr_write(mstatus, MSTATUS_MPP | MSTATUS_MIE); //Enable interrupts
}

void delay(){
	for(uint32_t i = 0;i < 10;i++) asm("nop");
}

void main() {
	init();

	uart_writeStr(UART_A, "Hello world\n");
	while(1){
		uart_writeStr(UART_A, "\nGPIO_A[0] rise should interrupt\n");
		GPIO_A->OUTPUT = 1;
		delay();

		uart_writeStr(UART_A, "\nGPIO_A[0] fall\n");
		GPIO_A->OUTPUT = 0;
		delay();

		uart_writeStr(UART_A, "\nGPIO_A[1] rise\n");
		GPIO_A->OUTPUT = 2;
		delay();

		uart_writeStr(UART_A, "\nGPIO_A[1] fall should interrupt\n");
		GPIO_A->OUTPUT = 0;
		delay();
	}
}

//Called by trap_entry on both exceptions and interrupts events
void trap(){
	int32_t mcause = csr_read(mcause);
	int32_t interrupt = mcause < 0;    //Interrupt if set, exception if cleared
	int32_t cause     = mcause & 0xF;
	if(interrupt){
		switch(cause){
		case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
		default: crash(); break;
		}
	} else {
		crash();
	}
}

void externalInterrupt(){
	uint32_t pendings = INTERRUPT_CTRL->PENDINGS;
	if(pendings & GPIO_A_0_INTERRUPT_MASK){
		uart_writeStr(UART_A, "GPIO_A[0] interrupt\n");
		INTERRUPT_CTRL->PENDINGS = GPIO_A_0_INTERRUPT_MASK; //Clear GPIO_A_0 pending
	}

	if(pendings & GPIO_A_1_INTERRUPT_MASK){
		uart_writeStr(UART_A, "GPIO_A[1] interrupt\n");
		INTERRUPT_CTRL->PENDINGS = GPIO_A_1_INTERRUPT_MASK; //Clear GPIO_A_1 pending
	}
}


void crash(){
	uart_writeStr(UART_A, "\n*** CRASH ***\n");
	while(1);
}

