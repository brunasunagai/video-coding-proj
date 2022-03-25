library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--use work.type_pack.all;

entity sad_2x2_parallel is 
port(
--    pixels_O: in input_line;
--    pixels_R: in input_line;
	 ori0, ori1, ori2, ori3: in std_logic_vector(7 downto 0); -- novo
	 ref0, ref1, ref2, ref3: in std_logic_vector(7 downto 0); -- novo
    sad_out: out std_logic_vector(10 downto 0)
);
end sad_2x2_parallel;

architecture arch_sad of sad_2x2_parallel is 

-- Components 
component adder is 
 generic (N: integer);
 port(
 		A, B: in std_logic_vector(N-1 downto 0);
 		S: out std_logic_vector(N downto 0)
 );
 end component; 


-- Signals
signal neg_ref_0: std_logic_vector(7 downto 0); -- novo
signal neg_ref_1: std_logic_vector(7 downto 0); -- novo
signal neg_ref_2: std_logic_vector(7 downto 0); -- novo
signal neg_ref_3: std_logic_vector(7 downto 0); -- novo

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

--signal xori0: std_logic_vector(8 downto 0);
--signal xori1: std_logic_vector(8 downto 0);
--signal xori2: std_logic_vector(8 downto 0);
--signal xori3: std_logic_vector(8 downto 0); 

signal sum_after_10: std_logic_vector(10 downto 0);

begin 

neg_ref_0 <= std_logic_vector(resize(-signed(ref0),8));
neg_ref_1 <= std_logic_vector(resize(-signed(ref1),8));
neg_ref_2 <= std_logic_vector(resize(-signed(ref2),8));
neg_ref_3 <= std_logic_vector(resize(-signed(ref3),8));

--xori0 <= ori0(ori0'left) & ori0;
--xori1 <= ori0(ori1'left) & ori1;
--xori2 <= ori0(ori2'left) & ori2;
--xori3 <= ori0(ori3'left) & ori3;

SUB0: adder generic map (8) port map (ori0,neg_ref_0,sub_0);
SUB1: adder generic map (8) port map (ori1,neg_ref_1,sub_1);
SUB2: adder generic map (8) port map (ori2,neg_ref_2,sub_2);
SUB3: adder generic map (8) port map (ori3,neg_ref_3,sub_3);

abs_0 <= std_logic_vector(abs(signed(sub_0)));
abs_1 <= std_logic_vector(abs(signed(sub_1)));
abs_2 <= std_logic_vector(abs(signed(sub_2)));
abs_3 <= std_logic_vector(abs(signed(sub_3)));

SUB4: adder generic map (9) port map (abs_0,abs_1,sum_01); 
SUB5: adder generic map (9) port map (abs_2,abs_3,sum_23); 

SUB6: adder generic map (10) port map (sum_01,sum_23,sum_after_10);

sad_out <= sum_after_10;

end arch_sad;