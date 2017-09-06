Library ieee;
Use ieee.std_logic_1164.all;

-- logic component computes the logic operations
-- requried according to the selector 's'

entity logic is
  generic ( n : integer := 32);
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end logic;

architecture RTL of logic is
  -------------------------------------------------
  component mux4x2 is
  generic ( n : integer := 32);
  port ( a, b, c, d : in std_logic_vector((n-1) downto 0);
    s0, s1 : in std_logic;
    x : out std_logic_vector((n-1) downto 0));
  end component;
  -------------------------------------------------
  signal x0, x1, x2, x3 : std_logic_vector((n-1) downto 0);
  begin
    x0 <= a and b;
    x1 <= a xor b;
    x2 <= a or b;
    x3 <= b; --No Operation Transfer 
    mux4: mux4x2 generic map(n) port map(x0, x1, x2, x3, s(0), s(1), f);
end RTL;