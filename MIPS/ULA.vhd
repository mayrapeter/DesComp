library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.constantesMIPS.all;

entity ULA32bits is

  port   (
	-- Input ports
	entradaA, entradaB     : in std_logic_vector(31 downto 0);
	operacao	    : in std_logic_vector(3 downto 0);
	-- Output ports
	overflow_final, flag_zero : out std_logic;
	resultado	 : out std_logic_vector(31 downto 0);
	
	 
    );
end entity;

architecture arch_name of ULA32bits is

  signal  carry_in1 : std_logic; 
  signal  carry_out, overflow_vetor, set_final, flag_Z : std_logic_vector(31 downto 0);
  
  alias  inverteA : std_logic is operacaoULA(3); 
  alias  inverteB : std_logic is operacaoULA(2); 
  alias  ula_ctrl : std_logic_vector(1 downto 0) is operacao(1 downto 0);

begin
  
  carry_in1 <= inverteB;

  ula0 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(0),
			  entradaB           => entradaB(0),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_in1,
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(0),
			  resultado     		=> resultado(0),
			  flag_Z          	=> flag_Z(0),
	);
	
	ula1 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(1),
			  entradaB           => entradaB(1),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(0),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(1)
			  resultado     		=> resultado(1),
			  flag_Z          	=> flag_Z(1),
	);
	
	ula2 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(2),
			  entradaB           => entradaB(2),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(1),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(2)
			  resultado     		=> resultado(2),
			  flag_Z          	=> flag_Z(2),
	);
	
	ula3 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(3),
			  entradaB           => entradaB(3),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(2),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(3)
			  resultado     		=> resultado(3),
			  flag_Z          	=> flag_Z(3),
	);

	ula4 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(4),
			  entradaB           => entradaB(4),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(3),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(4)
			  resultado     		=> resultado(4),
			  flag_Z          	=> flag_Z(4),
	);


	ula5 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(5),
			  entradaB           => entradaB(5),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(4),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(5)
			  resultado     		=> resultado(5),
			  flag_Z          	=> flag_Z(5),
	);


	ula6 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(6),
			  entradaB           => entradaB(6),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(5),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(6)
			  resultado     		=> resultado(6),
			  flag_Z          	=> flag_Z(6),
	);


	ula7 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(7),
			  entradaB           => entradaB(7),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(6),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(7)
			  resultado     		=> resultado(7),
			  flag_Z          	=> flag_Z(7),
	);


	ula8 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(8),
			  entradaB           => entradaB(8),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(7),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(8)
			  resultado     		=> resultado(8),
			  flag_Z          	=> flag_Z(8),
	);


	ula9 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(9),
			  entradaB           => entradaB(9),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(8),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(9)
			  resultado     		=> resultado(9),
			  flag_Z          	=> flag_Z(9),
	);


	ula10 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(10),
			  entradaB           => entradaB(10),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(9),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(10)
			  resultado     		=> resultado(10),
			  flag_Z          	=> flag_Z(10),
	);


	ula11 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(11),
			  entradaB           => entradaB(11),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(10),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(11)
			  resultado     		=> resultado(11),
			  flag_Z          	=> flag_Z(11),
	);

	ula12 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(12),
			  entradaB           => entradaB(12),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(11),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(12)
			  resultado     		=> resultado(12),
			  flag_Z          	=> flag_Z(12),
	);

	ula13 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(13),
			  entradaB           => entradaB(13),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(12),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(13)
			  resultado     		=> resultado(13),
			  flag_Z          	=> flag_Z(13),
	);
	
	ula14 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(14),
			  entradaB           => entradaB(14),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(13),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(14)
			  resultado     		=> resultado(14),
			  flag_Z          	=> flag_Z(14),
	);

	ula15 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(15),
			  entradaB           => entradaB(15),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(14),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(15)
			  resultado     		=> resultado(15),
			  flag_Z          	=> flag_Z(15),
	);

	ula16 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(16),
			  entradaB           => entradaB(16),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(15),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(16)
			  resultado     		=> resultado(16),
			  flag_Z          	=> flag_Z(16),
	);

	ula17 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(17),
			  entradaB           => entradaB(17),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(16),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(17)
			  resultado     		=> resultado(17),
			  flag_Z          	=> flag_Z(17),
	);

	ula18 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(18),
			  entradaB           => entradaB(18),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(17),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(18)
			  resultado     		=> resultado(18),
			  flag_Z          	=> flag_Z(18),
	);

	ula19 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(19),
			  entradaB           => entradaB(19),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(18),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(19)
			  resultado     		=> resultado(19),
			  flag_Z          	=> flag_Z(19),
	);
	
	ula20 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(20),
			  entradaB           => entradaB(20),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(19),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(20)
			  resultado     		=> resultado(20),
			  flag_Z          	=> flag_Z(20),
	);

	ula21 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(21),
			  entradaB           => entradaB(21),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(20),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(21)
			  resultado     		=> resultado(21),
			  flag_Z          	=> flag_Z(21),
	);

	ula22 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(22),
			  entradaB           => entradaB(22),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(21),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(22)
			  resultado     		=> resultado(22),
			  flag_Z          	=> flag_Z(22),
	);


	ula23 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(23),
			  entradaB           => entradaB(23),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(22),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(23)
			  resultado     		=> resultado(23),
			  flag_Z          	=> flag_Z(23),
	);


	ula24 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(24),
			  entradaB           => entradaB(24),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(23),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(24)
			  resultado     		=> resultado(24),
			  flag_Z          	=> flag_Z(24),
	);


	ula25 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(25),
			  entradaB           => entradaB(25),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(24),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(25)
			  resultado     		=> resultado(25),
			  flag_Z          	=> flag_Z(25),
	);

	ula26 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(26),
			  entradaB           => entradaB(26),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(25),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(26)
			  resultado     		=> resultado(26),
			  flag_Z          	=> flag_Z(26),
	);


	ula27 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(27),
			  entradaB           => entradaB(27),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(26),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(27)
			  resultado     		=> resultado(27),
			  flag_Z          	=> flag_Z(27),
	);


	ula28 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(28),
			  entradaB           => entradaB(28),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(27),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(28)
			  resultado     		=> resultado(28),
			  flag_Z          	=> flag_Z(28),
	);


	ula29 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(29),
			  entradaB           => entradaB(29),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(28),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(29)
			  resultado     		=> resultado(29),
			  flag_Z          	=> flag_Z(29),
	);


	ula30 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(30),
			  entradaB           => entradaB(30),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(29),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(30)
			  resultado     		=> resultado(30),
			  flag_Z          	=> flag_Z(30),
	);

	ula31 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA           => entradaA(31),
			  entradaB           => entradaB(31),
			  inverteA       		=> inverteA,
			  inverteB   			=> inverteB,
			  carry_in           => carry_out(30),
			  selecao        		=> ula_ctrl,
			  -- Output ports
			  carry_out          => carry_out(31)
			  resultado     		=> resultado(31),
			  flag_Z          	=> flag_Z(31),
	);

	flag_zero <= flag_Z(0) and flag_Z(1) and flag_Z(2) and flag_Z(3) and flag_Z(4) and flag_Z(5) and flag_Z(6) and flag_Z(7) and
					flag_Z(8) and flag_Z(9) and flag_Z(10) and flag_Z(11) and flag_Z(12) and flag_Z(13) and flag_Z(14) and flag_Z(15) and
					flag_Z(16) and flag_Z(17) and flag_Z(18) and flag_Z(19) and flag_Z(20) and flag_Z(21) and flag_Z(22) and flag_Z(23) and
					flag_Z(24) and flag_Z(25) and flag_Z(26) and flag_Z(27) and flag_Z(28) and flag_Z(29) and flag_Z(30) and flag_Z(21);
			  
end architecture;