Library ieee;
Use ieee.std_logic_1164.all;

-- Memory Component that contains the Interface between
-- the RAM and the MDR, MAR & the Connections between them.

Entity Memory is
   Generic ( n : integer := 32);
   port( Clk,Rst : in std_logic;
         En :in std_logic;  --Memory enable
         RW : in std_logic; --read write controller 
         MARen :in std_logic; --memory address register enable
         MDRen :in std_logic; --memory data register enable
         MARs1 :in std_logic; -- memory address source bus 1 controller 
         MARs2 :in std_logic; --memory address source bus 2 controller
         MDRs1 :in std_logic; -- memory data source bus 1 controller 
         MDRs2 :in std_logic; --memory data source bus 2 controller
         S: in std_logic; --mux selector
         DstBus: in std_logic_vector(n-1 downto 0); --destination bus data
         IR: out std_logic_vector(n-1 downto 0); 
         SCR1: out std_logic_vector(n-1 downto 0); --- Scource bus 1 out 
         SCR2: out std_logic_vector(n-1 downto 0)); --- Scource bus 2 out 
end Memory;

Architecture arcMemory of Memory is
--//----------------------------------Component----------------//--
------register component
Component my_nDFF is
   Generic ( n : integer := 32);
   port( Clk,Rst,En : in std_logic;
   d : in std_logic_vector(n-1 downto 0);
   q : out std_logic_vector(n-1 downto 0));
end component;

--- Tri state Buffer 
Component  tri_state_buffer is
   Generic ( n : integer := 32);
   port( En : in std_logic;
   IP : in std_logic_vector(n-1 downto 0);
   OP : out std_logic_vector(n-1 downto 0));
end  Component;
  
--- Ram Component 
Component sync_ram is
   port ( Clk : in std_logic;
      WE,En : in std_logic;
      Address : in std_logic_vector(31 downto 0);
      Din : in std_logic_vector(31 downto 0);
      Dout : out std_logic_vector(31 downto 0) );
end Component;

--- mux 2*1 
  Component mux IS
PORT ( a, b :  in std_logic_vector(31 downto 0) ;
 S1 : IN std_logic;
dataout : out std_logic_vector(31 downto 0));
end  Component;
--//-----------------------------------------------------------------------//

----------------------Signals----------------
Signal MDRin, MDRout  ,MARout:  std_logic_vector(31 downto 0);
Signal  RAMout:  std_logic_vector(31 downto 0);
Signal   MUXin:  std_logic_vector(31 downto 0);
---------------------------------------------

begin 
  --------------
  MAR: my_nDFF port map(Clk,Rst,MARen,DstBus,MARout);   ------MAR REGISTER
  MARTRS1: tri_state_buffer Port map(MARs1,MARout,SCR1);    
  MARTRS2: tri_state_buffer Port map(MARs2,MARout,SCR2);
    
  MDR: my_nDFF port map(Clk,Rst,MDRen,MDRin,MDRout);  ---- MDR register
  MDRTRS1: tri_state_buffer Port map(MDRs1,MDRout,SCR1);
  MDRTRS2: tri_state_buffer Port map(MDRs2,MDRout,SCR2);
    
  RAM: sync_ram port map (Clk,RW,En,MARout,MDRout,RAMout); --Memory
  muxt:  mux port map(DstBus,RAMout,S,MDRin);
  IR <= RAMout;
  --------------
end arcMemory;
  