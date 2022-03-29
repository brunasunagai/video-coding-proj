library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package type_pack is
    
    constant bit_width: natural := 8; 
    type input_2 is array (0 to 1) of std_logic_vector(bit_width-1 downto 0);
    type input_4 is array (0 to 3) of std_logic_vector(bit_width-1 downto 0);
    type input_8 is array (0 to 7) of std_logic_vector(bit_width-1 downto 0);
    type input_16 is array (0 to 15) of std_logic_vector(bit_width-1 downto 0);
    type input_64 is array (0 to 63) of std_logic_vector(bit_width-1 downto 0);

end type_pack;