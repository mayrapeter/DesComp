library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadeControle is
  port   (
    -- Input ports
    clk  :  in  std_logic;
	 jr: in std_logic;
	 Opcode  :  in  std_logic_vector(5 downto 0);
    -- Output ports
    palavraControle  :  out std_logic_vector(14 downto 0)
  );
end entity;


architecture arch_name of UnidadeControle is

-- aliases para saida
	alias BNE : std_logic is palavraControle(11);
  alias selULA : std_logic_vector(2 downto 0) is palavraControle(10 downto 8);
  alias HabilitaEscrita_reg : std_logic is palavraControle(0);
  alias sel_mux1 : std_logic_vector(1 downto 0) is palavraControle(2 downto 1);
  alias sel_mux2 : std_logic_vector(1 downto 0) is palavraControle(13 downto 12);
  alias sel_mux3 : std_logic is palavraControle(3);
  alias sel_mux4 : std_logic_vector(1 downto 0) is palavraControle(5 downto 4);
  alias Habilitaleituramem : std_logic is palavraControle(6);
  alias HabilitaEscritamem : std_logic is palavraControle(7);
  alias BEQ : std_logic is palavraControle(14);  
  

   

  begin		 
	
	-- ULAop
	-- "00" --> soma sem funct
	-- "01" --> sub sem funct
	-- "10" --> analisar funct (soma, sub, or, and, slt)
	
	-- lw  opcode x23  --> 100011
	-- sw  opcode = x2b -->101011
	-- beq  opcode = x4--> 000100
	-- ori opcode = xd --> 001101 
	-- lui opcode = xF --> 001111
	
	-- addi opCode = x8--> 001000
	-- ANDI opCode = xc--> 001100
	-- slti opCode = xa -->001010
	
	-- bne opCode = x5 --> 000101
	-- jal opCode = x3 --> 000011
	-- jr funct = x8 --> 01000
	
	 
	 selULA <= "000" when Opcode = "100011" or  Opcode = "101011" else
				  "001" when Opcode = "000100" or Opcode = "000101" else
				  "011" when Opcode = "001101" else
				  "100" when Opcode = "001111" else
				  
				  "101" when Opcode = "001000" else
				  "110" when Opcode = "001100" else
				  "111" when Opcode = "001010" else
				  
				  "010";
				  	  
					 
	 sel_mux1 <= "01" when Opcode ="000010" or Opcode = "000011" else 
				 "10" when jr = '1' else
				 "00";
	 
	 sel_mux2 <= "01" when Opcode ="000000" else 
					 "10" when Opcode = "000011" else
					 "00";
	 
	 habilitaescrita_reg <= '1' when Opcode = "001101" or Opcode = "000011" or Opcode = "001111" or Opcode = "001000" or Opcode = "001010" or Opcode = "001100" or Opcode = "000000" or Opcode = "100011" else '0';
	 
	 sel_mux3 <= '1' when Opcode = "001101"  or Opcode = "001010" or Opcode = "001111" or Opcode ="101011" or Opcode="100011" or Opcode ="001011" or Opcode = "010011" or Opcode="001000" or Opcode= "001100" else '0';
	 
	 sel_mux4<= "10" when Opcode = "000011" else
					"01" when Opcode = "100011" else 
					"00";
	 
	 BEQ <= '1' when Opcode="000100" else '0';
	 
	 BNE <= '1' when Opcode = "000101" else '0';
	 
	 habilitaleituramem <= '1' when Opcode= "100011" else '0';
	 
	 habilitaescritamem <= '1' when Opcode = "101100" else '0';
	 
	 
	 
	 
	 
end architecture;