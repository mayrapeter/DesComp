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
	 ULA_saida, mux_imed_saida: out std_logic_vector(DATA_WIDTH-1 downto 0);
	 PC_saida: out std_logic_vector(ADDR_WIDTH-1 downto 0);
	 overflow, monitora_flag_z  :  out std_logic;
	 jr_out : out std_logic;
    SW : in std_logic_vector(1 downto 0);
	 KEY: in std_logic_vector(1 downto 0);
    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0)
  );
end entity;


architecture arch_name of ProcessadorMIPS is

	signal palavraControle : std_logic_vector(14 downto 0);
	signal Opcode : std_logic_vector(5 downto 0);
	signal jr: std_logic;
	signal auxReset: std_logic;
	
	signal ULA, mux_imed : std_logic_vector(DATA_WIDTH - 1 DOWNTO 0);
   signal to_display : std_logic_vector(23 downto 0);
	signal PC : std_logic_vector(ADDR_WIDTH-1 downto 0);


begin

	fluxo_dados : entity work.Fluxo_Dados   generic map (DATA_WIDTH => DATA_WIDTH, ADDR_WIDTH => ADDR_WIDTH, MEMORY_ADDR_WIDTH => MEMORY_ADDR_WIDTH, INC_PC => INC_PC)
          port map ( clk => auxReset,
				  palavraControle => palavraControle,
              ULA_saida => ULA,
				  PC_saida => PC,
				  overflow => overflow,
				  monitora_flag_z => monitora_flag_z,
				  jr_out => jr, 
				  Opcode_out => Opcode,
				  mux_imed_saida => mux_imed);
				  
	UC : entity work.UnidadeControle port map(clk => auxReset, Opcode => Opcode, palavraControle => palavraControle, jr => jr);
	
	detectorSub0: work.edgeDetector(bordaSubida) port map (clk => clk, entrada => (not KEY(0)), saida => auxReset);

	
	to_display <= PC(23 downto 0) when SW = "00" else
        mux_imed(23 downto 0) when SW = "01" else
        ULA(23 downto 0) when SW = "10" else
        (others => '0');
			  
	jr_out <= jr;
	mux_imed_saida <= mux_imed;
	PC_saida <= PC;
	ULA_saida <= ULA;
	
	display0 : entity work.conversorHex7Seg
        port map(
            dadoHex   => to_display(3 downto 0),
            apaga     => '0',
            negativo  => '0',
            overFlow  => '0',
            saida7seg => HEX0);

    display1 : entity work.conversorHex7Seg
        port map(
            dadoHex   => to_display(7 downto 4),
            apaga     => '0',
            negativo  => '0',
            overFlow  => '0',
            saida7seg => HEX1);
    display2 : entity work.conversorHex7Seg
        port map(
            dadoHex   => to_display(11 downto 8),
            apaga     => '0',
            negativo  => '0',
            overFlow  => '0',
            saida7seg => HEX2);

    display3 : entity work.conversorHex7Seg
        port map(
            dadoHex   => to_display(15 downto 12),
            apaga     => '0',
            negativo  => '0',
            overFlow  => '0',
            saida7seg => HEX3);


    display4 : entity work.conversorHex7Seg
        port map(
            dadoHex   => to_display(19 downto 16),
            apaga     => '0',
            negativo  => '0',
            overFlow  => '0',
            saida7seg => HEX4);

    display5 : entity work.conversorHex7Seg
        port map(
            dadoHex   => to_display(23 downto 20),
            apaga     => '0',
            negativo  => '0',
            overFlow  => '0',
            saida7seg => HEX5);
	
	
  
	
end architecture;