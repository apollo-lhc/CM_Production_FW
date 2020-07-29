-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sat Jun 20 19:47:31 2020
-- Host        : lnx4108.classe.cornell.edu running 64-bit Scientific Linux release 7.7 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/scratch/rzou/CM_Virtex_FW_Heater_v1/cores/Local_Clocking/Local_Clocking_stub.vhdl
-- Design      : Local_Clocking
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu7p-flvb2104-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Local_Clocking is
  Port ( 
    clk_200 : out STD_LOGIC;
    clk_50 : out STD_LOGIC;
    clk_axi : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end Local_Clocking;

architecture stub of Local_Clocking is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_200,clk_50,clk_axi,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
