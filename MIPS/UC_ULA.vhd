library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UC_ULA is

  port   (
   -- Input ports
   ula_op  :  in  std_logic_vector(2 downto 0);
	funct  :  in  std_logic_vector(5 downto 0);
   -- Output ports
   ula_ctrl  :  out std_logic_vector(4 downto 0);
	jr: out std_logic
  );
end entity;


architecture arch_name of UC_ULA is

  begin		 
					 
         ula_ctrl <= "00010" when ula_op = "000" or ula_op = "101" else --soma
                    "01010" when ula_op = "001" else --sub
						  "00001" when ula_op = "011" else --ori
						  "00100" when ula_op = "100" else --lui
						  "00000" when ula_op = "110" else -- andi
						  "01011" when ula_op = "111" else -- slti
						  
                    "00010" when ula_op = "010" and funct = "100000" else -- soma
						  "01010" when ula_op = "010" and funct = "100010" else -- sub
						  "00000" when ula_op = "010" and funct = "100100" else -- and
                    "00001" when ula_op = "010" and funct = "100101" else -- or
                    "01011" when ula_op = "010" and funct = "101010" else -- slt
					"00000";  
						
			jr <= '1' when ula_op = "010" and funct = "001000" else
					'0';			


end architecture;