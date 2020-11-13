library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somadorCompleto is

  port   (
   -- Input ports
	entradaA          :  in std_logic;
	entradaB          :  in std_logic;
	carry_in             :  in std_logic;
	-- Output ports
	carry_out             : out std_logic;
	saida              : out std_logic
	 
    );
end entity;

architecture arch_name of somadorCompleto1bit is
  signal  saida_xor, saida_and, saida_xor2      : std_logic;
   
begin
				  
  saida_xor <= entradaA xor entradaB;
  saida_and <= entradaA and entradaB;
  saida_xor2 <= carry_in and saida_xor;
  
  saida <= carry_in xor saida_xor;
  carry_out <= saida_and or saida_xor2;
  
end architecture;