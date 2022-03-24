library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package type_pack is
    
    constant bit_width: natural := 8; 
    type input_line is array (0 to 15) of std_logic_vector(7 downto 0);

end type_pack;