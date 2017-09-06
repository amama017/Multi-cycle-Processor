library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- The set of Decoders that are connected to the Rest of Processor
-- components with the Control Signal described below and the Reg Selector
-- that set the Reg Number according to the Insrtuction
-- it takes it's data from the ROM that has the Micro-Instruction that is decoded
-- and is got from Instruction decoder that has the Micro-MAR and control the jumps
-- according to the Instruction.

--ControlSignal Description:
   --Bit 0:	S (Mux & DeMux Selector)
   --Bit 1:	En (Memory Enable)
   --Bit 2:	WE (Write Enable/!Read)
   --Bit 3:	MDRin (Save data in MDR)
   --Bit 4:	IRin (save Inst in IR)
   --Bit 5:	MARin (save add. in MAR)
   --Bit 6:	Rdstin (save data in RegFile ?Rd?)
   --Bit 7:	Cin (save data in ?C? Reg)
   --Bit 8:	PCin (save address in PC)
   --Bit 9: 	Bout (out data from ?B?  to Src2 bus)
   --Bit 10:	PCout2 (out PC on Src2 bus)
   --Bit 11:	IRout2 (out IR on Src2 bus)
   --Bit 12:	MDRout2 (out MDR on Src2 bus)
   --Bit 13:	MARout2 (out MAR on Src2 bus)
   --Bit 14:	Rsrc2out (out RegFile on ?B? Reg)
   --Bit 15:	Aout (out data from ?A? to Src1 bus)
   --Bit 16:	PCout1 (out PC on Src1 bus)
   --Bit 17:	IRout1 (out IR on Src1 bus)
   --Bit 18:	MDRout1 (out MDR on Src1 bus)
   --Bit 19:	MARout1 (out MAR on Src1 bus)
   --Bit 20:	Rsrc1out (out RegFile on ?A? Reg)
   --Bits from 21 to 24: ALU Operation

entity Decoders is
   generic ( n : integer := 32);
   port ( Clk,Rst,Z : in std_logic;
          Instruction : in std_logic_vector(31 downto 0);
          RegSel : out std_logic_vector(14 downto 0);
          ControlSignals : out std_logic_vector(24 downto 0);
          Imm : out std_logic);
end Decoders;

architecture Structure of Decoders is
    component RegDecoder is
    port ( S : in std_logic_vector(2 downto 0);
           dataout : out std_logic_vector(5 downto 0));
    end component;
    
    component MemDecoder is
    port ( S : in std_logic_vector(1 downto 0);
           dataout,En : out std_logic);
   end component;
   
   component DstDecoder is
    port ( S : in std_logic_vector(1 downto 0);
           dataout : out std_logic_vector(2 downto 0));
   end component;
   
   component inst_dec is
   generic ( n : integer);
   port (Clk,Rst,Z : in std_logic;
     Instruction : in std_logic_vector((n-1) downto 0);
     Rom : in std_logic_vector(20 downto 0);
     MAddress : inout std_logic_vector(6 downto 0);
     Imm : out std_logic);
   end component;
   
   component ROM is
   port ( Clk : in std_logic;
          Address : in std_logic_vector(6 downto 0);
          Dout : out std_logic_vector(20 downto 0) );
   end component;
   
   signal OutRom : std_logic_vector(20 downto 0);
   signal MAddress : std_logic_vector(6 downto 0);
   signal OutDstDecoder : std_logic_vector(2 downto 0);
   signal OutMemDecoder : std_logic_vector(1 downto 0);
   signal OutRegDecoder_1, OutRegDecoder_2 : std_logic_vector(5 downto 0);
   signal NClk : std_logic;
   
begin

   --Negative Edge InstDecoder   
   InstDecoder: inst_dec generic map(n) port map(NClk, Rst, Z, Instruction, OutRom, MAddress, Imm);
   ROM1: ROM port map(Clk, MAddress, OutRom);
   DstDecoder1: DstDecoder port map(OutRom(7 downto 6), OutDstDecoder);
   MemDecoder1: MemDecoder port map(OutRom(2 downto 1), OutMemDecoder(1), OutMemDecoder(0));
   RegDecoder1: RegDecoder port map(OutRom(13 downto 11), OutRegDecoder_1);
   RegDecoder2: RegDecoder port map(OutRom(10 downto 8), OutRegDecoder_2);   
   
   ControlSignals <= (others => '0') when Rst = '1'
   else OutRom(17 downto 14) & OutRegDecoder_1 & OutRegDecoder_2 & OutDstDecoder & OutRom(5) & OutRom(4 downto 3) & outMemDecoder & OutRom(0); 
   NClk <= not Clk;
   
   process(Instruction)
       begin
           if(Instruction(31 downto 26) = "000000") then
               RegSel <= Instruction(20 downto 16) & Instruction(25 downto 21) & Instruction(15 downto 11);
           elsif(Instruction(31 downto 26) = "000010" or Instruction(31 downto 26) = "000011") then
               RegSel <= "11111" & Instruction(25 downto 21) & "11111";
           elsif(Instruction(31 downto 26) = "000100" or Instruction(31 downto 26) = "000101")then
               RegSel <= "00000" & Instruction(25 downto 21) & Instruction(20 downto 16);
           else
               RegSel <= Instruction(20 downto 16) & Instruction(25 downto 21) & Instruction(20 downto 16);
           end if;
       end process;
       
end Structure;