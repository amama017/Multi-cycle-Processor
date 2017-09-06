Library ieee;
Use ieee.std_logic_1164.all;

-- this is the IR Register that contain the Inst from the Mem

Entity IR is
   Generic ( n : integer := 32);
   port( Clk,Rst,En,S1,S2,Imm : in std_logic;
   IP : in std_logic_vector(n-1 downto 0);
   OP1,OP2,OP3 : out std_logic_vector(n-1 downto 0));
end IR;

Architecture Structure of IR is
    
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
    
    component Extend is
       Generic ( n : integer := 32);
       port( Imm : in std_logic;
             Din : in std_logic_vector(n-1 downto 0);
             Dout : out std_logic_vector(n-1 downto 0));
    end component;
    
    Signal DFF,ext : std_logic_vector(n-1 downto 0);
    
begin
    
    U1: my_nDFF generic map(n) port map(Clk,Rst,En,IP,DFF);
    U2: Extend generic map(n) port map(Imm,DFF,ext);
    U3: tri_state_buffer generic map(n) port map(S1,ext,OP1);
    U4: tri_state_buffer generic map(n) port map(S2,ext,OP2);
    OP3 <= DFF when En = '0'
    else IP;
    -- the output to the Controller.
    
end Structure;