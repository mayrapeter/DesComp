library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProcessadorMIPS is
  generic   (
    DATA_WIDTH  : natural :=  32;
    ADDR_WIDTH  : natural :=  32;
	 MEMORY_ADDR_WIDTH: natural := 6;
	 INC_PC: natural := 4
  );

  port   (
    -- Input ports
    clk     : in  std_logic;
	 ULA_saida: out std_logic_vector(DATA_WIDTH-1 downto 0);
	 PC_saida: out std_logic_vector(ADDR_WIDTH-1 downto 0);
	 overflow, monitora_flag_z  :  out std_logic;
	 jr_out : out std_logic
  );
end entity;


architecture arch_name of ProcessadorMIPS is

	signal palavraControle : std_logic_vector(14 downto 0);
	signal Opcode : std_logic_vector(5 downto 0);
	signal jr: std_logic;


begin

	fluxo_dados : entity work.Fluxo_Dados   generic map (DATA_WIDTH => DATA_WIDTH, ADDR_WIDTH => ADDR_WIDTH, MEMORY_ADDR_WIDTH => MEMORY_ADDR_WIDTH, INC_PC => INC_PC)
          port map ( clk => clk,
				  palavraControle => palavraControle,
              ULA_saida => ULA_saida,
				  PC_saida => PC_saida,
				  overflow => overflow,
				  monitora_flag_z => monitora_flag_z,
				  jr_out => jr, 
				  Opcode_out => Opcode);
				  
	UC : entity work.UnidadeControle port map( clk => clk, Opcode => Opcode, palavraControle => palavraControle, jr => jr);
			  
	jr_out <= jr;
  
	
end architecture;