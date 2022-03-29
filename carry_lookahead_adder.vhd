library ieee;
use ieee.std_logic_1164.all;
 
entity carry_lookahead_adder is
generic (N : natural := 8);
port (
    add1  : in std_logic_vector(N-1 downto 0);
    add2  : in std_logic_vector(N-1 downto 0);
    result   : out std_logic_vector(N downto 0)
);
end carry_lookahead_adder;
 
 
architecture rtl of carry_lookahead_adder is
 
component full_adder is
  port (
    bit1  : in std_logic;
    bit2  : in std_logic;
    i_carry : in std_logic;
    sum   : out std_logic;
    o_carry : out std_logic
    );
end component;
 
signal w_G : std_logic_vector(N-1 downto 0); -- Generate
signal w_P : std_logic_vector(N-1 downto 0); -- Propagate
signal w_C : std_logic_vector(N downto 0);   -- Carry
 
signal w_SUM  : std_logic_vector(N-1 downto 0);
 
begin
 
GEN_FULL_ADDERS : for ii in 0 to N-1 generate
	FULL_ADDER_INST : full_adder
      port map (
        bit1  => add1(ii),
        bit2  => add2(ii),
        i_carry => w_C(ii),        
        sum   => w_SUM(ii),
        o_carry => open
        );
end generate GEN_FULL_ADDERS;
 
GEN_CLA : for jj in 0 to N-1 generate
    w_G(jj)   <= add1(jj) and add2(jj);
    w_P(jj)   <= add1(jj) or add2(jj);
    w_C(jj+1) <= w_G(jj) or (w_P(jj) and w_C(jj));
end generate GEN_CLA;
     
  w_C(0) <= '0'; -- no carry input
 
  result <= w_C(N) & w_SUM;  -- VHDL Concatenation
   
end rtl;