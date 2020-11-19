-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "11/13/2020 19:21:56"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ULA_e_UCULA IS
    PORT (
	entradaA : IN std_logic_vector(31 DOWNTO 0);
	entradaB : IN std_logic_vector(31 DOWNTO 0);
	funct : IN std_logic_vector(5 DOWNTO 0);
	ULA_saida : BUFFER std_logic_vector(31 DOWNTO 0);
	ULA_op : IN std_logic_vector(1 DOWNTO 0);
	overflow : BUFFER std_logic
	);
END ULA_e_UCULA;

ARCHITECTURE structure OF ULA_e_UCULA IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_entradaA : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_entradaB : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_funct : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_ULA_saida : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ULA_op : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_overflow : std_logic;
SIGNAL \ULA_saida[0]~output_o\ : std_logic;
SIGNAL \ULA_saida[1]~output_o\ : std_logic;
SIGNAL \ULA_saida[2]~output_o\ : std_logic;
SIGNAL \ULA_saida[3]~output_o\ : std_logic;
SIGNAL \ULA_saida[4]~output_o\ : std_logic;
SIGNAL \ULA_saida[5]~output_o\ : std_logic;
SIGNAL \ULA_saida[6]~output_o\ : std_logic;
SIGNAL \ULA_saida[7]~output_o\ : std_logic;
SIGNAL \ULA_saida[8]~output_o\ : std_logic;
SIGNAL \ULA_saida[9]~output_o\ : std_logic;
SIGNAL \ULA_saida[10]~output_o\ : std_logic;
SIGNAL \ULA_saida[11]~output_o\ : std_logic;
SIGNAL \ULA_saida[12]~output_o\ : std_logic;
SIGNAL \ULA_saida[13]~output_o\ : std_logic;
SIGNAL \ULA_saida[14]~output_o\ : std_logic;
SIGNAL \ULA_saida[15]~output_o\ : std_logic;
SIGNAL \ULA_saida[16]~output_o\ : std_logic;
SIGNAL \ULA_saida[17]~output_o\ : std_logic;
SIGNAL \ULA_saida[18]~output_o\ : std_logic;
SIGNAL \ULA_saida[19]~output_o\ : std_logic;
SIGNAL \ULA_saida[20]~output_o\ : std_logic;
SIGNAL \ULA_saida[21]~output_o\ : std_logic;
SIGNAL \ULA_saida[22]~output_o\ : std_logic;
SIGNAL \ULA_saida[23]~output_o\ : std_logic;
SIGNAL \ULA_saida[24]~output_o\ : std_logic;
SIGNAL \ULA_saida[25]~output_o\ : std_logic;
SIGNAL \ULA_saida[26]~output_o\ : std_logic;
SIGNAL \ULA_saida[27]~output_o\ : std_logic;
SIGNAL \ULA_saida[28]~output_o\ : std_logic;
SIGNAL \ULA_saida[29]~output_o\ : std_logic;
SIGNAL \ULA_saida[30]~output_o\ : std_logic;
SIGNAL \ULA_saida[31]~output_o\ : std_logic;
SIGNAL \overflow~output_o\ : std_logic;
SIGNAL \ULA_op[0]~input_o\ : std_logic;
SIGNAL \ULA_op[1]~input_o\ : std_logic;
SIGNAL \funct[1]~input_o\ : std_logic;
SIGNAL \funct[0]~input_o\ : std_logic;
SIGNAL \funct[2]~input_o\ : std_logic;
SIGNAL \funct[4]~input_o\ : std_logic;
SIGNAL \funct[5]~input_o\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~0_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[2]~1_combout\ : std_logic;
SIGNAL \entradaA[1]~input_o\ : std_logic;
SIGNAL \entradaB[1]~input_o\ : std_logic;
SIGNAL \ULA|ula1|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[0]~input_o\ : std_logic;
SIGNAL \entradaB[0]~input_o\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|carry_out~0_combout\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|carry_out~1_combout\ : std_logic;
SIGNAL \entradaA[2]~input_o\ : std_logic;
SIGNAL \entradaB[2]~input_o\ : std_logic;
SIGNAL \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[3]~input_o\ : std_logic;
SIGNAL \entradaB[3]~input_o\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[4]~input_o\ : std_logic;
SIGNAL \entradaB[4]~input_o\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[5]~input_o\ : std_logic;
SIGNAL \entradaB[5]~input_o\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[6]~input_o\ : std_logic;
SIGNAL \entradaB[6]~input_o\ : std_logic;
SIGNAL \ULA|ula6|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula6|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[7]~input_o\ : std_logic;
SIGNAL \entradaB[7]~input_o\ : std_logic;
SIGNAL \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[8]~input_o\ : std_logic;
SIGNAL \entradaB[8]~input_o\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[9]~input_o\ : std_logic;
SIGNAL \entradaB[9]~input_o\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[10]~input_o\ : std_logic;
SIGNAL \entradaB[10]~input_o\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[11]~input_o\ : std_logic;
SIGNAL \entradaB[11]~input_o\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[12]~input_o\ : std_logic;
SIGNAL \entradaB[12]~input_o\ : std_logic;
SIGNAL \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[13]~input_o\ : std_logic;
SIGNAL \entradaB[13]~input_o\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[14]~input_o\ : std_logic;
SIGNAL \entradaB[14]~input_o\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[15]~input_o\ : std_logic;
SIGNAL \entradaB[15]~input_o\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[16]~input_o\ : std_logic;
SIGNAL \entradaB[16]~input_o\ : std_logic;
SIGNAL \ULA|ula16|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[17]~input_o\ : std_logic;
SIGNAL \entradaB[17]~input_o\ : std_logic;
SIGNAL \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[18]~input_o\ : std_logic;
SIGNAL \entradaB[18]~input_o\ : std_logic;
SIGNAL \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[19]~input_o\ : std_logic;
SIGNAL \entradaB[19]~input_o\ : std_logic;
SIGNAL \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[20]~input_o\ : std_logic;
SIGNAL \entradaB[20]~input_o\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[21]~input_o\ : std_logic;
SIGNAL \entradaB[21]~input_o\ : std_logic;
SIGNAL \ULA|ula21|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[22]~input_o\ : std_logic;
SIGNAL \entradaB[22]~input_o\ : std_logic;
SIGNAL \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[23]~input_o\ : std_logic;
SIGNAL \entradaB[23]~input_o\ : std_logic;
SIGNAL \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[24]~input_o\ : std_logic;
SIGNAL \entradaB[24]~input_o\ : std_logic;
SIGNAL \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[25]~input_o\ : std_logic;
SIGNAL \entradaB[25]~input_o\ : std_logic;
SIGNAL \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \entradaA[26]~input_o\ : std_logic;
SIGNAL \entradaB[26]~input_o\ : std_logic;
SIGNAL \ULA|ula26|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[27]~input_o\ : std_logic;
SIGNAL \entradaB[27]~input_o\ : std_logic;
SIGNAL \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[28]~input_o\ : std_logic;
SIGNAL \entradaB[28]~input_o\ : std_logic;
SIGNAL \entradaA[29]~input_o\ : std_logic;
SIGNAL \entradaB[29]~input_o\ : std_logic;
SIGNAL \ULA|ula29|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \entradaA[30]~input_o\ : std_logic;
SIGNAL \entradaB[30]~input_o\ : std_logic;
SIGNAL \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \entradaA[31]~input_o\ : std_logic;
SIGNAL \entradaB[31]~input_o\ : std_logic;
SIGNAL \ULA|ula31|soma_sub|saida~0_combout\ : std_logic;
SIGNAL \funct[3]~input_o\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~2_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~3_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~4_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~3_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula1|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula5|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula6|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula6|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula9|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula10|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula11|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula14|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula15|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula16|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula16|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula21|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula24|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula31|Overflow_exists|overflow~0_combout\ : std_logic;
SIGNAL \ALT_INV_entradaA[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_ULA_op[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_ULA_op[0]~input_o\ : std_logic;
SIGNAL \ULA|ula31|Overflow_exists|ALT_INV_overflow~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula24|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula24|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula21|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula19|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula16|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula6|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula1|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~2_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~4_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~3_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~2_combout\ : std_logic;
SIGNAL \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula27|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ALT_INV_entradaB[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaA[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_entradaB[2]~input_o\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula6|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula6|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula2|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|ALT_INV_carry_out~1_combout\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|ALT_INV_carry_out~0_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~0_combout\ : std_logic;

BEGIN

ww_entradaA <= entradaA;
ww_entradaB <= entradaB;
ww_funct <= funct;
ULA_saida <= ww_ULA_saida;
ww_ULA_op <= ULA_op;
overflow <= ww_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_entradaA[2]~input_o\ <= NOT \entradaA[2]~input_o\;
\ALT_INV_entradaB[0]~input_o\ <= NOT \entradaB[0]~input_o\;
\ALT_INV_entradaA[0]~input_o\ <= NOT \entradaA[0]~input_o\;
\ALT_INV_entradaB[1]~input_o\ <= NOT \entradaB[1]~input_o\;
\ALT_INV_entradaA[1]~input_o\ <= NOT \entradaA[1]~input_o\;
\ALT_INV_funct[5]~input_o\ <= NOT \funct[5]~input_o\;
\ALT_INV_funct[4]~input_o\ <= NOT \funct[4]~input_o\;
\ALT_INV_funct[2]~input_o\ <= NOT \funct[2]~input_o\;
\ALT_INV_funct[0]~input_o\ <= NOT \funct[0]~input_o\;
\ALT_INV_funct[1]~input_o\ <= NOT \funct[1]~input_o\;
\ALT_INV_funct[3]~input_o\ <= NOT \funct[3]~input_o\;
\ALT_INV_ULA_op[1]~input_o\ <= NOT \ULA_op[1]~input_o\;
\ALT_INV_ULA_op[0]~input_o\ <= NOT \ULA_op[0]~input_o\;
\ULA|ula31|Overflow_exists|ALT_INV_overflow~0_combout\ <= NOT \ULA|ula31|Overflow_exists|overflow~0_combout\;
\ULA|ula31|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula31|mux_ula|saida_MUX~1_combout\;
\ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula31|mux_ula|saida_MUX~0_combout\;
\ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula29|mux_ula|saida_MUX~0_combout\;
\ULA|ula29|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula29|soma_sub|saida_xor~combout\;
\ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula28|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula26|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula26|soma_sub|carry_out~combout\;
\ULA|ula24|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula24|soma_sub|carry_out~combout\;
\ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula24|mux_ula|saida_MUX~0_combout\;
\ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula1|mux_ula|saida_MUX~1_combout\;
\ULA|ula24|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula24|soma_sub|saida_xor~combout\;
\ULA|ula21|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula21|soma_sub|carry_out~combout\;
\ULA|ula19|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula19|soma_sub|carry_out~combout\;
\ULA|ula18|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula18|soma_sub|carry_out~combout\;
\ULA|ula16|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula16|soma_sub|carry_out~combout\;
\ULA|ula15|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula15|soma_sub|carry_out~combout\;
\ULA|ula14|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula14|soma_sub|carry_out~combout\;
\ULA|ula13|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula13|soma_sub|carry_out~combout\;
\ULA|ula11|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula11|soma_sub|carry_out~combout\;
\ULA|ula10|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula10|soma_sub|carry_out~combout\;
\ULA|ula9|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula9|soma_sub|carry_out~combout\;
\ULA|ula8|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula8|soma_sub|carry_out~combout\;
\ULA|ula6|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula6|soma_sub|carry_out~combout\;
\ULA|ula5|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula5|soma_sub|carry_out~combout\;
\ULA|ula4|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula4|soma_sub|carry_out~combout\;
\ULA|ula3|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula3|soma_sub|carry_out~combout\;
\ULA|ula1|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula1|soma_sub|carry_out~combout\;
\ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula2|mux_ula|saida_MUX~1_combout\;
\ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|mux_ula|saida_MUX~0_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~2_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~2_combout\;
\UC_ULA|ALT_INV_ula_ctrl~4_combout\ <= NOT \UC_ULA|ula_ctrl~4_combout\;
\UC_ULA|ALT_INV_ula_ctrl~3_combout\ <= NOT \UC_ULA|ula_ctrl~3_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~1_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~0_combout\;
\UC_ULA|ALT_INV_ula_ctrl~2_combout\ <= NOT \UC_ULA|ula_ctrl~2_combout\;
\ULA|ula31|soma_sub|ALT_INV_saida~0_combout\ <= NOT \ULA|ula31|soma_sub|saida~0_combout\;
\ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula30|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula29|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula29|soma_sub|carry_out~combout\;
\ULA|ula27|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula27|soma_sub|carry_out~combout\;
\ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula27|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula26|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula25|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula25|soma_sub|saida_and~0_combout\;
\ULA|ula25|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula25|soma_sub|saida_xor2~combout\;
\ULA|ula25|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula25|soma_sub|saida_xor~combout\;
\ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula25|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula24|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula23|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula22|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula22|soma_sub|carry_out~combout\;
\ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula22|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula21|mux_inverteB|saida_MUX~0_combout\;
\ALT_INV_entradaB[31]~input_o\ <= NOT \entradaB[31]~input_o\;
\ALT_INV_entradaA[31]~input_o\ <= NOT \entradaA[31]~input_o\;
\ALT_INV_entradaB[30]~input_o\ <= NOT \entradaB[30]~input_o\;
\ALT_INV_entradaA[30]~input_o\ <= NOT \entradaA[30]~input_o\;
\ALT_INV_entradaB[29]~input_o\ <= NOT \entradaB[29]~input_o\;
\ALT_INV_entradaA[29]~input_o\ <= NOT \entradaA[29]~input_o\;
\ALT_INV_entradaB[28]~input_o\ <= NOT \entradaB[28]~input_o\;
\ALT_INV_entradaA[28]~input_o\ <= NOT \entradaA[28]~input_o\;
\ALT_INV_entradaB[27]~input_o\ <= NOT \entradaB[27]~input_o\;
\ALT_INV_entradaA[27]~input_o\ <= NOT \entradaA[27]~input_o\;
\ALT_INV_entradaB[26]~input_o\ <= NOT \entradaB[26]~input_o\;
\ALT_INV_entradaA[26]~input_o\ <= NOT \entradaA[26]~input_o\;
\ALT_INV_entradaB[25]~input_o\ <= NOT \entradaB[25]~input_o\;
\ALT_INV_entradaA[25]~input_o\ <= NOT \entradaA[25]~input_o\;
\ALT_INV_entradaB[24]~input_o\ <= NOT \entradaB[24]~input_o\;
\ALT_INV_entradaA[24]~input_o\ <= NOT \entradaA[24]~input_o\;
\ALT_INV_entradaB[23]~input_o\ <= NOT \entradaB[23]~input_o\;
\ALT_INV_entradaA[23]~input_o\ <= NOT \entradaA[23]~input_o\;
\ALT_INV_entradaB[22]~input_o\ <= NOT \entradaB[22]~input_o\;
\ALT_INV_entradaA[22]~input_o\ <= NOT \entradaA[22]~input_o\;
\ALT_INV_entradaB[21]~input_o\ <= NOT \entradaB[21]~input_o\;
\ALT_INV_entradaA[21]~input_o\ <= NOT \entradaA[21]~input_o\;
\ALT_INV_entradaB[20]~input_o\ <= NOT \entradaB[20]~input_o\;
\ALT_INV_entradaA[20]~input_o\ <= NOT \entradaA[20]~input_o\;
\ALT_INV_entradaB[19]~input_o\ <= NOT \entradaB[19]~input_o\;
\ALT_INV_entradaA[19]~input_o\ <= NOT \entradaA[19]~input_o\;
\ALT_INV_entradaB[18]~input_o\ <= NOT \entradaB[18]~input_o\;
\ALT_INV_entradaA[18]~input_o\ <= NOT \entradaA[18]~input_o\;
\ALT_INV_entradaB[17]~input_o\ <= NOT \entradaB[17]~input_o\;
\ALT_INV_entradaA[17]~input_o\ <= NOT \entradaA[17]~input_o\;
\ALT_INV_entradaB[16]~input_o\ <= NOT \entradaB[16]~input_o\;
\ALT_INV_entradaA[16]~input_o\ <= NOT \entradaA[16]~input_o\;
\ALT_INV_entradaB[15]~input_o\ <= NOT \entradaB[15]~input_o\;
\ALT_INV_entradaA[15]~input_o\ <= NOT \entradaA[15]~input_o\;
\ALT_INV_entradaB[14]~input_o\ <= NOT \entradaB[14]~input_o\;
\ALT_INV_entradaA[14]~input_o\ <= NOT \entradaA[14]~input_o\;
\ALT_INV_entradaB[13]~input_o\ <= NOT \entradaB[13]~input_o\;
\ALT_INV_entradaA[13]~input_o\ <= NOT \entradaA[13]~input_o\;
\ALT_INV_entradaB[12]~input_o\ <= NOT \entradaB[12]~input_o\;
\ALT_INV_entradaA[12]~input_o\ <= NOT \entradaA[12]~input_o\;
\ALT_INV_entradaB[11]~input_o\ <= NOT \entradaB[11]~input_o\;
\ALT_INV_entradaA[11]~input_o\ <= NOT \entradaA[11]~input_o\;
\ALT_INV_entradaB[10]~input_o\ <= NOT \entradaB[10]~input_o\;
\ALT_INV_entradaA[10]~input_o\ <= NOT \entradaA[10]~input_o\;
\ALT_INV_entradaB[9]~input_o\ <= NOT \entradaB[9]~input_o\;
\ALT_INV_entradaA[9]~input_o\ <= NOT \entradaA[9]~input_o\;
\ALT_INV_entradaB[8]~input_o\ <= NOT \entradaB[8]~input_o\;
\ALT_INV_entradaA[8]~input_o\ <= NOT \entradaA[8]~input_o\;
\ALT_INV_entradaB[7]~input_o\ <= NOT \entradaB[7]~input_o\;
\ALT_INV_entradaA[7]~input_o\ <= NOT \entradaA[7]~input_o\;
\ALT_INV_entradaB[6]~input_o\ <= NOT \entradaB[6]~input_o\;
\ALT_INV_entradaA[6]~input_o\ <= NOT \entradaA[6]~input_o\;
\ALT_INV_entradaB[5]~input_o\ <= NOT \entradaB[5]~input_o\;
\ALT_INV_entradaA[5]~input_o\ <= NOT \entradaA[5]~input_o\;
\ALT_INV_entradaB[4]~input_o\ <= NOT \entradaB[4]~input_o\;
\ALT_INV_entradaA[4]~input_o\ <= NOT \entradaA[4]~input_o\;
\ALT_INV_entradaB[3]~input_o\ <= NOT \entradaB[3]~input_o\;
\ALT_INV_entradaA[3]~input_o\ <= NOT \entradaA[3]~input_o\;
\ALT_INV_entradaB[2]~input_o\ <= NOT \entradaB[2]~input_o\;
\ULA|ula20|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula20|soma_sub|saida_and~0_combout\;
\ULA|ula20|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula20|soma_sub|saida_xor2~combout\;
\ULA|ula20|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula20|soma_sub|saida_xor~combout\;
\ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula19|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula18|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula17|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula17|soma_sub|carry_out~combout\;
\ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula17|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula16|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula15|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula15|soma_sub|saida_and~0_combout\;
\ULA|ula15|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula15|soma_sub|saida_xor2~combout\;
\ULA|ula15|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula15|soma_sub|saida_xor~combout\;
\ULA|ula14|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula14|soma_sub|saida_and~0_combout\;
\ULA|ula14|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula14|soma_sub|saida_xor~combout\;
\ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula13|soma_sub|saida_and~0_combout\;
\ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula13|soma_sub|saida_xor~combout\;
\ULA|ula12|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula12|soma_sub|carry_out~combout\;
\ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula12|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula11|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula11|soma_sub|saida_and~0_combout\;
\ULA|ula11|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula11|soma_sub|saida_xor~combout\;
\ULA|ula10|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula10|soma_sub|saida_and~0_combout\;
\ULA|ula10|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula10|soma_sub|saida_xor2~combout\;
\ULA|ula10|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula10|soma_sub|saida_xor~combout\;
\ULA|ula9|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula9|soma_sub|saida_and~0_combout\;
\ULA|ula9|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula9|soma_sub|saida_xor~combout\;
\ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula8|soma_sub|saida_and~0_combout\;
\ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula8|soma_sub|saida_xor~combout\;
\ULA|ula7|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula7|soma_sub|carry_out~combout\;
\ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula7|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula6|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula6|soma_sub|saida_and~0_combout\;
\ULA|ula6|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula6|soma_sub|saida_xor~combout\;
\ULA|ula5|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula5|soma_sub|saida_and~0_combout\;
\ULA|ula5|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula5|soma_sub|saida_xor2~combout\;
\ULA|ula5|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula5|soma_sub|saida_xor~combout\;
\ULA|ula4|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula4|soma_sub|saida_and~0_combout\;
\ULA|ula4|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula4|soma_sub|saida_xor~combout\;
\ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula3|soma_sub|saida_and~0_combout\;
\ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula3|soma_sub|saida_xor~combout\;
\ULA|ula2|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula2|soma_sub|carry_out~combout\;
\ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula0|soma_sub|ALT_INV_carry_out~1_combout\ <= NOT \ULA|ula0|soma_sub|carry_out~1_combout\;
\ULA|ula0|soma_sub|ALT_INV_carry_out~0_combout\ <= NOT \ULA|ula0|soma_sub|carry_out~0_combout\;
\ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula1|mux_inverteB|saida_MUX~0_combout\;
\UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\ <= NOT \UC_ULA|ula_ctrl[2]~1_combout\;
\UC_ULA|ALT_INV_ula_ctrl~0_combout\ <= NOT \UC_ULA|ula_ctrl~0_combout\;

\ULA_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula0|mux_ula|saida_MUX~3_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[0]~output_o\);

\ULA_saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula1|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[1]~output_o\);

\ULA_saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula2|mux_ula|saida_MUX~2_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[2]~output_o\);

\ULA_saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula3|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[3]~output_o\);

\ULA_saida[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula4|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[4]~output_o\);

\ULA_saida[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula5|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[5]~output_o\);

\ULA_saida[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula6|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[6]~output_o\);

\ULA_saida[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula7|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[7]~output_o\);

\ULA_saida[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula8|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[8]~output_o\);

\ULA_saida[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula9|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[9]~output_o\);

\ULA_saida[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula10|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[10]~output_o\);

\ULA_saida[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula11|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[11]~output_o\);

\ULA_saida[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula12|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[12]~output_o\);

\ULA_saida[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula13|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[13]~output_o\);

\ULA_saida[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula14|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[14]~output_o\);

\ULA_saida[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula15|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[15]~output_o\);

\ULA_saida[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula16|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[16]~output_o\);

\ULA_saida[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula17|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[17]~output_o\);

\ULA_saida[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula18|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[18]~output_o\);

\ULA_saida[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula19|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[19]~output_o\);

\ULA_saida[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula20|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[20]~output_o\);

\ULA_saida[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula21|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[21]~output_o\);

\ULA_saida[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula22|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[22]~output_o\);

\ULA_saida[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula23|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[23]~output_o\);

\ULA_saida[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula24|mux_ula|saida_MUX~1_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[24]~output_o\);

\ULA_saida[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula25|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[25]~output_o\);

\ULA_saida[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula26|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[26]~output_o\);

\ULA_saida[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula27|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[27]~output_o\);

\ULA_saida[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula28|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[28]~output_o\);

\ULA_saida[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula29|mux_ula|saida_MUX~1_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[29]~output_o\);

\ULA_saida[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula30|mux_ula|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[30]~output_o\);

\ULA_saida[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula31|mux_ula|saida_MUX~1_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[31]~output_o\);

\overflow~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula31|Overflow_exists|ALT_INV_overflow~0_combout\,
	devoe => ww_devoe,
	o => \overflow~output_o\);

\ULA_op[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ULA_op(0),
	o => \ULA_op[0]~input_o\);

\ULA_op[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ULA_op(1),
	o => \ULA_op[1]~input_o\);

\funct[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(1),
	o => \funct[1]~input_o\);

\funct[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(0),
	o => \funct[0]~input_o\);

\funct[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(2),
	o => \funct[2]~input_o\);

\funct[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(4),
	o => \funct[4]~input_o\);

\funct[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(5),
	o => \funct[5]~input_o\);

\UC_ULA|ula_ctrl~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~0_combout\ = ( !\funct[4]~input_o\ & ( \funct[5]~input_o\ & ( (!\ULA_op[0]~input_o\ & (\ULA_op[1]~input_o\ & (!\funct[0]~input_o\ & !\funct[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datac => \ALT_INV_funct[0]~input_o\,
	datad => \ALT_INV_funct[2]~input_o\,
	datae => \ALT_INV_funct[4]~input_o\,
	dataf => \ALT_INV_funct[5]~input_o\,
	combout => \UC_ULA|ula_ctrl~0_combout\);

\UC_ULA|ula_ctrl[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[2]~1_combout\ = ( \UC_ULA|ula_ctrl~0_combout\ & ( (!\ULA_op[1]~input_o\ & (\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((\funct[1]~input_o\))) ) ) # ( !\UC_ULA|ula_ctrl~0_combout\ & ( (\ULA_op[0]~input_o\ & !\ULA_op[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000111011101000100010001000100010001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datad => \ALT_INV_funct[1]~input_o\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \UC_ULA|ula_ctrl[2]~1_combout\);

\entradaA[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(1),
	o => \entradaA[1]~input_o\);

\entradaB[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(1),
	o => \entradaB[1]~input_o\);

\ULA|ula1|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_inverteB|saida_MUX~0_combout\ = ( \funct[1]~input_o\ & ( \UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[1]~input_o\ $ (((!\ULA_op[0]~input_o\ & !\ULA_op[1]~input_o\))) ) ) ) # ( !\funct[1]~input_o\ & ( \UC_ULA|ula_ctrl~0_combout\ & ( 
-- !\entradaB[1]~input_o\ $ (((!\ULA_op[0]~input_o\) # (\ULA_op[1]~input_o\))) ) ) ) # ( \funct[1]~input_o\ & ( !\UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[1]~input_o\ $ (((!\ULA_op[0]~input_o\) # (\ULA_op[1]~input_o\))) ) ) ) # ( !\funct[1]~input_o\ & ( 
-- !\UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[1]~input_o\ $ (((!\ULA_op[0]~input_o\) # (\ULA_op[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010101100101011001010110101001101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaB[1]~input_o\,
	datab => \ALT_INV_ULA_op[0]~input_o\,
	datac => \ALT_INV_ULA_op[1]~input_o\,
	datae => \ALT_INV_funct[1]~input_o\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \ULA|ula1|mux_inverteB|saida_MUX~0_combout\);

\entradaA[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(0),
	o => \entradaA[0]~input_o\);

\entradaB[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(0),
	o => \entradaB[0]~input_o\);

\ULA|ula0|soma_sub|carry_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|soma_sub|carry_out~0_combout\ = (\entradaA[0]~input_o\ & \entradaB[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[0]~input_o\,
	datab => \ALT_INV_entradaB[0]~input_o\,
	combout => \ULA|ula0|soma_sub|carry_out~0_combout\);

\ULA|ula0|soma_sub|carry_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|soma_sub|carry_out~1_combout\ = ( \UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[0]~input_o\ & ( (!\ULA_op[1]~input_o\ & (\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((\funct[1]~input_o\))) ) ) ) # ( !\UC_ULA|ula_ctrl~0_combout\ & ( 
-- !\entradaB[0]~input_o\ & ( (\ULA_op[0]~input_o\ & !\ULA_op[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000111011100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datad => \ALT_INV_funct[1]~input_o\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	dataf => \ALT_INV_entradaB[0]~input_o\,
	combout => \ULA|ula0|soma_sub|carry_out~1_combout\);

\entradaA[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(2),
	o => \entradaA[2]~input_o\);

\entradaB[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(2),
	o => \entradaB[2]~input_o\);

\ULA|ula2|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ = ( \UC_ULA|ula_ctrl~0_combout\ & ( \entradaB[2]~input_o\ & ( (!\ULA_op[1]~input_o\ & (!\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((!\funct[1]~input_o\))) ) ) ) # ( !\UC_ULA|ula_ctrl~0_combout\ & ( 
-- \entradaB[2]~input_o\ & ( (!\ULA_op[0]~input_o\) # (\ULA_op[1]~input_o\) ) ) ) # ( \UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[2]~input_o\ & ( (!\ULA_op[1]~input_o\ & (\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((\funct[1]~input_o\))) ) ) ) # ( 
-- !\UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[2]~input_o\ & ( (\ULA_op[0]~input_o\ & !\ULA_op[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000111011110111011101110111011101110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datad => \ALT_INV_funct[1]~input_o\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	dataf => \ALT_INV_entradaB[2]~input_o\,
	combout => \ULA|ula2|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula2|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|soma_sub|carry_out~combout\ = ( !\entradaA[2]~input_o\ & ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[1]~input_o\ & ((!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula0|soma_sub|carry_out~0_combout\ & 
-- !\ULA|ula0|soma_sub|carry_out~1_combout\)))) # (\entradaA[1]~input_o\ & (!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\ & (!\ULA|ula0|soma_sub|carry_out~0_combout\ & !\ULA|ula0|soma_sub|carry_out~1_combout\))) ) ) ) # ( \entradaA[2]~input_o\ & ( 
-- !\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[1]~input_o\ & ((!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula0|soma_sub|carry_out~0_combout\ & !\ULA|ula0|soma_sub|carry_out~1_combout\)))) # (\entradaA[1]~input_o\ & 
-- (!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\ & (!\ULA|ula0|soma_sub|carry_out~0_combout\ & !\ULA|ula0|soma_sub|carry_out~1_combout\))) ) ) ) # ( !\entradaA[2]~input_o\ & ( !\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111010001000100011101000100010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[1]~input_o\,
	datab => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula0|soma_sub|ALT_INV_carry_out~0_combout\,
	datad => \ULA|ula0|soma_sub|ALT_INV_carry_out~1_combout\,
	datae => \ALT_INV_entradaA[2]~input_o\,
	dataf => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula2|soma_sub|carry_out~combout\);

\entradaA[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(3),
	o => \entradaA[3]~input_o\);

\entradaB[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(3),
	o => \entradaB[3]~input_o\);

\ULA|ula3|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[3]~input_o\ $ (\entradaB[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[3]~input_o\,
	datac => \ALT_INV_entradaB[3]~input_o\,
	combout => \ULA|ula3|soma_sub|saida_xor~combout\);

\ULA|ula3|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_and~0_combout\ = (\entradaA[3]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[3]~input_o\,
	datac => \ALT_INV_entradaB[3]~input_o\,
	combout => \ULA|ula3|soma_sub|saida_and~0_combout\);

\entradaA[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(4),
	o => \entradaA[4]~input_o\);

\entradaB[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(4),
	o => \entradaB[4]~input_o\);

\ULA|ula4|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[4]~input_o\ $ (\entradaB[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[4]~input_o\,
	datac => \ALT_INV_entradaB[4]~input_o\,
	combout => \ULA|ula4|soma_sub|saida_xor~combout\);

\ULA|ula4|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|soma_sub|saida_and~0_combout\ = (\entradaA[4]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[4]~input_o\,
	datac => \ALT_INV_entradaB[4]~input_o\,
	combout => \ULA|ula4|soma_sub|saida_and~0_combout\);

\entradaA[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(5),
	o => \entradaA[5]~input_o\);

\entradaB[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(5),
	o => \entradaB[5]~input_o\);

\ULA|ula5|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[5]~input_o\ $ (\entradaB[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[5]~input_o\,
	datac => \ALT_INV_entradaB[5]~input_o\,
	combout => \ULA|ula5|soma_sub|saida_xor~combout\);

\ULA|ula5|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|saida_xor2~combout\ = ( \ULA|ula4|soma_sub|saida_and~0_combout\ & ( \ULA|ula5|soma_sub|saida_xor~combout\ ) ) # ( !\ULA|ula4|soma_sub|saida_and~0_combout\ & ( \ULA|ula5|soma_sub|saida_xor~combout\ & ( 
-- (\ULA|ula4|soma_sub|saida_xor~combout\ & (((!\ULA|ula2|soma_sub|carry_out~combout\ & \ULA|ula3|soma_sub|saida_xor~combout\)) # (\ULA|ula3|soma_sub|saida_and~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula2|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\,
	datad => \ULA|ula4|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula4|soma_sub|ALT_INV_saida_and~0_combout\,
	dataf => \ULA|ula5|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula5|soma_sub|saida_xor2~combout\);

\ULA|ula5|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|saida_and~0_combout\ = (\entradaA[5]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[5]~input_o\,
	datac => \ALT_INV_entradaB[5]~input_o\,
	combout => \ULA|ula5|soma_sub|saida_and~0_combout\);

\entradaA[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(6),
	o => \entradaA[6]~input_o\);

\entradaB[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(6),
	o => \entradaB[6]~input_o\);

\ULA|ula6|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[6]~input_o\ $ (\entradaB[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[6]~input_o\,
	datac => \ALT_INV_entradaB[6]~input_o\,
	combout => \ULA|ula6|soma_sub|saida_xor~combout\);

\ULA|ula6|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|soma_sub|saida_and~0_combout\ = (\entradaA[6]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[6]~input_o\,
	datac => \ALT_INV_entradaB[6]~input_o\,
	combout => \ULA|ula6|soma_sub|saida_and~0_combout\);

\entradaA[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(7),
	o => \entradaA[7]~input_o\);

\entradaB[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(7),
	o => \entradaB[7]~input_o\);

\ULA|ula7|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ = ( \UC_ULA|ula_ctrl~0_combout\ & ( \entradaB[7]~input_o\ & ( (!\ULA_op[1]~input_o\ & (!\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((!\funct[1]~input_o\))) ) ) ) # ( !\UC_ULA|ula_ctrl~0_combout\ & ( 
-- \entradaB[7]~input_o\ & ( (!\ULA_op[0]~input_o\) # (\ULA_op[1]~input_o\) ) ) ) # ( \UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[7]~input_o\ & ( (!\ULA_op[1]~input_o\ & (\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((\funct[1]~input_o\))) ) ) ) # ( 
-- !\UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[7]~input_o\ & ( (\ULA_op[0]~input_o\ & !\ULA_op[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000111011110111011101110111011101110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datad => \ALT_INV_funct[1]~input_o\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	dataf => \ALT_INV_entradaB[7]~input_o\,
	combout => \ULA|ula7|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula7|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|soma_sub|carry_out~combout\ = ( !\entradaA[7]~input_o\ & ( \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula6|soma_sub|saida_and~0_combout\ & ((!\ULA|ula6|soma_sub|saida_xor~combout\) # ((!\ULA|ula5|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula5|soma_sub|saida_and~0_combout\)))) ) ) ) # ( \entradaA[7]~input_o\ & ( !\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula6|soma_sub|saida_and~0_combout\ & ((!\ULA|ula6|soma_sub|saida_xor~combout\) # 
-- ((!\ULA|ula5|soma_sub|saida_xor2~combout\ & !\ULA|ula5|soma_sub|saida_and~0_combout\)))) ) ) ) # ( !\entradaA[7]~input_o\ & ( !\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110000000000011111000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula5|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ULA|ula6|soma_sub|ALT_INV_saida_xor~combout\,
	datad => \ULA|ula6|soma_sub|ALT_INV_saida_and~0_combout\,
	datae => \ALT_INV_entradaA[7]~input_o\,
	dataf => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|soma_sub|carry_out~combout\);

\entradaA[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(8),
	o => \entradaA[8]~input_o\);

\entradaB[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(8),
	o => \entradaB[8]~input_o\);

\ULA|ula8|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[8]~input_o\ $ (\entradaB[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[8]~input_o\,
	datac => \ALT_INV_entradaB[8]~input_o\,
	combout => \ULA|ula8|soma_sub|saida_xor~combout\);

\ULA|ula8|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_and~0_combout\ = (\entradaA[8]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[8]~input_o\,
	datac => \ALT_INV_entradaB[8]~input_o\,
	combout => \ULA|ula8|soma_sub|saida_and~0_combout\);

\entradaA[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(9),
	o => \entradaA[9]~input_o\);

\entradaB[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(9),
	o => \entradaB[9]~input_o\);

\ULA|ula9|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[9]~input_o\ $ (\entradaB[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[9]~input_o\,
	datac => \ALT_INV_entradaB[9]~input_o\,
	combout => \ULA|ula9|soma_sub|saida_xor~combout\);

\ULA|ula9|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|soma_sub|saida_and~0_combout\ = (\entradaA[9]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[9]~input_o\,
	datac => \ALT_INV_entradaB[9]~input_o\,
	combout => \ULA|ula9|soma_sub|saida_and~0_combout\);

\entradaA[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(10),
	o => \entradaA[10]~input_o\);

\entradaB[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(10),
	o => \entradaB[10]~input_o\);

\ULA|ula10|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[10]~input_o\ $ (\entradaB[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[10]~input_o\,
	datac => \ALT_INV_entradaB[10]~input_o\,
	combout => \ULA|ula10|soma_sub|saida_xor~combout\);

\ULA|ula10|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|soma_sub|saida_xor2~combout\ = ( \ULA|ula9|soma_sub|saida_and~0_combout\ & ( \ULA|ula10|soma_sub|saida_xor~combout\ ) ) # ( !\ULA|ula9|soma_sub|saida_and~0_combout\ & ( \ULA|ula10|soma_sub|saida_xor~combout\ & ( 
-- (\ULA|ula9|soma_sub|saida_xor~combout\ & (((!\ULA|ula7|soma_sub|carry_out~combout\ & \ULA|ula8|soma_sub|saida_xor~combout\)) # (\ULA|ula8|soma_sub|saida_and~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\,
	datad => \ULA|ula9|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula9|soma_sub|ALT_INV_saida_and~0_combout\,
	dataf => \ULA|ula10|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula10|soma_sub|saida_xor2~combout\);

\ULA|ula10|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|soma_sub|saida_and~0_combout\ = (\entradaA[10]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[10]~input_o\,
	datac => \ALT_INV_entradaB[10]~input_o\,
	combout => \ULA|ula10|soma_sub|saida_and~0_combout\);

\entradaA[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(11),
	o => \entradaA[11]~input_o\);

\entradaB[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(11),
	o => \entradaB[11]~input_o\);

\ULA|ula11|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[11]~input_o\ $ (\entradaB[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[11]~input_o\,
	datac => \ALT_INV_entradaB[11]~input_o\,
	combout => \ULA|ula11|soma_sub|saida_xor~combout\);

\ULA|ula11|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|soma_sub|saida_and~0_combout\ = (\entradaA[11]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[11]~input_o\,
	datac => \ALT_INV_entradaB[11]~input_o\,
	combout => \ULA|ula11|soma_sub|saida_and~0_combout\);

\entradaA[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(12),
	o => \entradaA[12]~input_o\);

\entradaB[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(12),
	o => \entradaB[12]~input_o\);

\ULA|ula12|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ = ( \UC_ULA|ula_ctrl~0_combout\ & ( \entradaB[12]~input_o\ & ( (!\ULA_op[1]~input_o\ & (!\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((!\funct[1]~input_o\))) ) ) ) # ( !\UC_ULA|ula_ctrl~0_combout\ & ( 
-- \entradaB[12]~input_o\ & ( (!\ULA_op[0]~input_o\) # (\ULA_op[1]~input_o\) ) ) ) # ( \UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[12]~input_o\ & ( (!\ULA_op[1]~input_o\ & (\ULA_op[0]~input_o\)) # (\ULA_op[1]~input_o\ & ((\funct[1]~input_o\))) ) ) ) # ( 
-- !\UC_ULA|ula_ctrl~0_combout\ & ( !\entradaB[12]~input_o\ & ( (\ULA_op[0]~input_o\ & !\ULA_op[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000111011110111011101110111011101110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datad => \ALT_INV_funct[1]~input_o\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	dataf => \ALT_INV_entradaB[12]~input_o\,
	combout => \ULA|ula12|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula12|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|soma_sub|carry_out~combout\ = ( !\entradaA[12]~input_o\ & ( \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula11|soma_sub|saida_and~0_combout\ & ((!\ULA|ula11|soma_sub|saida_xor~combout\) # ((!\ULA|ula10|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula10|soma_sub|saida_and~0_combout\)))) ) ) ) # ( \entradaA[12]~input_o\ & ( !\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula11|soma_sub|saida_and~0_combout\ & ((!\ULA|ula11|soma_sub|saida_xor~combout\) # 
-- ((!\ULA|ula10|soma_sub|saida_xor2~combout\ & !\ULA|ula10|soma_sub|saida_and~0_combout\)))) ) ) ) # ( !\entradaA[12]~input_o\ & ( !\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110000000000011111000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula10|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ULA|ula11|soma_sub|ALT_INV_saida_xor~combout\,
	datad => \ULA|ula11|soma_sub|ALT_INV_saida_and~0_combout\,
	datae => \ALT_INV_entradaA[12]~input_o\,
	dataf => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|soma_sub|carry_out~combout\);

\entradaA[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(13),
	o => \entradaA[13]~input_o\);

\entradaB[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(13),
	o => \entradaB[13]~input_o\);

\ULA|ula13|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[13]~input_o\ $ (\entradaB[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[13]~input_o\,
	datac => \ALT_INV_entradaB[13]~input_o\,
	combout => \ULA|ula13|soma_sub|saida_xor~combout\);

\ULA|ula13|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_and~0_combout\ = (\entradaA[13]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[13]~input_o\,
	datac => \ALT_INV_entradaB[13]~input_o\,
	combout => \ULA|ula13|soma_sub|saida_and~0_combout\);

\entradaA[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(14),
	o => \entradaA[14]~input_o\);

\entradaB[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(14),
	o => \entradaB[14]~input_o\);

\ULA|ula14|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[14]~input_o\ $ (\entradaB[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[14]~input_o\,
	datac => \ALT_INV_entradaB[14]~input_o\,
	combout => \ULA|ula14|soma_sub|saida_xor~combout\);

\ULA|ula14|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|soma_sub|saida_and~0_combout\ = (\entradaA[14]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[14]~input_o\,
	datac => \ALT_INV_entradaB[14]~input_o\,
	combout => \ULA|ula14|soma_sub|saida_and~0_combout\);

\entradaA[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(15),
	o => \entradaA[15]~input_o\);

\entradaB[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(15),
	o => \entradaB[15]~input_o\);

\ULA|ula15|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[15]~input_o\ $ (\entradaB[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[15]~input_o\,
	datac => \ALT_INV_entradaB[15]~input_o\,
	combout => \ULA|ula15|soma_sub|saida_xor~combout\);

\ULA|ula15|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|soma_sub|saida_xor2~combout\ = ( \ULA|ula14|soma_sub|saida_and~0_combout\ & ( \ULA|ula15|soma_sub|saida_xor~combout\ ) ) # ( !\ULA|ula14|soma_sub|saida_and~0_combout\ & ( \ULA|ula15|soma_sub|saida_xor~combout\ & ( 
-- (\ULA|ula14|soma_sub|saida_xor~combout\ & (((!\ULA|ula12|soma_sub|carry_out~combout\ & \ULA|ula13|soma_sub|saida_xor~combout\)) # (\ULA|ula13|soma_sub|saida_and~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\,
	datad => \ULA|ula14|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula14|soma_sub|ALT_INV_saida_and~0_combout\,
	dataf => \ULA|ula15|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula15|soma_sub|saida_xor2~combout\);

\ULA|ula15|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|soma_sub|saida_and~0_combout\ = (\entradaA[15]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[15]~input_o\,
	datac => \ALT_INV_entradaB[15]~input_o\,
	combout => \ULA|ula15|soma_sub|saida_and~0_combout\);

\entradaA[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(16),
	o => \entradaA[16]~input_o\);

\entradaB[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(16),
	o => \entradaB[16]~input_o\);

\ULA|ula16|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[16]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[16]~input_o\,
	combout => \ULA|ula16|mux_inverteB|saida_MUX~0_combout\);

\entradaA[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(17),
	o => \entradaA[17]~input_o\);

\entradaB[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(17),
	o => \entradaB[17]~input_o\);

\ULA|ula17|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[17]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[17]~input_o\,
	combout => \ULA|ula17|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula17|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|soma_sub|carry_out~combout\ = ( !\entradaA[17]~input_o\ & ( \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[16]~input_o\ & ((!\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula15|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula15|soma_sub|saida_and~0_combout\)))) # (\entradaA[16]~input_o\ & (!\ULA|ula15|soma_sub|saida_xor2~combout\ & (!\ULA|ula15|soma_sub|saida_and~0_combout\ & !\ULA|ula16|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \entradaA[17]~input_o\ & ( 
-- !\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[16]~input_o\ & ((!\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula15|soma_sub|saida_xor2~combout\ & !\ULA|ula15|soma_sub|saida_and~0_combout\)))) # (\entradaA[16]~input_o\ & 
-- (!\ULA|ula15|soma_sub|saida_xor2~combout\ & (!\ULA|ula15|soma_sub|saida_and~0_combout\ & !\ULA|ula16|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\entradaA[17]~input_o\ & ( !\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula15|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[16]~input_o\,
	datad => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ALT_INV_entradaA[17]~input_o\,
	dataf => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|soma_sub|carry_out~combout\);

\entradaA[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(18),
	o => \entradaA[18]~input_o\);

\entradaB[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(18),
	o => \entradaB[18]~input_o\);

\ULA|ula18|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[18]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[18]~input_o\,
	combout => \ULA|ula18|mux_inverteB|saida_MUX~0_combout\);

\entradaA[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(19),
	o => \entradaA[19]~input_o\);

\entradaB[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(19),
	o => \entradaB[19]~input_o\);

\ULA|ula19|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[19]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[19]~input_o\,
	combout => \ULA|ula19|mux_inverteB|saida_MUX~0_combout\);

\entradaA[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(20),
	o => \entradaA[20]~input_o\);

\entradaB[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(20),
	o => \entradaB[20]~input_o\);

\ULA|ula20|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[20]~input_o\ $ (\entradaB[20]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[20]~input_o\,
	datac => \ALT_INV_entradaB[20]~input_o\,
	combout => \ULA|ula20|soma_sub|saida_xor~combout\);

\ULA|ula20|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|soma_sub|saida_xor2~combout\ = ( \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula20|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula17|soma_sub|carry_out~combout\ & ((\ULA|ula18|mux_inverteB|saida_MUX~0_combout\) # 
-- (\entradaA[18]~input_o\))) # (\ULA|ula17|soma_sub|carry_out~combout\ & (\entradaA[18]~input_o\ & \ULA|ula18|mux_inverteB|saida_MUX~0_combout\))) # (\entradaA[19]~input_o\) ) ) ) # ( !\ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & ( 
-- \ULA|ula20|soma_sub|saida_xor~combout\ & ( (\entradaA[19]~input_o\ & ((!\ULA|ula17|soma_sub|carry_out~combout\ & ((\ULA|ula18|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[18]~input_o\))) # (\ULA|ula17|soma_sub|carry_out~combout\ & 
-- (\entradaA[18]~input_o\ & \ULA|ula18|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[18]~input_o\,
	datac => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ALT_INV_entradaA[19]~input_o\,
	datae => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula20|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula20|soma_sub|saida_xor2~combout\);

\ULA|ula20|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|soma_sub|saida_and~0_combout\ = (\entradaA[20]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[20]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001000010010000100100001001000010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[20]~input_o\,
	datac => \ALT_INV_entradaB[20]~input_o\,
	combout => \ULA|ula20|soma_sub|saida_and~0_combout\);

\entradaA[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(21),
	o => \entradaA[21]~input_o\);

\entradaB[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(21),
	o => \entradaB[21]~input_o\);

\ULA|ula21|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[21]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[21]~input_o\,
	combout => \ULA|ula21|mux_inverteB|saida_MUX~0_combout\);

\entradaA[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(22),
	o => \entradaA[22]~input_o\);

\entradaB[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(22),
	o => \entradaB[22]~input_o\);

\ULA|ula22|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[22]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[22]~input_o\,
	combout => \ULA|ula22|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula22|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|soma_sub|carry_out~combout\ = ( !\entradaA[22]~input_o\ & ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[21]~input_o\ & ((!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula20|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula20|soma_sub|saida_and~0_combout\)))) # (\entradaA[21]~input_o\ & (!\ULA|ula20|soma_sub|saida_xor2~combout\ & (!\ULA|ula20|soma_sub|saida_and~0_combout\ & !\ULA|ula21|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \entradaA[22]~input_o\ & ( 
-- !\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[21]~input_o\ & ((!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula20|soma_sub|saida_xor2~combout\ & !\ULA|ula20|soma_sub|saida_and~0_combout\)))) # (\entradaA[21]~input_o\ & 
-- (!\ULA|ula20|soma_sub|saida_xor2~combout\ & (!\ULA|ula20|soma_sub|saida_and~0_combout\ & !\ULA|ula21|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\entradaA[22]~input_o\ & ( !\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula20|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[21]~input_o\,
	datad => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ALT_INV_entradaA[22]~input_o\,
	dataf => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|soma_sub|carry_out~combout\);

\entradaA[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(23),
	o => \entradaA[23]~input_o\);

\entradaB[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(23),
	o => \entradaB[23]~input_o\);

\ULA|ula23|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[23]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[23]~input_o\,
	combout => \ULA|ula23|mux_inverteB|saida_MUX~0_combout\);

\entradaA[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(24),
	o => \entradaA[24]~input_o\);

\entradaB[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(24),
	o => \entradaB[24]~input_o\);

\ULA|ula24|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[24]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[24]~input_o\,
	combout => \ULA|ula24|mux_inverteB|saida_MUX~0_combout\);

\entradaA[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(25),
	o => \entradaA[25]~input_o\);

\entradaB[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(25),
	o => \entradaB[25]~input_o\);

\ULA|ula25|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[25]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[25]~input_o\,
	combout => \ULA|ula25|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula25|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|soma_sub|saida_xor~combout\ = !\entradaA[25]~input_o\ $ (!\ULA|ula25|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[25]~input_o\,
	datab => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|soma_sub|saida_xor~combout\);

\ULA|ula25|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|soma_sub|saida_xor2~combout\ = ( \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula25|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula22|soma_sub|carry_out~combout\ & ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # 
-- (\entradaA[23]~input_o\))) # (\ULA|ula22|soma_sub|carry_out~combout\ & (\entradaA[23]~input_o\ & \ULA|ula23|mux_inverteB|saida_MUX~0_combout\))) # (\entradaA[24]~input_o\) ) ) ) # ( !\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & ( 
-- \ULA|ula25|soma_sub|saida_xor~combout\ & ( (\entradaA[24]~input_o\ & ((!\ULA|ula22|soma_sub|carry_out~combout\ & ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[23]~input_o\))) # (\ULA|ula22|soma_sub|carry_out~combout\ & 
-- (\entradaA[23]~input_o\ & \ULA|ula23|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[23]~input_o\,
	datac => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ALT_INV_entradaA[24]~input_o\,
	datae => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula25|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula25|soma_sub|saida_xor2~combout\);

\ULA|ula25|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|soma_sub|saida_and~0_combout\ = (\entradaA[25]~input_o\ & \ULA|ula25|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[25]~input_o\,
	datab => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|soma_sub|saida_and~0_combout\);

\entradaA[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(26),
	o => \entradaA[26]~input_o\);

\entradaB[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(26),
	o => \entradaB[26]~input_o\);

\ULA|ula26|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[26]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[26]~input_o\,
	combout => \ULA|ula26|mux_inverteB|saida_MUX~0_combout\);

\entradaA[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(27),
	o => \entradaA[27]~input_o\);

\entradaB[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(27),
	o => \entradaB[27]~input_o\);

\ULA|ula27|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[27]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[27]~input_o\,
	combout => \ULA|ula27|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula27|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|soma_sub|carry_out~combout\ = ( !\entradaA[27]~input_o\ & ( \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[26]~input_o\ & ((!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula25|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula25|soma_sub|saida_and~0_combout\)))) # (\entradaA[26]~input_o\ & (!\ULA|ula25|soma_sub|saida_xor2~combout\ & (!\ULA|ula25|soma_sub|saida_and~0_combout\ & !\ULA|ula26|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \entradaA[27]~input_o\ & ( 
-- !\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( (!\entradaA[26]~input_o\ & ((!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula25|soma_sub|saida_xor2~combout\ & !\ULA|ula25|soma_sub|saida_and~0_combout\)))) # (\entradaA[26]~input_o\ & 
-- (!\ULA|ula25|soma_sub|saida_xor2~combout\ & (!\ULA|ula25|soma_sub|saida_and~0_combout\ & !\ULA|ula26|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\entradaA[27]~input_o\ & ( !\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula25|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[26]~input_o\,
	datad => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ALT_INV_entradaA[27]~input_o\,
	dataf => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|soma_sub|carry_out~combout\);

\entradaA[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(28),
	o => \entradaA[28]~input_o\);

\entradaB[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(28),
	o => \entradaB[28]~input_o\);

\entradaA[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(29),
	o => \entradaA[29]~input_o\);

\entradaB[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(29),
	o => \entradaB[29]~input_o\);

\ULA|ula29|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|soma_sub|carry_out~combout\ = ( \entradaA[29]~input_o\ & ( \entradaB[29]~input_o\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\) # ((!\ULA|ula27|soma_sub|carry_out~combout\ & ((!\entradaB[28]~input_o\) # (\entradaA[28]~input_o\))) # 
-- (\ULA|ula27|soma_sub|carry_out~combout\ & (\entradaA[28]~input_o\ & !\entradaB[28]~input_o\))) ) ) ) # ( !\entradaA[29]~input_o\ & ( \entradaB[29]~input_o\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ & ((!\ULA|ula27|soma_sub|carry_out~combout\ & 
-- ((\entradaB[28]~input_o\) # (\entradaA[28]~input_o\))) # (\ULA|ula27|soma_sub|carry_out~combout\ & (\entradaA[28]~input_o\ & \entradaB[28]~input_o\)))) ) ) ) # ( \entradaA[29]~input_o\ & ( !\entradaB[29]~input_o\ & ( 
-- ((!\ULA|ula27|soma_sub|carry_out~combout\ & ((\entradaB[28]~input_o\) # (\entradaA[28]~input_o\))) # (\ULA|ula27|soma_sub|carry_out~combout\ & (\entradaA[28]~input_o\ & \entradaB[28]~input_o\))) # (\UC_ULA|ula_ctrl[2]~1_combout\) ) ) ) # ( 
-- !\entradaA[29]~input_o\ & ( !\entradaB[29]~input_o\ & ( (\UC_ULA|ula_ctrl[2]~1_combout\ & ((!\ULA|ula27|soma_sub|carry_out~combout\ & ((!\entradaB[28]~input_o\) # (\entradaA[28]~input_o\))) # (\ULA|ula27|soma_sub|carry_out~combout\ & 
-- (\entradaA[28]~input_o\ & !\entradaB[28]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010100000100010111011101111100001000100010101110111110101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula27|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[28]~input_o\,
	datad => \ALT_INV_entradaB[28]~input_o\,
	datae => \ALT_INV_entradaA[29]~input_o\,
	dataf => \ALT_INV_entradaB[29]~input_o\,
	combout => \ULA|ula29|soma_sub|carry_out~combout\);

\entradaA[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(30),
	o => \entradaA[30]~input_o\);

\entradaB[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(30),
	o => \entradaB[30]~input_o\);

\ULA|ula30|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[30]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[30]~input_o\,
	combout => \ULA|ula30|mux_inverteB|saida_MUX~0_combout\);

\entradaA[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaA(31),
	o => \entradaA[31]~input_o\);

\entradaB[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradaB(31),
	o => \entradaB[31]~input_o\);

\ULA|ula31|soma_sub|saida~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|soma_sub|saida~0_combout\ = !\entradaA[31]~input_o\ $ (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\entradaB[31]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[31]~input_o\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \ALT_INV_entradaB[31]~input_o\,
	combout => \ULA|ula31|soma_sub|saida~0_combout\);

\funct[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(3),
	o => \funct[3]~input_o\);

\UC_ULA|ula_ctrl~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~2_combout\ = (\funct[3]~input_o\ & (\funct[1]~input_o\ & \UC_ULA|ula_ctrl~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[3]~input_o\,
	datab => \ALT_INV_funct[1]~input_o\,
	datac => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \UC_ULA|ula_ctrl~2_combout\);

\ULA|ula0|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~0_combout\ = (\ULA_op[1]~input_o\ & ((!\UC_ULA|ula_ctrl~0_combout\) # (\funct[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100010001010101010001000101010101000100010101010100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[1]~input_o\,
	datab => \ALT_INV_funct[3]~input_o\,
	datad => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~0_combout\);

\ULA|ula0|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~1_combout\ = (\UC_ULA|ula_ctrl~2_combout\ & \ULA|ula0|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl~2_combout\,
	datab => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~1_combout\);

\UC_ULA|ula_ctrl~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~3_combout\ = (!\ULA_op[0]~input_o\ & (\ULA_op[1]~input_o\ & (!\funct[4]~input_o\ & \funct[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000010000000000000001000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[0]~input_o\,
	datab => \ALT_INV_ULA_op[1]~input_o\,
	datac => \ALT_INV_funct[4]~input_o\,
	datad => \ALT_INV_funct[5]~input_o\,
	combout => \UC_ULA|ula_ctrl~3_combout\);

\UC_ULA|ula_ctrl~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~4_combout\ = ( \UC_ULA|ula_ctrl~3_combout\ & ( (!\funct[3]~input_o\ & (!\funct[1]~input_o\ & (\funct[0]~input_o\ & \funct[2]~input_o\))) # (\funct[3]~input_o\ & (\funct[1]~input_o\ & (!\funct[0]~input_o\ & !\funct[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100000000100000000000000000000001000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[3]~input_o\,
	datab => \ALT_INV_funct[1]~input_o\,
	datac => \ALT_INV_funct[0]~input_o\,
	datad => \ALT_INV_funct[2]~input_o\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~3_combout\,
	combout => \UC_ULA|ula_ctrl~4_combout\);

\ULA|ula0|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~2_combout\ = ( \ULA|ula0|mux_ula|saida_MUX~0_combout\ & ( \UC_ULA|ula_ctrl~4_combout\ & ( (!\UC_ULA|ula_ctrl~2_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[0]~input_o\)) # (\entradaA[0]~input_o\))) ) ) ) # ( 
-- !\ULA|ula0|mux_ula|saida_MUX~0_combout\ & ( \UC_ULA|ula_ctrl~4_combout\ & ( !\entradaA[0]~input_o\ $ (!\entradaB[0]~input_o\) ) ) ) # ( \ULA|ula0|mux_ula|saida_MUX~0_combout\ & ( !\UC_ULA|ula_ctrl~4_combout\ & ( (!\UC_ULA|ula_ctrl~2_combout\ & 
-- (\entradaA[0]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[0]~input_o\)))) ) ) ) # ( !\ULA|ula0|mux_ula|saida_MUX~0_combout\ & ( !\UC_ULA|ula_ctrl~4_combout\ & ( !\entradaA[0]~input_o\ $ (!\entradaB[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000000100000100000001111111100000010101010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl~2_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \ALT_INV_entradaA[0]~input_o\,
	datad => \ALT_INV_entradaB[0]~input_o\,
	datae => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~4_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~2_combout\);

\ULA|ula0|mux_ula|saida_MUX~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~3_combout\ = ( \ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula0|mux_ula|saida_MUX~2_combout\ ) ) # ( !\ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula0|mux_ula|saida_MUX~2_combout\ ) ) # ( 
-- \ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula0|mux_ula|saida_MUX~2_combout\ & ( !\ULA|ula31|soma_sub|saida~0_combout\ $ (((!\ULA|ula29|soma_sub|carry_out~combout\ & ((!\entradaA[30]~input_o\) # (!\ULA|ula30|mux_inverteB|saida_MUX~0_combout\))) # 
-- (\ULA|ula29|soma_sub|carry_out~combout\ & (!\entradaA[30]~input_o\ & !\ULA|ula30|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000101111110100011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[30]~input_o\,
	datac => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	datae => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~3_combout\);

\ULA|ula2|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_ula|saida_MUX~0_combout\ = (\ULA_op[1]~input_o\ & \UC_ULA|ula_ctrl~4_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ULA_op[1]~input_o\,
	datab => \UC_ULA|ALT_INV_ula_ctrl~4_combout\,
	combout => \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\ULA|ula2|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_ula|saida_MUX~1_combout\ = (!\UC_ULA|ula_ctrl~2_combout\ & \ULA|ula0|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl~2_combout\,
	datab => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula2|mux_ula|saida_MUX~1_combout\);

\ULA|ula1|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[1]~input_o\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[1]~input_o\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\entradaA[1]~input_o\ $ 
-- (!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula0|soma_sub|carry_out~1_combout\) # (\ULA|ula0|soma_sub|carry_out~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110011001000000000000000000010001000100010111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[1]~input_o\,
	datab => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula0|soma_sub|ALT_INV_carry_out~0_combout\,
	datad => \ULA|ula0|soma_sub|ALT_INV_carry_out~1_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula1|mux_ula|saida_MUX~0_combout\);

\ULA|ula1|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|soma_sub|carry_out~combout\ = (!\entradaA[1]~input_o\ & ((!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula0|soma_sub|carry_out~0_combout\ & !\ULA|ula0|soma_sub|carry_out~1_combout\)))) # (\entradaA[1]~input_o\ & 
-- (!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\ & (!\ULA|ula0|soma_sub|carry_out~0_combout\ & !\ULA|ula0|soma_sub|carry_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110100010001000111010001000100011101000100010001110100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[1]~input_o\,
	datab => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula0|soma_sub|ALT_INV_carry_out~0_combout\,
	datad => \ULA|ula0|soma_sub|ALT_INV_carry_out~1_combout\,
	combout => \ULA|ula1|soma_sub|carry_out~combout\);

\ULA|ula2|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_ula|saida_MUX~2_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[2]~input_o\ & (\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[2]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula2|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula1|soma_sub|carry_out~combout\ $ (!\entradaA[2]~input_o\ $ 
-- (!\ULA|ula2|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[2]~input_o\,
	datac => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula2|mux_ula|saida_MUX~2_combout\);

\ULA|ula3|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[3]~input_o\)) # (\entradaA[3]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[3]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[3]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula2|soma_sub|carry_out~combout\ $ (!\entradaA[3]~input_o\ $ (\entradaB[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula2|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[3]~input_o\,
	datad => \ALT_INV_entradaB[3]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula3|mux_ula|saida_MUX~0_combout\);

\ULA|ula3|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|carry_out~combout\ = (!\ULA|ula3|soma_sub|saida_and~0_combout\ & ((!\ULA|ula3|soma_sub|saida_xor~combout\) # (\ULA|ula2|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula2|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula3|soma_sub|carry_out~combout\);

\ULA|ula4|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[4]~input_o\)) # (\entradaA[4]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[4]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[4]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula3|soma_sub|carry_out~combout\ $ (!\entradaA[4]~input_o\ $ (\entradaB[4]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[4]~input_o\,
	datad => \ALT_INV_entradaB[4]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula4|mux_ula|saida_MUX~0_combout\);

\ULA|ula4|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|soma_sub|carry_out~combout\ = (!\ULA|ula4|soma_sub|saida_and~0_combout\ & ((!\ULA|ula4|soma_sub|saida_xor~combout\) # (\ULA|ula3|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula4|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula4|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula4|soma_sub|carry_out~combout\);

\ULA|ula5|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[5]~input_o\)) # (\entradaA[5]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[5]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[5]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula4|soma_sub|carry_out~combout\ $ (!\entradaA[5]~input_o\ $ (\entradaB[5]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula4|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[5]~input_o\,
	datad => \ALT_INV_entradaB[5]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula5|mux_ula|saida_MUX~0_combout\);

\ULA|ula5|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|carry_out~combout\ = (!\ULA|ula5|soma_sub|saida_xor2~combout\ & !\ULA|ula5|soma_sub|saida_and~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula5|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula5|soma_sub|carry_out~combout\);

\ULA|ula6|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[6]~input_o\)) # (\entradaA[6]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[6]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[6]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula5|soma_sub|carry_out~combout\ $ (!\entradaA[6]~input_o\ $ (\entradaB[6]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[6]~input_o\,
	datad => \ALT_INV_entradaB[6]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula6|mux_ula|saida_MUX~0_combout\);

\ULA|ula6|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|soma_sub|carry_out~combout\ = (!\ULA|ula6|soma_sub|saida_and~0_combout\ & ((!\ULA|ula6|soma_sub|saida_xor~combout\) # (\ULA|ula5|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula6|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula6|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula6|soma_sub|carry_out~combout\);

\ULA|ula7|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[7]~input_o\ & (\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[7]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula7|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula6|soma_sub|carry_out~combout\ $ (!\entradaA[7]~input_o\ $ 
-- (!\ULA|ula7|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula6|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[7]~input_o\,
	datac => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula7|mux_ula|saida_MUX~0_combout\);

\ULA|ula8|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[8]~input_o\)) # (\entradaA[8]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[8]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[8]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula7|soma_sub|carry_out~combout\ $ (!\entradaA[8]~input_o\ $ (\entradaB[8]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[8]~input_o\,
	datad => \ALT_INV_entradaB[8]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula8|mux_ula|saida_MUX~0_combout\);

\ULA|ula8|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|carry_out~combout\ = (!\ULA|ula8|soma_sub|saida_and~0_combout\ & ((!\ULA|ula8|soma_sub|saida_xor~combout\) # (\ULA|ula7|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula8|soma_sub|carry_out~combout\);

\ULA|ula9|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[9]~input_o\)) # (\entradaA[9]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[9]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[9]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula8|soma_sub|carry_out~combout\ $ (!\entradaA[9]~input_o\ $ (\entradaB[9]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[9]~input_o\,
	datad => \ALT_INV_entradaB[9]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula9|mux_ula|saida_MUX~0_combout\);

\ULA|ula9|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|soma_sub|carry_out~combout\ = (!\ULA|ula9|soma_sub|saida_and~0_combout\ & ((!\ULA|ula9|soma_sub|saida_xor~combout\) # (\ULA|ula8|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula9|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula9|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula9|soma_sub|carry_out~combout\);

\ULA|ula10|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[10]~input_o\)) # (\entradaA[10]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[10]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[10]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula9|soma_sub|carry_out~combout\ $ (!\entradaA[10]~input_o\ $ (\entradaB[10]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula9|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[10]~input_o\,
	datad => \ALT_INV_entradaB[10]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula10|mux_ula|saida_MUX~0_combout\);

\ULA|ula10|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|soma_sub|carry_out~combout\ = (!\ULA|ula10|soma_sub|saida_xor2~combout\ & !\ULA|ula10|soma_sub|saida_and~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula10|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula10|soma_sub|carry_out~combout\);

\ULA|ula11|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[11]~input_o\)) # (\entradaA[11]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[11]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[11]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula10|soma_sub|carry_out~combout\ $ (!\entradaA[11]~input_o\ $ (\entradaB[11]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[11]~input_o\,
	datad => \ALT_INV_entradaB[11]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula11|mux_ula|saida_MUX~0_combout\);

\ULA|ula11|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|soma_sub|carry_out~combout\ = (!\ULA|ula11|soma_sub|saida_and~0_combout\ & ((!\ULA|ula11|soma_sub|saida_xor~combout\) # (\ULA|ula10|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula11|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula11|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula11|soma_sub|carry_out~combout\);

\ULA|ula12|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[12]~input_o\ & (\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[12]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula12|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula11|soma_sub|carry_out~combout\ $ (!\entradaA[12]~input_o\ 
-- $ (!\ULA|ula12|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula11|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[12]~input_o\,
	datac => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula12|mux_ula|saida_MUX~0_combout\);

\ULA|ula13|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[13]~input_o\)) # (\entradaA[13]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[13]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[13]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula12|soma_sub|carry_out~combout\ $ (!\entradaA[13]~input_o\ $ (\entradaB[13]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[13]~input_o\,
	datad => \ALT_INV_entradaB[13]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula13|mux_ula|saida_MUX~0_combout\);

\ULA|ula13|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|carry_out~combout\ = (!\ULA|ula13|soma_sub|saida_and~0_combout\ & ((!\ULA|ula13|soma_sub|saida_xor~combout\) # (\ULA|ula12|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula13|soma_sub|carry_out~combout\);

\ULA|ula14|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[14]~input_o\)) # (\entradaA[14]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[14]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[14]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula13|soma_sub|carry_out~combout\ $ (!\entradaA[14]~input_o\ $ (\entradaB[14]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[14]~input_o\,
	datad => \ALT_INV_entradaB[14]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula14|mux_ula|saida_MUX~0_combout\);

\ULA|ula14|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|soma_sub|carry_out~combout\ = (!\ULA|ula14|soma_sub|saida_and~0_combout\ & ((!\ULA|ula14|soma_sub|saida_xor~combout\) # (\ULA|ula13|soma_sub|carry_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011010000110100001101000011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula14|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula14|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula14|soma_sub|carry_out~combout\);

\ULA|ula15|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[15]~input_o\)) # (\entradaA[15]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[15]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[15]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula14|soma_sub|carry_out~combout\ $ (!\entradaA[15]~input_o\ $ (\entradaB[15]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011001101001000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula14|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[15]~input_o\,
	datad => \ALT_INV_entradaB[15]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula15|mux_ula|saida_MUX~0_combout\);

\ULA|ula15|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|soma_sub|carry_out~combout\ = (!\ULA|ula15|soma_sub|saida_xor2~combout\ & !\ULA|ula15|soma_sub|saida_and~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula15|soma_sub|ALT_INV_saida_and~0_combout\,
	combout => \ULA|ula15|soma_sub|carry_out~combout\);

\ULA|ula16|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[16]~input_o\ & (\ULA|ula16|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[16]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula16|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula15|soma_sub|carry_out~combout\ $ (!\entradaA[16]~input_o\ 
-- $ (!\ULA|ula16|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[16]~input_o\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula16|mux_ula|saida_MUX~0_combout\);

\ULA|ula16|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|soma_sub|carry_out~combout\ = (!\ULA|ula15|soma_sub|carry_out~combout\ & ((\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[16]~input_o\))) # (\ULA|ula15|soma_sub|carry_out~combout\ & (\entradaA[16]~input_o\ & 
-- \ULA|ula16|mux_inverteB|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100101011001010110010101100101011001010110010101100101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[16]~input_o\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula16|soma_sub|carry_out~combout\);

\ULA|ula17|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[17]~input_o\ & (\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[17]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula17|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula16|soma_sub|carry_out~combout\ $ (!\entradaA[17]~input_o\ 
-- $ (\ULA|ula17|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula16|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[17]~input_o\,
	datac => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula17|mux_ula|saida_MUX~0_combout\);

\ULA|ula18|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[18]~input_o\ & (\ULA|ula18|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[18]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula18|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula17|soma_sub|carry_out~combout\ $ (!\entradaA[18]~input_o\ 
-- $ (!\ULA|ula18|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[18]~input_o\,
	datac => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula18|mux_ula|saida_MUX~0_combout\);

\ULA|ula18|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|soma_sub|carry_out~combout\ = (!\ULA|ula17|soma_sub|carry_out~combout\ & ((\ULA|ula18|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[18]~input_o\))) # (\ULA|ula17|soma_sub|carry_out~combout\ & (\entradaA[18]~input_o\ & 
-- \ULA|ula18|mux_inverteB|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100101011001010110010101100101011001010110010101100101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[18]~input_o\,
	datac => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula18|soma_sub|carry_out~combout\);

\ULA|ula19|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[19]~input_o\ & (\ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[19]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula19|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula18|soma_sub|carry_out~combout\ $ (!\entradaA[19]~input_o\ 
-- $ (\ULA|ula19|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[19]~input_o\,
	datac => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~0_combout\);

\ULA|ula19|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|soma_sub|carry_out~combout\ = (!\ULA|ula18|soma_sub|carry_out~combout\ & (\entradaA[19]~input_o\ & \ULA|ula19|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula18|soma_sub|carry_out~combout\ & ((\ULA|ula19|mux_inverteB|saida_MUX~0_combout\) # 
-- (\entradaA[19]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[19]~input_o\,
	datac => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula19|soma_sub|carry_out~combout\);

\ULA|ula20|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[20]~input_o\)) # (\entradaA[20]~input_o\) ) ) ) # ( 
-- !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[20]~input_o\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[20]~input_o\))) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula19|soma_sub|carry_out~combout\ $ (!\entradaA[20]~input_o\ $ (!\entradaB[20]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110000000000000000000000101000010100101111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula19|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ALT_INV_entradaA[20]~input_o\,
	datad => \ALT_INV_entradaB[20]~input_o\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula20|mux_ula|saida_MUX~0_combout\);

\ULA|ula21|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[21]~input_o\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & 
-- ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[21]~input_o\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\entradaA[21]~input_o\ $ 
-- (!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula20|soma_sub|saida_and~0_combout\) # (\ULA|ula20|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula20|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[21]~input_o\,
	datad => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula21|mux_ula|saida_MUX~0_combout\);

\ULA|ula21|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|soma_sub|carry_out~combout\ = (!\entradaA[21]~input_o\ & ((!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula20|soma_sub|saida_xor2~combout\ & !\ULA|ula20|soma_sub|saida_and~0_combout\)))) # (\entradaA[21]~input_o\ & 
-- (!\ULA|ula20|soma_sub|saida_xor2~combout\ & (!\ULA|ula20|soma_sub|saida_and~0_combout\ & !\ULA|ula21|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010000000111110001000000011111000100000001111100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula20|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[21]~input_o\,
	datad => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula21|soma_sub|carry_out~combout\);

\ULA|ula22|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[22]~input_o\ & (\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[22]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula22|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula21|soma_sub|carry_out~combout\ $ (!\entradaA[22]~input_o\ 
-- $ (!\ULA|ula22|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula21|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[22]~input_o\,
	datac => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula22|mux_ula|saida_MUX~0_combout\);

\ULA|ula23|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[23]~input_o\ & (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[23]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula22|soma_sub|carry_out~combout\ $ (!\entradaA[23]~input_o\ 
-- $ (!\ULA|ula23|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[23]~input_o\,
	datac => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula23|mux_ula|saida_MUX~0_combout\);

\ULA|ula24|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|soma_sub|saida_xor~combout\ = !\entradaA[24]~input_o\ $ (!\ULA|ula24|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[24]~input_o\,
	datab => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|soma_sub|saida_xor~combout\);

\ULA|ula1|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & !\ULA|ula2|mux_ula|saida_MUX~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula1|mux_ula|saida_MUX~1_combout\);

\ULA|ula24|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_ula|saida_MUX~0_combout\ = (\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ((!\entradaA[24]~input_o\ & (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[24]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[24]~input_o\,
	datab => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula24|mux_ula|saida_MUX~0_combout\);

\ULA|ula24|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula24|soma_sub|saida_xor~combout\ $ (((!\ULA|ula22|soma_sub|carry_out~combout\ & (!\entradaA[23]~input_o\ & !\ULA|ula23|mux_inverteB|saida_MUX~0_combout\)) # 
-- (\ULA|ula22|soma_sub|carry_out~combout\ & ((!\entradaA[23]~input_o\) # (!\ULA|ula23|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[23]~input_o\,
	datac => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula24|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|mux_ula|saida_MUX~1_combout\);

\ULA|ula24|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|soma_sub|carry_out~combout\ = ( \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & ( ((!\ULA|ula22|soma_sub|carry_out~combout\ & ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[23]~input_o\))) # (\ULA|ula22|soma_sub|carry_out~combout\ 
-- & (\entradaA[23]~input_o\ & \ULA|ula23|mux_inverteB|saida_MUX~0_combout\))) # (\entradaA[24]~input_o\) ) ) # ( !\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & ( (\entradaA[24]~input_o\ & ((!\ULA|ula22|soma_sub|carry_out~combout\ & 
-- ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[23]~input_o\))) # (\ULA|ula22|soma_sub|carry_out~combout\ & (\entradaA[23]~input_o\ & \ULA|ula23|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101011001010111111111100000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[23]~input_o\,
	datac => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ALT_INV_entradaA[24]~input_o\,
	datae => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|soma_sub|carry_out~combout\);

\ULA|ula25|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[25]~input_o\ & (\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[25]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula25|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula24|soma_sub|carry_out~combout\ $ (!\entradaA[25]~input_o\ 
-- $ (\ULA|ula25|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula24|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[25]~input_o\,
	datac => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula25|mux_ula|saida_MUX~0_combout\);

\ULA|ula26|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[26]~input_o\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & 
-- ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (\entradaA[26]~input_o\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( !\entradaA[26]~input_o\ $ 
-- (!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula25|soma_sub|saida_and~0_combout\) # (\ULA|ula25|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula25|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[26]~input_o\,
	datad => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula26|mux_ula|saida_MUX~0_combout\);

\ULA|ula26|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|soma_sub|carry_out~combout\ = (!\entradaA[26]~input_o\ & ((!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula25|soma_sub|saida_xor2~combout\ & !\ULA|ula25|soma_sub|saida_and~0_combout\)))) # (\entradaA[26]~input_o\ & 
-- (!\ULA|ula25|soma_sub|saida_xor2~combout\ & (!\ULA|ula25|soma_sub|saida_and~0_combout\ & !\ULA|ula26|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010000000111110001000000011111000100000001111100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula25|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \ALT_INV_entradaA[26]~input_o\,
	datad => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula26|soma_sub|carry_out~combout\);

\ULA|ula27|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[27]~input_o\ & (\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[27]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula27|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula26|soma_sub|carry_out~combout\ $ (!\entradaA[27]~input_o\ 
-- $ (!\ULA|ula27|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula26|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[27]~input_o\,
	datac => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula27|mux_ula|saida_MUX~0_combout\);

\ULA|ula28|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[28]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaB[28]~input_o\,
	combout => \ULA|ula28|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula28|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[28]~input_o\ & (\ULA|ula28|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[28]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula28|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula27|soma_sub|carry_out~combout\ $ (!\entradaA[28]~input_o\ 
-- $ (!\ULA|ula28|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula27|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[28]~input_o\,
	datac => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula28|mux_ula|saida_MUX~0_combout\);

\ULA|ula29|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|soma_sub|saida_xor~combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaA[29]~input_o\ $ (\entradaB[29]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[29]~input_o\,
	datac => \ALT_INV_entradaB[29]~input_o\,
	combout => \ULA|ula29|soma_sub|saida_xor~combout\);

\ULA|ula29|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[29]~input_o\ & (\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[29]~input_o\)))) # (\entradaA[29]~input_o\ & 
-- ((!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[29]~input_o\)) # (\ULA|ula2|mux_ula|saida_MUX~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100100111101100000000000000000001001001111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ALT_INV_entradaA[29]~input_o\,
	datac => \ALT_INV_entradaB[29]~input_o\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula29|mux_ula|saida_MUX~0_combout\);

\ULA|ula29|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula29|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula29|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula29|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula29|soma_sub|saida_xor~combout\ $ (((!\ULA|ula27|soma_sub|carry_out~combout\ & (!\entradaA[28]~input_o\ & !\ULA|ula28|mux_inverteB|saida_MUX~0_combout\)) # 
-- (\ULA|ula27|soma_sub|carry_out~combout\ & ((!\entradaA[28]~input_o\) # (!\ULA|ula28|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula27|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[28]~input_o\,
	datac => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula29|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula29|mux_ula|saida_MUX~1_combout\);

\ULA|ula30|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[30]~input_o\ & (\ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\)) # (\entradaA[30]~input_o\ & 
-- ((\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula30|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula29|soma_sub|carry_out~combout\ $ (!\entradaA[30]~input_o\ 
-- $ (\ULA|ula30|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[30]~input_o\,
	datac => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula30|mux_ula|saida_MUX~0_combout\);

\ULA|ula31|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\entradaA[31]~input_o\ & (\ULA|ula2|mux_ula|saida_MUX~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[31]~input_o\)))) # (\entradaA[31]~input_o\ & 
-- ((!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\entradaB[31]~input_o\)) # (\ULA|ula2|mux_ula|saida_MUX~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000101000111110100000000000000000001010001111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[31]~input_o\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \ALT_INV_entradaB[31]~input_o\,
	datad => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula31|mux_ula|saida_MUX~0_combout\);

\ULA|ula31|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula31|soma_sub|saida~0_combout\ & ( \ULA|ula31|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula31|soma_sub|saida~0_combout\ & ( \ULA|ula31|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula31|soma_sub|saida~0_combout\ & ( !\ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ((!\ULA|ula29|soma_sub|carry_out~combout\ & ((!\entradaA[30]~input_o\) # (!\ULA|ula30|mux_inverteB|saida_MUX~0_combout\))) # 
-- (\ULA|ula29|soma_sub|carry_out~combout\ & (!\entradaA[30]~input_o\ & !\ULA|ula30|mux_inverteB|saida_MUX~0_combout\)))) ) ) ) # ( !\ULA|ula31|soma_sub|saida~0_combout\ & ( !\ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula1|mux_ula|saida_MUX~1_combout\ 
-- & ((!\ULA|ula29|soma_sub|carry_out~combout\ & (\entradaA[30]~input_o\ & \ULA|ula30|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula29|soma_sub|carry_out~combout\ & ((\ULA|ula30|mux_inverteB|saida_MUX~0_combout\) # (\entradaA[30]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000001110100011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ALT_INV_entradaA[30]~input_o\,
	datac => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datae => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	dataf => \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|mux_ula|saida_MUX~1_combout\);

\ULA|ula31|Overflow_exists|overflow~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|Overflow_exists|overflow~0_combout\ = (!\entradaA[31]~input_o\ & ((!\ULA|ula31|mux_ula|saida_MUX~1_combout\) # (\entradaB[31]~input_o\))) # (\entradaA[31]~input_o\ & ((!\entradaB[31]~input_o\) # (\ULA|ula31|mux_ula|saida_MUX~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110011111100111111001111110011111100111111001111110011111100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entradaA[31]~input_o\,
	datab => \ALT_INV_entradaB[31]~input_o\,
	datac => \ULA|ula31|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula31|Overflow_exists|overflow~0_combout\);

ww_ULA_saida(0) <= \ULA_saida[0]~output_o\;

ww_ULA_saida(1) <= \ULA_saida[1]~output_o\;

ww_ULA_saida(2) <= \ULA_saida[2]~output_o\;

ww_ULA_saida(3) <= \ULA_saida[3]~output_o\;

ww_ULA_saida(4) <= \ULA_saida[4]~output_o\;

ww_ULA_saida(5) <= \ULA_saida[5]~output_o\;

ww_ULA_saida(6) <= \ULA_saida[6]~output_o\;

ww_ULA_saida(7) <= \ULA_saida[7]~output_o\;

ww_ULA_saida(8) <= \ULA_saida[8]~output_o\;

ww_ULA_saida(9) <= \ULA_saida[9]~output_o\;

ww_ULA_saida(10) <= \ULA_saida[10]~output_o\;

ww_ULA_saida(11) <= \ULA_saida[11]~output_o\;

ww_ULA_saida(12) <= \ULA_saida[12]~output_o\;

ww_ULA_saida(13) <= \ULA_saida[13]~output_o\;

ww_ULA_saida(14) <= \ULA_saida[14]~output_o\;

ww_ULA_saida(15) <= \ULA_saida[15]~output_o\;

ww_ULA_saida(16) <= \ULA_saida[16]~output_o\;

ww_ULA_saida(17) <= \ULA_saida[17]~output_o\;

ww_ULA_saida(18) <= \ULA_saida[18]~output_o\;

ww_ULA_saida(19) <= \ULA_saida[19]~output_o\;

ww_ULA_saida(20) <= \ULA_saida[20]~output_o\;

ww_ULA_saida(21) <= \ULA_saida[21]~output_o\;

ww_ULA_saida(22) <= \ULA_saida[22]~output_o\;

ww_ULA_saida(23) <= \ULA_saida[23]~output_o\;

ww_ULA_saida(24) <= \ULA_saida[24]~output_o\;

ww_ULA_saida(25) <= \ULA_saida[25]~output_o\;

ww_ULA_saida(26) <= \ULA_saida[26]~output_o\;

ww_ULA_saida(27) <= \ULA_saida[27]~output_o\;

ww_ULA_saida(28) <= \ULA_saida[28]~output_o\;

ww_ULA_saida(29) <= \ULA_saida[29]~output_o\;

ww_ULA_saida(30) <= \ULA_saida[30]~output_o\;

ww_ULA_saida(31) <= \ULA_saida[31]~output_o\;

ww_overflow <= \overflow~output_o\;
END structure;


