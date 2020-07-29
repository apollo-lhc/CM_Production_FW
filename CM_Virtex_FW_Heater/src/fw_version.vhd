library ieee;
use ieee.std_logic_1164.all;
-- timestamp package
package FW_TIMESTAMP is
  constant TS_CENT     : std_logic_vector(7 downto 0) := x"20";
  constant TS_YEAR     : std_logic_vector(7 downto 0) := x"20";
  constant TS_MONTH    : std_logic_vector(7 downto 0) := x"06";
  constant TS_DAY      : std_logic_vector(7 downto 0) := x"20";
  constant TS_HOUR     : std_logic_vector(7 downto 0) := x"19";
  constant TS_MIN      : std_logic_vector(7 downto 0) := x"37";
  constant TS_SEC      : std_logic_vector(7 downto 0) := x"58";
end package FW_TIMESTAMP;
 
 
library ieee;
use ieee.std_logic_1164.all;
-- fw version package
package FW_VERSION is
  constant FW_HASH_VALID : std_logic                      := '1';
  constant FW_HASH_1     : std_logic_vector(31 downto  0) := x"11ccca15";
  constant FW_HASH_2     : std_logic_vector(31 downto  0) := x"5913c99f";
  constant FW_HASH_3     : std_logic_vector(31 downto  0) := x"38eed01c";
  constant FW_HASH_4     : std_logic_vector(31 downto  0) := x"ff30a10f";
  constant FW_HASH_5     : std_logic_vector(31 downto  0) := x"e39abb7a";
end package FW_VERSION;
