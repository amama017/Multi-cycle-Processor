Library ieee;
Use ieee.std_logic_1164.all;

-- 2x1 Multiplexer using 'S' selector
-- between 'a', 'b', 'c' and 'd'

entity mux4x2 is
  generic ( n : integer := 32);
  port ( a, b, c, d : in std_logic_vector((n-1) downto 0);
         s0, s1 : in std_logic;
         x : out std_logic_vector((n-1) downto 0));
end mux4x2;

architecture RTL of mux4x2 is
   begin
      x <= a when s0 = '0' and s1 = '0'
      else b when s0 = '1' and s1 = '0'
      else c when s0 = '0' and s1 = '1'
      else d;
end RTL;