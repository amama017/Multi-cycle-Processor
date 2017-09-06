Library ieee;
Use ieee.std_logic_1164.all;

-- Create a n bit Adder using 1 bit adder
-- that adds a & b and outs on c with cin

ENTITY my_nadder IS
   Generic ( n : integer := 32);
   PORT ( a, b : in std_logic_vector(n-1 downto 0) ;
          cin : in std_logic;
          s : out std_logic_vector(n-1 downto 0);
          cout : out std_logic);
END my_nadder;

Architecture Structure of my_nadder is

   Component my_adder is
      port( a,b,cin : in std_logic; s,cout : out std_logic);
   end component;

   signal temp : std_logic_vector(n-1 downto 0);
   
begin
    
   f0 : my_adder port map(a(0),b(0),cin,s(0),temp(0));
   loop1: for i in 1 to n-1 generate
      fx: my_adder port map(a(i),b(i),temp(i-1),s(i),temp(i));
   end generate;
   cout <= temp(n-1);
   
end Structure;