/*
 * briey.h
 *
 *  Created on: Aug 24, 2016
 *      Author: clp
 */

#ifndef EFX_RISCV_H_
#define EFX_RISCV_H_

#include "timer.h"
#include "uart.h"
#include "interrupt.h"
#include "gpio.h"
#include "riscv.h"

#define CORE_HZ 50000000

#define GPIO_A ((Gpio_Reg*)(0xF0000000))
#define GPIO_A_0_INTERRUPT_MASK (1 << 6)
#define GPIO_A_1_INTERRUPT_MASK (1 << 7)

#define UART_A ((Uart_Reg*)(0xF0010000))
#define UART_A_INTERRUPT_MASK (1 << 0)
#define UART_A_SAMPLE_PER_BAUD 8

#define TIMER_A ((Timer_Reg*)0xF0020040)
#define TIMER_A_INTERRUPT_MASK (1 << 1)
#define TIMER_B ((Timer_Reg*)0xF0020050)
#define TIMER_B_INTERRUPT_MASK (1 << 2)

#define INTERRUPT_CTRL ((InterruptCtrl_Reg*)0xF00F0000)

#define AXI_A_BASE 0x00000000
#define AXI_A_INTERRUPT_MASK (1 << 3)

#define AHB_A_BASE 0x00000000
#define AHB_A_INTERRUPT_MASK (1 << 3)

#endif /* EFX_RISCV_H_ */
