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
    --n_util_clk_chan0 : in std_logic;
    --p_util_clk_chan0 : in std_logic;
    --n_mgt_z2k        : in  std_logic_vector(1 downto 1);
    --p_mgt_z2k        : in  std_logic_vector(1 downto 1);
    --n_mgt_k2z        : out std_logic_vector(1 downto 1);
    --p_mgt_k2z        : out std_logic_vector(1 downto 1);

    k_fpga_i2c_scl   : inout std_logic;
    k_fpga_i2c_sda   : inout std_logic;

    --TCDS
    p_clk0_chan0     : in std_logic; -- 200 MHz system clock
    n_clk0_chan0     : in std_logic; 
    p_clk1_chan0     : in std_logic; -- 312.195122 MHz synth clock
    n_clk1_chan0     : in std_logic;
    --p_atca_tts_out   : out std_logic;
    --n_atca_tts_out   : out std_logic;
    --p_atca_ttc_in    : in  std_logic;
    --n_atca_ttc_in    : in  std_logic;

    --IBERT
    p_clk0_chan1     : in std_logic;
    n_clk0_chan1     : in std_logic;
    p_clk0_chan2     : in std_logic;
    n_clk0_chan2     : in std_logic;
    p_clk0_chan3     : in std_logic;
    n_clk0_chan3     : in std_logic;
    p_clk0_chan4     : in std_logic;
    n_clk0_chan4     : in std_logic;
    p_clk0_chan5     : in std_logic;
    n_clk0_chan5     : in std_logic;
    p_clk0_chan6     : in std_logic;
    n_clk0_chan6     : in std_logic;
    n_util_clk_chan1 : in std_logic;
    p_util_clk_chan1 : in std_logic;

    p_clk1_chan1     : in std_logic;
    n_clk1_chan1     : in std_logic;
    p_clk1_chan2     : in std_logic;
    n_clk1_chan2     : in std_logic;
    p_clk1_chan3     : in std_logic;
    n_clk1_chan3     : in std_logic;
    p_clk1_chan4     : in std_logic;
    n_clk1_chan4     : in std_logic;
    p_clk1_chan5     : in std_logic;
    n_clk1_chan5     : in std_logic;
    p_clk1_chan6     : in std_logic;
    n_clk1_chan6     : in std_logic;
                                                        
    n_mgt_v2k : in  std_logic_vector(3 downto 0);
    p_mgt_v2k : in  std_logic_vector(3 downto 0);
    n_mgt_k2v : out  std_logic_vector(3 downto 0);
    p_mgt_k2v : out  std_logic_vector(3 downto 0);

    n_ff1_recv : in std_logic_vector(11 downto 0);
    n_ff2_recv : in std_logic_vector(11 downto 0);
    n_ff3_recv : in std_logic_vector(11 downto 0);
    n_ff4_recv : in std_logic_vector(3 downto 0);
    n_ff5_recv : in std_logic_vector(3 downto 0);
    n_ff6_recv : in std_logic_vector(3 downto 0);
    n_ff7_recv : in std_logic_vector(11 downto 0);
    n_unused_recv : in std_logic_vector(3 downto 0);
    n_unused1_recv : in std_logic_vector(3 downto 0);
    
    p_ff1_recv : in std_logic_vector(11 downto 0);
    p_ff2_recv : in std_logic_vector(11 downto 0);
    p_ff3_recv : in std_logic_vector(11 downto 0);
    p_ff4_recv : in std_logic_vector(3 downto 0);
    p_ff5_recv : in std_logic_vector(3 downto 0);
    p_ff6_recv : in std_logic_vector(3 downto 0);
    p_ff7_recv : in std_logic_vector(11 downto 0);
    p_unused_recv : in std_logic_vector(3 downto 0);
    p_unused1_recv : in std_logic_vector(3 downto 0);
    
    n_ff1_xmit : out std_logic_vector(11 downto 0);
    n_ff2_xmit : out std_logic_vector(11 downto 0);
    n_ff3_xmit : out std_logic_vector(11 downto 0);
    n_ff4_xmit : out std_logic_vector(3 downto 0);
    n_ff5_xmit : out std_logic_vector(3 downto 0);
    n_ff6_xmit : out std_logic_vector(3 downto 0);
    n_ff7_xmit : out std_logic_vector(11 downto 0);
    n_unused_xmit : out std_logic_vector(3 downto 0);
    n_unused1_xmit : out std_logic_vector(3 downto 0);
    
    p_ff1_xmit : out std_logic_vector(11 downto 0);
    p_ff2_xmit : out std_logic_vector(11 downto 0);
    p_ff3_xmit : out std_logic_vector(11 downto 0);
    p_ff4_xmit : out std_logic_vector(3 downto 0);
    p_ff5_xmit : out std_logic_vector(3 downto 0);
    p_ff6_xmit : out std_logic_vector(3 downto 0);
    p_ff7_xmit : out std_logic_vector(11 downto 0);
    p_unused_xmit : out std_logic_vector(3 downto 0);
    p_unused1_xmit : out std_logic_vector(3 downto 0);
    
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

signal myreg1_test_vector : std_logic_vector(31 downto 0);
signal heater_output : slv32_array_t(7 downto 0);

  function and_reduce_array(a : slv32_array_t(7 downto 0)) return std_logic_vector is
    variable ret : std_logic_vector(31 downto 0) := (others => '0');
  begin
    for i in a'range loop
      ret := ret and a(i);
    end loop;
    
    return ret;
  end function and_reduce_array;
                          
  
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
      --K_C2CLink_phy_Rx_rxn                  => n_mgt_z2k,
      --K_C2CLink_phy_Rx_rxp                  => p_mgt_z2k,
      --K_C2CLink_phy_Tx_txn                  => n_mgt_k2z,
      --K_C2CLink_phy_Tx_txp                  => p_mgt_k2z,
      --K_C2CLink_phy_refclk_clk_n            => n_util_clk_chan0,
      --K_C2CLink_phy_refclk_clk_p            => p_util_clk_chan0,
      --clk50Mhz                            => clk_50,
      --K_IO_araddr                         => local_AXI_ReadMOSI(0).address,              
      --K_IO_arprot                         => local_AXI_ReadMOSI(0).protection_type,      
      --K_IO_arready                        => local_AXI_ReadMISO(0).ready_for_address,    
      --K_IO_arvalid                        => local_AXI_ReadMOSI(0).address_valid,        
      --K_IO_awaddr                         => local_AXI_WriteMOSI(0).address,             
      --K_IO_awprot                         => local_AXI_WriteMOSI(0).protection_type,     
      --K_IO_awready                        => local_AXI_WriteMISO(0).ready_for_address,   
      --K_IO_awvalid                        => local_AXI_WriteMOSI(0).address_valid,       
      --K_IO_bready                      => local_AXI_WriteMOSI(0).ready_for_response,  
      --K_IO_bresp                          => local_AXI_WriteMISO(0).response,            
      --K_IO_bvalid                      => local_AXI_WriteMISO(0).response_valid,      
      --K_IO_rdata                          => local_AXI_ReadMISO(0).data,                 
      --K_IO_rready                      => local_AXI_ReadMOSI(0).ready_for_data,       
      --K_IO_rresp                          => local_AXI_ReadMISO(0).response,             
      --K_IO_rvalid                      => local_AXI_ReadMISO(0).data_valid,           
      --K_IO_wdata                          => local_AXI_WriteMOSI(0).data,                
      --K_IO_wready                      => local_AXI_WriteMISO(0).ready_for_data,       
      --K_IO_wstrb                          => local_AXI_WriteMOSI(0).data_write_strobe,   
      --K_IO_wvalid                      => local_AXI_WriteMOSI(0).data_valid,          
      CM_K_INFO_araddr                    => local_AXI_ReadMOSI(1-1).address,              
      CM_K_INFO_arprot                    => local_AXI_ReadMOSI(1-1).protection_type,      
      CM_K_INFO_arready                => local_AXI_ReadMISO(1-1).ready_for_address,    
      CM_K_INFO_arvalid                => local_AXI_ReadMOSI(1-1).address_valid,        
      CM_K_INFO_awaddr                    => local_AXI_WriteMOSI(1-1).address,             
      CM_K_INFO_awprot                    => local_AXI_WriteMOSI(1-1).protection_type,     
      CM_K_INFO_awready                => local_AXI_WriteMISO(1-1).ready_for_address,   
      CM_K_INFO_awvalid                => local_AXI_WriteMOSI(1-1).address_valid,       
      CM_K_INFO_bready                 => local_AXI_WriteMOSI(1-1).ready_for_response,  
      CM_K_INFO_bresp                     => local_AXI_WriteMISO(1-1).response,            
      CM_K_INFO_bvalid                 => local_AXI_WriteMISO(1-1).response_valid,      
      CM_K_INFO_rdata                     => local_AXI_ReadMISO(1-1).data,                 
      CM_K_INFO_rready                 => local_AXI_ReadMOSI(1-1).ready_for_data,       
      CM_K_INFO_rresp                     => local_AXI_ReadMISO(1-1).response,             
      CM_K_INFO_rvalid                 => local_AXI_ReadMISO(1-1).data_valid,           
      CM_K_INFO_wdata                     => local_AXI_WriteMOSI(1-1).data,                
      CM_K_INFO_wready                 => local_AXI_WriteMISO(1-1).ready_for_data,       
      CM_K_INFO_wstrb                     => local_AXI_WriteMOSI(1-1).data_write_strobe,   
      CM_K_INFO_wvalid                 => local_AXI_WriteMOSI(1-1).data_valid,          
      --KINTEX_TCDS_DRP_araddr                     => local_AXI_ReadMOSI(2).address,
      --KINTEX_TCDS_DRP_arprot                     => local_AXI_ReadMOSI(2).protection_type,
      --KINTEX_TCDS_DRP_arready                 => local_AXI_ReadMISO(2).ready_for_address,
      --KINTEX_TCDS_DRP_arvalid                 => local_AXI_ReadMOSI(2).address_valid,
      --KINTEX_TCDS_DRP_awaddr                     => local_AXI_WriteMOSI(2).address,
      --KINTEX_TCDS_DRP_awprot                     => local_AXI_WriteMOSI(2).protection_type,
      --KINTEX_TCDS_DRP_awready                 => local_AXI_WriteMISO(2).ready_for_address,
      --KINTEX_TCDS_DRP_awvalid                 => local_AXI_WriteMOSI(2).address_valid,
      --KINTEX_TCDS_DRP_bready                  => local_AXI_WriteMOSI(2).ready_for_response,
      --KINTEX_TCDS_DRP_bresp                      => local_AXI_WriteMISO(2).response,
      --KINTEX_TCDS_DRP_bvalid                  => local_AXI_WriteMISO(2).response_valid,
      --KINTEX_TCDS_DRP_rdata                      => local_AXI_ReadMISO(2).data,
      --KINTEX_TCDS_DRP_rready                  => local_AXI_ReadMOSI(2).ready_for_data,
      --KINTEX_TCDS_DRP_rresp                      => local_AXI_ReadMISO(2).response,
      --KINTEX_TCDS_DRP_rvalid                  => local_AXI_ReadMISO(2).data_valid,
      --KINTEX_TCDS_DRP_wdata                      => local_AXI_WriteMOSI(2).data,
      --KINTEX_TCDS_DRP_wready                  => local_AXI_WriteMISO(2).ready_for_data,
      --KINTEX_TCDS_DRP_wstrb                      => local_AXI_WriteMOSI(2).data_write_strobe,
      --KINTEX_TCDS_DRP_wvalid                  => local_AXI_WriteMOSI(2).data_valid,
                                          
      KINTEX_TCDS_araddr                         => local_AXI_ReadMOSI(3-2).address,
      KINTEX_TCDS_arprot                         => local_AXI_ReadMOSI(3-2).protection_type,
      KINTEX_TCDS_arready                     => local_AXI_ReadMISO(3-2).ready_for_address,
      KINTEX_TCDS_arvalid                     => local_AXI_ReadMOSI(3-2).address_valid,
      KINTEX_TCDS_awaddr                         => local_AXI_WriteMOSI(3-2).address,
      KINTEX_TCDS_awprot                         => local_AXI_WriteMOSI(3-2).protection_type,
      KINTEX_TCDS_awready                     => local_AXI_WriteMISO(3-2).ready_for_address,
      KINTEX_TCDS_awvalid                     => local_AXI_WriteMOSI(3-2).address_valid,
      KINTEX_TCDS_bready                      => local_AXI_WriteMOSI(3-2).ready_for_response,
      KINTEX_TCDS_bresp                          => local_AXI_WriteMISO(3-2).response,
      KINTEX_TCDS_bvalid                      => local_AXI_WriteMISO(3-2).response_valid,
      KINTEX_TCDS_rdata                          => local_AXI_ReadMISO(3-2).data,
      KINTEX_TCDS_rready                      => local_AXI_ReadMOSI(3-2).ready_for_data,
      KINTEX_TCDS_rresp                          => local_AXI_ReadMISO(3-2).response,
      KINTEX_TCDS_rvalid                      => local_AXI_ReadMISO(3-2).data_valid,
      KINTEX_TCDS_wdata                          => local_AXI_WriteMOSI(3-2).data,
      KINTEX_TCDS_wready                      => local_AXI_WriteMISO(3-2).ready_for_data,
      KINTEX_TCDS_wstrb                          => local_AXI_WriteMOSI(3-2).data_write_strobe,
      KINTEX_TCDS_wvalid                      => local_AXI_WriteMOSI(3-2).data_valid,




      --IPBUS_KINTEX_araddr                 => ext_AXI_ReadMOSI.address,              
      --IPBUS_KINTEX_arburst                => ext_AXI_ReadMOSI.burst_type,
      --IPBUS_KINTEX_arcache                => ext_AXI_ReadMOSI.cache_type,
      --IPBUS_KINTEX_arlen                  => ext_AXI_ReadMOSI.burst_length,
      --IPBUS_KINTEX_arlock(0)              => ext_AXI_ReadMOSI.lock_type,
      --IPBUS_KINTEX_arprot                 => ext_AXI_ReadMOSI.protection_type,      
      --IPBUS_KINTEX_arqos                  => ext_AXI_ReadMOSI.qos,
      --IPBUS_KINTEX_arready(0)             => ext_AXI_ReadMISO.ready_for_address,
      --IPBUS_KINTEX_arregion               => ext_AXI_ReadMOSI.region,
      --IPBUS_KINTEX_arsize                 => ext_AXI_ReadMOSI.burst_size,
      --IPBUS_KINTEX_arvalid(0)             => ext_AXI_ReadMOSI.address_valid,        
      --IPBUS_KINTEX_awaddr                 => ext_AXI_WriteMOSI.address,             
      --IPBUS_KINTEX_awburst                => ext_AXI_WriteMOSI.burst_type,
      --IPBUS_KINTEX_awcache                => ext_AXI_WriteMOSI.cache_type,
      --IPBUS_KINTEX_awlen                  => ext_AXI_WriteMOSI.burst_length,
      --IPBUS_KINTEX_awlock(0)              => ext_AXI_WriteMOSI.lock_type,
      --IPBUS_KINTEX_awprot                 => ext_AXI_WriteMOSI.protection_type,
      --IPBUS_KINTEX_awqos                  => ext_AXI_WriteMOSI.qos,
      --IPBUS_KINTEX_awready(0)             => ext_AXI_WriteMISO.ready_for_address,   
      --IPBUS_KINTEX_awregion               => ext_AXI_WriteMOSI.region,
      --IPBUS_KINTEX_awsize                 => ext_AXI_WriteMOSI.burst_size,
      --IPBUS_KINTEX_awvalid(0)             => ext_AXI_WriteMOSI.address_valid,       
      --IPBUS_KINTEX_bready(0)              => ext_AXI_WriteMOSI.ready_for_response,  
      --IPBUS_KINTEX_bresp                  => ext_AXI_WriteMISO.response,            
      --IPBUS_KINTEX_bvalid(0)              => ext_AXI_WriteMISO.response_valid,      
      --IPBUS_KINTEX_rdata                  => ext_AXI_ReadMISO.data,
      --IPBUS_KINTEX_rlast(0)               => ext_AXI_ReadMISO.last,
      --IPBUS_KINTEX_rready(0)              => ext_AXI_ReadMOSI.ready_for_data,       
      --IPBUS_KINTEX_rresp                  => ext_AXI_ReadMISO.response,             
      --IPBUS_KINTEX_rvalid(0)              => ext_AXI_ReadMISO.data_valid,           
      --IPBUS_KINTEX_wdata                  => ext_AXI_WriteMOSI.data,
      --IPBUS_KINTEX_wlast(0)               => ext_AXI_WriteMOSI.last,
      --IPBUS_KINTEX_wready(0)              => ext_AXI_WriteMISO.ready_for_data,       
      --IPBUS_KINTEX_wstrb                  => ext_AXI_WriteMOSI.data_write_strobe,   
      --IPBUS_KINTEX_wvalid(0)              => ext_AXI_WriteMOSI.data_valid,          
      reset_n                             => locked_clk200,--reset,
      --K_C2CLink_aurora_do_cc                => C2CLink_aurora_do_cc,               
      --K_C2CLink_axi_c2c_config_error_out    => C2CLink_axi_c2c_config_error_out,   
      --K_C2CLink_axi_c2c_link_status_out     => C2CLink_axi_c2c_link_status_out,    
      --K_C2CLink_axi_c2c_multi_bit_error_out => C2CLink_axi_c2c_multi_bit_error_out,
      --K_C2CLink_phy_gt_pll_lock             => C2CLink_phy_gt_pll_lock,            
      --K_C2CLink_phy_hard_err                => C2CLink_phy_hard_err,               
      --K_C2CLink_phy_lane_up                 => C2CLink_phy_lane_up,                
      --K_C2CLink_phy_link_reset_out          => C2CLink_phy_link_reset_out,         
      --K_C2CLink_phy_mmcm_not_locked_out     => C2CLink_phy_mmcm_not_locked_out,    
      --K_C2CLink_phy_power_down              => '0',
      --K_C2CLink_phy_soft_err                => C2CLink_phy_soft_err,               
      KINTEX_SYS_MGMT_sda                 =>k_fpga_i2c_sda,
      KINTEX_SYS_MGMT_scl                 =>k_fpga_i2c_scl
);

 myreg1_test_vector <= and_reduce_array(heater_output);
  RGB_pwm_1: entity work.RGB_pwm
    generic map (
      CLKFREQ => 200000000,
      RGBFREQ => 1000)
    port map (
      clk        => clk_200,
      redcount   => myreg1_test_vector( 7 downto  0),
      greencount => myreg1_test_vector(15 downto  8),
      bluecount  => myreg1_test_vector(23 downto 16),
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

  --K_IO_interface_1: entity work.K_IO_interface
  --  port map (
  --    clk_axi         => AXI_CLK,
  --    reset_axi_n     => AXI_RST_N,
  --    slave_readMOSI  => local_AXI_readMOSI(0),
  --    slave_readMISO  => local_AXI_readMISO(0),
  --    slave_writeMOSI => local_AXI_writeMOSI(0),
  --    slave_writeMISO => local_AXI_writeMISO(0),
  --    Mon.C2C.CONFIG_ERR      => C2CLink_axi_c2c_config_error_out,
  --    Mon.C2C.DO_CC           => C2CLink_aurora_do_cc,
  --    Mon.C2C.GT_PLL_LOCK     => C2CLink_phy_gt_pll_lock,
  --    Mon.C2C.HARD_ERR        => C2CLink_phy_hard_err,
  --    Mon.C2C.LANE_UP         => C2CLink_phy_lane_up(0),
  --    Mon.C2C.LINK_RESET      => C2CLink_phy_link_reset_out,
  --    Mon.C2C.LINK_STATUS     => C2CLink_axi_c2c_link_status_out,
  --    Mon.C2C.MMCM_NOT_LOCKED => C2CLink_phy_mmcm_not_locked_out,
  --    Mon.C2C.MULTIBIT_ERR    => C2CLink_axi_c2c_multi_bit_error_out,
  --    Mon.C2C.SOFT_ERR        => C2CLink_phy_soft_err,
  --    Mon.CLK_200_LOCKED      => locked_clk200,
  --    Mon.BRAM.RD_DATA        => BRAM_RD_DATA,
  --    Ctrl.RGB.R              => led_red_local,
  --    Ctrl.RGB.G              => led_green_local,
  --    Ctrl.RGB.B              => led_blue_local,
  --    Ctrl.BRAM.WRITE         => BRAM_WRITE,
  --    Ctrl.BRAM.ADDR          => BRAM_ADDR,
  --    Ctrl.BRAM.WR_DATA       => BRAM_WR_DATA
  --    );

  CM_K_info_1: entity work.CM_K_info
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(1-1),
      readMISO    => local_AXI_ReadMISO(1-1),
      writeMOSI   => local_AXI_WriteMOSI(1-1),
      writeMISO   => local_AXI_WriteMISO(1-1));

  TCDS_1: entity work.TCDS
    port map (
      clk_axi              => AXI_CLK,
      clk_200              => clk_200,
      reset_axi_n          => AXI_RST_N,
      readMOSI             => local_AXI_readMOSI(3-2),
      readMISO             => local_AXI_readMISO(3-2),
      writeMOSI            => local_AXI_writeMOSI(3-2),
      writeMISO            => local_AXI_writeMISO(3-2),
      --DRP_readMOSI         => local_AXI_readMOSI(2),
      --DRP_readMISO         => local_AXI_readMISO(2),
      --DRP_writeMOSI        => local_AXI_writeMOSI(2),
      --DRP_writeMISO        => local_AXI_writeMISO(2),
      --refclk0_p => p_clk0_chan0,
      --refclk0_n => n_clk0_chan0,
      --refclk1_p => p_clk1_chan0,
      --refclk1_n => n_clk1_chan0,  
      --tx_p     => p_atca_tts_out  ,
      --tx_n     => n_atca_tts_out  ,
      --rx_p     => p_atca_ttc_in   ,
      --rx_n     => n_atca_ttc_in   ,
      heater_output => heater_output,
      TxRx_clk_sel => '0'       );

  IBERT: entity work.example_ibert_ultrascale_gth_0
    port map (
      --gth_sysclkp_i => p_clk_200,
      --gth_sysclkn_i => n_clk_200,

      --quad 127
      gty_txn_o(0) => n_ff7_xmit(11),
      gty_txn_o(1) => n_ff7_xmit(10),
      gty_txn_o(2) => n_ff7_xmit(9),
      gty_txn_o(3) => n_ff7_xmit(8),
      --quad 128
      gty_txn_o(4) => n_ff7_xmit(7),
      gty_txn_o(5) => n_ff7_xmit(6),
      gty_txn_o(6) => n_ff7_xmit(5),
      gty_txn_o(7) => n_ff7_xmit(4),
      --quad 129
      gty_txn_o(8) => n_ff7_xmit(3),
      gty_txn_o(9) => n_ff7_xmit(2),
      gty_txn_o(10) => n_ff7_xmit(1),
      gty_txn_o(11) => n_ff7_xmit(0),
      --quad 130
      gty_txn_o(12) => n_unused_xmit(0),
      gty_txn_o(13) => n_unused_xmit(1),
      gty_txn_o(14) => n_unused_xmit(2),
      gty_txn_o(15) => n_unused_xmit(3),
      --quad 131
      gty_txn_o(16) => n_ff6_xmit(0),
      gty_txn_o(17) => n_ff6_xmit(1),
      gty_txn_o(18) => n_ff6_xmit(2),
      gty_txn_o(19) => n_ff6_xmit(3),
      --quad 132
      gty_txn_o(20) => n_ff5_xmit(0),
      gty_txn_o(21) => n_ff5_xmit(1),
      gty_txn_o(22) => n_ff5_xmit(2),
      gty_txn_o(23) => n_ff5_xmit(3),
      --quad 133
      gty_txn_o(24) => n_ff4_xmit(0),
      gty_txn_o(25) => n_ff4_xmit(1),
      gty_txn_o(26) => n_ff4_xmit(2),
      gty_txn_o(27) => n_ff4_xmit(3),
      --quad 134
      gty_txn_o(28) => n_mgt_k2v(0),
      gty_txn_o(29) => n_mgt_k2v(1),
      gty_txn_o(30) => n_mgt_k2v(2),
      gty_txn_o(31) => n_mgt_k2v(3),

      --quad 127
      gty_txp_o(0) => p_ff7_xmit(11),
      gty_txp_o(1) => p_ff7_xmit(10),
      gty_txp_o(2) => p_ff7_xmit(9),
      gty_txp_o(3) => p_ff7_xmit(8),
      --quad 128
      gty_txp_o(4) => p_ff7_xmit(7),
      gty_txp_o(5) => p_ff7_xmit(6),
      gty_txp_o(6) => p_ff7_xmit(5),
      gty_txp_o(7) => p_ff7_xmit(4),
      --quad 129
      gty_txp_o(8) => p_ff7_xmit(3),
      gty_txp_o(9) => p_ff7_xmit(2),
      gty_txp_o(10) => p_ff7_xmit(1),
      gty_txp_o(11) => p_ff7_xmit(0),
      --quad 130
      gty_txp_o(12) => p_unused_xmit(0),
      gty_txp_o(13) => p_unused_xmit(1),
      gty_txp_o(14) => p_unused_xmit(2),
      gty_txp_o(15) => p_unused_xmit(3),
      --quad 131
      gty_txp_o(16) => p_ff6_xmit(0),
      gty_txp_o(17) => p_ff6_xmit(1),
      gty_txp_o(18) => p_ff6_xmit(2),
      gty_txp_o(19) => p_ff6_xmit(3),
      --quad 132
      gty_txp_o(20) => p_ff5_xmit(0),
      gty_txp_o(21) => p_ff5_xmit(1),
      gty_txp_o(22) => p_ff5_xmit(2),
      gty_txp_o(23) => p_ff5_xmit(3),
      --quad 133
      gty_txp_o(24) => p_ff4_xmit(0),
      gty_txp_o(25) => p_ff4_xmit(1),
      gty_txp_o(26) => p_ff4_xmit(2),
      gty_txp_o(27) => p_ff4_xmit(3),
      --quad 134
      gty_txp_o(28) => p_mgt_k2v(0),
      gty_txp_o(29) => p_mgt_k2v(1),
      gty_txp_o(30) => p_mgt_k2v(2),
      gty_txp_o(31) => p_mgt_k2v(3),
      
      --quad 127
      gty_rxn_i(0) => n_ff7_recv(11),
      gty_rxn_i(1) => n_ff7_recv(10),
      gty_rxn_i(2) => n_ff7_recv(9),
      gty_rxn_i(3) => n_ff7_recv(8),
      --quad 128
      gty_rxn_i(4) => n_ff7_recv(7),
      gty_rxn_i(5) => n_ff7_recv(6),
      gty_rxn_i(6) => n_ff7_recv(5),
      gty_rxn_i(7) => n_ff7_recv(4),
      --quad 129
      gty_rxn_i(8) => n_ff7_recv(3),
      gty_rxn_i(9) => n_ff7_recv(2),
      gty_rxn_i(10) => n_ff7_recv(1),
      gty_rxn_i(11) => n_ff7_recv(0),
      --quad 130
      gty_rxn_i(12) => n_unused_recv(0),
      gty_rxn_i(13) => n_unused_recv(1),
      gty_rxn_i(14) => n_unused_recv(2),
      gty_rxn_i(15) => n_unused_recv(3),
      --quad 131
      gty_rxn_i(16) => n_ff6_recv(0),
      gty_rxn_i(17) => n_ff6_recv(1),
      gty_rxn_i(18) => n_ff6_recv(2),
      gty_rxn_i(19) => n_ff6_recv(3),
      --quad 132
      gty_rxn_i(20) => n_ff5_recv(0),
      gty_rxn_i(21) => n_ff5_recv(1),
      gty_rxn_i(22) => n_ff5_recv(2),
      gty_rxn_i(23) => n_ff5_recv(3),
      --quad 133
      gty_rxn_i(24) => n_ff4_recv(0),
      gty_rxn_i(25) => n_ff4_recv(1),
      gty_rxn_i(26) => n_ff4_recv(2),
      gty_rxn_i(27) => n_ff4_recv(3),
      --quad 134
      gty_rxn_i(28) => n_mgt_v2k(0),
      gty_rxn_i(29) => n_mgt_v2k(1),
      gty_rxn_i(30) => n_mgt_v2k(2),
      gty_rxn_i(31) => n_mgt_v2k(3),
 
      --quad 127
      gty_rxp_i(0) => p_ff7_recv(11),
      gty_rxp_i(1) => p_ff7_recv(10),
      gty_rxp_i(2) => p_ff7_recv(9),
      gty_rxp_i(3) => p_ff7_recv(8),
      --quad 128
      gty_rxp_i(4) => p_ff7_recv(7),
      gty_rxp_i(5) => p_ff7_recv(6),
      gty_rxp_i(6) => p_ff7_recv(5),
      gty_rxp_i(7) => p_ff7_recv(4),
      --quad 129
      gty_rxp_i(8) => p_ff7_recv(3),
      gty_rxp_i(9) => p_ff7_recv(2),
      gty_rxp_i(10) => p_ff7_recv(1),
      gty_rxp_i(11) => p_ff7_recv(0),
      --quad 130
      gty_rxp_i(12) => p_unused_recv(0),
      gty_rxp_i(13) => p_unused_recv(1),
      gty_rxp_i(14) => p_unused_recv(2),
      gty_rxp_i(15) => p_unused_recv(3),
      --quad 131
      gty_rxp_i(16) => p_ff6_recv(0),
      gty_rxp_i(17) => p_ff6_recv(1),
      gty_rxp_i(18) => p_ff6_recv(2),
      gty_rxp_i(19) => p_ff6_recv(3),
      --quad 132
      gty_rxp_i(20) => p_ff5_recv(0),
      gty_rxp_i(21) => p_ff5_recv(1),
      gty_rxp_i(22) => p_ff5_recv(2),
      gty_rxp_i(23) => p_ff5_recv(3),
      --quad 133
      gty_rxp_i(24) => p_ff4_recv(0),
      gty_rxp_i(25) => p_ff4_recv(1),
      gty_rxp_i(26) => p_ff4_recv(2),
      gty_rxp_i(27) => p_ff4_recv(3),
      --quad 134
      gty_rxp_i(28) => p_mgt_v2k(0),
      gty_rxp_i(29) => p_mgt_v2k(1),
      gty_rxp_i(30) => p_mgt_v2k(2),
      gty_rxp_i(31) => p_mgt_v2k(3),     
      
      gty_refclk0p_i(0) => p_clk0_chan4,
      gty_refclk0p_i(1) => p_clk0_chan5,
      gty_refclk0p_i(2) => p_clk0_chan6,
      gty_refclk0p_i(3) => p_util_clk_chan1,

      gty_refclk0n_i(0) => n_clk0_chan4,
      gty_refclk0n_i(1) => n_clk0_chan5,
      gty_refclk0n_i(2) => n_clk0_chan6,
      gty_refclk0n_i(3) => n_util_clk_chan1,

      gty_refclk1p_i(0) => p_clk1_chan4,
      gty_refclk1p_i(1) => p_clk1_chan5,
      gty_refclk1p_i(2) => p_clk1_chan6,
      gty_refclk1p_i(3) => open,

      gty_refclk1n_i(0) => n_clk1_chan4,
      gty_refclk1n_i(1) => n_clk1_chan5,
      gty_refclk1n_i(2) => n_clk1_chan6,
      gty_refclk1n_i(3) => open,

      gth_refclk0p_i(0) => p_clk0_chan0,
      gth_refclk0p_i(1) => p_clk0_chan1,
      gth_refclk0p_i(2) => p_clk0_chan2,
      gth_refclk0n_i(0) => n_clk0_chan0,
      gth_refclk0n_i(1) => n_clk0_chan1,
      gth_refclk0n_i(2) => n_clk0_chan2,
      
      gth_refclk1p_i(0) => p_clk1_chan0,
      gth_refclk1p_i(1) => p_clk1_chan1,
      gth_refclk1p_i(2) => p_clk1_chan2,
      gth_refclk1n_i(0) => n_clk1_chan0,
      gth_refclk1n_i(1) => n_clk1_chan1,
      gth_refclk1n_i(2) => n_clk1_chan2,
      
      --quad 225
      gth_txn_o(0) => n_ff3_xmit(0),
      gth_txn_o(1) => n_ff3_xmit(1),
      gth_txn_o(2) => n_ff3_xmit(2),
      gth_txn_o(3) => n_ff3_xmit(3),
      --quad 226
      gth_txn_o(4) => n_ff3_xmit(4),
      gth_txn_o(5) => n_ff3_xmit(5),
      gth_txn_o(6) => n_ff3_xmit(6),
      gth_txn_o(7) => n_ff3_xmit(7),
      --quad 227
      gth_txn_o(8) => n_ff3_xmit(8),
      gth_txn_o(9) => n_ff3_xmit(9),
      gth_txn_o(10) => n_ff3_xmit(10),
      gth_txn_o(11) => n_ff3_xmit(11),
      --quad 228
      gth_txn_o(12) => n_ff2_xmit(0),
      gth_txn_o(13) => n_ff2_xmit(1),
      gth_txn_o(14) => n_ff2_xmit(2),
      gth_txn_o(15) => n_ff2_xmit(3),
      --quad 229
      gth_txn_o(16) => n_ff2_xmit(4),
      gth_txn_o(17) => n_ff2_xmit(5),
      gth_txn_o(18) => n_ff2_xmit(6),
      gth_txn_o(19) => n_ff2_xmit(7),
      --quad 230
      gth_txn_o(20) => n_ff2_xmit(8),
      gth_txn_o(21) => n_ff2_xmit(9),
      gth_txn_o(22) => n_ff2_xmit(10),
      gth_txn_o(23) => n_ff2_xmit(11),
      --quad 231
      gth_txn_o(24) => n_ff1_xmit(0),
      gth_txn_o(25) => n_ff1_xmit(1),
      gth_txn_o(26) => n_ff1_xmit(2),
      gth_txn_o(27) => n_ff1_xmit(3),
      --quad 232
      gth_txn_o(28) => n_ff1_xmit(4),
      gth_txn_o(29) => n_ff1_xmit(5),
      gth_txn_o(30) => n_ff1_xmit(6),
      gth_txn_o(31) => n_ff1_xmit(7),
      --quad 233
      gth_txn_o(32) => n_ff1_xmit(8),
      gth_txn_o(33) => n_ff1_xmit(9),
      gth_txn_o(34) => n_ff1_xmit(10),
      gth_txn_o(35) => n_ff1_xmit(11),
      --quad 234
      gth_txn_o(36) => n_unused1_xmit(0),
      gth_txn_o(37) => n_unused1_xmit(1),
      gth_txn_o(38) => n_unused1_xmit(2),
      gth_txn_o(39) => n_unused1_xmit(3),

     --quad 225
      gth_txp_o(0) => p_ff3_xmit(0),
      gth_txp_o(1) => p_ff3_xmit(1),
      gth_txp_o(2) => p_ff3_xmit(2),
      gth_txp_o(3) => p_ff3_xmit(3),
      --quad 226
      gth_txp_o(4) => p_ff3_xmit(4),
      gth_txp_o(5) => p_ff3_xmit(5),
      gth_txp_o(6) => p_ff3_xmit(6),
      gth_txp_o(7) => p_ff3_xmit(7),
      --quad 227
      gth_txp_o(8) => p_ff3_xmit(8),
      gth_txp_o(9) => p_ff3_xmit(9),
      gth_txp_o(10) => p_ff3_xmit(10),
      gth_txp_o(11) => p_ff3_xmit(11),
      --quad 228
      gth_txp_o(12) => p_ff2_xmit(0),
      gth_txp_o(13) => p_ff2_xmit(1),
      gth_txp_o(14) => p_ff2_xmit(2),
      gth_txp_o(15) => p_ff2_xmit(3),
      --quad 229
      gth_txp_o(16) => p_ff2_xmit(4),
      gth_txp_o(17) => p_ff2_xmit(5),
      gth_txp_o(18) => p_ff2_xmit(6),
      gth_txp_o(19) => p_ff2_xmit(7),
      --quad 230
      gth_txp_o(20) => p_ff2_xmit(8),
      gth_txp_o(21) => p_ff2_xmit(9),
      gth_txp_o(22) => p_ff2_xmit(10),
      gth_txp_o(23) => p_ff2_xmit(11),
      --quad 231
      gth_txp_o(24) => p_ff1_xmit(0),
      gth_txp_o(25) => p_ff1_xmit(1),
      gth_txp_o(26) => p_ff1_xmit(2),
      gth_txp_o(27) => p_ff1_xmit(3),
      --quad 232
      gth_txp_o(28) => p_ff1_xmit(4),
      gth_txp_o(29) => p_ff1_xmit(5),
      gth_txp_o(30) => p_ff1_xmit(6),
      gth_txp_o(31) => p_ff1_xmit(7),
      --quad 233
      gth_txp_o(32) => p_ff1_xmit(8),
      gth_txp_o(33) => p_ff1_xmit(9),
      gth_txp_o(34) => p_ff1_xmit(10),
      gth_txp_o(35) => p_ff1_xmit(11),
      --quad 234
      gth_txp_o(36) => p_unused1_xmit(0),
      gth_txp_o(37) => p_unused1_xmit(1),
      gth_txp_o(38) => p_unused1_xmit(2),
      gth_txp_o(39) => p_unused1_xmit(3),
      
      --quad 225
      gth_rxn_i(0) => n_ff3_recv(0),
      gth_rxn_i(1) => n_ff3_recv(1),
      gth_rxn_i(2) => n_ff3_recv(2),
      gth_rxn_i(3) => n_ff3_recv(3),
      --quad 226
      gth_rxn_i(4) => n_ff3_recv(4),
      gth_rxn_i(5) => n_ff3_recv(5),
      gth_rxn_i(6) => n_ff3_recv(6),
      gth_rxn_i(7) => n_ff3_recv(7),
      --quad 227
      gth_rxn_i(8) => n_ff3_recv(8),
      gth_rxn_i(9) => n_ff3_recv(9),
      gth_rxn_i(10) => n_ff3_recv(10),
      gth_rxn_i(11) => n_ff3_recv(11),
      --quad 228
      gth_rxn_i(12) => n_ff2_recv(0),
      gth_rxn_i(13) => n_ff2_recv(1),
      gth_rxn_i(14) => n_ff2_recv(2),
      gth_rxn_i(15) => n_ff2_recv(3),
      --quad 229
      gth_rxn_i(16) => n_ff2_recv(4),
      gth_rxn_i(17) => n_ff2_recv(5),
      gth_rxn_i(18) => n_ff2_recv(6),
      gth_rxn_i(19) => n_ff2_recv(7),
      --quad 230
      gth_rxn_i(20) => n_ff2_recv(8),
      gth_rxn_i(21) => n_ff2_recv(9),
      gth_rxn_i(22) => n_ff2_recv(10),
      gth_rxn_i(23) => n_ff2_recv(11),
      --quad 231
      gth_rxn_i(24) => n_ff1_recv(0),
      gth_rxn_i(25) => n_ff1_recv(1),
      gth_rxn_i(26) => n_ff1_recv(2),
      gth_rxn_i(27) => n_ff1_recv(3),
      --quad 232
      gth_rxn_i(28) => n_ff1_recv(4),
      gth_rxn_i(29) => n_ff1_recv(5),
      gth_rxn_i(30) => n_ff1_recv(6),
      gth_rxn_i(31) => n_ff1_recv(7),
      --quad 233
      gth_rxn_i(32) => n_ff1_recv(8),
      gth_rxn_i(33) => n_ff1_recv(9),
      gth_rxn_i(34) => n_ff1_recv(10),
      gth_rxn_i(35) => n_ff1_recv(11),
      --quad 234
      gth_rxn_i(36) => n_unused1_recv(0),
      gth_rxn_i(37) => n_unused1_recv(1),
      gth_rxn_i(38) => n_unused1_recv(2),
      gth_rxn_i(39) => n_unused1_recv(3),
      
     --quad 225
      gth_rxp_i(0) => p_ff3_recv(0),
      gth_rxp_i(1) => p_ff3_recv(1),
      gth_rxp_i(2) => p_ff3_recv(2),
      gth_rxp_i(3) => p_ff3_recv(3),
      --quad 226
      gth_rxp_i(4) => p_ff3_recv(4),
      gth_rxp_i(5) => p_ff3_recv(5),
      gth_rxp_i(6) => p_ff3_recv(6),
      gth_rxp_i(7) => p_ff3_recv(7),
      --quad 227
      gth_rxp_i(8) => p_ff3_recv(8),
      gth_rxp_i(9) => p_ff3_recv(9),
      gth_rxp_i(10) => p_ff3_recv(10),
      gth_rxp_i(11) => p_ff3_recv(11),
      --quad 228
      gth_rxp_i(12) => p_ff2_recv(0),
      gth_rxp_i(13) => p_ff2_recv(1),
      gth_rxp_i(14) => p_ff2_recv(2),
      gth_rxp_i(15) => p_ff2_recv(3),
      --quad 229
      gth_rxp_i(16) => p_ff2_recv(4),
      gth_rxp_i(17) => p_ff2_recv(5),
      gth_rxp_i(18) => p_ff2_recv(6),
      gth_rxp_i(19) => p_ff2_recv(7),
      --quad 230
      gth_rxp_i(20) => p_ff2_recv(8),
      gth_rxp_i(21) => p_ff2_recv(9),
      gth_rxp_i(22) => p_ff2_recv(10),
      gth_rxp_i(23) => p_ff2_recv(11),
      --quad 231
      gth_rxp_i(24) => p_ff1_recv(0),
      gth_rxp_i(25) => p_ff1_recv(1),
      gth_rxp_i(26) => p_ff1_recv(2),
      gth_rxp_i(27) => p_ff1_recv(3),
      --quad 232
      gth_rxp_i(28) => p_ff1_recv(4),
      gth_rxp_i(29) => p_ff1_recv(5),
      gth_rxp_i(30) => p_ff1_recv(6),
      gth_rxp_i(31) => p_ff1_recv(7),
      --quad 233
      gth_rxp_i(32) => p_ff1_recv(8),
      gth_rxp_i(33) => p_ff1_recv(9),
      gth_rxp_i(34) => p_ff1_recv(10),
      gth_rxp_i(35) => p_ff1_recv(11),
      --quad 234
      gth_rxp_i(36) => p_unused1_recv(0),
      gth_rxp_i(37) => p_unused1_recv(1),
      gth_rxp_i(38) => p_unused1_recv(2),
      gth_rxp_i(39) => p_unused1_recv(3)                 
      
     );
  

end architecture structure;
