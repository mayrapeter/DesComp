library ieee;
use ieee.std_logic_1164.all;

entity fluxoDados is
    generic (
        DATA_WIDTH             : natural := 8;
        INST_WIDTH             : natural := 32;
        OPCODE_WIDTH           : natural := 6;
        REG_END_WIDTH          : natural := 6;
        FUNCT_WIDTH            : natural := 6;
        PALAVRA_CONTROLE_WIDTH : natural := 6;
        SHAMT_WIDTH            : natural := 6;
        SEL_ULA            : natural := 3;
        ADDR_WIDTH             : natural := 32
    );
    port (
        clk             : in std_logic;
        palavraControle : in std_logic_vector(PALAVRA_CONTROLE_WIDTH - 1 downto 0);
        opCode   : out std_logic_vector(OPCODE_WIDTH - 1 downto 0);
        funct    : out std_logic_vector(FUNCT_WIDTH - 1 downto 0);
        flagZero : out std_logic;
        bancoReg_saidaA : out std_logic_vector(DATA_WIDTH - 1 downto 0);
        bancoReg_saidaB : out std_logic_vector(DATA_WIDTH - 1 downto 0);
        ULA_saida      : out std_logic_vector(DATA_WIDTH - 1 downto 0);
		  overflow : out std_logic
    );
end entity;

architecture main of fluxoDados is
    signal somaUm_saida       : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal PC_saida          : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal instrucao        : std_logic_vector(INST_WIDTH - 1 downto 0);
    signal ULA_saidaSig          : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal bReg_saidaA    : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal bReg_saidaB    : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal ULA_flagZero_saida : std_logic;
	 signal operacaoULA: std_logic_vector(3 downto 0);

    alias instOpCode : std_logic_vector(OPCODE_WIDTH - 1 downto 0) is instrucao(31 downto 26);
    alias rs         : std_logic_vector(REG_END_WIDTH - 1 downto 0) is instrucao(25 downto 21);
    alias rt         : std_logic_vector(REG_END_WIDTH - 1 downto 0) is instrucao(20 downto 16);
    alias rd         : std_logic_vector(REG_END_WIDTH - 1 downto 0) is instrucao(15 downto 11);
    alias shamt      : std_logic_vector(SHAMT_WIDTH - 1 downto 0) is instrucao(10 downto 6);
    alias instFunct  : std_logic_vector(FUNCT_WIDTH - 1 downto 0) is instrucao(5 downto 0);

    alias habEscritaBancoRegs : std_logic is palavraControle(0);

    constant constante : NATURAL := 4;
begin
    PC : entity work.registradorGenerico
        generic map(
            larguraDados => ADDR_WIDTH
        )
        port map(
            DIN    => somaUm_saida,
            DOUT   => PC_saida,
            ENABLE => '1',
            CLK    => clk,
            RST    => '0'
        );

    PC_soma_constante : entity work.somaConstante
        generic map(
            larguraDados => ADDR_WIDTH,
            constante    => constante
        )
        port map(
            entrada => PC_saida,
            saida   => somaUm_saida
        );

    ROM : entity work.ROMMIPS
        generic map(
            dataWidth       => INST_WIDTH,
            addrWidth       => ADDR_WIDTH,
            memoryAddrWidth => 6
        )
        port map(
            clk      => clk,
            Endereco => PC_saida,
            Dado     => instrucao
        );

    bancoRegs : entity work.bancoRegistradoresArqRegReg
        generic map(
            larguraDados        => DATA_WIDTH,
            larguraEndBancoRegs => 5
        )
        port map(
            clk          => clk,
            enderecoA    => rs,
            enderecoB    => rt,
            enderecoC    => rd,
            dadoEscritaC => ULA_saidaSig,
            escreveC     => habEscritaBancoRegs,
            saidaA       => bReg_saidaA,
            saidaB       => bReg_saidaB
        );

    ULA : entity work.ULA
        port map(
            entradaA => bReg_saidaA,
            entradaB => bReg_saidaB,
            operacao  => operacaoULA,
            saida    => ULA_saidaSig,
				overflow_final => overflow,
            resultado => ULA_flagZero_saida
        );

    flipFlopFlagZero : entity work.flipFlopGenerico
        port map(
            DIN    => ULA_flagZero_saida,
            DOUT   => flagZero,
            ENABLE => '1',
            CLK    => clk,
            RST    => '0'
        );

    opCode <= instOpCode;
    funct  <= instFunct;

    bancoReg_saidaA <= bReg_saidaA;
    bancoReg_saidaB <= bReg_saidaB;
    ULA_saida      <= ULA_saidaSig;
end architecture;