library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axiRegPkg.all;
use work.types.all;
use work.VIRTEX_TCDS_Ctrl.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity top is
  port (
    -- clocks
    p_clk_200a : in  std_logic;
    n_clk_200a : in  std_logic;                -- 200 MHz system clock
    p_clk_200b : in  std_logic;
    n_clk_200b : in  std_logic;

    -- Zynq AXI Chip2Chip
    n_util_clk_chan0 : in std_logic;
    p_util_clk_chan0 : in std_logic;
    n_mgt_z2v        : in  std_logic_vector(1 downto 1);
    p_mgt_z2v        : in  std_logic_vector(1 downto 1);
    n_mgt_v2z        : out std_logic_vector(1 downto 1);
    p_mgt_v2z        : out std_logic_vector(1 downto 1);

    v_fpga_i2c_scl   : inout std_logic;
    v_fpga_i2c_sda   : inout std_logic;

    p_clk0_chan0     : in std_logic;
    n_clk0_chan0     : in std_logic;
    p_clk1_chan0     : in std_logic;
    n_clk1_chan0     : in std_logic;
    p_ff1_xmit0      : out std_logic;
    n_ff1_xmit0      : out std_logic;
    p_ff1_recv0      : in  std_logic;
    n_ff1_recv0      : in  std_logic;
                                    
   p_clk0_chan3     : in std_logic;
   n_clk0_chan3     : in std_logic;
   p_clk1_chan3     : in std_logic;
   n_clk1_chan3     : in std_logic;
   
   p_clk0_chan7     : in std_logic;
   n_clk0_chan7     : in std_logic;
   p_clk1_chan7     : in std_logic;
   n_clk1_chan7     : in std_logic;

   p_ff12_xmit      : out std_logic_vector(11 downto 0);
   n_ff12_xmit      : out std_logic_vector(11 downto 0);
   p_ff12_recv      : in  std_logic_vector(11 downto 0);
   n_ff12_recv      : in  std_logic_vector(11 downto 0);
   p_ff11_xmit      : out std_logic_vector(11 downto 0);
   n_ff11_xmit      : out std_logic_vector(11 downto 0);
   p_ff11_recv      : in  std_logic_vector(11 downto 0);
   n_ff11_recv      : in  std_logic_vector(11 downto 0);
                               
    -- tri-color LED
    led_red : out std_logic;
    led_green : out std_logic;
    led_blue : out std_logic       -- assert to turn on
    );    
end entity top;

architecture structure of top is

  signal clk_200_raw     : std_logic;
  signal clk_200         : std_logic;
  signal clk_50          : std_logic;
  signal reset           : std_logic;
  signal counter         : unsigned(31 downto 0);
  signal locked_clk200   : std_logic;

  signal led_blue_local  : std_logic;
  signal led_red_local   : std_logic;
  signal led_green_local : std_logic;

  constant localAXISlaves    : integer := 4;
  signal local_AXI_ReadMOSI  :  AXIReadMOSI_array_t(0 to localAXISlaves-1) := (others => DefaultAXIReadMOSI);
  signal local_AXI_ReadMISO  :  AXIReadMISO_array_t(0 to localAXISlaves-1) := (others => DefaultAXIReadMISO);
  signal local_AXI_WriteMOSI : AXIWriteMOSI_array_t(0 to localAXISlaves-1) := (others => DefaultAXIWriteMOSI);
  signal local_AXI_WriteMISO : AXIWriteMISO_array_t(0 to localAXISlaves-1) := (others => DefaultAXIWriteMISO);
  signal AXI_CLK             : std_logic;
  signal AXI_RST_N           : std_logic;

  signal debug : std_logic_vector(2 downto 0);

  signal myreg1_test_vector : std_logic_vector(31 downto 0);
  signal myreg2_test_vector : std_logic_vector(31 downto 0);

  signal heater_output : std_logic_vector(31 downto 0);
  
  
begin  -- architecture structure

  --Clocking
  reset <= not locked_clk200;
  Local_Clocking_1: entity work.Local_Clocking
    port map (
      clk_200   => clk_200,
      clk_50    => clk_50,
      clk_axi   => AXI_CLK,
      reset     => '0',
      locked    => locked_clk200,
      clk_in1_p => p_clk_200b,
      clk_in1_n => n_clk_200b);

  led_blue  <= led_blue_local;
  led_red   <= led_red_local;
  led_green <= led_green_local;
  myreg1_test_vector <= heater_output;
  
  RGB_pwm_1: entity work.RGB_pwm
    generic map (
      CLKFREQ => 200000000,
      RGBFREQ => 1000)
    port map (
      clk        => clk_200,
      redcount   => myreg1_test_vector( 7 downto  0),
      greencount => myreg1_test_vector(15 downto  8),
      bluecount  => myreg1_test_vector(23 downto 16),
      LEDred     => led_red_local,
      LEDgreen   => led_green_local,
      LEDblue    => led_blue_local);

  c2csslave_wrapper_1: entity work.c2cslave_wrapper
    port map (
      AXI_CLK                  => AXI_CLK,
      AXI_RST_N(0)             => AXI_RST_N,
      C2CLink_phy_Rx_rxn       => n_mgt_z2v,
      C2CLink_phy_Rx_rxp       => p_mgt_z2v,
      C2CLink_phy_Tx_txn       => n_mgt_v2z,
      C2CLink_phy_Tx_txp       => p_mgt_v2z,
      C2CLink_phy_refclk_clk_n => n_util_clk_chan0,
      C2CLink_phy_refclk_clk_p => p_util_clk_chan0,
      clk50Mhz                 => clk_50,
      VIRTEX_TCDS_DRP_araddr                     => local_AXI_ReadMOSI(0).address,
      VIRTEX_TCDS_DRP_arprot                     => local_AXI_ReadMOSI(0).protection_type,
      VIRTEX_TCDS_DRP_arready(0)                 => local_AXI_ReadMISO(0).ready_for_address,
      VIRTEX_TCDS_DRP_arvalid(0)                 => local_AXI_ReadMOSI(0).address_valid,
      VIRTEX_TCDS_DRP_awaddr                     => local_AXI_WriteMOSI(0).address,
      VIRTEX_TCDS_DRP_awprot                     => local_AXI_WriteMOSI(0).protection_type,
      VIRTEX_TCDS_DRP_awready(0)                 => local_AXI_WriteMISO(0).ready_for_address,
      VIRTEX_TCDS_DRP_awvalid(0)                 => local_AXI_WriteMOSI(0).address_valid,
      VIRTEX_TCDS_DRP_bready(0)                  => local_AXI_WriteMOSI(0).ready_for_response,
      VIRTEX_TCDS_DRP_bresp                      => local_AXI_WriteMISO(0).response,
      VIRTEX_TCDS_DRP_bvalid(0)                  => local_AXI_WriteMISO(0).response_valid,
      VIRTEX_TCDS_DRP_rdata                      => local_AXI_ReadMISO(0).data,
      VIRTEX_TCDS_DRP_rready(0)                  => local_AXI_ReadMOSI(0).ready_for_data,
      VIRTEX_TCDS_DRP_rresp                      => local_AXI_ReadMISO(0).response,
      VIRTEX_TCDS_DRP_rvalid(0)                  => local_AXI_ReadMISO(0).data_valid,
      VIRTEX_TCDS_DRP_wdata                      => local_AXI_WriteMOSI(0).data,
      VIRTEX_TCDS_DRP_wready(0)                  => local_AXI_WriteMISO(0).ready_for_data,
      VIRTEX_TCDS_DRP_wstrb                      => local_AXI_WriteMOSI(0).data_write_strobe,
      VIRTEX_TCDS_DRP_wvalid(0)                  => local_AXI_WriteMOSI(0).data_valid,

      VIRTEX_TCDS_araddr                         => local_AXI_ReadMOSI(1).address,
      VIRTEX_TCDS_arprot                         => local_AXI_ReadMOSI(1).protection_type,
      VIRTEX_TCDS_arready(0)                     => local_AXI_ReadMISO(1).ready_for_address,
      VIRTEX_TCDS_arvalid(0)                     => local_AXI_ReadMOSI(1).address_valid,
      VIRTEX_TCDS_awaddr                         => local_AXI_WriteMOSI(1).address,
      VIRTEX_TCDS_awprot                         => local_AXI_WriteMOSI(1).protection_type,
      VIRTEX_TCDS_awready(0)                     => local_AXI_WriteMISO(1).ready_for_address,
      VIRTEX_TCDS_awvalid(0)                     => local_AXI_WriteMOSI(1).address_valid,
      VIRTEX_TCDS_bready(0)                      => local_AXI_WriteMOSI(1).ready_for_response,
      VIRTEX_TCDS_bresp                          => local_AXI_WriteMISO(1).response,
      VIRTEX_TCDS_bvalid(0)                      => local_AXI_WriteMISO(1).response_valid,
      VIRTEX_TCDS_rdata                          => local_AXI_ReadMISO(1).data,
      VIRTEX_TCDS_rready(0)                      => local_AXI_ReadMOSI(1).ready_for_data,
      VIRTEX_TCDS_rresp                          => local_AXI_ReadMISO(1).response,
      VIRTEX_TCDS_rvalid(0)                      => local_AXI_ReadMISO(1).data_valid,
      VIRTEX_TCDS_wdata                          => local_AXI_WriteMOSI(1).data,
      VIRTEX_TCDS_wready(0)                      => local_AXI_WriteMISO(1).ready_for_data,
      VIRTEX_TCDS_wstrb                          => local_AXI_WriteMOSI(1).data_write_strobe,
      VIRTEX_TCDS_wvalid(0)                      => local_AXI_WriteMOSI(1).data_valid,

      CM_V_INFO_araddr            => local_AXI_ReadMOSI(2).address,              
      CM_V_INFO_arprot            => local_AXI_ReadMOSI(2).protection_type,      
      CM_V_INFO_arready(0)           => local_AXI_ReadMISO(2).ready_for_address,    
      CM_V_INFO_arvalid(0)           => local_AXI_ReadMOSI(2).address_valid,        
      CM_V_INFO_awaddr            => local_AXI_WriteMOSI(2).address,             
      CM_V_INFO_awprot            => local_AXI_WriteMOSI(2).protection_type,     
      CM_V_INFO_awready(0)           => local_AXI_WriteMISO(2).ready_for_address,   
      CM_V_INFO_awvalid(0)           => local_AXI_WriteMOSI(2).address_valid,       
      CM_V_INFO_bready(0)            => local_AXI_WriteMOSI(2).ready_for_response,  
      CM_V_INFO_bresp             => local_AXI_WriteMISO(2).response,            
      CM_V_INFO_bvalid(0)            => local_AXI_WriteMISO(2).response_valid,      
      CM_V_INFO_rdata             => local_AXI_ReadMISO(2).data,                 
      CM_V_INFO_rready(0)            => local_AXI_ReadMOSI(2).ready_for_data,       
      CM_V_INFO_rresp             => local_AXI_ReadMISO(2).response,             
      CM_V_INFO_rvalid(0)            => local_AXI_ReadMISO(2).data_valid,           
      CM_V_INFO_wdata             => local_AXI_WriteMOSI(2).data,                
      CM_V_INFO_wready(0)            => local_AXI_WriteMISO(2).ready_for_data,       
      CM_V_INFO_wstrb             => local_AXI_WriteMOSI(2).data_write_strobe,   
      CM_V_INFO_wvalid(0)            => local_AXI_WriteMOSI(2).data_valid,          

      reset_n                  => locked_clk200,--reset,
      C2CLink_aurora_do_cc                => open, 
      C2CLink_axi_c2c_config_error_out    => open, 
      C2CLink_axi_c2c_link_status_out     => open, 
      C2CLink_axi_c2c_multi_bit_error_out => open, 
      C2CLink_phy_gt_pll_lock             => debug(0), 
      C2CLink_phy_hard_err                => open, 
      C2CLink_phy_lane_up                 => debug(1 downto 1), 
      C2CLink_phy_link_reset_out          => open, 
      C2CLink_phy_mmcm_not_locked_out     => debug(2), 
      C2CLink_phy_power_down              => '0', 
      C2CLink_phy_soft_err                => open,
      VIRTEX_SYS_MGMT_sda                 => v_fpga_i2c_sda,
      VIRTEX_SYS_MGMT_scl                 => v_fpga_i2c_scl,
      IPBUS_VIRTEX_araddr            => local_AXI_ReadMOSI(3).address,              
      IPBUS_VIRTEX_arprot            => local_AXI_ReadMOSI(3).protection_type,      
      IPBUS_VIRTEX_arready(0)        => local_AXI_ReadMISO(3).ready_for_address,    
      IPBUS_VIRTEX_arvalid(0)        => local_AXI_ReadMOSI(3).address_valid,        
      IPBUS_VIRTEX_awaddr            => local_AXI_WriteMOSI(3).address,             
      IPBUS_VIRTEX_awprot            => local_AXI_WriteMOSI(3).protection_type,     
      IPBUS_VIRTEX_awready(0)           => local_AXI_WriteMISO(3).ready_for_address,   
      IPBUS_VIRTEX_awvalid(0)           => local_AXI_WriteMOSI(3).address_valid,       
      IPBUS_VIRTEX_bready(0)            => local_AXI_WriteMOSI(3).ready_for_response,  
      IPBUS_VIRTEX_bresp             => local_AXI_WriteMISO(3).response,            
      IPBUS_VIRTEX_bvalid(0)            => local_AXI_WriteMISO(3).response_valid,      
      IPBUS_VIRTEX_rdata             => local_AXI_ReadMISO(3).data,                 
      IPBUS_VIRTEX_rready(0)            => local_AXI_ReadMOSI(3).ready_for_data,       
      IPBUS_VIRTEX_rresp             => local_AXI_ReadMISO(3).response,             
      IPBUS_VIRTEX_rvalid(0)            => local_AXI_ReadMISO(3).data_valid,           
      IPBUS_VIRTEX_wdata             => local_AXI_WriteMOSI(3).data,                
      IPBUS_VIRTEX_wready(0)            => local_AXI_WriteMISO(3).ready_for_data,       
      IPBUS_VIRTEX_wstrb             => local_AXI_WriteMOSI(3).data_write_strobe,   
      IPBUS_VIRTEX_wvalid(0)            => local_AXI_WriteMOSI(3).data_valid

);

  TCDS_1: entity work.TCDS
    port map (
      clk_axi              => AXI_CLK,
      clk_200              => clk_200,
      reset_axi_n          => AXI_RST_N,
      readMOSI             => local_AXI_readMOSI(1),
      readMISO             => local_AXI_readMISO(1),
      writeMOSI            => local_AXI_writeMOSI(1),
      writeMISO            => local_AXI_writeMISO(1),
      DRP_readMOSI         => local_AXI_readMOSI(0),
      DRP_readMISO         => local_AXI_readMISO(0),
      DRP_writeMOSI        => local_AXI_writeMOSI(0),
      DRP_writeMISO        => local_AXI_writeMISO(0),
      refclk0_p => p_clk0_chan0,
      refclk0_n => n_clk0_chan0,
      refclk1_p => p_clk1_chan0,
      refclk1_n => n_clk1_chan0,
      tx_p     => p_ff1_xmit0,
      tx_n     => n_ff1_xmit0,
      rx_p     => p_ff1_recv0,
      rx_n     => n_ff1_recv0,
      heater_output => heater_output,
      TxRx_clk_sel => '0');
  
  
  CM_V_info_1: entity work.FW_info
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(2),
      readMISO    => local_AXI_ReadMISO(2),
      writeMOSI   => local_AXI_WriteMOSI(2),
      writeMISO   => local_AXI_WriteMISO(2));


  IBERT: entity work.example_ibert_ultrascale_gty_0
    port map (
      gty_sysclkp_i => p_clk_200a,
      gty_sysclkn_i => n_clk_200a,
       
      -- quad 131, 132, 133
      gty_rxn_i(0) => n_ff12_recv(11),
      gty_rxn_i(1) => n_ff12_recv(10),
      gty_rxn_i(2) => n_ff12_recv(9),
      gty_rxn_i(3) => n_ff12_recv(8),
      gty_rxn_i(4) => n_ff12_recv(7),
      gty_rxn_i(5) => n_ff12_recv(6),
      gty_rxn_i(6) => n_ff12_recv(5),
      gty_rxn_i(7) => n_ff12_recv(4),
      gty_rxn_i(8) => n_ff12_recv(3),
      gty_rxn_i(9) => n_ff12_recv(2),
      gty_rxn_i(10) => n_ff12_recv(1),
      gty_rxn_i(11) => n_ff12_recv(0),
      
      -- quad 231, 232, 233
      gty_rxn_i(12) => n_ff11_recv(0),
      gty_rxn_i(13) => n_ff11_recv(1),
      gty_rxn_i(14) => n_ff11_recv(2),
      gty_rxn_i(15) => n_ff11_recv(3),
      gty_rxn_i(16) => n_ff11_recv(4),
      gty_rxn_i(17) => n_ff11_recv(5),
      gty_rxn_i(18) => n_ff11_recv(6),
      gty_rxn_i(19) => n_ff11_recv(7),
      gty_rxn_i(20) => n_ff11_recv(8),
      gty_rxn_i(21) => n_ff11_recv(9),
      gty_rxn_i(22) => n_ff11_recv(10),
      gty_rxn_i(23) => n_ff11_recv(11),
      
      -- quad 131, 132, 133
      gty_rxp_i(0) => p_ff12_recv(11),
      gty_rxp_i(1) => p_ff12_recv(10),
      gty_rxp_i(2) => p_ff12_recv(9),
      gty_rxp_i(3) => p_ff12_recv(8),
      gty_rxp_i(4) => p_ff12_recv(7),
      gty_rxp_i(5) => p_ff12_recv(6),
      gty_rxp_i(6) => p_ff12_recv(5),
      gty_rxp_i(7) => p_ff12_recv(4),
      gty_rxp_i(8) => p_ff12_recv(3),
      gty_rxp_i(9) => p_ff12_recv(2),
      gty_rxp_i(10) => p_ff12_recv(1),
      gty_rxp_i(11) => p_ff12_recv(0),

      -- quad 231, 232, 233
      gty_rxp_i(12) => p_ff11_recv(0),
      gty_rxp_i(13) => p_ff11_recv(1),
      gty_rxp_i(14) => p_ff11_recv(2),
      gty_rxp_i(15) => p_ff11_recv(3),
      gty_rxp_i(16) => p_ff11_recv(4),
      gty_rxp_i(17) => p_ff11_recv(5),
      gty_rxp_i(18) => p_ff11_recv(6),
      gty_rxp_i(19) => p_ff11_recv(7),
      gty_rxp_i(20) => p_ff11_recv(8),
      gty_rxp_i(21) => p_ff11_recv(9),
      gty_rxp_i(22) => p_ff11_recv(10),
      gty_rxp_i(23) => p_ff11_recv(11),
      
      gty_refclk0p_i(0) => p_clk0_chan7,
      gty_refclk0p_i(1) => p_clk0_chan3,

      gty_refclk0n_i(0) => n_clk0_chan7,
      gty_refclk0n_i(1) => n_clk0_chan3,

      gty_refclk1p_i(0) => p_clk1_chan7,
      gty_refclk1p_i(1) => p_clk1_chan3,

      gty_refclk1n_i(0) => n_clk1_chan7,
      gty_refclk1n_i(1) => n_clk1_chan3,

      -- quad 131, 132, 133
      gty_txn_o(0) => n_ff12_xmit(11),
      gty_txn_o(1) => n_ff12_xmit(10),
      gty_txn_o(2) => n_ff12_xmit(9),
      gty_txn_o(3) => n_ff12_xmit(8),
      gty_txn_o(4) => n_ff12_xmit(7),
      gty_txn_o(5) => n_ff12_xmit(6),
      gty_txn_o(6) => n_ff12_xmit(5),
      gty_txn_o(7) => n_ff12_xmit(4),
      gty_txn_o(8) => n_ff12_xmit(3),
      gty_txn_o(9) => n_ff12_xmit(2),
      gty_txn_o(10) => n_ff12_xmit(1),
      gty_txn_o(11) => n_ff12_xmit(0),

      -- quad 231, 232, 233
      gty_txn_o(12) => n_ff11_xmit(0),
      gty_txn_o(13) => n_ff11_xmit(1),
      gty_txn_o(14) => n_ff11_xmit(2),
      gty_txn_o(15) => n_ff11_xmit(3),
      gty_txn_o(16) => n_ff11_xmit(4),
      gty_txn_o(17) => n_ff11_xmit(5),
      gty_txn_o(18) => n_ff11_xmit(6),
      gty_txn_o(19) => n_ff11_xmit(7),
      gty_txn_o(20) => n_ff11_xmit(8),
      gty_txn_o(21) => n_ff11_xmit(9),
      gty_txn_o(22) => n_ff11_xmit(10),
      gty_txn_o(23) => n_ff11_xmit(11),

      -- quad 131, 132, 133
      gty_txp_o(0) => p_ff12_xmit(11),
      gty_txp_o(1) => p_ff12_xmit(10),
      gty_txp_o(2) => p_ff12_xmit(9),
      gty_txp_o(3) => p_ff12_xmit(8),
      gty_txp_o(4) => p_ff12_xmit(7),
      gty_txp_o(5) => p_ff12_xmit(6),
      gty_txp_o(6) => p_ff12_xmit(5),
      gty_txp_o(7) => p_ff12_xmit(4),
      gty_txp_o(8) => p_ff12_xmit(3),
      gty_txp_o(9) => p_ff12_xmit(2),
      gty_txp_o(10) => p_ff12_xmit(1),
      gty_txp_o(11) => p_ff12_xmit(0),
      
      -- quad 231, 232, 233
      gty_txp_o(12) => p_ff11_xmit(0),
      gty_txp_o(13) => p_ff11_xmit(1),
      gty_txp_o(14) => p_ff11_xmit(2),
      gty_txp_o(15) => p_ff11_xmit(3),
      gty_txp_o(16) => p_ff11_xmit(4),
      gty_txp_o(17) => p_ff11_xmit(5),
      gty_txp_o(18) => p_ff11_xmit(6),
      gty_txp_o(19) => p_ff11_xmit(7),
      gty_txp_o(20) => p_ff11_xmit(8),
      gty_txp_o(21) => p_ff11_xmit(9),
      gty_txp_o(22) => p_ff11_xmit(10),
      gty_txp_o(23) => p_ff11_xmit(11)
      );
end architecture structure;
