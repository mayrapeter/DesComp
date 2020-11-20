library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadeControle is
  port   (
    -- Input ports
    clk  :  in  std_logic;
	 Opcode  :  in  std_logic_vector(5 downto 0);
	 Funct   :  in  std_logic_vector(5 downto 0);
    -- Output ports
    palavraControle  :  out std_logic_vector(9 downto 0)
  );
end entity;


architecture arch_name of UnidadeControle is

-- aliases para saida
  alias selULA : std_logic_vector is palavraControle(9 downto 8);
  alias HabilitaEscrita_reg : std_logic is palavraControle(0);
  alias sel_mux1 : std_logic is palavraControle(2);
  alias sel_mux2 : std_logic is palavraControle(3);
  alias sel_mux3 : std_logic is palavraControle(4);
  alias sel_mux4 : std_logic is palavraControle(5);
  alias Habilitaleituramem : std_logic is palavraControle(6);
  alias HabilitaEscritamem : std_logic is palavraControle(7);
  alias BEQ : std_logic is palavraControle(1);
  

   

  begin		 
	
	-- ULAop
	-- "00" --> soma sem funct
	-- "01" --> sub sem funct
	-- "10" --> analisar funct (soma, sub, or, and, slt)
	
	-- lw  opcode x23  --> 100011
	-- sw  opcode = x2b -->101011
	-- beq  opcode = x 4--> 000100
	
	 
	 selULA <= "00" when Opcode = "100011" OR  Opcode = "101011" else
				  "01" when Opcode = "000100"  else
				  "10";
					 
	 sel_mux1 <= '1' when Opcode ="000010" else '0';
	 
	 sel_mux2 <= '1' when Opcode ="000000" else '0';
	 
	 habilitaescrita_reg <= '1' when Opcode = "000000" or Opcode = "100011" else '0';
	 
	 sel_mux3 <= '1' when Opcode ="101011" or Opcode="100011" or Opcode ="001011" or Opcode = "010011" or Opcode="001000" or Opcode= "001100" else '0';
	 
	 sel_mux4<= '0' when Opcode ="000000" or Opcode = "101011" or Opcode = "000100" else '1';
	 
	 BEQ <= '1' when Opcode="000100" else '0';
	 
	 habilitaleituramem <= '1' when Opcode= "100011" else '0';
	 
	 habilitaescritamem <= '1' when Opcode = "101100" else '0';
	 
	 
	 
	 
	 
end architecture;