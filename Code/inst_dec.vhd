library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- The Instruction Decoder that compute the
-- Micro-Instruction address according to the Instruction

entity inst_dec is
  generic ( n : integer := 32);
  port (Clk,Rst,Z : in std_logic;
    Instruction : in std_logic_vector((n-1) downto 0);
    Rom : in std_logic_vector(20 downto 0);
    MAddress : inout std_logic_vector(6 downto 0);
    Imm : out std_logic);
end entity inst_dec;

architecture RTL of inst_dec is
    begin
        process(Clk,Rst) is
            begin
                if Rst = '1' then
                    Imm <= '0';
                    MAddress <= (others => '0');
                elsif rising_edge(Clk) then
                    if Rom(18) = '1' then --End of Operation
                       Imm <= '0';
                       MAddress <= (others => '0');
                    elsif Rom(20 downto 19) = "00" then --increment the maddress by 1
                       MAddress <= MAddress + 1; --increament the counter
                    elsif Rom(20 downto 19) = "10" then
                        if(Instruction(31 downto 26) = "000100")then
                            if(Z = '1')then
                                MAddress <= "1100100"; --Condition is true
                            else
                                MAddress <= (others => '0'); --Condition is false
                            end if;
                        elsif(Instruction(31 downto 26) = "000101")then
                            if(Z = '1')then
                                MAddress <= (others => '0'); --Condition is false
                            else
                                MAddress <= "1100100"; --Condition is true
                            end if;
                        end if;
                    elsif Rom(20 downto 19) = "01" then
                       --R-type
                       if Instruction(31 downto 26) = "000000" then
                          if Instruction(5 downto 0) = "100000" then --ADD
                             MAddress <= "0000011";
                          elsif Instruction(5 downto 0) = "100100" then --AND
                             MAddress <= "0010111";
                          elsif Instruction(5 downto 0) = "100101" then --OR
                             MAddress <= "0100110";          
                          elsif Instruction(5 downto 0) = "101000" then --SEQ
                             MAddress <= "0101100";             
                          elsif Instruction(5 downto 0) = "101100" then --SLE
                             MAddress <= "0111000";      
                          elsif Instruction(5 downto 0) = "000100" then --SLL
                             MAddress <= "1010000";     
                          elsif Instruction(5 downto 0) = "101010" then --SLT
                             MAddress <= "0111110";                                     
                          elsif Instruction(5 downto 0) = "101001" then --SNE
                             MAddress <= "0110010";            
                          elsif Instruction(5 downto 0) = "000111" then --SRA
                             MAddress <= "1000100";  
                          elsif Instruction(5 downto 0) = "000110" then --SRL
                             MAddress <= "1001010";  
                          elsif Instruction(5 downto 0) = "100010" then --SUB
                             MAddress <= "0010001";  
                          elsif Instruction(5 downto 0) = "100110" then --XOR
                             MAddress <= "0100000";                                              
                          end if;
                       else --I-type or J-type
                           Imm <= '1';
                           if Instruction(31 downto 26) = "001000" then --ADDI (I-type)
                              MAddress <= "0010111";
                           elsif Instruction(31 downto 26) = "001100" then --ANDI (I-type)
                              MAddress <= "0011101";          
                           elsif Instruction(31 downto 26) = "000100" then --BEQZ (I-type)
                              MAddress <= "1100010";          
                           elsif Instruction(31 downto 26) = "000101" then --BNEZ (I-type)
                              MAddress <= "1100010";             
                           elsif Instruction(31 downto 26) = "000010" then --J (J-type)
                              Imm <= '0';
                              MAddress <= "1011001";
                           elsif Instruction(31 downto 26) = "000011" then --JAL (J-type)
                              Imm <= '0';
                              MAddress <= "1011010";                          
                           elsif Instruction(31 downto 26) = "010011" then --JALR (I-type)
                              MAddress <= "1011101";
                           elsif Instruction(31 downto 26) = "010010" then --JR (I-type)
                              MAddress <= "1100000";          
                           elsif Instruction(31 downto 26) = "001111" then --LHI (I-type)
                              MAddress <= "1010110";          
                           elsif Instruction(31 downto 26) = "100011" then --LW (I-type)
                              MAddress <= "0000110";          
                           elsif Instruction(31 downto 26) = "001101" then --ORI (I-type)
                              MAddress <= "0101001";          
                           elsif Instruction(31 downto 26) = "011000" then --SEQI (I-type)
                              MAddress <= "0101111";      
                           elsif Instruction(31 downto 26) = "011100" then --SLEI (I-type)
                              MAddress <= "0111011";                           
                           elsif Instruction(31 downto 26) = "010100" then --SLLI (I-type)
                              MAddress <= "1010011";
                           elsif Instruction(31 downto 26) = "011010" then --SLTI (I-type)
                              MAddress <= "1000001";
                           elsif Instruction(31 downto 26) = "011001" then --SNEI (I-type)
                              MAddress <= "0110101";
                           elsif Instruction(31 downto 26) = "010111" then --SRAI (I-type)
                              MAddress <= "1000111";     
                           elsif Instruction(31 downto 26) = "010110" then --SRLI (I-type)
                              MAddress <= "1001101";            
                           elsif Instruction(31 downto 26) = "001010" then --SUBI (I-type)
                              MAddress <= "0010100";          
                           elsif Instruction(31 downto 26) = "101011" then --SW (I-type)
                              MAddress <= "0001100";           
                           elsif Instruction(31 downto 26) = "001110" then --XORI (I-type)
                              MAddress <= "0100011";
                           end if;
                    end if;
                end if;
            end if;
        end process;
end RTL;
