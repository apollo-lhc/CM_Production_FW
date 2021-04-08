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

    -- Zynq AXI Chip2Chip
    --n_util_clk_chan0 : in std_logic;
    --p_util_clk_chan0 : in std_logic;
    --n_mgt_z2v        : in  std_logic_vector(1 downto 1);
    --p_mgt_z2v        : in  std_logic_vector(1 downto 1);
    --n_mgt_v2z        : out std_logic_vector(1 downto 1);
    --p_mgt_v2z        : out std_logic_vector(1 downto 1);

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

  signal heater_output : slv32_array_t(15 downto 0);--std_logic_vector(31 downto 0);
  
  function and_reduce_array(a : slv32_array_t(15 downto 0)) return std_logic_vector is
    variable ret : std_logic_vector(31 downto 0) := (others => '0');
  begin
    for i in a'range loop
      ret := ret and a(i);
    end loop;

    return ret;
  end function and_reduce_array;

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
      clk_in1_p => p_clk_200a,
      clk_in1_n => n_clk_200a);

  led_blue  <= led_blue_local;
  led_red   <= led_red_local;
  led_green <= led_green_local;
  myreg1_test_vector <= and_reduce_array(heater_output);--heater_output(0) and heater_output(1) and heater_output(2) and heater_output(3) and heater_output(4) and heater_output(5) and heater_output(6) and heater_output(7);
  
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
-- jtagaxi_wrapper_1: entity work.jtagaxi_wrapper
    port map (
      AXI_CLK                  => AXI_CLK,
      AXI_RST_N(0)             => AXI_RST_N,
--      C2CLink_phy_Rx_rxn       => n_mgt_z2v,
--      C2CLink_phy_Rx_rxp       => p_mgt_z2v,
--      C2CLink_phy_Tx_txn       => n_mgt_v2z,
--      C2CLink_phy_Tx_txp       => p_mgt_v2z,
--      C2CLink_phy_refclk_clk_n => n_util_clk_chan0,
--      C2CLink_phy_refclk_clk_p => p_util_clk_chan0,
--      clk50Mhz                 => clk_50,
      --VIRTEX_TCDS_DRP_araddr                     => local_AXI_ReadMOSI(0).address,
      --VIRTEX_TCDS_DRP_arprot                     => local_AXI_ReadMOSI(0).protection_type,
      --VIRTEX_TCDS_DRP_arready(0)                 => local_AXI_ReadMISO(0).ready_for_address,
      --VIRTEX_TCDS_DRP_arvalid(0)                 => local_AXI_ReadMOSI(0).address_valid,
      --VIRTEX_TCDS_DRP_awaddr                     => local_AXI_WriteMOSI(0).address,
      --VIRTEX_TCDS_DRP_awprot                     => local_AXI_WriteMOSI(0).protection_type,
      --VIRTEX_TCDS_DRP_awready(0)                 => local_AXI_WriteMISO(0).ready_for_address,
      --VIRTEX_TCDS_DRP_awvalid(0)                 => local_AXI_WriteMOSI(0).address_valid,
      --VIRTEX_TCDS_DRP_bready(0)                  => local_AXI_WriteMOSI(0).ready_for_response,
      --VIRTEX_TCDS_DRP_bresp                      => local_AXI_WriteMISO(0).response,
      --VIRTEX_TCDS_DRP_bvalid(0)                  => local_AXI_WriteMISO(0).response_valid,
      --VIRTEX_TCDS_DRP_rdata                      => local_AXI_ReadMISO(0).data,
      --VIRTEX_TCDS_DRP_rready(0)                  => local_AXI_ReadMOSI(0).ready_for_data,
      --VIRTEX_TCDS_DRP_rresp                      => local_AXI_ReadMISO(0).response,
      --VIRTEX_TCDS_DRP_rvalid(0)                  => local_AXI_ReadMISO(0).data_valid,
      --VIRTEX_TCDS_DRP_wdata                      => local_AXI_WriteMOSI(0).data,
      --VIRTEX_TCDS_DRP_wready(0)                  => local_AXI_WriteMISO(0).ready_for_data,
      --VIRTEX_TCDS_DRP_wstrb                      => local_AXI_WriteMOSI(0).data_write_strobe,
      --VIRTEX_TCDS_DRP_wvalid(0)                  => local_AXI_WriteMOSI(0).data_valid,

      VIRTEX_TCDS_araddr                         => local_AXI_ReadMOSI(1-1).address,
      VIRTEX_TCDS_arprot                         => local_AXI_ReadMOSI(1-1).protection_type,
      VIRTEX_TCDS_arready                     => local_AXI_ReadMISO(1-1).ready_for_address,
      VIRTEX_TCDS_arvalid                     => local_AXI_ReadMOSI(1-1).address_valid,
      VIRTEX_TCDS_awaddr                         => local_AXI_WriteMOSI(1-1).address,
      VIRTEX_TCDS_awprot                         => local_AXI_WriteMOSI(1-1).protection_type,
      VIRTEX_TCDS_awready                     => local_AXI_WriteMISO(1-1).ready_for_address,
      VIRTEX_TCDS_awvalid                     => local_AXI_WriteMOSI(1-1).address_valid,
      VIRTEX_TCDS_bready                      => local_AXI_WriteMOSI(1-1).ready_for_response,
      VIRTEX_TCDS_bresp                          => local_AXI_WriteMISO(1-1).response,
      VIRTEX_TCDS_bvalid                      => local_AXI_WriteMISO(1-1).response_valid,
      VIRTEX_TCDS_rdata                          => local_AXI_ReadMISO(1-1).data,
      VIRTEX_TCDS_rready                      => local_AXI_ReadMOSI(1-1).ready_for_data,
      VIRTEX_TCDS_rresp                          => local_AXI_ReadMISO(1-1).response,
      VIRTEX_TCDS_rvalid                      => local_AXI_ReadMISO(1-1).data_valid,
      VIRTEX_TCDS_wdata                          => local_AXI_WriteMOSI(1-1).data,
      VIRTEX_TCDS_wready                      => local_AXI_WriteMISO(1-1).ready_for_data,
      VIRTEX_TCDS_wstrb                          => local_AXI_WriteMOSI(1-1).data_write_strobe,
      VIRTEX_TCDS_wvalid                      => local_AXI_WriteMOSI(1-1).data_valid,

      CM_V_INFO_araddr            => local_AXI_ReadMOSI(2-1).address,              
      CM_V_INFO_arprot            => local_AXI_ReadMOSI(2-1).protection_type,      
      CM_V_INFO_arready           => local_AXI_ReadMISO(2-1).ready_for_address,    
      CM_V_INFO_arvalid           => local_AXI_ReadMOSI(2-1).address_valid,        
      CM_V_INFO_awaddr            => local_AXI_WriteMOSI(2-1).address,             
      CM_V_INFO_awprot            => local_AXI_WriteMOSI(2-1).protection_type,     
      CM_V_INFO_awready           => local_AXI_WriteMISO(2-1).ready_for_address,   
      CM_V_INFO_awvalid           => local_AXI_WriteMOSI(2-1).address_valid,       
      CM_V_INFO_bready            => local_AXI_WriteMOSI(2-1).ready_for_response,  
      CM_V_INFO_bresp             => local_AXI_WriteMISO(2-1).response,            
      CM_V_INFO_bvalid            => local_AXI_WriteMISO(2-1).response_valid,      
      CM_V_INFO_rdata             => local_AXI_ReadMISO(2-1).data,                 
      CM_V_INFO_rready            => local_AXI_ReadMOSI(2-1).ready_for_data,       
      CM_V_INFO_rresp             => local_AXI_ReadMISO(2-1).response,             
      CM_V_INFO_rvalid            => local_AXI_ReadMISO(2-1).data_valid,           
      CM_V_INFO_wdata             => local_AXI_WriteMOSI(2-1).data,                
      CM_V_INFO_wready            => local_AXI_WriteMISO(2-1).ready_for_data,       
      CM_V_INFO_wstrb             => local_AXI_WriteMOSI(2-1).data_write_strobe,   
      CM_V_INFO_wvalid            => local_AXI_WriteMOSI(2-1).data_valid,          

      reset_n                  => locked_clk200,--reset,
--      C2CLink_aurora_do_cc                => open, 
--      C2CLink_axi_c2c_config_error_out    => open, 
--      C2CLink_axi_c2c_link_status_out     => open, 
--      C2CLink_axi_c2c_multi_bit_error_out => open, 
--      C2CLink_phy_gt_pll_lock             => debug(0), 
--      C2CLink_phy_hard_err                => open, 
--      C2CLink_phy_lane_up                 => debug(1 downto 1), 
--      C2CLink_phy_link_reset_out          => open, 
--      C2CLink_phy_mmcm_not_locked_out     => debug(2), 
--      C2CLink_phy_power_down              => '0', 
--      C2CLink_phy_soft_err                => open,
      VIRTEX_SYS_MGMT_sda                 => v_fpga_i2c_sda,
      VIRTEX_SYS_MGMT_scl                 => v_fpga_i2c_scl

);

  TCDS_1: entity work.TCDS
    port map (
      clk_axi              => AXI_CLK,
      clk_200              => clk_200,
      reset_axi_n          => AXI_RST_N,
      readMOSI             => local_AXI_readMOSI(1-1),
      readMISO             => local_AXI_readMISO(1-1),
      writeMOSI            => local_AXI_writeMOSI(1-1),
      writeMISO            => local_AXI_writeMISO(1-1),
      --DRP_readMOSI         => local_AXI_readMOSI(0),
      --DRP_readMISO         => local_AXI_readMISO(0),
      --DRP_writeMOSI        => local_AXI_writeMOSI(0),
      --DRP_writeMISO        => local_AXI_writeMISO(0),
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
      readMOSI    => local_AXI_ReadMOSI(2-1),
      readMISO    => local_AXI_ReadMISO(2-1),
      writeMOSI   => local_AXI_WriteMOSI(2-1),
      writeMISO   => local_AXI_WriteMISO(2-1));
  
end architecture structure;
