LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY registrador IS 
GENERIC (reg_width: INTEGER);
PORT (
        D: IN STD_LOGIC_VECTOR(reg_width-1 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR(reg_width-1 DOWNTO 0);
        CLK, RST: IN STD_LOGIC
);
END registrador;

ARCHITECTURE arch OF registrador is
BEGIN 

PROCESS (CLK, RST)
BEGIN   

        IF RST = '1' THEN 
                Q <= (OTHERS => '0'); -- Verificar
        ELSIF (CLK'EVENT AND CLK = '1') THEN 
                Q <= D;
        END IF;

END PROCESS;

END arch;