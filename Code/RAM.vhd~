library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 8 bit width RAM that Contains the Instructions & Data
-- it is controled by 'En' that Enables the RAM
-- and 'WE' signal that Enables write or Read
-- Synchronised by 'Clk'

Entity sync_ram is
   port ( Clk : in std_logic;
      WE,En : in std_logic;
      Address : in std_logic_vector(31 downto 0);
      Din : in std_logic_vector(31 downto 0);
      Dout : out std_logic_vector(31 downto 0) );
end entity sync_ram;

architecture RTL of sync_ram is
    
type ram_type is array (0 to 128) of std_logic_vector(7 downto 0);
signal ram : ram_type;

begin
   process(Clk) is
   begin
   if rising_edge(Clk) then
     if En ='1' then 
     -- Enable the RAM functionality
      if WE = '1' then
      -- Write in the RAM
         ram(to_integer(unsigned(Address))) <= Din(31 downto 24);
         ram(to_integer(unsigned(Address))+1) <= Din(23 downto 16);
         ram(to_integer(unsigned(Address))+2) <= Din(15 downto 8);
         ram(to_integer(unsigned(Address))+3) <= Din(7 downto 0);
      else
      -- Read from the RAM
         Dout(31 downto 24) <= ram(to_integer(unsigned(Address)));
         Dout(23 downto 16) <= ram(to_integer(unsigned(Address))+1);
         Dout(15 downto 8) <= ram(to_integer(unsigned(Address))+2);
         Dout(7 downto 0) <= ram(to_integer(unsigned(Address))+3);
      end if;
     else
      Dout <= (others => '0');
     end if;
   end if;
   end process;
   
end architecture RTL;
