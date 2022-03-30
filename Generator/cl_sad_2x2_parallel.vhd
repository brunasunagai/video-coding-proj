library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.type_pack.all;

entity cl_sad_2x2_parallel is 
port(
    ori: in input_4;
    ref: in input_4;
    sad_out: out std_logic_vector(10 downto 0)
);
end cl_sad_2x2_parallel;

architecture arch_sad of cl_sad_2x2_parallel is 

-- Components 
component carry_lookahead_adder is 
 generic (N : natural := 8);
 port (
     add1  : in std_logic_vector(N-1 downto 0);
     add2  : in std_logic_vector(N-1 downto 0);
     result   : out std_logic_vector(N downto 0)
 );
 end component; 


-- Signals
signal neg_ref_0: std_logic_vector(7 downto 0);
signal neg_ref_1: std_logic_vector(7 downto 0);
signal neg_ref_2: std_logic_vector(7 downto 0);
signal neg_ref_3: std_logic_vector(7 downto 0);

signal sub_0: std_logic_vector(8 downto 0);
signal sub_1: std_logic_vector(8 downto 0);
signal sub_2: std_logic_vector(8 downto 0);
signal sub_3: std_logic_vector(8 downto 0);

signal abs_0: std_logic_vector(8 downto 0);
signal abs_1: std_logic_vector(8 downto 0);
signal abs_2: std_logic_vector(8 downto 0);
signal abs_3: std_logic_vector(8 downto 0);

signal sum_01: std_logic_vector(9 downto 0);
signal sum_23: std_logic_vector(9 downto 0);

signal sum_after_10: std_logic_vector(10 downto 0);


begin

neg_ref_0 <= std_logic_vector(resize(-signed(ref(0)),8));
neg_ref_1 <= std_logic_vector(resize(-signed(ref(1)),8));
neg_ref_2 <= std_logic_vector(resize(-signed(ref(2)),8));
neg_ref_3 <= std_logic_vector(resize(-signed(ref(3)),8));

abs_0 <= std_logic_vector(abs(signed(sub_0)));
abs_1 <= std_logic_vector(abs(signed(sub_1)));
abs_2 <= std_logic_vector(abs(signed(sub_2)));
abs_3 <= std_logic_vector(abs(signed(sub_3)));


SUB0: carry_lookahead_adder generic map (8) port map (ori(0),neg_ref_0,sub_0);
SUB1: carry_lookahead_adder generic map (8) port map (ori(1),neg_ref_1,sub_1);
SUB2: carry_lookahead_adder generic map (8) port map (ori(2),neg_ref_2,sub_2);
SUB3: carry_lookahead_adder generic map (8) port map (ori(3),neg_ref_3,sub_3);

ADD00: carry_lookahead_adder generic map (9) port map (abs_0,abs_1,sum_01);
ADD01: carry_lookahead_adder generic map (9) port map (abs_2,abs_3,sum_23);

ADD10: carry_lookahead_adder generic map (10) port map (sum_01,sum_23,sum_after_10);


sad_out <= sum_after_10;

end arch_sad;