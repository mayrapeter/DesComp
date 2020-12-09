library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Fluxo_Dados is
   generic   (
    DATA_WIDTH  : natural :=  32;
    ADDR_WIDTH  : natural :=  32;
	 MEMORY_ADDR_WIDTH: natural := 6;
	 INC_PC: natural := 4
  );

  port   (
    -- Input ports
    clk     : in  std_logic;
	 palavraControle : in std_logic_vector(14 downto 0);
	 ULA_saida, mux_imed_saida: out std_logic_vector(DATA_WIDTH-1 downto 0);
	 PC_saida: out std_logic_vector(ADDR_WIDTH-1 downto 0);
	 Opcode_out: out std_logic_vector(5 downto 0);
	 jr_out: out std_logic


  );
end entity;


architecture arch_name of Fluxo_Dados is

  -- Declarations (optional):
  -- signal <name> : std_logic;
   signal PC, PC_Incr_Const : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal Instrucao, SaidaRegA, SaidaRegB, saidaULA: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal jr: std_logic;
	
	signal saida_mux_rt_rd: std_logic_vector(4 downto 0);
	
	signal estendido_shift: std_logic_vector(25 downto 0);
	signal sinal_concatenado, dado_lido: std_logic_vector(31 downto 0);
	signal imediato_estendido2, shiftado, mux_rt_saida, somador2, saida_mux_ULA_mem, saida_mux_beq, estendido_soma_constante, mux_pc_saida : std_logic_vector(31 downto 0);
	signal flag_z, sel_beq_jmp: std_logic;
	signal ULA_ctrl: std_logic_vector(4 downto 0);
	signal selULA : std_logic_vector(3 downto 0);
	signal selmuxBeq: std_logic;
	
	
	alias HabilitaEscrita : std_logic is palavraControle(0);
	alias selMux_pc : std_logic_vector(1 downto 0) is palavraControle(2 downto 1);
	alias sel_rt_rd : std_logic_vector(1 downto 0) is palavraControle(13 downto 12);
	alias selMux_rt_imediato : std_logic is palavraControle(3);
	alias sel_ULA_mem : std_logic_vector(1 downto 0) is palavraControle(5 downto 4);
	alias re : std_logic is palavraControle(6);
	alias we : std_logic is palavraControle(7);
	alias beq : std_logic is palavraControle(14);
	alias ULA_op : std_logic_vector(2 downto 0) is palavraControle(10 downto 8);
	alias bne : std_logic is palavraControle(11);

	-- registradores da pipeline

	signal regIFID : std_logic_vector(63 downto 0);
	alias PC_soma_constIFID : std_logic_vector(31 downto 0) is regIFID(63 downto 32);
	alias instrucaoIFID : std_logic_vector(31 downto 0) is regIFID(31 downto 0);
	
	alias imediato16: std_logic_vector(15 DOWNTO 0) is instrucaoIFID(15 downto 0);
	alias imediato26: std_logic_vector(25 DOWNTO 0) is instrucaoIFID(25 downto 0);
	
   alias Opcode: std_logic_vector(5 DOWNTO 0) is instrucaoIFID(31 downto 26);
	alias EndRs: std_logic_vector(4 DOWNTO 0) is instrucaoIFID(25 downto 21);
	alias EndRt: std_logic_vector(4 DOWNTO 0) is instrucaoIFID(20 downto 16);
	alias EndRd: std_logic_vector(4 DOWNTO 0) is instrucaoIFID(15 downto 11);
	alias Shamt: std_logic_vector(4 DOWNTO 0) is instrucaoIFID(10 downto 6);
	alias FunctFD: std_logic_vector(5 DOWNTO 0) is instrucaoIFID(5 downto 0);

	signal regIDEX : std_logic_vector(156 downto 0);
	alias FunctEX: std_logic_vector(5 DOWNTO 0) is regIDEX(156 downto 151);
	alias ULA_opIDEX : std_logic_vector(2 downto 0) is regIDEX(150 downto 148);
	alias saidaWBIDEX : std_logic_vector(4 downto 0) is regIDEX(147 downto 143);
	alias bneIDEX : std_logic is regIDEX(142);
	alias beqIDEX : std_logic is regIDEX(141);
	alias selMux_rt_imediatoIDEX : std_logic is regIDEX(140);
	alias sel_rt_rdIDEX : std_logic_vector(1 downto 0) is regIDEX(139 downto 138);
	alias PC_soma_constIDEX : std_logic_vector(31 downto 0) is regIDEX(137 downto 106);
	alias SaidaRegAIDEX : std_logic_vector(31 downto 0) is regIDEX(105 downto 74);
	alias SaidaRegBIDEX : std_logic_vector(31 downto 0) is regIDEX(73 downto 42);
	alias imediato_estendido2IDEX : std_logic_vector(31 downto 0) is regIDEX(41 downto 10);
	alias endRtIDEX : std_logic_vector(4 downto 0) is regIDEX(9 downto 5);
	alias endRdIDEX : std_logic_vector(4 downto 0) is regIDEX(4 downto 0);

	signal regEXMEM : std_logic_vector(105 downto 0);
	alias saidaWBEXMEM : std_logic_vector(2 downto 0) is regEXMEM(105 downto 103);
	alias weEXMEM : std_logic is regEXMEM(102);
	alias reEXMEM : std_logic is regEXMEM(101);
	alias PC_soma_constEXMEM : std_logic_vector(31 downto 0) is regEXMEM(100 downto 69);
	alias saidaULAEXMEM : std_logic_vector(31 downto 0) is regEXMEM(68 downto 37);
	alias SaidaRegBEXMEM : std_logic_vector(31 downto 0) is regEXMEM(36 downto 5);
	alias end_reg3EXMEM : std_logic_vector(4 downto 0) is regEXMEM(4 downto 0);

	signal regMEMWB : std_logic_vector(103 downto 0);
	alias sel_ULA_memMEMWB : std_logic_vector(1 downto 0) is regMEMWB(103 downto 102);
	alias HabilitaEscritaMEMWB : std_logic is regMEMWB(101);
	alias PC_soma_const_MEMWB : std_logic_vector(31 downto 0) is regMEMWB(100 downto 69);
	alias dado_lidoMEMWB : std_logic_vector(31 downto 0) is regMEMWB(68 downto 37);
	alias saidaULAMEMWB : std_logic_vector(31 downto 0) is regMEMWB(36 downto 5);
	alias end_reg3MEMWB : std_logic_vector(4 downto 0) is regMEMWB(4 downto 0);

begin
	PC_Soma_Constante:  entity work.somaConstante  generic map (larguraDados => ADDR_WIDTH, constante => INC_PC)
        port map( entrada => PC, saida => PC_Incr_Const);
	
	PC_entity: entity work.registradorGenerico   generic map (larguraDados => ADDR_WIDTH)
          port map (DIN => mux_pc_saida, DOUT => PC, ENABLE => '1', CLK => clk, RST => '0');

	-- Para instanciar, a atribuição de sinais (e generics) segue a ordem: (nomeSinalArquivoDefinicaoComponente => nomeSinalNesteArquivo)
	ROM:  entity work.ROMMIPS generic map (dataWidth => DATA_WIDTH, addrWidth => ADDR_WIDTH, memoryAddrWidth => MEMORY_ADDR_WIDTH)
			port map (Endereco =>  PC, Dado =>  Instrucao);
	
	regIFID1 : entity work.registradorGenerico   generic map (larguraDados => 64)
			--                  63-32           31-0
			port map (DIN => PC_Incr_Const & Instrucao, 
						DOUT => regIFID, 
						ENABLE => '1', 
						CLK => clk, 
						RST => '0');

	bancoRegs : entity work.bancoRegistradoresArqRegReg   generic map (larguraDados => DATA_WIDTH, larguraEndBancoRegs => 5)
          port map ( clk => clk,
              enderecoA => EndRs,
              enderecoB => EndRt,
              enderecoC => end_reg3MEMWB,
              dadoEscritaC => saida_mux_ULA_mem,
              escreveC => HabilitaEscritaMEMWB,
              saidaA => SaidaRegA,
              saidaB  => SaidaRegB);

	ULA : entity work.ULA
          port map (
			 entradaA => SaidaRegAIDEX, 
			 entradaB =>  mux_rt_saida, 
			 operacao => ULA_ctrl, 
			 resultado_final => saidaULA, 
			 flag_zero => flag_z);
			 
	UC_ULA : entity work.UC_ULA
			port map(
				ula_op => ULA_opIDEX,
				funct => FunctEX,
				ula_ctrl => ULA_ctrl, 
				jr => jr
			);	

	regIDEX1 : entity work.registradorGenerico   generic map (larguraDados => 157) 

			port map (DIN => FunctFD & ULA_op & sel_ULA_mem & HabilitaEscrita & we & re & bne 
						& beq & selMux_rt_imediato & sel_rt_rd & PC_soma_constIFID 
						& SaidaRegA & SaidaRegB & imediato_estendido2 & 
						EndRt & EndRd, 
						DOUT => regIDEX, 
						ENABLE => '1', 
						CLK => clk, 
						RST => '0');				
			 	
	mux_rt_imediato: entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => SaidaRegBIDEX,
                 entradaB_MUX =>  imediato_estendido2IDEX,
                 seletor_MUX => selMux_rt_imediatoIDEX,
                 saida_MUX => mux_rt_saida);
					  
	mux_PC: entity work.muxGenerico3x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saida_mux_beq,
                 entradaB_MUX =>  sinal_concatenado,
				 entradaC_MUX => SaidaRegAIDEX,
                 seletor_MUX => selMux_pc,
                 saida_MUX => mux_pc_saida);	
					  
	selmuxBeq <= '1' when (beqIDEX and flag_z) = '1' or (bneIDEX and not(flag_z)) = '1' else '0'; 				  
	
	shiftado <= imediato_estendido2IDEX(29 DOWNTO 0) & b"00";

	somador2 <= std_logic_vector(unsigned(shiftado) + unsigned(PC_soma_constIDEX));	  
	
	mux_beq: entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => PC_Incr_Const,
                 entradaB_MUX =>  somador2,
                 seletor_MUX => selmuxBeq,
				 saida_MUX => saida_mux_beq);
				 
	regEXMEM1 : entity work.registradorGenerico   generic map (larguraDados => 106)     
		port map (DIN => saidaWBIDEX & PC_soma_constIDEX & saidaULA & SaidaRegBIDEX & saida_mux_rt_rd, 
				DOUT => regEXMEM, 
				ENABLE => '1', 
				CLK => clk, 
				RST => '0');
					  
	mux_rt_rd: entity work.muxGenerico3x1  generic map (larguraDados => 5)
        port map( entradaA_MUX => endRtIDEX,
                 entradaB_MUX =>  endRdIDEX,
					  entradaC_MUX => b"11111", --Reg 31
                 seletor_MUX => sel_rt_rdIDEX,
                 saida_MUX => saida_mux_rt_rd);	
					  
	mux_ULA_mem: entity work.muxGenerico3x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaULAMEMWB,
                 entradaB_MUX =>  dado_lidoMEMWB,
				 entradaC_MUX => PC_soma_const_MEMWB,
                 seletor_MUX => sel_ULA_memMEMWB,
                 saida_MUX => saida_mux_ULA_mem);		
			
	RAM: entity work.RAMMIPS
        port map( clk => clk,
                 Endereco =>  saidaULAEXMEM,
                 Dado_in => SaidaRegBEXMEM,
                 Dado_out => dado_lido,
					  we => we,
					  re => re
					  );

	regMEMWB1 : entity work.registradorGenerico   generic map (larguraDados => 104)
		port map (DIN => saidaWBEXMEM & PC_soma_constEXMEM & dado_lido & saidaULAEXMEM & end_reg3EXMEM, 
				DOUT => regMEMWB, 
				ENABLE => '1', 
				CLK => clk, 
				RST => '0');
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
	jr_out <= jr; 
	Opcode_out <= Opcode;
	mux_imed_saida <= mux_rt_saida;
--	entradaA_ULA <= SaidaRegAIDEX;
--	imediato <= imediato_estendido2;
--	imediatoIDEX <= imediato_estendido2IDEX;
	
	
end architecture;