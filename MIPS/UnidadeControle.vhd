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
    palavraControle  :  out std_logic_vector(1 downto 0)
  );
end entity;


architecture arch_name of UnidadeControle is

-- aliases para saida
  alias selULA : std_logic is palavraControle(1);
  alias HabilitaEscrita : std_logic is palavraControle(0);
  
  constant soma : std_logic := '0';
  constant sub : std_logic := '1';
   

  begin		 
	
	 HabilitaEscrita <= '1' when Opcode = "000000" else '0';
	 selULA <= soma when Opcode = "000000" AND Funct = 6x"20" else
					 sub when Opcode = "000000" AND Funct = 6x"22" else
					 '0';
	 
end architecture;