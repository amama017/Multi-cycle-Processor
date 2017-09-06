Library ieee;
Use ieee.std_logic_1164.all;

-- Registers file contains 32 GRP each of 32 bit Register
-- that outs on 2 Main Registers 'A' and 'B', and take data
-- from Main Register 'C'.
-- Registers are controled by 'S' selectors that are decoded
-- to detect the orders for each Register alone.

Entity Registers is
   Generic ( n : integer := 32);
   port( Clk,Rst,Aout,Bout,Cin,Ain,Bin,Cout : in std_logic;
         Dst : in std_logic_vector(n-1 downto 0);
         S : in std_logic_vector(14 downto 0);
         Src1,Src2 : out std_logic_vector(n-1 downto 0));
end Registers;

Architecture Structure of Registers is
------------------------------------------------------------------------------
    component my_nDFF
        Generic (n : integer);
         port( Clk,Rst,En : in std_logic;
               d : in std_logic_vector(n-1 downto 0);
               q : out std_logic_vector(n-1 downto 0));
    end component;
------------------------------------------------------------------------------
    component Reg
          generic (n : integer);
          port( Clk,Rst,En,S1,S2 : in std_logic;
                IP : in std_logic_vector(n-1 downto 0);
                OP1,OP2 : out std_logic_vector(n-1 downto 0));
    end component ;
------------------------------------------------------------------------------
    component decoder5x32
        port ( En : in std_logic;
               S : in std_logic_vector(4 downto 0);
               dataout : out std_logic_vector(31 downto 0));
    end component;
------------------------------------------------------------------------------
    component tri_state_buffer is
       Generic ( n : integer := 32);
       port( En : in std_logic;
             IP : in std_logic_vector(n-1 downto 0);
             OP : out std_logic_vector(n-1 downto 0));
    end component;
-------------------------------------------------------------------------------
    SIGNAL SEN1,SEN2,SEN3,RTA,RTB,CTR,Din,Dout1,Dout2: std_logic_vector(31 downto 0);

begin
    
    T1: tri_state_buffer generic map(n) port map(Aout,Dout1,Src1);
    --TriState between A and Source1 Bus
    T2: tri_state_buffer generic map(n) port map(Bout,Dout2,Src2);
    --TriState between B and Source2 Bus
    T3: tri_state_buffer generic map(n) port map(Cout,CTR,Din);
    --TriState between C and GPR
    
    D1: decoder5x32 port map(Cout,S(4 downto 0),SEN1);
    --GPR Enable Decoder
    D2: decoder5x32 port map(Ain,S(9 downto 5),SEN2);
    --GPR 1st selector Decoder (S1 -> A)
    D3: decoder5x32 port map(Bin,S(14 downto 10),SEN3);
    --GPR 2nd selector Decoder (S2 -> B)
    
    A: my_nDFF generic map(n) port map(Clk,Rst,Ain,RTA,Dout1); --Register A
    B: my_nDFF generic map(n) port map(Clk,Rst,Bin,RTB,Dout2); --Register B
    C: my_nDFF generic map(n) port map(Clk,Rst,Cin,Dst,CTR); --Register C
    
    --1st GPR that always have 0 saved in it.
    U0: Reg generic map (n) port map (Clk,Rst,'0',SEN2(0),SEN3(0),Din,RTA,RTB);
    GPR:
    for i in n-1 downto 1 generate
       U: Reg generic map (n) port map (Clk,Rst,SEN1(i),SEN2(i),SEN3(i),Din,RTA,RTB);
    end generate;
    
    
end Structure;