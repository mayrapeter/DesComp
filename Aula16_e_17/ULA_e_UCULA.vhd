library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA_e_UCULA is
  generic   (
    DATA_WIDTH  : natural :=  32;
    ADDR_WIDTH  : natural :=  32
  );

  port   (
    -- Input ports
	 entradaA, entradaB: in std_logic_vector(DATA_WIDTH-1 downto 0);
	 funct   :  in std_logic_vector(5 downto 0);
	 ULA_saida: out std_logic_vector(DATA_WIDTH-1 downto 0);
	 ULA_op : in std_logic_vector(1 downto 0);
	 overflow  :  out std_logic
  );
end entity;


architecture arch_name of ULA_e_UCULA is

  -- Declarations (optional):
  -- signal <name> : std_logic;
  signal ULA_ctrl : std_logic_vector(3 downto 0);


begin

	ULA : entity work.ULA32bits
          port map (
			 entradaA => entradaA, 
			 entradaB =>  entradaB, 
			 overflow_final => overflow,
			 operacao => ULA_ctrl, 
			 resultado => ULA_saida);
			 
	UC_ULA : entity work.UC_ULA
			port map(
				ula_op => ULA_op,
				funct => funct,
				ula_ctrl => ULA_ctrl
			);	
	
end architecture;