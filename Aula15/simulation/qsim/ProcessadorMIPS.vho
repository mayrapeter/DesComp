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

-- DATE "11/20/2020 11:59:47"

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
	ULA_saida : OUT std_logic_vector(31 DOWNTO 0);
	PC_saida : OUT std_logic_vector(31 DOWNTO 0);
	overflow : OUT std_logic;
	monitora_flag_z : OUT std_logic
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
SIGNAL ww_PC_saida : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_overflow : std_logic;
SIGNAL ww_monitora_flag_z : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
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
SIGNAL \PC_saida[0]~output_o\ : std_logic;
SIGNAL \PC_saida[1]~output_o\ : std_logic;
SIGNAL \PC_saida[2]~output_o\ : std_logic;
SIGNAL \PC_saida[3]~output_o\ : std_logic;
SIGNAL \PC_saida[4]~output_o\ : std_logic;
SIGNAL \PC_saida[5]~output_o\ : std_logic;
SIGNAL \PC_saida[6]~output_o\ : std_logic;
SIGNAL \PC_saida[7]~output_o\ : std_logic;
SIGNAL \PC_saida[8]~output_o\ : std_logic;
SIGNAL \PC_saida[9]~output_o\ : std_logic;
SIGNAL \PC_saida[10]~output_o\ : std_logic;
SIGNAL \PC_saida[11]~output_o\ : std_logic;
SIGNAL \PC_saida[12]~output_o\ : std_logic;
SIGNAL \PC_saida[13]~output_o\ : std_logic;
SIGNAL \PC_saida[14]~output_o\ : std_logic;
SIGNAL \PC_saida[15]~output_o\ : std_logic;
SIGNAL \PC_saida[16]~output_o\ : std_logic;
SIGNAL \PC_saida[17]~output_o\ : std_logic;
SIGNAL \PC_saida[18]~output_o\ : std_logic;
SIGNAL \PC_saida[19]~output_o\ : std_logic;
SIGNAL \PC_saida[20]~output_o\ : std_logic;
SIGNAL \PC_saida[21]~output_o\ : std_logic;
SIGNAL \PC_saida[22]~output_o\ : std_logic;
SIGNAL \PC_saida[23]~output_o\ : std_logic;
SIGNAL \PC_saida[24]~output_o\ : std_logic;
SIGNAL \PC_saida[25]~output_o\ : std_logic;
SIGNAL \PC_saida[26]~output_o\ : std_logic;
SIGNAL \PC_saida[27]~output_o\ : std_logic;
SIGNAL \PC_saida[28]~output_o\ : std_logic;
SIGNAL \PC_saida[29]~output_o\ : std_logic;
SIGNAL \PC_saida[30]~output_o\ : std_logic;
SIGNAL \PC_saida[31]~output_o\ : std_logic;
SIGNAL \overflow~output_o\ : std_logic;
SIGNAL \monitora_flag_z~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~2\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~6\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~10\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~13_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[5]~3_combout\ : std_logic;
SIGNAL \ROM|memROM~3_combout\ : std_logic;
SIGNAL \ROM|memROM~5_combout\ : std_logic;
SIGNAL \UC|Equal5~0_combout\ : std_logic;
SIGNAL \UC|Equal5~1_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~14\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~21_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[6]~5_combout\ : std_logic;
SIGNAL \ROM|memROM~1_combout\ : std_logic;
SIGNAL \ROM|memROM~10_combout\ : std_logic;
SIGNAL \ROM|memROM~15_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~9_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[4]~2_combout\ : std_logic;
SIGNAL \ROM|memROM~11_combout\ : std_logic;
SIGNAL \ROM|memROM~16_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~22\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~17_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[7]~4_combout\ : std_logic;
SIGNAL \ROM|memROM~8_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~5_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[3]~1_combout\ : std_logic;
SIGNAL \ROM|memROM~9_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~1_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[2]~0_combout\ : std_logic;
SIGNAL \ROM|memROM~0_combout\ : std_logic;
SIGNAL \ROM|memROM~2_combout\ : std_logic;
SIGNAL \ROM|memROM~4_combout\ : std_logic;
SIGNAL \UC|Equal0~0_combout\ : std_logic;
SIGNAL \ROM|memROM~6_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[2]~0_combout\ : std_logic;
SIGNAL \ROM|memROM~7_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~1_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[3]~2_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[3]~3_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~4_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[1]~5_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~8_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[0]~6_combout\ : std_logic;
SIGNAL \ULA|Equal0~0_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[3]~7_combout\ : std_logic;
SIGNAL \ROM|memROM~12_combout\ : std_logic;
SIGNAL \ROM|memROM~13_combout\ : std_logic;
SIGNAL \ROM|memROM~14_combout\ : std_logic;
SIGNAL \bancoRegs|Equal0~0_combout\ : std_logic;
SIGNAL \UC|palavraControle[4]~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|Equal0~0_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula14|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[14]~14_combout\ : std_logic;
SIGNAL \UC|sel_mux4~0_combout\ : std_logic;
SIGNAL \UC|Equal3~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaA[1]~0_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[1]~1_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[1]~21_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[3]~23_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[4]~24_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[5]~25_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[6]~26_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[7]~27_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[7]~6_combout\ : std_logic;
SIGNAL \mux_rt_rd|saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \mux_rt_rd|saida_MUX[3]~1_combout\ : std_logic;
SIGNAL \mux_rt_rd|saida_MUX[3]~2_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1318_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~301_q\ : std_logic;
SIGNAL \ROM|memROM~18_combout\ : std_logic;
SIGNAL \ROM|memROM~17_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1319_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~45_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1218_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1090_combout\ : std_logic;
SIGNAL \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|saida~combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[7]~7_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[6]~5_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~300_q\ : std_logic;
SIGNAL \bancoRegs|registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1214_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1086_combout\ : std_logic;
SIGNAL \ULA|ula6|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula6|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[6]~6_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[5]~4_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1210_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1082_combout\ : std_logic;
SIGNAL \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|saida~combout\ : std_logic;
SIGNAL \ULA|ula5|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[5]~5_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[4]~3_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1206_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1078_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|resultado_final[4]~4_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[3]~2_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1202_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1074_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[2]~22_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[2]~1_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1198_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1070_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida~combout\ : std_logic;
SIGNAL \ULA|ula3|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|resultado_final[3]~3_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[1]~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~295_q\ : std_logic;
SIGNAL \bancoRegs|registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1194_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1066_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|resultado_final[2]~2_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[14]~13_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1246_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1118_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[14]~1_combout\ : std_logic;
SIGNAL \ULA|ula14|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|resultado_final[15]~15_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[15]~14_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1250_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1122_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[15]~2_combout\ : std_logic;
SIGNAL \ULA|ula15|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula15|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[31]~22_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[31]~30_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1314_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1186_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[31]~18_combout\ : std_logic;
SIGNAL \mux_rt_imediato|saida_MUX[31]~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[0]~20_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[0]~31_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~294_q\ : std_logic;
SIGNAL \bancoRegs|registrador~38_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1190_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1062_combout\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[8]~19_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[8]~8_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[8]~7_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1222_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1094_combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula9|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[9]~9_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[9]~28_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[9]~8_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1226_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1098_combout\ : std_logic;
SIGNAL \ULA|ula9|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula10|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[10]~10_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[10]~29_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[10]~9_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1230_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1102_combout\ : std_logic;
SIGNAL \ULA|ula10|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula11|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[11]~11_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[11]~30_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[11]~10_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1234_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1106_combout\ : std_logic;
SIGNAL \ULA|ula11|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[12]~12_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[12]~31_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[12]~11_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1238_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1110_combout\ : std_logic;
SIGNAL \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[13]~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[13]~13_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[13]~12_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1242_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1114_combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula16|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[16]~55_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[16]~15_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1254_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1126_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[16]~3_combout\ : std_logic;
SIGNAL \ULA|ula16|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula16|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[17]~16_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[17]~16_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1258_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1130_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[17]~4_combout\ : std_logic;
SIGNAL \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula18|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[18]~51_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[18]~17_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1262_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1134_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[18]~5_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~4_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~3_combout\ : std_logic;
SIGNAL \ULA|resultado_final[19]~47_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[19]~18_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1266_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1138_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[19]~6_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[20]~43_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[20]~19_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1270_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1142_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[20]~7_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula21|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[21]~39_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[21]~20_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1274_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1146_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[21]~8_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[22]~35_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[22]~21_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1278_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1150_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[22]~9_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[23]~31_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[23]~22_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1282_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1154_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[23]~10_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|resultado_final[24]~17_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[24]~23_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1286_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1158_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[24]~11_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|resultado_final[25]~27_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[25]~24_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1290_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1162_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[25]~12_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula26|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[26]~23_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[26]~25_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1294_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1166_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[26]~13_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|resultado_final[27]~18_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[27]~26_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1298_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1170_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[27]~14_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[28]~19_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[28]~27_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1302_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1174_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[28]~15_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[29]~28_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1306_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1178_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[29]~16_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[30]~29_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1310_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1182_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[30]~17_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|resultado_final[0]~0_combout\ : std_logic;
SIGNAL \ULA|resultado_final[29]~20_combout\ : std_logic;
SIGNAL \ULA|resultado_final[30]~21_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~18\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~25_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[8]~6_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~26\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~29_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[9]~7_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~30\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~33_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[10]~8_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~34\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~37_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[11]~9_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~38\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~41_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[12]~10_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~42\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~45_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[13]~11_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~46\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~49_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[14]~12_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~50\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~53_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[15]~13_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~54\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~57_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[16]~14_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~58\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~61_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[17]~15_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~62\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~65_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[18]~16_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~66\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~69_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[19]~17_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~70\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~73_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[20]~18_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~74\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~77_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[21]~19_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~78\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~81_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[22]~20_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~82\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~85_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[23]~21_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~86\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~89_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[24]~22_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~90\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~93_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[25]~23_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~94\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~97_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[26]~24_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~98\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~101_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[27]~25_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~102\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~105_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~106\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~109_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~110\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~113_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~114\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~117_sumout\ : std_logic;
SIGNAL \ULA|ula31|Overflow_exists|overflow~0_combout\ : std_logic;
SIGNAL \PC_entity|DOUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \UC|palavraControle\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \bancoRegs|ALT_INV_registrador~1154_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1150_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1146_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1142_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1138_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1134_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1130_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1126_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1122_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1118_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1114_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1110_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1106_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1102_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1098_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1094_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1090_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1086_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1082_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1078_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1074_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1070_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1066_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1062_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a31~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1314_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1310_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a30~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1306_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a29~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1302_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a28~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1298_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a27~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1294_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a26~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1290_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a25~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1286_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a24~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1282_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a23~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1278_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a22~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1274_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a21~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1270_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a20~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1266_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a19~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1262_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a18~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1258_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a17~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1254_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a16~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1250_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a15~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1246_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a14~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1242_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a13~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1238_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a12~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1234_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a11~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1230_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a10~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1226_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a9~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1222_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a8~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1218_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1214_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1210_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1206_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1202_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1198_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1194_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1190_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1186_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1182_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1178_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1174_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1170_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1166_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1162_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1158_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[1]~1_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[31]~18_combout\ : std_logic;
SIGNAL \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[30]~17_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[29]~16_combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[28]~15_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[27]~14_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[26]~13_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[25]~12_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[24]~11_combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[23]~10_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[22]~9_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[21]~8_combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[20]~7_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[19]~6_combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[18]~5_combout\ : std_logic;
SIGNAL \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[17]~4_combout\ : std_logic;
SIGNAL \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[16]~3_combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[15]~2_combout\ : std_logic;
SIGNAL \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[14]~1_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[13]~0_combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~17_combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~16_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~15_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[1]~0_combout\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \UC|ALT_INV_palavraControle[4]~0_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~14_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~13_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~12_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~4_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[3]~3_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[3]~2_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~1_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~11_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~10_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~9_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[2]~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \PC_entity|ALT_INV_DOUT\ : std_logic_vector(31 DOWNTO 2);
SIGNAL \ROM|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[18]~51_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[19]~47_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[20]~43_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[21]~39_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[22]~35_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[23]~31_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[25]~27_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[26]~23_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~295_q\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~18_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~294_q\ : std_logic;
SIGNAL \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\ : std_logic;
SIGNAL \mux_rt_rd|ALT_INV_saida_MUX[3]~1_combout\ : std_logic;
SIGNAL \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_palavraControle\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \UC|ALT_INV_sel_mux4~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal5~1_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal5~0_combout\ : std_logic;
SIGNAL \ULA|ula31|Overflow_exists|ALT_INV_overflow~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[31]~22_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[28]~19_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[27]~18_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[24]~17_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|ALT_INV_saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|ALT_INV_saida_MUX~3_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[17]~16_combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula16|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[15]~15_combout\ : std_logic;
SIGNAL \ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[14]~14_combout\ : std_logic;
SIGNAL \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[13]~13_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[12]~12_combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[11]~11_combout\ : std_logic;
SIGNAL \ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[10]~10_combout\ : std_logic;
SIGNAL \ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[9]~9_combout\ : std_logic;
SIGNAL \ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[8]~8_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[8]~19_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[7]~7_combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|ALT_INV_saida~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[6]~6_combout\ : std_logic;
SIGNAL \ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[5]~5_combout\ : std_logic;
SIGNAL \ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_saida~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[4]~4_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[3]~3_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida~combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[2]~2_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~8_combout\ : std_logic;
SIGNAL \ULA|ALT_INV_resultado_final[16]~55_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|ALT_INV_saida_MUX~4_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~45_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~38_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~301_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~300_q\ : std_logic;

BEGIN

ww_clk <= clk;
ULA_saida <= ww_ULA_saida;
PC_saida <= ww_PC_saida;
overflow <= ww_overflow;
monitora_flag_z <= ww_monitora_flag_z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[0]~20_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[1]~21_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[2]~22_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[3]~23_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[4]~24_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[5]~25_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[6]~26_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[7]~27_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[8]~19_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[9]~28_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[10]~29_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[11]~30_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[12]~31_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[13]~0_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[14]~1_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[15]~2_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[16]~3_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[17]~4_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[18]~5_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[19]~6_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[20]~7_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[21]~8_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[22]~9_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[23]~10_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[24]~11_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[25]~12_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[26]~13_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[27]~14_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[28]~15_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[29]~16_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[30]~17_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[31]~18_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\ <= (\ULA|resultado_final[7]~7_combout\ & \ULA|resultado_final[6]~6_combout\ & \ULA|resultado_final[5]~5_combout\ & \ULA|resultado_final[4]~4_combout\ & \ULA|resultado_final[3]~3_combout\ & 
\ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\(0);
\bancoRegs|ALT_INV_registrador~1154_combout\ <= NOT \bancoRegs|registrador~1154_combout\;
\bancoRegs|ALT_INV_registrador~1150_combout\ <= NOT \bancoRegs|registrador~1150_combout\;
\bancoRegs|ALT_INV_registrador~1146_combout\ <= NOT \bancoRegs|registrador~1146_combout\;
\bancoRegs|ALT_INV_registrador~1142_combout\ <= NOT \bancoRegs|registrador~1142_combout\;
\bancoRegs|ALT_INV_registrador~1138_combout\ <= NOT \bancoRegs|registrador~1138_combout\;
\bancoRegs|ALT_INV_registrador~1134_combout\ <= NOT \bancoRegs|registrador~1134_combout\;
\bancoRegs|ALT_INV_registrador~1130_combout\ <= NOT \bancoRegs|registrador~1130_combout\;
\bancoRegs|ALT_INV_registrador~1126_combout\ <= NOT \bancoRegs|registrador~1126_combout\;
\bancoRegs|ALT_INV_registrador~1122_combout\ <= NOT \bancoRegs|registrador~1122_combout\;
\bancoRegs|ALT_INV_registrador~1118_combout\ <= NOT \bancoRegs|registrador~1118_combout\;
\bancoRegs|ALT_INV_registrador~1114_combout\ <= NOT \bancoRegs|registrador~1114_combout\;
\bancoRegs|ALT_INV_registrador~1110_combout\ <= NOT \bancoRegs|registrador~1110_combout\;
\bancoRegs|ALT_INV_registrador~1106_combout\ <= NOT \bancoRegs|registrador~1106_combout\;
\bancoRegs|ALT_INV_registrador~1102_combout\ <= NOT \bancoRegs|registrador~1102_combout\;
\bancoRegs|ALT_INV_registrador~1098_combout\ <= NOT \bancoRegs|registrador~1098_combout\;
\bancoRegs|ALT_INV_registrador~1094_combout\ <= NOT \bancoRegs|registrador~1094_combout\;
\bancoRegs|ALT_INV_registrador~1090_combout\ <= NOT \bancoRegs|registrador~1090_combout\;
\bancoRegs|ALT_INV_registrador~1086_combout\ <= NOT \bancoRegs|registrador~1086_combout\;
\bancoRegs|ALT_INV_registrador~1082_combout\ <= NOT \bancoRegs|registrador~1082_combout\;
\bancoRegs|ALT_INV_registrador~1078_combout\ <= NOT \bancoRegs|registrador~1078_combout\;
\bancoRegs|ALT_INV_registrador~1074_combout\ <= NOT \bancoRegs|registrador~1074_combout\;
\bancoRegs|ALT_INV_registrador~1070_combout\ <= NOT \bancoRegs|registrador~1070_combout\;
\bancoRegs|ALT_INV_registrador~1066_combout\ <= NOT \bancoRegs|registrador~1066_combout\;
\bancoRegs|ALT_INV_registrador~1062_combout\ <= NOT \bancoRegs|registrador~1062_combout\;
\PC_Soma_Constante|ALT_INV_Add0~101_sumout\ <= NOT \PC_Soma_Constante|Add0~101_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~97_sumout\ <= NOT \PC_Soma_Constante|Add0~97_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~93_sumout\ <= NOT \PC_Soma_Constante|Add0~93_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~89_sumout\ <= NOT \PC_Soma_Constante|Add0~89_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~85_sumout\ <= NOT \PC_Soma_Constante|Add0~85_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~81_sumout\ <= NOT \PC_Soma_Constante|Add0~81_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~77_sumout\ <= NOT \PC_Soma_Constante|Add0~77_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~73_sumout\ <= NOT \PC_Soma_Constante|Add0~73_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~69_sumout\ <= NOT \PC_Soma_Constante|Add0~69_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~65_sumout\ <= NOT \PC_Soma_Constante|Add0~65_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~61_sumout\ <= NOT \PC_Soma_Constante|Add0~61_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~57_sumout\ <= NOT \PC_Soma_Constante|Add0~57_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~53_sumout\ <= NOT \PC_Soma_Constante|Add0~53_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~49_sumout\ <= NOT \PC_Soma_Constante|Add0~49_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~45_sumout\ <= NOT \PC_Soma_Constante|Add0~45_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~41_sumout\ <= NOT \PC_Soma_Constante|Add0~41_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~37_sumout\ <= NOT \PC_Soma_Constante|Add0~37_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~33_sumout\ <= NOT \PC_Soma_Constante|Add0~33_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~29_sumout\ <= NOT \PC_Soma_Constante|Add0~29_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~25_sumout\ <= NOT \PC_Soma_Constante|Add0~25_sumout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a31~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\;
\bancoRegs|ALT_INV_registrador~1314_combout\ <= NOT \bancoRegs|registrador~1314_combout\;
\bancoRegs|ALT_INV_registrador~1310_combout\ <= NOT \bancoRegs|registrador~1310_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a30~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\;
\bancoRegs|ALT_INV_registrador~1306_combout\ <= NOT \bancoRegs|registrador~1306_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a29~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\;
\bancoRegs|ALT_INV_registrador~1302_combout\ <= NOT \bancoRegs|registrador~1302_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a28~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\;
\bancoRegs|ALT_INV_registrador~1298_combout\ <= NOT \bancoRegs|registrador~1298_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a27~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\;
\bancoRegs|ALT_INV_registrador~1294_combout\ <= NOT \bancoRegs|registrador~1294_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a26~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\;
\bancoRegs|ALT_INV_registrador~1290_combout\ <= NOT \bancoRegs|registrador~1290_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a25~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\;
\bancoRegs|ALT_INV_registrador~1286_combout\ <= NOT \bancoRegs|registrador~1286_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a24~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\;
\bancoRegs|ALT_INV_registrador~1282_combout\ <= NOT \bancoRegs|registrador~1282_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a23~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\;
\bancoRegs|ALT_INV_registrador~1278_combout\ <= NOT \bancoRegs|registrador~1278_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a22~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\;
\bancoRegs|ALT_INV_registrador~1274_combout\ <= NOT \bancoRegs|registrador~1274_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a21~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\;
\bancoRegs|ALT_INV_registrador~1270_combout\ <= NOT \bancoRegs|registrador~1270_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a20~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\;
\bancoRegs|ALT_INV_registrador~1266_combout\ <= NOT \bancoRegs|registrador~1266_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a19~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\;
\bancoRegs|ALT_INV_registrador~1262_combout\ <= NOT \bancoRegs|registrador~1262_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a18~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\;
\bancoRegs|ALT_INV_registrador~1258_combout\ <= NOT \bancoRegs|registrador~1258_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a17~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\;
\bancoRegs|ALT_INV_registrador~1254_combout\ <= NOT \bancoRegs|registrador~1254_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a16~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\;
\bancoRegs|ALT_INV_registrador~1250_combout\ <= NOT \bancoRegs|registrador~1250_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a15~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\;
\bancoRegs|ALT_INV_registrador~1246_combout\ <= NOT \bancoRegs|registrador~1246_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a14~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\;
\bancoRegs|ALT_INV_registrador~1242_combout\ <= NOT \bancoRegs|registrador~1242_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a13~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\;
\bancoRegs|ALT_INV_registrador~1238_combout\ <= NOT \bancoRegs|registrador~1238_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a12~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\;
\bancoRegs|ALT_INV_registrador~1234_combout\ <= NOT \bancoRegs|registrador~1234_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a11~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\;
\bancoRegs|ALT_INV_registrador~1230_combout\ <= NOT \bancoRegs|registrador~1230_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a10~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\;
\bancoRegs|ALT_INV_registrador~1226_combout\ <= NOT \bancoRegs|registrador~1226_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a9~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\;
\bancoRegs|ALT_INV_registrador~1222_combout\ <= NOT \bancoRegs|registrador~1222_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a8~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\;
\bancoRegs|ALT_INV_registrador~1218_combout\ <= NOT \bancoRegs|registrador~1218_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\;
\bancoRegs|ALT_INV_registrador~1214_combout\ <= NOT \bancoRegs|registrador~1214_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\;
\bancoRegs|ALT_INV_registrador~1210_combout\ <= NOT \bancoRegs|registrador~1210_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\;
\bancoRegs|ALT_INV_registrador~1206_combout\ <= NOT \bancoRegs|registrador~1206_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\;
\bancoRegs|ALT_INV_registrador~1202_combout\ <= NOT \bancoRegs|registrador~1202_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\;
\bancoRegs|ALT_INV_registrador~1198_combout\ <= NOT \bancoRegs|registrador~1198_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\;
\bancoRegs|ALT_INV_registrador~1194_combout\ <= NOT \bancoRegs|registrador~1194_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\;
\bancoRegs|ALT_INV_registrador~1190_combout\ <= NOT \bancoRegs|registrador~1190_combout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\;
\PC_Soma_Constante|ALT_INV_Add0~21_sumout\ <= NOT \PC_Soma_Constante|Add0~21_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~17_sumout\ <= NOT \PC_Soma_Constante|Add0~17_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~13_sumout\ <= NOT \PC_Soma_Constante|Add0~13_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~9_sumout\ <= NOT \PC_Soma_Constante|Add0~9_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~5_sumout\ <= NOT \PC_Soma_Constante|Add0~5_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~1_sumout\ <= NOT \PC_Soma_Constante|Add0~1_sumout\;
\bancoRegs|ALT_INV_registrador~1186_combout\ <= NOT \bancoRegs|registrador~1186_combout\;
\bancoRegs|ALT_INV_registrador~1182_combout\ <= NOT \bancoRegs|registrador~1182_combout\;
\bancoRegs|ALT_INV_registrador~1178_combout\ <= NOT \bancoRegs|registrador~1178_combout\;
\bancoRegs|ALT_INV_registrador~1174_combout\ <= NOT \bancoRegs|registrador~1174_combout\;
\bancoRegs|ALT_INV_registrador~1170_combout\ <= NOT \bancoRegs|registrador~1170_combout\;
\bancoRegs|ALT_INV_registrador~1166_combout\ <= NOT \bancoRegs|registrador~1166_combout\;
\bancoRegs|ALT_INV_registrador~1162_combout\ <= NOT \bancoRegs|registrador~1162_combout\;
\bancoRegs|ALT_INV_registrador~1158_combout\ <= NOT \bancoRegs|registrador~1158_combout\;
\ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|mux_ula|saida_MUX~0_combout\;
\ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\ <= NOT \ULA|ula19|mux_ula|saida_MUX~2_combout\;
\ULA|ALT_INV_resultado_final[1]~1_combout\ <= NOT \ULA|resultado_final[1]~1_combout\;
\ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula1|mux_ula|saida_MUX~0_combout\;
\ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula19|mux_ula|saida_MUX~1_combout\;
\ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula19|mux_ula|saida_MUX~0_combout\;
\ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\ <= NOT \ULA|ula0|mux_ula|Equal0~0_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~1_combout\;
\ULA|ula0|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~0_combout\;
\ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula31|mux_inverteB|saida_MUX~0_combout\;
\mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\ <= NOT \mux_rt_imediato|saida_MUX[31]~0_combout\;
\bancoRegs|ALT_INV_saidaB[31]~18_combout\ <= NOT \bancoRegs|saidaB[31]~18_combout\;
\ULA|ula30|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula30|soma_sub|carry_out~combout\;
\ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula30|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[30]~17_combout\ <= NOT \bancoRegs|saidaB[30]~17_combout\;
\ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula29|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[29]~16_combout\ <= NOT \bancoRegs|saidaB[29]~16_combout\;
\ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula28|soma_sub|saida_xor2~combout\;
\ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula28|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[28]~15_combout\ <= NOT \bancoRegs|saidaB[28]~15_combout\;
\ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula27|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[27]~14_combout\ <= NOT \bancoRegs|saidaB[27]~14_combout\;
\ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula26|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[26]~13_combout\ <= NOT \bancoRegs|saidaB[26]~13_combout\;
\ULA|ula25|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula25|soma_sub|carry_out~combout\;
\ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula25|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[25]~12_combout\ <= NOT \bancoRegs|saidaB[25]~12_combout\;
\ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula24|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[24]~11_combout\ <= NOT \bancoRegs|saidaB[24]~11_combout\;
\ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula23|soma_sub|saida_xor2~combout\;
\ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula23|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[23]~10_combout\ <= NOT \bancoRegs|saidaB[23]~10_combout\;
\ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula22|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[22]~9_combout\ <= NOT \bancoRegs|saidaB[22]~9_combout\;
\ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula21|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[21]~8_combout\ <= NOT \bancoRegs|saidaB[21]~8_combout\;
\ULA|ula20|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula20|soma_sub|carry_out~combout\;
\ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula20|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[20]~7_combout\ <= NOT \bancoRegs|saidaB[20]~7_combout\;
\ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula19|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[19]~6_combout\ <= NOT \bancoRegs|saidaB[19]~6_combout\;
\ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula18|soma_sub|saida_xor2~combout\;
\ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula18|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[18]~5_combout\ <= NOT \bancoRegs|saidaB[18]~5_combout\;
\ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula17|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[17]~4_combout\ <= NOT \bancoRegs|saidaB[17]~4_combout\;
\ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula16|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[16]~3_combout\ <= NOT \bancoRegs|saidaB[16]~3_combout\;
\ULA|ula15|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula15|soma_sub|carry_out~combout\;
\ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula15|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[15]~2_combout\ <= NOT \bancoRegs|saidaB[15]~2_combout\;
\ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula14|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[14]~1_combout\ <= NOT \bancoRegs|saidaB[14]~1_combout\;
\bancoRegs|ALT_INV_saidaB[13]~0_combout\ <= NOT \bancoRegs|saidaB[13]~0_combout\;
\ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula13|soma_sub|saida_xor2~combout\;
\ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula13|soma_sub|saida_xor~combout\;
\ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula12|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula11|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula10|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula10|soma_sub|carry_out~combout\;
\ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula10|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula9|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula8|soma_sub|saida_xor2~combout\;
\ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula8|soma_sub|saida_xor~combout\;
\ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula7|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula6|mux_inverteB|saida_MUX~0_combout\;
\ROM|ALT_INV_memROM~17_combout\ <= NOT \ROM|memROM~17_combout\;
\ULA|ula5|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula5|soma_sub|carry_out~combout\;
\ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula5|mux_inverteB|saida_MUX~0_combout\;
\ROM|ALT_INV_memROM~16_combout\ <= NOT \ROM|memROM~16_combout\;
\ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula4|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula3|mux_ula|saida_MUX~0_combout\;
\ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula3|soma_sub|saida_xor2~combout\;
\ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula3|soma_sub|saida_xor~combout\;
\ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|mux_inverteB|saida_MUX~0_combout\;
\ROM|ALT_INV_memROM~15_combout\ <= NOT \ROM|memROM~15_combout\;
\ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula1|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[1]~0_combout\ <= NOT \bancoRegs|saidaA[1]~0_combout\;
\ULA|ula0|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula0|soma_sub|carry_out~combout\;
\UC|ALT_INV_palavraControle[4]~0_combout\ <= NOT \UC|palavraControle[4]~0_combout\;
\UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\ <= NOT \UC_ULA|ula_ctrl[3]~7_combout\;
\bancoRegs|ALT_INV_Equal0~0_combout\ <= NOT \bancoRegs|Equal0~0_combout\;
\ROM|ALT_INV_memROM~14_combout\ <= NOT \ROM|memROM~14_combout\;
\ROM|ALT_INV_memROM~13_combout\ <= NOT \ROM|memROM~13_combout\;
\ROM|ALT_INV_memROM~12_combout\ <= NOT \ROM|memROM~12_combout\;
\ULA|ALT_INV_Equal0~0_combout\ <= NOT \ULA|Equal0~0_combout\;
\UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\ <= NOT \UC_ULA|ula_ctrl[0]~6_combout\;
\UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\ <= NOT \UC_ULA|ula_ctrl[1]~5_combout\;
\UC_ULA|ALT_INV_ula_ctrl~4_combout\ <= NOT \UC_ULA|ula_ctrl~4_combout\;
\UC_ULA|ALT_INV_ula_ctrl[3]~3_combout\ <= NOT \UC_ULA|ula_ctrl[3]~3_combout\;
\UC_ULA|ALT_INV_ula_ctrl[3]~2_combout\ <= NOT \UC_ULA|ula_ctrl[3]~2_combout\;
\UC_ULA|ALT_INV_ula_ctrl~1_combout\ <= NOT \UC_ULA|ula_ctrl~1_combout\;
\ROM|ALT_INV_memROM~11_combout\ <= NOT \ROM|memROM~11_combout\;
\ROM|ALT_INV_memROM~10_combout\ <= NOT \ROM|memROM~10_combout\;
\ROM|ALT_INV_memROM~9_combout\ <= NOT \ROM|memROM~9_combout\;
\ROM|ALT_INV_memROM~8_combout\ <= NOT \ROM|memROM~8_combout\;
\ROM|ALT_INV_memROM~7_combout\ <= NOT \ROM|memROM~7_combout\;
\UC_ULA|ALT_INV_ula_ctrl[2]~0_combout\ <= NOT \UC_ULA|ula_ctrl[2]~0_combout\;
\ROM|ALT_INV_memROM~6_combout\ <= NOT \ROM|memROM~6_combout\;
\UC|ALT_INV_Equal0~0_combout\ <= NOT \UC|Equal0~0_combout\;
\ROM|ALT_INV_memROM~5_combout\ <= NOT \ROM|memROM~5_combout\;
\ROM|ALT_INV_memROM~4_combout\ <= NOT \ROM|memROM~4_combout\;
\ROM|ALT_INV_memROM~3_combout\ <= NOT \ROM|memROM~3_combout\;
\ROM|ALT_INV_memROM~2_combout\ <= NOT \ROM|memROM~2_combout\;
\ROM|ALT_INV_memROM~1_combout\ <= NOT \ROM|memROM~1_combout\;
\PC_entity|ALT_INV_DOUT\(6) <= NOT \PC_entity|DOUT\(6);
\PC_entity|ALT_INV_DOUT\(7) <= NOT \PC_entity|DOUT\(7);
\ROM|ALT_INV_memROM~0_combout\ <= NOT \ROM|memROM~0_combout\;
\PC_entity|ALT_INV_DOUT\(5) <= NOT \PC_entity|DOUT\(5);
\PC_entity|ALT_INV_DOUT\(4) <= NOT \PC_entity|DOUT\(4);
\PC_entity|ALT_INV_DOUT\(3) <= NOT \PC_entity|DOUT\(3);
\PC_entity|ALT_INV_DOUT\(2) <= NOT \PC_entity|DOUT\(2);
\ULA|ALT_INV_resultado_final[18]~51_combout\ <= NOT \ULA|resultado_final[18]~51_combout\;
\ULA|ALT_INV_resultado_final[19]~47_combout\ <= NOT \ULA|resultado_final[19]~47_combout\;
\ULA|ALT_INV_resultado_final[20]~43_combout\ <= NOT \ULA|resultado_final[20]~43_combout\;
\ULA|ALT_INV_resultado_final[21]~39_combout\ <= NOT \ULA|resultado_final[21]~39_combout\;
\ULA|ALT_INV_resultado_final[22]~35_combout\ <= NOT \ULA|resultado_final[22]~35_combout\;
\ULA|ALT_INV_resultado_final[23]~31_combout\ <= NOT \ULA|resultado_final[23]~31_combout\;
\ULA|ALT_INV_resultado_final[25]~27_combout\ <= NOT \ULA|resultado_final[25]~27_combout\;
\ULA|ALT_INV_resultado_final[26]~23_combout\ <= NOT \ULA|resultado_final[26]~23_combout\;
\bancoRegs|ALT_INV_registrador~299_q\ <= NOT \bancoRegs|registrador~299_q\;
\bancoRegs|ALT_INV_registrador~298_q\ <= NOT \bancoRegs|registrador~298_q\;
\bancoRegs|ALT_INV_registrador~297_q\ <= NOT \bancoRegs|registrador~297_q\;
\bancoRegs|ALT_INV_registrador~296_q\ <= NOT \bancoRegs|registrador~296_q\;
\bancoRegs|ALT_INV_registrador~295_q\ <= NOT \bancoRegs|registrador~295_q\;
\ROM|ALT_INV_memROM~18_combout\ <= NOT \ROM|memROM~18_combout\;
\bancoRegs|ALT_INV_registrador~294_q\ <= NOT \bancoRegs|registrador~294_q\;
\mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\ <= NOT \mux_rt_rd|saida_MUX[3]~2_combout\;
\mux_rt_rd|ALT_INV_saida_MUX[3]~1_combout\ <= NOT \mux_rt_rd|saida_MUX[3]~1_combout\;
\mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\ <= NOT \mux_rt_rd|saida_MUX[0]~0_combout\;
\UC|ALT_INV_palavraControle\(0) <= NOT \UC|palavraControle\(0);
\UC|ALT_INV_sel_mux4~0_combout\ <= NOT \UC|sel_mux4~0_combout\;
\UC|ALT_INV_Equal5~1_combout\ <= NOT \UC|Equal5~1_combout\;
\UC|ALT_INV_Equal5~0_combout\ <= NOT \UC|Equal5~0_combout\;
\ULA|ula31|Overflow_exists|ALT_INV_overflow~0_combout\ <= NOT \ULA|ula31|Overflow_exists|overflow~0_combout\;
\PC_entity|ALT_INV_DOUT\(31) <= NOT \PC_entity|DOUT\(31);
\PC_entity|ALT_INV_DOUT\(30) <= NOT \PC_entity|DOUT\(30);
\PC_entity|ALT_INV_DOUT\(29) <= NOT \PC_entity|DOUT\(29);
\PC_entity|ALT_INV_DOUT\(28) <= NOT \PC_entity|DOUT\(28);
\PC_entity|ALT_INV_DOUT\(27) <= NOT \PC_entity|DOUT\(27);
\PC_entity|ALT_INV_DOUT\(26) <= NOT \PC_entity|DOUT\(26);
\PC_entity|ALT_INV_DOUT\(25) <= NOT \PC_entity|DOUT\(25);
\PC_entity|ALT_INV_DOUT\(24) <= NOT \PC_entity|DOUT\(24);
\PC_entity|ALT_INV_DOUT\(23) <= NOT \PC_entity|DOUT\(23);
\PC_entity|ALT_INV_DOUT\(22) <= NOT \PC_entity|DOUT\(22);
\PC_entity|ALT_INV_DOUT\(21) <= NOT \PC_entity|DOUT\(21);
\PC_entity|ALT_INV_DOUT\(20) <= NOT \PC_entity|DOUT\(20);
\PC_entity|ALT_INV_DOUT\(19) <= NOT \PC_entity|DOUT\(19);
\PC_entity|ALT_INV_DOUT\(18) <= NOT \PC_entity|DOUT\(18);
\PC_entity|ALT_INV_DOUT\(17) <= NOT \PC_entity|DOUT\(17);
\PC_entity|ALT_INV_DOUT\(16) <= NOT \PC_entity|DOUT\(16);
\PC_entity|ALT_INV_DOUT\(15) <= NOT \PC_entity|DOUT\(15);
\PC_entity|ALT_INV_DOUT\(14) <= NOT \PC_entity|DOUT\(14);
\PC_entity|ALT_INV_DOUT\(13) <= NOT \PC_entity|DOUT\(13);
\PC_entity|ALT_INV_DOUT\(12) <= NOT \PC_entity|DOUT\(12);
\PC_entity|ALT_INV_DOUT\(11) <= NOT \PC_entity|DOUT\(11);
\PC_entity|ALT_INV_DOUT\(10) <= NOT \PC_entity|DOUT\(10);
\PC_entity|ALT_INV_DOUT\(9) <= NOT \PC_entity|DOUT\(9);
\PC_entity|ALT_INV_DOUT\(8) <= NOT \PC_entity|DOUT\(8);
\ULA|ALT_INV_resultado_final[31]~22_combout\ <= NOT \ULA|resultado_final[31]~22_combout\;
\ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula31|mux_ula|saida_MUX~0_combout\;
\ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula30|mux_ula|saida_MUX~1_combout\;
\ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula30|mux_ula|saida_MUX~0_combout\;
\ULA|ula29|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula29|mux_ula|saida_MUX~1_combout\;
\ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula29|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[28]~19_combout\ <= NOT \ULA|resultado_final[28]~19_combout\;
\ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula28|mux_ula|saida_MUX~0_combout\;
\ULA|ula27|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula27|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[27]~18_combout\ <= NOT \ULA|resultado_final[27]~18_combout\;
\ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula27|mux_ula|saida_MUX~1_combout\;
\ULA|ula27|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula27|mux_ula|saida_MUX~0_combout\;
\ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula26|mux_ula|saida_MUX~0_combout\;
\ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula25|mux_ula|saida_MUX~0_combout\;
\ULA|ula24|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula24|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[24]~17_combout\ <= NOT \ULA|resultado_final[24]~17_combout\;
\ULA|ula24|mux_ula|ALT_INV_saida_MUX~2_combout\ <= NOT \ULA|ula24|mux_ula|saida_MUX~2_combout\;
\ULA|ula24|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula24|mux_ula|saida_MUX~1_combout\;
\ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula24|mux_ula|saida_MUX~0_combout\;
\ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula23|mux_ula|saida_MUX~0_combout\;
\ULA|ula22|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula22|soma_sub|carry_out~combout\;
\ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula22|mux_ula|saida_MUX~1_combout\;
\ULA|ula22|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula22|mux_ula|saida_MUX~0_combout\;
\ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula21|mux_ula|saida_MUX~0_combout\;
\ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula20|mux_ula|saida_MUX~0_combout\;
\ULA|ula19|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula19|soma_sub|carry_out~combout\;
\ULA|ula19|mux_ula|ALT_INV_saida_MUX~3_combout\ <= NOT \ULA|ula19|mux_ula|saida_MUX~3_combout\;
\ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula18|mux_ula|saida_MUX~0_combout\;
\ULA|ula17|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula17|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[17]~16_combout\ <= NOT \ULA|resultado_final[17]~16_combout\;
\ULA|ula17|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula17|mux_ula|saida_MUX~0_combout\;
\ULA|ula16|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula16|soma_sub|carry_out~combout\;
\ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula16|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[15]~15_combout\ <= NOT \ULA|resultado_final[15]~15_combout\;
\ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula15|mux_ula|saida_MUX~0_combout\;
\ULA|ula14|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula14|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[14]~14_combout\ <= NOT \ULA|resultado_final[14]~14_combout\;
\ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula14|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[13]~13_combout\ <= NOT \ULA|resultado_final[13]~13_combout\;
\ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula13|mux_ula|saida_MUX~0_combout\;
\ULA|ula13|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula13|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula12|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula12|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[12]~12_combout\ <= NOT \ULA|resultado_final[12]~12_combout\;
\ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula12|mux_ula|saida_MUX~0_combout\;
\ULA|ula11|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula11|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[11]~11_combout\ <= NOT \ULA|resultado_final[11]~11_combout\;
\ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula11|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[10]~10_combout\ <= NOT \ULA|resultado_final[10]~10_combout\;
\ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula10|mux_ula|saida_MUX~0_combout\;
\ULA|ula9|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula9|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[9]~9_combout\ <= NOT \ULA|resultado_final[9]~9_combout\;
\ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula9|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[8]~8_combout\ <= NOT \ULA|resultado_final[8]~8_combout\;
\ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula8|mux_ula|saida_MUX~0_combout\;
\ULA|ula8|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula8|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[8]~19_combout\ <= NOT \bancoRegs|saidaB[8]~19_combout\;
\ULA|ula7|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula7|soma_sub|carry_out~combout\;
\ULA|ALT_INV_resultado_final[7]~7_combout\ <= NOT \ULA|resultado_final[7]~7_combout\;
\ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula7|mux_ula|saida_MUX~0_combout\;
\ULA|ula7|soma_sub|ALT_INV_saida~combout\ <= NOT \ULA|ula7|soma_sub|saida~combout\;
\ULA|ALT_INV_resultado_final[6]~6_combout\ <= NOT \ULA|resultado_final[6]~6_combout\;
\ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula6|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[5]~5_combout\ <= NOT \ULA|resultado_final[5]~5_combout\;
\ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula5|mux_ula|saida_MUX~0_combout\;
\ULA|ula5|soma_sub|ALT_INV_saida~combout\ <= NOT \ULA|ula5|soma_sub|saida~combout\;
\ULA|ALT_INV_resultado_final[4]~4_combout\ <= NOT \ULA|resultado_final[4]~4_combout\;
\ULA|ula4|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula4|mux_ula|saida_MUX~1_combout\;
\ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula4|mux_ula|saida_MUX~0_combout\;
\ULA|ALT_INV_resultado_final[3]~3_combout\ <= NOT \ULA|resultado_final[3]~3_combout\;
\ULA|ula3|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula3|mux_ula|saida_MUX~1_combout\;
\ULA|ula3|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula3|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula3|soma_sub|ALT_INV_saida~combout\ <= NOT \ULA|ula3|soma_sub|saida~combout\;
\ULA|ALT_INV_resultado_final[2]~2_combout\ <= NOT \ULA|resultado_final[2]~2_combout\;
\ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula2|mux_ula|saida_MUX~1_combout\;
\UC_ULA|ALT_INV_ula_ctrl~8_combout\ <= NOT \UC_ULA|ula_ctrl~8_combout\;
\ULA|ALT_INV_resultado_final[16]~55_combout\ <= NOT \ULA|resultado_final[16]~55_combout\;
\ULA|ula19|mux_ula|ALT_INV_saida_MUX~4_combout\ <= NOT \ULA|ula19|mux_ula|saida_MUX~4_combout\;
\bancoRegs|ALT_INV_registrador~69_q\ <= NOT \bancoRegs|registrador~69_q\;
\bancoRegs|ALT_INV_registrador~68_q\ <= NOT \bancoRegs|registrador~68_q\;
\bancoRegs|ALT_INV_registrador~67_q\ <= NOT \bancoRegs|registrador~67_q\;
\bancoRegs|ALT_INV_registrador~66_q\ <= NOT \bancoRegs|registrador~66_q\;
\bancoRegs|ALT_INV_registrador~65_q\ <= NOT \bancoRegs|registrador~65_q\;
\bancoRegs|ALT_INV_registrador~64_q\ <= NOT \bancoRegs|registrador~64_q\;
\bancoRegs|ALT_INV_registrador~63_q\ <= NOT \bancoRegs|registrador~63_q\;
\bancoRegs|ALT_INV_registrador~62_q\ <= NOT \bancoRegs|registrador~62_q\;
\bancoRegs|ALT_INV_registrador~61_q\ <= NOT \bancoRegs|registrador~61_q\;
\bancoRegs|ALT_INV_registrador~60_q\ <= NOT \bancoRegs|registrador~60_q\;
\bancoRegs|ALT_INV_registrador~59_q\ <= NOT \bancoRegs|registrador~59_q\;
\bancoRegs|ALT_INV_registrador~58_q\ <= NOT \bancoRegs|registrador~58_q\;
\bancoRegs|ALT_INV_registrador~57_q\ <= NOT \bancoRegs|registrador~57_q\;
\bancoRegs|ALT_INV_registrador~56_q\ <= NOT \bancoRegs|registrador~56_q\;
\bancoRegs|ALT_INV_registrador~55_q\ <= NOT \bancoRegs|registrador~55_q\;
\bancoRegs|ALT_INV_registrador~54_q\ <= NOT \bancoRegs|registrador~54_q\;
\bancoRegs|ALT_INV_registrador~53_q\ <= NOT \bancoRegs|registrador~53_q\;
\bancoRegs|ALT_INV_registrador~52_q\ <= NOT \bancoRegs|registrador~52_q\;
\bancoRegs|ALT_INV_registrador~51_q\ <= NOT \bancoRegs|registrador~51_q\;
\bancoRegs|ALT_INV_registrador~50_q\ <= NOT \bancoRegs|registrador~50_q\;
\bancoRegs|ALT_INV_registrador~49_q\ <= NOT \bancoRegs|registrador~49_q\;
\bancoRegs|ALT_INV_registrador~48_q\ <= NOT \bancoRegs|registrador~48_q\;
\bancoRegs|ALT_INV_registrador~47_q\ <= NOT \bancoRegs|registrador~47_q\;
\bancoRegs|ALT_INV_registrador~46_q\ <= NOT \bancoRegs|registrador~46_q\;
\bancoRegs|ALT_INV_registrador~45_q\ <= NOT \bancoRegs|registrador~45_q\;
\bancoRegs|ALT_INV_registrador~44_q\ <= NOT \bancoRegs|registrador~44_q\;
\bancoRegs|ALT_INV_registrador~43_q\ <= NOT \bancoRegs|registrador~43_q\;
\bancoRegs|ALT_INV_registrador~42_q\ <= NOT \bancoRegs|registrador~42_q\;
\bancoRegs|ALT_INV_registrador~41_q\ <= NOT \bancoRegs|registrador~41_q\;
\bancoRegs|ALT_INV_registrador~40_q\ <= NOT \bancoRegs|registrador~40_q\;
\bancoRegs|ALT_INV_registrador~39_q\ <= NOT \bancoRegs|registrador~39_q\;
\bancoRegs|ALT_INV_registrador~38_q\ <= NOT \bancoRegs|registrador~38_q\;
\bancoRegs|ALT_INV_registrador~325_q\ <= NOT \bancoRegs|registrador~325_q\;
\bancoRegs|ALT_INV_registrador~324_q\ <= NOT \bancoRegs|registrador~324_q\;
\bancoRegs|ALT_INV_registrador~323_q\ <= NOT \bancoRegs|registrador~323_q\;
\bancoRegs|ALT_INV_registrador~322_q\ <= NOT \bancoRegs|registrador~322_q\;
\bancoRegs|ALT_INV_registrador~321_q\ <= NOT \bancoRegs|registrador~321_q\;
\bancoRegs|ALT_INV_registrador~320_q\ <= NOT \bancoRegs|registrador~320_q\;
\bancoRegs|ALT_INV_registrador~319_q\ <= NOT \bancoRegs|registrador~319_q\;
\bancoRegs|ALT_INV_registrador~318_q\ <= NOT \bancoRegs|registrador~318_q\;
\bancoRegs|ALT_INV_registrador~317_q\ <= NOT \bancoRegs|registrador~317_q\;
\bancoRegs|ALT_INV_registrador~316_q\ <= NOT \bancoRegs|registrador~316_q\;
\bancoRegs|ALT_INV_registrador~315_q\ <= NOT \bancoRegs|registrador~315_q\;
\bancoRegs|ALT_INV_registrador~314_q\ <= NOT \bancoRegs|registrador~314_q\;
\bancoRegs|ALT_INV_registrador~313_q\ <= NOT \bancoRegs|registrador~313_q\;
\bancoRegs|ALT_INV_registrador~312_q\ <= NOT \bancoRegs|registrador~312_q\;
\bancoRegs|ALT_INV_registrador~311_q\ <= NOT \bancoRegs|registrador~311_q\;
\bancoRegs|ALT_INV_registrador~310_q\ <= NOT \bancoRegs|registrador~310_q\;
\bancoRegs|ALT_INV_registrador~309_q\ <= NOT \bancoRegs|registrador~309_q\;
\bancoRegs|ALT_INV_registrador~308_q\ <= NOT \bancoRegs|registrador~308_q\;
\bancoRegs|ALT_INV_registrador~307_q\ <= NOT \bancoRegs|registrador~307_q\;
\bancoRegs|ALT_INV_registrador~306_q\ <= NOT \bancoRegs|registrador~306_q\;
\bancoRegs|ALT_INV_registrador~305_q\ <= NOT \bancoRegs|registrador~305_q\;
\bancoRegs|ALT_INV_registrador~304_q\ <= NOT \bancoRegs|registrador~304_q\;
\bancoRegs|ALT_INV_registrador~303_q\ <= NOT \bancoRegs|registrador~303_q\;
\bancoRegs|ALT_INV_registrador~302_q\ <= NOT \bancoRegs|registrador~302_q\;
\bancoRegs|ALT_INV_registrador~301_q\ <= NOT \bancoRegs|registrador~301_q\;
\bancoRegs|ALT_INV_registrador~300_q\ <= NOT \bancoRegs|registrador~300_q\;

\ULA_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|resultado_final[0]~0_combout\,
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
	i => \ULA|resultado_final[1]~1_combout\,
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
	i => \ULA|resultado_final[2]~2_combout\,
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
	i => \ULA|resultado_final[3]~3_combout\,
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
	i => \ULA|resultado_final[4]~4_combout\,
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
	i => \ULA|resultado_final[5]~5_combout\,
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
	i => \ULA|resultado_final[6]~6_combout\,
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
	i => \ULA|resultado_final[7]~7_combout\,
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
	i => \ULA|resultado_final[8]~8_combout\,
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
	i => \ULA|resultado_final[9]~9_combout\,
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
	i => \ULA|resultado_final[10]~10_combout\,
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
	i => \ULA|resultado_final[11]~11_combout\,
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
	i => \ULA|resultado_final[12]~12_combout\,
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
	i => \ULA|resultado_final[13]~13_combout\,
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
	i => \ULA|resultado_final[14]~14_combout\,
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
	i => \ULA|resultado_final[15]~15_combout\,
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
	i => \ULA|resultado_final[16]~55_combout\,
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
	i => \ULA|resultado_final[17]~16_combout\,
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
	i => \ULA|resultado_final[18]~51_combout\,
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
	i => \ULA|resultado_final[19]~47_combout\,
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
	i => \ULA|resultado_final[20]~43_combout\,
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
	i => \ULA|resultado_final[21]~39_combout\,
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
	i => \ULA|resultado_final[22]~35_combout\,
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
	i => \ULA|resultado_final[23]~31_combout\,
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
	i => \ULA|resultado_final[24]~17_combout\,
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
	i => \ULA|resultado_final[25]~27_combout\,
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
	i => \ULA|resultado_final[26]~23_combout\,
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
	i => \ULA|resultado_final[27]~18_combout\,
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
	i => \ULA|resultado_final[28]~19_combout\,
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
	i => \ULA|resultado_final[29]~20_combout\,
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
	i => \ULA|resultado_final[30]~21_combout\,
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
	i => \ULA|resultado_final[31]~22_combout\,
	devoe => ww_devoe,
	o => \ULA_saida[31]~output_o\);

\PC_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \PC_saida[0]~output_o\);

\PC_saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \PC_saida[1]~output_o\);

\PC_saida[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(2),
	devoe => ww_devoe,
	o => \PC_saida[2]~output_o\);

\PC_saida[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(3),
	devoe => ww_devoe,
	o => \PC_saida[3]~output_o\);

\PC_saida[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(4),
	devoe => ww_devoe,
	o => \PC_saida[4]~output_o\);

\PC_saida[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(5),
	devoe => ww_devoe,
	o => \PC_saida[5]~output_o\);

\PC_saida[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(6),
	devoe => ww_devoe,
	o => \PC_saida[6]~output_o\);

\PC_saida[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(7),
	devoe => ww_devoe,
	o => \PC_saida[7]~output_o\);

\PC_saida[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(8),
	devoe => ww_devoe,
	o => \PC_saida[8]~output_o\);

\PC_saida[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(9),
	devoe => ww_devoe,
	o => \PC_saida[9]~output_o\);

\PC_saida[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(10),
	devoe => ww_devoe,
	o => \PC_saida[10]~output_o\);

\PC_saida[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(11),
	devoe => ww_devoe,
	o => \PC_saida[11]~output_o\);

\PC_saida[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(12),
	devoe => ww_devoe,
	o => \PC_saida[12]~output_o\);

\PC_saida[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(13),
	devoe => ww_devoe,
	o => \PC_saida[13]~output_o\);

\PC_saida[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(14),
	devoe => ww_devoe,
	o => \PC_saida[14]~output_o\);

\PC_saida[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(15),
	devoe => ww_devoe,
	o => \PC_saida[15]~output_o\);

\PC_saida[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(16),
	devoe => ww_devoe,
	o => \PC_saida[16]~output_o\);

\PC_saida[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(17),
	devoe => ww_devoe,
	o => \PC_saida[17]~output_o\);

\PC_saida[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(18),
	devoe => ww_devoe,
	o => \PC_saida[18]~output_o\);

\PC_saida[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(19),
	devoe => ww_devoe,
	o => \PC_saida[19]~output_o\);

\PC_saida[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(20),
	devoe => ww_devoe,
	o => \PC_saida[20]~output_o\);

\PC_saida[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(21),
	devoe => ww_devoe,
	o => \PC_saida[21]~output_o\);

\PC_saida[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(22),
	devoe => ww_devoe,
	o => \PC_saida[22]~output_o\);

\PC_saida[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(23),
	devoe => ww_devoe,
	o => \PC_saida[23]~output_o\);

\PC_saida[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(24),
	devoe => ww_devoe,
	o => \PC_saida[24]~output_o\);

\PC_saida[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(25),
	devoe => ww_devoe,
	o => \PC_saida[25]~output_o\);

\PC_saida[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(26),
	devoe => ww_devoe,
	o => \PC_saida[26]~output_o\);

\PC_saida[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(27),
	devoe => ww_devoe,
	o => \PC_saida[27]~output_o\);

\PC_saida[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(28),
	devoe => ww_devoe,
	o => \PC_saida[28]~output_o\);

\PC_saida[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(29),
	devoe => ww_devoe,
	o => \PC_saida[29]~output_o\);

\PC_saida[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(30),
	devoe => ww_devoe,
	o => \PC_saida[30]~output_o\);

\PC_saida[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC_entity|DOUT\(31),
	devoe => ww_devoe,
	o => \PC_saida[31]~output_o\);

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

\monitora_flag_z~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitora_flag_z~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\PC_Soma_Constante|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~1_sumout\ = SUM(( \PC_entity|DOUT\(2) ) + ( VCC ) + ( !VCC ))
-- \PC_Soma_Constante|Add0~2\ = CARRY(( \PC_entity|DOUT\(2) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(2),
	cin => GND,
	sumout => \PC_Soma_Constante|Add0~1_sumout\,
	cout => \PC_Soma_Constante|Add0~2\);

\PC_Soma_Constante|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~5_sumout\ = SUM(( \PC_entity|DOUT\(3) ) + ( GND ) + ( \PC_Soma_Constante|Add0~2\ ))
-- \PC_Soma_Constante|Add0~6\ = CARRY(( \PC_entity|DOUT\(3) ) + ( GND ) + ( \PC_Soma_Constante|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(3),
	cin => \PC_Soma_Constante|Add0~2\,
	sumout => \PC_Soma_Constante|Add0~5_sumout\,
	cout => \PC_Soma_Constante|Add0~6\);

\PC_Soma_Constante|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~9_sumout\ = SUM(( \PC_entity|DOUT\(4) ) + ( GND ) + ( \PC_Soma_Constante|Add0~6\ ))
-- \PC_Soma_Constante|Add0~10\ = CARRY(( \PC_entity|DOUT\(4) ) + ( GND ) + ( \PC_Soma_Constante|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(4),
	cin => \PC_Soma_Constante|Add0~6\,
	sumout => \PC_Soma_Constante|Add0~9_sumout\,
	cout => \PC_Soma_Constante|Add0~10\);

\PC_Soma_Constante|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~13_sumout\ = SUM(( \PC_entity|DOUT\(5) ) + ( GND ) + ( \PC_Soma_Constante|Add0~10\ ))
-- \PC_Soma_Constante|Add0~14\ = CARRY(( \PC_entity|DOUT\(5) ) + ( GND ) + ( \PC_Soma_Constante|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(5),
	cin => \PC_Soma_Constante|Add0~10\,
	sumout => \PC_Soma_Constante|Add0~13_sumout\,
	cout => \PC_Soma_Constante|Add0~14\);

\mux_PC|saida_MUX[5]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[5]~3_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~13_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~13_sumout\,
	combout => \mux_PC|saida_MUX[5]~3_combout\);

\PC_entity|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(5));

\ROM|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~3_combout\ = (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(2) $ (\PC_entity|DOUT\(4)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000000000100001000000000010000100000000001000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~3_combout\);

\ROM|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~5_combout\ = (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(5) & ((!\PC_entity|DOUT\(4)) # (\PC_entity|DOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010000000000110001000000000011000100000000001100010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~5_combout\);

\UC|Equal5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal5~0_combout\ = ( !\PC_entity|DOUT\(7) & ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(5) & ((!\PC_entity|DOUT\(4)) # (\PC_entity|DOUT\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(7),
	dataf => \PC_entity|ALT_INV_DOUT\(6),
	combout => \UC|Equal5~0_combout\);

\UC|Equal5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal5~1_combout\ = ( !\UC|Equal5~0_combout\ & ( (\ROM|memROM~0_combout\ & (\ROM|memROM~1_combout\ & (!\ROM|memROM~3_combout\ & !\ROM|memROM~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000010000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~5_combout\,
	datae => \UC|ALT_INV_Equal5~0_combout\,
	combout => \UC|Equal5~1_combout\);

\PC_Soma_Constante|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~21_sumout\ = SUM(( \PC_entity|DOUT\(6) ) + ( GND ) + ( \PC_Soma_Constante|Add0~14\ ))
-- \PC_Soma_Constante|Add0~22\ = CARRY(( \PC_entity|DOUT\(6) ) + ( GND ) + ( \PC_Soma_Constante|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(6),
	cin => \PC_Soma_Constante|Add0~14\,
	sumout => \PC_Soma_Constante|Add0~21_sumout\,
	cout => \PC_Soma_Constante|Add0~22\);

\mux_PC|saida_MUX[6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[6]~5_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~21_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~21_sumout\,
	combout => \mux_PC|saida_MUX[6]~5_combout\);

\PC_entity|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(6));

\ROM|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~1_combout\ = (!\PC_entity|DOUT\(7) & !\PC_entity|DOUT\(6))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~1_combout\);

\ROM|memROM~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~10_combout\ = (!\PC_entity|DOUT\(5) & ((!\PC_entity|DOUT\(3) & ((\PC_entity|DOUT\(4)))) # (\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(4)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110000000000000111000000000000011100000000000001110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~10_combout\);

\ROM|memROM~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~15_combout\ = (\ROM|memROM~1_combout\ & \ROM|memROM~10_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~1_combout\,
	datab => \ROM|ALT_INV_memROM~10_combout\,
	combout => \ROM|memROM~15_combout\);

\mux_PC|saida_MUX[4]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[4]~2_combout\ = ( \PC_Soma_Constante|Add0~9_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~15_combout\) ) ) # ( !\PC_Soma_Constante|Add0~9_sumout\ & ( (\ROM|memROM~15_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~15_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~9_sumout\,
	combout => \mux_PC|saida_MUX[4]~2_combout\);

\PC_entity|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(4));

\ROM|memROM~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~11_combout\ = (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(3) $ (!\PC_entity|DOUT\(4)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000000000000011000000000000001100000000000000110000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(3),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~11_combout\);

\ROM|memROM~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~16_combout\ = (!\PC_entity|DOUT\(7) & \ROM|memROM~11_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \ROM|ALT_INV_memROM~11_combout\,
	combout => \ROM|memROM~16_combout\);

\PC_Soma_Constante|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~17_sumout\ = SUM(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~22\ ))
-- \PC_Soma_Constante|Add0~18\ = CARRY(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(7),
	cin => \PC_Soma_Constante|Add0~22\,
	sumout => \PC_Soma_Constante|Add0~17_sumout\,
	cout => \PC_Soma_Constante|Add0~18\);

\mux_PC|saida_MUX[7]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[7]~4_combout\ = ( \PC_Soma_Constante|Add0~17_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~16_combout\) ) ) # ( !\PC_Soma_Constante|Add0~17_sumout\ & ( (\ROM|memROM~16_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~16_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~17_sumout\,
	combout => \mux_PC|saida_MUX[7]~4_combout\);

\PC_entity|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(7));

\ROM|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~8_combout\ = ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(3)))) ) ) ) # ( !\PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & 
-- (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~8_combout\);

\mux_PC|saida_MUX[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[3]~1_combout\ = ( \PC_Soma_Constante|Add0~5_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~8_combout\) ) ) # ( !\PC_Soma_Constante|Add0~5_sumout\ & ( (\ROM|memROM~8_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~8_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~5_sumout\,
	combout => \mux_PC|saida_MUX[3]~1_combout\);

\PC_entity|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(3));

\ROM|memROM~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~9_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & !\PC_entity|DOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(3),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(7),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~9_combout\);

\mux_PC|saida_MUX[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[2]~0_combout\ = (!\UC|Equal5~1_combout\ & ((\PC_Soma_Constante|Add0~1_sumout\))) # (\UC|Equal5~1_combout\ & (\ROM|memROM~9_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~9_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~1_sumout\,
	combout => \mux_PC|saida_MUX[2]~0_combout\);

\PC_entity|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(2));

\ROM|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~0_combout\ = (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(3) $ (((!\PC_entity|DOUT\(2) & \PC_entity|DOUT\(4))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100011000000000110001100000000011000110000000001100011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~0_combout\);

\ROM|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~2_combout\ = (\ROM|memROM~0_combout\ & \ROM|memROM~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	combout => \ROM|memROM~2_combout\);

\ROM|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~4_combout\ = ( !\PC_entity|DOUT\(7) & ( !\PC_entity|DOUT\(6) & ( (\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(7),
	dataf => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~4_combout\);

\UC|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal0~0_combout\ = (\ROM|memROM~1_combout\ & (\ROM|memROM~3_combout\ & (\ROM|memROM~4_combout\ & \ROM|memROM~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~1_combout\,
	datab => \ROM|ALT_INV_memROM~3_combout\,
	datac => \ROM|ALT_INV_memROM~4_combout\,
	datad => \ROM|ALT_INV_memROM~5_combout\,
	combout => \UC|Equal0~0_combout\);

\ROM|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~6_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & !\PC_entity|DOUT\(7)))) ) )

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
	combout => \ROM|memROM~6_combout\);

\UC_ULA|ula_ctrl[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[2]~0_combout\ = (\ROM|memROM~2_combout\ & (\UC|Equal0~0_combout\ & !\ROM|memROM~6_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \UC|ALT_INV_Equal0~0_combout\,
	datac => \ROM|ALT_INV_memROM~6_combout\,
	combout => \UC_ULA|ula_ctrl[2]~0_combout\);

\ROM|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~7_combout\ = (\ROM|memROM~1_combout\ & \ROM|memROM~5_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~1_combout\,
	datab => \ROM|ALT_INV_memROM~5_combout\,
	combout => \ROM|memROM~7_combout\);

\UC_ULA|ula_ctrl~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~1_combout\ = ( !\PC_entity|DOUT\(5) & ( !\PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(3) & !\PC_entity|DOUT\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(3),
	datad => \PC_entity|ALT_INV_DOUT\(4),
	datae => \PC_entity|ALT_INV_DOUT\(5),
	dataf => \PC_entity|ALT_INV_DOUT\(2),
	combout => \UC_ULA|ula_ctrl~1_combout\);

\UC_ULA|ula_ctrl[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[3]~2_combout\ = ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \UC_ULA|ula_ctrl[3]~2_combout\);

\UC_ULA|ula_ctrl[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[3]~3_combout\ = (!\UC_ULA|ula_ctrl[3]~2_combout\ & (((!\UC_ULA|ula_ctrl~1_combout\) # (\ROM|memROM~8_combout\)) # (\ROM|memROM~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011100000000111101110000000011110111000000001111011100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~7_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl~1_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[3]~2_combout\,
	combout => \UC_ULA|ula_ctrl[3]~3_combout\);

\UC_ULA|ula_ctrl~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~4_combout\ = (\ROM|memROM~8_combout\ & (\UC_ULA|ula_ctrl~1_combout\ & ((!\ROM|memROM~7_combout\) # (!\ROM|memROM~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001110000000000000111000000000000011100000000000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~7_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl~1_combout\,
	combout => \UC_ULA|ula_ctrl~4_combout\);

\UC_ULA|ula_ctrl[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[1]~5_combout\ = (!\ROM|memROM~6_combout\ & ((!\UC_ULA|ula_ctrl[3]~3_combout\ & (!\UC|Equal0~0_combout\)) # (\UC_ULA|ula_ctrl[3]~3_combout\ & ((\UC_ULA|ula_ctrl~4_combout\))))) # (\ROM|memROM~6_combout\ & (!\UC|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001010101110101000101010111010100010101011101010001010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal0~0_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~3_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl~4_combout\,
	combout => \UC_ULA|ula_ctrl[1]~5_combout\);

\UC_ULA|ula_ctrl~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~8_combout\ = ( !\PC_entity|DOUT\(6) & ( !\PC_entity|DOUT\(7) & ( (!\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(5) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	dataf => \PC_entity|ALT_INV_DOUT\(7),
	combout => \UC_ULA|ula_ctrl~8_combout\);

\UC_ULA|ula_ctrl[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[0]~6_combout\ = (!\ROM|memROM~6_combout\ & \UC_ULA|ula_ctrl~8_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~6_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl~8_combout\,
	combout => \UC_ULA|ula_ctrl[0]~6_combout\);

\ULA|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Equal0~0_combout\ = (\UC_ULA|ula_ctrl[2]~0_combout\ & (!\UC_ULA|ula_ctrl[1]~5_combout\ & !\UC_ULA|ula_ctrl[0]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000010000000100000001000000010000000100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\,
	combout => \ULA|Equal0~0_combout\);

\UC_ULA|ula_ctrl[3]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[3]~7_combout\ = ( !\UC_ULA|ula_ctrl[3]~2_combout\ & ( (!\ROM|memROM~6_combout\ & (\ROM|memROM~8_combout\ & \UC_ULA|ula_ctrl~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000000000000000000011000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl~1_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl[3]~2_combout\,
	combout => \UC_ULA|ula_ctrl[3]~7_combout\);

\ROM|memROM~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~12_combout\ = (!\PC_entity|DOUT\(5) & ((!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(2) & \PC_entity|DOUT\(4))) # (\PC_entity|DOUT\(3) & ((!\PC_entity|DOUT\(4))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011100000000000001110000000000000111000000000000011100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~12_combout\);

\ROM|memROM~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~13_combout\ = ( !\PC_entity|DOUT\(7) & ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(7),
	dataf => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~13_combout\);

\ROM|memROM~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~14_combout\ = (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(6) & ((!\PC_entity|DOUT\(3)) # (!\PC_entity|DOUT\(4)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000000000000111000000000000011100000000000001110000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(3),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~14_combout\);

\bancoRegs|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|Equal0~0_combout\ = ( \ROM|memROM~14_combout\ & ( (\PC_entity|DOUT\(7) & !\ROM|memROM~13_combout\) ) ) # ( !\ROM|memROM~14_combout\ & ( (!\ROM|memROM~13_combout\ & (((!\ROM|memROM~12_combout\) # (\PC_entity|DOUT\(6))) # (\PC_entity|DOUT\(7)))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011100000000010101010000000011110111000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~12_combout\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~14_combout\,
	combout => \bancoRegs|Equal0~0_combout\);

\UC|palavraControle[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|palavraControle[4]~0_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~6_combout\ & ( (\ROM|memROM~0_combout\ & \ROM|memROM~1_combout\) ) ) ) # ( \ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( (\ROM|memROM~1_combout\ & 
-- (\ROM|memROM~3_combout\ & ((\ROM|memROM~4_combout\) # (\ROM|memROM~0_combout\)))) ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( (!\ROM|memROM~0_combout\ & (\ROM|memROM~1_combout\ & \ROM|memROM~3_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000010000001100000000000000000001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~4_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~6_combout\,
	combout => \UC|palavraControle[4]~0_combout\);

\ULA|ula0|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_inverteB|saida_MUX~0_combout\ = ( \UC|palavraControle[4]~0_combout\ & ( !\ROM|memROM~9_combout\ $ (!\UC_ULA|ula_ctrl[3]~7_combout\) ) ) # ( !\UC|palavraControle[4]~0_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ 
-- (((!\bancoRegs|registrador~1062_combout\) # (\bancoRegs|Equal0~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011001111010101011010101000110000110011110101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~9_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1062_combout\,
	datac => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datae => \UC|ALT_INV_palavraControle[4]~0_combout\,
	combout => \ULA|ula0|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula0|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~1_combout\ = ( \UC_ULA|ula_ctrl[3]~7_combout\ & ( \ULA|ula0|mux_inverteB|saida_MUX~0_combout\ & ( ((!\UC_ULA|ula_ctrl[1]~5_combout\ & \UC_ULA|ula_ctrl[0]~6_combout\)) # (\UC_ULA|ula_ctrl[2]~0_combout\) ) ) ) # ( 
-- !\UC_ULA|ula_ctrl[3]~7_combout\ & ( \ULA|ula0|mux_inverteB|saida_MUX~0_combout\ & ( (!\UC_ULA|ula_ctrl[1]~5_combout\ $ (!\UC_ULA|ula_ctrl[0]~6_combout\)) # (\UC_ULA|ula_ctrl[2]~0_combout\) ) ) ) # ( \UC_ULA|ula_ctrl[3]~7_combout\ & ( 
-- !\ULA|ula0|mux_inverteB|saida_MUX~0_combout\ & ( (!\UC_ULA|ula_ctrl[2]~0_combout\ & (\UC_ULA|ula_ctrl[1]~5_combout\ & !\UC_ULA|ula_ctrl[0]~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000000010000001111101011111010101110101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	dataf => \ULA|ula0|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~1_combout\);

\ULA|ula0|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~0_combout\ = (!\UC_ULA|ula_ctrl[2]~0_combout\ & (\UC_ULA|ula_ctrl[1]~5_combout\ & \UC_ULA|ula_ctrl[0]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000000010000000100000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~0_combout\);

\ULA|ula0|mux_ula|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|Equal0~0_combout\ = ( \UC_ULA|ula_ctrl~4_combout\ & ( (!\UC|Equal0~0_combout\) # ((!\ROM|memROM~2_combout\ & (!\ROM|memROM~6_combout\ & \UC_ULA|ula_ctrl[3]~3_combout\))) ) ) # ( !\UC_ULA|ula_ctrl~4_combout\ & ( (!\UC|Equal0~0_combout\ & 
-- ((!\UC_ULA|ula_ctrl[3]~3_combout\) # (\ROM|memROM~6_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000001100110011001110110011001100000011001100110011101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \UC|ALT_INV_Equal0~0_combout\,
	datac => \ROM|ALT_INV_memROM~6_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[3]~3_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~4_combout\,
	combout => \ULA|ula0|mux_ula|Equal0~0_combout\);

\ULA|ula19|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~0_combout\ = ( !\UC_ULA|ula_ctrl[0]~6_combout\ & ( (!\UC_ULA|ula_ctrl[1]~5_combout\ & ((!\ROM|memROM~2_combout\) # (!\UC|Equal0~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111000000000000000000000000011101110000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \UC|ALT_INV_Equal0~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~0_combout\);

\ULA|ula19|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~1_combout\ = ( \UC_ULA|ula_ctrl~4_combout\ & ( \UC_ULA|ula_ctrl~8_combout\ & ( (!\ROM|memROM~6_combout\ & (((!\UC|Equal0~0_combout\) # (\UC_ULA|ula_ctrl[3]~3_combout\)) # (\ROM|memROM~2_combout\))) ) ) ) # ( 
-- !\UC_ULA|ula_ctrl~4_combout\ & ( \UC_ULA|ula_ctrl~8_combout\ & ( (!\ROM|memROM~6_combout\ & ((!\UC|Equal0~0_combout\ & ((!\UC_ULA|ula_ctrl[3]~3_combout\))) # (\UC|Equal0~0_combout\ & (\ROM|memROM~2_combout\)))) ) ) ) # ( \UC_ULA|ula_ctrl~4_combout\ & ( 
-- !\UC_ULA|ula_ctrl~8_combout\ & ( (\UC|Equal0~0_combout\ & (!\ROM|memROM~6_combout\ & ((!\UC_ULA|ula_ctrl[3]~3_combout\) # (\ROM|memROM~2_combout\)))) ) ) ) # ( !\UC_ULA|ula_ctrl~4_combout\ & ( !\UC_ULA|ula_ctrl~8_combout\ & ( (!\ROM|memROM~6_combout\ & 
-- ((\UC_ULA|ula_ctrl[3]~3_combout\) # (\UC|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011110000001100000001000011010000000100001101000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \UC|ALT_INV_Equal0~0_combout\,
	datac => \ROM|ALT_INV_memROM~6_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[3]~3_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~4_combout\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~8_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~1_combout\);

\ULA|ula14|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula14|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula14|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula13|soma_sub|saida_xor2~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula14|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[14]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[14]~14_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula14|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[14]~14_combout\);

\UC|sel_mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|sel_mux4~0_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~6_combout\ & ( (!\ROM|memROM~1_combout\ & (((\ROM|memROM~4_combout\)))) # (\ROM|memROM~1_combout\ & (\ROM|memROM~3_combout\ & ((\ROM|memROM~4_combout\) # (\ROM|memROM~0_combout\)))) ) ) ) 
-- # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~6_combout\ & ( (\ROM|memROM~4_combout\ & ((!\ROM|memROM~1_combout\) # ((!\ROM|memROM~0_combout\ & !\ROM|memROM~3_combout\)))) ) ) ) # ( \ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( 
-- (!\ROM|memROM~1_combout\) # ((\ROM|memROM~3_combout\ & \ROM|memROM~4_combout\)) ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( (!\ROM|memROM~1_combout\) # ((!\ROM|memROM~0_combout\ & !\ROM|memROM~3_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110110011101100110011001100111100000000111011000000000111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~4_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~6_combout\,
	combout => \UC|sel_mux4~0_combout\);

\UC|Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal3~0_combout\ = ( \ROM|memROM~6_combout\ & ( (\ROM|memROM~0_combout\ & (\ROM|memROM~1_combout\ & (!\ROM|memROM~3_combout\ & \ROM|memROM~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~5_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	combout => \UC|Equal3~0_combout\);

\bancoRegs|saidaA[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[1]~0_combout\ = (\ROM|memROM~1_combout\ & \ROM|memROM~12_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~1_combout\,
	datab => \ROM|ALT_INV_memROM~12_combout\,
	combout => \bancoRegs|saidaA[1]~0_combout\);

\ULA|ula1|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (\bancoRegs|saidaA[1]~0_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (\bancoRegs|saidaA[1]~0_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( 
-- (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~0_combout\)))) # (\ULA|ula0|mux_ula|Equal0~0_combout\ & (!\ULA|ula0|soma_sub|carry_out~combout\ $ (!\bancoRegs|saidaA[1]~0_combout\ $ 
-- (\ULA|ula1|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111011101011000000000000111100000000101010100000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datac => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	datad => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula1|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[1]~1_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula1|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[1]~1_combout\);

\bancoRegs|saidaB[1]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[1]~21_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1066_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1066_combout\,
	combout => \bancoRegs|saidaB[1]~21_combout\);

\bancoRegs|saidaB[3]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[3]~23_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1074_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \bancoRegs|saidaB[3]~23_combout\);

\bancoRegs|saidaB[4]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[4]~24_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1078_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1078_combout\,
	combout => \bancoRegs|saidaB[4]~24_combout\);

\ULA|ula19|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~2_combout\ = ( \UC_ULA|ula_ctrl~4_combout\ & ( \UC_ULA|ula_ctrl~8_combout\ & ( (!\UC|Equal0~0_combout\ & \ROM|memROM~6_combout\) ) ) ) # ( !\UC_ULA|ula_ctrl~4_combout\ & ( \UC_ULA|ula_ctrl~8_combout\ & ( 
-- (!\UC|Equal0~0_combout\ & \ROM|memROM~6_combout\) ) ) ) # ( \UC_ULA|ula_ctrl~4_combout\ & ( !\UC_ULA|ula_ctrl~8_combout\ & ( (!\UC|Equal0~0_combout\) # ((!\ROM|memROM~2_combout\ & (!\ROM|memROM~6_combout\ & \UC_ULA|ula_ctrl[3]~3_combout\))) ) ) ) # ( 
-- !\UC_ULA|ula_ctrl~4_combout\ & ( !\UC_ULA|ula_ctrl~8_combout\ & ( (!\UC|Equal0~0_combout\ & ((!\UC_ULA|ula_ctrl[3]~3_combout\) # (\ROM|memROM~6_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000001100110011001110110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \UC|ALT_INV_Equal0~0_combout\,
	datac => \ROM|ALT_INV_memROM~6_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[3]~3_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~4_combout\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~8_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~2_combout\);

\bancoRegs|saidaB[5]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[5]~25_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1082_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1082_combout\,
	combout => \bancoRegs|saidaB[5]~25_combout\);

\bancoRegs|saidaB[6]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[6]~26_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1086_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1086_combout\,
	combout => \bancoRegs|saidaB[6]~26_combout\);

\bancoRegs|saidaB[7]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[7]~27_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1090_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1090_combout\,
	combout => \bancoRegs|saidaB[7]~27_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[7]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[7]~6_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[7]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[7]~7_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[7]~6_combout\);

\UC|palavraControle[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|palavraControle\(0) = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~6_combout\ & ( (\ROM|memROM~1_combout\ & ((!\ROM|memROM~3_combout\ & (\ROM|memROM~0_combout\)) # (\ROM|memROM~3_combout\ & ((\ROM|memROM~4_combout\))))) ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~6_combout\ & ( (!\ROM|memROM~1_combout\ & ((!\ROM|memROM~4_combout\))) # (\ROM|memROM~1_combout\ & (\ROM|memROM~3_combout\ & \ROM|memROM~4_combout\)) ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( (!\ROM|memROM~4_combout\ 
-- & ((!\ROM|memROM~1_combout\) # ((!\ROM|memROM~0_combout\ & !\ROM|memROM~3_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110110000000000110011000000001100000000000000000001000000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~4_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~6_combout\,
	combout => \UC|palavraControle\(0));

\mux_rt_rd|saida_MUX[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_rd|saida_MUX[0]~0_combout\ = ( \ROM|memROM~13_combout\ & ( \UC|Equal5~0_combout\ ) ) # ( \ROM|memROM~13_combout\ & ( !\UC|Equal5~0_combout\ & ( (\ROM|memROM~1_combout\ & (((\ROM|memROM~5_combout\) # (\ROM|memROM~3_combout\)) # 
-- (\ROM|memROM~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100110011001100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~5_combout\,
	datae => \ROM|ALT_INV_memROM~13_combout\,
	dataf => \UC|ALT_INV_Equal5~0_combout\,
	combout => \mux_rt_rd|saida_MUX[0]~0_combout\);

\mux_rt_rd|saida_MUX[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_rd|saida_MUX[3]~1_combout\ = ( \ROM|memROM~11_combout\ & ( !\UC|Equal5~0_combout\ & ( (!\ROM|memROM~1_combout\) # ((!\ROM|memROM~0_combout\ & (!\ROM|memROM~3_combout\ & !\ROM|memROM~5_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~5_combout\,
	datae => \ROM|ALT_INV_memROM~11_combout\,
	dataf => \UC|ALT_INV_Equal5~0_combout\,
	combout => \mux_rt_rd|saida_MUX[3]~1_combout\);

\mux_rt_rd|saida_MUX[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_rd|saida_MUX[3]~2_combout\ = ( \ROM|memROM~14_combout\ & ( \UC|Equal5~0_combout\ ) ) # ( \ROM|memROM~14_combout\ & ( !\UC|Equal5~0_combout\ & ( (\ROM|memROM~1_combout\ & (((\ROM|memROM~5_combout\) # (\ROM|memROM~3_combout\)) # 
-- (\ROM|memROM~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100110011001100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~1_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~5_combout\,
	datae => \ROM|ALT_INV_memROM~14_combout\,
	dataf => \UC|ALT_INV_Equal5~0_combout\,
	combout => \mux_rt_rd|saida_MUX[3]~2_combout\);

\bancoRegs|registrador~1318\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1318_combout\ = ( \mux_rt_rd|saida_MUX[3]~1_combout\ & ( \mux_rt_rd|saida_MUX[3]~2_combout\ & ( (!\PC_entity|DOUT\(7) & (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\)) ) ) ) # ( !\mux_rt_rd|saida_MUX[3]~1_combout\ & 
-- ( \mux_rt_rd|saida_MUX[3]~2_combout\ & ( (!\PC_entity|DOUT\(7) & (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\)) ) ) ) # ( \mux_rt_rd|saida_MUX[3]~1_combout\ & ( !\mux_rt_rd|saida_MUX[3]~2_combout\ & ( (!\PC_entity|DOUT\(7) & 
-- (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000000010000000100000001000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \UC|ALT_INV_palavraControle\(0),
	datac => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datae => \mux_rt_rd|ALT_INV_saida_MUX[3]~1_combout\,
	dataf => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	combout => \bancoRegs|registrador~1318_combout\);

\bancoRegs|registrador~301\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[7]~6_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~301_q\);

\ROM|memROM~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~18_combout\ = ( \PC_entity|DOUT\(6) ) # ( !\PC_entity|DOUT\(6) & ( (((\PC_entity|DOUT\(3) & \PC_entity|DOUT\(4))) # (\PC_entity|DOUT\(5))) # (\PC_entity|DOUT\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011111111111111111111111111101010111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~18_combout\);

\ROM|memROM~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~17_combout\ = ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(3)))) ) ) ) # ( !\PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) 
-- & (!\PC_entity|DOUT\(6) & \PC_entity|DOUT\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~17_combout\);

\bancoRegs|registrador~1319\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1319_combout\ = ( \mux_rt_rd|saida_MUX[3]~1_combout\ & ( \mux_rt_rd|saida_MUX[3]~2_combout\ & ( (\PC_entity|DOUT\(7) & (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\)) ) ) ) # ( !\mux_rt_rd|saida_MUX[3]~1_combout\ & 
-- ( \mux_rt_rd|saida_MUX[3]~2_combout\ & ( (\PC_entity|DOUT\(7) & (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\)) ) ) ) # ( \mux_rt_rd|saida_MUX[3]~1_combout\ & ( !\mux_rt_rd|saida_MUX[3]~2_combout\ & ( (\PC_entity|DOUT\(7) & 
-- (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\)) ) ) ) # ( !\mux_rt_rd|saida_MUX[3]~1_combout\ & ( !\mux_rt_rd|saida_MUX[3]~2_combout\ & ( (\UC|palavraControle\(0) & !\mux_rt_rd|saida_MUX[0]~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \UC|ALT_INV_palavraControle\(0),
	datac => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datae => \mux_rt_rd|ALT_INV_saida_MUX[3]~1_combout\,
	dataf => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	combout => \bancoRegs|registrador~1319_combout\);

\bancoRegs|registrador~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[7]~6_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~45_q\);

\bancoRegs|registrador~1218\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1218_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~45_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~45_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1218_combout\);

\bancoRegs|registrador~1090\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1090_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1218_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1218_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1218_combout\ & ( (\bancoRegs|registrador~301_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~301_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1218_combout\,
	combout => \bancoRegs|registrador~1090_combout\);

\ULA|ula7|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1090_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1090_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1090_combout\,
	combout => \ULA|ula7|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula7|soma_sub|saida\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|soma_sub|saida~combout\ = ( \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula5|soma_sub|carry_out~combout\) # (!\ULA|ula6|mux_inverteB|saida_MUX~0_combout\) ) ) # ( !\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( 
-- (\ULA|ula5|soma_sub|carry_out~combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111110101111101000000101000001011111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|soma_sub|saida~combout\);

\ULA|ula7|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula7|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[7]~7_combout\ = ( \ULA|ula7|soma_sub|saida~combout\ & ( \ULA|ula7|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula7|soma_sub|saida~combout\ & ( 
-- \ULA|ula7|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula7|soma_sub|saida~combout\ & ( !\ULA|ula7|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & 
-- (!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & \ULA|ula19|mux_ula|saida_MUX~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010000000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula7|soma_sub|ALT_INV_saida~combout\,
	dataf => \ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[7]~7_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[6]~5_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[6]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[6]~6_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[6]~5_combout\);

\bancoRegs|registrador~300\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[6]~5_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~300_q\);

\bancoRegs|registrador~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[6]~5_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~44_q\);

\bancoRegs|registrador~1214\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1214_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~44_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~44_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1214_combout\);

\bancoRegs|registrador~1086\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1086_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1214_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1214_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1214_combout\ & ( (\bancoRegs|registrador~300_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~300_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1214_combout\,
	combout => \bancoRegs|registrador~1086_combout\);

\ULA|ula6|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1086_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1086_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1086_combout\,
	combout => \ULA|ula6|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula6|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula6|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula5|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula6|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[6]~6_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[6]~6_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[5]~4_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[5]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[5]~5_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[5]~4_combout\);

\bancoRegs|registrador~299\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[5]~4_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~299_q\);

\bancoRegs|registrador~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[5]~4_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~43_q\);

\bancoRegs|registrador~1210\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1210_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~43_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~43_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1210_combout\);

\bancoRegs|registrador~1082\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1082_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1210_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1210_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1210_combout\ & ( (\bancoRegs|registrador~299_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~299_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1210_combout\,
	combout => \bancoRegs|registrador~1082_combout\);

\ULA|ula5|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1082_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~16_combout\)))) ) ) # ( !\bancoRegs|registrador~1082_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~16_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~16_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1082_combout\,
	combout => \ULA|ula5|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula5|soma_sub|saida\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|saida~combout\ = ( \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula4|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula3|soma_sub|saida_xor2~combout\ & !\ULA|ula3|mux_ula|saida_MUX~0_combout\)) ) ) # ( 
-- !\ULA|ula5|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula4|mux_inverteB|saida_MUX~0_combout\ & ((\ULA|ula3|mux_ula|saida_MUX~0_combout\) # (\ULA|ula3|soma_sub|saida_xor2~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001110111000000000111011111111111100010001111111110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula5|soma_sub|saida~combout\);

\ULA|ula5|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula5|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula5|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[5]~5_combout\ = ( \ULA|ula5|soma_sub|saida~combout\ & ( \ULA|ula5|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula5|soma_sub|saida~combout\ & ( 
-- \ULA|ula5|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula5|soma_sub|saida~combout\ & ( !\ULA|ula5|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & 
-- (!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & \ULA|ula19|mux_ula|saida_MUX~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010000000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula5|soma_sub|ALT_INV_saida~combout\,
	dataf => \ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[5]~5_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[4]~3_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[4]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[4]~4_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[4]~3_combout\);

\bancoRegs|registrador~298\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[4]~3_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~298_q\);

\bancoRegs|registrador~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[4]~3_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~42_q\);

\bancoRegs|registrador~1206\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1206_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~42_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~42_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1206_combout\);

\bancoRegs|registrador~1078\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1078_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1206_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1206_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1206_combout\ & ( (\bancoRegs|registrador~298_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~298_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1206_combout\,
	combout => \bancoRegs|registrador~1078_combout\);

\ULA|ula4|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1078_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1078_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1078_combout\,
	combout => \ULA|ula4|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula4|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula19|mux_ula|saida_MUX~2_combout\ & ( !\ULA|ula4|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula3|soma_sub|saida_xor2~combout\ & !\ULA|ula3|mux_ula|saida_MUX~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011101111000100000000000000000000111011110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|ula4|mux_ula|saida_MUX~0_combout\);

\ULA|ula4|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula4|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula4|mux_ula|saida_MUX~1_combout\);

\ULA|resultado_final[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[4]~4_combout\ = ( \ULA|ula4|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula4|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula4|mux_ula|saida_MUX~0_combout\ & ( 
-- \ULA|ula4|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula4|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula4|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula4|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[4]~4_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[3]~2_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[3]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[3]~3_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[3]~2_combout\);

\bancoRegs|registrador~297\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[3]~2_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~297_q\);

\bancoRegs|registrador~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[3]~2_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~41_q\);

\bancoRegs|registrador~1202\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1202_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~41_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~41_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1202_combout\);

\bancoRegs|registrador~1074\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1074_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1202_combout\ ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1202_combout\ ) ) # ( \ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1202_combout\ & 
-- ( !\ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1202_combout\ & ( (\bancoRegs|registrador~297_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000111111110000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~297_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1202_combout\,
	combout => \bancoRegs|registrador~1074_combout\);

\ULA|ula3|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|mux_ula|saida_MUX~0_combout\ = ( \bancoRegs|saidaA[1]~0_combout\ & ( \bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # 
-- (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~7_combout\)))) ) ) ) # ( \bancoRegs|saidaA[1]~0_combout\ & ( !\bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~7_combout\) # 
-- (!\UC|palavraControle[4]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110101101000000000000000001100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~7_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \ULA|ula3|mux_ula|saida_MUX~0_combout\);

\bancoRegs|saidaB[2]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[2]~22_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1070_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1070_combout\,
	combout => \bancoRegs|saidaB[2]~22_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[2]~1_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[2]~2_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[2]~1_combout\);

\bancoRegs|registrador~296\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[2]~1_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~296_q\);

\bancoRegs|registrador~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[2]~1_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~40_q\);

\bancoRegs|registrador~1198\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1198_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~40_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~40_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1198_combout\);

\bancoRegs|registrador~1070\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1070_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1198_combout\ ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1198_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( 
-- !\bancoRegs|registrador~1198_combout\ & ( (\bancoRegs|registrador~296_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~296_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1198_combout\,
	combout => \bancoRegs|registrador~1070_combout\);

\ULA|ula2|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1070_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~15_combout\)))) ) ) # ( !\bancoRegs|registrador~1070_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~15_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~15_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1070_combout\,
	combout => \ULA|ula2|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula3|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_xor~combout\ = ( \bancoRegs|saidaA[1]~0_combout\ & ( \bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|Equal0~0_combout\))) # 
-- (\UC|palavraControle[4]~0_combout\ & (\ROM|memROM~7_combout\)))) ) ) ) # ( !\bancoRegs|saidaA[1]~0_combout\ & ( \bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & 
-- ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~7_combout\)))) ) ) ) # ( \bancoRegs|saidaA[1]~0_combout\ & ( !\bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((\ROM|memROM~7_combout\ & 
-- \UC|palavraControle[4]~0_combout\))) ) ) ) # ( !\bancoRegs|saidaA[1]~0_combout\ & ( !\bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~7_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010111100001010010111000011010110100011110010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~7_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \ULA|ula3|soma_sub|saida_xor~combout\);

\ULA|ula3|soma_sub|saida\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida~combout\ = ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula3|soma_sub|saida_xor~combout\ & ( (!\ULA|ula0|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[1]~0_combout\) # 
-- (!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\))) # (\ULA|ula0|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[1]~0_combout\ & !\ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) ) ) ) # ( !\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( 
-- \ULA|ula3|soma_sub|saida_xor~combout\ ) ) # ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( !\ULA|ula3|soma_sub|saida_xor~combout\ & ( (!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~0_combout\ & 
-- \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula0|soma_sub|carry_out~combout\ & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000101110001011111111111111111111110100011101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula3|soma_sub|saida~combout\);

\ULA|ula3|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~7_combout\)))) ) ) # ( !\bancoRegs|registrador~1074_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~7_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~7_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \ULA|ula3|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula3|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (((\bancoRegs|saidaA[1]~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~1_combout\)) # (\ULA|ula3|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000001010001010100000101000101010000010100010101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	datac => \ULA|ula3|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula3|mux_ula|saida_MUX~1_combout\);

\ULA|resultado_final[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[3]~3_combout\ = ( \ULA|ula3|soma_sub|saida~combout\ & ( \ULA|ula3|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & ((!\ULA|ula19|mux_ula|saida_MUX~0_combout\) # (\ULA|ula3|mux_ula|saida_MUX~0_combout\))) ) ) ) # ( 
-- !\ULA|ula3|soma_sub|saida~combout\ & ( \ULA|ula3|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & ((!\ULA|ula19|mux_ula|saida_MUX~0_combout\) # (\ULA|ula3|mux_ula|saida_MUX~0_combout\))) ) ) ) # ( \ULA|ula3|soma_sub|saida~combout\ & ( 
-- !\ULA|ula3|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & ((!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ((\ULA|ula19|mux_ula|saida_MUX~2_combout\))) # (\ULA|ula19|mux_ula|saida_MUX~0_combout\ & (\ULA|ula3|mux_ula|saida_MUX~0_combout\)))) ) ) ) 
-- # ( !\ULA|ula3|soma_sub|saida~combout\ & ( !\ULA|ula3|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & (\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula19|mux_ula|saida_MUX~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000101010001010100010101000101010001010100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula3|soma_sub|ALT_INV_saida~combout\,
	dataf => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[3]~3_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[1]~0_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[1]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[1]~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[1]~0_combout\);

\bancoRegs|registrador~295\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[1]~0_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~295_q\);

\bancoRegs|registrador~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[1]~0_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~39_q\);

\bancoRegs|registrador~1194\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1194_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~39_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~39_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1194_combout\);

\bancoRegs|registrador~1066\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1066_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1194_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1194_combout\ ) ) # ( \ROM|memROM~17_combout\ & ( 
-- !\bancoRegs|registrador~1194_combout\ & ( !\ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1194_combout\ & ( (\bancoRegs|registrador~295_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000111111110000000011111111111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~295_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1194_combout\,
	combout => \bancoRegs|registrador~1066_combout\);

\ULA|ula1|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1066_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~8_combout\)))) ) ) # ( !\bancoRegs|registrador~1066_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~8_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~8_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1066_combout\,
	combout => \ULA|ula1|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula2|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~2_combout\ & ( (!\ULA|ula0|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[1]~0_combout\) # 
-- (!\ULA|ula1|mux_inverteB|saida_MUX~0_combout\))) # (\ULA|ula0|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[1]~0_combout\ & !\ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) ) ) ) # ( !\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( 
-- \ULA|ula19|mux_ula|saida_MUX~2_combout\ & ( (!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~0_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula0|soma_sub|carry_out~combout\ & 
-- ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010111000101111110100011101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\ULA|ula2|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula2|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula2|mux_ula|saida_MUX~1_combout\);

\ULA|resultado_final[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[2]~2_combout\ = ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( 
-- \ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula2|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula2|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[2]~2_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 14,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[14]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[14]~13_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[14]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[14]~14_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a14~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[14]~13_combout\);

\bancoRegs|registrador~308\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[14]~13_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~308_q\);

\bancoRegs|registrador~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[14]~13_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~52_q\);

\bancoRegs|registrador~1246\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1246_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~52_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~52_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1246_combout\);

\bancoRegs|registrador~1118\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1118_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1246_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1246_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1246_combout\ & ( (\bancoRegs|registrador~308_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~308_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1246_combout\,
	combout => \bancoRegs|registrador~1118_combout\);

\bancoRegs|saidaB[14]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[14]~1_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1118_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1118_combout\,
	combout => \bancoRegs|saidaB[14]~1_combout\);

\ULA|ula14|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[14]~1_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~16_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[14]~1_combout\,
	combout => \ULA|ula14|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula14|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|soma_sub|carry_out~combout\ = (\ULA|ula13|soma_sub|saida_xor2~combout\ & \ULA|ula14|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula14|soma_sub|carry_out~combout\);

\ULA|resultado_final[15]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[15]~15_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula15|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[15]~15_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 15,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[15]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[15]~14_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[15]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[15]~15_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a15~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[15]~14_combout\);

\bancoRegs|registrador~309\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[15]~14_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~309_q\);

\bancoRegs|registrador~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[15]~14_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~53_q\);

\bancoRegs|registrador~1250\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1250_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~53_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~53_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1250_combout\);

\bancoRegs|registrador~1122\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1122_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1250_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1250_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1250_combout\ & ( (\bancoRegs|registrador~309_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~309_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1250_combout\,
	combout => \bancoRegs|registrador~1122_combout\);

\bancoRegs|saidaB[15]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[15]~2_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1122_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1122_combout\,
	combout => \bancoRegs|saidaB[15]~2_combout\);

\ULA|ula15|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[15]~2_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[15]~2_combout\,
	combout => \ULA|ula15|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula15|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula15|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula15|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula14|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula14|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula15|mux_ula|saida_MUX~0_combout\);

\ULA|ula24|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & \ULA|ula19|mux_ula|saida_MUX~2_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|ula24|mux_ula|saida_MUX~0_combout\);

\ULA|ula31|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula31|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000000100010000000000010001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[31]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[31]~22_combout\ = ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\) # (\ULA|ula15|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( 
-- \ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\) # (\ULA|ula15|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & 
-- (!\ULA|ula30|soma_sub|carry_out~combout\ $ ((!\ULA|ula31|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|Equal0~0_combout\ & (((\ULA|ula15|mux_ula|saida_MUX~0_combout\)))) ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (\ULA|Equal0~0_combout\ & \ULA|ula15|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101001010000111110110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[31]~22_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 31,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 31,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[31]~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[31]~30_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[31]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[31]~22_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a31~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[31]~30_combout\);

\bancoRegs|registrador~325\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[31]~30_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~325_q\);

\bancoRegs|registrador~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[31]~30_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~69_q\);

\bancoRegs|registrador~1314\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1314_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~69_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~69_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1314_combout\);

\bancoRegs|registrador~1186\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1186_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1314_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1314_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1314_combout\ & ( (\bancoRegs|registrador~325_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~325_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1314_combout\,
	combout => \bancoRegs|registrador~1186_combout\);

\bancoRegs|saidaB[31]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[31]~18_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1186_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1186_combout\,
	combout => \bancoRegs|saidaB[31]~18_combout\);

\mux_rt_imediato|saida_MUX[31]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_imediato|saida_MUX[31]~0_combout\ = (!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|saidaB[31]~18_combout\))) # (\UC|palavraControle[4]~0_combout\ & (\ROM|memROM~4_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[31]~18_combout\,
	combout => \mux_rt_imediato|saida_MUX[31]~0_combout\);

\ULA|ula31|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (!\mux_rt_imediato|saida_MUX[31]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datab => \mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\,
	combout => \ULA|ula31|mux_inverteB|saida_MUX~0_combout\);

\bancoRegs|saidaB[0]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[0]~20_combout\ = (\bancoRegs|registrador~1062_combout\ & !\bancoRegs|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1062_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	combout => \bancoRegs|saidaB[0]~20_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[0]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[0]~31_combout\ = ( !\UC|sel_mux4~0_combout\ & ( (((\RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\))) ) ) # ( \UC|sel_mux4~0_combout\ & ( (!\ULA|Equal0~0_combout\ & (((\ULA|ula0|mux_ula|saida_MUX~0_combout\ & 
-- (!\ULA|ula31|mux_inverteB|saida_MUX~0_combout\ $ (!\ULA|ula30|soma_sub|carry_out~combout\)))) # (\ULA|ula0|mux_ula|saida_MUX~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111100001111010100000111000000001111000011110111000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ALT_INV_Equal0~0_combout\,
	datad => \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \UC|ALT_INV_sel_mux4~0_combout\,
	dataf => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datag => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[0]~31_combout\);

\bancoRegs|registrador~294\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[0]~31_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~294_q\);

\bancoRegs|registrador~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[0]~31_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~38_q\);

\bancoRegs|registrador~1190\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1190_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~38_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~38_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1190_combout\);

\bancoRegs|registrador~1062\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1062_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1190_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1190_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- \ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1190_combout\ & ( !\ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1190_combout\ & ( (\bancoRegs|registrador~294_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000111111110000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~294_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1190_combout\,
	combout => \bancoRegs|registrador~1062_combout\);

\ULA|ula0|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|soma_sub|carry_out~combout\ = ( \UC_ULA|ula_ctrl[3]~7_combout\ & ( \UC|palavraControle[4]~0_combout\ & ( !\ROM|memROM~9_combout\ ) ) ) # ( \UC_ULA|ula_ctrl[3]~7_combout\ & ( !\UC|palavraControle[4]~0_combout\ & ( 
-- (!\bancoRegs|registrador~1062_combout\) # (\bancoRegs|Equal0~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111111100000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~9_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1062_combout\,
	datad => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	dataf => \UC|ALT_INV_palavraControle[4]~0_combout\,
	combout => \ULA|ula0|soma_sub|carry_out~combout\);

\ULA|ula3|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_xor2~combout\ = ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula3|soma_sub|saida_xor~combout\ & ( (!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~0_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) 
-- # (\ULA|ula0|soma_sub|carry_out~combout\ & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~0_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula3|soma_sub|saida_xor2~combout\);

\ULA|ula5|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|carry_out~combout\ = ( \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula4|mux_inverteB|saida_MUX~0_combout\ & ((\ULA|ula3|mux_ula|saida_MUX~0_combout\) # (\ULA|ula3|soma_sub|saida_xor2~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000011101110000000001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula5|soma_sub|carry_out~combout\);

\ULA|ula7|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|soma_sub|carry_out~combout\ = ( \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula5|soma_sub|carry_out~combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|soma_sub|carry_out~combout\);

\bancoRegs|saidaB[8]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[8]~19_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1094_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1094_combout\,
	combout => \bancoRegs|saidaB[8]~19_combout\);

\ULA|ula8|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[8]~19_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[8]~19_combout\,
	combout => \ULA|ula8|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula8|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula8|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula8|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula7|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula8|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula8|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[8]~8_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[8]~8_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 8,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[8]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[8]~7_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[8]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[8]~8_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a8~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[8]~7_combout\);

\bancoRegs|registrador~302\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[8]~7_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~302_q\);

\bancoRegs|registrador~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[8]~7_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~46_q\);

\bancoRegs|registrador~1222\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1222_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~46_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~46_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1222_combout\);

\bancoRegs|registrador~1094\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1094_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1222_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1222_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1222_combout\ & ( (\bancoRegs|registrador~302_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~302_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1222_combout\,
	combout => \bancoRegs|registrador~1094_combout\);

\ULA|ula8|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_xor~combout\ = ( \bancoRegs|registrador~1094_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1094_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010000011110101101011000011010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1094_combout\,
	combout => \ULA|ula8|soma_sub|saida_xor~combout\);

\ULA|ula8|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_xor2~combout\ = ( \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula8|soma_sub|saida_xor~combout\ & ( (\ULA|ula5|soma_sub|carry_out~combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula8|soma_sub|saida_xor2~combout\);

\ULA|ula9|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula9|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula9|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula8|soma_sub|saida_xor2~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula9|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[9]~9_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula9|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[9]~9_combout\);

\bancoRegs|saidaB[9]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[9]~28_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1098_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1098_combout\,
	combout => \bancoRegs|saidaB[9]~28_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 9,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[9]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[9]~8_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[9]~9_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[9]~9_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a9~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[9]~8_combout\);

\bancoRegs|registrador~303\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[9]~8_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~303_q\);

\bancoRegs|registrador~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[9]~8_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~47_q\);

\bancoRegs|registrador~1226\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1226_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~47_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~47_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1226_combout\);

\bancoRegs|registrador~1098\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1098_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1226_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1226_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1226_combout\ & ( (\bancoRegs|registrador~303_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~303_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1226_combout\,
	combout => \bancoRegs|registrador~1098_combout\);

\ULA|ula9|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1098_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1098_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1098_combout\,
	combout => \ULA|ula9|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula9|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|soma_sub|carry_out~combout\ = (\ULA|ula8|soma_sub|saida_xor2~combout\ & \ULA|ula9|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula9|soma_sub|carry_out~combout\);

\ULA|ula10|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula10|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula10|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula9|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula9|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula10|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[10]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[10]~10_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula10|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[10]~10_combout\);

\bancoRegs|saidaB[10]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[10]~29_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1102_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1102_combout\,
	combout => \bancoRegs|saidaB[10]~29_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 10,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[10]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[10]~9_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[10]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[10]~10_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a10~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[10]~9_combout\);

\bancoRegs|registrador~304\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[10]~9_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~304_q\);

\bancoRegs|registrador~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[10]~9_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~48_q\);

\bancoRegs|registrador~1230\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1230_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~48_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~48_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1230_combout\);

\bancoRegs|registrador~1102\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1102_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1230_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1230_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1230_combout\ & ( (\bancoRegs|registrador~304_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~304_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1230_combout\,
	combout => \bancoRegs|registrador~1102_combout\);

\ULA|ula10|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1102_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1102_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1102_combout\,
	combout => \ULA|ula10|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula10|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|soma_sub|carry_out~combout\ = ( \ULA|ula10|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula8|soma_sub|saida_xor2~combout\ & \ULA|ula9|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula10|soma_sub|carry_out~combout\);

\ULA|ula11|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula11|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula10|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula11|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[11]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[11]~11_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula11|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[11]~11_combout\);

\bancoRegs|saidaB[11]~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[11]~30_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1106_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1106_combout\,
	combout => \bancoRegs|saidaB[11]~30_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 11,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[11]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[11]~10_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[11]~11_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[11]~11_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a11~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[11]~10_combout\);

\bancoRegs|registrador~305\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[11]~10_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~305_q\);

\bancoRegs|registrador~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[11]~10_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~49_q\);

\bancoRegs|registrador~1234\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1234_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~49_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~49_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1234_combout\);

\bancoRegs|registrador~1106\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1106_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1234_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1234_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1234_combout\ & ( (\bancoRegs|registrador~305_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~305_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1234_combout\,
	combout => \bancoRegs|registrador~1106_combout\);

\ULA|ula11|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1106_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1106_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1106_combout\,
	combout => \ULA|ula11|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula11|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|soma_sub|carry_out~combout\ = (\ULA|ula10|soma_sub|carry_out~combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula11|soma_sub|carry_out~combout\);

\ULA|ula12|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula12|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula11|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula11|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula12|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[12]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[12]~12_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula12|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[12]~12_combout\);

\bancoRegs|saidaB[12]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[12]~31_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1110_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1110_combout\,
	combout => \bancoRegs|saidaB[12]~31_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 12,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[12]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[12]~11_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[12]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[12]~12_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a12~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[12]~11_combout\);

\bancoRegs|registrador~306\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[12]~11_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~306_q\);

\bancoRegs|registrador~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[12]~11_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~50_q\);

\bancoRegs|registrador~1238\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1238_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~50_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~50_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1238_combout\);

\bancoRegs|registrador~1110\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1110_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1238_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1238_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1238_combout\ & ( (\bancoRegs|registrador~306_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~306_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1238_combout\,
	combout => \bancoRegs|registrador~1110_combout\);

\ULA|ula12|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1110_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1110_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010110000110101101000001111010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1110_combout\,
	combout => \ULA|ula12|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula12|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|soma_sub|carry_out~combout\ = ( \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula10|soma_sub|carry_out~combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|soma_sub|carry_out~combout\);

\bancoRegs|saidaB[13]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[13]~0_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1114_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1114_combout\,
	combout => \bancoRegs|saidaB[13]~0_combout\);

\ULA|ula13|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[13]~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[13]~0_combout\,
	combout => \ULA|ula13|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula13|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula13|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula13|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula12|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula13|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula13|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[13]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[13]~13_combout\ = (!\ULA|Equal0~0_combout\ & \ULA|ula13|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[13]~13_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 13,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[13]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[13]~12_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[13]~13_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[13]~13_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a13~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[13]~12_combout\);

\bancoRegs|registrador~307\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[13]~12_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~307_q\);

\bancoRegs|registrador~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[13]~12_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~51_q\);

\bancoRegs|registrador~1242\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1242_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~51_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~51_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1242_combout\);

\bancoRegs|registrador~1114\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1114_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1242_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1242_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1242_combout\ & ( (\bancoRegs|registrador~307_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~307_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1242_combout\,
	combout => \bancoRegs|registrador~1114_combout\);

\ULA|ula13|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_xor~combout\ = ( \bancoRegs|registrador~1114_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((\bancoRegs|Equal0~0_combout\))) # (\UC|palavraControle[4]~0_combout\ & 
-- (!\ROM|memROM~4_combout\)))) ) ) # ( !\bancoRegs|registrador~1114_combout\ & ( !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\ROM|memROM~4_combout\) # (!\UC|palavraControle[4]~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010000011110101101011000011010110101100001101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datad => \UC|ALT_INV_palavraControle[4]~0_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1114_combout\,
	combout => \ULA|ula13|soma_sub|saida_xor~combout\);

\ULA|ula13|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_xor2~combout\ = ( \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula13|soma_sub|saida_xor~combout\ & ( (\ULA|ula10|soma_sub|carry_out~combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula13|soma_sub|saida_xor2~combout\);

\ULA|ula15|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|soma_sub|carry_out~combout\ = ( \ULA|ula15|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula13|soma_sub|saida_xor2~combout\ & \ULA|ula14|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula15|soma_sub|carry_out~combout\);

\ULA|ula16|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula16|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula15|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula16|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[16]~55\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[16]~55_combout\ = ( \ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( ((!\UC_ULA|ula_ctrl[0]~6_combout\ & (!\UC_ULA|ula_ctrl[1]~5_combout\ & \UC_ULA|ula_ctrl[2]~0_combout\))) # (\ULA|ula16|mux_ula|saida_MUX~0_combout\) ) ) # ( 
-- !\ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( (\ULA|ula16|mux_ula|saida_MUX~0_combout\ & (((!\UC_ULA|ula_ctrl[2]~0_combout\) # (\UC_ULA|ula_ctrl[1]~5_combout\)) # (\UC_ULA|ula_ctrl[0]~6_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110111000010001111111100000000111101110000100011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[0]~6_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[1]~5_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~0_combout\,
	datad => \ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[16]~55_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 16,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 16,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[16]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[16]~15_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[16]~55_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[16]~55_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a16~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[16]~15_combout\);

\bancoRegs|registrador~310\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[16]~15_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~310_q\);

\bancoRegs|registrador~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[16]~15_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~54_q\);

\bancoRegs|registrador~1254\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1254_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~54_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~54_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1254_combout\);

\bancoRegs|registrador~1126\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1126_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1254_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1254_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1254_combout\ & ( (\bancoRegs|registrador~310_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~310_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1254_combout\,
	combout => \bancoRegs|registrador~1126_combout\);

\bancoRegs|saidaB[16]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[16]~3_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1126_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1126_combout\,
	combout => \bancoRegs|saidaB[16]~3_combout\);

\ULA|ula16|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[16]~3_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[16]~3_combout\,
	combout => \ULA|ula16|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula16|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|soma_sub|carry_out~combout\ = (\ULA|ula15|soma_sub|carry_out~combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula16|soma_sub|carry_out~combout\);

\ULA|ula17|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula17|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula16|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula16|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula17|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[17]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[17]~16_combout\ = (!\ULA|Equal0~0_combout\ & ((\ULA|ula17|mux_ula|saida_MUX~0_combout\))) # (\ULA|Equal0~0_combout\ & (\ULA|ula1|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula17|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[17]~16_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 17,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 17,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[17]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[17]~16_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[17]~16_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[17]~16_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a17~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[17]~16_combout\);

\bancoRegs|registrador~311\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[17]~16_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~311_q\);

\bancoRegs|registrador~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[17]~16_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~55_q\);

\bancoRegs|registrador~1258\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1258_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~55_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~55_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1258_combout\);

\bancoRegs|registrador~1130\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1130_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1258_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1258_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1258_combout\ & ( (\bancoRegs|registrador~311_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~311_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1258_combout\,
	combout => \bancoRegs|registrador~1130_combout\);

\bancoRegs|saidaB[17]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[17]~4_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1130_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1130_combout\,
	combout => \bancoRegs|saidaB[17]~4_combout\);

\ULA|ula17|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[17]~4_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[17]~4_combout\,
	combout => \ULA|ula17|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula17|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|soma_sub|carry_out~combout\ = ( \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula15|soma_sub|carry_out~combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|soma_sub|carry_out~combout\);

\ULA|ula18|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula18|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula18|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula17|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula18|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[18]~51\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[18]~51_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|Equal0~0_combout\ & ( (\ULA|ula2|mux_ula|saida_MUX~0_combout\) # (\ULA|ula2|mux_ula|saida_MUX~1_combout\) ) ) ) # ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|Equal0~0_combout\ & ( \ULA|ula18|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|Equal0~0_combout\ & ( \ULA|ula18|mux_ula|saida_MUX~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101011111010111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ALT_INV_Equal0~0_combout\,
	combout => \ULA|resultado_final[18]~51_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 18,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 18,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[18]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[18]~17_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[18]~51_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[18]~51_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a18~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[18]~17_combout\);

\bancoRegs|registrador~312\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[18]~17_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~312_q\);

\bancoRegs|registrador~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[18]~17_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~56_q\);

\bancoRegs|registrador~1262\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1262_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~56_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~56_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1262_combout\);

\bancoRegs|registrador~1134\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1134_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1262_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1262_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1262_combout\ & ( (\bancoRegs|registrador~312_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~312_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1262_combout\,
	combout => \bancoRegs|registrador~1134_combout\);

\bancoRegs|saidaB[18]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[18]~5_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1134_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1134_combout\,
	combout => \bancoRegs|saidaB[18]~5_combout\);

\ULA|ula18|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[18]~5_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[18]~5_combout\,
	combout => \ULA|ula18|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula18|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|soma_sub|saida_xor2~combout\ = ( \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula15|soma_sub|carry_out~combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula18|soma_sub|saida_xor2~combout\);

\ULA|ula19|mux_ula|saida_MUX~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~4_combout\ = ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\)) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula0|mux_ula|Equal0~0_combout\ $ (!\ULA|ula19|mux_inverteB|saida_MUX~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101000000000000010100000000001011010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~4_combout\);

\ULA|ula19|mux_ula|saida_MUX~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~3_combout\ = ( \ULA|ula19|mux_ula|saida_MUX~4_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\) # (((!\ULA|ula19|mux_ula|saida_MUX~1_combout\ & \ULA|ula18|soma_sub|saida_xor2~combout\)) # 
-- (\ULA|ula19|mux_ula|saida_MUX~0_combout\)) ) ) # ( !\ULA|ula19|mux_ula|saida_MUX~4_combout\ & ( (\ULA|ula0|mux_ula|Equal0~0_combout\ & (!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula19|mux_ula|saida_MUX~1_combout\ & 
-- !\ULA|ula18|soma_sub|saida_xor2~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000010111011111110111011101111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~4_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~3_combout\);

\ULA|resultado_final[19]~47\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[19]~47_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & ((((\ULA|ula19|mux_ula|saida_MUX~3_combout\))))) # (\ULA|Equal0~0_combout\ & (((\ULA|ula3|soma_sub|saida~combout\ & 
-- (\ULA|ula19|mux_ula|saida_MUX~2_combout\))) # (\ULA|ula3|mux_ula|saida_MUX~1_combout\))) ) ) # ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( (((!\ULA|Equal0~0_combout\ & ((\ULA|ula19|mux_ula|saida_MUX~3_combout\))) # (\ULA|Equal0~0_combout\ & 
-- (\ULA|ula3|mux_ula|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000011111111000000001111111101010111010101110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_saida~combout\,
	datac => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~3_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ALT_INV_Equal0~0_combout\,
	datag => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|resultado_final[19]~47_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 19,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 19,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[19]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[19]~18_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[19]~47_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[19]~47_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a19~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[19]~18_combout\);

\bancoRegs|registrador~313\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[19]~18_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~313_q\);

\bancoRegs|registrador~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[19]~18_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~57_q\);

\bancoRegs|registrador~1266\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1266_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~57_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~57_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1266_combout\);

\bancoRegs|registrador~1138\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1138_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1266_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1266_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1266_combout\ & ( (\bancoRegs|registrador~313_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~313_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1266_combout\,
	combout => \bancoRegs|registrador~1138_combout\);

\bancoRegs|saidaB[19]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[19]~6_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1138_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1138_combout\,
	combout => \bancoRegs|saidaB[19]~6_combout\);

\ULA|ula19|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[19]~6_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[19]~6_combout\,
	combout => \ULA|ula19|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula19|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|soma_sub|carry_out~combout\ = (\ULA|ula18|soma_sub|saida_xor2~combout\ & \ULA|ula19|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula19|soma_sub|carry_out~combout\);

\ULA|ula20|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula20|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula19|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula19|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula20|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[20]~43\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[20]~43_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|Equal0~0_combout\ & ( (\ULA|ula4|mux_ula|saida_MUX~0_combout\) # (\ULA|ula4|mux_ula|saida_MUX~1_combout\) ) ) ) # ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|Equal0~0_combout\ & ( \ULA|ula20|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|Equal0~0_combout\ & ( \ULA|ula20|mux_ula|saida_MUX~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101011111010111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula4|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ALT_INV_Equal0~0_combout\,
	combout => \ULA|resultado_final[20]~43_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 20,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 20,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[20]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[20]~19_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[20]~43_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[20]~43_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a20~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[20]~19_combout\);

\bancoRegs|registrador~314\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[20]~19_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~314_q\);

\bancoRegs|registrador~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[20]~19_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~58_q\);

\bancoRegs|registrador~1270\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1270_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~58_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~58_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1270_combout\);

\bancoRegs|registrador~1142\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1142_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1270_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1270_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1270_combout\ & ( (\bancoRegs|registrador~314_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~314_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1270_combout\,
	combout => \bancoRegs|registrador~1142_combout\);

\bancoRegs|saidaB[20]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[20]~7_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1142_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1142_combout\,
	combout => \bancoRegs|saidaB[20]~7_combout\);

\ULA|ula20|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[20]~7_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[20]~7_combout\,
	combout => \ULA|ula20|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula20|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|soma_sub|carry_out~combout\ = ( \ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula18|soma_sub|saida_xor2~combout\ & \ULA|ula19|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula20|soma_sub|carry_out~combout\);

\ULA|ula21|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula21|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula20|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula21|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[21]~39\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[21]~39_combout\ = ( !\ULA|Equal0~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula21|mux_ula|saida_MUX~0_combout\ ) ) ) # ( \ULA|Equal0~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( 
-- ((\ULA|ula5|soma_sub|saida~combout\ & \ULA|ula19|mux_ula|saida_MUX~2_combout\)) # (\ULA|ula5|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|Equal0~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula21|mux_ula|saida_MUX~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001100110111011100001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_saida~combout\,
	datab => \ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[21]~39_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 21,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 21,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[21]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[21]~20_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[21]~39_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[21]~39_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a21~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[21]~20_combout\);

\bancoRegs|registrador~315\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[21]~20_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~315_q\);

\bancoRegs|registrador~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[21]~20_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~59_q\);

\bancoRegs|registrador~1274\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1274_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~59_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~59_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1274_combout\);

\bancoRegs|registrador~1146\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1146_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1274_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1274_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1274_combout\ & ( (\bancoRegs|registrador~315_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~315_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1274_combout\,
	combout => \bancoRegs|registrador~1146_combout\);

\bancoRegs|saidaB[21]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[21]~8_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1146_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1146_combout\,
	combout => \bancoRegs|saidaB[21]~8_combout\);

\ULA|ula21|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[21]~8_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[21]~8_combout\,
	combout => \ULA|ula21|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula22|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula22|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|mux_ula|saida_MUX~1_combout\);

\ULA|ula22|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~2_combout\ & ( (!\ULA|ula20|soma_sub|carry_out~combout\) # (!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~2_combout\ & ( (\ULA|ula20|soma_sub|carry_out~combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001011111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|ula22|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[22]~35\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[22]~35_combout\ = ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|Equal0~0_combout\ & ( \ULA|ula6|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|Equal0~0_combout\ & ( 
-- \ULA|ula6|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|Equal0~0_combout\ & ( (\ULA|ula22|mux_ula|saida_MUX~0_combout\) # (\ULA|ula22|mux_ula|saida_MUX~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \ULA|ula22|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ALT_INV_Equal0~0_combout\,
	combout => \ULA|resultado_final[22]~35_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 22,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 22,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[22]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[22]~21_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[22]~35_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[22]~35_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a22~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[22]~21_combout\);

\bancoRegs|registrador~316\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[22]~21_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~316_q\);

\bancoRegs|registrador~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[22]~21_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~60_q\);

\bancoRegs|registrador~1278\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1278_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~60_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~60_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1278_combout\);

\bancoRegs|registrador~1150\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1150_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1278_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1278_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1278_combout\ & ( (\bancoRegs|registrador~316_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~316_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1278_combout\,
	combout => \bancoRegs|registrador~1150_combout\);

\bancoRegs|saidaB[22]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[22]~9_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1150_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1150_combout\,
	combout => \bancoRegs|saidaB[22]~9_combout\);

\ULA|ula22|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[22]~9_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[22]~9_combout\,
	combout => \ULA|ula22|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula22|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|soma_sub|carry_out~combout\ = ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula20|soma_sub|carry_out~combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|soma_sub|carry_out~combout\);

\ULA|ula23|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_ula|saida_MUX~0_combout\ = ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula0|mux_ula|Equal0~0_combout\ & \ULA|ula23|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula23|mux_inverteB|saida_MUX~0_combout\ $ (((!\ULA|ula0|mux_ula|Equal0~0_combout\) # (!\ULA|ula22|soma_sub|carry_out~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111101110000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula22|soma_sub|ALT_INV_carry_out~combout\,
	datad => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula23|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[23]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[23]~31_combout\ = ( !\ULA|Equal0~0_combout\ & ( \ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula23|mux_ula|saida_MUX~0_combout\ ) ) ) # ( \ULA|Equal0~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( 
-- ((\ULA|ula7|soma_sub|saida~combout\ & \ULA|ula19|mux_ula|saida_MUX~2_combout\)) # (\ULA|ula7|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|Equal0~0_combout\ & ( !\ULA|ula19|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula23|mux_ula|saida_MUX~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001100110111011100001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula7|soma_sub|ALT_INV_saida~combout\,
	datab => \ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[23]~31_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 23,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 23,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[23]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[23]~22_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[23]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[23]~31_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a23~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[23]~22_combout\);

\bancoRegs|registrador~317\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[23]~22_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~317_q\);

\bancoRegs|registrador~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[23]~22_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~61_q\);

\bancoRegs|registrador~1282\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1282_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~61_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~61_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1282_combout\);

\bancoRegs|registrador~1154\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1154_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1282_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1282_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1282_combout\ & ( (\bancoRegs|registrador~317_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~317_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1282_combout\,
	combout => \bancoRegs|registrador~1154_combout\);

\bancoRegs|saidaB[23]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[23]~10_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1154_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1154_combout\,
	combout => \bancoRegs|saidaB[23]~10_combout\);

\ULA|ula23|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[23]~10_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[23]~10_combout\,
	combout => \ULA|ula23|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula23|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|soma_sub|saida_xor2~combout\ = ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula20|soma_sub|carry_out~combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula23|soma_sub|saida_xor2~combout\);

\ULA|ula24|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|mux_ula|saida_MUX~1_combout\);

\ULA|ula24|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_ula|saida_MUX~2_combout\ = ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula24|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula23|soma_sub|saida_xor2~combout\ $ (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula24|mux_ula|saida_MUX~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111101010100101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula24|mux_ula|saida_MUX~2_combout\);

\ULA|resultado_final[24]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[24]~17_combout\ = (!\ULA|Equal0~0_combout\ & ((!\ULA|ula24|mux_ula|saida_MUX~2_combout\))) # (\ULA|Equal0~0_combout\ & (\ULA|ula8|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000110110001101100011011000110110001101100011011000110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|resultado_final[24]~17_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 24,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 24,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[24]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[24]~23_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[24]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[24]~17_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a24~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[24]~23_combout\);

\bancoRegs|registrador~318\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[24]~23_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~318_q\);

\bancoRegs|registrador~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[24]~23_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~62_q\);

\bancoRegs|registrador~1286\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1286_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~62_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~62_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1286_combout\);

\bancoRegs|registrador~1158\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1158_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1286_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1286_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1286_combout\ & ( (\bancoRegs|registrador~318_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~318_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1286_combout\,
	combout => \bancoRegs|registrador~1158_combout\);

\bancoRegs|saidaB[24]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[24]~11_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1158_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1158_combout\,
	combout => \bancoRegs|saidaB[24]~11_combout\);

\ULA|ula24|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[24]~11_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[24]~11_combout\,
	combout => \ULA|ula24|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula25|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|mux_ula|saida_MUX~0_combout\);

\ULA|ula24|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|soma_sub|carry_out~combout\ = (\ULA|ula23|soma_sub|saida_xor2~combout\ & \ULA|ula24|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|soma_sub|carry_out~combout\);

\ULA|resultado_final[25]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[25]~27_combout\ = ( \ULA|Equal0~0_combout\ & ( \ULA|ula24|soma_sub|carry_out~combout\ & ( \ULA|ula9|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|Equal0~0_combout\ & ( \ULA|ula24|soma_sub|carry_out~combout\ & ( 
-- ((!\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula24|mux_ula|saida_MUX~0_combout\)) # (\ULA|ula25|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|Equal0~0_combout\ & ( !\ULA|ula24|soma_sub|carry_out~combout\ & ( \ULA|ula9|mux_ula|saida_MUX~0_combout\ 
-- ) ) ) # ( !\ULA|Equal0~0_combout\ & ( !\ULA|ula24|soma_sub|carry_out~combout\ & ( ((\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula24|mux_ula|saida_MUX~0_combout\)) # (\ULA|ula25|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100111111010101010101010100110011111100110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ula24|soma_sub|ALT_INV_carry_out~combout\,
	combout => \ULA|resultado_final[25]~27_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 25,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 25,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[25]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[25]~24_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[25]~27_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[25]~27_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a25~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[25]~24_combout\);

\bancoRegs|registrador~319\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[25]~24_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~319_q\);

\bancoRegs|registrador~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[25]~24_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~63_q\);

\bancoRegs|registrador~1290\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1290_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~63_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~63_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1290_combout\);

\bancoRegs|registrador~1162\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1162_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1290_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1290_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1290_combout\ & ( (\bancoRegs|registrador~319_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~319_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1290_combout\,
	combout => \bancoRegs|registrador~1162_combout\);

\bancoRegs|saidaB[25]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[25]~12_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1162_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1162_combout\,
	combout => \bancoRegs|saidaB[25]~12_combout\);

\ULA|ula25|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[25]~12_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[25]~12_combout\,
	combout => \ULA|ula25|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula25|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|soma_sub|carry_out~combout\ = ( \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula23|soma_sub|saida_xor2~combout\ & \ULA|ula24|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|soma_sub|carry_out~combout\);

\ULA|ula26|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula26|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula26|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[26]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[26]~23_combout\ = ( \ULA|Equal0~0_combout\ & ( \ULA|ula25|soma_sub|carry_out~combout\ & ( \ULA|ula10|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|Equal0~0_combout\ & ( \ULA|ula25|soma_sub|carry_out~combout\ & ( 
-- ((!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula24|mux_ula|saida_MUX~0_combout\)) # (\ULA|ula26|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|Equal0~0_combout\ & ( !\ULA|ula25|soma_sub|carry_out~combout\ & ( 
-- \ULA|ula10|mux_ula|saida_MUX~0_combout\ ) ) ) # ( !\ULA|Equal0~0_combout\ & ( !\ULA|ula25|soma_sub|carry_out~combout\ & ( ((\ULA|ula26|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula24|mux_ula|saida_MUX~0_combout\)) # 
-- (\ULA|ula26|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100111111010101010101010100110011111100110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ALT_INV_Equal0~0_combout\,
	dataf => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	combout => \ULA|resultado_final[26]~23_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 26,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 26,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[26]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[26]~25_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[26]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[26]~23_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a26~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[26]~25_combout\);

\bancoRegs|registrador~320\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[26]~25_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~320_q\);

\bancoRegs|registrador~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[26]~25_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~64_q\);

\bancoRegs|registrador~1294\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1294_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~64_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~64_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1294_combout\);

\bancoRegs|registrador~1166\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1166_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1294_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1294_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1294_combout\ & ( (\bancoRegs|registrador~320_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~320_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1294_combout\,
	combout => \bancoRegs|registrador~1166_combout\);

\bancoRegs|saidaB[26]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[26]~13_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1166_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1166_combout\,
	combout => \bancoRegs|saidaB[26]~13_combout\);

\ULA|ula26|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[26]~13_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[26]~13_combout\,
	combout => \ULA|ula26|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula27|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|mux_ula|saida_MUX~0_combout\);

\ULA|ula27|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula27|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula25|soma_sub|carry_out~combout\ & 
-- \ULA|ula26|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula27|mux_ula|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110100000010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula27|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|mux_ula|saida_MUX~1_combout\);

\ULA|resultado_final[27]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[27]~18_combout\ = (!\ULA|Equal0~0_combout\ & ((!\ULA|ula27|mux_ula|saida_MUX~1_combout\))) # (\ULA|Equal0~0_combout\ & (\ULA|ula11|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000110110001101100011011000110110001101100011011000110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[27]~18_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 27,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 27,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[27]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[27]~26_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[27]~18_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[27]~18_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a27~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[27]~26_combout\);

\bancoRegs|registrador~321\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[27]~26_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~321_q\);

\bancoRegs|registrador~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[27]~26_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~65_q\);

\bancoRegs|registrador~1298\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1298_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~65_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~65_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1298_combout\);

\bancoRegs|registrador~1170\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1170_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1298_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1298_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1298_combout\ & ( (\bancoRegs|registrador~321_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~321_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1298_combout\,
	combout => \bancoRegs|registrador~1170_combout\);

\bancoRegs|saidaB[27]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[27]~14_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1170_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1170_combout\,
	combout => \bancoRegs|saidaB[27]~14_combout\);

\ULA|ula27|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[27]~14_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[27]~14_combout\,
	combout => \ULA|ula27|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula27|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|soma_sub|carry_out~combout\ = ( \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula25|soma_sub|carry_out~combout\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|soma_sub|carry_out~combout\);

\ULA|ula28|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula28|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|mux_ula|saida_MUX~0_combout\);

\ULA|resultado_final[28]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[28]~19_combout\ = ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula28|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\) # (\ULA|ula12|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( 
-- \ULA|ula28|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\) # (\ULA|ula12|mux_ula|saida_MUX~0_combout\) ) ) ) # ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula28|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|Equal0~0_combout\ & 
-- (!\ULA|ula27|soma_sub|carry_out~combout\ $ ((!\ULA|ula28|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|Equal0~0_combout\ & (((\ULA|ula12|mux_ula|saida_MUX~0_combout\)))) ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( 
-- !\ULA|ula28|mux_ula|saida_MUX~0_combout\ & ( (\ULA|Equal0~0_combout\ & \ULA|ula12|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101001010000111110110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula27|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|resultado_final[28]~19_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 28,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 28,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[28]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[28]~27_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|resultado_final[28]~19_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_resultado_final[28]~19_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a28~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[28]~27_combout\);

\bancoRegs|registrador~322\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[28]~27_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~322_q\);

\bancoRegs|registrador~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[28]~27_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~66_q\);

\bancoRegs|registrador~1302\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1302_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~66_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~66_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1302_combout\);

\bancoRegs|registrador~1174\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1174_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1302_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1302_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1302_combout\ & ( (\bancoRegs|registrador~322_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~322_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1302_combout\,
	combout => \bancoRegs|registrador~1174_combout\);

\bancoRegs|saidaB[28]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[28]~15_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1174_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1174_combout\,
	combout => \bancoRegs|saidaB[28]~15_combout\);

\ULA|ula28|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[28]~15_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[28]~15_combout\,
	combout => \ULA|ula28|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula28|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|soma_sub|saida_xor2~combout\ = ( \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula25|soma_sub|carry_out~combout\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|soma_sub|saida_xor2~combout\);

\ULA|ula29|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_ula|saida_MUX~0_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula29|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula29|mux_ula|saida_MUX~0_combout\);

\ULA|ula29|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula29|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula28|soma_sub|saida_xor2~combout\ $ (\ULA|ula29|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula29|mux_ula|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111101010100101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula29|mux_ula|saida_MUX~1_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 29,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 29,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[29]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[29]~28_combout\ = ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ & ( (!\UC|sel_mux4~0_combout\) # ((!\ULA|Equal0~0_combout\ & ((!\ULA|ula29|mux_ula|saida_MUX~1_combout\))) # (\ULA|Equal0~0_combout\ & 
-- (\ULA|ula13|mux_ula|saida_MUX~0_combout\))) ) ) # ( !\RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ & ( (\UC|sel_mux4~0_combout\ & ((!\ULA|Equal0~0_combout\ & ((!\ULA|ula29|mux_ula|saida_MUX~1_combout\))) # (\ULA|Equal0~0_combout\ & 
-- (\ULA|ula13|mux_ula|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010110001111111111011000100000000101100011111111110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula29|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \UC|ALT_INV_sel_mux4~0_combout\,
	datae => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a29~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[29]~28_combout\);

\bancoRegs|registrador~323\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[29]~28_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~323_q\);

\bancoRegs|registrador~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[29]~28_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~67_q\);

\bancoRegs|registrador~1306\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1306_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~67_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~67_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1306_combout\);

\bancoRegs|registrador~1178\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1178_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1306_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1306_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1306_combout\ & ( (\bancoRegs|registrador~323_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~323_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1306_combout\,
	combout => \bancoRegs|registrador~1178_combout\);

\bancoRegs|saidaB[29]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[29]~16_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1178_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1178_combout\,
	combout => \bancoRegs|saidaB[29]~16_combout\);

\ULA|ula29|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[29]~16_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[29]~16_combout\,
	combout => \ULA|ula29|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula30|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula28|soma_sub|saida_xor2~combout\) # (!\ULA|ula29|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( 
-- !\ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula28|soma_sub|saida_xor2~combout\ & \ULA|ula29|mux_inverteB|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101011111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|mux_ula|saida_MUX~0_combout\);

\ULA|ula30|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula0|mux_ula|Equal0~0_combout\ & (\ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|mux_ula|ALT_INV_Equal0~0_combout\,
	datac => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|mux_ula|saida_MUX~1_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAMMIPS:RAM|altsyncram:memRAM_rtl_0|altsyncram_abp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 30,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 30,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => \UC|Equal3~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[30]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[30]~29_combout\ = ( \UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ & ( (!\ULA|Equal0~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\) # (\ULA|ula30|mux_ula|saida_MUX~0_combout\)))) # 
-- (\ULA|Equal0~0_combout\ & (\ULA|ula14|mux_ula|saida_MUX~0_combout\)) ) ) ) # ( !\UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ ) ) # ( \UC|sel_mux4~0_combout\ & ( 
-- !\RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ & ( (!\ULA|Equal0~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\) # (\ULA|ula30|mux_ula|saida_MUX~0_combout\)))) # (\ULA|Equal0~0_combout\ & (\ULA|ula14|mux_ula|saida_MUX~0_combout\)) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000110111011101111111111111111110001101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datae => \UC|ALT_INV_sel_mux4~0_combout\,
	dataf => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a30~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[30]~29_combout\);

\bancoRegs|registrador~324\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[30]~29_combout\,
	ena => \bancoRegs|registrador~1318_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~324_q\);

\bancoRegs|registrador~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[30]~29_combout\,
	ena => \bancoRegs|registrador~1319_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~68_q\);

\bancoRegs|registrador~1310\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1310_combout\ = ( !\ROM|memROM~17_combout\ & ( \ROM|memROM~18_combout\ & ( (\bancoRegs|registrador~68_q\ & !\ROM|memROM~13_combout\) ) ) ) # ( \ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) ) # 
-- ( !\ROM|memROM~17_combout\ & ( !\ROM|memROM~18_combout\ & ( \ROM|memROM~13_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~68_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \ROM|ALT_INV_memROM~18_combout\,
	combout => \bancoRegs|registrador~1310_combout\);

\bancoRegs|registrador~1182\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1182_combout\ = ( \ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1310_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( !\ROM|memROM~17_combout\ & ( \bancoRegs|registrador~1310_combout\ & ( \ROM|memROM~18_combout\ ) ) ) # ( 
-- !\ROM|memROM~17_combout\ & ( !\bancoRegs|registrador~1310_combout\ & ( (\bancoRegs|registrador~324_q\ & !\ROM|memROM~18_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~324_q\,
	datad => \ROM|ALT_INV_memROM~18_combout\,
	datae => \ROM|ALT_INV_memROM~17_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1310_combout\,
	combout => \bancoRegs|registrador~1182_combout\);

\bancoRegs|saidaB[30]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[30]~17_combout\ = (!\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1182_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1182_combout\,
	combout => \bancoRegs|saidaB[30]~17_combout\);

\ULA|ula30|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[3]~7_combout\ $ (((!\UC|palavraControle[4]~0_combout\ & ((!\bancoRegs|saidaB[30]~17_combout\))) # (\UC|palavraControle[4]~0_combout\ & (!\ROM|memROM~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011011000110001101101100011000110110110001100011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~4_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datac => \UC|ALT_INV_palavraControle[4]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[30]~17_combout\,
	combout => \ULA|ula30|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula30|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|soma_sub|carry_out~combout\ = ( \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & ( (\ULA|ula28|soma_sub|saida_xor2~combout\ & \ULA|ula29|mux_inverteB|saida_MUX~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\,
	datad => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|soma_sub|carry_out~combout\);

\ULA|resultado_final[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[0]~0_combout\ = ( \ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( !\ULA|Equal0~0_combout\ ) ) # ( !\ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|Equal0~0_combout\ & (\ULA|ula0|mux_ula|saida_MUX~0_combout\ & 
-- (!\ULA|ula30|soma_sub|carry_out~combout\ $ (!\ULA|ula31|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101000101010101010101000000000001010001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datac => \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[0]~0_combout\);

\ULA|resultado_final[29]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[29]~20_combout\ = (!\ULA|Equal0~0_combout\ & ((!\ULA|ula29|mux_ula|saida_MUX~1_combout\))) # (\ULA|Equal0~0_combout\ & (\ULA|ula13|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000110110001101100011011000110110001101100011011000110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula29|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[29]~20_combout\);

\ULA|resultado_final[30]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|resultado_final[30]~21_combout\ = (!\ULA|Equal0~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\) # (\ULA|ula30|mux_ula|saida_MUX~0_combout\)))) # (\ULA|Equal0~0_combout\ & (\ULA|ula14|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101110111011000110111011101100011011101110110001101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ALT_INV_Equal0~0_combout\,
	datab => \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|resultado_final[30]~21_combout\);

\PC_Soma_Constante|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~25_sumout\ = SUM(( \PC_entity|DOUT\(8) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))
-- \PC_Soma_Constante|Add0~26\ = CARRY(( \PC_entity|DOUT\(8) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(8),
	cin => \PC_Soma_Constante|Add0~18\,
	sumout => \PC_Soma_Constante|Add0~25_sumout\,
	cout => \PC_Soma_Constante|Add0~26\);

\mux_PC|saida_MUX[8]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[8]~6_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~25_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~25_sumout\,
	combout => \mux_PC|saida_MUX[8]~6_combout\);

\PC_entity|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[8]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(8));

\PC_Soma_Constante|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~29_sumout\ = SUM(( \PC_entity|DOUT\(9) ) + ( GND ) + ( \PC_Soma_Constante|Add0~26\ ))
-- \PC_Soma_Constante|Add0~30\ = CARRY(( \PC_entity|DOUT\(9) ) + ( GND ) + ( \PC_Soma_Constante|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(9),
	cin => \PC_Soma_Constante|Add0~26\,
	sumout => \PC_Soma_Constante|Add0~29_sumout\,
	cout => \PC_Soma_Constante|Add0~30\);

\mux_PC|saida_MUX[9]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[9]~7_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~29_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~29_sumout\,
	combout => \mux_PC|saida_MUX[9]~7_combout\);

\PC_entity|DOUT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[9]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(9));

\PC_Soma_Constante|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~33_sumout\ = SUM(( \PC_entity|DOUT\(10) ) + ( GND ) + ( \PC_Soma_Constante|Add0~30\ ))
-- \PC_Soma_Constante|Add0~34\ = CARRY(( \PC_entity|DOUT\(10) ) + ( GND ) + ( \PC_Soma_Constante|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(10),
	cin => \PC_Soma_Constante|Add0~30\,
	sumout => \PC_Soma_Constante|Add0~33_sumout\,
	cout => \PC_Soma_Constante|Add0~34\);

\mux_PC|saida_MUX[10]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[10]~8_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~33_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~33_sumout\,
	combout => \mux_PC|saida_MUX[10]~8_combout\);

\PC_entity|DOUT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[10]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(10));

\PC_Soma_Constante|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~37_sumout\ = SUM(( \PC_entity|DOUT\(11) ) + ( GND ) + ( \PC_Soma_Constante|Add0~34\ ))
-- \PC_Soma_Constante|Add0~38\ = CARRY(( \PC_entity|DOUT\(11) ) + ( GND ) + ( \PC_Soma_Constante|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(11),
	cin => \PC_Soma_Constante|Add0~34\,
	sumout => \PC_Soma_Constante|Add0~37_sumout\,
	cout => \PC_Soma_Constante|Add0~38\);

\mux_PC|saida_MUX[11]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[11]~9_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~37_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~37_sumout\,
	combout => \mux_PC|saida_MUX[11]~9_combout\);

\PC_entity|DOUT[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[11]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(11));

\PC_Soma_Constante|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~41_sumout\ = SUM(( \PC_entity|DOUT\(12) ) + ( GND ) + ( \PC_Soma_Constante|Add0~38\ ))
-- \PC_Soma_Constante|Add0~42\ = CARRY(( \PC_entity|DOUT\(12) ) + ( GND ) + ( \PC_Soma_Constante|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(12),
	cin => \PC_Soma_Constante|Add0~38\,
	sumout => \PC_Soma_Constante|Add0~41_sumout\,
	cout => \PC_Soma_Constante|Add0~42\);

\mux_PC|saida_MUX[12]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[12]~10_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~41_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~41_sumout\,
	combout => \mux_PC|saida_MUX[12]~10_combout\);

\PC_entity|DOUT[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[12]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(12));

\PC_Soma_Constante|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~45_sumout\ = SUM(( \PC_entity|DOUT\(13) ) + ( GND ) + ( \PC_Soma_Constante|Add0~42\ ))
-- \PC_Soma_Constante|Add0~46\ = CARRY(( \PC_entity|DOUT\(13) ) + ( GND ) + ( \PC_Soma_Constante|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(13),
	cin => \PC_Soma_Constante|Add0~42\,
	sumout => \PC_Soma_Constante|Add0~45_sumout\,
	cout => \PC_Soma_Constante|Add0~46\);

\mux_PC|saida_MUX[13]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[13]~11_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~45_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~45_sumout\,
	combout => \mux_PC|saida_MUX[13]~11_combout\);

\PC_entity|DOUT[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[13]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(13));

\PC_Soma_Constante|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~49_sumout\ = SUM(( \PC_entity|DOUT\(14) ) + ( GND ) + ( \PC_Soma_Constante|Add0~46\ ))
-- \PC_Soma_Constante|Add0~50\ = CARRY(( \PC_entity|DOUT\(14) ) + ( GND ) + ( \PC_Soma_Constante|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(14),
	cin => \PC_Soma_Constante|Add0~46\,
	sumout => \PC_Soma_Constante|Add0~49_sumout\,
	cout => \PC_Soma_Constante|Add0~50\);

\mux_PC|saida_MUX[14]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[14]~12_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~49_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~49_sumout\,
	combout => \mux_PC|saida_MUX[14]~12_combout\);

\PC_entity|DOUT[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[14]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(14));

\PC_Soma_Constante|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~53_sumout\ = SUM(( \PC_entity|DOUT\(15) ) + ( GND ) + ( \PC_Soma_Constante|Add0~50\ ))
-- \PC_Soma_Constante|Add0~54\ = CARRY(( \PC_entity|DOUT\(15) ) + ( GND ) + ( \PC_Soma_Constante|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(15),
	cin => \PC_Soma_Constante|Add0~50\,
	sumout => \PC_Soma_Constante|Add0~53_sumout\,
	cout => \PC_Soma_Constante|Add0~54\);

\mux_PC|saida_MUX[15]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[15]~13_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~53_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~53_sumout\,
	combout => \mux_PC|saida_MUX[15]~13_combout\);

\PC_entity|DOUT[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[15]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(15));

\PC_Soma_Constante|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~57_sumout\ = SUM(( \PC_entity|DOUT\(16) ) + ( GND ) + ( \PC_Soma_Constante|Add0~54\ ))
-- \PC_Soma_Constante|Add0~58\ = CARRY(( \PC_entity|DOUT\(16) ) + ( GND ) + ( \PC_Soma_Constante|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(16),
	cin => \PC_Soma_Constante|Add0~54\,
	sumout => \PC_Soma_Constante|Add0~57_sumout\,
	cout => \PC_Soma_Constante|Add0~58\);

\mux_PC|saida_MUX[16]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[16]~14_combout\ = ( \PC_Soma_Constante|Add0~57_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~16_combout\) ) ) # ( !\PC_Soma_Constante|Add0~57_sumout\ & ( (\ROM|memROM~16_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~16_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~57_sumout\,
	combout => \mux_PC|saida_MUX[16]~14_combout\);

\PC_entity|DOUT[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[16]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(16));

\PC_Soma_Constante|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~61_sumout\ = SUM(( \PC_entity|DOUT\(17) ) + ( GND ) + ( \PC_Soma_Constante|Add0~58\ ))
-- \PC_Soma_Constante|Add0~62\ = CARRY(( \PC_entity|DOUT\(17) ) + ( GND ) + ( \PC_Soma_Constante|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(17),
	cin => \PC_Soma_Constante|Add0~58\,
	sumout => \PC_Soma_Constante|Add0~61_sumout\,
	cout => \PC_Soma_Constante|Add0~62\);

\mux_PC|saida_MUX[17]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[17]~15_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~61_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~61_sumout\,
	combout => \mux_PC|saida_MUX[17]~15_combout\);

\PC_entity|DOUT[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[17]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(17));

\PC_Soma_Constante|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~65_sumout\ = SUM(( \PC_entity|DOUT\(18) ) + ( GND ) + ( \PC_Soma_Constante|Add0~62\ ))
-- \PC_Soma_Constante|Add0~66\ = CARRY(( \PC_entity|DOUT\(18) ) + ( GND ) + ( \PC_Soma_Constante|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(18),
	cin => \PC_Soma_Constante|Add0~62\,
	sumout => \PC_Soma_Constante|Add0~65_sumout\,
	cout => \PC_Soma_Constante|Add0~66\);

\mux_PC|saida_MUX[18]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[18]~16_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~65_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~65_sumout\,
	combout => \mux_PC|saida_MUX[18]~16_combout\);

\PC_entity|DOUT[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[18]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(18));

\PC_Soma_Constante|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~69_sumout\ = SUM(( \PC_entity|DOUT\(19) ) + ( GND ) + ( \PC_Soma_Constante|Add0~66\ ))
-- \PC_Soma_Constante|Add0~70\ = CARRY(( \PC_entity|DOUT\(19) ) + ( GND ) + ( \PC_Soma_Constante|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(19),
	cin => \PC_Soma_Constante|Add0~66\,
	sumout => \PC_Soma_Constante|Add0~69_sumout\,
	cout => \PC_Soma_Constante|Add0~70\);

\mux_PC|saida_MUX[19]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[19]~17_combout\ = ( \PC_Soma_Constante|Add0~69_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~17_combout\) ) ) # ( !\PC_Soma_Constante|Add0~69_sumout\ & ( (\ROM|memROM~17_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~17_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~69_sumout\,
	combout => \mux_PC|saida_MUX[19]~17_combout\);

\PC_entity|DOUT[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[19]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(19));

\PC_Soma_Constante|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~73_sumout\ = SUM(( \PC_entity|DOUT\(20) ) + ( GND ) + ( \PC_Soma_Constante|Add0~70\ ))
-- \PC_Soma_Constante|Add0~74\ = CARRY(( \PC_entity|DOUT\(20) ) + ( GND ) + ( \PC_Soma_Constante|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(20),
	cin => \PC_Soma_Constante|Add0~70\,
	sumout => \PC_Soma_Constante|Add0~73_sumout\,
	cout => \PC_Soma_Constante|Add0~74\);

\mux_PC|saida_MUX[20]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[20]~18_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~73_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~73_sumout\,
	combout => \mux_PC|saida_MUX[20]~18_combout\);

\PC_entity|DOUT[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[20]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(20));

\PC_Soma_Constante|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~77_sumout\ = SUM(( \PC_entity|DOUT\(21) ) + ( GND ) + ( \PC_Soma_Constante|Add0~74\ ))
-- \PC_Soma_Constante|Add0~78\ = CARRY(( \PC_entity|DOUT\(21) ) + ( GND ) + ( \PC_Soma_Constante|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(21),
	cin => \PC_Soma_Constante|Add0~74\,
	sumout => \PC_Soma_Constante|Add0~77_sumout\,
	cout => \PC_Soma_Constante|Add0~78\);

\mux_PC|saida_MUX[21]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[21]~19_combout\ = ( \PC_Soma_Constante|Add0~77_sumout\ & ( (!\ROM|memROM~18_combout\) # (!\UC|Equal5~1_combout\) ) ) # ( !\PC_Soma_Constante|Add0~77_sumout\ & ( (!\ROM|memROM~18_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010111110101111101000001010000010101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~18_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~77_sumout\,
	combout => \mux_PC|saida_MUX[21]~19_combout\);

\PC_entity|DOUT[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[21]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(21));

\PC_Soma_Constante|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~81_sumout\ = SUM(( \PC_entity|DOUT\(22) ) + ( GND ) + ( \PC_Soma_Constante|Add0~78\ ))
-- \PC_Soma_Constante|Add0~82\ = CARRY(( \PC_entity|DOUT\(22) ) + ( GND ) + ( \PC_Soma_Constante|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(22),
	cin => \PC_Soma_Constante|Add0~78\,
	sumout => \PC_Soma_Constante|Add0~81_sumout\,
	cout => \PC_Soma_Constante|Add0~82\);

\mux_PC|saida_MUX[22]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[22]~20_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~81_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~81_sumout\,
	combout => \mux_PC|saida_MUX[22]~20_combout\);

\PC_entity|DOUT[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[22]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(22));

\PC_Soma_Constante|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~85_sumout\ = SUM(( \PC_entity|DOUT\(23) ) + ( GND ) + ( \PC_Soma_Constante|Add0~82\ ))
-- \PC_Soma_Constante|Add0~86\ = CARRY(( \PC_entity|DOUT\(23) ) + ( GND ) + ( \PC_Soma_Constante|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(23),
	cin => \PC_Soma_Constante|Add0~82\,
	sumout => \PC_Soma_Constante|Add0~85_sumout\,
	cout => \PC_Soma_Constante|Add0~86\);

\mux_PC|saida_MUX[23]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[23]~21_combout\ = ( \PC_Soma_Constante|Add0~85_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~17_combout\) ) ) # ( !\PC_Soma_Constante|Add0~85_sumout\ & ( (\ROM|memROM~17_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~17_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~85_sumout\,
	combout => \mux_PC|saida_MUX[23]~21_combout\);

\PC_entity|DOUT[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[23]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(23));

\PC_Soma_Constante|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~89_sumout\ = SUM(( \PC_entity|DOUT\(24) ) + ( GND ) + ( \PC_Soma_Constante|Add0~86\ ))
-- \PC_Soma_Constante|Add0~90\ = CARRY(( \PC_entity|DOUT\(24) ) + ( GND ) + ( \PC_Soma_Constante|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(24),
	cin => \PC_Soma_Constante|Add0~86\,
	sumout => \PC_Soma_Constante|Add0~89_sumout\,
	cout => \PC_Soma_Constante|Add0~90\);

\mux_PC|saida_MUX[24]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[24]~22_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~89_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~89_sumout\,
	combout => \mux_PC|saida_MUX[24]~22_combout\);

\PC_entity|DOUT[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[24]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(24));

\PC_Soma_Constante|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~93_sumout\ = SUM(( \PC_entity|DOUT\(25) ) + ( GND ) + ( \PC_Soma_Constante|Add0~90\ ))
-- \PC_Soma_Constante|Add0~94\ = CARRY(( \PC_entity|DOUT\(25) ) + ( GND ) + ( \PC_Soma_Constante|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(25),
	cin => \PC_Soma_Constante|Add0~90\,
	sumout => \PC_Soma_Constante|Add0~93_sumout\,
	cout => \PC_Soma_Constante|Add0~94\);

\mux_PC|saida_MUX[25]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[25]~23_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~93_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~93_sumout\,
	combout => \mux_PC|saida_MUX[25]~23_combout\);

\PC_entity|DOUT[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[25]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(25));

\PC_Soma_Constante|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~97_sumout\ = SUM(( \PC_entity|DOUT\(26) ) + ( GND ) + ( \PC_Soma_Constante|Add0~94\ ))
-- \PC_Soma_Constante|Add0~98\ = CARRY(( \PC_entity|DOUT\(26) ) + ( GND ) + ( \PC_Soma_Constante|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(26),
	cin => \PC_Soma_Constante|Add0~94\,
	sumout => \PC_Soma_Constante|Add0~97_sumout\,
	cout => \PC_Soma_Constante|Add0~98\);

\mux_PC|saida_MUX[26]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[26]~24_combout\ = ( \PC_Soma_Constante|Add0~97_sumout\ & ( (!\UC|Equal5~1_combout\) # (\ROM|memROM~17_combout\) ) ) # ( !\PC_Soma_Constante|Add0~97_sumout\ & ( (\ROM|memROM~17_combout\ & \UC|Equal5~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~17_combout\,
	datac => \UC|ALT_INV_Equal5~1_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~97_sumout\,
	combout => \mux_PC|saida_MUX[26]~24_combout\);

\PC_entity|DOUT[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[26]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(26));

\PC_Soma_Constante|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~101_sumout\ = SUM(( \PC_entity|DOUT\(27) ) + ( GND ) + ( \PC_Soma_Constante|Add0~98\ ))
-- \PC_Soma_Constante|Add0~102\ = CARRY(( \PC_entity|DOUT\(27) ) + ( GND ) + ( \PC_Soma_Constante|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(27),
	cin => \PC_Soma_Constante|Add0~98\,
	sumout => \PC_Soma_Constante|Add0~101_sumout\,
	cout => \PC_Soma_Constante|Add0~102\);

\mux_PC|saida_MUX[27]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[27]~25_combout\ = (!\UC|Equal5~1_combout\ & \PC_Soma_Constante|Add0~101_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \UC|ALT_INV_Equal5~1_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~101_sumout\,
	combout => \mux_PC|saida_MUX[27]~25_combout\);

\PC_entity|DOUT[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[27]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(27));

\PC_Soma_Constante|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~105_sumout\ = SUM(( \PC_entity|DOUT\(28) ) + ( GND ) + ( \PC_Soma_Constante|Add0~102\ ))
-- \PC_Soma_Constante|Add0~106\ = CARRY(( \PC_entity|DOUT\(28) ) + ( GND ) + ( \PC_Soma_Constante|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(28),
	cin => \PC_Soma_Constante|Add0~102\,
	sumout => \PC_Soma_Constante|Add0~105_sumout\,
	cout => \PC_Soma_Constante|Add0~106\);

\PC_entity|DOUT[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~105_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(28));

\PC_Soma_Constante|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~109_sumout\ = SUM(( \PC_entity|DOUT\(29) ) + ( GND ) + ( \PC_Soma_Constante|Add0~106\ ))
-- \PC_Soma_Constante|Add0~110\ = CARRY(( \PC_entity|DOUT\(29) ) + ( GND ) + ( \PC_Soma_Constante|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(29),
	cin => \PC_Soma_Constante|Add0~106\,
	sumout => \PC_Soma_Constante|Add0~109_sumout\,
	cout => \PC_Soma_Constante|Add0~110\);

\PC_entity|DOUT[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~109_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(29));

\PC_Soma_Constante|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~113_sumout\ = SUM(( \PC_entity|DOUT\(30) ) + ( GND ) + ( \PC_Soma_Constante|Add0~110\ ))
-- \PC_Soma_Constante|Add0~114\ = CARRY(( \PC_entity|DOUT\(30) ) + ( GND ) + ( \PC_Soma_Constante|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(30),
	cin => \PC_Soma_Constante|Add0~110\,
	sumout => \PC_Soma_Constante|Add0~113_sumout\,
	cout => \PC_Soma_Constante|Add0~114\);

\PC_entity|DOUT[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~113_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(30));

\PC_Soma_Constante|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~117_sumout\ = SUM(( \PC_entity|DOUT\(31) ) + ( GND ) + ( \PC_Soma_Constante|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(31),
	cin => \PC_Soma_Constante|Add0~114\,
	sumout => \PC_Soma_Constante|Add0~117_sumout\);

\PC_entity|DOUT[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~117_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(31));

\ULA|ula31|Overflow_exists|overflow~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|Overflow_exists|overflow~0_combout\ = ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( \ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( \mux_rt_imediato|saida_MUX[31]~0_combout\ ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( 
-- \ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( \mux_rt_imediato|saida_MUX[31]~0_combout\ ) ) ) # ( \ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula31|mux_ula|saida_MUX~0_combout\ & ( (!\UC_ULA|ula_ctrl[3]~7_combout\ $ 
-- (\ULA|ula30|soma_sub|carry_out~combout\)) # (\mux_rt_imediato|saida_MUX[31]~0_combout\) ) ) ) # ( !\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula31|mux_ula|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111100111111001111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[3]~7_combout\,
	datab => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datac => \mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\,
	datae => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\,
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

ww_PC_saida(0) <= \PC_saida[0]~output_o\;

ww_PC_saida(1) <= \PC_saida[1]~output_o\;

ww_PC_saida(2) <= \PC_saida[2]~output_o\;

ww_PC_saida(3) <= \PC_saida[3]~output_o\;

ww_PC_saida(4) <= \PC_saida[4]~output_o\;

ww_PC_saida(5) <= \PC_saida[5]~output_o\;

ww_PC_saida(6) <= \PC_saida[6]~output_o\;

ww_PC_saida(7) <= \PC_saida[7]~output_o\;

ww_PC_saida(8) <= \PC_saida[8]~output_o\;

ww_PC_saida(9) <= \PC_saida[9]~output_o\;

ww_PC_saida(10) <= \PC_saida[10]~output_o\;

ww_PC_saida(11) <= \PC_saida[11]~output_o\;

ww_PC_saida(12) <= \PC_saida[12]~output_o\;

ww_PC_saida(13) <= \PC_saida[13]~output_o\;

ww_PC_saida(14) <= \PC_saida[14]~output_o\;

ww_PC_saida(15) <= \PC_saida[15]~output_o\;

ww_PC_saida(16) <= \PC_saida[16]~output_o\;

ww_PC_saida(17) <= \PC_saida[17]~output_o\;

ww_PC_saida(18) <= \PC_saida[18]~output_o\;

ww_PC_saida(19) <= \PC_saida[19]~output_o\;

ww_PC_saida(20) <= \PC_saida[20]~output_o\;

ww_PC_saida(21) <= \PC_saida[21]~output_o\;

ww_PC_saida(22) <= \PC_saida[22]~output_o\;

ww_PC_saida(23) <= \PC_saida[23]~output_o\;

ww_PC_saida(24) <= \PC_saida[24]~output_o\;

ww_PC_saida(25) <= \PC_saida[25]~output_o\;

ww_PC_saida(26) <= \PC_saida[26]~output_o\;

ww_PC_saida(27) <= \PC_saida[27]~output_o\;

ww_PC_saida(28) <= \PC_saida[28]~output_o\;

ww_PC_saida(29) <= \PC_saida[29]~output_o\;

ww_PC_saida(30) <= \PC_saida[30]~output_o\;

ww_PC_saida(31) <= \PC_saida[31]~output_o\;

ww_overflow <= \overflow~output_o\;

ww_monitora_flag_z <= \monitora_flag_z~output_o\;
END structure;


