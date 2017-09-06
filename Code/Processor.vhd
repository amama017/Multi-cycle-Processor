Library ieee;
Use ieee.std_logic_1164.all;

-- The Integration of Processor Components

Entity Processor is
   Generic ( n : integer := 32 );
   port( Clk,Rst : in std_logic);
end Processor;

Architecture Structure of Processor is
    
    component Reg
         generic (n : integer);
         port( Clk,Rst,En,S1,S2 : in std_logic;
             IP : in std_logic_vector(n-1 downto 0);
             OP1,OP2 : out std_logic_vector(n-1 downto 0));
    end component;
    
    component IR is
         generic ( n : integer := 32);
         port( Clk,Rst,En,S1,S2,Imm : in std_logic;
             IP : in std_logic_vector(n-1 downto 0);
             OP1,OP2,OP3 : out std_logic_vector(n-1 downto 0));
    end component;
    
    component Decoders is
         generic ( n : integer := 32);
         port ( Clk,Rst,Z : in std_logic;
             Instruction : in std_logic_vector(31 downto 0);
             RegSel : out std_logic_vector(14 downto 0);
             ControlSignals : out std_logic_vector(24 downto 0);
             Imm : out std_logic);
    end component;
    
    component Registers is
         generic ( n : integer := 32);
         port( Clk,Rst,Aout,Bout,Cin,Ain,Bin,Cout : in std_logic;
             Dst : in std_logic_vector(n-1 downto 0);
             S : in std_logic_vector(14 downto 0);
             Src1,Src2 : out std_logic_vector(n-1 downto 0));
    end component;
    
    component Memory is
         generic ( n : integer := 32);
         port( Clk,Rst,En,RW,MARen,MDRen,MARs1,MARs2,MDRs1,MDRs2,S : in std_logic;
             DstBus: in std_logic_vector(n-1 downto 0);
             IR,SCR1,SCR2: out std_logic_vector(n-1 downto 0)); 
    end component;
    
    component ALSU is
         generic ( n : integer := 32);  
         port( A, B : in std_logic_vector((n-1) downto 0);
             S : in std_logic_vector(3 downto 0);
             F : out std_logic_vector((n-1) downto 0);
             Z : out std_logic);
    end component;
   
    signal OutIR, InIR, Src1, Src2, Dst: std_logic_vector(n-1 downto 0);
    signal ControlSignals : std_logic_vector(24 downto 0);
    signal RegSel : std_logic_vector(14 downto 0);
    signal Imm,Z : std_logic;
    
    begin
        Dec: Decoders generic map(n) port map(Clk, Rst, Z, OutIR, RegSel, ControlSignals, Imm);
        ProgCount: Reg generic map(n) port map(Clk,Rst,ControlSignals(8),ControlSignals(16),ControlSignals(10),Dst,Src1,Src2);
        InstReg: IR generic map(n) port map(Clk, Rst, ControlSignals(4), ControlSignals(17), ControlSignals(11),
                                 Imm, InIR, Src1, Src2, OutIR);
        Mem: Memory generic map(n) port map(Clk, Rst, ControlSignals(1), ControlSignals(2), ControlSignals(5), ControlSignals(3),
                                ControlSignals(19), ControlSignals(13), ControlSignals(18), ControlSignals(12), ControlSignals(0),
                                Dst, InIR, Src1, Src2);
        ALU: ALSU generic map(n) port map(Src1, Src2, ControlSignals(24 downto 21), Dst,Z);
        RegFile: Registers generic map(n) port map(Clk, Rst, ControlSignals(15), ControlSignals(9), 
                                ControlSignals(7), ControlSignals(20), ControlSignals(14), ControlSignals(6),
                                Dst, RegSel, Src1, Src2);
end Structure;