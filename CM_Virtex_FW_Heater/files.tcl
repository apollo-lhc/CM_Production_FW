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
     src/FW_info/FW_info.vhd \
     src/TCDS/VIRTEX_TCDS_map.vhd \
     src/TCDS/VIRTEX_TCDS_PKG.vhd \               
     src/TCDS/TCDS.vhd \
     src/example_ibert_ultrascale_gty_0.vhd \
     "

set verilog_files "\                                                                                                                                                                                              
    src/TCDS/TCDS_TxRx_example_stimulus_64b66b.v \
    src/TCDS/TCDS_TxRx_example_reset_sync.v \
    src/TCDS/TCDS_TxRx_prbs_any.v \
    "

set xdc_files "\
    src/top_pins.xdc \
    src/top_timing.xdc	\
    src/power.xdc \
    src/example_ibert_ultrascale_gty_0.xdc \
    src/ibert_ultrascale_gty_ip_example.xdc \
    "	    

set xci_files "\
              cores/Local_Clocking/Local_Clocking.xci \
              cores/TCDS_TxRx/TCDS_TxRx.xci  \                             
              cores/AXI_DRP/AXI_DRP.xci \
              cores/ibert_ultrascale_gty_0/ibert_ultrascale_gty_0.xci \
              "

#DRP ip
set ip_repo_path ../bd/IP
set_property  ip_repo_paths ${ip_repo_path}  [current_project]
update_ip_catalog

#	      cores/LHC/LHC.xci \
