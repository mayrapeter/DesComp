library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAMMIPS IS
   generic (
          dataWidth: natural := 32;
          addrWidth: natural := 32;
          memoryAddrWidth:  natural := 6 );   -- 64 posicoes de 32 bits cada
   port ( clk      : IN  STD_LOGIC;
          Endereco : IN  STD_LOGIC_VECTOR (addrWidth-1 DOWNTO 0);
          Dado_in  : in std_logic_vector(dataWidth-1 downto 0);
          Dado_out : out std_logic_vector(dataWidth-1 downto 0);
          we : in std_logic := '0';
			 re : in std_logic := '0'
        );
end entity;

architecture assincrona OF RAMMIPS IS
  type blocoMemoria IS ARRAY(0 TO 2**memoryAddrWidth - 1) OF std_logic_vector(dataWidth-1 DOWNTO 0);

  signal memRAM : blocoMemoria := (OTHERS => (OTHERS => '0'));
--  Caso queira inicializar a RAM (para testes):
--  attribute ram_init_file : string;
--  attribute ram_init_file of memRAM:
--  signal is "RAMcontent.mif";

-- Utiliza uma quantidade menor de endereços locais:
   signal EnderecoLocal : std_logic_vector(memoryAddrWidth-1 downto 0);

begin

  -- Ajusta o enderecamento para o acesso de 32 bits.
  EnderecoLocal <= Endereco(memoryAddrWidth+1 downto 2);

  process(clk)
  begin
      if(rising_edge(clk)) then
          if(we = '1') then
              memRAM(to_integer(unsigned(EnderecoLocal))) <= Dado_in;
          end if;
			 if(re = '1') then
				  Dado_out <= memRAM(to_integer(unsigned(EnderecoLocal)));
			 end if;	  
      end if;
  end process;

  -- A leitura deve ser sempre assincrona:

end architecture;