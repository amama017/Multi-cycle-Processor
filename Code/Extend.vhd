Library ieee;
Use ieee.std_logic_1164.all;

-- this component extends the Immediate value
-- or the value in the IR Register to operate on it.

Entity Extend is
   Generic ( n : integer := 32);
   port( Imm : in std_logic;
         Din : in std_logic_vector(n-1 downto 0);
         Dout : out std_logic_vector(n-1 downto 0));
end Extend;

Architecture RTL of Extend is
    begin
        Dout(15 downto 0) <= Din(15 downto 0);
        process(Din,Imm)
            begin
                if(Imm = '1') then
                    --if(Din(15) = '0')then
                        --Dout(31 downto 16) <= (others => '0');
                       Dout(31 downto 16) <= (others => Din(15));
                    --else
                       --Dout(31 downto 16) <= (others => '1');
                    --end if;
                else
                    Dout(25 downto 16) <= Din(25 downto 16);
                    Dout(31 downto 26) <= (others => '0');
                end if;
            end process;
end RTL;