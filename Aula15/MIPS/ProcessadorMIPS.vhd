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
	 ULA_op : in std_logic_vector(1 downto 0);
	 PC_saida: out std_logic_vector(ADDR_WIDTH-1 downto 0);
	 overflow  :  out std_logic
  );
end entity;


architecture arch_name of ProcessadorMIPS is

  -- Declarations (optional):
  -- signal <name> : std_logic;
   signal PC, PC_Incr_Const : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal Instrucao, SaidaRegA, SaidaRegB, saidaULA: std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal saida_mux_rt_rd: std_logic_vector(4 downto 0);
	
	signal estendido_shift: std_logic_vector(25 downto 0);
	signal sinal_concatenado, dado_lido: std_logic_vector(31 downto 0);
	signal palavraControle : std_logic_vector(8 downto 0);
	signal imediato_estendido, imediato_estendido2, mux_rt_saida, somador2, saida_mux_ULA_mem, saida_mux_beq, estendido_soma_constante, mux_pc_saida : std_logic_vector(31 downto 0);
	signal flag_z, sel_beq_jmp: std_logic;
	signal ULA_ctrl: std_logic_vector(3 downto 0);
	signal selULA : std_logic_vector(3 downto 0);
	
	alias HabilitaEscrita : std_logic is palavraControle(0);

	alias imediato16: std_logic_vector(15 DOWNTO 0) is Instrucao(15 downto 0);
	alias imediato26: std_logic_vector(25 DOWNTO 0) is Instrucao(25 downto 0);

	
   alias Opcode: std_logic_vector(5 DOWNTO 0) is Instrucao(31 downto 26);
	alias EndRs: std_logic_vector(4 DOWNTO 0) is Instrucao(25 downto 21);
	alias EndRt: std_logic_vector(4 DOWNTO 0) is Instrucao(20 downto 16);
	alias EndRd: std_logic_vector(4 DOWNTO 0) is Instrucao(15 downto 11);
	alias Shamt: std_logic_vector(4 DOWNTO 0) is Instrucao(10 downto 6);
	alias Funct: std_logic_vector(5 DOWNTO 0) is Instrucao(5 downto 0);
	
	alias selMux_pc : std_logic is palavraControle(2);
	alias sel_rt_rd : std_logic is palavraControle(3);
	alias selMux_rt_imediato : std_logic is palavraControle(4);
	alias sel_ULA_mem : std_logic is palavraControle(5);
	alias re : std_logic is palavraControle(6);
	alias we : std_logic is palavraControle(7);
	alias beq : std_logic is palavraControle(8);

begin
	PC_Soma_Constante:  entity work.somaConstante  generic map (larguraDados => ADDR_WIDTH, constante => INC_PC)
        port map( entrada => PC, saida => PC_Incr_Const);
	
	PC_entity: entity work.registradorGenerico   generic map (larguraDados => ADDR_WIDTH)
          port map (DIN => mux_pc_saida, DOUT => PC, ENABLE => '1', CLK => clk, RST => '0');

  -- Para instanciar, a atribuição de sinais (e generics) segue a ordem: (nomeSinalArquivoDefinicaoComponente => nomeSinalNesteArquivo)
   ROM:  entity work.ROMMIPS generic map (dataWidth => DATA_WIDTH, addrWidth => ADDR_WIDTH, memoryAddrWidth => MEMORY_ADDR_WIDTH)
          port map (clk => clk, Endereco =>  PC, Dado =>  Instrucao);
			 
	bancoRegs : entity work.bancoRegistradoresArqRegReg   generic map (larguraDados => DATA_WIDTH, larguraEndBancoRegs => 5)
          port map ( clk => clk,
              enderecoA => EndRs,
              enderecoB => EndRt,
              enderecoC => saida_mux_rt_rd,
              dadoEscritaC => saida_mux_ULA_mem,
              escreveC => HabilitaEscrita,
              saidaA => SaidaRegA,
              saidaB  => SaidaRegB);

	ULA : entity work.ULA
          port map (
			 entradaA => SaidaRegA, 
			 entradaB =>  mux_rt_saida, 
			 overflow_final => overflow,
			 operacao => ULA_ctrl, 
			 resultado => saidaULA, 
			 flag_zero => flag_z);
			 
	UC_ULA : entity work.UC_ULA
			port map(
				ula_op => ULA_op,
				funct => Funct,
				ula_ctrl => ULA_ctrl
			);	
						
			 
	UC : entity work.UnidadeControle port map( clk => clk, Opcode => Opcode, funct => Funct, palavraControle => palavraControle);
	
	mux_rt_imediato: entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => SaidaRegB,
                 entradaB_MUX =>  imediato_estendido2,
                 seletor_MUX => selMux_rt_imediato,
                 saida_MUX => mux_rt_saida);
					  
	mux_PC: entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saida_mux_beq,
                 entradaB_MUX =>  sinal_concatenado,
                 seletor_MUX => selMux_pc,
                 saida_MUX => mux_pc_saida);				  
					  
	mux_beq: entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => PC_Incr_Const,
                 entradaB_MUX =>  somador2,
                 seletor_MUX => beq and flag_z,
                 saida_MUX => saida_mux_beq);
					  
	mux_rt_rd: entity work.muxGenerico2x1  generic map (larguraDados => 5)
        port map( entradaA_MUX => EndRt,
                 entradaB_MUX =>  EndRd,
                 seletor_MUX => sel_rt_rd,
                 saida_MUX => saida_mux_rt_rd);	
					  
	mux_ULA_mem: entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaULA,
                 entradaB_MUX =>  dado_lido,
                 seletor_MUX => sel_ULA_mem,
                 saida_MUX => saida_mux_ULA_mem);					  
					  
	PC_Soma_imediato:  entity work.somador 
        port map( entradaA => PC_Incr_Const, entradaB => imediato_estendido2, saida => somador2);				  
	
	
	RAM: entity work.RAMMIPS
        port map( clk => clk,
                 Endereco =>  saidaULA,
                 Dado_in => SaidaRegB,
                 Dado_out => dado_lido,
					  we => we,
					  re => re
					  );
					  
	estende_sinal : entity work.estendeSinalGenerico   
          port map (
			 estendeSinal_IN => imediato16, 
			 estendeSinal_OUT => imediato_estendido2 
			 );
	
   concatena : entity work.concatena   
          port map (
			 PC => PC_Incr_Const, 
			 Imediato => imediato26,
			 sinal_concatenado => sinal_concatenado
			 );
			 
	
					  
	ULA_saida <= saidaULA;
	PC_saida <= PC;
	
end architecture;