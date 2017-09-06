library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Component that Compare a and b and set the output f
-- according to the selectors s

entity set is
  generic ( n : integer := 32);  
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end set;

architecture RTL of set is
    signal temp : std_logic;
  begin
      temp <= s(0) or s(1);
      f(n-1 downto 1) <= (others => '0');
      process(a, b, s) is
      begin
          if a <= b then
              if(a = b)then
                  if (s(0) = '0') then
                      f(0) <= '1';
                  else f(0) <='0';
                  end if;
              else
                  if temp = '1' then
                  f(0) <= '1';
                  else f(0) <= '0';
                  end if;
              end if;
          else
              if (s = "01") then
              f(0) <= '1'; 
              else f(0) <= '0';
              end if;
          end if;
      
    --f <= (others => '0');
    --if s = "00" then --SEQ set if equal
      --if a = b then
        --f(0) <= '1';
      --end if;
    --elsif s = "01" then --SNE set if not equal
      --if a /= b then
        --f(0) <= '1';
      --end if;        
    --elsif s = "10" then --SLE set if less than or equal
      --if a <= b then
        --f(0) <= '1';
      --end if;        
    --elsif s = "11" then --SLT set if less than
      --if a < b then
        --f(0) <= '1';
      --end if;        
    --end if;
  end process;
end architecture RTL;
