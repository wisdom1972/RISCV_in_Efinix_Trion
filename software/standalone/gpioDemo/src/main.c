#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <efx_riscv.h>

void init()
{
    //GPIO_A init
    GPIO_A->OUTPUT_ENABLE = 0x000000FF;//enable all 8 bits to output
    GPIO_A->OUTPUT = 0x00000000;
    GPIO_A->INPUT = 0x00000000;

    //UART init
    Uart_Config uartA;
    uartA.dataLength = BITS_8; //8 bits
    uartA.parity = NONE;
    uartA.stop = ONE;
    uartA.clockDivider = CORE_HZ/(115200*UART_A_SAMPLE_PER_BAUD)-1;
    uart_applyConfig(UART_A, &uartA);
}

void main() {
    init();
    uint32_t counter = 0;
    uint32_t count_val=10;
    uart_writeStr(UART_A, "EFX RiscV GPIO & UART Demo!\n\r");
    while(1){
        if(counter++ == count_val){
          GPIO_A->OUTPUT =  GPIO_A->OUTPUT + 1;
          counter = 0;
        }
        if (uart_readOccupancy(UART_A)){
          uart_read(UART_A);
          uart_writeStr(UART_A,"Input a count value:");
          count_val = uart_readuint(UART_A);
          counter = 0;
        }
    }
}
