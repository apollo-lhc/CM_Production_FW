
# file: ibert_ultrascale_gty_0.xdc
####################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 2017.1
##  \   \         Application : IBERT Ultrascale
##  /   /         Filename : ibert_ultrascale_gty_ip_example.xdc
## /___/   / ## \   \  / ##  \___\/\___ ##
##
##
## Generated by Xilinx IBERT Ultrascale
##**************************************************************************
##
##Eye scan
##
##
## TX/RX out clock clock constraints
##
# GT X0Y0
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y1
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y2
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y3
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[0].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y4
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y5
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y6
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y7
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[1].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y8
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y9
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y10
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y11
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[2].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y12
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y13
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y14
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y15
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[3].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y16
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y17
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y18
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y19
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[4].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y20
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y21
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y22
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y23
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[5].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y24
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y25
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y26
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y27
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[6].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y28
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[0].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[0].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y29
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[1].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[1].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y30
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[2].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[2].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]
# GT X0Y31
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[3].u_ch/u_gtye4_channel/RXOUTCLK}] -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {IBERT/u_ibert_gty_core/inst/QUAD[7].u_q/CH[3].u_ch/u_gtye4_channel/TXOUTCLK}] -include_generated_clocks]


