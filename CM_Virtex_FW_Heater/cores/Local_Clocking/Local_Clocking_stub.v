// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sat Jun 20 19:47:31 2020
// Host        : lnx4108.classe.cornell.edu running 64-bit Scientific Linux release 7.7 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /mnt/scratch/rzou/CM_Virtex_FW_Heater_v1/cores/Local_Clocking/Local_Clocking_stub.v
// Design      : Local_Clocking
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu7p-flvb2104-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Local_Clocking(clk_200, clk_50, clk_axi, reset, locked, clk_in1_p, 
  clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_200,clk_50,clk_axi,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_200;
  output clk_50;
  output clk_axi;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
