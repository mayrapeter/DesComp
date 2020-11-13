library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.constantesMIPS.all;

entity UnidadeControleULA is

  port   (
   -- Input ports
   ula_op  :  in  std_logic_vector(1 downto 0);
	funct  :  in  std_logic_vector(5 downto 0);
   -- Output ports
   ula_ctrl  :  out std_logic_vector(3 downto 0)
  );
end entity;


architecture arch_name of UnidadeControleULA is

  begin		 
					 
         ula_ctrl <= "0010" when ulaOp = "00" else --soma
                    "0110" when ulaOp = "01" else --sub

                    "0010" when ulaOp = "10" and funct = "100000" else -- soma
						  "0110" when ulaOp = "10" and funct = "100010" else -- sub
						  "0000" when ulaOp = "10" and funct = "100100" else -- and
                    "0001" when ulaOp = "10" and funct = "100101" else -- or
                    "0111" when ulaOp = "10" and funct = "101010" else -- slt
					"000";                                   


end architecture;