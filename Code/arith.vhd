library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- this Component operates the Arithmetic operations on
-- 'a' and 'b' to compute 'f' according to the selector 's'

entity arith is
  generic ( n : integer := 32);
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end entity arith;

architecture RTL of arith is
  ---------------------------------------------------  
  component my_nadder is
  generic ( n : integer := 32);
    port ( a, b : in std_logic_vector(n-1 downto 0);
      cin : in std_logic;
      s : out std_logic_vector(n-1 downto 0));
  end component;
  ---------------------------------------------------
  signal bOut : std_logic_vector((n-1) downto 0);
  signal add : std_logic;
  begin
  ---------------------------------------------------
  process(a, b, s) is
  begin
    if s = "01" then -- f = a - b
      bOut <= not b;
    elsif s = "10" then -- f = a + b
      bOut <= b;
    elsif s = "11" then -- f = a + 4
      bOut <= (others => '0');
      bOut(2) <= '1';
    else --no operation f = a
      bOut <= (others => '0');
    end if;
  end process;
  ---------------------------------------------------
  add <= '1' when s = "01"
  else '0';
  adder : my_nadder port map(a, bOut, add, f);
end RTL;