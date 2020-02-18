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

    //Timer init
	TIMER_A->LIMIT = 1000000-1; //Each 1M cycles
	TIMER_A->CLEARS_TICKS = 0x00010001; //Auto reload, Count up each cycle

	//Interrupt controller init
	INTERRUPT_CTRL->PENDINGS = TIMER_A_INTERRUPT_MASK; //Clear  TIMER_A pending
	INTERRUPT_CTRL->MASKS   |= TIMER_A_INTERRUPT_MASK; //Enable TIMER_A interrupt

	//configure RISC-V interrupt CSR
	csr_write(mtvec, trap_entry); //Set the machine trap vector (trap.S)
	csr_write(mie, MIE_MEIE); //Enable machine external interrupts
	csr_write(mstatus, MSTATUS_MPP | MSTATUS_MIE); //Enable interrupts
}

void main() {
	init();

	uart_writeStr(UART_A, "Hello world\n");
	while(1); //Idle
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
	if(pendings & TIMER_A_INTERRUPT_MASK){
		uart_writeStr(UART_A, "*");
		INTERRUPT_CTRL->PENDINGS = TIMER_A_INTERRUPT_MASK; //Clear TIMER_A pending
	}
}


void crash(){
	uart_writeStr(UART_A, "\n*** CRASH ***\n");
	while(1);
}

