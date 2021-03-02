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

    --n_atca_ttc_in   : in std_logic;
    --p_atca_ttc_in   : in std_logic;
    --n_atca_tts_out  : out std_logic;
    --p_atca_tts_out  : out std_logic;

    -- quad 225 227 230 232
    p_clk0_chan0     : in std_logic;
    n_clk0_chan0     : in std_logic;
    --p_clk1_chan0     : in std_logic;
    --n_clk1_chan0     : in std_logic;
    p_clk0_chan1     : in std_logic;
    n_clk0_chan1     : in std_logic;
    p_clk0_chan2     : in std_logic;
    n_clk0_chan2     : in std_logic;
    p_clk0_chan3     : in std_logic;
    n_clk0_chan3     : in std_logic;
    
    --p_clk1_chan1     : in std_logic;
    --n_clk1_chan1     : in std_logic;
    --p_clk1_chan2     : in std_logic;
    --n_clk1_chan2     : in std_logic;
    --p_clk1_chan3     : in std_logic;
    --n_clk1_chan3     : in std_logic;
    
    -- quad 125,126,128,130,132
--    p_util_clk_chan1 : in std_logic;
--    n_util_clk_chan1 : in std_logic;
    p_clk0_chan4     : in std_logic;
    n_clk0_chan4     : in std_logic;
    p_clk0_chan5     : in std_logic;
    n_clk0_chan5     : in std_logic;
    p_clk0_chan6     : in std_logic;
    n_clk0_chan6     : in std_logic;
    p_clk0_chan7     : in std_logic;
    n_clk0_chan7     : in std_logic;
    
    --p_clk1_chan4     : in std_logic;
    --n_clk1_chan4     : in std_logic;
    --p_clk1_chan5     : in std_logic;
    --n_clk1_chan5     : in std_logic;
    --p_clk1_chan6     : in std_logic;
    --n_clk1_chan6     : in std_logic;
    --p_clk1_chan7     : in std_logic;
    --n_clk1_chan7     : in std_logic;
    
    p_unused_xmit   : out std_logic_vector(3 downto 0);
    n_unused_xmit   : out std_logic_vector(3 downto 0);
    p_unused_recv   : in std_logic_vector(3 downto 0);
    n_unused_recv   : in std_logic_vector(3 downto 0);

    -- quad 125 126 127 128 129 130 131 132 133
    --p_mgt_k2v       : in  std_logic_vector(3 downto 0);
    --n_mgt_k2v       : in  std_logic_vector(3 downto 0);
    --p_mgt_v2k      : out std_logic_vector(3 downto 0);
    --n_mgt_v2k      : out std_logic_vector(3 downto 0);
    p_ff7_xmit      : out std_logic_vector(3 downto 0);
    n_ff7_xmit      : out std_logic_vector(3 downto 0);
    p_ff7_recv      : in  std_logic_vector(3 downto 0);
    n_ff7_recv      : in  std_logic_vector(3 downto 0);
    p_ff8_xmit      : out std_logic_vector(3 downto 0);
    n_ff8_xmit      : out std_logic_vector(3 downto 0);
    p_ff8_recv      : in  std_logic_vector(3 downto 0);
    n_ff8_recv      : in  std_logic_vector(3 downto 0);
    p_ff9_xmit      : out std_logic_vector(3 downto 0);
    n_ff9_xmit      : out std_logic_vector(3 downto 0);
    p_ff9_recv      : in  std_logic_vector(3 downto 0);
    n_ff9_recv      : in  std_logic_vector(3 downto 0);
    p_ff10_xmit      : out std_logic_vector(3 downto 0);
    n_ff10_xmit      : out std_logic_vector(3 downto 0);
    p_ff10_recv      : in  std_logic_vector(3 downto 0);
    n_ff10_recv      : in  std_logic_vector(3 downto 0);
    p_ff12_xmit      : out std_logic_vector(11 downto 0);
    n_ff12_xmit      : out std_logic_vector(11 downto 0);
    p_ff12_recv      : in  std_logic_vector(11 downto 0);
    n_ff12_recv      : in  std_logic_vector(11 downto 0);
    
    -- quad 225 226 227 228 229 230 231 232 233
    p_ff2_xmit      : out std_logic_vector(3 downto 0);
    n_ff2_xmit      : out std_logic_vector(3 downto 0);
    p_ff2_recv      : in  std_logic_vector(3 downto 0);
    n_ff2_recv      : in  std_logic_vector(3 downto 0);
                                                                                                                    
    p_ff3_xmit      : out std_logic_vector(3 downto 0);
    n_ff3_xmit      : out std_logic_vector(3 downto 0);
    p_ff3_recv      : in  std_logic_vector(3 downto 0);
    n_ff3_recv      : in  std_logic_vector(3 downto 0);
    p_ff4_xmit      : out std_logic_vector(3 downto 0);
    n_ff4_xmit      : out std_logic_vector(3 downto 0);
    p_ff4_recv      : in  std_logic_vector(3 downto 0);
    n_ff4_recv      : in  std_logic_vector(3 downto 0);
    p_ff5_xmit      : out std_logic_vector(3 downto 0);
    n_ff5_xmit      : out std_logic_vector(3 downto 0);
    p_ff5_recv      : in  std_logic_vector(3 downto 0);
    n_ff5_recv      : in  std_logic_vector(3 downto 0);
    p_ff6_xmit      : out std_logic_vector(3 downto 0);
    n_ff6_xmit      : out std_logic_vector(3 downto 0);
    p_ff6_recv      : in  std_logic_vector(3 downto 0);
    n_ff6_recv      : in  std_logic_vector(3 downto 0);
    p_ff11_xmit      : out std_logic_vector(11 downto 0);
    n_ff11_xmit      : out std_logic_vector(11 downto 0);
    p_ff11_recv      : in  std_logic_vector(11 downto 0);
    n_ff11_recv      : in  std_logic_vector(11 downto 0);
                                                                                    
    p_ff1_xmit      : out std_logic_vector(3 downto 0);
    n_ff1_xmit      : out std_logic_vector(3 downto 0);
    p_ff1_recv      : in  std_logic_vector(3 downto 0);
    n_ff1_recv      : in  std_logic_vector(3 downto 0);
                                    
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
--      refclk0_p => p_util_clk_chan0,
--      refclk0_n => n_util_clk_chan0,
----      refclk1_p => p_clk1_chan0,
----      refclk1_n => n_clk1_chan0,
--      tx_p     => p_atca_tts_out,
--      tx_n     => n_atca_tts_out,
--      rx_p     => p_atca_ttc_in,
--      rx_n     => n_atca_ttc_in,
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

      -- quad 125
      --gty_rxn_i(0) => n_mgt_k2v(0),
      --gty_rxn_i(1) => n_mgt_k2v(1),
      --gty_rxn_i(2) => n_mgt_k2v(2),
      --gty_rxn_i(3) => n_mgt_k2v(3),
      
     -- quad 126
      gty_rxn_i(4-4) => n_ff7_recv(0),
      gty_rxn_i(5-4) => n_ff7_recv(1),
      gty_rxn_i(6-4) => n_ff7_recv(2),
      gty_rxn_i(7-4) => n_ff7_recv(3),
      -- quad 127
      gty_rxn_i(8-4) => n_ff8_recv(0),
      gty_rxn_i(9-4) => n_ff8_recv(1),
      gty_rxn_i(10-4) => n_ff8_recv(2),
      gty_rxn_i(11-4) => n_ff8_recv(3),
      -- quad 128
      gty_rxn_i(12-4) => n_ff9_recv(0),
      gty_rxn_i(13-4) => n_ff9_recv(1),
      gty_rxn_i(14-4) => n_ff9_recv(2),
      gty_rxn_i(15-4) => n_ff9_recv(3),
      -- quad 129
      gty_rxn_i(16-4) => n_unused_recv(0),
      gty_rxn_i(17-4) => n_unused_recv(1),
      gty_rxn_i(18-4) => n_unused_recv(2),
      gty_rxn_i(19-4) => n_unused_recv(3),
      -- quad 130
      gty_rxn_i(20-4) => n_ff10_recv(0),
      gty_rxn_i(21-4) => n_ff10_recv(1),
      gty_rxn_i(22-4) => n_ff10_recv(2),
      gty_rxn_i(23-4) => n_ff10_recv(3),
      
      -- quad 131, 132, 133
      gty_rxn_i(24-4) => n_ff12_recv(11),
      gty_rxn_i(25-4) => n_ff12_recv(10),
      gty_rxn_i(26-4) => n_ff12_recv(9),
      gty_rxn_i(27-4) => n_ff12_recv(8),
      gty_rxn_i(28-4) => n_ff12_recv(7),
      gty_rxn_i(29-4) => n_ff12_recv(6),
      gty_rxn_i(30-4) => n_ff12_recv(5),
      gty_rxn_i(31-4) => n_ff12_recv(4),
      gty_rxn_i(32-4) => n_ff12_recv(3),
      gty_rxn_i(33-4) => n_ff12_recv(2),
      gty_rxn_i(34-4) => n_ff12_recv(1),
      gty_rxn_i(35-4) => n_ff12_recv(0),
      
      -- quad 225
      gty_rxn_i(36-4) => n_ff1_recv(3),
      gty_rxn_i(37-4) => n_ff1_recv(2),
      gty_rxn_i(38-4) => n_ff1_recv(1),
      gty_rxn_i(39-4) => n_ff1_recv(0),
      -- quad 226
      gty_rxn_i(40-4) => n_ff2_recv(3),
      gty_rxn_i(41-4) => n_ff2_recv(2),
      gty_rxn_i(42-4) => n_ff2_recv(1),
      gty_rxn_i(43-4) => n_ff2_recv(0),
      -- quad 227
      gty_rxn_i(44-4) => n_ff3_recv(3),
      gty_rxn_i(45-4) => n_ff3_recv(2),
      gty_rxn_i(46-4) => n_ff3_recv(1),
      gty_rxn_i(47-4) => n_ff3_recv(0),
      -- quad 228
      gty_rxn_i(48-4) => n_ff4_recv(3),
      gty_rxn_i(49-4) => n_ff4_recv(2),
      gty_rxn_i(50-4) => n_ff4_recv(1),
      gty_rxn_i(51-4) => n_ff4_recv(0),
      -- quad 229
      gty_rxn_i(52-4) => n_ff5_recv(3),
      gty_rxn_i(53-4) => n_ff5_recv(2),
      gty_rxn_i(54-4) => n_ff5_recv(1),
      gty_rxn_i(55-4) => n_ff5_recv(0),
      -- quad 230
      gty_rxn_i(56-4) => n_ff6_recv(3),
      gty_rxn_i(57-4) => n_ff6_recv(2),
      gty_rxn_i(58-4) => n_ff6_recv(1),
      gty_rxn_i(59-4) => n_ff6_recv(0),
      
      -- quad 231, 232, 233
      gty_rxn_i(60-4) => n_ff11_recv(0),
      gty_rxn_i(61-4) => n_ff11_recv(1),
      gty_rxn_i(62-4) => n_ff11_recv(2),
      gty_rxn_i(63-4) => n_ff11_recv(3),
      gty_rxn_i(64-4) => n_ff11_recv(4),
      gty_rxn_i(65-4) => n_ff11_recv(5),
      gty_rxn_i(66-4) => n_ff11_recv(6),
      gty_rxn_i(67-4) => n_ff11_recv(7),
      gty_rxn_i(68-4) => n_ff11_recv(8),
      gty_rxn_i(69-4) => n_ff11_recv(9),
      gty_rxn_i(70-4) => n_ff11_recv(10),
      gty_rxn_i(71-4) => n_ff11_recv(11),
      
     -- quad 125
      --gty_rxp_i(0-4) => p_mgt_k2v(0),
      --gty_rxp_i(1-4) => p_mgt_k2v(1),
      --gty_rxp_i(2-4) => p_mgt_k2v(2),
      --gty_rxp_i(3-4) => p_mgt_k2v(3),
      
      -- quad 126
      gty_rxp_i(4-4) => p_ff7_recv(0),
      gty_rxp_i(5-4) => p_ff7_recv(1),
      gty_rxp_i(6-4) => p_ff7_recv(2),
      gty_rxp_i(7-4) => p_ff7_recv(3),
      -- quad 127
      gty_rxp_i(8-4) => p_ff8_recv(0),
      gty_rxp_i(9-4) => p_ff8_recv(1),
      gty_rxp_i(10-4) => p_ff8_recv(2),
      gty_rxp_i(11-4) => p_ff8_recv(3),
      -- quad 128
      gty_rxp_i(12-4) => p_ff9_recv(0),
      gty_rxp_i(13-4) => p_ff9_recv(1),
      gty_rxp_i(14-4) => p_ff9_recv(2),
      gty_rxp_i(15-4) => p_ff9_recv(3),
      -- quad 129
      gty_rxp_i(16-4) => p_unused_recv(0),
      gty_rxp_i(17-4) => p_unused_recv(1),
      gty_rxp_i(18-4) => p_unused_recv(2),
      gty_rxp_i(19-4) => p_unused_recv(3),
      -- quad 130
      gty_rxp_i(20-4) => p_ff10_recv(0),
      gty_rxp_i(21-4) => p_ff10_recv(1),
      gty_rxp_i(22-4) => p_ff10_recv(2),
      gty_rxp_i(23-4) => p_ff10_recv(3),
      
      -- quad 131, 132, 133
      gty_rxp_i(24-4) => p_ff12_recv(11),
      gty_rxp_i(25-4) => p_ff12_recv(10),
      gty_rxp_i(26-4) => p_ff12_recv(9),
      gty_rxp_i(27-4) => p_ff12_recv(8),
      gty_rxp_i(28-4) => p_ff12_recv(7),
      gty_rxp_i(29-4) => p_ff12_recv(6),
      gty_rxp_i(30-4) => p_ff12_recv(5),
      gty_rxp_i(31-4) => p_ff12_recv(4),
      gty_rxp_i(32-4) => p_ff12_recv(3),
      gty_rxp_i(33-4) => p_ff12_recv(2),
      gty_rxp_i(34-4) => p_ff12_recv(1),
      gty_rxp_i(35-4) => p_ff12_recv(0),

      -- quad 225
      gty_rxp_i(36-4) => p_ff1_recv(3),
      gty_rxp_i(37-4) => p_ff1_recv(2),
      gty_rxp_i(38-4) => p_ff1_recv(1),
      gty_rxp_i(39-4) => p_ff1_recv(0),
      -- quad 226
      gty_rxp_i(40-4) => p_ff2_recv(3),
      gty_rxp_i(41-4) => p_ff2_recv(2),
      gty_rxp_i(42-4) => p_ff2_recv(1),
      gty_rxp_i(43-4) => p_ff2_recv(0),
      -- quad 227
      gty_rxp_i(44-4) => p_ff3_recv(3),
      gty_rxp_i(45-4) => p_ff3_recv(2),
      gty_rxp_i(46-4) => p_ff3_recv(1),
      gty_rxp_i(47-4) => p_ff3_recv(0),
      -- quad 228
      gty_rxp_i(48-4) => p_ff4_recv(3),
      gty_rxp_i(49-4) => p_ff4_recv(2),
      gty_rxp_i(50-4) => p_ff4_recv(1),
      gty_rxp_i(51-4) => p_ff4_recv(0),
      -- quad 229
      gty_rxp_i(52-4) => p_ff5_recv(3),
      gty_rxp_i(53-4) => p_ff5_recv(2),
      gty_rxp_i(54-4) => p_ff5_recv(1),
      gty_rxp_i(55-4) => p_ff5_recv(0),
      -- quad 230
      gty_rxp_i(56-4) => p_ff6_recv(3),
      gty_rxp_i(57-4) => p_ff6_recv(2),
      gty_rxp_i(58-4) => p_ff6_recv(1),
      gty_rxp_i(59-4) => p_ff6_recv(0),
      
      -- quad 231, 232, 233
      gty_rxp_i(60-4) => p_ff11_recv(0),
      gty_rxp_i(61-4) => p_ff11_recv(1),
      gty_rxp_i(62-4) => p_ff11_recv(2),
      gty_rxp_i(63-4) => p_ff11_recv(3),
      gty_rxp_i(64-4) => p_ff11_recv(4),
      gty_rxp_i(65-4) => p_ff11_recv(5),
      gty_rxp_i(66-4) => p_ff11_recv(6),
      gty_rxp_i(67-4) => p_ff11_recv(7),
      gty_rxp_i(68-4) => p_ff11_recv(8),
      gty_rxp_i(69-4) => p_ff11_recv(9),
      gty_rxp_i(70-4) => p_ff11_recv(10),
      gty_rxp_i(71-4) => p_ff11_recv(11),
      
--      gty_refclk0p_i(0-4) => p_util_clk_chan1,
      gty_refclk0p_i(1-1) => p_clk0_chan4,
      gty_refclk0p_i(2-1) => p_clk0_chan5,
      gty_refclk0p_i(3-1) => p_clk0_chan6,
      gty_refclk0p_i(4-1) => p_clk0_chan7,
      gty_refclk0p_i(5-1) => p_clk0_chan0,
      gty_refclk0p_i(6-1) => p_clk0_chan1,
      gty_refclk0p_i(7-1) => p_clk0_chan2,
      gty_refclk0p_i(8-1) => p_clk0_chan3,

--      gty_refclk0n_i(0-1) => n_util_clk_chan1,
      gty_refclk0n_i(1-1) => n_clk0_chan4,
      gty_refclk0n_i(2-1) => n_clk0_chan5,
      gty_refclk0n_i(3-1) => n_clk0_chan6,
      gty_refclk0n_i(4-1) => n_clk0_chan7,
      gty_refclk0n_i(5-1) => n_clk0_chan0,
      gty_refclk0n_i(6-1) => n_clk0_chan1,
      gty_refclk0n_i(7-1) => n_clk0_chan2,
      gty_refclk0n_i(8-1) => n_clk0_chan3,

      --gty_refclk1p_i(0-4) => open,
      --gty_refclk1p_i(1-4) => p_clk1_chan4,
      --gty_refclk1p_i(2-4) => p_clk1_chan5,
      --gty_refclk1p_i(3-4) => p_clk1_chan6,
      --gty_refclk1p_i(4-4) => p_clk1_chan7,
      --gty_refclk1p_i(5-4) => p_clk1_chan0,
      --gty_refclk1p_i(6-4) => p_clk1_chan1,
      --gty_refclk1p_i(7-4) => p_clk1_chan2,
      --gty_refclk1p_i(8-4) => p_clk1_chan3,

      --gty_refclk1n_i(0-4) => open,
      --gty_refclk1n_i(1-4) => n_clk1_chan4,
      --gty_refclk1n_i(2-4) => n_clk1_chan5,
      --gty_refclk1n_i(3-4) => n_clk1_chan6,
      --gty_refclk1n_i(4-4) => n_clk1_chan7,
      --gty_refclk1n_i(5-4) => n_clk1_chan0,
      --gty_refclk1n_i(6-4) => n_clk1_chan1,
      --gty_refclk1n_i(7-4) => n_clk1_chan2,
      --gty_refclk1n_i(8-4) => n_clk1_chan3,

      -- quad 125
      --gty_txn_o(0-4) => n_mgt_v2k(0),
      --gty_txn_o(1-4) => n_mgt_v2k(1),
      --gty_txn_o(2-4) => n_mgt_v2k(2),
      --gty_txn_o(3-4) => n_mgt_v2k(3),
      -- quad 126
      gty_txn_o(4-4) => n_ff7_xmit(0),
      gty_txn_o(5-4) => n_ff7_xmit(1),
      gty_txn_o(6-4) => n_ff7_xmit(2),
      gty_txn_o(7-4) => n_ff7_xmit(3),
      -- quad 127
      gty_txn_o(8-4) => n_ff8_xmit(0),
      gty_txn_o(9-4) => n_ff8_xmit(1),
      gty_txn_o(10-4) => n_ff8_xmit(2),
      gty_txn_o(11-4) => n_ff8_xmit(3),
      -- quad 128
      gty_txn_o(12-4) => n_ff9_xmit(0),
      gty_txn_o(13-4) => n_ff9_xmit(1),
      gty_txn_o(14-4) => n_ff9_xmit(2),
      gty_txn_o(15-4) => n_ff9_xmit(3),
      -- quad 129
      gty_txn_o(16-4) => n_unused_xmit(0),
      gty_txn_o(17-4) => n_unused_xmit(1),
      gty_txn_o(18-4) => n_unused_xmit(2),
      gty_txn_o(19-4) => n_unused_xmit(3),
      -- quad 130
      gty_txn_o(20-4) => n_ff10_xmit(0),
      gty_txn_o(21-4) => n_ff10_xmit(1),
      gty_txn_o(22-4) => n_ff10_xmit(2),
      gty_txn_o(23-4) => n_ff10_xmit(3),
      
      -- quad 131, 132, 133
      gty_txn_o(24-4) => n_ff12_xmit(11),
      gty_txn_o(25-4) => n_ff12_xmit(10),
      gty_txn_o(26-4) => n_ff12_xmit(9),
      gty_txn_o(27-4) => n_ff12_xmit(8),
      gty_txn_o(28-4) => n_ff12_xmit(7),
      gty_txn_o(29-4) => n_ff12_xmit(6),
      gty_txn_o(30-4) => n_ff12_xmit(5),
      gty_txn_o(31-4) => n_ff12_xmit(4),
      gty_txn_o(32-4) => n_ff12_xmit(3),
      gty_txn_o(33-4) => n_ff12_xmit(2),
      gty_txn_o(34-4) => n_ff12_xmit(1),
      gty_txn_o(35-4) => n_ff12_xmit(0),

       -- quad 225
      gty_txn_o(36-4) => n_ff1_xmit(3),
      gty_txn_o(37-4) => n_ff1_xmit(2),
      gty_txn_o(38-4) => n_ff1_xmit(1),
      gty_txn_o(39-4) => n_ff1_xmit(0),
      -- quad 226
      gty_txn_o(40-4) => n_ff2_xmit(3),
      gty_txn_o(41-4) => n_ff2_xmit(2),
      gty_txn_o(42-4) => n_ff2_xmit(1),
      gty_txn_o(43-4) => n_ff2_xmit(0),
      -- quad 227
      gty_txn_o(44-4) => n_ff3_xmit(3),
      gty_txn_o(45-4) => n_ff3_xmit(2),
      gty_txn_o(46-4) => n_ff3_xmit(1),
      gty_txn_o(47-4) => n_ff3_xmit(0),
      -- quad 228
      gty_txn_o(48-4) => n_ff4_xmit(3),
      gty_txn_o(49-4) => n_ff4_xmit(2),
      gty_txn_o(50-4) => n_ff4_xmit(1),
      gty_txn_o(51-4) => n_ff4_xmit(0),
      -- quad 229
      gty_txn_o(52-4) => n_ff5_xmit(3),
      gty_txn_o(53-4) => n_ff5_xmit(2),
      gty_txn_o(54-4) => n_ff5_xmit(1),
      gty_txn_o(55-4) => n_ff5_xmit(0),
      -- quad 230
      gty_txn_o(56-4) => n_ff6_xmit(3),
      gty_txn_o(57-4) => n_ff6_xmit(2),
      gty_txn_o(58-4) => n_ff6_xmit(1),
      gty_txn_o(59-4) => n_ff6_xmit(0),
      
      -- quad 231, 232, 233
      gty_txn_o(60-4) => n_ff11_xmit(0),
      gty_txn_o(61-4) => n_ff11_xmit(1),
      gty_txn_o(62-4) => n_ff11_xmit(2),
      gty_txn_o(63-4) => n_ff11_xmit(3),
      gty_txn_o(64-4) => n_ff11_xmit(4),
      gty_txn_o(65-4) => n_ff11_xmit(5),
      gty_txn_o(66-4) => n_ff11_xmit(6),
      gty_txn_o(67-4) => n_ff11_xmit(7),
      gty_txn_o(68-4) => n_ff11_xmit(8),
      gty_txn_o(69-4) => n_ff11_xmit(9),
      gty_txn_o(70-4) => n_ff11_xmit(10),
      gty_txn_o(71-4) => n_ff11_xmit(11),

      -- quad 125
      --gty_txp_o(0-4) => p_mgt_v2k(0),
      --gty_txp_o(1-4) => p_mgt_v2k(1),
      --gty_txp_o(2-4) => p_mgt_v2k(2),
      --gty_txp_o(3-4) => p_mgt_v2k(3),
      
      -- quad 126
      gty_txp_o(4-4) => p_ff7_xmit(0),
      gty_txp_o(5-4) => p_ff7_xmit(1),
      gty_txp_o(6-4) => p_ff7_xmit(2),
      gty_txp_o(7-4) => p_ff7_xmit(3),
      -- quad 127
      gty_txp_o(8-4) => p_ff8_xmit(0),
      gty_txp_o(9-4) => p_ff8_xmit(1),
      gty_txp_o(10-4) => p_ff8_xmit(2),
      gty_txp_o(11-4) => p_ff8_xmit(3),
      -- quad 128
      gty_txp_o(12-4) => p_ff9_xmit(0),
      gty_txp_o(13-4) => p_ff9_xmit(1),
      gty_txp_o(14-4) => p_ff9_xmit(2),
      gty_txp_o(15-4) => p_ff9_xmit(3),
      -- quad 129
      gty_txp_o(16-4) => p_unused_xmit(0),
      gty_txp_o(17-4) => p_unused_xmit(1),
      gty_txp_o(18-4) => p_unused_xmit(2),
      gty_txp_o(19-4) => p_unused_xmit(3),
      -- quad 130
      gty_txp_o(20-4) => p_ff10_xmit(0),
      gty_txp_o(21-4) => p_ff10_xmit(1),
      gty_txp_o(22-4) => p_ff10_xmit(2),
      gty_txp_o(23-4) => p_ff10_xmit(3),
      
      -- quad 131, 132, 133
      gty_txp_o(24-4) => p_ff12_xmit(11),
      gty_txp_o(25-4) => p_ff12_xmit(10),
      gty_txp_o(26-4) => p_ff12_xmit(9),
      gty_txp_o(27-4) => p_ff12_xmit(8),
      gty_txp_o(28-4) => p_ff12_xmit(7),
      gty_txp_o(29-4) => p_ff12_xmit(6),
      gty_txp_o(30-4) => p_ff12_xmit(5),
      gty_txp_o(31-4) => p_ff12_xmit(4),
      gty_txp_o(32-4) => p_ff12_xmit(3),
      gty_txp_o(33-4) => p_ff12_xmit(2),
      gty_txp_o(34-4) => p_ff12_xmit(1),
      gty_txp_o(35-4) => p_ff12_xmit(0),

       -- quad 225
      gty_txp_o(36-4) => p_ff1_xmit(3),
      gty_txp_o(37-4) => p_ff1_xmit(2),
      gty_txp_o(38-4) => p_ff1_xmit(1),
      gty_txp_o(39-4) => p_ff1_xmit(0),
      -- quad 226
      gty_txp_o(40-4) => p_ff2_xmit(3),
      gty_txp_o(41-4) => p_ff2_xmit(2),
      gty_txp_o(42-4) => p_ff2_xmit(1),
      gty_txp_o(43-4) => p_ff2_xmit(0),
      -- quad 227
      gty_txp_o(44-4) => p_ff3_xmit(3),
      gty_txp_o(45-4) => p_ff3_xmit(2),
      gty_txp_o(46-4) => p_ff3_xmit(1),
      gty_txp_o(47-4) => p_ff3_xmit(0),
      -- quad 228
      gty_txp_o(48-4) => p_ff4_xmit(3),
      gty_txp_o(49-4) => p_ff4_xmit(2),
      gty_txp_o(50-4) => p_ff4_xmit(1),
      gty_txp_o(51-4) => p_ff4_xmit(0),
      -- quad 229
      gty_txp_o(52-4) => p_ff5_xmit(3),
      gty_txp_o(53-4) => p_ff5_xmit(2),
      gty_txp_o(54-4) => p_ff5_xmit(1),
      gty_txp_o(55-4) => p_ff5_xmit(0),
      -- quad 230
      gty_txp_o(56-4) => p_ff6_xmit(3),
      gty_txp_o(57-4) => p_ff6_xmit(2),
      gty_txp_o(58-4) => p_ff6_xmit(1),
      gty_txp_o(59-4) => p_ff6_xmit(0),
      -- quad 231, 232, 233
      gty_txp_o(60-4) => p_ff11_xmit(0),
      gty_txp_o(61-4) => p_ff11_xmit(1),
      gty_txp_o(62-4) => p_ff11_xmit(2),
      gty_txp_o(63-4) => p_ff11_xmit(3),
      gty_txp_o(64-4) => p_ff11_xmit(4),
      gty_txp_o(65-4) => p_ff11_xmit(5),
      gty_txp_o(66-4) => p_ff11_xmit(6),
      gty_txp_o(67-4) => p_ff11_xmit(7),
      gty_txp_o(68-4) => p_ff11_xmit(8),
      gty_txp_o(69-4) => p_ff11_xmit(9),
      gty_txp_o(70-4) => p_ff11_xmit(10),
      gty_txp_o(71-4) => p_ff11_xmit(11)
      );
end architecture structure;
