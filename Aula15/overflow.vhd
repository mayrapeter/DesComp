library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity overflow is

  port   (
   -- Input ports
	entradaA, entradaB, resultado :  in std_logic;
	-- Output ports
	overflow          : out std_logic
	 
    );
end entity;

architecture arch_name of overflow is
  signal  saidaAB1      : std_logic;
  signal  saidaAB2      : std_logic;
   
begin
				  
  saidaAB1 <= not(entradaA) and not(entradaB) and resultado;
  saidaAB2 <= entradaA and entradaB and not(resultado);
  
  overflow <= saidaAB1 or saidaAB2;
  
end architecture;