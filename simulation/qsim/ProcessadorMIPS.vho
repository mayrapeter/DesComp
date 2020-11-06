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

-- DATE "10/30/2020 15:03:38"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ProcessadorMIPS IS
    PORT (
	clk : IN std_logic;
	ULA_saida : OUT std_logic_vector(31 DOWNTO 0)
	);
END ProcessadorMIPS;

ARCHITECTURE structure OF ProcessadorMIPS IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_ULA_saida : std_logic_vector(31 DOWNTO 0);
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
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \PC_entity|DOUT[2]~0_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~1_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~2\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~5_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~6\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~9_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~10\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~17_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~18\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~13_sumout\ : std_logic;
SIGNAL \ROM|memROM~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~38_q\ : std_logic;
SIGNAL \bancoRegs|registrador~294_q\ : std_logic;
SIGNAL \ULA|Add0~1_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|registrador~295_q\ : std_logic;
SIGNAL \ULA|Add0~2\ : std_logic;
SIGNAL \ULA|Add0~5_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|registrador~296_q\ : std_logic;
SIGNAL \ULA|Add0~6\ : std_logic;
SIGNAL \ULA|Add0~9_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|registrador~297_q\ : std_logic;
SIGNAL \ULA|Add0~10\ : std_logic;
SIGNAL \ULA|Add0~13_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|registrador~298_q\ : std_logic;
SIGNAL \ULA|Add0~14\ : std_logic;
SIGNAL \ULA|Add0~17_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|registrador~299_q\ : std_logic;
SIGNAL \ULA|Add0~18\ : std_logic;
SIGNAL \ULA|Add0~21_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|registrador~300_q\ : std_logic;
SIGNAL \ULA|Add0~22\ : std_logic;
SIGNAL \ULA|Add0~25_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~45_q\ : std_logic;
SIGNAL \bancoRegs|registrador~301_q\ : std_logic;
SIGNAL \ULA|Add0~26\ : std_logic;
SIGNAL \ULA|Add0~29_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|registrador~302_q\ : std_logic;
SIGNAL \ULA|Add0~30\ : std_logic;
SIGNAL \ULA|Add0~33_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|registrador~303_q\ : std_logic;
SIGNAL \ULA|Add0~34\ : std_logic;
SIGNAL \ULA|Add0~37_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|registrador~304_q\ : std_logic;
SIGNAL \ULA|Add0~38\ : std_logic;
SIGNAL \ULA|Add0~41_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|registrador~305_q\ : std_logic;
SIGNAL \ULA|Add0~42\ : std_logic;
SIGNAL \ULA|Add0~45_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|registrador~306_q\ : std_logic;
SIGNAL \ULA|Add0~46\ : std_logic;
SIGNAL \ULA|Add0~49_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|registrador~307_q\ : std_logic;
SIGNAL \ULA|Add0~50\ : std_logic;
SIGNAL \ULA|Add0~53_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|registrador~308_q\ : std_logic;
SIGNAL \ULA|Add0~54\ : std_logic;
SIGNAL \ULA|Add0~57_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|registrador~309_q\ : std_logic;
SIGNAL \ULA|Add0~58\ : std_logic;
SIGNAL \ULA|Add0~61_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|registrador~310_q\ : std_logic;
SIGNAL \ULA|Add0~62\ : std_logic;
SIGNAL \ULA|Add0~65_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|registrador~311_q\ : std_logic;
SIGNAL \ULA|Add0~66\ : std_logic;
SIGNAL \ULA|Add0~69_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|registrador~312_q\ : std_logic;
SIGNAL \ULA|Add0~70\ : std_logic;
SIGNAL \ULA|Add0~73_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|registrador~313_q\ : std_logic;
SIGNAL \ULA|Add0~74\ : std_logic;
SIGNAL \ULA|Add0~77_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|registrador~314_q\ : std_logic;
SIGNAL \ULA|Add0~78\ : std_logic;
SIGNAL \ULA|Add0~81_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|registrador~315_q\ : std_logic;
SIGNAL \ULA|Add0~82\ : std_logic;
SIGNAL \ULA|Add0~85_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|registrador~316_q\ : std_logic;
SIGNAL \ULA|Add0~86\ : std_logic;
SIGNAL \ULA|Add0~89_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|registrador~317_q\ : std_logic;
SIGNAL \ULA|Add0~90\ : std_logic;
SIGNAL \ULA|Add0~93_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|registrador~318_q\ : std_logic;
SIGNAL \ULA|Add0~94\ : std_logic;
SIGNAL \ULA|Add0~97_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|registrador~319_q\ : std_logic;
SIGNAL \ULA|Add0~98\ : std_logic;
SIGNAL \ULA|Add0~101_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|registrador~320_q\ : std_logic;
SIGNAL \ULA|Add0~102\ : std_logic;
SIGNAL \ULA|Add0~105_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|registrador~321_q\ : std_logic;
SIGNAL \ULA|Add0~106\ : std_logic;
SIGNAL \ULA|Add0~109_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|registrador~322_q\ : std_logic;
SIGNAL \ULA|Add0~110\ : std_logic;
SIGNAL \ULA|Add0~113_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|registrador~323_q\ : std_logic;
SIGNAL \ULA|Add0~114\ : std_logic;
SIGNAL \ULA|Add0~117_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|registrador~324_q\ : std_logic;
SIGNAL \ULA|Add0~118\ : std_logic;
SIGNAL \ULA|Add0~121_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|registrador~325_q\ : std_logic;
SIGNAL \ULA|Add0~122\ : std_logic;
SIGNAL \ULA|Add0~125_sumout\ : std_logic;
SIGNAL \PC_entity|DOUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PC_entity|ALT_INV_DOUT\ : std_logic_vector(7 DOWNTO 2);
SIGNAL \ROM|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~301_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~45_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~300_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~295_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~294_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~38_q\ : std_logic;

BEGIN

ww_clk <= clk;
ULA_saida <= ww_ULA_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\PC_entity|ALT_INV_DOUT\(2) <= NOT \PC_entity|DOUT\(2);
\ROM|ALT_INV_memROM~0_combout\ <= NOT \ROM|memROM~0_combout\;
\PC_entity|ALT_INV_DOUT\(6) <= NOT \PC_entity|DOUT\(6);
\PC_entity|ALT_INV_DOUT\(7) <= NOT \PC_entity|DOUT\(7);
\PC_entity|ALT_INV_DOUT\(5) <= NOT \PC_entity|DOUT\(5);
\PC_entity|ALT_INV_DOUT\(4) <= NOT \PC_entity|DOUT\(4);
\PC_entity|ALT_INV_DOUT\(3) <= NOT \PC_entity|DOUT\(3);
\bancoRegs|ALT_INV_registrador~325_q\ <= NOT \bancoRegs|registrador~325_q\;
\bancoRegs|ALT_INV_registrador~69_q\ <= NOT \bancoRegs|registrador~69_q\;
\bancoRegs|ALT_INV_registrador~324_q\ <= NOT \bancoRegs|registrador~324_q\;
\bancoRegs|ALT_INV_registrador~68_q\ <= NOT \bancoRegs|registrador~68_q\;
\bancoRegs|ALT_INV_registrador~323_q\ <= NOT \bancoRegs|registrador~323_q\;
\bancoRegs|ALT_INV_registrador~67_q\ <= NOT \bancoRegs|registrador~67_q\;
\bancoRegs|ALT_INV_registrador~322_q\ <= NOT \bancoRegs|registrador~322_q\;
\bancoRegs|ALT_INV_registrador~66_q\ <= NOT \bancoRegs|registrador~66_q\;
\bancoRegs|ALT_INV_registrador~321_q\ <= NOT \bancoRegs|registrador~321_q\;
\bancoRegs|ALT_INV_registrador~65_q\ <= NOT \bancoRegs|registrador~65_q\;
\bancoRegs|ALT_INV_registrador~320_q\ <= NOT \bancoRegs|registrador~320_q\;
\bancoRegs|ALT_INV_registrador~64_q\ <= NOT \bancoRegs|registrador~64_q\;
\bancoRegs|ALT_INV_registrador~319_q\ <= NOT \bancoRegs|registrador~319_q\;
\bancoRegs|ALT_INV_registrador~63_q\ <= NOT \bancoRegs|registrador~63_q\;
\bancoRegs|ALT_INV_registrador~318_q\ <= NOT \bancoRegs|registrador~318_q\;
\bancoRegs|ALT_INV_registrador~62_q\ <= NOT \bancoRegs|registrador~62_q\;
\bancoRegs|ALT_INV_registrador~317_q\ <= NOT \bancoRegs|registrador~317_q\;
\bancoRegs|ALT_INV_registrador~61_q\ <= NOT \bancoRegs|registrador~61_q\;
\bancoRegs|ALT_INV_registrador~316_q\ <= NOT \bancoRegs|registrador~316_q\;
\bancoRegs|ALT_INV_registrador~60_q\ <= NOT \bancoRegs|registrador~60_q\;
\bancoRegs|ALT_INV_registrador~315_q\ <= NOT \bancoRegs|registrador~315_q\;
\bancoRegs|ALT_INV_registrador~59_q\ <= NOT \bancoRegs|registrador~59_q\;
\bancoRegs|ALT_INV_registrador~314_q\ <= NOT \bancoRegs|registrador~314_q\;
\bancoRegs|ALT_INV_registrador~58_q\ <= NOT \bancoRegs|registrador~58_q\;
\bancoRegs|ALT_INV_registrador~313_q\ <= NOT \bancoRegs|registrador~313_q\;
\bancoRegs|ALT_INV_registrador~57_q\ <= NOT \bancoRegs|registrador~57_q\;
\bancoRegs|ALT_INV_registrador~312_q\ <= NOT \bancoRegs|registrador~312_q\;
\bancoRegs|ALT_INV_registrador~56_q\ <= NOT \bancoRegs|registrador~56_q\;
\bancoRegs|ALT_INV_registrador~311_q\ <= NOT \bancoRegs|registrador~311_q\;
\bancoRegs|ALT_INV_registrador~55_q\ <= NOT \bancoRegs|registrador~55_q\;
\bancoRegs|ALT_INV_registrador~310_q\ <= NOT \bancoRegs|registrador~310_q\;
\bancoRegs|ALT_INV_registrador~54_q\ <= NOT \bancoRegs|registrador~54_q\;
\bancoRegs|ALT_INV_registrador~309_q\ <= NOT \bancoRegs|registrador~309_q\;
\bancoRegs|ALT_INV_registrador~53_q\ <= NOT \bancoRegs|registrador~53_q\;
\bancoRegs|ALT_INV_registrador~308_q\ <= NOT \bancoRegs|registrador~308_q\;
\bancoRegs|ALT_INV_registrador~52_q\ <= NOT \bancoRegs|registrador~52_q\;
\bancoRegs|ALT_INV_registrador~307_q\ <= NOT \bancoRegs|registrador~307_q\;
\bancoRegs|ALT_INV_registrador~51_q\ <= NOT \bancoRegs|registrador~51_q\;
\bancoRegs|ALT_INV_registrador~306_q\ <= NOT \bancoRegs|registrador~306_q\;
\bancoRegs|ALT_INV_registrador~50_q\ <= NOT \bancoRegs|registrador~50_q\;
\bancoRegs|ALT_INV_registrador~305_q\ <= NOT \bancoRegs|registrador~305_q\;
\bancoRegs|ALT_INV_registrador~49_q\ <= NOT \bancoRegs|registrador~49_q\;
\bancoRegs|ALT_INV_registrador~304_q\ <= NOT \bancoRegs|registrador~304_q\;
\bancoRegs|ALT_INV_registrador~48_q\ <= NOT \bancoRegs|registrador~48_q\;
\bancoRegs|ALT_INV_registrador~303_q\ <= NOT \bancoRegs|registrador~303_q\;
\bancoRegs|ALT_INV_registrador~47_q\ <= NOT \bancoRegs|registrador~47_q\;
\bancoRegs|ALT_INV_registrador~302_q\ <= NOT \bancoRegs|registrador~302_q\;
\bancoRegs|ALT_INV_registrador~46_q\ <= NOT \bancoRegs|registrador~46_q\;
\bancoRegs|ALT_INV_registrador~301_q\ <= NOT \bancoRegs|registrador~301_q\;
\bancoRegs|ALT_INV_registrador~45_q\ <= NOT \bancoRegs|registrador~45_q\;
\bancoRegs|ALT_INV_registrador~300_q\ <= NOT \bancoRegs|registrador~300_q\;
\bancoRegs|ALT_INV_registrador~44_q\ <= NOT \bancoRegs|registrador~44_q\;
\bancoRegs|ALT_INV_registrador~299_q\ <= NOT \bancoRegs|registrador~299_q\;
\bancoRegs|ALT_INV_registrador~43_q\ <= NOT \bancoRegs|registrador~43_q\;
\bancoRegs|ALT_INV_registrador~298_q\ <= NOT \bancoRegs|registrador~298_q\;
\bancoRegs|ALT_INV_registrador~42_q\ <= NOT \bancoRegs|registrador~42_q\;
\bancoRegs|ALT_INV_registrador~297_q\ <= NOT \bancoRegs|registrador~297_q\;
\bancoRegs|ALT_INV_registrador~41_q\ <= NOT \bancoRegs|registrador~41_q\;
\bancoRegs|ALT_INV_registrador~296_q\ <= NOT \bancoRegs|registrador~296_q\;
\bancoRegs|ALT_INV_registrador~40_q\ <= NOT \bancoRegs|registrador~40_q\;
\bancoRegs|ALT_INV_registrador~295_q\ <= NOT \bancoRegs|registrador~295_q\;
\bancoRegs|ALT_INV_registrador~39_q\ <= NOT \bancoRegs|registrador~39_q\;
\bancoRegs|ALT_INV_registrador~294_q\ <= NOT \bancoRegs|registrador~294_q\;
\bancoRegs|ALT_INV_registrador~38_q\ <= NOT \bancoRegs|registrador~38_q\;

\ULA_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|Add0~1_sumout\,
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
	i => \ULA|Add0~5_sumout\,
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
	i => \ULA|Add0~9_sumout\,
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
	i => \ULA|Add0~13_sumout\,
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
	i => \ULA|Add0~17_sumout\,
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
	i => \ULA|Add0~21_sumout\,
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
	i => \ULA|Add0~25_sumout\,
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
	i => \ULA|Add0~29_sumout\,
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
	i => \ULA|Add0~33_sumout\,
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
	i => \ULA|Add0~37_sumout\,
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
	i => \ULA|Add0~41_sumout\,
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
	i => \ULA|Add0~45_sumout\,
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
	i => \ULA|Add0~49_sumout\,
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
	i => \ULA|Add0~53_sumout\,
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
	i => \ULA|Add0~57_sumout\,
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
	i => \ULA|Add0~61_sumout\,
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
	i => \ULA|Add0~65_sumout\,
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
	i => \ULA|Add0~69_sumout\,
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
	i => \ULA|Add0~73_sumout\,
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
	i => \ULA|Add0~77_sumout\,
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
	i => \ULA|Add0~81_sumout\,
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
	i => \ULA|Add0~85_sumout\,
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
	i => \ULA|Add0~89_sumout\,
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
	i => \ULA|Add0~93_sumout\,
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
	i => \ULA|Add0~97_sumout\,
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
	i => \ULA|Add0~101_sumout\,
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
	i => \ULA|Add0~105_sumout\,
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
	i => \ULA|Add0~109_sumout\,
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
	i => \ULA|Add0~113_sumout\,
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
	i => \ULA|Add0~117_sumout\,
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
	i => \ULA|Add0~121_sumout\,
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
	i => \ULA|Add0~125_sumout\,
	devoe => ww_devoe,
	o => \ULA_saida[31]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\PC_entity|DOUT[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_entity|DOUT[2]~0_combout\ = !\PC_entity|DOUT\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	combout => \PC_entity|DOUT[2]~0_combout\);

\PC_entity|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_entity|DOUT[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(2));

\PC_Soma_Constante|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~1_sumout\ = SUM(( \PC_entity|DOUT\(2) ) + ( \PC_entity|DOUT\(3) ) + ( !VCC ))
-- \PC_Soma_Constante|Add0~2\ = CARRY(( \PC_entity|DOUT\(2) ) + ( \PC_entity|DOUT\(3) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(2),
	dataf => \PC_entity|ALT_INV_DOUT\(3),
	cin => GND,
	sumout => \PC_Soma_Constante|Add0~1_sumout\,
	cout => \PC_Soma_Constante|Add0~2\);

\PC_entity|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(3));

\PC_Soma_Constante|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~5_sumout\ = SUM(( \PC_entity|DOUT\(4) ) + ( GND ) + ( \PC_Soma_Constante|Add0~2\ ))
-- \PC_Soma_Constante|Add0~6\ = CARRY(( \PC_entity|DOUT\(4) ) + ( GND ) + ( \PC_Soma_Constante|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(4),
	cin => \PC_Soma_Constante|Add0~2\,
	sumout => \PC_Soma_Constante|Add0~5_sumout\,
	cout => \PC_Soma_Constante|Add0~6\);

\PC_entity|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(4));

\PC_Soma_Constante|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~9_sumout\ = SUM(( \PC_entity|DOUT\(5) ) + ( GND ) + ( \PC_Soma_Constante|Add0~6\ ))
-- \PC_Soma_Constante|Add0~10\ = CARRY(( \PC_entity|DOUT\(5) ) + ( GND ) + ( \PC_Soma_Constante|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(5),
	cin => \PC_Soma_Constante|Add0~6\,
	sumout => \PC_Soma_Constante|Add0~9_sumout\,
	cout => \PC_Soma_Constante|Add0~10\);

\PC_entity|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(5));

\PC_Soma_Constante|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~17_sumout\ = SUM(( \PC_entity|DOUT\(6) ) + ( GND ) + ( \PC_Soma_Constante|Add0~10\ ))
-- \PC_Soma_Constante|Add0~18\ = CARRY(( \PC_entity|DOUT\(6) ) + ( GND ) + ( \PC_Soma_Constante|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(6),
	cin => \PC_Soma_Constante|Add0~10\,
	sumout => \PC_Soma_Constante|Add0~17_sumout\,
	cout => \PC_Soma_Constante|Add0~18\);

\PC_entity|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(6));

\PC_Soma_Constante|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~13_sumout\ = SUM(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(7),
	cin => \PC_Soma_Constante|Add0~18\,
	sumout => \PC_Soma_Constante|Add0~13_sumout\);

\PC_entity|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(7));

\ROM|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~0_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & !\PC_entity|DOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(3),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(7),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~0_combout\);

\bancoRegs|registrador~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~38_q\,
	asdata => \ULA|Add0~1_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~38_q\);

\bancoRegs|registrador~294\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \bancoRegs|registrador~294_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~294_q\);

\ULA|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~1_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~38_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~38_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~294_q\))) ) + ( !VCC ))
-- \ULA|Add0~2\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~38_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~38_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~294_q\))) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~38_q\,
	dataf => \bancoRegs|ALT_INV_registrador~294_q\,
	cin => GND,
	sumout => \ULA|Add0~1_sumout\,
	cout => \ULA|Add0~2\);

\bancoRegs|registrador~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~39_q\,
	asdata => \ULA|Add0~5_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~39_q\);

\bancoRegs|registrador~295\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \bancoRegs|registrador~295_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~295_q\);

\ULA|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~5_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~39_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~39_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~295_q\))) ) + ( \ULA|Add0~2\ ))
-- \ULA|Add0~6\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~39_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~39_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~295_q\))) ) + ( \ULA|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~39_q\,
	dataf => \bancoRegs|ALT_INV_registrador~295_q\,
	cin => \ULA|Add0~2\,
	sumout => \ULA|Add0~5_sumout\,
	cout => \ULA|Add0~6\);

\bancoRegs|registrador~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~40_q\,
	asdata => \ULA|Add0~9_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~40_q\);

\bancoRegs|registrador~296\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \bancoRegs|registrador~296_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~296_q\);

\ULA|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~9_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~40_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~40_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~296_q\))) ) + ( \ULA|Add0~6\ ))
-- \ULA|Add0~10\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~40_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~40_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~296_q\))) ) + ( \ULA|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~40_q\,
	dataf => \bancoRegs|ALT_INV_registrador~296_q\,
	cin => \ULA|Add0~6\,
	sumout => \ULA|Add0~9_sumout\,
	cout => \ULA|Add0~10\);

\bancoRegs|registrador~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~41_q\,
	asdata => \ULA|Add0~13_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~41_q\);

\bancoRegs|registrador~297\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \bancoRegs|registrador~297_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~297_q\);

\ULA|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~13_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~41_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~41_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~297_q\))) ) + ( \ULA|Add0~10\ ))
-- \ULA|Add0~14\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~41_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~41_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~297_q\))) ) + ( \ULA|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~41_q\,
	dataf => \bancoRegs|ALT_INV_registrador~297_q\,
	cin => \ULA|Add0~10\,
	sumout => \ULA|Add0~13_sumout\,
	cout => \ULA|Add0~14\);

\bancoRegs|registrador~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~42_q\,
	asdata => \ULA|Add0~17_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~42_q\);

\bancoRegs|registrador~298\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \bancoRegs|registrador~298_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~298_q\);

\ULA|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~17_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~42_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~42_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~298_q\))) ) + ( \ULA|Add0~14\ ))
-- \ULA|Add0~18\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~42_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~42_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~298_q\))) ) + ( \ULA|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~42_q\,
	dataf => \bancoRegs|ALT_INV_registrador~298_q\,
	cin => \ULA|Add0~14\,
	sumout => \ULA|Add0~17_sumout\,
	cout => \ULA|Add0~18\);

\bancoRegs|registrador~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~43_q\,
	asdata => \ULA|Add0~21_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~43_q\);

\bancoRegs|registrador~299\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \bancoRegs|registrador~299_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~299_q\);

\ULA|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~21_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~43_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~43_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~299_q\))) ) + ( \ULA|Add0~18\ ))
-- \ULA|Add0~22\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~43_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~43_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~299_q\))) ) + ( \ULA|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~43_q\,
	dataf => \bancoRegs|ALT_INV_registrador~299_q\,
	cin => \ULA|Add0~18\,
	sumout => \ULA|Add0~21_sumout\,
	cout => \ULA|Add0~22\);

\bancoRegs|registrador~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~44_q\,
	asdata => \ULA|Add0~25_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~44_q\);

\bancoRegs|registrador~300\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \bancoRegs|registrador~300_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~300_q\);

\ULA|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~25_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~44_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~44_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~300_q\))) ) + ( \ULA|Add0~22\ ))
-- \ULA|Add0~26\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~44_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~44_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~300_q\))) ) + ( \ULA|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~44_q\,
	dataf => \bancoRegs|ALT_INV_registrador~300_q\,
	cin => \ULA|Add0~22\,
	sumout => \ULA|Add0~25_sumout\,
	cout => \ULA|Add0~26\);

\bancoRegs|registrador~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~45_q\,
	asdata => \ULA|Add0~29_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~45_q\);

\bancoRegs|registrador~301\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \bancoRegs|registrador~301_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~301_q\);

\ULA|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~29_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~45_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~45_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~301_q\))) ) + ( \ULA|Add0~26\ ))
-- \ULA|Add0~30\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~45_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~45_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~301_q\))) ) + ( \ULA|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~45_q\,
	dataf => \bancoRegs|ALT_INV_registrador~301_q\,
	cin => \ULA|Add0~26\,
	sumout => \ULA|Add0~29_sumout\,
	cout => \ULA|Add0~30\);

\bancoRegs|registrador~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~46_q\,
	asdata => \ULA|Add0~33_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~46_q\);

\bancoRegs|registrador~302\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \bancoRegs|registrador~302_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~302_q\);

\ULA|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~33_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~46_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~46_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~302_q\))) ) + ( \ULA|Add0~30\ ))
-- \ULA|Add0~34\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~46_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~46_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~302_q\))) ) + ( \ULA|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~46_q\,
	dataf => \bancoRegs|ALT_INV_registrador~302_q\,
	cin => \ULA|Add0~30\,
	sumout => \ULA|Add0~33_sumout\,
	cout => \ULA|Add0~34\);

\bancoRegs|registrador~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~47_q\,
	asdata => \ULA|Add0~37_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~47_q\);

\bancoRegs|registrador~303\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \bancoRegs|registrador~303_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~303_q\);

\ULA|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~37_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~47_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~47_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~303_q\))) ) + ( \ULA|Add0~34\ ))
-- \ULA|Add0~38\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~47_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~47_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~303_q\))) ) + ( \ULA|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~47_q\,
	dataf => \bancoRegs|ALT_INV_registrador~303_q\,
	cin => \ULA|Add0~34\,
	sumout => \ULA|Add0~37_sumout\,
	cout => \ULA|Add0~38\);

\bancoRegs|registrador~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~48_q\,
	asdata => \ULA|Add0~41_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~48_q\);

\bancoRegs|registrador~304\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \bancoRegs|registrador~304_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~304_q\);

\ULA|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~41_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~48_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~48_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~304_q\))) ) + ( \ULA|Add0~38\ ))
-- \ULA|Add0~42\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~48_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~48_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~304_q\))) ) + ( \ULA|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~48_q\,
	dataf => \bancoRegs|ALT_INV_registrador~304_q\,
	cin => \ULA|Add0~38\,
	sumout => \ULA|Add0~41_sumout\,
	cout => \ULA|Add0~42\);

\bancoRegs|registrador~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~49_q\,
	asdata => \ULA|Add0~45_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~49_q\);

\bancoRegs|registrador~305\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \bancoRegs|registrador~305_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~305_q\);

\ULA|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~45_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~49_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~49_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~305_q\))) ) + ( \ULA|Add0~42\ ))
-- \ULA|Add0~46\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~49_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~49_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~305_q\))) ) + ( \ULA|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~49_q\,
	dataf => \bancoRegs|ALT_INV_registrador~305_q\,
	cin => \ULA|Add0~42\,
	sumout => \ULA|Add0~45_sumout\,
	cout => \ULA|Add0~46\);

\bancoRegs|registrador~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~50_q\,
	asdata => \ULA|Add0~49_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~50_q\);

\bancoRegs|registrador~306\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \bancoRegs|registrador~306_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~306_q\);

\ULA|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~49_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~50_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~50_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~306_q\))) ) + ( \ULA|Add0~46\ ))
-- \ULA|Add0~50\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~50_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~50_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~306_q\))) ) + ( \ULA|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~50_q\,
	dataf => \bancoRegs|ALT_INV_registrador~306_q\,
	cin => \ULA|Add0~46\,
	sumout => \ULA|Add0~49_sumout\,
	cout => \ULA|Add0~50\);

\bancoRegs|registrador~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~51_q\,
	asdata => \ULA|Add0~53_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~51_q\);

\bancoRegs|registrador~307\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \bancoRegs|registrador~307_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~307_q\);

\ULA|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~53_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~51_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~51_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~307_q\))) ) + ( \ULA|Add0~50\ ))
-- \ULA|Add0~54\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~51_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~51_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~307_q\))) ) + ( \ULA|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~51_q\,
	dataf => \bancoRegs|ALT_INV_registrador~307_q\,
	cin => \ULA|Add0~50\,
	sumout => \ULA|Add0~53_sumout\,
	cout => \ULA|Add0~54\);

\bancoRegs|registrador~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~52_q\,
	asdata => \ULA|Add0~57_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~52_q\);

\bancoRegs|registrador~308\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \bancoRegs|registrador~308_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~308_q\);

\ULA|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~57_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~52_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~52_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~308_q\))) ) + ( \ULA|Add0~54\ ))
-- \ULA|Add0~58\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~52_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~52_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~308_q\))) ) + ( \ULA|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~52_q\,
	dataf => \bancoRegs|ALT_INV_registrador~308_q\,
	cin => \ULA|Add0~54\,
	sumout => \ULA|Add0~57_sumout\,
	cout => \ULA|Add0~58\);

\bancoRegs|registrador~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~53_q\,
	asdata => \ULA|Add0~61_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~53_q\);

\bancoRegs|registrador~309\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \bancoRegs|registrador~309_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~309_q\);

\ULA|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~61_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~53_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~53_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~309_q\))) ) + ( \ULA|Add0~58\ ))
-- \ULA|Add0~62\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~53_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~53_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~309_q\))) ) + ( \ULA|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~53_q\,
	dataf => \bancoRegs|ALT_INV_registrador~309_q\,
	cin => \ULA|Add0~58\,
	sumout => \ULA|Add0~61_sumout\,
	cout => \ULA|Add0~62\);

\bancoRegs|registrador~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~54_q\,
	asdata => \ULA|Add0~65_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~54_q\);

\bancoRegs|registrador~310\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \bancoRegs|registrador~310_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~310_q\);

\ULA|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~65_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~54_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~54_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~310_q\))) ) + ( \ULA|Add0~62\ ))
-- \ULA|Add0~66\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~54_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~54_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~310_q\))) ) + ( \ULA|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~54_q\,
	dataf => \bancoRegs|ALT_INV_registrador~310_q\,
	cin => \ULA|Add0~62\,
	sumout => \ULA|Add0~65_sumout\,
	cout => \ULA|Add0~66\);

\bancoRegs|registrador~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~55_q\,
	asdata => \ULA|Add0~69_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~55_q\);

\bancoRegs|registrador~311\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \bancoRegs|registrador~311_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~311_q\);

\ULA|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~69_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~55_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~55_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~311_q\))) ) + ( \ULA|Add0~66\ ))
-- \ULA|Add0~70\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~55_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~55_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~311_q\))) ) + ( \ULA|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~55_q\,
	dataf => \bancoRegs|ALT_INV_registrador~311_q\,
	cin => \ULA|Add0~66\,
	sumout => \ULA|Add0~69_sumout\,
	cout => \ULA|Add0~70\);

\bancoRegs|registrador~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~56_q\,
	asdata => \ULA|Add0~73_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~56_q\);

\bancoRegs|registrador~312\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \bancoRegs|registrador~312_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~312_q\);

\ULA|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~73_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~56_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~56_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~312_q\))) ) + ( \ULA|Add0~70\ ))
-- \ULA|Add0~74\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~56_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~56_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~312_q\))) ) + ( \ULA|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~56_q\,
	dataf => \bancoRegs|ALT_INV_registrador~312_q\,
	cin => \ULA|Add0~70\,
	sumout => \ULA|Add0~73_sumout\,
	cout => \ULA|Add0~74\);

\bancoRegs|registrador~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~57_q\,
	asdata => \ULA|Add0~77_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~57_q\);

\bancoRegs|registrador~313\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \bancoRegs|registrador~313_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~313_q\);

\ULA|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~77_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~57_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~57_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~313_q\))) ) + ( \ULA|Add0~74\ ))
-- \ULA|Add0~78\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~57_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~57_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~313_q\))) ) + ( \ULA|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~57_q\,
	dataf => \bancoRegs|ALT_INV_registrador~313_q\,
	cin => \ULA|Add0~74\,
	sumout => \ULA|Add0~77_sumout\,
	cout => \ULA|Add0~78\);

\bancoRegs|registrador~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~58_q\,
	asdata => \ULA|Add0~81_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~58_q\);

\bancoRegs|registrador~314\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \bancoRegs|registrador~314_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~314_q\);

\ULA|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~81_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~58_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~58_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~314_q\))) ) + ( \ULA|Add0~78\ ))
-- \ULA|Add0~82\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~58_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~58_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~314_q\))) ) + ( \ULA|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~58_q\,
	dataf => \bancoRegs|ALT_INV_registrador~314_q\,
	cin => \ULA|Add0~78\,
	sumout => \ULA|Add0~81_sumout\,
	cout => \ULA|Add0~82\);

\bancoRegs|registrador~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~59_q\,
	asdata => \ULA|Add0~85_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~59_q\);

\bancoRegs|registrador~315\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \bancoRegs|registrador~315_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~315_q\);

\ULA|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~85_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~59_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~59_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~315_q\))) ) + ( \ULA|Add0~82\ ))
-- \ULA|Add0~86\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~59_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~59_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~315_q\))) ) + ( \ULA|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~59_q\,
	dataf => \bancoRegs|ALT_INV_registrador~315_q\,
	cin => \ULA|Add0~82\,
	sumout => \ULA|Add0~85_sumout\,
	cout => \ULA|Add0~86\);

\bancoRegs|registrador~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~60_q\,
	asdata => \ULA|Add0~89_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~60_q\);

\bancoRegs|registrador~316\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \bancoRegs|registrador~316_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~316_q\);

\ULA|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~89_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~60_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~60_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~316_q\))) ) + ( \ULA|Add0~86\ ))
-- \ULA|Add0~90\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~60_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~60_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~316_q\))) ) + ( \ULA|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~60_q\,
	dataf => \bancoRegs|ALT_INV_registrador~316_q\,
	cin => \ULA|Add0~86\,
	sumout => \ULA|Add0~89_sumout\,
	cout => \ULA|Add0~90\);

\bancoRegs|registrador~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~61_q\,
	asdata => \ULA|Add0~93_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~61_q\);

\bancoRegs|registrador~317\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \bancoRegs|registrador~317_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~317_q\);

\ULA|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~93_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~61_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~61_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~317_q\))) ) + ( \ULA|Add0~90\ ))
-- \ULA|Add0~94\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~61_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~61_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~317_q\))) ) + ( \ULA|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~61_q\,
	dataf => \bancoRegs|ALT_INV_registrador~317_q\,
	cin => \ULA|Add0~90\,
	sumout => \ULA|Add0~93_sumout\,
	cout => \ULA|Add0~94\);

\bancoRegs|registrador~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~62_q\,
	asdata => \ULA|Add0~97_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~62_q\);

\bancoRegs|registrador~318\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \bancoRegs|registrador~318_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~318_q\);

\ULA|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~97_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~62_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~62_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~318_q\))) ) + ( \ULA|Add0~94\ ))
-- \ULA|Add0~98\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~62_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~62_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~318_q\))) ) + ( \ULA|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~62_q\,
	dataf => \bancoRegs|ALT_INV_registrador~318_q\,
	cin => \ULA|Add0~94\,
	sumout => \ULA|Add0~97_sumout\,
	cout => \ULA|Add0~98\);

\bancoRegs|registrador~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~63_q\,
	asdata => \ULA|Add0~101_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~63_q\);

\bancoRegs|registrador~319\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \bancoRegs|registrador~319_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~319_q\);

\ULA|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~101_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~63_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~63_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~319_q\))) ) + ( \ULA|Add0~98\ ))
-- \ULA|Add0~102\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~63_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~63_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~319_q\))) ) + ( \ULA|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~63_q\,
	dataf => \bancoRegs|ALT_INV_registrador~319_q\,
	cin => \ULA|Add0~98\,
	sumout => \ULA|Add0~101_sumout\,
	cout => \ULA|Add0~102\);

\bancoRegs|registrador~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~64_q\,
	asdata => \ULA|Add0~105_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~64_q\);

\bancoRegs|registrador~320\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \bancoRegs|registrador~320_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~320_q\);

\ULA|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~105_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~64_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~64_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~320_q\))) ) + ( \ULA|Add0~102\ ))
-- \ULA|Add0~106\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~64_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~64_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~320_q\))) ) + ( \ULA|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~64_q\,
	dataf => \bancoRegs|ALT_INV_registrador~320_q\,
	cin => \ULA|Add0~102\,
	sumout => \ULA|Add0~105_sumout\,
	cout => \ULA|Add0~106\);

\bancoRegs|registrador~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~65_q\,
	asdata => \ULA|Add0~109_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~65_q\);

\bancoRegs|registrador~321\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \bancoRegs|registrador~321_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~321_q\);

\ULA|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~109_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~65_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~65_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~321_q\))) ) + ( \ULA|Add0~106\ ))
-- \ULA|Add0~110\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~65_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~65_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~321_q\))) ) + ( \ULA|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~65_q\,
	dataf => \bancoRegs|ALT_INV_registrador~321_q\,
	cin => \ULA|Add0~106\,
	sumout => \ULA|Add0~109_sumout\,
	cout => \ULA|Add0~110\);

\bancoRegs|registrador~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~66_q\,
	asdata => \ULA|Add0~113_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~66_q\);

\bancoRegs|registrador~322\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \bancoRegs|registrador~322_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~322_q\);

\ULA|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~113_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~66_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~66_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~322_q\))) ) + ( \ULA|Add0~110\ ))
-- \ULA|Add0~114\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~66_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~66_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~322_q\))) ) + ( \ULA|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~66_q\,
	dataf => \bancoRegs|ALT_INV_registrador~322_q\,
	cin => \ULA|Add0~110\,
	sumout => \ULA|Add0~113_sumout\,
	cout => \ULA|Add0~114\);

\bancoRegs|registrador~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~67_q\,
	asdata => \ULA|Add0~117_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~67_q\);

\bancoRegs|registrador~323\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \bancoRegs|registrador~323_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~323_q\);

\ULA|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~117_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~67_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~67_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~323_q\))) ) + ( \ULA|Add0~114\ ))
-- \ULA|Add0~118\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~67_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~67_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~323_q\))) ) + ( \ULA|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~67_q\,
	dataf => \bancoRegs|ALT_INV_registrador~323_q\,
	cin => \ULA|Add0~114\,
	sumout => \ULA|Add0~117_sumout\,
	cout => \ULA|Add0~118\);

\bancoRegs|registrador~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~68_q\,
	asdata => \ULA|Add0~121_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~68_q\);

\bancoRegs|registrador~324\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \bancoRegs|registrador~324_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~324_q\);

\ULA|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~121_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~68_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~68_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~324_q\))) ) + ( \ULA|Add0~118\ ))
-- \ULA|Add0~122\ = CARRY(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~68_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~68_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~324_q\))) ) + ( \ULA|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~68_q\,
	dataf => \bancoRegs|ALT_INV_registrador~324_q\,
	cin => \ULA|Add0~118\,
	sumout => \ULA|Add0~121_sumout\,
	cout => \ULA|Add0~122\);

\bancoRegs|registrador~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \bancoRegs|registrador~69_q\,
	asdata => \ULA|Add0~125_sumout\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~69_q\);

\bancoRegs|registrador~325\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \bancoRegs|registrador~325_q\,
	sload => \ROM|ALT_INV_memROM~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~325_q\);

\ULA|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~125_sumout\ = SUM(( (!\ROM|memROM~0_combout\ & \bancoRegs|registrador~69_q\) ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~69_q\)) # (\ROM|memROM~0_combout\ & ((\bancoRegs|registrador~325_q\))) ) + ( \ULA|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~69_q\,
	dataf => \bancoRegs|ALT_INV_registrador~325_q\,
	cin => \ULA|Add0~122\,
	sumout => \ULA|Add0~125_sumout\);

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
END structure;


