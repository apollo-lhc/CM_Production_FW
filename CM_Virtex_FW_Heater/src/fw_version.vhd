library ieee;
use ieee.std_logic_1164.all;
-- timestamp package
package FW_TIMESTAMP is
  constant TS_CENT     : std_logic_vector(7 downto 0) := x"20";
  constant TS_YEAR     : std_logic_vector(7 downto 0) := x"21";
  constant TS_MONTH    : std_logic_vector(7 downto 0) := x"02";
  constant TS_DAY      : std_logic_vector(7 downto 0) := x"12";
  constant TS_HOUR     : std_logic_vector(7 downto 0) := x"14";
  constant TS_MIN      : std_logic_vector(7 downto 0) := x"08";
  constant TS_SEC      : std_logic_vector(7 downto 0) := x"56";
end package FW_TIMESTAMP;
 
 
library ieee;
use ieee.std_logic_1164.all;
-- fw version package
package FW_VERSION is
  constant FW_HASH_VALID : std_logic                      := '1';
  constant FW_HASH_1     : std_logic_vector(31 downto  0) := x"a3f4a67b";
  constant FW_HASH_2     : std_logic_vector(31 downto  0) := x"f544702d";
  constant FW_HASH_3     : std_logic_vector(31 downto  0) := x"4f569a3f";
  constant FW_HASH_4     : std_logic_vector(31 downto  0) := x"57d2ac7a";
  constant FW_HASH_5     : std_logic_vector(31 downto  0) := x"96490a4c";
end package FW_VERSION;
