set bd_path proj

set bd_name c2cSlave

set bd_files "\
    src/c2cSlave/createC2CSlaveInterconnect.tcl
    "

set vhdl_files "\
     ../CM_Common_FW/heater/lut_oscilator.vhd \
     ../CM_Common_FW/heater/heater.vhd \
     src/top.vhd \
     ../CM_Common_FW/misc/pass_time_domain.vhd \
     ../CM_Common_FW/misc/pacd.vhd \
     ../CM_Common_FW/misc/types.vhd \
     ../CM_Common_FW/misc/counter_clock.vhd \
     ../CM_Common_FW/misc/capture_CDC.vhd \
     ../CM_Common_FW/axiReg/axiRegPkg.vhd \
     ../CM_Common_FW/axiReg/axiReg.vhd \
     ../CM_Common_FW/myReg/myReg.vhd \
     ../CM_Common_FW/misc/RGB_PWM.vhd \
     ../CM_Common_FW/misc/LED_PWM.vhd \                                 
     ../CM_Common_FW/misc/counter.vhd \
     src/K_IO/K_IO_PKG.vhd \
     src/K_IO/K_IO_map.vhd \
     src/CM_K_info/CM_K_info.vhd \
     src/CM_K_info/FW_INFO_PKG.vhd \
     src/CM_K_info/FW_INFO_map.vhd \
     src/TCDS/TCDS.vhd \
     src/TCDS/KINTEX_TCDS_map.vhd \
     src/TCDS/KINTEX_TCDS_PKG.vhd \
     "
set xdc_files "\
    src/top_pins.xdc \
    src/top_timing.xdc	\
    src/heater_constraint.xdc \
    "	    

set xci_files "\
    	      cores/Local_Clocking/Local_Clocking.xci \
    	      cores/TCDS_TxRx/TCDS_TxRx.xci  \
	      cores/TCDS_DRP/TCDS_DRP.xci \
	      cores/AXI_BRAM/AXI_BRAM.xci \
	      cores/DP_BRAM/DP_BRAM.xci \
    	      "

#DRP ip
#set ip_repo_path ../bd/IP
set ip_repo_path ../bd/IP/packaged_ip/
set_property  ip_repo_paths ${ip_repo_path}  [current_project]
update_ip_catalog
