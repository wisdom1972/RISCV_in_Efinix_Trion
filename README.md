# RISCV_in_Efinix_Trion
How to embedded RISCV MCU into Efinix Trion FPGA

## 在Efinix的Trion系列FPGA中实现RISCV软核CPU

```
____  ___ ____   ______     __  _         _____     _             
|  _ \|_ _/ ___| / ___\ \   / / (_)_ __   |_   _| __(_) ___  _ __  
| |_) || |\___ \| |    \ \ / /  | | '_ \    | || '__| |/ _ \| '_ \
|  _ < | | ___) | |___  \ V /   | | | | |   | || |  | | (_) | | | |
|_| \_\___|____/ \____|  \_/    |_|_| |_|   |_||_|  |_|\___/|_| |_|

```

## Description

> 项目的目的：

> 在FPGA的应用中，经常需要用到软核CPU，这样可以实现小规模的SoC，传统的FPGA公司都是采用自己封闭的系统，不能提供最大的系统灵活度，　而RISCV采用开放的体系结构，可以很好实现平台化设计中的维护和移植。　


**Efinix的已经率先在FPGA领域集成了公开源码的RISCV,而且Efinix的FPGA可以支持４K-120K逻辑资源，可以集成一个或者多个ＲISCV在系统中，给FPGA设计者提供极大的自由度，同时也开放AXI总线接口，可以方便集成FPGA中的定制IP.**


本设计采用系统全片上的设计方法，　可以集成RISCV的CPU以及外设，同时将程序和数据空间都可以轻松采用Efinix的FPGA内的Block RAM实现。　RISCV支持硬件乘法器


2019-10-2 V1.0  


## 正式发布的第一个版本




 系统资源：
```
---------- Resource Summary (begin) ----------

---------- Resource Summary (end) ----------
```

This repo focus on introduction Efinix Trion Series FPGA IP support RISCV soft core CPU

- README.md  the project readme file
- Efinix 的官网是 www.efinixinc.com

Efinix FPGA 的第一个低成本FPGA家族是 Trion :
- you can register to access the documentation
- we will provide the EVB and software for your evaluation.
- ...


## Trion FPGA Family

```
- FPGA lower than 30mw
 - T4,T8      : 4K , 8K  pure soft logic fabric product
 - Package    : 5x5mm FBGA81, 55 GPIOs
 - EVB        :
   - T8EVB with build in programmer, you only need PC with USB
   - T20EVB with build in programmer based on FTDI chip, you only need PC with USB


-
```

## T20 FPGA summary

Features  

- High-density, low-power Quantum TM architecture Built on SMIC 40 nm process  
- Low core leakage current (6.7 mA typical)  
- FPGA interface blocks  
```
— 20K Logic cells
— GPIO
— PLL
— LVDS 800 Mbps per lane with up to 20 TX pairs and 26 RX pairs

HardIPs

— MIPI DPHY with CSI-2 controller hard IP, 1.5 Gbps per lane  
— DDR3, LPDDR3, LPDDR2 x16 PHY with memory controller hard IP, 12.8 Gbps
aggregate bandwidth



```
## Software

On Ubuntu 16LTS : Efinix provide the Free FPGA develop suit, you need register it and buy one piece of EVB

```sh
```
Other features :

- Efinity Version Number：2019.3.272.1.6
- Test the project on Windows and Ubuntu16 environment both

## Hardware for EVB

- 项目使用T20F256EVB作为测试硬件环境，其中LVDS的收发端子以及LED作为PHY和状态运行显示

- The Project is based on Efinix T20F256 EVB, its main features is as follows:  
-- The Trion T20 BGA256 development board features:  
-- T20 FPGA  
-- **8 user LEDs**  
-- 3 user pushbutton switches, 3 user DIP switches  
-- Micro-USB port  
-- SPI and JTAG headers to facilitate configuration  
-- 3 I/O headers to connect to external devices  
-- 50 and 74.25 MHz oscillators  
-- __LVDS TX, RX, and clock headers__
-- 256 Mb SDR SDRAM

![T20F256EVB](./T20F256EVB.jpg)

### T20F256EVB Product picture

![T20F256EVB Product Picture](./T20F256EVB_PCB.jpg)



## Project install


- STEP1: install Efinity 2019.2 or other advanced version in Win or Ubuntu
- STEP2: get ready of the T20F256EVB,  
   - if you have same EVB with Efinix engieers, with the other words, it is easy to find the issue with same two boards when you need tech support.

- STEP3: download the total repository directory into Efinity project directory, for examples, C:\Efinity\2018.4\project\
-- debug  
-- Source  
--




## Project Verilog file directory

-  






## Acknowledge

The code constributor are major from Bruce Chen

Project　Test by Bruce Chen, Richard Zhu and Ben Chen

Project upload by Wisdom Zhang

Anything question: email: 909614802 at qq dot com
```
 _____  __ _       _      
| ____|/ _(_)_ __ (_)_  __
|  _| | |_| | '_ \| \ \/ /
| |___|  _| | | | | |>  <
|_____|_| |_|_| |_|_/_/\_\
```
