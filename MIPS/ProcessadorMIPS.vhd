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
    clk     : in  std_logic
  );
end entity;


architecture arch_name of ProcessadorMIPS is

  -- Declarations (optional):
  -- signal <name> : std_logic;
   signal PC, PC_Incr_Const : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal Instrucao, SaidaRegA, SaidaRegB, saidaULA: std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal palavraControle : std_logic_vector(1 downto 0);

	alias selULA : std_logic is palavraControle(1);
	alias HabilitaEscrita : std_logic is palavraControle(0);

  
   alias Opcode: std_logic_vector(5 DOWNTO 0) is Instrucao(31 downto 26);
	alias EndRs: std_logic_vector(4 DOWNTO 0) is Instrucao(25 downto 21);
	alias EndRt: std_logic_vector(4 DOWNTO 0) is Instrucao(20 downto 16);
	alias EndRd: std_logic_vector(4 DOWNTO 0) is Instrucao(15 downto 11);
	alias Shamt: std_logic_vector(4 DOWNTO 0) is Instrucao(10 downto 6);
	alias Funct: std_logic_vector(5 DOWNTO 0) is Instrucao(5 downto 0);

begin
	PC_Soma_Constante:  entity work.somaConstante  generic map (larguraDados => ADDR_WIDTH, constante => INC_PC)
        port map( entrada => PC, saida => PC_Incr_Const);
	
	PC_entity: entity work.registradorGenerico   generic map (larguraDados => ADDR_WIDTH)
          port map (DIN => PC_Incr_Const, DOUT => PC, ENABLE => '1', CLK => clk, RST => '0');

  -- Para instanciar, a atribuição de sinais (e generics) segue a ordem: (nomeSinalArquivoDefinicaoComponente => nomeSinalNesteArquivo)
   ROM:  entity work.ROMMIPS generic map (dataWidth => DATA_WIDTH, addrWidth => ADDR_WIDTH, memoryAddrWidth => MEMORY_ADDR_WIDTH)
          port map (clk => clk, Endereco =>  PC, Dado =>  Instrucao);
			 
	bancoRegs : entity work.bancoRegistradoresArqRegReg   generic map (larguraDados => DATA_WIDTH, larguraEndBancoRegs => 5)
          port map ( clk => clk,
              enderecoA => EndRs,
              enderecoB => EndRt,
              enderecoC => EndRd,
              dadoEscritaC => saidaULA,
              escreveC => HabilitaEscrita,
              saidaA => SaidaRegA,
              saidaB  => SaidaRegB);

	ULA : entity work.ULA  generic map(larguraDados => DATA_WIDTH)
          port map (entradaA => SaidaRegA, entradaB =>  SaidaRegB, seletor => selULA, saida => saidaULA);
			 
	UC : entity work.UnidadeControle port map( clk => clk, Opcode => Opcode, funct => Funct, palavraControle => palavraControle);
	
end architecture;