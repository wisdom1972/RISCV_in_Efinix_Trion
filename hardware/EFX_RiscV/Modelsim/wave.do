onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestRiscVAxi/Reset_N
add wave -noupdate /TestRiscVAxi/SysClk
add wave -noupdate /TestRiscVAxi/SysClkT_C
add wave -noupdate /TestRiscVAxi/io_gpioA_read
add wave -noupdate /TestRiscVAxi/io_gpioA_write
add wave -noupdate /TestRiscVAxi/io_gpioA_writeEnable
add wave -noupdate /TestRiscVAxi/io_jtag_tdo
add wave -noupdate /TestRiscVAxi/io_uartA_rxd
add wave -noupdate /TestRiscVAxi/io_uartA_txd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1401811133 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 261
configure wave -valuecolwidth 100
configure wave -justifyvalue right
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2785017856 ps}
