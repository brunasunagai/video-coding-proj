library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity full_adder is
  port (
    bit1  : in std_logic;
    bit2  : in std_logic;
    i_carry : in std_logic;
    sum   : out std_logic;
    o_carry : out std_logic
    );
end full_adder;
 
architecture rtl of full_adder is

signal WIRE_1 : std_logic;
signal WIRE_2 : std_logic;
signal WIRE_3 : std_logic;
   
begin
 
  WIRE_1 <= bit1 xor bit2;
  WIRE_2 <= WIRE_1 and i_carry;
  WIRE_3 <= bit1 and bit2;
 
  sum   <= WIRE_1 xor i_carry;
  o_carry <= WIRE_2 or WIRE_3;
 
end rtl;