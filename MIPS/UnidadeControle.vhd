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
    palavraControle  :  out std_logic_vector(8 downto 0)
  );
end entity;


architecture arch_name of UnidadeControle is

-- aliases para saida
  alias selULA : std_logic is palavraControle(1);
  alias HabilitaEscrita_reg : std_logic is palavraControle(0);
  alias sel_mux1 : std_logic is palavraControle(2);
  alias sel_mux2 : std_logic is palavraControle(3);
  alias sel_mux3 : std_logic is palavraControle(4);
  alias sel_mux4 : std_logic is palavraControle(5);
  alias Habilitaleituramem : std_logic is palavraControle(6);
  alias HabilitaEscritamem : std_logic is palavraControle(7);
  alias BEQ : std_logic is palavraControle(8);
  
 
  constant soma : std_logic := '0';
  constant sub : std_logic := '1';
   

  begin		 
	
	 
	 selULA <= soma when Opcode = "000000" AND Funct = 6x"20" else
					 sub when Opcode = "000000" AND Funct = 6x"22" else
					 soma when Opcode = 6x"23" else
					 soma when Opcode = 6x"2b" else
					 sub when Opcode = 6x"4" else
					 '0';
					 
	 sel_mux1 <= '1' when Opcode ="0000001" else '0';
	 
	 sel_mux2 <= '0' when Opcode ="000000" else '1';
	 
	 habilitaescrita_reg <= '1' when Opcode = "000000" AND Opcode = "100011" else '0';
	 
	 sel_mux3 <= '1' when Opcode ="101011" and Opcode ="001011" and Opcode = "010011" and Opcode="001000" and Opcode= "001100" else '0';
	 
	 sel_mux4<= '0';
	 
	 BEQ <= '1' when Opcode="000100" else '0';
	 
	 habilitaleituramem <= '1' when Opcode= "100011" else '0';
	 
	 habilitaescritamem <= '1' when Opcode = "101100" else '0';
	 
	 
	 
	 
	 
end architecture;