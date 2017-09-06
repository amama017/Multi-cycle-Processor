Library ieee;
Use ieee.std_logic_1164.all;

-- this is the integration of ALU components that operates
-- on 'A' and 'B' 2 Operands to outs 'F' Output
-- according to the 'S' Selectors that determines the Operation.
-- 'Z' is a zero flag that determins if "f2 = 0" in set Component

entity ALSU is
  generic ( n : integer := 32);  
  port(A, B : in std_logic_vector((n-1) downto 0);
    S : in std_logic_vector(3 downto 0);
    F : out std_logic_vector((n-1) downto 0);
    Z : out std_logic);
end ALSU;

architecture Structure of ALSU is
----------------------------------------------------------
component arith is --arithmatic operations
  generic ( n : integer := 32);
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end component;
----------------------------------------------------------  
component logic is --logic operations
  generic ( n : integer := 32);
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end component;
----------------------------------------------------------
component shift is --shift operations
  generic ( n : integer := 32);  
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end component;
----------------------------------------------------------
component set is --comparison(set) operations
  generic ( n : integer := 32);  
  port(a, b : in std_logic_vector((n-1) downto 0);
    s : in std_logic_vector(1 downto 0);
    f : out std_logic_vector((n-1) downto 0));
end component;
----------------------------------------------------------
component mux4x2 is --multiplexer (4-1)
  generic ( n : integer := 32);
  port ( a, b, c, d : in std_logic_vector((n-1) downto 0);
    s0, s1 : in std_logic;
    x : out std_logic_vector((n-1) downto 0));
end component;
----------------------------------------------------------
  signal f0, f1, f2, f3, zero : std_logic_vector((n-1) downto 0);
  begin
    arith1: arith port map(A, B, S(1 downto 0), f0); 
    logic1: logic port map(A, B, S(1 downto 0), f1);
    set1:   set port map(A, B, S(1 downto 0), f2);
    shift1: shift port map(A, B, S(1 downto 0), f3);
    result: mux4x2 port map(f0, f1, f2, f3, S(2), S(3), F);
    zero <= (others => '0');
    Z <= '1' when f2 = zero
    else '0';
end Structure;