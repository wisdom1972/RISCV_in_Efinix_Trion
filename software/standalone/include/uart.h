#ifndef UART_H_
#define UART_H_


typedef struct
{
  volatile uint32_t DATA;
  volatile uint32_t STATUS;
  volatile uint32_t CLOCK_DIVIDER;
  volatile uint32_t FRAME_CONFIG;
} Uart_Reg;

enum UartDataLength {BITS_8 = 8};
enum UartParity {NONE = 0,EVEN = 1,ODD = 2};
enum UartStop {ONE = 0,TWO = 1};

typedef struct {
     enum UartDataLength dataLength;
     enum UartParity parity;
     enum UartStop stop;
     uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
     return (reg->STATUS >> 16) & 0xFF;
}
static uint32_t uart_readOccupancy(Uart_Reg *reg){
     return reg->STATUS >> 24;
}

static void uart_write(Uart_Reg *reg, char data){
     while(uart_writeAvailability(reg) == 0);
     reg->DATA = data;
}

static void uart_writeStr(Uart_Reg *reg, char* str){
     while(*str) uart_write(reg, *str++);
}

static char uart_read(Uart_Reg *reg){
     while(uart_readOccupancy(reg) == 0);
     return reg->DATA;
}

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
     reg->CLOCK_DIVIDER = config->clockDivider;
     reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
}

char readStr_buf[100];

static char* uart_readStr(Uart_Reg *reg){
        uint32_t i=0;
        uint32_t j=0;
        char temp;
        while(i<100) readStr_buf[i++] = 0;
        while(j<100) {
                temp = uart_read(reg);
                if(temp=='\r') break;
                else if(temp=='\b'){
                        if(j!=0){
                                readStr_buf[--j]=0;
                                uart_writeStr(reg,"\b \b");
                        }
                        else readStr_buf[j] = 0;
                }
                else{
                        readStr_buf[j++] = temp;
                        uart_write(reg,temp);
                }
        }
        uart_writeStr(reg,"\n\r");
        return readStr_buf;
}

uint32_t uart_readuint(Uart_Reg* reg){
     return strtoul(uart_readStr(reg),NULL,0);
}

void uart_writeuint(Uart_Reg* Reg, uint32_t unint_data, uint32_t format){
     char buf[10];
     itoa(unint_data,buf,format);
     uart_writeStr(Reg,buf);
}
#endif /* UART_H_ */


