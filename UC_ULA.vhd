library ieee;
use ieee.std_logic_1164.all;

entity UC_ULA is
  port (
    opCode  : in std_logic_vector(2 downto 0);
    habilita : out std_logic_vector(7 downto 0)
  );
end entity;

architecture comportamento of UC_ULA is
  signal seletor_de_blocos: std_logic_vector(1 downto 0);
  signal habilita1: std_logic_vector(3 downto 0);
  
  begin
    seletor_de_blocos <= seletor(7 downto 6);
	 
	 with opCode select
	 habilita1<= "0001" when "000", --bloco 0 load
				    "0010" when "001", -- bloco 1 store
					 "0100" when "010", -- bloco 2 soma com imediato
					 "1000" when "011", -- bloco 3 soma com memoria
					 "1000" when "100", -- bloco 4 subtracao com imediato
					 "1000" when "101", -- bloco 5 subtracao com memoria
					 "1000" when "110", -- bloco 6 BEQ		
					 "1000" when "111", -- bloco 7 jump		 
					 "0000" when others;
					 
	habilita(1 downto 0) <= habilita1(1 downto 0);					 
					 
end architecture;
