Library ieee;
Use ieee.std_logic_1164.all;

-- this is a Special type of Registers that outs data
-- on 2 diffrent buses as required in the Design.
-- it is built using 'my_nDFF' & 'tri_state_buffer' Components

Entity Reg is
   Generic ( n : integer := 32);
   port( Clk,Rst,En,S1,S2 : in std_logic;
   IP : in std_logic_vector(n-1 downto 0);
   OP1,OP2 : out std_logic_vector(n-1 downto 0));
end Reg;

Architecture Structure of Reg is
    
    component my_nDFF is
       Generic ( n : integer := 32);
       port( Clk,Rst,En : in std_logic;
             d : in std_logic_vector(n-1 downto 0);
             q : out std_logic_vector(n-1 downto 0));
    end component;
       
    component tri_state_buffer is
       Generic ( n : integer := 32);
       port( En : in std_logic;
             IP : in std_logic_vector(n-1 downto 0);
             OP : out std_logic_vector(n-1 downto 0));
    end component;
    
    Signal DFF : std_logic_vector(n-1 downto 0);
    --Connect U1 Output by U2 & U3 Input.
    
begin
    
    U1: my_nDFF generic map(n) port map(Clk,Rst,En,IP,DFF);
    U2: tri_state_buffer generic map(n) port map(S1,DFF,OP1);
    U3: tri_state_buffer generic map(n) port map(S2,DFF,OP2);
    
end Structure;