vlib work

vlog "./*.v"
vlog "../EFX_Riscv.v"
vlog "../EfxRiscvSoc.v"

vsim -voptargs=+acc work.TestRiscVAxi

view wave  

.main clear
do wave.do

run 3ms
