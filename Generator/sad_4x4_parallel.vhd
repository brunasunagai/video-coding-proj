library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.type_pack.all;

entity sad_4x4_parallel is 
port(
    ori: in input_16;
    ref: in input_16;
    sad_out: out std_logic_vector(12 downto 0)
);
end sad_4x4_parallel;

architecture arch_sad of sad_4x4_parallel is 

-- Components 
component adder is 
 generic (N: integer);
 port(
 		A, B: in std_logic_vector(N-1 downto 0);
 		S: out std_logic_vector(N downto 0)
 );
 end component; 


-- Signals
signal neg_ref_0: std_logic_vector(7 downto 0);
signal neg_ref_1: std_logic_vector(7 downto 0);
signal neg_ref_2: std_logic_vector(7 downto 0);
signal neg_ref_3: std_logic_vector(7 downto 0);
signal neg_ref_4: std_logic_vector(7 downto 0);
signal neg_ref_5: std_logic_vector(7 downto 0);
signal neg_ref_6: std_logic_vector(7 downto 0);
signal neg_ref_7: std_logic_vector(7 downto 0);
signal neg_ref_8: std_logic_vector(7 downto 0);
signal neg_ref_9: std_logic_vector(7 downto 0);
signal neg_ref_10: std_logic_vector(7 downto 0);
signal neg_ref_11: std_logic_vector(7 downto 0);
signal neg_ref_12: std_logic_vector(7 downto 0);
signal neg_ref_13: std_logic_vector(7 downto 0);
signal neg_ref_14: std_logic_vector(7 downto 0);
signal neg_ref_15: std_logic_vector(7 downto 0);

signal sub_0: std_logic_vector(8 downto 0);
signal sub_1: std_logic_vector(8 downto 0);
signal sub_2: std_logic_vector(8 downto 0);
signal sub_3: std_logic_vector(8 downto 0);
signal sub_4: std_logic_vector(8 downto 0);
signal sub_5: std_logic_vector(8 downto 0);
signal sub_6: std_logic_vector(8 downto 0);
signal sub_7: std_logic_vector(8 downto 0);
signal sub_8: std_logic_vector(8 downto 0);
signal sub_9: std_logic_vector(8 downto 0);
signal sub_10: std_logic_vector(8 downto 0);
signal sub_11: std_logic_vector(8 downto 0);
signal sub_12: std_logic_vector(8 downto 0);
signal sub_13: std_logic_vector(8 downto 0);
signal sub_14: std_logic_vector(8 downto 0);
signal sub_15: std_logic_vector(8 downto 0);

signal abs_0: std_logic_vector(8 downto 0);
signal abs_1: std_logic_vector(8 downto 0);
signal abs_2: std_logic_vector(8 downto 0);
signal abs_3: std_logic_vector(8 downto 0);
signal abs_4: std_logic_vector(8 downto 0);
signal abs_5: std_logic_vector(8 downto 0);
signal abs_6: std_logic_vector(8 downto 0);
signal abs_7: std_logic_vector(8 downto 0);
signal abs_8: std_logic_vector(8 downto 0);
signal abs_9: std_logic_vector(8 downto 0);
signal abs_10: std_logic_vector(8 downto 0);
signal abs_11: std_logic_vector(8 downto 0);
signal abs_12: std_logic_vector(8 downto 0);
signal abs_13: std_logic_vector(8 downto 0);
signal abs_14: std_logic_vector(8 downto 0);
signal abs_15: std_logic_vector(8 downto 0);

signal sum_01: std_logic_vector(9 downto 0);
signal sum_23: std_logic_vector(9 downto 0);
signal sum_45: std_logic_vector(9 downto 0);
signal sum_67: std_logic_vector(9 downto 0);
signal sum_89: std_logic_vector(9 downto 0);
signal sum_1011: std_logic_vector(9 downto 0);
signal sum_1213: std_logic_vector(9 downto 0);
signal sum_1415: std_logic_vector(9 downto 0);

signal sum_after_10: std_logic_vector(10 downto 0);
signal sum_after_11: std_logic_vector(10 downto 0);
signal sum_after_12: std_logic_vector(10 downto 0);
signal sum_after_13: std_logic_vector(10 downto 0);
signal sum_after_20: std_logic_vector(11 downto 0);
signal sum_after_21: std_logic_vector(11 downto 0);
signal sum_after_30: std_logic_vector(12 downto 0);


begin

neg_ref_0 <= std_logic_vector(resize(-signed(ref(0)),8));
neg_ref_1 <= std_logic_vector(resize(-signed(ref(1)),8));
neg_ref_2 <= std_logic_vector(resize(-signed(ref(2)),8));
neg_ref_3 <= std_logic_vector(resize(-signed(ref(3)),8));
neg_ref_4 <= std_logic_vector(resize(-signed(ref(4)),8));
neg_ref_5 <= std_logic_vector(resize(-signed(ref(5)),8));
neg_ref_6 <= std_logic_vector(resize(-signed(ref(6)),8));
neg_ref_7 <= std_logic_vector(resize(-signed(ref(7)),8));
neg_ref_8 <= std_logic_vector(resize(-signed(ref(8)),8));
neg_ref_9 <= std_logic_vector(resize(-signed(ref(9)),8));
neg_ref_10 <= std_logic_vector(resize(-signed(ref(10)),8));
neg_ref_11 <= std_logic_vector(resize(-signed(ref(11)),8));
neg_ref_12 <= std_logic_vector(resize(-signed(ref(12)),8));
neg_ref_13 <= std_logic_vector(resize(-signed(ref(13)),8));
neg_ref_14 <= std_logic_vector(resize(-signed(ref(14)),8));
neg_ref_15 <= std_logic_vector(resize(-signed(ref(15)),8));

abs_0 <= std_logic_vector(abs(signed(sub_0)));
abs_1 <= std_logic_vector(abs(signed(sub_1)));
abs_2 <= std_logic_vector(abs(signed(sub_2)));
abs_3 <= std_logic_vector(abs(signed(sub_3)));
abs_4 <= std_logic_vector(abs(signed(sub_4)));
abs_5 <= std_logic_vector(abs(signed(sub_5)));
abs_6 <= std_logic_vector(abs(signed(sub_6)));
abs_7 <= std_logic_vector(abs(signed(sub_7)));
abs_8 <= std_logic_vector(abs(signed(sub_8)));
abs_9 <= std_logic_vector(abs(signed(sub_9)));
abs_10 <= std_logic_vector(abs(signed(sub_10)));
abs_11 <= std_logic_vector(abs(signed(sub_11)));
abs_12 <= std_logic_vector(abs(signed(sub_12)));
abs_13 <= std_logic_vector(abs(signed(sub_13)));
abs_14 <= std_logic_vector(abs(signed(sub_14)));
abs_15 <= std_logic_vector(abs(signed(sub_15)));


SUB0: adder generic map (8) port map (ori(0),neg_ref_0,sub_0);
SUB1: adder generic map (8) port map (ori(1),neg_ref_1,sub_1);
SUB2: adder generic map (8) port map (ori(2),neg_ref_2,sub_2);
SUB3: adder generic map (8) port map (ori(3),neg_ref_3,sub_3);
SUB4: adder generic map (8) port map (ori(4),neg_ref_4,sub_4);
SUB5: adder generic map (8) port map (ori(5),neg_ref_5,sub_5);
SUB6: adder generic map (8) port map (ori(6),neg_ref_6,sub_6);
SUB7: adder generic map (8) port map (ori(7),neg_ref_7,sub_7);
SUB8: adder generic map (8) port map (ori(8),neg_ref_8,sub_8);
SUB9: adder generic map (8) port map (ori(9),neg_ref_9,sub_9);
SUB10: adder generic map (8) port map (ori(10),neg_ref_10,sub_10);
SUB11: adder generic map (8) port map (ori(11),neg_ref_11,sub_11);
SUB12: adder generic map (8) port map (ori(12),neg_ref_12,sub_12);
SUB13: adder generic map (8) port map (ori(13),neg_ref_13,sub_13);
SUB14: adder generic map (8) port map (ori(14),neg_ref_14,sub_14);
SUB15: adder generic map (8) port map (ori(15),neg_ref_15,sub_15);

ADD00: adder generic map (9) port map (abs_0,abs_1,sum_01);
ADD01: adder generic map (9) port map (abs_2,abs_3,sum_23);
ADD02: adder generic map (9) port map (abs_4,abs_5,sum_45);
ADD03: adder generic map (9) port map (abs_6,abs_7,sum_67);
ADD04: adder generic map (9) port map (abs_8,abs_9,sum_89);
ADD05: adder generic map (9) port map (abs_10,abs_11,sum_1011);
ADD06: adder generic map (9) port map (abs_12,abs_13,sum_1213);
ADD07: adder generic map (9) port map (abs_14,abs_15,sum_1415);

ADD10: adder generic map (10) port map (sum_01,sum_23,sum_after_10);
ADD11: adder generic map (10) port map (sum_45,sum_67,sum_after_11);
ADD12: adder generic map (10) port map (sum_89,sum_1011,sum_after_12);
ADD13: adder generic map (10) port map (sum_1213,sum_1415,sum_after_13);
ADD20: adder generic map (11) port map (sum_after_10,sum_after_11,sum_after_20);
ADD21: adder generic map (11) port map (sum_after_12,sum_after_13,sum_after_21);
ADD30: adder generic map (12) port map (sum_after_20,sum_after_21,sum_after_30);


sad_out <= sum_after_30;

end arch_sad;