library ieee;
use ieee.std_logic_1164.all;

-- Decoder that dectect which reg signal will be activated

Entity RegDecoder is
    port ( S : in std_logic_vector(2 downto 0);
           dataout : out std_logic_vector(5 downto 0));
end entity RegDecoder;

Architecture RTL of RegDecoder is
    begin
        dataout <= "000001" when S = "001"
        else "000010" when S = "010"
        else "000100" when S = "011"
        else "001000" when S = "100"
        else "010000" when S = "101"
        else "100000" when S = "110"
        else "000000";
        
end RTL;