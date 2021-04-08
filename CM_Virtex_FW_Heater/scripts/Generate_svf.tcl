#this has to be called from inside an open session
source ../scripts/settings.tcl

#add the device info for the uC
#set device-info-file ../scripts/CM_uC_dev_info.csv

set SVF_TARGET svf_top_0



#derived from walkthrough https://blog.xjtag.com/2016/07/creating-svf-files-using-xilinx-vivado/
open_hw
create_hw_target ${SVF_TARGET}
open_hw_target [get_hw_targets -regexp .*/${SVF_TARGET}]

#add the uC to the chain
#create_hw_device -idcode 4BA00477

#add the kintex to the chain
create_hw_device -part xcku15p-ffva1760-2-e

#add the virtex to the chain
set DEVICE [create_hw_device -part ${FPGA_part}]
set_property PROGRAM.FILE {../bit/top.bit} $DEVICE
#set_property PROGRAM.FILE {system_management_wiz_0_ex.runs/impl_1/top.bit} $DEVICE
set_param xicom.config_chunk_size 0
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

program_hw_devices -force -svf_file {../bit/top.svf} ${DEVICE}
#program_hw_devices -force -svf_file {system_management_wiz_0_ex.runs/impl_1/top.svf} ${DEVICE} 

