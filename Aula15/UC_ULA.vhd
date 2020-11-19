library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UC_ULA is

  port   (
   -- Input ports
   ula_op  :  in  std_logic_vector(1 downto 0);
	funct  :  in  std_logic_vector(5 downto 0);
   -- Output ports
   ula_ctrl  :  out std_logic_vector(3 downto 0)
  );
end entity;


architecture arch_name of UC_ULA is

  begin		 
					 
         ula_ctrl <= "0010" when ula_op = "00" else --soma
                    "0110" when ula_op = "01" else --sub

                    "0010" when ula_op = "10" and funct = "100000" else -- soma
						  "0110" when ula_op = "10" and funct = "100010" else -- sub
						  "0000" when ula_op = "10" and funct = "100100" else -- and
                    "0001" when ula_op = "10" and funct = "100101" else -- or
                    "0111" when ula_op = "10" and funct = "101010" else -- slt
					"0000";                                   


end architecture;