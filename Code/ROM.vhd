library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 21 bit width ROM that Contains the Micro-Instructions
-- that is saved by Designer according to the ISA

Entity ROM is
   port ( Clk : in std_logic;
          Address : in std_logic_vector(6 downto 0);
          Dout : out std_logic_vector(20 downto 0) );
end ROM;

architecture RTL of ROM is
    
type rom_type is array (0 to 100) of std_logic_vector(20 downto 0);
signal rom : rom_type;

begin
   process(Clk) is
      begin
         if rising_edge(Clk) then
            Dout <= rom(to_integer(unsigned(Address)));
         end if;
   end process;
   
end architecture RTL;