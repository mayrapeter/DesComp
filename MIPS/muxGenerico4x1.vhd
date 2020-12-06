library ieee;
use ieee.std_logic_1164.all;

entity muxGenerico4x1 is
  -- Total de bits das entradas e saidas
  port (
    entradaA_MUX, entradaB_MUX , entradaC_MUX, entradaD_MUX, entradaE_MUX: in std_logic;
    seletor_MUX : in std_logic_vector(2 downto 0);
    saida_MUX : out std_logic
  );
end entity;

architecture comportamento of muxGenerico4x1 is
  begin
    saida_MUX <= entradaA_MUX when (seletor_MUX = "000") else
					  entradaB_MUX when (seletor_MUX = "001") else
                 entradaC_MUX when (seletor_MUX = "010") else
                 entradaD_MUX when (seletor_MUX = "011") else
					  entradaE_MUX;
end architecture;