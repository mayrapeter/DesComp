library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA1bit is
  generic   (
    DATA_WIDTH  : natural :=  8;
    ADDR_WIDTH  : natural :=  8
  );

  port   (
    -- Input ports
    entradaA, entradaB, inverteA, inverteB, carry_in, entrada_slt  :  in  std_logic;
    selecao  : in  std_logic_vector(1 downto 0);

    -- Output ports
    carry_out, resultado, saida_slt, overflow :  out  std_logic
  );
end entity;


architecture arch_name of ULA1bit is

  -- Declarations (-optional):
   signal saida_mux_inverteA, saida_mux_inverteB, saida_and, saida_or, saida_soma_sub, resultado_saida : std_logic;

begin

  mux_inverteA: entity work.muxGenerico2x1_1bit
        port map( entradaA_MUX => entradaA,
                 entradaB_MUX =>  not(entradaA),
                 seletor_MUX => inverteA,
                 saida_MUX => saida_mux_inverteA);
					  
	mux_inverteB: entity work.muxGenerico2x1_1bit
        port map( entradaA_MUX => entradaB,
                 entradaB_MUX =>  not(entradaB),
                 seletor_MUX => inverteB,
                 saida_MUX => saida_mux_inverteB);
		
	saida_and <= saida_mux_inverteA and saida_mux_inverteB;
	
	saida_or <= saida_mux_inverteA or saida_mux_inverteB;
	
	soma_sub : entity work.SomadorCompleto
    port map( entradaA          => saida_mux_inverteA,
	           entradaB          => saida_mux_inverteB,
				  carry_in             => carry_in,
				  carry_out             => carry_out,
				  saida              => saida_soma_sub);
		
	mux_ula : entity work.muxGenerico4x1
    port map( entradaA_MUX => saida_and, 
				  entradaB_MUX => saida_or, 
				  entradaC_MUX => saida_soma_sub,
				  entradaD_MUX => entrada_slt,
				  seletor_MUX => selecao, 
				  saida_MUX => resultado_saida);
				  
	Overflow_exists: entity work.overflow
		port map( entradaA => entradaA,
					 entradaB => entradaB,
					 resultado => resultado_saida,
					 overflow => overflow);
		
	saida_slt <= saida_soma_sub;
	resultado <= resultado_saida;
				  
end architecture;
