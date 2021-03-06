Library ieee;
Use ieee.std_logic_1164.all;

-- tri_state_buffer is a buffer controlled by
-- 'En' Control signal, that control the dataflow
-- from 'IP' to 'OP' that are Gereric Buses of width n
-- if 'En' is Deactivated, 'IP' is cutted from 'OP'.

Entity tri_state_buffer is
   Generic ( n : integer := 32);
   port( En : in std_logic;
         IP : in std_logic_vector(n-1 downto 0);
         OP : out std_logic_vector(n-1 downto 0));
end tri_state_buffer;

Architecture RTL of tri_state_buffer is
   component mux IS
       PORT ( a, b :  in std_logic_vector(31 downto 0) ;
          S1 : IN std_logic;
          dataout : out std_logic_vector(31 downto 0));
   END component;
   signal Z : std_logic_vector(31 downto 0) ;
begin
    --Change when 'En' or 'IP' Change
    Z <= (others => 'Z');
    U1: mux port map(IP,Z,En,OP);
    --OP <= IP when En = '1' -- Transfer 'IP' to 'OP'
    --else (others => 'Z');  -- Cuttoff the 'OP'
end RTL;
