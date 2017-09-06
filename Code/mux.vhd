Library ieee;
Use ieee.std_logic_1164.all;

-- 2x1 Multiplexer using 'S1' selector
-- between 'a' and 'b'

ENTITY mux IS
   PORT ( a, b :  in std_logic_vector(31 downto 0) ;
          S1 : IN std_logic;
          dataout : out std_logic_vector(31 downto 0));
END mux;
   
ARCHITECTURE RTL OF mux is
   BEGIN
      dataout <= a WHEN S1 = '1' 
      ELSE b;
END RTL;