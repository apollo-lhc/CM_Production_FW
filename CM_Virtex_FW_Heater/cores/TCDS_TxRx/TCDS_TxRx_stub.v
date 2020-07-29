// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sat Jun 20 19:48:39 2020
// Host        : lnx4108.classe.cornell.edu running 64-bit Scientific Linux release 7.7 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /mnt/scratch/rzou/CM_Virtex_FW_Heater_v1/cores/TCDS_TxRx/TCDS_TxRx_stub.v
// Design      : TCDS_TxRx
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu7p-flvb2104-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "TCDS_TxRx_gtwizard_top,Vivado 2019.2.1" *)
module TCDS_TxRx(gtwiz_userclk_tx_active_in, 
  gtwiz_userclk_rx_active_in, gtwiz_reset_clk_freerun_in, gtwiz_reset_all_in, 
  gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, gtrefclk00_in, qpll0lockdetclk_in, 
  qpll0locken_in, qpll0fbclklost_out, qpll0lock_out, qpll0outclk_out, qpll0outrefclk_out, 
  qpll0refclklost_out, drpaddr_in, drpclk_in, drpdi_in, drpen_in, drpwe_in, eyescanreset_in, 
  eyescantrigger_in, gtyrxn_in, gtyrxp_in, loopback_in, rxgearboxslip_in, rxlpmen_in, 
  rxprbscntreset_in, rxprbssel_in, rxrate_in, rxusrclk_in, rxusrclk2_in, txdiffctrl_in, 
  txheader_in, txinhibit_in, txpostcursor_in, txprbsforceerr_in, txprbssel_in, 
  txprecursor_in, txsequence_in, txusrclk_in, txusrclk2_in, drpdo_out, drprdy_out, 
  gtpowergood_out, gtytxn_out, gtytxp_out, rxdata_out, rxdatavalid_out, rxheader_out, 
  rxheadervalid_out, rxoutclk_out, rxpmaresetdone_out, rxprbserr_out, rxprbslocked_out, 
  rxstartofseq_out, txoutclk_out, txpmaresetdone_out, txresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[63:0],gtwiz_userdata_rx_out[63:0],gtrefclk00_in[0:0],qpll0lockdetclk_in[0:0],qpll0locken_in[0:0],qpll0fbclklost_out[0:0],qpll0lock_out[0:0],qpll0outclk_out[0:0],qpll0outrefclk_out[0:0],qpll0refclklost_out[0:0],drpaddr_in[9:0],drpclk_in[0:0],drpdi_in[15:0],drpen_in[0:0],drpwe_in[0:0],eyescanreset_in[0:0],eyescantrigger_in[0:0],gtyrxn_in[0:0],gtyrxp_in[0:0],loopback_in[2:0],rxgearboxslip_in[0:0],rxlpmen_in[0:0],rxprbscntreset_in[0:0],rxprbssel_in[3:0],rxrate_in[2:0],rxusrclk_in[0:0],rxusrclk2_in[0:0],txdiffctrl_in[4:0],txheader_in[5:0],txinhibit_in[0:0],txpostcursor_in[4:0],txprbsforceerr_in[0:0],txprbssel_in[3:0],txprecursor_in[4:0],txsequence_in[6:0],txusrclk_in[0:0],txusrclk2_in[0:0],drpdo_out[15:0],drprdy_out[0:0],gtpowergood_out[0:0],gtytxn_out[0:0],gtytxp_out[0:0],rxdata_out[127:0],rxdatavalid_out[1:0],rxheader_out[5:0],rxheadervalid_out[1:0],rxoutclk_out[0:0],rxpmaresetdone_out[0:0],rxprbserr_out[0:0],rxprbslocked_out[0:0],rxstartofseq_out[1:0],txoutclk_out[0:0],txpmaresetdone_out[0:0],txresetdone_out[0:0]" */;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [63:0]gtwiz_userdata_tx_in;
  output [63:0]gtwiz_userdata_rx_out;
  input [0:0]gtrefclk00_in;
  input [0:0]qpll0lockdetclk_in;
  input [0:0]qpll0locken_in;
  output [0:0]qpll0fbclklost_out;
  output [0:0]qpll0lock_out;
  output [0:0]qpll0outclk_out;
  output [0:0]qpll0outrefclk_out;
  output [0:0]qpll0refclklost_out;
  input [9:0]drpaddr_in;
  input [0:0]drpclk_in;
  input [15:0]drpdi_in;
  input [0:0]drpen_in;
  input [0:0]drpwe_in;
  input [0:0]eyescanreset_in;
  input [0:0]eyescantrigger_in;
  input [0:0]gtyrxn_in;
  input [0:0]gtyrxp_in;
  input [2:0]loopback_in;
  input [0:0]rxgearboxslip_in;
  input [0:0]rxlpmen_in;
  input [0:0]rxprbscntreset_in;
  input [3:0]rxprbssel_in;
  input [2:0]rxrate_in;
  input [0:0]rxusrclk_in;
  input [0:0]rxusrclk2_in;
  input [4:0]txdiffctrl_in;
  input [5:0]txheader_in;
  input [0:0]txinhibit_in;
  input [4:0]txpostcursor_in;
  input [0:0]txprbsforceerr_in;
  input [3:0]txprbssel_in;
  input [4:0]txprecursor_in;
  input [6:0]txsequence_in;
  input [0:0]txusrclk_in;
  input [0:0]txusrclk2_in;
  output [15:0]drpdo_out;
  output [0:0]drprdy_out;
  output [0:0]gtpowergood_out;
  output [0:0]gtytxn_out;
  output [0:0]gtytxp_out;
  output [127:0]rxdata_out;
  output [1:0]rxdatavalid_out;
  output [5:0]rxheader_out;
  output [1:0]rxheadervalid_out;
  output [0:0]rxoutclk_out;
  output [0:0]rxpmaresetdone_out;
  output [0:0]rxprbserr_out;
  output [0:0]rxprbslocked_out;
  output [1:0]rxstartofseq_out;
  output [0:0]txoutclk_out;
  output [0:0]txpmaresetdone_out;
  output [0:0]txresetdone_out;
endmodule
