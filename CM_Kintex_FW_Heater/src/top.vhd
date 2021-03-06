library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axiRegPkg.all;
use work.types.all;
use work.K_IO_Ctrl.all;


Library UNISIM;
use UNISIM.vcomponents.all;

entity top is
  port (
    -- clocks
    p_clk_200 : in  std_logic;
    n_clk_200 : in  std_logic;                -- 200 MHz system clock


    -- Zynq AXI Chip2Chip
    n_util_clk_chan0 : in std_logic;
    p_util_clk_chan0 : in std_logic;
    n_mgt_z2k        : in  std_logic_vector(1 downto 1);
    p_mgt_z2k        : in  std_logic_vector(1 downto 1);
    n_mgt_k2z        : out std_logic_vector(1 downto 1);
    p_mgt_k2z        : out std_logic_vector(1 downto 1);

    k_fpga_i2c_scl   : inout std_logic;
    k_fpga_i2c_sda   : inout std_logic;

    --TCDS
    p_clk0_chan0     : in std_logic; -- 200 MHz system clock
    n_clk0_chan0     : in std_logic; 
    p_clk1_chan0     : in std_logic; -- 312.195122 MHz synth clock
    n_clk1_chan0     : in std_logic;
    p_atca_tts_out   : out std_logic;
    n_atca_tts_out   : out std_logic;
    p_atca_ttc_in    : in  std_logic;
    n_atca_ttc_in    : in  std_logic;

    
    -- tri-color LED
    led_red : out std_logic;
    led_green : out std_logic;
    led_blue : out std_logic       -- assert to turn on
    -- utility bits to/from TM4C
    );    
end entity top;

architecture structure of top is

  signal clk_200_raw     : std_logic;
  signal clk_200         : std_logic;
  signal clk_50          : std_logic;
  signal reset           : std_logic;
  signal locked_clk200   : std_logic;

  signal led_blue_local  : slv_8_t;
  signal led_red_local   : slv_8_t;
  signal led_green_local : slv_8_t;

  constant localAXISlaves    : integer := 4;
  signal local_AXI_ReadMOSI  :  AXIReadMOSI_array_t(0 to localAXISlaves-1) := ( others => DefaultAXIReadMOSI);
  signal local_AXI_ReadMISO  :  AXIReadMISO_array_t(0 to localAXISlaves-1) := ( others => DefaultAXIReadMISO);
  signal local_AXI_WriteMOSI : AXIWriteMOSI_array_t(0 to localAXISlaves-1) := ( others => DefaultAXIWriteMOSI);
  signal local_AXI_WriteMISO : AXIWriteMISO_array_t(0 to localAXISlaves-1) := ( others => DefaultAXIWriteMISO);
  signal AXI_CLK             : std_logic;
  signal AXI_RST_N           : std_logic;
  signal AXI_RESET           : std_logic;

  signal ext_AXI_ReadMOSI  :  AXIReadMOSI := DefaultAXIReadMOSI;
  signal ext_AXI_ReadMISO  :  AXIReadMISO := DefaultAXIReadMISO;
  signal ext_AXI_WriteMOSI : AXIWriteMOSI := DefaultAXIWriteMOSI;
  signal ext_AXI_WriteMISO : AXIWriteMISO := DefaultAXIWriteMISO;

  

  signal C2CLink_aurora_do_cc                : STD_LOGIC;
  signal C2CLink_axi_c2c_config_error_out    : STD_LOGIC;
  signal C2CLink_axi_c2c_link_status_out     : STD_LOGIC;
  signal C2CLink_axi_c2c_multi_bit_error_out : STD_LOGIC;
  signal C2CLink_phy_gt_pll_lock             : STD_LOGIC;
  signal C2CLink_phy_hard_err                : STD_LOGIC;
  signal C2CLink_phy_lane_up                 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal C2CLink_phy_link_reset_out          : STD_LOGIC;
  signal C2CLink_phy_mmcm_not_locked_out     : STD_LOGIC;
  signal C2CLink_phy_soft_err                : STD_LOGIC;


  signal BRAM_write : std_logic;
  signal BRAM_addr  : std_logic_vector(9 downto 0);
  signal BRAM_WR_data : std_logic_vector(31 downto 0);
  signal BRAM_RD_data : std_logic_vector(31 downto 0);

  signal AXI_BRAM_EN : std_logic;
  signal AXI_BRAM_we : std_logic_vector(3 downto 0);
  signal AXI_BRAM_addr :std_logic_vector(11 downto 0);
  signal AXI_BRAM_DATA_IN : std_logic_vector(31 downto 0);
  signal AXI_BRAM_DATA_OUT : std_logic_vector(31 downto 0);

  signal heater_output : std_logic_vector(31 downto 0);


  
  
begin  -- architecture structure

  --Clocking
  Local_Clocking_1: entity work.Local_Clocking
    port map (
      clk_200   => clk_200,
      clk_50    => clk_50,
      clk_axi   => AXI_CLK,
      reset     => '0',
      locked    => locked_clk200,
      clk_in1_p => p_clk_200,
      clk_in1_n => n_clk_200);
  
  

  

  c2csslave_wrapper_1: entity work.c2cslave_wrapper
    port map (
      AXI_CLK                             => AXI_CLK,
      AXI_RST_N(0)                        => AXI_RST_N,
      K_C2CLink_phy_Rx_rxn                  => n_mgt_z2k,
      K_C2CLink_phy_Rx_rxp                  => p_mgt_z2k,
      K_C2CLink_phy_Tx_txn                  => n_mgt_k2z,
      K_C2CLink_phy_Tx_txp                  => p_mgt_k2z,
      K_C2CLink_phy_refclk_clk_n            => n_util_clk_chan0,
      K_C2CLink_phy_refclk_clk_p            => p_util_clk_chan0,
      clk50Mhz                            => clk_50,
      K_IO_araddr                         => local_AXI_ReadMOSI(0).address,              
      K_IO_arprot                         => local_AXI_ReadMOSI(0).protection_type,      
      K_IO_arready                        => local_AXI_ReadMISO(0).ready_for_address,    
      K_IO_arvalid                        => local_AXI_ReadMOSI(0).address_valid,        
      K_IO_awaddr                         => local_AXI_WriteMOSI(0).address,             
      K_IO_awprot                         => local_AXI_WriteMOSI(0).protection_type,     
      K_IO_awready                        => local_AXI_WriteMISO(0).ready_for_address,   
      K_IO_awvalid                        => local_AXI_WriteMOSI(0).address_valid,       
      K_IO_bready                      => local_AXI_WriteMOSI(0).ready_for_response,  
      K_IO_bresp                          => local_AXI_WriteMISO(0).response,            
      K_IO_bvalid                      => local_AXI_WriteMISO(0).response_valid,      
      K_IO_rdata                          => local_AXI_ReadMISO(0).data,                 
      K_IO_rready                      => local_AXI_ReadMOSI(0).ready_for_data,       
      K_IO_rresp                          => local_AXI_ReadMISO(0).response,             
      K_IO_rvalid                      => local_AXI_ReadMISO(0).data_valid,           
      K_IO_wdata                          => local_AXI_WriteMOSI(0).data,                
      K_IO_wready                      => local_AXI_WriteMISO(0).ready_for_data,       
      K_IO_wstrb                          => local_AXI_WriteMOSI(0).data_write_strobe,   
      K_IO_wvalid                      => local_AXI_WriteMOSI(0).data_valid,          
      CM_K_INFO_araddr                    => local_AXI_ReadMOSI(1).address,              
      CM_K_INFO_arprot                    => local_AXI_ReadMOSI(1).protection_type,      
      CM_K_INFO_arready                => local_AXI_ReadMISO(1).ready_for_address,    
      CM_K_INFO_arvalid                => local_AXI_ReadMOSI(1).address_valid,        
      CM_K_INFO_awaddr                    => local_AXI_WriteMOSI(1).address,             
      CM_K_INFO_awprot                    => local_AXI_WriteMOSI(1).protection_type,     
      CM_K_INFO_awready                => local_AXI_WriteMISO(1).ready_for_address,   
      CM_K_INFO_awvalid                => local_AXI_WriteMOSI(1).address_valid,       
      CM_K_INFO_bready                 => local_AXI_WriteMOSI(1).ready_for_response,  
      CM_K_INFO_bresp                     => local_AXI_WriteMISO(1).response,            
      CM_K_INFO_bvalid                 => local_AXI_WriteMISO(1).response_valid,      
      CM_K_INFO_rdata                     => local_AXI_ReadMISO(1).data,                 
      CM_K_INFO_rready                 => local_AXI_ReadMOSI(1).ready_for_data,       
      CM_K_INFO_rresp                     => local_AXI_ReadMISO(1).response,             
      CM_K_INFO_rvalid                 => local_AXI_ReadMISO(1).data_valid,           
      CM_K_INFO_wdata                     => local_AXI_WriteMOSI(1).data,                
      CM_K_INFO_wready                 => local_AXI_WriteMISO(1).ready_for_data,       
      CM_K_INFO_wstrb                     => local_AXI_WriteMOSI(1).data_write_strobe,   
      CM_K_INFO_wvalid                 => local_AXI_WriteMOSI(1).data_valid,          
      KINTEX_TCDS_DRP_araddr                     => local_AXI_ReadMOSI(2).address,
      KINTEX_TCDS_DRP_arprot                     => local_AXI_ReadMOSI(2).protection_type,
      KINTEX_TCDS_DRP_arready                 => local_AXI_ReadMISO(2).ready_for_address,
      KINTEX_TCDS_DRP_arvalid                 => local_AXI_ReadMOSI(2).address_valid,
      KINTEX_TCDS_DRP_awaddr                     => local_AXI_WriteMOSI(2).address,
      KINTEX_TCDS_DRP_awprot                     => local_AXI_WriteMOSI(2).protection_type,
      KINTEX_TCDS_DRP_awready                 => local_AXI_WriteMISO(2).ready_for_address,
      KINTEX_TCDS_DRP_awvalid                 => local_AXI_WriteMOSI(2).address_valid,
      KINTEX_TCDS_DRP_bready                  => local_AXI_WriteMOSI(2).ready_for_response,
      KINTEX_TCDS_DRP_bresp                      => local_AXI_WriteMISO(2).response,
      KINTEX_TCDS_DRP_bvalid                  => local_AXI_WriteMISO(2).response_valid,
      KINTEX_TCDS_DRP_rdata                      => local_AXI_ReadMISO(2).data,
      KINTEX_TCDS_DRP_rready                  => local_AXI_ReadMOSI(2).ready_for_data,
      KINTEX_TCDS_DRP_rresp                      => local_AXI_ReadMISO(2).response,
      KINTEX_TCDS_DRP_rvalid                  => local_AXI_ReadMISO(2).data_valid,
      KINTEX_TCDS_DRP_wdata                      => local_AXI_WriteMOSI(2).data,
      KINTEX_TCDS_DRP_wready                  => local_AXI_WriteMISO(2).ready_for_data,
      KINTEX_TCDS_DRP_wstrb                      => local_AXI_WriteMOSI(2).data_write_strobe,
      KINTEX_TCDS_DRP_wvalid                  => local_AXI_WriteMOSI(2).data_valid,
                                          
      KINTEX_TCDS_araddr                         => local_AXI_ReadMOSI(3).address,
      KINTEX_TCDS_arprot                         => local_AXI_ReadMOSI(3).protection_type,
      KINTEX_TCDS_arready                     => local_AXI_ReadMISO(3).ready_for_address,
      KINTEX_TCDS_arvalid                     => local_AXI_ReadMOSI(3).address_valid,
      KINTEX_TCDS_awaddr                         => local_AXI_WriteMOSI(3).address,
      KINTEX_TCDS_awprot                         => local_AXI_WriteMOSI(3).protection_type,
      KINTEX_TCDS_awready                     => local_AXI_WriteMISO(3).ready_for_address,
      KINTEX_TCDS_awvalid                     => local_AXI_WriteMOSI(3).address_valid,
      KINTEX_TCDS_bready                      => local_AXI_WriteMOSI(3).ready_for_response,
      KINTEX_TCDS_bresp                          => local_AXI_WriteMISO(3).response,
      KINTEX_TCDS_bvalid                      => local_AXI_WriteMISO(3).response_valid,
      KINTEX_TCDS_rdata                          => local_AXI_ReadMISO(3).data,
      KINTEX_TCDS_rready                      => local_AXI_ReadMOSI(3).ready_for_data,
      KINTEX_TCDS_rresp                          => local_AXI_ReadMISO(3).response,
      KINTEX_TCDS_rvalid                      => local_AXI_ReadMISO(3).data_valid,
      KINTEX_TCDS_wdata                          => local_AXI_WriteMOSI(3).data,
      KINTEX_TCDS_wready                      => local_AXI_WriteMISO(3).ready_for_data,
      KINTEX_TCDS_wstrb                          => local_AXI_WriteMOSI(3).data_write_strobe,
      KINTEX_TCDS_wvalid                      => local_AXI_WriteMOSI(3).data_valid,




      IPBUS_KINTEX_araddr                 => ext_AXI_ReadMOSI.address,              
      IPBUS_KINTEX_arburst                => ext_AXI_ReadMOSI.burst_type,
      IPBUS_KINTEX_arcache                => ext_AXI_ReadMOSI.cache_type,
      IPBUS_KINTEX_arlen                  => ext_AXI_ReadMOSI.burst_length,
      IPBUS_KINTEX_arlock(0)              => ext_AXI_ReadMOSI.lock_type,
      IPBUS_KINTEX_arprot                 => ext_AXI_ReadMOSI.protection_type,      
      IPBUS_KINTEX_arqos                  => ext_AXI_ReadMOSI.qos,
      IPBUS_KINTEX_arready(0)             => ext_AXI_ReadMISO.ready_for_address,
      IPBUS_KINTEX_arregion               => ext_AXI_ReadMOSI.region,
      IPBUS_KINTEX_arsize                 => ext_AXI_ReadMOSI.burst_size,
      IPBUS_KINTEX_arvalid(0)             => ext_AXI_ReadMOSI.address_valid,        
      IPBUS_KINTEX_awaddr                 => ext_AXI_WriteMOSI.address,             
      IPBUS_KINTEX_awburst                => ext_AXI_WriteMOSI.burst_type,
      IPBUS_KINTEX_awcache                => ext_AXI_WriteMOSI.cache_type,
      IPBUS_KINTEX_awlen                  => ext_AXI_WriteMOSI.burst_length,
      IPBUS_KINTEX_awlock(0)              => ext_AXI_WriteMOSI.lock_type,
      IPBUS_KINTEX_awprot                 => ext_AXI_WriteMOSI.protection_type,
      IPBUS_KINTEX_awqos                  => ext_AXI_WriteMOSI.qos,
      IPBUS_KINTEX_awready(0)             => ext_AXI_WriteMISO.ready_for_address,   
      IPBUS_KINTEX_awregion               => ext_AXI_WriteMOSI.region,
      IPBUS_KINTEX_awsize                 => ext_AXI_WriteMOSI.burst_size,
      IPBUS_KINTEX_awvalid(0)             => ext_AXI_WriteMOSI.address_valid,       
      IPBUS_KINTEX_bready(0)              => ext_AXI_WriteMOSI.ready_for_response,  
      IPBUS_KINTEX_bresp                  => ext_AXI_WriteMISO.response,            
      IPBUS_KINTEX_bvalid(0)              => ext_AXI_WriteMISO.response_valid,      
      IPBUS_KINTEX_rdata                  => ext_AXI_ReadMISO.data,
      IPBUS_KINTEX_rlast(0)               => ext_AXI_ReadMISO.last,
      IPBUS_KINTEX_rready(0)              => ext_AXI_ReadMOSI.ready_for_data,       
      IPBUS_KINTEX_rresp                  => ext_AXI_ReadMISO.response,             
      IPBUS_KINTEX_rvalid(0)              => ext_AXI_ReadMISO.data_valid,           
      IPBUS_KINTEX_wdata                  => ext_AXI_WriteMOSI.data,
      IPBUS_KINTEX_wlast(0)               => ext_AXI_WriteMOSI.last,
      IPBUS_KINTEX_wready(0)              => ext_AXI_WriteMISO.ready_for_data,       
      IPBUS_KINTEX_wstrb                  => ext_AXI_WriteMOSI.data_write_strobe,   
      IPBUS_KINTEX_wvalid(0)              => ext_AXI_WriteMOSI.data_valid,          
      reset_n                             => locked_clk200,--reset,
      K_C2CLink_aurora_do_cc                => C2CLink_aurora_do_cc,               
      K_C2CLink_axi_c2c_config_error_out    => C2CLink_axi_c2c_config_error_out,   
      K_C2CLink_axi_c2c_link_status_out     => C2CLink_axi_c2c_link_status_out,    
      K_C2CLink_axi_c2c_multi_bit_error_out => C2CLink_axi_c2c_multi_bit_error_out,
      K_C2CLink_phy_gt_pll_lock             => C2CLink_phy_gt_pll_lock,            
      K_C2CLink_phy_hard_err                => C2CLink_phy_hard_err,               
      K_C2CLink_phy_lane_up                 => C2CLink_phy_lane_up,                
      K_C2CLink_phy_link_reset_out          => C2CLink_phy_link_reset_out,         
      K_C2CLink_phy_mmcm_not_locked_out     => C2CLink_phy_mmcm_not_locked_out,    
      K_C2CLink_phy_power_down              => '0',
      K_C2CLink_phy_soft_err                => C2CLink_phy_soft_err,               
      KINTEX_SYS_MGMT_sda                 =>k_fpga_i2c_sda,
      KINTEX_SYS_MGMT_scl                 =>k_fpga_i2c_scl
);

  RGB_pwm_1: entity work.RGB_pwm
    generic map (
      CLKFREQ => 200000000,
      RGBFREQ => 1000)
    port map (
      clk        => clk_200,
      redcount   => heater_output( 7 downto  0),
      greencount => heater_output(15 downto  8),
      bluecount  => heater_output(23 downto 16),
      LEDred     => led_red,
      LEDgreen   => led_green,
      LEDblue    => led_blue);

  --RGB_pwm_1: entity work.RGB_pwm
  --  generic map (
  --    CLKFREQ => 200000000,
  --    RGBFREQ => 1000)
  --  port map (
  --    clk        => clk_200,
  --    redcount   => led_red_local,
  --    greencount => led_green_local,
  --    bluecount  => led_blue_local,
  --    LEDred     => led_red,
  --    LEDgreen   => led_green,
  --    LEDblue    => led_blue);

  K_IO_interface_1: entity work.K_IO_interface
    port map (
      clk_axi         => AXI_CLK,
      reset_axi_n     => AXI_RST_N,
      slave_readMOSI  => local_AXI_readMOSI(0),
      slave_readMISO  => local_AXI_readMISO(0),
      slave_writeMOSI => local_AXI_writeMOSI(0),
      slave_writeMISO => local_AXI_writeMISO(0),
      Mon.C2C.CONFIG_ERR      => C2CLink_axi_c2c_config_error_out,
      Mon.C2C.DO_CC           => C2CLink_aurora_do_cc,
      Mon.C2C.GT_PLL_LOCK     => C2CLink_phy_gt_pll_lock,
      Mon.C2C.HARD_ERR        => C2CLink_phy_hard_err,
      Mon.C2C.LANE_UP         => C2CLink_phy_lane_up(0),
      Mon.C2C.LINK_RESET      => C2CLink_phy_link_reset_out,
      Mon.C2C.LINK_STATUS     => C2CLink_axi_c2c_link_status_out,
      Mon.C2C.MMCM_NOT_LOCKED => C2CLink_phy_mmcm_not_locked_out,
      Mon.C2C.MULTIBIT_ERR    => C2CLink_axi_c2c_multi_bit_error_out,
      Mon.C2C.SOFT_ERR        => C2CLink_phy_soft_err,
      Mon.CLK_200_LOCKED      => locked_clk200,
      Mon.BRAM.RD_DATA        => BRAM_RD_DATA,
      Ctrl.RGB.R              => led_red_local,
      Ctrl.RGB.G              => led_green_local,
      Ctrl.RGB.B              => led_blue_local,
      Ctrl.BRAM.WRITE         => BRAM_WRITE,
      Ctrl.BRAM.ADDR          => BRAM_ADDR,
      Ctrl.BRAM.WR_DATA       => BRAM_WR_DATA
      );

  CM_K_info_1: entity work.CM_K_info
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(1),
      readMISO    => local_AXI_ReadMISO(1),
      writeMOSI   => local_AXI_WriteMOSI(1),
      writeMISO   => local_AXI_WriteMISO(1));

  TCDS_1: entity work.TCDS
    port map (
      clk_axi              => AXI_CLK,
      clk_200              => clk_200,
      reset_axi_n          => AXI_RST_N,
      readMOSI             => local_AXI_readMOSI(3),
      readMISO             => local_AXI_readMISO(3),
      writeMOSI            => local_AXI_writeMOSI(3),
      writeMISO            => local_AXI_writeMISO(3),
      DRP_readMOSI         => local_AXI_readMOSI(2),
      DRP_readMISO         => local_AXI_readMISO(2),
      DRP_writeMOSI        => local_AXI_writeMOSI(2),
      DRP_writeMISO        => local_AXI_writeMISO(2),
      refclk0_p => p_clk0_chan0,
      refclk0_n => n_clk0_chan0,
      refclk1_p => p_clk1_chan0,
      refclk1_n => n_clk1_chan0,  
      tx_p     => p_atca_tts_out  ,
      tx_n     => n_atca_tts_out  ,
      rx_p     => p_atca_ttc_in   ,
      rx_n     => n_atca_ttc_in   ,
      heater_output => heater_output,
      TxRx_clk_sel => '0'       );

  AXI_RESET <= not AXI_RST_N;
  AXI_BRAM_1: entity work.AXI_BRAM
    port map (
      s_axi_aclk    => AXI_CLK,
      s_axi_aresetn => AXI_RST_N,
      s_axi_araddr                 => ext_AXI_ReadMOSI.address(11 downto 0),              
      s_axi_arburst                => ext_AXI_ReadMOSI.burst_type,
      s_axi_arcache                => ext_AXI_ReadMOSI.cache_type,
      s_axi_arlen                  => ext_AXI_ReadMOSI.burst_length,
      s_axi_arlock                 => ext_AXI_ReadMOSI.lock_type,
      s_axi_arprot                 => ext_AXI_ReadMOSI.protection_type,      
--      s_axi_arqos                  => ext_AXI_ReadMOSI.qos,
      s_axi_arready             => ext_AXI_ReadMISO.ready_for_address,
--      s_axi_arregion               => ext_AXI_ReadMOSI.region,
      s_axi_arsize                 => ext_AXI_ReadMOSI.burst_size,
      s_axi_arvalid             => ext_AXI_ReadMOSI.address_valid,        
      s_axi_awaddr                 => ext_AXI_WriteMOSI.address(11 downto 0),             
      s_axi_awburst                => ext_AXI_WriteMOSI.burst_type,
      s_axi_awcache                => ext_AXI_WriteMOSI.cache_type,
      s_axi_awlen                  => ext_AXI_WriteMOSI.burst_length,
      s_axi_awlock              => ext_AXI_WriteMOSI.lock_type,
      s_axi_awprot                 => ext_AXI_WriteMOSI.protection_type,
--      s_axi_awqos                  => ext_AXI_WriteMOSI.qos,
      s_axi_awready             => ext_AXI_WriteMISO.ready_for_address,   
--      s_axi_awregion               => ext_AXI_WriteMOSI.region,
      s_axi_awsize                 => ext_AXI_WriteMOSI.burst_size,
      s_axi_awvalid             => ext_AXI_WriteMOSI.address_valid,       
      s_axi_bready              => ext_AXI_WriteMOSI.ready_for_response,  
      s_axi_bresp                  => ext_AXI_WriteMISO.response,            
      s_axi_bvalid              => ext_AXI_WriteMISO.response_valid,      
      s_axi_rdata                  => ext_AXI_ReadMISO.data,
      s_axi_rlast               => ext_AXI_ReadMISO.last,
      s_axi_rready              => ext_AXI_ReadMOSI.ready_for_data,       
      s_axi_rresp                  => ext_AXI_ReadMISO.response,             
      s_axi_rvalid              => ext_AXI_ReadMISO.data_valid,           
      s_axi_wdata                  => ext_AXI_WriteMOSI.data,
      s_axi_wlast               => ext_AXI_WriteMOSI.last,
      s_axi_wready              => ext_AXI_WriteMISO.ready_for_data,       
      s_axi_wstrb                  => ext_AXI_WriteMOSI.data_write_strobe,   
      s_axi_wvalid              => ext_AXI_WriteMOSI.data_valid,          
      bram_rst_a                   => AXI_reset,
      bram_clk_a                   => AXI_CLK,
      bram_en_a                    => AXI_BRAM_en,
      bram_we_a                    => AXI_BRAM_we,
      bram_addr_a                  => AXI_BRAM_addr,
      bram_wrdata_a                => AXI_BRAM_DATA_IN,
      bram_rddata_a                => AXI_BRAM_DATA_OUT);

  DP_BRAM_1: entity work.DP_BRAM
    port map (
      clka  => AXI_CLK,
      ena   => AXI_BRAM_EN,
      wea   => AXI_BRAM_we,
      addra => AXI_BRAM_addr(11 downto 2),
      dina  => AXI_BRAM_DATA_IN,
      douta => AXI_BRAM_DATA_OUT,
      clkb  => AXI_CLK,
      enb   => '1',
      web   => (others => BRAM_WRITE),
      addrb => BRAM_ADDR,
      dinb  => BRAM_WR_DATA,
      doutb => BRAM_RD_DATA);

end architecture structure;
