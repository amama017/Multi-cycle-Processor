library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Decoder that dectect Cin or Rdstin will be activated.

Entity DstDecoder is
    port ( S : in std_logic_vector(1 downto 0);
           dataout : out std_logic_vector(2 downto 0));
   end entity DstDecoder;
Architecture RTL of DstDecoder is
    begin
        dataout(2) <= S(0) and S(1);
        dataout(1 downto 0) <= S when not(S = "11")
        else "00";
end RTL;