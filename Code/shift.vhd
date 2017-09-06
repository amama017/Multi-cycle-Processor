Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Component that Shifts 'a' according to the mod of 'b'
-- according to the 's' selectors

entity shift is
  generic ( n : integer := 32);  
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end shift;

architecture RTL of shift is
  -----------------------------------------------------------
  component mux4x2 is
  generic ( n : integer := 32);
    port ( a, b, c, d : in std_logic_vector((n-1) downto 0);
      s0, s1 : in std_logic;
      x : out std_logic_vector((n-1) downto 0));
  end component;
  -----------------------------------------------------------  
  begin
    process(a, b, s)
      variable shift : integer := 0;
      begin
        -- set the shift value
        shift := to_integer(unsigned(b(2 downto 0)));
        
        if s = "00" or s = "01" then -- SRA, SAL shift right arith | logic
          -- loop for setting the first bits
          loop1: for i in (n-1) downto (n-3) loop
            if s = "00" then --SRA
              f(i) <= a(n-1); --duplicate the sign
            else --SRL
              f(i) <= '0'; --set zeros
            end if;
          end loop;
          -- loop for shifting operation
          loop2: for i in (n-1) downto 3 loop
            f(i-3) <= a(i);
          end loop;
        elsif s = "10" or s = "11" then -- SLL, LHI shift left logic, load high bits immediate
          if s = "11" then --LHI
            shift := 16;
          end if;
          loop3: for i in 0 to 3 loop
            f(i) <= '0'; --set zeros
          end loop;
          -- loop for shifting operation
          loop4: for i in 0 to (n-3-1) loop
            f(i+3) <= a(i);
          end loop;
        end if;
    end process;
end RTL;
