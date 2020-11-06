library ieee;
use ieee.std_logic_1164.all;

entity concatena is
    port
    (
        -- Input ports
        PC : in  std_logic_vector(3 downto 0);
		  Imediato : in  std_logic_vector(25 downto 0);
        -- Output ports
        sinal_concatenado: out std_logic_vector(31 downto 0)
    );
end entity;

architecture comportamento of concatena is
begin
    imediato_shift<= shift_left(signed(Imediato), 2);
	 sinal_concatenado(31 downto 28) <= PC;
	 sinal_concatenado(27 downto 0) <= imediato_shift;
	 
end architecture;