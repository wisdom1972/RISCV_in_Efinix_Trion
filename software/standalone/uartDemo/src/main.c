#include <stdint.h>

#include <efx_riscv.h>

void init(){
	//GPIO_A init
	GPIO_A->OUTPUT_ENABLE = 0x000000FF;
	GPIO_A->OUTPUT = 0x00000000;

    //UART init
    Uart_Config uartA;
    uartA.dataLength = BITS_8; //8 bits
    uartA.parity = NONE;
    uartA.stop = ONE;
    uartA.clockDivider = CORE_HZ/(9600*UART_A_SAMPLE_PER_BAUD)-1;
    uart_applyConfig(UART_A, &uartA);
}

void main() {
	init();
	volatile uint32_t *ahb_base = (volatile uint32_t *)AXI_A_BASE;
	int i, j, k;
	uint32_t t;

	j = 0;
	k = 0;
	uart_writeStr(UART_A, "Hi Rechard Zhu!\n");
    while(1){
        while(uart_readOccupancy(UART_A)){
        	t = uart_read(UART_A);
        	GPIO_A->OUTPUT = ~t;
        	uart_write(UART_A, t);

        	i = ((i >> 8) & 0x00FFFFFF) | (((int)t << 24) & 0xFF000000);
        	j++;
        	if (j==4){
        		uart_writeStr(UART_A, "\n");
        		(*(ahb_base+k)) = (uint32_t)i;
        		uart_writeStr(UART_A, (ahb_base+k));
        		k++;
        		j = 0;
        		uart_writeStr(UART_A, "\n");
        	}
        }
    }
}

