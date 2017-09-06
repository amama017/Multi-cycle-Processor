Library ieee;
Use ieee.std_logic_1164.all;

-- my_nDFF is a Generic Register Component with width n
-- that saves the changes in 'd' in 'q' by 'En' Control signal
-- in the rising edge of 'Clk' and is Reseted by 'Rst'

Entity my_nDFF is
   Generic ( n : integer := 32);
   port( Clk,Rst,En : in std_logic;
         d : in std_logic_vector(n-1 downto 0);
         q : out std_logic_vector(n-1 downto 0));
end my_nDFF;

Architecture RTL of my_nDFF is
begin
   process(Clk,Rst)
   --Change when 'Clk' or 'Rst' change
   begin
      if Rst = '1' then
          -- Reset the 'q'
          q <= (others=>'0');
      elsif rising_edge(Clk) then
         -- if 'En' = 0 NoChange
         if En = '1' then
            -- Save the 'd' in 'q'
            q <= d;
         end if;
      end if;
   end process;
end RTL;