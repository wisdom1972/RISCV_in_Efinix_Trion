create_clock -period 20 io_axiClk
create_clock -period 1000 io_jtag_tck
set_false_path -from io_axiClk -to io_jtag_tck
set_false_path -from io_jtag_tck -to io_axiClk
