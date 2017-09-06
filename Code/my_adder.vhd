Library ieee;
Use ieee.std_logic_1164.all;

-- 1 bit adder thats add a & b and outs on c

Entity my_adder is
   port( a,b,cin : in std_logic;
         s,cout : out std_logic);
end my_adder;

Architecture RTL of my_adder is
    signal ab : std_logic;
    begin
        ab <= a xor b;
        s <= ab xor cin;
        cout <= (a and b) or (cin and ab);
end RTL;