# 200 MHz oscillator
create_clock -period 5.000 -waveform {0.000 2.500} [get_nets clk_200]

# 40 MHz extracted clock


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_pblock pblock_heater



create_pblock {pblock_gn_htr_1[0].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[0].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {SLICE_X3Y522:SLICE_X85Y593}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {DSP48E2_X1Y210:DSP48E2_X9Y235}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {LAGUNA_X0Y360:LAGUNA_X11Y467}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {RAMB18_X0Y210:RAMB18_X6Y235}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {RAMB36_X0Y105:RAMB36_X6Y117}
resize_pblock [get_pblocks {pblock_gn_htr_1[0].htr_1}] -add {URAM288_X0Y140:URAM288_X1Y155}
create_pblock {pblock_gn_htr_1[1].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[1].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {SLICE_X3Y458:SLICE_X86Y521}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {DSP48E2_X1Y184:DSP48E2_X9Y207}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {RAMB18_X0Y184:RAMB18_X6Y207}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {RAMB36_X0Y92:RAMB36_X6Y103}
resize_pblock [get_pblocks {pblock_gn_htr_1[1].htr_1}] -add {URAM288_X0Y124:URAM288_X1Y135}
create_pblock {pblock_gn_htr_1[2].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[2].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {SLICE_X90Y523:SLICE_X167Y592}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {DSP48E2_X11Y210:DSP48E2_X18Y235}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {LAGUNA_X14Y360:LAGUNA_X23Y465}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {RAMB18_X7Y210:RAMB18_X11Y235}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {RAMB36_X7Y105:RAMB36_X11Y117}
resize_pblock [get_pblocks {pblock_gn_htr_1[2].htr_1}] -add {URAM288_X2Y140:URAM288_X3Y155}
create_pblock {pblock_gn_htr_1[3].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[3].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {SLICE_X89Y458:SLICE_X168Y521}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {DSP48E2_X11Y184:DSP48E2_X18Y207}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {RAMB18_X7Y184:RAMB18_X11Y207}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {RAMB36_X7Y92:RAMB36_X11Y103}
resize_pblock [get_pblocks {pblock_gn_htr_1[3].htr_1}] -add {URAM288_X2Y124:URAM288_X3Y135}
create_pblock {pblock_gn_htr_1[4].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[4].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {SLICE_X2Y376:SLICE_X87Y450}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {DSP48E2_X1Y152:DSP48E2_X9Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {RAMB18_X0Y152:RAMB18_X6Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {RAMB36_X0Y76:RAMB36_X6Y89}
resize_pblock [get_pblocks {pblock_gn_htr_1[4].htr_1}] -add {URAM288_X0Y104:URAM288_X1Y119}
create_pblock {pblock_gn_htr_1[5].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[5].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {SLICE_X2Y308:SLICE_X87Y373}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {DSP48E2_X1Y124:DSP48E2_X9Y147}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {LAGUNA_X0Y256:LAGUNA_X11Y359}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {RAMB18_X0Y124:RAMB18_X6Y147}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {RAMB36_X0Y62:RAMB36_X6Y73}
resize_pblock [get_pblocks {pblock_gn_htr_1[5].htr_1}] -add {URAM288_X0Y84:URAM288_X1Y95}
create_pblock {pblock_gn_htr_1[6].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[6].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {SLICE_X88Y376:SLICE_X168Y453}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {DSP48E2_X11Y152:DSP48E2_X18Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {RAMB18_X7Y152:RAMB18_X11Y179}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {RAMB36_X7Y76:RAMB36_X11Y89}
resize_pblock [get_pblocks {pblock_gn_htr_1[6].htr_1}] -add {URAM288_X2Y104:URAM288_X3Y119}
create_pblock {pblock_gn_htr_1[7].htr_1}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] [get_cells -quiet [list {TCDS_1/gen_heater_1[7].heater_1}]]
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {SLICE_X88Y308:SLICE_X167Y373}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {DSP48E2_X11Y124:DSP48E2_X18Y147}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {LAGUNA_X12Y256:LAGUNA_X23Y359}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {RAMB18_X7Y124:RAMB18_X11Y147}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {RAMB36_X7Y62:RAMB36_X11Y73}
resize_pblock [get_pblocks {pblock_gn_htr_1[7].htr_1}] -add {URAM288_X2Y84:URAM288_X3Y95}
create_pblock {pblock_gn_htr_2[8].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[8].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {SLICE_X2Y222:SLICE_X87Y298}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {DSP48E2_X1Y90:DSP48E2_X9Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {LAGUNA_X0Y120:LAGUNA_X11Y237}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {RAMB18_X0Y90:RAMB18_X6Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {RAMB36_X0Y45:RAMB36_X6Y58}
resize_pblock [get_pblocks {pblock_gn_htr_2[8].htr_2}] -add {URAM288_X0Y60:URAM288_X1Y75}
create_pblock {pblock_gn_htr_2[9].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[9].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {SLICE_X2Y151:SLICE_X86Y221}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {DSP48E2_X1Y62:DSP48E2_X9Y87}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {RAMB18_X0Y62:RAMB18_X6Y87}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {RAMB36_X0Y31:RAMB36_X6Y43}
resize_pblock [get_pblocks {pblock_gn_htr_2[9].htr_2}] -add {URAM288_X0Y44:URAM288_X1Y55}
create_pblock {pblock_gn_htr_2[10].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[10].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {SLICE_X90Y151:SLICE_X168Y222}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {DSP48E2_X11Y62:DSP48E2_X18Y87}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {RAMB18_X7Y62:RAMB18_X11Y87}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {RAMB36_X7Y31:RAMB36_X11Y43}
resize_pblock [get_pblocks {pblock_gn_htr_2[10].htr_2}] -add {URAM288_X2Y44:URAM288_X3Y55}
create_pblock {pblock_gn_htr_2[1].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[11].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {SLICE_X90Y223:SLICE_X167Y298}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {DSP48E2_X11Y90:DSP48E2_X18Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {LAGUNA_X14Y120:LAGUNA_X23Y237}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {RAMB18_X7Y90:RAMB18_X11Y117}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {RAMB36_X7Y45:RAMB36_X11Y58}
resize_pblock [get_pblocks {pblock_gn_htr_2[1].htr_2}] -add {URAM288_X2Y60:URAM288_X3Y75}
create_pblock {pblock_gn_htr_2[12].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[12].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {SLICE_X2Y4:SLICE_X87Y74}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {DSP48E2_X0Y2:DSP48E2_X9Y29}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {LAGUNA_X0Y8:LAGUNA_X11Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {RAMB18_X0Y2:RAMB18_X6Y29}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {RAMB36_X0Y1:RAMB36_X6Y14}
resize_pblock [get_pblocks {pblock_gn_htr_2[12].htr_2}] -add {URAM288_X0Y4:URAM288_X1Y19}
create_pblock {pblock_gn_htr_2[13].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[13].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {SLICE_X2Y76:SLICE_X86Y146}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {DSP48E2_X1Y32:DSP48E2_X9Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {RAMB18_X0Y32:RAMB18_X6Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {RAMB36_X0Y16:RAMB36_X6Y28}
resize_pblock [get_pblocks {pblock_gn_htr_2[13].htr_2}] -add {URAM288_X0Y24:URAM288_X1Y35}
create_pblock {pblock_gn_htr_2[14].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[14].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {SLICE_X89Y4:SLICE_X167Y74}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {DSP48E2_X11Y2:DSP48E2_X18Y29}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {LAGUNA_X12Y8:LAGUNA_X23Y119}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {RAMB18_X7Y2:RAMB18_X11Y29}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {RAMB36_X7Y1:RAMB36_X11Y14}
resize_pblock [get_pblocks {pblock_gn_htr_2[14].htr_2}] -add {URAM288_X2Y4:URAM288_X3Y19}
create_pblock {pblock_gn_htr_2[15].htr_2}
add_cells_to_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] [get_cells -quiet [list {TCDS_1/gen_heater_2[15].heater_2}]]
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {SLICE_X88Y74:SLICE_X167Y146}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {DSP48E2_X11Y30:DSP48E2_X18Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {RAMB18_X7Y30:RAMB18_X11Y57}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {RAMB36_X7Y15:RAMB36_X11Y28}
resize_pblock [get_pblocks {pblock_gn_htr_2[15].htr_2}] -add {URAM288_X2Y20:URAM288_X3Y35}

set_property C_CLK_INPUT_FREQ_HZ 50000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets AXI_CLK]
