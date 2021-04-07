# 200 MHz oscillator
create_clock -period 5.000 -waveform {0.000 2.500} [get_nets clk_200]

# 40 MHz extracted clock


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_pblock pblock_heater



create_pblock {pblock_gn_htr_1[0].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[0].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {SLICE_X3Y454:SLICE_X45Y593}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {DSP48E2_X1Y182:DSP48E2_X6Y235}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {LAGUNA_X0Y360:LAGUNA_X5Y467}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {RAMB18_X0Y182:RAMB18_X2Y235}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {RAMB36_X0Y91:RAMB36_X2Y117}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {URAM288_X0Y124:URAM288_X0Y155}
create_pblock {pblock_gn_htr_1[1].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[1].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {SLICE_X45Y452:SLICE_X86Y598}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {DSP48E2_X7Y182:DSP48E2_X9Y237}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {LAGUNA_X6Y360:LAGUNA_X11Y477}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {RAMB18_X3Y182:RAMB18_X6Y237}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {RAMB36_X3Y91:RAMB36_X6Y118}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {URAM288_X1Y124:URAM288_X1Y155}
create_pblock {pblock_gn_htr_1[2].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[2].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {SLICE_X129Y452:SLICE_X167Y599}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {DSP48E2_X15Y182:DSP48E2_X18Y239}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {LAGUNA_X18Y360:LAGUNA_X23Y479}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {RAMB18_X9Y182:RAMB18_X11Y239}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {RAMB36_X9Y91:RAMB36_X11Y119}
create_pblock {pblock_gn_htr_1[3].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[3].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {SLICE_X89Y454:SLICE_X129Y599}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {DSP48E2_X11Y182:DSP48E2_X14Y239}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {LAGUNA_X12Y360:LAGUNA_X17Y479}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {RAMB18_X7Y182:RAMB18_X8Y239}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {RAMB36_X7Y91:RAMB36_X8Y119}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {URAM288_X2Y124:URAM288_X3Y159}
create_pblock {pblock_gn_htr_1[4].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[4].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {SLICE_X2Y303:SLICE_X45Y450}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {DSP48E2_X1Y122:DSP48E2_X6Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {LAGUNA_X0Y246:LAGUNA_X5Y359}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {RAMB18_X0Y122:RAMB18_X2Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {RAMB36_X0Y61:RAMB36_X2Y89}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {URAM288_X0Y84:URAM288_X0Y119}
create_pblock {pblock_gn_htr_1[5].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[5].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {SLICE_X47Y450:SLICE_X87Y303}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {DSP48E2_X7Y122:DSP48E2_X9Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {LAGUNA_X6Y246:LAGUNA_X11Y359}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {RAMB18_X3Y122:RAMB18_X6Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {RAMB36_X3Y61:RAMB36_X6Y89}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {URAM288_X1Y84:URAM288_X1Y119}
create_pblock {pblock_gn_htr_1[6].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[6].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {SLICE_X128Y304:SLICE_X168Y453}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {DSP48E2_X15Y122:DSP48E2_X18Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {LAGUNA_X18Y248:LAGUNA_X23Y359}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {RAMB18_X9Y122:RAMB18_X11Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {RAMB36_X9Y61:RAMB36_X11Y89}
create_pblock {pblock_gn_htr_1[7].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[7].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {SLICE_X88Y301:SLICE_X127Y451}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {DSP48E2_X11Y122:DSP48E2_X14Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {LAGUNA_X12Y242:LAGUNA_X17Y359}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {RAMB18_X7Y122:RAMB18_X8Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {RAMB36_X7Y61:RAMB36_X8Y89}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {URAM288_X2Y84:URAM288_X3Y119}
create_pblock {pblock_gn_htr_2[8].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[8].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {SLICE_X46Y150:SLICE_X87Y298}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {DSP48E2_X7Y60:DSP48E2_X9Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {LAGUNA_X6Y120:LAGUNA_X11Y237}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {RAMB18_X3Y60:RAMB18_X6Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {RAMB36_X3Y30:RAMB36_X6Y58}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {URAM288_X1Y40:URAM288_X1Y75}
create_pblock {pblock_gn_htr_2[9].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[9].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {SLICE_X2Y151:SLICE_X45Y299}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {DSP48E2_X1Y62:DSP48E2_X6Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {LAGUNA_X0Y120:LAGUNA_X5Y239}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {RAMB18_X0Y62:RAMB18_X2Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {RAMB36_X0Y31:RAMB36_X2Y59}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {URAM288_X0Y44:URAM288_X0Y79}
create_pblock {pblock_gn_htr_2[10].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[10].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {SLICE_X90Y151:SLICE_X126Y297}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {DSP48E2_X11Y62:DSP48E2_X14Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {LAGUNA_X14Y120:LAGUNA_X17Y235}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {RAMB18_X7Y62:RAMB18_X8Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {RAMB36_X7Y31:RAMB36_X8Y58}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {URAM288_X2Y44:URAM288_X3Y75}
create_pblock {pblock_gn_htr_2[1].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[11].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {SLICE_X126Y151:SLICE_X167Y298}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {DSP48E2_X15Y62:DSP48E2_X18Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {LAGUNA_X18Y120:LAGUNA_X23Y237}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {RAMB18_X9Y62:RAMB18_X11Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {RAMB36_X9Y31:RAMB36_X11Y58}
create_pblock {pblock_gn_htr_2[12].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[12].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {SLICE_X2Y4:SLICE_X45Y148}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {DSP48E2_X0Y2:DSP48E2_X6Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {LAGUNA_X0Y8:LAGUNA_X5Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {RAMB18_X0Y2:RAMB18_X2Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {RAMB36_X0Y1:RAMB36_X2Y28}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {URAM288_X0Y4:URAM288_X0Y35}
create_pblock {pblock_gn_htr_2[13].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[13].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {SLICE_X46Y5:SLICE_X86Y149}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {DSP48E2_X7Y2:DSP48E2_X9Y59}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {LAGUNA_X6Y10:LAGUNA_X11Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {RAMB18_X3Y2:RAMB18_X6Y59}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {RAMB36_X3Y1:RAMB36_X6Y29}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {URAM288_X1Y4:URAM288_X1Y39}
create_pblock {pblock_gn_htr_2[14].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[14].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {SLICE_X127Y4:SLICE_X167Y148}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {DSP48E2_X15Y2:DSP48E2_X18Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {LAGUNA_X18Y8:LAGUNA_X23Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {RAMB18_X9Y2:RAMB18_X11Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {RAMB36_X9Y1:RAMB36_X11Y28}
create_pblock {pblock_gn_htr_2[15].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[15].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {SLICE_X88Y3:SLICE_X125Y149}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {DSP48E2_X11Y2:DSP48E2_X14Y59}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {LAGUNA_X12Y6:LAGUNA_X17Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {RAMB18_X7Y2:RAMB18_X8Y59}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {RAMB36_X7Y1:RAMB36_X8Y29}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {URAM288_X2Y4:URAM288_X3Y39}



set_property C_CLK_INPUT_FREQ_HZ 50000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets AXI_CLK]
