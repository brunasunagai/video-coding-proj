library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity adder is 
generic (N: integer);
port(
		A, B: in std_logic_vector(N-1 downto 0);
		S: out std_logic_vector(N downto 0)
);
end adder;

architecture arch_add of adder is
begin 
	
	S <= A + B;

end arch_add;
