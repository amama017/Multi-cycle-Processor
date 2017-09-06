library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Decoder that dectect the Memory operation (read or write)

Entity MemDecoder is
    port ( S : in std_logic_vector(1 downto 0);
           dataout,En : out std_logic);
end entity MemDecoder;
   
Architecture RTL of MemDecoder is
    signal temp : std_logic;
    begin
        temp <= S(0) xor S(1);
        dataout <= temp and S(1);
        En <= temp;
end RTL;