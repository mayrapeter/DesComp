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

-- DATE "11/20/2020 10:26:03"

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
SIGNAL \ROM|memROM~10_combout\ : std_logic;
SIGNAL \ROM|memROM~12_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~22\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~6\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~9_sumout\ : std_logic;
SIGNAL \ROM|memROM~3_combout\ : std_logic;
SIGNAL \ROM|memROM~4_combout\ : std_logic;
SIGNAL \ROM|memROM~13_combout\ : std_logic;
SIGNAL \ROM|memROM~9_combout\ : std_logic;
SIGNAL \UC|Equal3~0_combout\ : std_logic;
SIGNAL \UC|sel_mux4~0_combout\ : std_logic;
SIGNAL \UC|Equal1~0_combout\ : std_logic;
SIGNAL \bancoRegs|Equal0~0_combout\ : std_logic;
SIGNAL \ROM|memROM~14_combout\ : std_logic;
SIGNAL \ROM|memROM~15_combout\ : std_logic;
SIGNAL \UC|Equal8~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1191_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1221_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1178_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[29]~16_combout\ : std_logic;
SIGNAL \UC|Equal2~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~295_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1193_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1066_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \UC|palavraControle[9]~0_combout\ : std_logic;
SIGNAL \monitora_flag_z~0_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[1]~21_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1194_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1070_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[2]~22_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1195_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1074_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[3]~23_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1196_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1078_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[4]~24_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~300_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1198_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1086_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[6]~26_combout\ : std_logic;
SIGNAL \ULA|ula6|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~301_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1199_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1090_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[7]~27_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[7]~7_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1190_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~45_q\ : std_logic;
SIGNAL \ROM|memROM~0_combout\ : std_logic;
SIGNAL \bancoRegs|Equal1~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaA[7]~7_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[6]~6_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[6]~6_combout\ : std_logic;
SIGNAL \ULA|ula6|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[4]~4_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[4]~4_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1197_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1082_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[5]~25_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[5]~5_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[5]~5_combout\ : std_logic;
SIGNAL \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula5|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[3]~3_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[3]~3_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[2]~2_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[2]~2_combout\ : std_logic;
SIGNAL \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula3|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[1]~1_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[1]~1_combout\ : std_logic;
SIGNAL \ULA|ula1|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[29]~29_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[29]~29_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl~2_combout\ : std_logic;
SIGNAL \UC|palavraControle[9]~1_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|Equal0~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~294_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1192_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1062_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1218_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1166_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[26]~13_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[26]~26_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[26]~26_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1219_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1170_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[27]~14_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[27]~27_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[27]~27_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1220_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1174_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[28]~15_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|saida~combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1213_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1146_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[21]~8_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula21|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[21]~21_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[21]~21_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1215_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1154_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[23]~10_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[23]~23_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[23]~23_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1214_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1150_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[22]~9_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[22]~22_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[22]~22_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1216_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1158_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[24]~11_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[24]~24_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[24]~24_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1217_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1162_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[25]~12_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[25]~25_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[25]~25_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|saida~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1208_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1126_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[16]~3_combout\ : std_logic;
SIGNAL \ULA|ula16|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula16|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[16]~16_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[16]~16_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1209_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1130_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[17]~4_combout\ : std_logic;
SIGNAL \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[17]~17_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[17]~17_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1210_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1134_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[18]~5_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[18]~18_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[18]~18_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1211_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1138_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[19]~6_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[19]~19_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[19]~19_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1212_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1142_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[20]~7_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[20]~20_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[20]~20_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1203_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1106_combout\ : std_logic;
SIGNAL \ULA|ula11|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[11]~30_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[11]~11_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[11]~11_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1204_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1110_combout\ : std_logic;
SIGNAL \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[12]~31_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[12]~12_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[12]~12_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1205_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1114_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[13]~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[13]~13_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[13]~13_combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1206_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1118_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[14]~1_combout\ : std_logic;
SIGNAL \ULA|ula14|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula14|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[14]~14_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[14]~14_combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1207_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1122_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[15]~2_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[15]~15_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[15]~15_combout\ : std_logic;
SIGNAL \ULA|ula15|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula15|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1200_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1094_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[8]~19_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[8]~8_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[8]~8_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1201_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1098_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[9]~28_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[9]~9_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[9]~9_combout\ : std_logic;
SIGNAL \ULA|ula9|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1202_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1102_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[10]~29_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[10]~10_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[10]~10_combout\ : std_logic;
SIGNAL \ULA|ula10|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula10|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \monitora_flag_z~1_combout\ : std_logic;
SIGNAL \monitora_flag_z~2_combout\ : std_logic;
SIGNAL \monitora_flag_z~3_combout\ : std_logic;
SIGNAL \monitora_flag_z~4_combout\ : std_logic;
SIGNAL \monitora_flag_z~5_combout\ : std_logic;
SIGNAL \monitora_flag_z~6_combout\ : std_logic;
SIGNAL \monitora_flag_z~7_combout\ : std_logic;
SIGNAL \monitora_flag_z~8_combout\ : std_logic;
SIGNAL \monitora_flag_z~9_combout\ : std_logic;
SIGNAL \ROM|memROM~7_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~5_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~21_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~118_cout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~6\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~9_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[4]~2_combout\ : std_logic;
SIGNAL \ROM|memROM~8_combout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~5_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[3]~1_combout\ : std_logic;
SIGNAL \ROM|memROM~11_combout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[2]~5_combout\ : std_logic;
SIGNAL \ROM|memROM~5_combout\ : std_logic;
SIGNAL \ROM|memROM~6_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~10\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~13_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~10\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~13_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[5]~3_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~14\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~17_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~14\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~17_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[6]~4_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[28]~28_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[28]~28_combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula29|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \bancoRegs|registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1222_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1182_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[30]~17_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[30]~30_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[30]~30_combout\ : std_logic;
SIGNAL \ULA|ula30|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~18\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~1_sumout\ : std_logic;
SIGNAL \ROM|memROM~1_combout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~18\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~1_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[7]~0_combout\ : std_logic;
SIGNAL \ROM|memROM~2_combout\ : std_logic;
SIGNAL \UC_ULA|ula_ctrl[2]~1_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[31]~31_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|saida_MUX~0_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[31]~31_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1223_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1186_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[31]~18_combout\ : std_logic;
SIGNAL \mux_rt_imediato|saida_MUX[31]~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|soma_sub|saida~0_combout\ : std_logic;
SIGNAL \bancoRegs|saidaB[0]~20_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \mux_ULA_mem|saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~38_q\ : std_logic;
SIGNAL \bancoRegs|saidaA[0]~0_combout\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula30|soma_sub|carry_out~combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|saida_MUX~1_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~2\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~25_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~2\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~21_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[8]~6_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~26\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~29_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~22\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~25_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[9]~7_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~30\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~33_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~26\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~29_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[10]~8_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~34\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~37_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~30\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~33_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[11]~9_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~38\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~41_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~34\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~37_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[12]~10_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~42\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~45_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~38\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~41_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[13]~11_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~46\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~49_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~42\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~45_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[14]~12_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~50\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~53_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~46\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~49_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[15]~13_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~54\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~57_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~50\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~53_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[16]~14_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~58\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~61_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~54\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~57_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[17]~15_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~62\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~65_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~58\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~61_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[18]~16_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~66\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~69_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~62\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~65_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[19]~17_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~70\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~73_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~66\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~69_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[20]~18_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~74\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~77_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~70\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~73_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[21]~19_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~78\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~81_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~74\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~77_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[22]~20_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~82\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~85_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~78\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~81_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[23]~21_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~86\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~89_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~82\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~85_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[24]~22_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~90\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~93_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~86\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~89_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[25]~23_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~94\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~97_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~90\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~93_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[26]~24_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~98\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~101_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~94\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~97_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[27]~25_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~102\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~105_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~98\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~101_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[28]~26_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~106\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~109_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~102\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~105_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[29]~27_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~110\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~113_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~106\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~109_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[30]~28_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~114\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~117_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~110\ : std_logic;
SIGNAL \PC_Soma_imediato|Add0~113_sumout\ : std_logic;
SIGNAL \mux_PC|saida_MUX[31]~29_combout\ : std_logic;
SIGNAL \ULA|ula31|Overflow_exists|overflow~0_combout\ : std_logic;
SIGNAL \monitora_flag_z~10_combout\ : std_logic;
SIGNAL \PC_entity|DOUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1186_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1182_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1178_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1174_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1170_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1166_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1162_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1158_combout\ : std_logic;
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
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~113_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~117_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~109_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~113_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~105_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~109_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~105_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \PC_Soma_imediato|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a31~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a30~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a29~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a28~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a27~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a26~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a25~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a24~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a23~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a22~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a21~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a20~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a19~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a18~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a17~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a16~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a15~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a14~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a13~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a12~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a11~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a10~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a9~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a8~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~58_q\ : std_logic;
SIGNAL \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[19]~6_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[19]~19_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~57_q\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula18|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[18]~5_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[18]~18_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~56_q\ : std_logic;
SIGNAL \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[17]~4_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[17]~17_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~55_q\ : std_logic;
SIGNAL \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[16]~3_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[16]~16_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~54_q\ : std_logic;
SIGNAL \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[15]~2_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[15]~15_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~53_q\ : std_logic;
SIGNAL \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[14]~1_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[14]~14_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~52_q\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[13]~0_combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[13]~13_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~51_q\ : std_logic;
SIGNAL \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[12]~12_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~50_q\ : std_logic;
SIGNAL \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[11]~11_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~49_q\ : std_logic;
SIGNAL \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[10]~10_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~48_q\ : std_logic;
SIGNAL \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[9]~9_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~47_q\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[8]~8_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~46_q\ : std_logic;
SIGNAL \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[7]~7_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~301_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~45_q\ : std_logic;
SIGNAL \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[6]~6_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~300_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~44_q\ : std_logic;
SIGNAL \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[5]~5_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~43_q\ : std_logic;
SIGNAL \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[4]~4_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~42_q\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[3]~3_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~41_q\ : std_logic;
SIGNAL \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~12_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[2]~2_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~40_q\ : std_logic;
SIGNAL \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[1]~1_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~295_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~39_q\ : std_logic;
SIGNAL \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~11_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~10_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~9_combout\ : std_logic;
SIGNAL \UC|ALT_INV_palavraControle[9]~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \PC_entity|ALT_INV_DOUT\ : std_logic_vector(31 DOWNTO 2);
SIGNAL \bancoRegs|ALT_INV_saidaA[0]~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~294_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~38_q\ : std_logic;
SIGNAL \ULA|ula27|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|ALT_INV_saida~combout\ : std_logic;
SIGNAL \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula22|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula17|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula14|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[8]~19_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula7|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula4|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula3|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula1|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_palavraControle[9]~1_combout\ : std_logic;
SIGNAL \UC_ULA|ALT_INV_ula_ctrl~2_combout\ : std_logic;
SIGNAL \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[31]~31_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~69_q\ : std_logic;
SIGNAL \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[31]~18_combout\ : std_logic;
SIGNAL \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[30]~17_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[30]~30_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~68_q\ : std_logic;
SIGNAL \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[29]~16_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[29]~29_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~67_q\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[28]~15_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[28]~28_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~66_q\ : std_logic;
SIGNAL \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[27]~14_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[27]~27_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~65_q\ : std_logic;
SIGNAL \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[26]~13_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[26]~26_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~64_q\ : std_logic;
SIGNAL \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[25]~12_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[25]~25_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~63_q\ : std_logic;
SIGNAL \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[24]~11_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[24]~24_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~62_q\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|ALT_INV_saida_and~0_combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\ : std_logic;
SIGNAL \ULA|ula23|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[23]~10_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[23]~23_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~61_q\ : std_logic;
SIGNAL \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[22]~9_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[22]~22_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~60_q\ : std_logic;
SIGNAL \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[21]~8_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[21]~21_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~59_q\ : std_logic;
SIGNAL \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaB[20]~7_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_saidaA[20]~20_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1223_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1222_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1221_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1220_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1219_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1218_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1217_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1216_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1215_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1214_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1213_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1212_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1211_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1210_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1209_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1208_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1207_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1206_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1205_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1204_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1203_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1202_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1201_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1200_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1199_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1198_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1197_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1196_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1195_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1194_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1193_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1192_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal8~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~15_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~14_combout\ : std_logic;
SIGNAL \UC|ALT_INV_sel_mux4~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~13_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~9_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~8_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~7_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~6_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~5_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~4_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~3_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~2_combout\ : std_logic;
SIGNAL \ALT_INV_monitora_flag_z~1_combout\ : std_logic;
SIGNAL \ULA|ula31|Overflow_exists|ALT_INV_overflow~0_combout\ : std_logic;
SIGNAL \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|soma_sub|ALT_INV_saida_xor~combout\ : std_logic;
SIGNAL \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\ : std_logic;
SIGNAL \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|soma_sub|ALT_INV_saida~combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula27|mux_ula|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|ALT_INV_saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula23|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula20|mux_ula|ALT_INV_saida_MUX~1_combout\ : std_logic;

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

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[1]~21_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[2]~22_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[3]~23_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[4]~24_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[5]~25_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[6]~26_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[7]~27_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[8]~19_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[9]~28_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[10]~29_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[11]~30_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[12]~31_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[13]~0_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[14]~1_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[15]~2_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[16]~3_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[17]~4_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[18]~5_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[19]~6_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[20]~7_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[21]~8_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[22]~9_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[23]~10_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[24]~11_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[25]~12_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[26]~13_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[27]~14_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[28]~15_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[29]~16_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[30]~17_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\(0) <= \bancoRegs|saidaB[31]~18_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\ <= (\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \ULA|ula6|mux_ula|saida_MUX~0_combout\ & \ULA|ula5|mux_ula|saida_MUX~0_combout\ & \ULA|ula4|mux_ula|saida_MUX~0_combout\ & 
\ULA|ula3|mux_ula|saida_MUX~0_combout\ & \ULA|ula2|mux_ula|saida_MUX~0_combout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\(0);
\PC_Soma_Constante|ALT_INV_Add0~21_sumout\ <= NOT \PC_Soma_Constante|Add0~21_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~17_sumout\ <= NOT \PC_Soma_imediato|Add0~17_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~17_sumout\ <= NOT \PC_Soma_Constante|Add0~17_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~13_sumout\ <= NOT \PC_Soma_imediato|Add0~13_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~13_sumout\ <= NOT \PC_Soma_Constante|Add0~13_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~9_sumout\ <= NOT \PC_Soma_imediato|Add0~9_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~9_sumout\ <= NOT \PC_Soma_Constante|Add0~9_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~5_sumout\ <= NOT \PC_Soma_imediato|Add0~5_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~5_sumout\ <= NOT \PC_Soma_Constante|Add0~5_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~1_sumout\ <= NOT \PC_Soma_imediato|Add0~1_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~1_sumout\ <= NOT \PC_Soma_Constante|Add0~1_sumout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\;
\bancoRegs|ALT_INV_registrador~1186_combout\ <= NOT \bancoRegs|registrador~1186_combout\;
\bancoRegs|ALT_INV_registrador~1182_combout\ <= NOT \bancoRegs|registrador~1182_combout\;
\bancoRegs|ALT_INV_registrador~1178_combout\ <= NOT \bancoRegs|registrador~1178_combout\;
\bancoRegs|ALT_INV_registrador~1174_combout\ <= NOT \bancoRegs|registrador~1174_combout\;
\bancoRegs|ALT_INV_registrador~1170_combout\ <= NOT \bancoRegs|registrador~1170_combout\;
\bancoRegs|ALT_INV_registrador~1166_combout\ <= NOT \bancoRegs|registrador~1166_combout\;
\bancoRegs|ALT_INV_registrador~1162_combout\ <= NOT \bancoRegs|registrador~1162_combout\;
\bancoRegs|ALT_INV_registrador~1158_combout\ <= NOT \bancoRegs|registrador~1158_combout\;
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
\PC_Soma_imediato|ALT_INV_Add0~113_sumout\ <= NOT \PC_Soma_imediato|Add0~113_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~117_sumout\ <= NOT \PC_Soma_Constante|Add0~117_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~109_sumout\ <= NOT \PC_Soma_imediato|Add0~109_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~113_sumout\ <= NOT \PC_Soma_Constante|Add0~113_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~105_sumout\ <= NOT \PC_Soma_imediato|Add0~105_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~109_sumout\ <= NOT \PC_Soma_Constante|Add0~109_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~101_sumout\ <= NOT \PC_Soma_imediato|Add0~101_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~105_sumout\ <= NOT \PC_Soma_Constante|Add0~105_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~97_sumout\ <= NOT \PC_Soma_imediato|Add0~97_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~101_sumout\ <= NOT \PC_Soma_Constante|Add0~101_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~93_sumout\ <= NOT \PC_Soma_imediato|Add0~93_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~97_sumout\ <= NOT \PC_Soma_Constante|Add0~97_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~89_sumout\ <= NOT \PC_Soma_imediato|Add0~89_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~93_sumout\ <= NOT \PC_Soma_Constante|Add0~93_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~85_sumout\ <= NOT \PC_Soma_imediato|Add0~85_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~89_sumout\ <= NOT \PC_Soma_Constante|Add0~89_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~81_sumout\ <= NOT \PC_Soma_imediato|Add0~81_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~85_sumout\ <= NOT \PC_Soma_Constante|Add0~85_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~77_sumout\ <= NOT \PC_Soma_imediato|Add0~77_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~81_sumout\ <= NOT \PC_Soma_Constante|Add0~81_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~73_sumout\ <= NOT \PC_Soma_imediato|Add0~73_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~77_sumout\ <= NOT \PC_Soma_Constante|Add0~77_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~69_sumout\ <= NOT \PC_Soma_imediato|Add0~69_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~73_sumout\ <= NOT \PC_Soma_Constante|Add0~73_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~65_sumout\ <= NOT \PC_Soma_imediato|Add0~65_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~69_sumout\ <= NOT \PC_Soma_Constante|Add0~69_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~61_sumout\ <= NOT \PC_Soma_imediato|Add0~61_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~65_sumout\ <= NOT \PC_Soma_Constante|Add0~65_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~57_sumout\ <= NOT \PC_Soma_imediato|Add0~57_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~61_sumout\ <= NOT \PC_Soma_Constante|Add0~61_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~53_sumout\ <= NOT \PC_Soma_imediato|Add0~53_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~57_sumout\ <= NOT \PC_Soma_Constante|Add0~57_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~49_sumout\ <= NOT \PC_Soma_imediato|Add0~49_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~53_sumout\ <= NOT \PC_Soma_Constante|Add0~53_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~45_sumout\ <= NOT \PC_Soma_imediato|Add0~45_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~49_sumout\ <= NOT \PC_Soma_Constante|Add0~49_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~41_sumout\ <= NOT \PC_Soma_imediato|Add0~41_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~45_sumout\ <= NOT \PC_Soma_Constante|Add0~45_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~37_sumout\ <= NOT \PC_Soma_imediato|Add0~37_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~41_sumout\ <= NOT \PC_Soma_Constante|Add0~41_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~33_sumout\ <= NOT \PC_Soma_imediato|Add0~33_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~37_sumout\ <= NOT \PC_Soma_Constante|Add0~37_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~29_sumout\ <= NOT \PC_Soma_imediato|Add0~29_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~33_sumout\ <= NOT \PC_Soma_Constante|Add0~33_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~25_sumout\ <= NOT \PC_Soma_imediato|Add0~25_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~29_sumout\ <= NOT \PC_Soma_Constante|Add0~29_sumout\;
\PC_Soma_imediato|ALT_INV_Add0~21_sumout\ <= NOT \PC_Soma_imediato|Add0~21_sumout\;
\PC_Soma_Constante|ALT_INV_Add0~25_sumout\ <= NOT \PC_Soma_Constante|Add0~25_sumout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a31~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a30~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a29~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a28~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a27~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a26~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a25~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a24~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a23~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a22~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a21~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a20~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a19~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a18~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a17~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a16~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a15~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a14~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a13~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a12~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a11~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a10~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a9~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a8~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\;
\RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\ <= NOT \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\;
\bancoRegs|ALT_INV_registrador~314_q\ <= NOT \bancoRegs|registrador~314_q\;
\bancoRegs|ALT_INV_registrador~58_q\ <= NOT \bancoRegs|registrador~58_q\;
\ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula19|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[19]~6_combout\ <= NOT \bancoRegs|saidaB[19]~6_combout\;
\bancoRegs|ALT_INV_saidaA[19]~19_combout\ <= NOT \bancoRegs|saidaA[19]~19_combout\;
\bancoRegs|ALT_INV_registrador~313_q\ <= NOT \bancoRegs|registrador~313_q\;
\bancoRegs|ALT_INV_registrador~57_q\ <= NOT \bancoRegs|registrador~57_q\;
\ULA|ula18|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula18|soma_sub|saida_and~0_combout\;
\ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula18|soma_sub|saida_xor2~combout\;
\ULA|ula18|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula18|soma_sub|saida_xor~combout\;
\ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula18|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[18]~5_combout\ <= NOT \bancoRegs|saidaB[18]~5_combout\;
\bancoRegs|ALT_INV_saidaA[18]~18_combout\ <= NOT \bancoRegs|saidaA[18]~18_combout\;
\bancoRegs|ALT_INV_registrador~312_q\ <= NOT \bancoRegs|registrador~312_q\;
\bancoRegs|ALT_INV_registrador~56_q\ <= NOT \bancoRegs|registrador~56_q\;
\ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula17|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[17]~4_combout\ <= NOT \bancoRegs|saidaB[17]~4_combout\;
\bancoRegs|ALT_INV_saidaA[17]~17_combout\ <= NOT \bancoRegs|saidaA[17]~17_combout\;
\bancoRegs|ALT_INV_registrador~311_q\ <= NOT \bancoRegs|registrador~311_q\;
\bancoRegs|ALT_INV_registrador~55_q\ <= NOT \bancoRegs|registrador~55_q\;
\ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula16|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[16]~3_combout\ <= NOT \bancoRegs|saidaB[16]~3_combout\;
\bancoRegs|ALT_INV_saidaA[16]~16_combout\ <= NOT \bancoRegs|saidaA[16]~16_combout\;
\bancoRegs|ALT_INV_registrador~310_q\ <= NOT \bancoRegs|registrador~310_q\;
\bancoRegs|ALT_INV_registrador~54_q\ <= NOT \bancoRegs|registrador~54_q\;
\ULA|ula15|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula15|soma_sub|carry_out~combout\;
\ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula15|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[15]~2_combout\ <= NOT \bancoRegs|saidaB[15]~2_combout\;
\bancoRegs|ALT_INV_saidaA[15]~15_combout\ <= NOT \bancoRegs|saidaA[15]~15_combout\;
\bancoRegs|ALT_INV_registrador~309_q\ <= NOT \bancoRegs|registrador~309_q\;
\bancoRegs|ALT_INV_registrador~53_q\ <= NOT \bancoRegs|registrador~53_q\;
\ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula14|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[14]~1_combout\ <= NOT \bancoRegs|saidaB[14]~1_combout\;
\bancoRegs|ALT_INV_saidaA[14]~14_combout\ <= NOT \bancoRegs|saidaA[14]~14_combout\;
\bancoRegs|ALT_INV_registrador~308_q\ <= NOT \bancoRegs|registrador~308_q\;
\bancoRegs|ALT_INV_registrador~52_q\ <= NOT \bancoRegs|registrador~52_q\;
\ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula13|soma_sub|saida_and~0_combout\;
\bancoRegs|ALT_INV_saidaB[13]~0_combout\ <= NOT \bancoRegs|saidaB[13]~0_combout\;
\ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula13|soma_sub|saida_xor2~combout\;
\ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula13|soma_sub|saida_xor~combout\;
\bancoRegs|ALT_INV_saidaA[13]~13_combout\ <= NOT \bancoRegs|saidaA[13]~13_combout\;
\bancoRegs|ALT_INV_registrador~307_q\ <= NOT \bancoRegs|registrador~307_q\;
\bancoRegs|ALT_INV_registrador~51_q\ <= NOT \bancoRegs|registrador~51_q\;
\ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula12|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[12]~12_combout\ <= NOT \bancoRegs|saidaA[12]~12_combout\;
\bancoRegs|ALT_INV_registrador~306_q\ <= NOT \bancoRegs|registrador~306_q\;
\bancoRegs|ALT_INV_registrador~50_q\ <= NOT \bancoRegs|registrador~50_q\;
\ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula11|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[11]~11_combout\ <= NOT \bancoRegs|saidaA[11]~11_combout\;
\bancoRegs|ALT_INV_registrador~305_q\ <= NOT \bancoRegs|registrador~305_q\;
\bancoRegs|ALT_INV_registrador~49_q\ <= NOT \bancoRegs|registrador~49_q\;
\ULA|ula10|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula10|soma_sub|carry_out~combout\;
\ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula10|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[10]~10_combout\ <= NOT \bancoRegs|saidaA[10]~10_combout\;
\bancoRegs|ALT_INV_registrador~304_q\ <= NOT \bancoRegs|registrador~304_q\;
\bancoRegs|ALT_INV_registrador~48_q\ <= NOT \bancoRegs|registrador~48_q\;
\ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula9|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[9]~9_combout\ <= NOT \bancoRegs|saidaA[9]~9_combout\;
\bancoRegs|ALT_INV_registrador~303_q\ <= NOT \bancoRegs|registrador~303_q\;
\bancoRegs|ALT_INV_registrador~47_q\ <= NOT \bancoRegs|registrador~47_q\;
\ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula8|soma_sub|saida_and~0_combout\;
\ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula8|soma_sub|saida_xor2~combout\;
\ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula8|soma_sub|saida_xor~combout\;
\bancoRegs|ALT_INV_saidaA[8]~8_combout\ <= NOT \bancoRegs|saidaA[8]~8_combout\;
\bancoRegs|ALT_INV_registrador~302_q\ <= NOT \bancoRegs|registrador~302_q\;
\bancoRegs|ALT_INV_registrador~46_q\ <= NOT \bancoRegs|registrador~46_q\;
\ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula7|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[7]~7_combout\ <= NOT \bancoRegs|saidaA[7]~7_combout\;
\bancoRegs|ALT_INV_registrador~301_q\ <= NOT \bancoRegs|registrador~301_q\;
\bancoRegs|ALT_INV_registrador~45_q\ <= NOT \bancoRegs|registrador~45_q\;
\ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula6|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[6]~6_combout\ <= NOT \bancoRegs|saidaA[6]~6_combout\;
\bancoRegs|ALT_INV_registrador~300_q\ <= NOT \bancoRegs|registrador~300_q\;
\bancoRegs|ALT_INV_registrador~44_q\ <= NOT \bancoRegs|registrador~44_q\;
\ULA|ula5|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula5|soma_sub|carry_out~combout\;
\ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula5|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[5]~5_combout\ <= NOT \bancoRegs|saidaA[5]~5_combout\;
\bancoRegs|ALT_INV_registrador~299_q\ <= NOT \bancoRegs|registrador~299_q\;
\bancoRegs|ALT_INV_registrador~43_q\ <= NOT \bancoRegs|registrador~43_q\;
\ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula4|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[4]~4_combout\ <= NOT \bancoRegs|saidaA[4]~4_combout\;
\bancoRegs|ALT_INV_registrador~298_q\ <= NOT \bancoRegs|registrador~298_q\;
\bancoRegs|ALT_INV_registrador~42_q\ <= NOT \bancoRegs|registrador~42_q\;
\ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula3|soma_sub|saida_and~0_combout\;
\ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula3|soma_sub|saida_xor2~combout\;
\ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula3|soma_sub|saida_xor~combout\;
\bancoRegs|ALT_INV_saidaA[3]~3_combout\ <= NOT \bancoRegs|saidaA[3]~3_combout\;
\bancoRegs|ALT_INV_registrador~297_q\ <= NOT \bancoRegs|registrador~297_q\;
\bancoRegs|ALT_INV_registrador~41_q\ <= NOT \bancoRegs|registrador~41_q\;
\ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|mux_inverteB|saida_MUX~0_combout\;
\ROM|ALT_INV_memROM~12_combout\ <= NOT \ROM|memROM~12_combout\;
\bancoRegs|ALT_INV_saidaA[2]~2_combout\ <= NOT \bancoRegs|saidaA[2]~2_combout\;
\bancoRegs|ALT_INV_registrador~296_q\ <= NOT \bancoRegs|registrador~296_q\;
\bancoRegs|ALT_INV_registrador~40_q\ <= NOT \bancoRegs|registrador~40_q\;
\ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula1|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaA[1]~1_combout\ <= NOT \bancoRegs|saidaA[1]~1_combout\;
\bancoRegs|ALT_INV_registrador~295_q\ <= NOT \bancoRegs|registrador~295_q\;
\bancoRegs|ALT_INV_registrador~39_q\ <= NOT \bancoRegs|registrador~39_q\;
\ULA|ula0|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula0|soma_sub|carry_out~combout\;
\UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\ <= NOT \UC_ULA|ula_ctrl[2]~1_combout\;
\UC_ULA|ALT_INV_ula_ctrl~0_combout\ <= NOT \UC_ULA|ula_ctrl~0_combout\;
\ROM|ALT_INV_memROM~11_combout\ <= NOT \ROM|memROM~11_combout\;
\ROM|ALT_INV_memROM~10_combout\ <= NOT \ROM|memROM~10_combout\;
\ALT_INV_monitora_flag_z~0_combout\ <= NOT \monitora_flag_z~0_combout\;
\ROM|ALT_INV_memROM~9_combout\ <= NOT \ROM|memROM~9_combout\;
\UC|ALT_INV_palavraControle[9]~0_combout\ <= NOT \UC|palavraControle[9]~0_combout\;
\ROM|ALT_INV_memROM~8_combout\ <= NOT \ROM|memROM~8_combout\;
\ROM|ALT_INV_memROM~7_combout\ <= NOT \ROM|memROM~7_combout\;
\ROM|ALT_INV_memROM~6_combout\ <= NOT \ROM|memROM~6_combout\;
\ROM|ALT_INV_memROM~5_combout\ <= NOT \ROM|memROM~5_combout\;
\UC|ALT_INV_Equal2~0_combout\ <= NOT \UC|Equal2~0_combout\;
\ROM|ALT_INV_memROM~4_combout\ <= NOT \ROM|memROM~4_combout\;
\ROM|ALT_INV_memROM~3_combout\ <= NOT \ROM|memROM~3_combout\;
\PC_entity|ALT_INV_DOUT\(2) <= NOT \PC_entity|DOUT\(2);
\bancoRegs|ALT_INV_saidaA[0]~0_combout\ <= NOT \bancoRegs|saidaA[0]~0_combout\;
\bancoRegs|ALT_INV_Equal1~0_combout\ <= NOT \bancoRegs|Equal1~0_combout\;
\ROM|ALT_INV_memROM~2_combout\ <= NOT \ROM|memROM~2_combout\;
\ROM|ALT_INV_memROM~1_combout\ <= NOT \ROM|memROM~1_combout\;
\ROM|ALT_INV_memROM~0_combout\ <= NOT \ROM|memROM~0_combout\;
\PC_entity|ALT_INV_DOUT\(6) <= NOT \PC_entity|DOUT\(6);
\PC_entity|ALT_INV_DOUT\(5) <= NOT \PC_entity|DOUT\(5);
\PC_entity|ALT_INV_DOUT\(4) <= NOT \PC_entity|DOUT\(4);
\PC_entity|ALT_INV_DOUT\(3) <= NOT \PC_entity|DOUT\(3);
\PC_entity|ALT_INV_DOUT\(7) <= NOT \PC_entity|DOUT\(7);
\bancoRegs|ALT_INV_registrador~294_q\ <= NOT \bancoRegs|registrador~294_q\;
\bancoRegs|ALT_INV_registrador~38_q\ <= NOT \bancoRegs|registrador~38_q\;
\ULA|ula27|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula27|soma_sub|saida_xor~combout\;
\ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula26|mux_ula|saida_MUX~0_combout\;
\ULA|ula25|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula25|mux_ula|saida_MUX~1_combout\;
\ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula25|mux_ula|saida_MUX~0_combout\;
\ULA|ula25|soma_sub|ALT_INV_saida~combout\ <= NOT \ULA|ula25|soma_sub|saida~combout\;
\ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula24|mux_ula|saida_MUX~0_combout\;
\ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula23|mux_ula|saida_MUX~0_combout\;
\ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula22|mux_ula|saida_MUX~1_combout\;
\ULA|ula22|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula22|mux_ula|saida_MUX~0_combout\;
\ULA|ula22|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula22|soma_sub|saida_xor~combout\;
\ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula21|mux_ula|saida_MUX~0_combout\;
\ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula20|mux_ula|saida_MUX~0_combout\;
\ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula19|mux_ula|saida_MUX~0_combout\;
\ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula18|mux_ula|saida_MUX~0_combout\;
\ULA|ula17|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula17|soma_sub|carry_out~combout\;
\ULA|ula17|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula17|mux_ula|saida_MUX~1_combout\;
\ULA|ula17|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula17|mux_ula|saida_MUX~0_combout\;
\ULA|ula17|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula17|soma_sub|saida_xor~combout\;
\ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula16|mux_ula|saida_MUX~0_combout\;
\ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula15|mux_ula|saida_MUX~0_combout\;
\ULA|ula14|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula14|soma_sub|carry_out~combout\;
\ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula14|mux_ula|saida_MUX~0_combout\;
\ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula13|mux_ula|saida_MUX~0_combout\;
\ULA|ula13|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula13|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula12|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula12|soma_sub|carry_out~combout\;
\ULA|ula12|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula12|mux_ula|saida_MUX~1_combout\;
\ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula12|mux_ula|saida_MUX~0_combout\;
\ULA|ula12|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula12|soma_sub|saida_xor~combout\;
\ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula11|mux_ula|saida_MUX~0_combout\;
\ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula10|mux_ula|saida_MUX~0_combout\;
\ULA|ula9|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula9|soma_sub|carry_out~combout\;
\ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula9|mux_ula|saida_MUX~0_combout\;
\ULA|ula8|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula8|mux_ula|saida_MUX~1_combout\;
\ULA|ula8|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula8|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[8]~19_combout\ <= NOT \bancoRegs|saidaB[8]~19_combout\;
\ULA|ula7|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula7|soma_sub|carry_out~combout\;
\ULA|ula7|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula7|mux_ula|saida_MUX~1_combout\;
\ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula7|mux_ula|saida_MUX~0_combout\;
\ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula1|mux_ula|saida_MUX~1_combout\;
\ULA|ula7|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula7|soma_sub|saida_xor~combout\;
\ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula6|mux_ula|saida_MUX~0_combout\;
\ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula5|mux_ula|saida_MUX~0_combout\;
\ULA|ula4|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula4|soma_sub|carry_out~combout\;
\ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula4|mux_ula|saida_MUX~0_combout\;
\ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula3|mux_ula|saida_MUX~0_combout\;
\ULA|ula3|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula3|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula2|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula2|soma_sub|carry_out~combout\;
\ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|mux_ula|saida_MUX~0_combout\;
\ULA|ula1|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula1|soma_sub|carry_out~combout\;
\ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula1|mux_ula|saida_MUX~0_combout\;
\ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula8|mux_ula|saida_MUX~0_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~1_combout\;
\ULA|ula0|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|mux_inverteB|saida_MUX~0_combout\;
\ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|mux_ula|saida_MUX~0_combout\;
\ULA|ula31|mux_ula|ALT_INV_Equal0~0_combout\ <= NOT \ULA|ula31|mux_ula|Equal0~0_combout\;
\UC|ALT_INV_palavraControle[9]~1_combout\ <= NOT \UC|palavraControle[9]~1_combout\;
\UC_ULA|ALT_INV_ula_ctrl~2_combout\ <= NOT \UC_ULA|ula_ctrl~2_combout\;
\ULA|ula31|soma_sub|ALT_INV_saida~0_combout\ <= NOT \ULA|ula31|soma_sub|saida~0_combout\;
\bancoRegs|ALT_INV_saidaA[31]~31_combout\ <= NOT \bancoRegs|saidaA[31]~31_combout\;
\bancoRegs|ALT_INV_registrador~325_q\ <= NOT \bancoRegs|registrador~325_q\;
\bancoRegs|ALT_INV_registrador~69_q\ <= NOT \bancoRegs|registrador~69_q\;
\ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula31|mux_inverteB|saida_MUX~0_combout\;
\mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\ <= NOT \mux_rt_imediato|saida_MUX[31]~0_combout\;
\bancoRegs|ALT_INV_saidaB[31]~18_combout\ <= NOT \bancoRegs|saidaB[31]~18_combout\;
\ULA|ula30|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula30|soma_sub|carry_out~combout\;
\ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula30|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[30]~17_combout\ <= NOT \bancoRegs|saidaB[30]~17_combout\;
\bancoRegs|ALT_INV_saidaA[30]~30_combout\ <= NOT \bancoRegs|saidaA[30]~30_combout\;
\bancoRegs|ALT_INV_registrador~324_q\ <= NOT \bancoRegs|registrador~324_q\;
\bancoRegs|ALT_INV_registrador~68_q\ <= NOT \bancoRegs|registrador~68_q\;
\ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula29|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[29]~16_combout\ <= NOT \bancoRegs|saidaB[29]~16_combout\;
\bancoRegs|ALT_INV_saidaA[29]~29_combout\ <= NOT \bancoRegs|saidaA[29]~29_combout\;
\bancoRegs|ALT_INV_registrador~323_q\ <= NOT \bancoRegs|registrador~323_q\;
\bancoRegs|ALT_INV_registrador~67_q\ <= NOT \bancoRegs|registrador~67_q\;
\ULA|ula28|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula28|soma_sub|saida_and~0_combout\;
\ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula28|soma_sub|saida_xor2~combout\;
\ULA|ula28|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula28|soma_sub|saida_xor~combout\;
\ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula28|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[28]~15_combout\ <= NOT \bancoRegs|saidaB[28]~15_combout\;
\bancoRegs|ALT_INV_saidaA[28]~28_combout\ <= NOT \bancoRegs|saidaA[28]~28_combout\;
\bancoRegs|ALT_INV_registrador~322_q\ <= NOT \bancoRegs|registrador~322_q\;
\bancoRegs|ALT_INV_registrador~66_q\ <= NOT \bancoRegs|registrador~66_q\;
\ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula27|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[27]~14_combout\ <= NOT \bancoRegs|saidaB[27]~14_combout\;
\bancoRegs|ALT_INV_saidaA[27]~27_combout\ <= NOT \bancoRegs|saidaA[27]~27_combout\;
\bancoRegs|ALT_INV_registrador~321_q\ <= NOT \bancoRegs|registrador~321_q\;
\bancoRegs|ALT_INV_registrador~65_q\ <= NOT \bancoRegs|registrador~65_q\;
\ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula26|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[26]~13_combout\ <= NOT \bancoRegs|saidaB[26]~13_combout\;
\bancoRegs|ALT_INV_saidaA[26]~26_combout\ <= NOT \bancoRegs|saidaA[26]~26_combout\;
\bancoRegs|ALT_INV_registrador~320_q\ <= NOT \bancoRegs|registrador~320_q\;
\bancoRegs|ALT_INV_registrador~64_q\ <= NOT \bancoRegs|registrador~64_q\;
\ULA|ula25|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula25|soma_sub|carry_out~combout\;
\ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula25|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[25]~12_combout\ <= NOT \bancoRegs|saidaB[25]~12_combout\;
\bancoRegs|ALT_INV_saidaA[25]~25_combout\ <= NOT \bancoRegs|saidaA[25]~25_combout\;
\bancoRegs|ALT_INV_registrador~319_q\ <= NOT \bancoRegs|registrador~319_q\;
\bancoRegs|ALT_INV_registrador~63_q\ <= NOT \bancoRegs|registrador~63_q\;
\ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula24|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[24]~11_combout\ <= NOT \bancoRegs|saidaB[24]~11_combout\;
\bancoRegs|ALT_INV_saidaA[24]~24_combout\ <= NOT \bancoRegs|saidaA[24]~24_combout\;
\bancoRegs|ALT_INV_registrador~318_q\ <= NOT \bancoRegs|registrador~318_q\;
\bancoRegs|ALT_INV_registrador~62_q\ <= NOT \bancoRegs|registrador~62_q\;
\ULA|ula23|soma_sub|ALT_INV_saida_and~0_combout\ <= NOT \ULA|ula23|soma_sub|saida_and~0_combout\;
\ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\ <= NOT \ULA|ula23|soma_sub|saida_xor2~combout\;
\ULA|ula23|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula23|soma_sub|saida_xor~combout\;
\ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula23|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[23]~10_combout\ <= NOT \bancoRegs|saidaB[23]~10_combout\;
\bancoRegs|ALT_INV_saidaA[23]~23_combout\ <= NOT \bancoRegs|saidaA[23]~23_combout\;
\bancoRegs|ALT_INV_registrador~317_q\ <= NOT \bancoRegs|registrador~317_q\;
\bancoRegs|ALT_INV_registrador~61_q\ <= NOT \bancoRegs|registrador~61_q\;
\ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula22|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[22]~9_combout\ <= NOT \bancoRegs|saidaB[22]~9_combout\;
\bancoRegs|ALT_INV_saidaA[22]~22_combout\ <= NOT \bancoRegs|saidaA[22]~22_combout\;
\bancoRegs|ALT_INV_registrador~316_q\ <= NOT \bancoRegs|registrador~316_q\;
\bancoRegs|ALT_INV_registrador~60_q\ <= NOT \bancoRegs|registrador~60_q\;
\ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula21|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[21]~8_combout\ <= NOT \bancoRegs|saidaB[21]~8_combout\;
\bancoRegs|ALT_INV_saidaA[21]~21_combout\ <= NOT \bancoRegs|saidaA[21]~21_combout\;
\bancoRegs|ALT_INV_registrador~315_q\ <= NOT \bancoRegs|registrador~315_q\;
\bancoRegs|ALT_INV_registrador~59_q\ <= NOT \bancoRegs|registrador~59_q\;
\ULA|ula20|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula20|soma_sub|carry_out~combout\;
\ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula20|mux_inverteB|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_saidaB[20]~7_combout\ <= NOT \bancoRegs|saidaB[20]~7_combout\;
\bancoRegs|ALT_INV_saidaA[20]~20_combout\ <= NOT \bancoRegs|saidaA[20]~20_combout\;
\bancoRegs|ALT_INV_registrador~1223_combout\ <= NOT \bancoRegs|registrador~1223_combout\;
\bancoRegs|ALT_INV_registrador~1222_combout\ <= NOT \bancoRegs|registrador~1222_combout\;
\bancoRegs|ALT_INV_registrador~1221_combout\ <= NOT \bancoRegs|registrador~1221_combout\;
\bancoRegs|ALT_INV_registrador~1220_combout\ <= NOT \bancoRegs|registrador~1220_combout\;
\bancoRegs|ALT_INV_registrador~1219_combout\ <= NOT \bancoRegs|registrador~1219_combout\;
\bancoRegs|ALT_INV_registrador~1218_combout\ <= NOT \bancoRegs|registrador~1218_combout\;
\bancoRegs|ALT_INV_registrador~1217_combout\ <= NOT \bancoRegs|registrador~1217_combout\;
\bancoRegs|ALT_INV_registrador~1216_combout\ <= NOT \bancoRegs|registrador~1216_combout\;
\bancoRegs|ALT_INV_registrador~1215_combout\ <= NOT \bancoRegs|registrador~1215_combout\;
\bancoRegs|ALT_INV_registrador~1214_combout\ <= NOT \bancoRegs|registrador~1214_combout\;
\bancoRegs|ALT_INV_registrador~1213_combout\ <= NOT \bancoRegs|registrador~1213_combout\;
\bancoRegs|ALT_INV_registrador~1212_combout\ <= NOT \bancoRegs|registrador~1212_combout\;
\bancoRegs|ALT_INV_registrador~1211_combout\ <= NOT \bancoRegs|registrador~1211_combout\;
\bancoRegs|ALT_INV_registrador~1210_combout\ <= NOT \bancoRegs|registrador~1210_combout\;
\bancoRegs|ALT_INV_registrador~1209_combout\ <= NOT \bancoRegs|registrador~1209_combout\;
\bancoRegs|ALT_INV_registrador~1208_combout\ <= NOT \bancoRegs|registrador~1208_combout\;
\bancoRegs|ALT_INV_registrador~1207_combout\ <= NOT \bancoRegs|registrador~1207_combout\;
\bancoRegs|ALT_INV_registrador~1206_combout\ <= NOT \bancoRegs|registrador~1206_combout\;
\bancoRegs|ALT_INV_registrador~1205_combout\ <= NOT \bancoRegs|registrador~1205_combout\;
\bancoRegs|ALT_INV_registrador~1204_combout\ <= NOT \bancoRegs|registrador~1204_combout\;
\bancoRegs|ALT_INV_registrador~1203_combout\ <= NOT \bancoRegs|registrador~1203_combout\;
\bancoRegs|ALT_INV_registrador~1202_combout\ <= NOT \bancoRegs|registrador~1202_combout\;
\bancoRegs|ALT_INV_registrador~1201_combout\ <= NOT \bancoRegs|registrador~1201_combout\;
\bancoRegs|ALT_INV_registrador~1200_combout\ <= NOT \bancoRegs|registrador~1200_combout\;
\bancoRegs|ALT_INV_registrador~1199_combout\ <= NOT \bancoRegs|registrador~1199_combout\;
\bancoRegs|ALT_INV_registrador~1198_combout\ <= NOT \bancoRegs|registrador~1198_combout\;
\bancoRegs|ALT_INV_registrador~1197_combout\ <= NOT \bancoRegs|registrador~1197_combout\;
\bancoRegs|ALT_INV_registrador~1196_combout\ <= NOT \bancoRegs|registrador~1196_combout\;
\bancoRegs|ALT_INV_registrador~1195_combout\ <= NOT \bancoRegs|registrador~1195_combout\;
\bancoRegs|ALT_INV_registrador~1194_combout\ <= NOT \bancoRegs|registrador~1194_combout\;
\bancoRegs|ALT_INV_registrador~1193_combout\ <= NOT \bancoRegs|registrador~1193_combout\;
\bancoRegs|ALT_INV_registrador~1192_combout\ <= NOT \bancoRegs|registrador~1192_combout\;
\UC|ALT_INV_Equal3~0_combout\ <= NOT \UC|Equal3~0_combout\;
\UC|ALT_INV_Equal8~0_combout\ <= NOT \UC|Equal8~0_combout\;
\UC|ALT_INV_Equal1~0_combout\ <= NOT \UC|Equal1~0_combout\;
\ROM|ALT_INV_memROM~15_combout\ <= NOT \ROM|memROM~15_combout\;
\ROM|ALT_INV_memROM~14_combout\ <= NOT \ROM|memROM~14_combout\;
\UC|ALT_INV_sel_mux4~0_combout\ <= NOT \UC|sel_mux4~0_combout\;
\ROM|ALT_INV_memROM~13_combout\ <= NOT \ROM|memROM~13_combout\;
\ALT_INV_monitora_flag_z~9_combout\ <= NOT \monitora_flag_z~9_combout\;
\ALT_INV_monitora_flag_z~8_combout\ <= NOT \monitora_flag_z~8_combout\;
\ALT_INV_monitora_flag_z~7_combout\ <= NOT \monitora_flag_z~7_combout\;
\ALT_INV_monitora_flag_z~6_combout\ <= NOT \monitora_flag_z~6_combout\;
\ALT_INV_monitora_flag_z~5_combout\ <= NOT \monitora_flag_z~5_combout\;
\ALT_INV_monitora_flag_z~4_combout\ <= NOT \monitora_flag_z~4_combout\;
\ALT_INV_monitora_flag_z~3_combout\ <= NOT \monitora_flag_z~3_combout\;
\ALT_INV_monitora_flag_z~2_combout\ <= NOT \monitora_flag_z~2_combout\;
\ALT_INV_monitora_flag_z~1_combout\ <= NOT \monitora_flag_z~1_combout\;
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
\ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula31|mux_ula|saida_MUX~0_combout\;
\ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula30|mux_ula|saida_MUX~1_combout\;
\ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula30|mux_ula|saida_MUX~0_combout\;
\ULA|ula30|soma_sub|ALT_INV_saida_xor~combout\ <= NOT \ULA|ula30|soma_sub|saida_xor~combout\;
\ULA|ula29|soma_sub|ALT_INV_carry_out~combout\ <= NOT \ULA|ula29|soma_sub|carry_out~combout\;
\ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula29|mux_ula|saida_MUX~0_combout\;
\ULA|ula28|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula28|mux_ula|saida_MUX~1_combout\;
\ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula28|mux_ula|saida_MUX~0_combout\;
\ULA|ula28|soma_sub|ALT_INV_saida~combout\ <= NOT \ULA|ula28|soma_sub|saida~combout\;
\ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula27|mux_ula|saida_MUX~1_combout\;
\ULA|ula27|mux_ula|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula27|mux_ula|saida_MUX~0_combout\;
\bancoRegs|ALT_INV_Equal0~0_combout\ <= NOT \bancoRegs|Equal0~0_combout\;
\ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\ <= NOT \ULA|ula8|mux_ula|saida_MUX~2_combout\;
\ULA|ula23|mux_ula|ALT_INV_saida_MUX~2_combout\ <= NOT \ULA|ula23|mux_ula|saida_MUX~2_combout\;
\ULA|ula23|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula23|mux_ula|saida_MUX~1_combout\;
\ULA|ula20|mux_ula|ALT_INV_saida_MUX~1_combout\ <= NOT \ULA|ula20|mux_ula|saida_MUX~1_combout\;

\ULA_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula0|mux_ula|saida_MUX~2_combout\,
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
	i => \ULA|ula2|mux_ula|saida_MUX~0_combout\,
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
	i => \ULA|ula7|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula8|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula12|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula17|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula22|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula24|mux_ula|saida_MUX~0_combout\,
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
	i => \ULA|ula25|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula27|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula28|mux_ula|saida_MUX~1_combout\,
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
	i => \ULA|ula29|mux_ula|saida_MUX~0_combout\,
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
	i => \ULA|ula30|mux_ula|saida_MUX~1_combout\,
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
	i => \monitora_flag_z~10_combout\,
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

\ROM|memROM~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~10_combout\ = (!\PC_entity|DOUT\(5) & ((!\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(3) & \PC_entity|DOUT\(4))) # (\PC_entity|DOUT\(2) & (\PC_entity|DOUT\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100000000000110010000000000011001000000000001100100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~10_combout\);

\ROM|memROM~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~12_combout\ = (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \ROM|memROM~10_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~10_combout\,
	combout => \ROM|memROM~12_combout\);

\PC_Soma_Constante|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~21_sumout\ = SUM(( \PC_entity|DOUT\(2) ) + ( VCC ) + ( !VCC ))
-- \PC_Soma_Constante|Add0~22\ = CARRY(( \PC_entity|DOUT\(2) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(2),
	cin => GND,
	sumout => \PC_Soma_Constante|Add0~21_sumout\,
	cout => \PC_Soma_Constante|Add0~22\);

\PC_Soma_Constante|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~5_sumout\ = SUM(( \PC_entity|DOUT\(3) ) + ( GND ) + ( \PC_Soma_Constante|Add0~22\ ))
-- \PC_Soma_Constante|Add0~6\ = CARRY(( \PC_entity|DOUT\(3) ) + ( GND ) + ( \PC_Soma_Constante|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(3),
	cin => \PC_Soma_Constante|Add0~22\,
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

\ROM|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~3_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~3_combout\);

\ROM|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~4_combout\ = (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & ((!\PC_entity|DOUT\(2)) # (!\PC_entity|DOUT\(5)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000000110000001000000011000000100000001100000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~4_combout\);

\ROM|memROM~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~13_combout\ = (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \ROM|memROM~4_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~4_combout\,
	combout => \ROM|memROM~13_combout\);

\ROM|memROM~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~9_combout\ = ( !\PC_entity|DOUT\(6) & ( \PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & (\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	dataf => \PC_entity|ALT_INV_DOUT\(2),
	combout => \ROM|memROM~9_combout\);

\UC|Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal3~0_combout\ = (!\ROM|memROM~3_combout\ & (\ROM|memROM~13_combout\ & !\ROM|memROM~9_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000000000011000000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM|ALT_INV_memROM~3_combout\,
	datac => \ROM|ALT_INV_memROM~13_combout\,
	datad => \ROM|ALT_INV_memROM~9_combout\,
	combout => \UC|Equal3~0_combout\);

\UC|sel_mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|sel_mux4~0_combout\ = (!\ROM|memROM~3_combout\ & (((!\ROM|memROM~13_combout\)))) # (\ROM|memROM~3_combout\ & ((!\ROM|memROM~13_combout\ & ((\ROM|memROM~9_combout\))) # (\ROM|memROM~13_combout\ & (!\PC_entity|DOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001011110010110000101111001011000010111100101100001011110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \ROM|ALT_INV_memROM~3_combout\,
	datac => \ROM|ALT_INV_memROM~13_combout\,
	datad => \ROM|ALT_INV_memROM~9_combout\,
	combout => \UC|sel_mux4~0_combout\);

\UC|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal1~0_combout\ = ( \ROM|memROM~4_combout\ & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & \ROM|memROM~3_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000100000000000000000000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \ROM|ALT_INV_memROM~3_combout\,
	datae => \ROM|ALT_INV_memROM~4_combout\,
	combout => \UC|Equal1~0_combout\);

\bancoRegs|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|Equal0~0_combout\ = (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(5) & !\PC_entity|DOUT\(7)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(6),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(7),
	combout => \bancoRegs|Equal0~0_combout\);

\ROM|memROM~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~14_combout\ = ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) ) # ( !\PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & 
-- (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~14_combout\);

\ROM|memROM~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~15_combout\ = (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(5) & !\PC_entity|DOUT\(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~15_combout\);

\UC|Equal8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal8~0_combout\ = ( \ROM|memROM~4_combout\ & ( !\ROM|memROM~9_combout\ & ( (!\ROM|memROM~3_combout\ & ((\PC_entity|DOUT\(6)) # (\PC_entity|DOUT\(7)))) ) ) ) # ( !\ROM|memROM~4_combout\ & ( !\ROM|memROM~9_combout\ & ( !\ROM|memROM~3_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000011101110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datad => \ROM|ALT_INV_memROM~3_combout\,
	datae => \ROM|ALT_INV_memROM~4_combout\,
	dataf => \ROM|ALT_INV_memROM~9_combout\,
	combout => \UC|Equal8~0_combout\);

\bancoRegs|registrador~1191\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1191_combout\ = ( \UC|Equal8~0_combout\ & ( \ROM|memROM~2_combout\ ) ) # ( !\UC|Equal8~0_combout\ & ( (!\ROM|memROM~2_combout\ & (!\ROM|memROM~14_combout\ & (\ROM|memROM~15_combout\ & \UC|Equal1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000010101010101010100000000000010000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ROM|ALT_INV_memROM~14_combout\,
	datac => \ROM|ALT_INV_memROM~15_combout\,
	datad => \UC|ALT_INV_Equal1~0_combout\,
	datae => \UC|ALT_INV_Equal8~0_combout\,
	combout => \bancoRegs|registrador~1191_combout\);

\bancoRegs|registrador~323\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[29]~29_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~323_q\);

\bancoRegs|registrador~1221\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1221_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~67_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~67_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1221_combout\);

\bancoRegs|registrador~1178\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1178_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1221_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1221_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1221_combout\ & ( (\bancoRegs|registrador~323_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~323_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1221_combout\,
	combout => \bancoRegs|registrador~1178_combout\);

\bancoRegs|saidaB[29]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[29]~16_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1178_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1178_combout\,
	combout => \bancoRegs|saidaB[29]~16_combout\);

\UC|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal2~0_combout\ = (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\ROM|memROM~3_combout\ & \ROM|memROM~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000100000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~4_combout\,
	combout => \UC|Equal2~0_combout\);

\bancoRegs|registrador~295\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[1]~1_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~295_q\);

\bancoRegs|registrador~1193\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1193_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~39_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~39_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1193_combout\);

\bancoRegs|registrador~1066\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1066_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1193_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1193_combout\ ) ) # ( \ROM|memROM~2_combout\ & ( 
-- !\bancoRegs|registrador~1193_combout\ & ( \ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1193_combout\ & ( (\bancoRegs|registrador~295_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000001111111111111111111111111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~295_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1193_combout\,
	combout => \bancoRegs|registrador~1066_combout\);

\ULA|ula1|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1066_combout\ & ( (!\UC|Equal2~0_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\))))) # (\UC|Equal2~0_combout\ & (((\ROM|memROM~8_combout\)))) ) ) # ( 
-- !\bancoRegs|registrador~1066_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~8_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001100000011101000110101001111110011000000111010001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \UC|ALT_INV_Equal2~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1066_combout\,
	combout => \ULA|ula1|mux_inverteB|saida_MUX~0_combout\);

\UC|palavraControle[9]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|palavraControle[9]~0_combout\ = ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(3) & !\PC_entity|DOUT\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(3),
	datad => \PC_entity|ALT_INV_DOUT\(4),
	datae => \PC_entity|ALT_INV_DOUT\(5),
	combout => \UC|palavraControle[9]~0_combout\);

\monitora_flag_z~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~0_combout\ = ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \monitora_flag_z~0_combout\);

\UC_ULA|ula_ctrl~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~0_combout\ = ( !\PC_entity|DOUT\(5) & ( \PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \PC_entity|DOUT\(3))) ) ) ) # ( !\PC_entity|DOUT\(5) & ( !\PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & 
-- (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(3) & \PC_entity|DOUT\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000001000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(3),
	datad => \PC_entity|ALT_INV_DOUT\(4),
	datae => \PC_entity|ALT_INV_DOUT\(5),
	dataf => \PC_entity|ALT_INV_DOUT\(2),
	combout => \UC_ULA|ula_ctrl~0_combout\);

\ULA|ula8|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_ula|saida_MUX~0_combout\ = ( !\monitora_flag_z~0_combout\ & ( \UC_ULA|ula_ctrl~0_combout\ & ( !\UC|palavraControle[9]~0_combout\ ) ) ) # ( !\monitora_flag_z~0_combout\ & ( !\UC_ULA|ula_ctrl~0_combout\ & ( (!\UC|palavraControle[9]~0_combout\ 
-- & ((!\ROM|memROM~2_combout\) # ((\ROM|memROM~6_combout\ & !\ROM|memROM~8_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101000000000000000000000000011111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	datad => \UC|ALT_INV_palavraControle[9]~0_combout\,
	datae => \ALT_INV_monitora_flag_z~0_combout\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \ULA|ula8|mux_ula|saida_MUX~0_combout\);

\ULA|ula1|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[1]~1_combout\ & (\ULA|ula1|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[1]~1_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula1|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula0|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[1]~1_combout\ $ (\ULA|ula1|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~1_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula1|mux_ula|saida_MUX~0_combout\);

\bancoRegs|saidaB[1]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[1]~21_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1066_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1066_combout\,
	combout => \bancoRegs|saidaB[1]~21_combout\);

\bancoRegs|registrador~296\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[2]~2_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~296_q\);

\bancoRegs|registrador~1194\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1194_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~40_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~40_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1194_combout\);

\bancoRegs|registrador~1070\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1070_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1194_combout\ ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1194_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\bancoRegs|registrador~1194_combout\ & ( (\bancoRegs|registrador~296_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~296_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1194_combout\,
	combout => \bancoRegs|registrador~1070_combout\);

\bancoRegs|saidaB[2]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[2]~22_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1070_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1070_combout\,
	combout => \bancoRegs|saidaB[2]~22_combout\);

\bancoRegs|registrador~297\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[3]~3_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~297_q\);

\bancoRegs|registrador~1195\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1195_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~41_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~41_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1195_combout\);

\bancoRegs|registrador~1074\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1074_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1195_combout\ ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1195_combout\ ) ) # ( \ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1195_combout\ & ( 
-- \ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1195_combout\ & ( (\bancoRegs|registrador~297_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~297_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1195_combout\,
	combout => \bancoRegs|registrador~1074_combout\);

\bancoRegs|saidaB[3]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[3]~23_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1074_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \bancoRegs|saidaB[3]~23_combout\);

\bancoRegs|registrador~298\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[4]~4_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~298_q\);

\bancoRegs|registrador~1196\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1196_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~42_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~42_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1196_combout\);

\bancoRegs|registrador~1078\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1078_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1196_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1196_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1196_combout\ & ( (\bancoRegs|registrador~298_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~298_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1196_combout\,
	combout => \bancoRegs|registrador~1078_combout\);

\bancoRegs|saidaB[4]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[4]~24_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1078_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1078_combout\,
	combout => \bancoRegs|saidaB[4]~24_combout\);

\bancoRegs|registrador~300\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[6]~6_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~300_q\);

\bancoRegs|registrador~1198\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1198_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~44_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~44_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1198_combout\);

\bancoRegs|registrador~1086\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1086_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1198_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1198_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1198_combout\ & ( (\bancoRegs|registrador~300_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~300_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1198_combout\,
	combout => \bancoRegs|registrador~1086_combout\);

\bancoRegs|saidaB[6]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[6]~26_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1086_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1086_combout\,
	combout => \bancoRegs|saidaB[6]~26_combout\);

\ULA|ula6|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1086_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1086_combout\,
	combout => \ULA|ula6|mux_inverteB|saida_MUX~0_combout\);

\bancoRegs|registrador~301\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[7]~7_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~301_q\);

\bancoRegs|registrador~1199\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1199_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~45_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~45_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1199_combout\);

\bancoRegs|registrador~1090\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1090_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1199_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1199_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1199_combout\ & ( (\bancoRegs|registrador~301_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~301_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1199_combout\,
	combout => \bancoRegs|registrador~1090_combout\);

\bancoRegs|saidaB[7]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[7]~27_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1090_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[7]~7_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula7|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula7|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[7]~7_combout\);

\bancoRegs|registrador~1190\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1190_combout\ = ( \UC|Equal8~0_combout\ & ( !\ROM|memROM~2_combout\ ) ) # ( !\UC|Equal8~0_combout\ & ( (!\ROM|memROM~2_combout\ & (!\ROM|memROM~14_combout\ & (!\ROM|memROM~15_combout\ & \UC|Equal1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000101010101010101000000000100000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ROM|ALT_INV_memROM~14_combout\,
	datac => \ROM|ALT_INV_memROM~15_combout\,
	datad => \UC|ALT_INV_Equal1~0_combout\,
	datae => \UC|ALT_INV_Equal8~0_combout\,
	combout => \bancoRegs|registrador~1190_combout\);

\bancoRegs|registrador~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[7]~7_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~45_q\);

\ROM|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~0_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(3) $ (!\PC_entity|DOUT\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100000000000000000000000000000101000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~0_combout\);

\bancoRegs|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|Equal1~0_combout\ = ( !\PC_entity|DOUT\(7) & ( (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(6) & ((\PC_entity|DOUT\(4)) # (\PC_entity|DOUT\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000000000000000000000001110000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(3),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	datae => \PC_entity|ALT_INV_DOUT\(7),
	combout => \bancoRegs|Equal1~0_combout\);

\bancoRegs|saidaA[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[7]~7_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~301_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~45_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~45_q\,
	datab => \bancoRegs|ALT_INV_registrador~301_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[7]~7_combout\);

\ULA|ula7|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|soma_sub|saida_xor~combout\ = ( \bancoRegs|registrador~1090_combout\ & ( !\bancoRegs|saidaA[7]~7_combout\ $ (((!\bancoRegs|Equal0~0_combout\ $ (!\UC_ULA|ula_ctrl[2]~1_combout\)) # (\UC|Equal2~0_combout\))) ) ) # ( 
-- !\bancoRegs|registrador~1090_combout\ & ( !\bancoRegs|saidaA[7]~7_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\) # (\UC|Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000111111100001000111101111000000001111111000010001111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[7]~7_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1090_combout\,
	combout => \ULA|ula7|soma_sub|saida_xor~combout\);

\ULA|ula7|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1090_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1090_combout\,
	combout => \ULA|ula7|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula7|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[7]~7_combout\ & (\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[7]~7_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula7|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[7]~7_combout\,
	datab => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|mux_ula|saida_MUX~0_combout\);

\ULA|ula7|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula7|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula7|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula7|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula7|soma_sub|saida_xor~combout\ $ (((!\ULA|ula5|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[6]~6_combout\ & !\ULA|ula6|mux_inverteB|saida_MUX~0_combout\)) 
-- # (\ULA|ula5|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[6]~6_combout\) # (!\ULA|ula6|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[6]~6_combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula7|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula7|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|mux_ula|saida_MUX~1_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[6]~6_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula6|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[6]~6_combout\);

\bancoRegs|registrador~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[6]~6_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~44_q\);

\bancoRegs|saidaA[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[6]~6_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~300_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~44_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~44_q\,
	datab => \bancoRegs|ALT_INV_registrador~300_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[6]~6_combout\);

\ULA|ula6|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[6]~6_combout\ & (\ULA|ula6|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[6]~6_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula6|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula5|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[6]~6_combout\ $ (!\ULA|ula6|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[6]~6_combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula6|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[4]~4_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula4|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[4]~4_combout\);

\bancoRegs|registrador~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[4]~4_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~42_q\);

\bancoRegs|saidaA[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[4]~4_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~298_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~42_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~42_q\,
	datab => \bancoRegs|ALT_INV_registrador~298_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[4]~4_combout\);

\ULA|ula4|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1078_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1078_combout\,
	combout => \ULA|ula4|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula4|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|soma_sub|carry_out~combout\ = (!\bancoRegs|saidaA[4]~4_combout\ & ((!\ULA|ula4|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula3|soma_sub|saida_xor2~combout\ & !\ULA|ula3|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[4]~4_combout\ & 
-- (!\ULA|ula3|soma_sub|saida_xor2~combout\ & (!\ULA|ula3|soma_sub|saida_and~0_combout\ & !\ULA|ula4|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010000000111110001000000011111000100000001111100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[4]~4_combout\,
	datad => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula4|soma_sub|carry_out~combout\);

\bancoRegs|registrador~299\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[5]~5_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~299_q\);

\bancoRegs|registrador~1197\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1197_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~43_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~43_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1197_combout\);

\bancoRegs|registrador~1082\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1082_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1197_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1197_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1197_combout\ & ( (\bancoRegs|registrador~299_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~299_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1197_combout\,
	combout => \bancoRegs|registrador~1082_combout\);

\bancoRegs|saidaB[5]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[5]~25_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1082_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1082_combout\,
	combout => \bancoRegs|saidaB[5]~25_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[5]~5_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula5|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[5]~5_combout\);

\bancoRegs|registrador~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[5]~5_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~43_q\);

\bancoRegs|saidaA[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[5]~5_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~299_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~43_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~43_q\,
	datab => \bancoRegs|ALT_INV_registrador~299_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[5]~5_combout\);

\ULA|ula5|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1082_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\bancoRegs|Equal0~0_combout\ $ (\UC_ULA|ula_ctrl[2]~1_combout\)))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~2_combout\)) ) ) # ( 
-- !\bancoRegs|registrador~1082_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010100000101110001010011010111110101000001011100010100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC|ALT_INV_Equal2~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1082_combout\,
	combout => \ULA|ula5|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula5|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[5]~5_combout\ & (\ULA|ula5|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[5]~5_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula5|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula4|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[5]~5_combout\ $ (!\ULA|ula5|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula4|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[5]~5_combout\,
	datac => \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula5|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[3]~3_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula3|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[3]~3_combout\);

\bancoRegs|registrador~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[3]~3_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~41_q\);

\bancoRegs|saidaA[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[3]~3_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\ROM|memROM~0_combout\) # (\bancoRegs|registrador~297_q\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~41_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~41_q\,
	datab => \bancoRegs|ALT_INV_registrador~297_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[3]~3_combout\);

\ULA|ula3|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_and~0_combout\ = ( \bancoRegs|saidaA[3]~3_combout\ & ( \bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\))))) # (\UC|Equal2~0_combout\ & 
-- (((\ROM|memROM~6_combout\)))) ) ) ) # ( \bancoRegs|saidaA[3]~3_combout\ & ( !\bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100110000001100000000000000001010001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \UC|ALT_INV_Equal2~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[3]~3_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \ULA|ula3|soma_sub|saida_and~0_combout\);

\ULA|ula4|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula4|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[4]~4_combout\) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[4]~4_combout\ & \ULA|ula4|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( !\bancoRegs|saidaA[4]~4_combout\ $ (!\ULA|ula4|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula3|soma_sub|saida_and~0_combout\) # (\ULA|ula3|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[4]~4_combout\,
	datad => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula4|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[2]~2_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula2|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[2]~2_combout\);

\bancoRegs|registrador~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[2]~2_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~40_q\);

\bancoRegs|saidaA[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[2]~2_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~296_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~40_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~40_q\,
	datab => \bancoRegs|ALT_INV_registrador~296_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[2]~2_combout\);

\ULA|ula2|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1070_combout\ & ( (!\UC|Equal2~0_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\))))) # (\UC|Equal2~0_combout\ & (((\ROM|memROM~12_combout\)))) ) ) # ( 
-- !\bancoRegs|registrador~1070_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~12_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111100000011100010110100011111001111000000111000101101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \ROM|ALT_INV_memROM~12_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1070_combout\,
	combout => \ULA|ula2|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula2|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|soma_sub|carry_out~combout\ = ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( ((!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~1_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula0|soma_sub|carry_out~combout\ 
-- & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~1_combout\)))) # (\bancoRegs|saidaA[2]~2_combout\) ) ) # ( !\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[2]~2_combout\ & 
-- ((!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~1_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula0|soma_sub|carry_out~combout\ & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~1_combout\))))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111100000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~1_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[2]~2_combout\,
	datae => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula2|soma_sub|carry_out~combout\);

\ULA|ula3|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|mux_inverteB|saida_MUX~0_combout\ = ( \bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\))))) # (\UC|Equal2~0_combout\ & (((\ROM|memROM~6_combout\)))) ) ) # ( 
-- !\bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~6_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001100000011101000110101001111110011000000111010001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \UC|ALT_INV_Equal2~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \ULA|ula3|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula3|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[3]~3_combout\ & (\ULA|ula3|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[3]~3_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula3|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula2|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[3]~3_combout\ $ (\ULA|ula3|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula2|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[3]~3_combout\,
	datac => \ULA|ula3|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula3|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[1]~1_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula1|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[1]~1_combout\);

\bancoRegs|registrador~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[1]~1_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~39_q\);

\bancoRegs|saidaA[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[1]~1_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\ROM|memROM~0_combout\) # (\bancoRegs|registrador~295_q\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~39_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~39_q\,
	datab => \bancoRegs|ALT_INV_registrador~295_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[1]~1_combout\);

\ULA|ula1|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|soma_sub|carry_out~combout\ = (!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~1_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula0|soma_sub|carry_out~combout\ & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~1_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula1|soma_sub|carry_out~combout\);

\ULA|ula2|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[2]~2_combout\ & (\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[2]~2_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula2|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula1|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[2]~2_combout\ $ (\ULA|ula2|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[2]~2_combout\,
	datac => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula2|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[29]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[29]~29_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula29|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a29~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[29]~29_combout\);

\bancoRegs|registrador~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[29]~29_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~67_q\);

\bancoRegs|saidaA[29]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[29]~29_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~323_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~67_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~67_q\,
	datab => \bancoRegs|ALT_INV_registrador~323_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[29]~29_combout\);

\ULA|ula29|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[29]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[29]~16_combout\,
	combout => \ULA|ula29|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula29|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula29|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[29]~29_combout\) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[29]~29_combout\ & \ULA|ula29|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( !\bancoRegs|saidaA[29]~29_combout\ $ (!\ULA|ula29|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula28|soma_sub|saida_and~0_combout\) # (\ULA|ula28|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula28|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[29]~29_combout\,
	datad => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula29|mux_ula|saida_MUX~0_combout\);

\UC_ULA|ula_ctrl~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl~2_combout\ = ( !\monitora_flag_z~0_combout\ & ( !\UC_ULA|ula_ctrl~0_combout\ & ( (\ROM|memROM~2_combout\ & (\ROM|memROM~8_combout\ & !\UC|palavraControle[9]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	datad => \UC|ALT_INV_palavraControle[9]~0_combout\,
	datae => \ALT_INV_monitora_flag_z~0_combout\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \UC_ULA|ula_ctrl~2_combout\);

\UC|palavraControle[9]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|palavraControle[9]~1_combout\ = (!\UC|palavraControle[9]~0_combout\ & !\monitora_flag_z~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_palavraControle[9]~0_combout\,
	datab => \ALT_INV_monitora_flag_z~0_combout\,
	combout => \UC|palavraControle[9]~1_combout\);

\ULA|ula31|mux_ula|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_ula|Equal0~0_combout\ = ( \UC_ULA|ula_ctrl~0_combout\ & ( \UC|palavraControle[9]~1_combout\ ) ) # ( !\UC_ULA|ula_ctrl~0_combout\ & ( (\UC|palavraControle[9]~1_combout\ & ((!\ROM|memROM~2_combout\) # ((\ROM|memROM~8_combout\) # 
-- (\ROM|memROM~6_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111111000000001111111100000000101111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	datad => \UC|ALT_INV_palavraControle[9]~1_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \ULA|ula31|mux_ula|Equal0~0_combout\);

\ULA|ula0|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~0_combout\ = (\UC_ULA|ula_ctrl~2_combout\ & (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & \ULA|ula31|mux_ula|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl~2_combout\,
	datab => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datac => \ULA|ula31|mux_ula|ALT_INV_Equal0~0_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~0_combout\);

\bancoRegs|registrador~294\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[0]~0_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~294_q\);

\bancoRegs|registrador~1192\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1192_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~38_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~38_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1192_combout\);

\bancoRegs|registrador~1062\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1062_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1192_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1192_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- \ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1192_combout\ & ( \ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1192_combout\ & ( (\bancoRegs|registrador~294_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~294_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1192_combout\,
	combout => \bancoRegs|registrador~1062_combout\);

\ULA|ula0|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|registrador~1062_combout\ & \bancoRegs|Equal0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000000010000111000000001000011100000000100001110000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1062_combout\,
	datab => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datac => \UC|ALT_INV_Equal2~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	combout => \ULA|ula0|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula0|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula31|mux_ula|Equal0~0_combout\ & ( (!\UC_ULA|ula_ctrl~2_combout\ & ((\ULA|ula0|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[0]~0_combout\))) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula31|mux_ula|Equal0~0_combout\ & ( (!\UC_ULA|ula_ctrl~2_combout\ & (\bancoRegs|saidaA[0]~0_combout\ & ((\ULA|ula0|mux_inverteB|saida_MUX~0_combout\)))) # (\UC_ULA|ula_ctrl~2_combout\ & 
-- (!\bancoRegs|saidaA[0]~0_combout\ $ (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula0|mux_inverteB|saida_MUX~0_combout\)))) ) ) ) # ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( !\ULA|ula31|mux_ula|Equal0~0_combout\ & ( !\bancoRegs|saidaA[0]~0_combout\ $ 
-- (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula0|mux_inverteB|saida_MUX~0_combout\)) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( !\ULA|ula31|mux_ula|Equal0~0_combout\ & ( !\bancoRegs|saidaA[0]~0_combout\ $ (!\UC_ULA|ula_ctrl[2]~1_combout\ $ 
-- (!\ULA|ula0|mux_inverteB|saida_MUX~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010101011010101001010101101000100001010101100100010011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[0]~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl~2_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \ULA|ula0|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula31|mux_ula|ALT_INV_Equal0~0_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~1_combout\);

\bancoRegs|registrador~320\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[26]~26_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~320_q\);

\bancoRegs|registrador~1218\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1218_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~64_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~64_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1218_combout\);

\bancoRegs|registrador~1166\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1166_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1218_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1218_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1218_combout\ & ( (\bancoRegs|registrador~320_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~320_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1218_combout\,
	combout => \bancoRegs|registrador~1166_combout\);

\bancoRegs|saidaB[26]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[26]~13_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1166_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1166_combout\,
	combout => \bancoRegs|saidaB[26]~13_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[26]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[26]~26_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula26|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a26~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[26]~26_combout\);

\bancoRegs|registrador~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[26]~26_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~64_q\);

\bancoRegs|saidaA[26]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[26]~26_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~320_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~64_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~64_q\,
	datab => \bancoRegs|ALT_INV_registrador~320_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[26]~26_combout\);

\ULA|ula26|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[26]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[26]~13_combout\,
	combout => \ULA|ula26|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula26|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[26]~26_combout\ & (\ULA|ula26|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[26]~26_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula26|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula25|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[26]~26_combout\ $ (!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[26]~26_combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula26|mux_ula|saida_MUX~0_combout\);

\bancoRegs|registrador~321\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[27]~27_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~321_q\);

\bancoRegs|registrador~1219\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1219_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~65_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~65_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1219_combout\);

\bancoRegs|registrador~1170\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1170_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1219_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1219_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1219_combout\ & ( (\bancoRegs|registrador~321_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~321_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1219_combout\,
	combout => \bancoRegs|registrador~1170_combout\);

\bancoRegs|saidaB[27]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[27]~14_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1170_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1170_combout\,
	combout => \bancoRegs|saidaB[27]~14_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[27]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[27]~27_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula27|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a27~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[27]~27_combout\);

\bancoRegs|registrador~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[27]~27_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~65_q\);

\bancoRegs|saidaA[27]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[27]~27_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~321_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~65_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~65_q\,
	datab => \bancoRegs|ALT_INV_registrador~321_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[27]~27_combout\);

\ULA|ula27|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[27]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[27]~14_combout\,
	combout => \ULA|ula27|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula27|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[27]~27_combout\ $ (!\ULA|ula27|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[27]~27_combout\,
	datab => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|soma_sub|saida_xor~combout\);

\ULA|ula27|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[27]~27_combout\ & (\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[27]~27_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula27|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[27]~27_combout\,
	datab => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|mux_ula|saida_MUX~0_combout\);

\ULA|ula27|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula27|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula27|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula27|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula27|soma_sub|saida_xor~combout\ $ (((!\ULA|ula25|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[26]~26_combout\ & 
-- !\ULA|ula26|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula25|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[26]~26_combout\) # (!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[26]~26_combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula27|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula27|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|mux_ula|saida_MUX~1_combout\);

\bancoRegs|registrador~322\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[28]~28_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~322_q\);

\bancoRegs|registrador~1220\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1220_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~66_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~66_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1220_combout\);

\bancoRegs|registrador~1174\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1174_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1220_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1220_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1220_combout\ & ( (\bancoRegs|registrador~322_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~322_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1220_combout\,
	combout => \bancoRegs|registrador~1174_combout\);

\bancoRegs|saidaB[28]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[28]~15_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1174_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1174_combout\,
	combout => \bancoRegs|saidaB[28]~15_combout\);

\ULA|ula28|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[28]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[28]~15_combout\,
	combout => \ULA|ula28|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula28|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[28]~28_combout\ $ (!\ULA|ula28|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[28]~28_combout\,
	datab => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|soma_sub|saida_xor~combout\);

\ULA|ula28|soma_sub|saida\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|soma_sub|saida~combout\ = ( \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula28|soma_sub|saida_xor~combout\ & ( (!\bancoRegs|saidaA[27]~27_combout\ & ((!\ULA|ula25|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[26]~26_combout\ & 
-- !\ULA|ula26|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula25|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[26]~26_combout\) # (!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\))))) ) ) ) # ( !\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( 
-- \ULA|ula28|soma_sub|saida_xor~combout\ & ( (!\bancoRegs|saidaA[27]~27_combout\) # ((!\ULA|ula25|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[26]~26_combout\ & !\ULA|ula26|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula25|soma_sub|carry_out~combout\ & 
-- ((!\bancoRegs|saidaA[26]~26_combout\) # (!\ULA|ula26|mux_inverteB|saida_MUX~0_combout\)))) ) ) ) # ( \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( !\ULA|ula28|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula25|soma_sub|carry_out~combout\ & 
-- ((\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[26]~26_combout\))) # (\ULA|ula25|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[26]~26_combout\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[27]~27_combout\) 
-- ) ) ) # ( !\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( !\ULA|ula28|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[27]~27_combout\ & ((!\ULA|ula25|soma_sub|carry_out~combout\ & ((\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[26]~26_combout\))) # (\ULA|ula25|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[26]~26_combout\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101011001010111111111111111111110101001101010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[26]~26_combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[27]~27_combout\,
	datae => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula28|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula28|soma_sub|saida~combout\);

\ULA|ula28|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[28]~28_combout\ & (\ULA|ula28|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[28]~28_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula28|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[28]~28_combout\,
	datab => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|mux_ula|saida_MUX~0_combout\);

\bancoRegs|registrador~315\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[21]~21_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~315_q\);

\bancoRegs|registrador~1213\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1213_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~59_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~59_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1213_combout\);

\bancoRegs|registrador~1146\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1146_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1213_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1213_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1213_combout\ & ( (\bancoRegs|registrador~315_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~315_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1213_combout\,
	combout => \bancoRegs|registrador~1146_combout\);

\bancoRegs|saidaB[21]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[21]~8_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1146_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1146_combout\,
	combout => \bancoRegs|saidaB[21]~8_combout\);

\ULA|ula21|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[21]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[21]~8_combout\,
	combout => \ULA|ula21|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula21|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[21]~21_combout\ & (\ULA|ula21|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[21]~21_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula21|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula20|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[21]~21_combout\ $ (!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[21]~21_combout\,
	datac => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula21|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[21]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[21]~21_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula21|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a21~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[21]~21_combout\);

\bancoRegs|registrador~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[21]~21_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~59_q\);

\bancoRegs|saidaA[21]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[21]~21_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~315_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~59_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~59_q\,
	datab => \bancoRegs|ALT_INV_registrador~315_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[21]~21_combout\);

\bancoRegs|registrador~317\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[23]~23_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~317_q\);

\bancoRegs|registrador~1215\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1215_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~61_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~61_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1215_combout\);

\bancoRegs|registrador~1154\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1154_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1215_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1215_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1215_combout\ & ( (\bancoRegs|registrador~317_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~317_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1215_combout\,
	combout => \bancoRegs|registrador~1154_combout\);

\bancoRegs|saidaB[23]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[23]~10_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1154_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1154_combout\,
	combout => \bancoRegs|saidaB[23]~10_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[23]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[23]~23_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula23|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a23~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[23]~23_combout\);

\bancoRegs|registrador~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[23]~23_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~61_q\);

\bancoRegs|saidaA[23]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[23]~23_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~317_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~61_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~61_q\,
	datab => \bancoRegs|ALT_INV_registrador~317_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[23]~23_combout\);

\ULA|ula23|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[23]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[23]~10_combout\,
	combout => \ULA|ula23|mux_inverteB|saida_MUX~0_combout\);

\bancoRegs|registrador~316\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[22]~22_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~316_q\);

\bancoRegs|registrador~1214\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1214_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~60_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~60_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1214_combout\);

\bancoRegs|registrador~1150\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1150_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1214_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1214_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1214_combout\ & ( (\bancoRegs|registrador~316_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~316_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1214_combout\,
	combout => \bancoRegs|registrador~1150_combout\);

\bancoRegs|saidaB[22]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[22]~9_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1150_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1150_combout\,
	combout => \bancoRegs|saidaB[22]~9_combout\);

\ULA|ula22|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[22]~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[22]~9_combout\,
	combout => \ULA|ula22|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula22|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[22]~22_combout\ $ (!\ULA|ula22|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[22]~22_combout\,
	datab => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|soma_sub|saida_xor~combout\);

\ULA|ula22|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[22]~22_combout\ & (\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[22]~22_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula22|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[22]~22_combout\,
	datab => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|mux_ula|saida_MUX~0_combout\);

\ULA|ula22|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula22|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula22|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula22|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula22|soma_sub|saida_xor~combout\ $ (((!\ULA|ula20|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[21]~21_combout\ & 
-- !\ULA|ula21|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula20|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[21]~21_combout\) # (!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[21]~21_combout\,
	datac => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula22|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula22|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|mux_ula|saida_MUX~1_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[22]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[22]~22_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula22|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a22~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[22]~22_combout\);

\bancoRegs|registrador~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[22]~22_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~60_q\);

\bancoRegs|saidaA[22]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[22]~22_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~316_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~60_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~60_q\,
	datab => \bancoRegs|ALT_INV_registrador~316_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[22]~22_combout\);

\ULA|ula23|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_ula|saida_MUX~1_combout\ = ( \bancoRegs|saidaA[22]~22_combout\ & ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\bancoRegs|saidaA[23]~23_combout\ & 
-- (!\ULA|ula23|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula8|mux_ula|saida_MUX~0_combout\)) # (\bancoRegs|saidaA[23]~23_combout\ & (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & 
-- (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[23]~23_combout\)))) ) ) ) # ( !\bancoRegs|saidaA[22]~22_combout\ & ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\bancoRegs|saidaA[23]~23_combout\ & (!\ULA|ula23|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula8|mux_ula|saida_MUX~0_combout\)) # (\bancoRegs|saidaA[23]~23_combout\ & 
-- (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[23]~23_combout\)))) ) ) ) # ( 
-- \bancoRegs|saidaA[22]~22_combout\ & ( !\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\bancoRegs|saidaA[23]~23_combout\ & (!\ULA|ula23|mux_inverteB|saida_MUX~0_combout\ & 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\)) # (\bancoRegs|saidaA[23]~23_combout\ & (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & 
-- ((\ULA|ula23|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[23]~23_combout\)))) ) ) ) # ( !\bancoRegs|saidaA[22]~22_combout\ & ( !\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[23]~23_combout\ & 
-- (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\ & (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ $ (\ULA|ula8|mux_ula|saida_MUX~0_combout\)))) # (\bancoRegs|saidaA[23]~23_combout\ & (!\ULA|ula8|mux_ula|saida_MUX~0_combout\ $ 
-- (((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula23|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000000010111100100000001011110010000000101111001000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[23]~23_combout\,
	datab => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[22]~22_combout\,
	dataf => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula23|mux_ula|saida_MUX~1_combout\);

\ULA|ula23|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_ula|saida_MUX~2_combout\ = (!\ULA|ula8|mux_ula|saida_MUX~0_combout\ & (!\bancoRegs|saidaA[22]~22_combout\ $ (!\ULA|ula22|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100000101000001010000010100000101000001010000010100000101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \bancoRegs|ALT_INV_saidaA[22]~22_combout\,
	datac => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula23|mux_ula|saida_MUX~2_combout\);

\ULA|ula23|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula23|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula23|mux_ula|saida_MUX~2_combout\ & ( ((!\ULA|ula20|soma_sub|carry_out~combout\ & ((\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[21]~21_combout\))) # (\ULA|ula20|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[21]~21_combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\) ) ) ) # ( 
-- !\ULA|ula23|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula23|mux_ula|saida_MUX~2_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\ULA|ula20|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[21]~21_combout\ & 
-- !\ULA|ula21|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula20|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[21]~21_combout\) # (!\ULA|ula21|mux_inverteB|saida_MUX~0_combout\))))) ) ) ) # ( \ULA|ula23|mux_ula|saida_MUX~1_combout\ & ( 
-- !\ULA|ula23|mux_ula|saida_MUX~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111110100010001000000101110111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datab => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datac => \bancoRegs|ALT_INV_saidaA[21]~21_combout\,
	datad => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula23|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula23|mux_ula|ALT_INV_saida_MUX~2_combout\,
	combout => \ULA|ula23|mux_ula|saida_MUX~0_combout\);

\ULA|ula23|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|soma_sub|saida_and~0_combout\ = (\bancoRegs|saidaA[23]~23_combout\ & \ULA|ula23|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[23]~23_combout\,
	datab => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula23|soma_sub|saida_and~0_combout\);

\bancoRegs|registrador~318\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[24]~24_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~318_q\);

\bancoRegs|registrador~1216\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1216_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~62_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~62_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1216_combout\);

\bancoRegs|registrador~1158\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1158_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1216_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1216_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1216_combout\ & ( (\bancoRegs|registrador~318_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~318_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1216_combout\,
	combout => \bancoRegs|registrador~1158_combout\);

\bancoRegs|saidaB[24]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[24]~11_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1158_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1158_combout\,
	combout => \bancoRegs|saidaB[24]~11_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[24]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[24]~24_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula24|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a24~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[24]~24_combout\);

\bancoRegs|registrador~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[24]~24_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~62_q\);

\bancoRegs|saidaA[24]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[24]~24_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~318_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~62_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~62_q\,
	datab => \bancoRegs|ALT_INV_registrador~318_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[24]~24_combout\);

\ULA|ula24|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[24]~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[24]~11_combout\,
	combout => \ULA|ula24|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula24|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[24]~24_combout\) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[24]~24_combout\ & \ULA|ula24|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( !\bancoRegs|saidaA[24]~24_combout\ $ (!\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula23|soma_sub|saida_and~0_combout\) # (\ULA|ula23|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula23|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[24]~24_combout\,
	datad => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|mux_ula|saida_MUX~0_combout\);

\bancoRegs|registrador~319\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[25]~25_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~319_q\);

\bancoRegs|registrador~1217\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1217_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~63_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~63_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1217_combout\);

\bancoRegs|registrador~1162\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1162_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1217_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1217_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1217_combout\ & ( (\bancoRegs|registrador~319_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~319_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1217_combout\,
	combout => \bancoRegs|registrador~1162_combout\);

\bancoRegs|saidaB[25]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[25]~12_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1162_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1162_combout\,
	combout => \bancoRegs|saidaB[25]~12_combout\);

\ULA|ula25|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[25]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[25]~12_combout\,
	combout => \ULA|ula25|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula25|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[25]~25_combout\ & (\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[25]~25_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula25|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[25]~25_combout\,
	datab => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|mux_ula|saida_MUX~0_combout\);

\ULA|ula25|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|mux_ula|saida_MUX~1_combout\ = ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & \ULA|ula25|soma_sub|saida~combout\)) # (\ULA|ula25|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111100011111000111110001111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula25|soma_sub|ALT_INV_saida~combout\,
	datac => \ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|mux_ula|saida_MUX~1_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[25]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[25]~25_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula25|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a25~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[25]~25_combout\);

\bancoRegs|registrador~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[25]~25_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~63_q\);

\bancoRegs|saidaA[25]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[25]~25_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~319_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~63_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~63_q\,
	datab => \bancoRegs|ALT_INV_registrador~319_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[25]~25_combout\);

\ULA|ula25|soma_sub|saida\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|soma_sub|saida~combout\ = ( \bancoRegs|saidaA[25]~25_combout\ & ( \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[24]~24_combout\ & (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & ((\ULA|ula23|soma_sub|saida_and~0_combout\) 
-- # (\ULA|ula23|soma_sub|saida_xor2~combout\)))) # (\bancoRegs|saidaA[24]~24_combout\ & (((\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # (\ULA|ula23|soma_sub|saida_and~0_combout\)) # (\ULA|ula23|soma_sub|saida_xor2~combout\))) ) ) ) # ( 
-- !\bancoRegs|saidaA[25]~25_combout\ & ( \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[24]~24_combout\ & ((!\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula23|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula23|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[24]~24_combout\ & (!\ULA|ula23|soma_sub|saida_xor2~combout\ & (!\ULA|ula23|soma_sub|saida_and~0_combout\ & !\ULA|ula24|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( 
-- \bancoRegs|saidaA[25]~25_combout\ & ( !\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[24]~24_combout\ & ((!\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula23|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula23|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[24]~24_combout\ & (!\ULA|ula23|soma_sub|saida_xor2~combout\ & (!\ULA|ula23|soma_sub|saida_and~0_combout\ & !\ULA|ula24|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( 
-- !\bancoRegs|saidaA[25]~25_combout\ & ( !\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[24]~24_combout\ & (\ULA|ula24|mux_inverteB|saida_MUX~0_combout\ & ((\ULA|ula23|soma_sub|saida_and~0_combout\) # 
-- (\ULA|ula23|soma_sub|saida_xor2~combout\)))) # (\bancoRegs|saidaA[24]~24_combout\ & (((\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # (\ULA|ula23|soma_sub|saida_and~0_combout\)) # (\ULA|ula23|soma_sub|saida_xor2~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011101111111111110001000000011111000100000000000011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula23|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[24]~24_combout\,
	datad => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[25]~25_combout\,
	dataf => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|soma_sub|saida~combout\);

\bancoRegs|registrador~310\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[16]~16_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~310_q\);

\bancoRegs|registrador~1208\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1208_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~54_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~54_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1208_combout\);

\bancoRegs|registrador~1126\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1126_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1208_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1208_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1208_combout\ & ( (\bancoRegs|registrador~310_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~310_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1208_combout\,
	combout => \bancoRegs|registrador~1126_combout\);

\bancoRegs|saidaB[16]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[16]~3_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1126_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1126_combout\,
	combout => \bancoRegs|saidaB[16]~3_combout\);

\ULA|ula16|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[16]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[16]~3_combout\,
	combout => \ULA|ula16|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula16|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[16]~16_combout\ & (\ULA|ula16|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[16]~16_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula16|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula15|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[16]~16_combout\ $ (!\ULA|ula16|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[16]~16_combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula16|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[16]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[16]~16_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula16|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a16~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[16]~16_combout\);

\bancoRegs|registrador~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[16]~16_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~54_q\);

\bancoRegs|saidaA[16]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[16]~16_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~310_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~54_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~54_q\,
	datab => \bancoRegs|ALT_INV_registrador~310_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[16]~16_combout\);

\bancoRegs|registrador~311\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[17]~17_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~311_q\);

\bancoRegs|registrador~1209\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1209_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~55_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~55_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1209_combout\);

\bancoRegs|registrador~1130\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1130_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1209_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1209_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1209_combout\ & ( (\bancoRegs|registrador~311_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~311_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1209_combout\,
	combout => \bancoRegs|registrador~1130_combout\);

\bancoRegs|saidaB[17]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[17]~4_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1130_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1130_combout\,
	combout => \bancoRegs|saidaB[17]~4_combout\);

\ULA|ula17|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[17]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[17]~4_combout\,
	combout => \ULA|ula17|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula17|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[17]~17_combout\ $ (!\ULA|ula17|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[17]~17_combout\,
	datab => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|soma_sub|saida_xor~combout\);

\ULA|ula17|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[17]~17_combout\ & (\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[17]~17_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula17|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[17]~17_combout\,
	datab => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|mux_ula|saida_MUX~0_combout\);

\ULA|ula17|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula17|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula17|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula17|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula17|soma_sub|saida_xor~combout\ $ (((!\ULA|ula15|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[16]~16_combout\ & 
-- !\ULA|ula16|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula15|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[16]~16_combout\) # (!\ULA|ula16|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[16]~16_combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula17|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula17|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|mux_ula|saida_MUX~1_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[17]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[17]~17_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula17|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula17|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a17~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[17]~17_combout\);

\bancoRegs|registrador~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[17]~17_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~55_q\);

\bancoRegs|saidaA[17]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[17]~17_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~311_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~55_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~55_q\,
	datab => \bancoRegs|ALT_INV_registrador~311_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[17]~17_combout\);

\ULA|ula17|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|soma_sub|carry_out~combout\ = ( \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( ((!\ULA|ula15|soma_sub|carry_out~combout\ & ((\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[16]~16_combout\))) # 
-- (\ULA|ula15|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[16]~16_combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[17]~17_combout\) ) ) # ( !\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( 
-- (\bancoRegs|saidaA[17]~17_combout\ & ((!\ULA|ula15|soma_sub|carry_out~combout\ & ((\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[16]~16_combout\))) # (\ULA|ula15|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[16]~16_combout\ & 
-- \ULA|ula16|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101011001010111111111100000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[16]~16_combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[17]~17_combout\,
	datae => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|soma_sub|carry_out~combout\);

\bancoRegs|registrador~312\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[18]~18_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~312_q\);

\bancoRegs|registrador~1210\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1210_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~56_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~56_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1210_combout\);

\bancoRegs|registrador~1134\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1134_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1210_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1210_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1210_combout\ & ( (\bancoRegs|registrador~312_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~312_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1210_combout\,
	combout => \bancoRegs|registrador~1134_combout\);

\bancoRegs|saidaB[18]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[18]~5_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1134_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1134_combout\,
	combout => \bancoRegs|saidaB[18]~5_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[18]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[18]~18_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula18|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a18~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[18]~18_combout\);

\bancoRegs|registrador~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[18]~18_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~56_q\);

\bancoRegs|saidaA[18]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[18]~18_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~312_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~56_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~56_q\,
	datab => \bancoRegs|ALT_INV_registrador~312_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[18]~18_combout\);

\ULA|ula18|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[18]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[18]~5_combout\,
	combout => \ULA|ula18|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula18|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[18]~18_combout\ & (\ULA|ula18|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[18]~18_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula18|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula17|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[18]~18_combout\ $ (\ULA|ula18|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula17|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[18]~18_combout\,
	datac => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula18|mux_ula|saida_MUX~0_combout\);

\ULA|ula18|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|soma_sub|saida_and~0_combout\ = (\bancoRegs|saidaA[18]~18_combout\ & \ULA|ula18|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[18]~18_combout\,
	datab => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula18|soma_sub|saida_and~0_combout\);

\bancoRegs|registrador~313\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[19]~19_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~313_q\);

\bancoRegs|registrador~1211\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1211_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~57_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~57_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1211_combout\);

\bancoRegs|registrador~1138\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1138_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1211_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1211_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1211_combout\ & ( (\bancoRegs|registrador~313_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~313_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1211_combout\,
	combout => \bancoRegs|registrador~1138_combout\);

\bancoRegs|saidaB[19]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[19]~6_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1138_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1138_combout\,
	combout => \bancoRegs|saidaB[19]~6_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[19]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[19]~19_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula19|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a19~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[19]~19_combout\);

\bancoRegs|registrador~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[19]~19_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~57_q\);

\bancoRegs|saidaA[19]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[19]~19_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~313_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~57_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~57_q\,
	datab => \bancoRegs|ALT_INV_registrador~313_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[19]~19_combout\);

\ULA|ula19|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[19]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[19]~6_combout\,
	combout => \ULA|ula19|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula19|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula19|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[19]~19_combout\) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[19]~19_combout\ & \ULA|ula19|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( !\bancoRegs|saidaA[19]~19_combout\ $ (!\ULA|ula19|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula18|soma_sub|saida_and~0_combout\) # (\ULA|ula18|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula18|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[19]~19_combout\,
	datad => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula19|mux_ula|saida_MUX~0_combout\);

\bancoRegs|registrador~314\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[20]~20_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~314_q\);

\bancoRegs|registrador~1212\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1212_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~58_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~58_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1212_combout\);

\bancoRegs|registrador~1142\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1142_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1212_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1212_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1212_combout\ & ( (\bancoRegs|registrador~314_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~314_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1212_combout\,
	combout => \bancoRegs|registrador~1142_combout\);

\bancoRegs|saidaB[20]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[20]~7_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1142_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1142_combout\,
	combout => \bancoRegs|saidaB[20]~7_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[20]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[20]~20_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula20|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a20~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[20]~20_combout\);

\bancoRegs|registrador~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[20]~20_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~58_q\);

\bancoRegs|saidaA[20]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[20]~20_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~314_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~58_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~58_q\,
	datab => \bancoRegs|ALT_INV_registrador~314_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[20]~20_combout\);

\ULA|ula20|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[20]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[20]~7_combout\,
	combout => \ULA|ula20|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula20|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|mux_ula|saida_MUX~1_combout\ = ( \bancoRegs|saidaA[19]~19_combout\ & ( \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\bancoRegs|saidaA[20]~20_combout\ & 
-- (!\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula8|mux_ula|saida_MUX~0_combout\)) # (\bancoRegs|saidaA[20]~20_combout\ & (\ULA|ula20|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & 
-- (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((\ULA|ula20|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[20]~20_combout\)))) ) ) ) # ( !\bancoRegs|saidaA[19]~19_combout\ & ( \ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\bancoRegs|saidaA[20]~20_combout\ & (!\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & !\ULA|ula8|mux_ula|saida_MUX~0_combout\)) # (\bancoRegs|saidaA[20]~20_combout\ & 
-- (\ULA|ula20|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((\ULA|ula20|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[20]~20_combout\)))) ) ) ) # ( 
-- \bancoRegs|saidaA[19]~19_combout\ & ( !\ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ((!\bancoRegs|saidaA[20]~20_combout\ & (!\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\)) # (\bancoRegs|saidaA[20]~20_combout\ & (\ULA|ula20|mux_inverteB|saida_MUX~0_combout\)))) # (\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & 
-- ((\ULA|ula20|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[20]~20_combout\)))) ) ) ) # ( !\bancoRegs|saidaA[19]~19_combout\ & ( !\ULA|ula19|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[20]~20_combout\ & 
-- (\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ $ (\ULA|ula8|mux_ula|saida_MUX~0_combout\)))) # (\bancoRegs|saidaA[20]~20_combout\ & (!\ULA|ula8|mux_ula|saida_MUX~0_combout\ $ 
-- (((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula20|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000000010111100100000001011110010000000101111001000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[20]~20_combout\,
	datab => \ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[19]~19_combout\,
	dataf => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula20|mux_ula|saida_MUX~1_combout\);

\ULA|ula20|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula20|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( ((!\bancoRegs|saidaA[19]~19_combout\ $ (\ULA|ula19|mux_inverteB|saida_MUX~0_combout\)) # 
-- (\ULA|ula18|soma_sub|saida_and~0_combout\)) # (\ULA|ula18|soma_sub|saida_xor2~combout\) ) ) ) # ( !\ULA|ula20|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( (!\ULA|ula18|soma_sub|saida_xor2~combout\ & 
-- (!\ULA|ula18|soma_sub|saida_and~0_combout\ & (!\bancoRegs|saidaA[19]~19_combout\ $ (!\ULA|ula19|mux_inverteB|saida_MUX~0_combout\)))) ) ) ) # ( \ULA|ula20|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001000100000001111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula18|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[19]~19_combout\,
	datad => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula20|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula20|mux_ula|saida_MUX~0_combout\);

\bancoRegs|registrador~305\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[11]~11_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~305_q\);

\bancoRegs|registrador~1203\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1203_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~49_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~49_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1203_combout\);

\bancoRegs|registrador~1106\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1106_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1203_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1203_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1203_combout\ & ( (\bancoRegs|registrador~305_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~305_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1203_combout\,
	combout => \bancoRegs|registrador~1106_combout\);

\ULA|ula11|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1106_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1106_combout\,
	combout => \ULA|ula11|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula11|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[11]~11_combout\ & (\ULA|ula11|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[11]~11_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula11|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula10|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[11]~11_combout\ $ (!\ULA|ula11|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[11]~11_combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula11|mux_ula|saida_MUX~0_combout\);

\bancoRegs|saidaB[11]~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[11]~30_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1106_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[11]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[11]~11_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula11|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a11~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[11]~11_combout\);

\bancoRegs|registrador~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[11]~11_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~49_q\);

\bancoRegs|saidaA[11]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[11]~11_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~305_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~49_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~49_q\,
	datab => \bancoRegs|ALT_INV_registrador~305_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[11]~11_combout\);

\bancoRegs|registrador~306\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[12]~12_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~306_q\);

\bancoRegs|registrador~1204\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1204_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~50_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~50_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1204_combout\);

\bancoRegs|registrador~1110\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1110_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1204_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1204_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1204_combout\ & ( (\bancoRegs|registrador~306_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~306_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1204_combout\,
	combout => \bancoRegs|registrador~1110_combout\);

\ULA|ula12|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1110_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1110_combout\,
	combout => \ULA|ula12|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula12|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[12]~12_combout\ $ (!\ULA|ula12|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[12]~12_combout\,
	datab => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|soma_sub|saida_xor~combout\);

\ULA|ula12|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[12]~12_combout\ & (\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[12]~12_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula12|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[12]~12_combout\,
	datab => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|mux_ula|saida_MUX~0_combout\);

\ULA|ula12|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula12|mux_ula|saida_MUX~0_combout\ ) ) # ( !\ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( \ULA|ula12|mux_ula|saida_MUX~0_combout\ ) ) # ( 
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ & ( !\ULA|ula12|mux_ula|saida_MUX~0_combout\ & ( !\ULA|ula12|soma_sub|saida_xor~combout\ $ (((!\ULA|ula10|soma_sub|carry_out~combout\ & (!\bancoRegs|saidaA[11]~11_combout\ & 
-- !\ULA|ula11|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula10|soma_sub|carry_out~combout\ & ((!\bancoRegs|saidaA[11]~11_combout\) # (!\ULA|ula11|mux_inverteB|saida_MUX~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001010111101010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[11]~11_combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula12|soma_sub|ALT_INV_saida_xor~combout\,
	datae => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ULA|ula12|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|mux_ula|saida_MUX~1_combout\);

\bancoRegs|saidaB[12]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[12]~31_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1110_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[12]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[12]~12_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula12|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula12|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a12~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[12]~12_combout\);

\bancoRegs|registrador~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[12]~12_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~50_q\);

\bancoRegs|saidaA[12]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[12]~12_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~306_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~50_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~50_q\,
	datab => \bancoRegs|ALT_INV_registrador~306_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[12]~12_combout\);

\ULA|ula12|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|soma_sub|carry_out~combout\ = ( \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( ((!\ULA|ula10|soma_sub|carry_out~combout\ & ((\ULA|ula11|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[11]~11_combout\))) # 
-- (\ULA|ula10|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[11]~11_combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[12]~12_combout\) ) ) # ( !\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( 
-- (\bancoRegs|saidaA[12]~12_combout\ & ((!\ULA|ula10|soma_sub|carry_out~combout\ & ((\ULA|ula11|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[11]~11_combout\))) # (\ULA|ula10|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[11]~11_combout\ & 
-- \ULA|ula11|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101011001010111111111100000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[11]~11_combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[12]~12_combout\,
	datae => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|soma_sub|carry_out~combout\);

\bancoRegs|registrador~307\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[13]~13_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~307_q\);

\bancoRegs|registrador~1205\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1205_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~51_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~51_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1205_combout\);

\bancoRegs|registrador~1114\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1114_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1205_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1205_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1205_combout\ & ( (\bancoRegs|registrador~307_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~307_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1205_combout\,
	combout => \bancoRegs|registrador~1114_combout\);

\bancoRegs|saidaB[13]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[13]~0_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1114_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1114_combout\,
	combout => \bancoRegs|saidaB[13]~0_combout\);

\ULA|ula13|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[13]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[13]~0_combout\,
	combout => \ULA|ula13|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula13|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[13]~13_combout\ & (\ULA|ula13|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[13]~13_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula13|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula12|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[13]~13_combout\ $ (\ULA|ula13|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula12|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[13]~13_combout\,
	datac => \ULA|ula13|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula13|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[13]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[13]~13_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula13|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a13~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[13]~13_combout\);

\bancoRegs|registrador~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[13]~13_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~51_q\);

\bancoRegs|saidaA[13]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[13]~13_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~307_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~51_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~51_q\,
	datab => \bancoRegs|ALT_INV_registrador~307_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[13]~13_combout\);

\ULA|ula13|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_and~0_combout\ = (!\UC|Equal2~0_combout\ & (\bancoRegs|saidaA[13]~13_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[13]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000010000010000000001000001000000000100000100000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[13]~13_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[13]~0_combout\,
	combout => \ULA|ula13|soma_sub|saida_and~0_combout\);

\bancoRegs|registrador~308\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[14]~14_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~308_q\);

\bancoRegs|registrador~1206\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1206_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~52_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~52_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1206_combout\);

\bancoRegs|registrador~1118\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1118_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1206_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1206_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1206_combout\ & ( (\bancoRegs|registrador~308_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~308_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1206_combout\,
	combout => \bancoRegs|registrador~1118_combout\);

\bancoRegs|saidaB[14]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[14]~1_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1118_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1118_combout\,
	combout => \bancoRegs|saidaB[14]~1_combout\);

\ULA|ula14|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[14]~1_combout\)))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~2_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000100011101110100010001110111010001000111011101000100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_saidaB[14]~1_combout\,
	combout => \ULA|ula14|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula14|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula14|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[14]~14_combout\) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[14]~14_combout\ & \ULA|ula14|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( !\bancoRegs|saidaA[14]~14_combout\ $ (!\ULA|ula14|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula13|soma_sub|saida_and~0_combout\) # (\ULA|ula13|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[14]~14_combout\,
	datad => \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula14|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[14]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[14]~14_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula14|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a14~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[14]~14_combout\);

\bancoRegs|registrador~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[14]~14_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~52_q\);

\bancoRegs|saidaA[14]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[14]~14_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~308_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~52_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~52_q\,
	datab => \bancoRegs|ALT_INV_registrador~308_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[14]~14_combout\);

\ULA|ula14|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|soma_sub|carry_out~combout\ = (!\bancoRegs|saidaA[14]~14_combout\ & ((!\ULA|ula14|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula13|soma_sub|saida_xor2~combout\ & !\ULA|ula13|soma_sub|saida_and~0_combout\)))) # 
-- (\bancoRegs|saidaA[14]~14_combout\ & (!\ULA|ula13|soma_sub|saida_xor2~combout\ & (!\ULA|ula13|soma_sub|saida_and~0_combout\ & !\ULA|ula14|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010000000111110001000000011111000100000001111100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[14]~14_combout\,
	datad => \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula14|soma_sub|carry_out~combout\);

\bancoRegs|registrador~309\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[15]~15_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~309_q\);

\bancoRegs|registrador~1207\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1207_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~53_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~53_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1207_combout\);

\bancoRegs|registrador~1122\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1122_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1207_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1207_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1207_combout\ & ( (\bancoRegs|registrador~309_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~309_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1207_combout\,
	combout => \bancoRegs|registrador~1122_combout\);

\bancoRegs|saidaB[15]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[15]~2_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1122_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1122_combout\,
	combout => \bancoRegs|saidaB[15]~2_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[15]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[15]~15_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula15|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a15~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[15]~15_combout\);

\bancoRegs|registrador~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[15]~15_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~53_q\);

\bancoRegs|saidaA[15]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[15]~15_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~309_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~53_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~53_q\,
	datab => \bancoRegs|ALT_INV_registrador~309_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[15]~15_combout\);

\ULA|ula15|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[15]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[15]~2_combout\,
	combout => \ULA|ula15|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula15|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[15]~15_combout\ & (\ULA|ula15|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[15]~15_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula15|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula14|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[15]~15_combout\ $ (!\ULA|ula15|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula14|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[15]~15_combout\,
	datac => \ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula15|mux_ula|saida_MUX~0_combout\);

\ULA|ula7|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|soma_sub|carry_out~combout\ = ( \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( ((!\ULA|ula5|soma_sub|carry_out~combout\ & ((\ULA|ula6|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[6]~6_combout\))) # 
-- (\ULA|ula5|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[6]~6_combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[7]~7_combout\) ) ) # ( !\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[7]~7_combout\ & 
-- ((!\ULA|ula5|soma_sub|carry_out~combout\ & ((\ULA|ula6|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[6]~6_combout\))) # (\ULA|ula5|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[6]~6_combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\)))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000101011001010111111111100000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[6]~6_combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[7]~7_combout\,
	datae => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|soma_sub|carry_out~combout\);

\bancoRegs|registrador~302\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[8]~8_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~302_q\);

\bancoRegs|registrador~1200\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1200_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~46_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~46_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1200_combout\);

\bancoRegs|registrador~1094\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1094_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1200_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1200_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1200_combout\ & ( (\bancoRegs|registrador~302_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~302_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1200_combout\,
	combout => \bancoRegs|registrador~1094_combout\);

\bancoRegs|saidaB[8]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[8]~19_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1094_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1094_combout\,
	combout => \bancoRegs|saidaB[8]~19_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[8]~8_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula8|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a8~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[8]~8_combout\);

\bancoRegs|registrador~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[8]~8_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~46_q\);

\bancoRegs|saidaA[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[8]~8_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~302_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~46_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~46_q\,
	datab => \bancoRegs|ALT_INV_registrador~302_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[8]~8_combout\);

\ULA|ula8|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[8]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[8]~19_combout\,
	combout => \ULA|ula8|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula8|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_ula|saida_MUX~1_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[8]~8_combout\ & (\ULA|ula8|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[8]~8_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula8|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula7|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[8]~8_combout\ $ (\ULA|ula8|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100100000000000000110011111101101001000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula7|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[8]~8_combout\,
	datac => \ULA|ula8|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula8|mux_ula|saida_MUX~1_combout\);

\ULA|ula8|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_and~0_combout\ = ( \bancoRegs|registrador~1094_combout\ & ( (!\UC|Equal2~0_combout\ & (\bancoRegs|saidaA[8]~8_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (\UC_ULA|ula_ctrl[2]~1_combout\)))) ) ) # ( 
-- !\bancoRegs|registrador~1094_combout\ & ( (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ & \bancoRegs|saidaA[8]~8_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001000010000000000110000000000000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[8]~8_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1094_combout\,
	combout => \ULA|ula8|soma_sub|saida_and~0_combout\);

\bancoRegs|registrador~303\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[9]~9_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~303_q\);

\bancoRegs|registrador~1201\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1201_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~47_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~47_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1201_combout\);

\bancoRegs|registrador~1098\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1098_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1201_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1201_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1201_combout\ & ( (\bancoRegs|registrador~303_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~303_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1201_combout\,
	combout => \bancoRegs|registrador~1098_combout\);

\bancoRegs|saidaB[9]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[9]~28_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1098_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[9]~9_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula9|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a9~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[9]~9_combout\);

\bancoRegs|registrador~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[9]~9_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~47_q\);

\bancoRegs|saidaA[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[9]~9_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~303_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~47_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~47_q\,
	datab => \bancoRegs|ALT_INV_registrador~303_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[9]~9_combout\);

\ULA|ula9|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1098_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1098_combout\,
	combout => \ULA|ula9|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula9|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\ULA|ula9|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[9]~9_combout\) ) ) ) # ( 
-- !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (\bancoRegs|saidaA[9]~9_combout\ & \ULA|ula9|mux_inverteB|saida_MUX~0_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( !\bancoRegs|saidaA[9]~9_combout\ $ (!\ULA|ula9|mux_inverteB|saida_MUX~0_combout\ $ (((\ULA|ula8|soma_sub|saida_and~0_combout\) # (\ULA|ula8|soma_sub|saida_xor2~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100010000111000000000000000000000000000011110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[9]~9_combout\,
	datad => \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula9|mux_ula|saida_MUX~0_combout\);

\ULA|ula9|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|soma_sub|carry_out~combout\ = (!\bancoRegs|saidaA[9]~9_combout\ & ((!\ULA|ula9|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula8|soma_sub|saida_xor2~combout\ & !\ULA|ula8|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[9]~9_combout\ & 
-- (!\ULA|ula8|soma_sub|saida_xor2~combout\ & (!\ULA|ula8|soma_sub|saida_and~0_combout\ & !\ULA|ula9|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010000000111110001000000011111000100000001111100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[9]~9_combout\,
	datad => \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula9|soma_sub|carry_out~combout\);

\bancoRegs|registrador~304\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[10]~10_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~304_q\);

\bancoRegs|registrador~1202\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1202_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~48_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~48_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1202_combout\);

\bancoRegs|registrador~1102\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1102_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1202_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1202_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1202_combout\ & ( (\bancoRegs|registrador~304_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~304_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1202_combout\,
	combout => \bancoRegs|registrador~1102_combout\);

\bancoRegs|saidaB[10]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[10]~29_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1102_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[10]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[10]~10_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula10|mux_ula|saida_MUX~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a10~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[10]~10_combout\);

\bancoRegs|registrador~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[10]~10_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~48_q\);

\bancoRegs|saidaA[10]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[10]~10_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~304_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~48_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~48_q\,
	datab => \bancoRegs|ALT_INV_registrador~304_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[10]~10_combout\);

\ULA|ula10|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (((\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1102_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000100110000001000010011000000100001001100000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1102_combout\,
	combout => \ULA|ula10|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula10|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|mux_ula|saida_MUX~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[10]~10_combout\ & (\ULA|ula10|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[10]~10_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula10|mux_inverteB|saida_MUX~0_combout\))) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & (!\ULA|ula9|soma_sub|carry_out~combout\ $ 
-- (!\bancoRegs|saidaA[10]~10_combout\ $ (!\ULA|ula10|mux_inverteB|saida_MUX~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000000000000000110011111110010110000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula9|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[10]~10_combout\,
	datac => \ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula10|mux_ula|saida_MUX~0_combout\);

\monitora_flag_z~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~1_combout\ = ( !\ULA|ula4|mux_ula|saida_MUX~0_combout\ & ( (\monitora_flag_z~0_combout\ & (!\ULA|ula1|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula2|mux_ula|saida_MUX~0_combout\ & !\ULA|ula3|mux_ula|saida_MUX~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000001000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_monitora_flag_z~0_combout\,
	datab => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula2|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula3|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula4|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \monitora_flag_z~1_combout\);

\monitora_flag_z~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~2_combout\ = (!\ULA|ula5|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula6|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula7|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula6|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula7|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \ALT_INV_monitora_flag_z~1_combout\,
	combout => \monitora_flag_z~2_combout\);

\monitora_flag_z~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~3_combout\ = ( \monitora_flag_z~2_combout\ & ( (!\ULA|ula8|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula9|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula10|mux_ula|saida_MUX~0_combout\ & !\ULA|ula11|mux_ula|saida_MUX~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula9|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula10|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula11|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ALT_INV_monitora_flag_z~2_combout\,
	combout => \monitora_flag_z~3_combout\);

\monitora_flag_z~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~4_combout\ = (!\ULA|ula12|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula13|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula14|mux_ula|saida_MUX~0_combout\ & \monitora_flag_z~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula12|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula13|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula14|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ALT_INV_monitora_flag_z~3_combout\,
	combout => \monitora_flag_z~4_combout\);

\monitora_flag_z~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~5_combout\ = (!\ULA|ula15|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula16|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula17|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula16|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula17|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \ALT_INV_monitora_flag_z~4_combout\,
	combout => \monitora_flag_z~5_combout\);

\monitora_flag_z~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~6_combout\ = ( !\ULA|ula22|mux_ula|saida_MUX~1_combout\ & ( \monitora_flag_z~5_combout\ & ( (!\ULA|ula18|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula19|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula20|mux_ula|saida_MUX~0_combout\ & 
-- !\ULA|ula21|mux_ula|saida_MUX~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datab => \ULA|ula19|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula20|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula21|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula22|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ALT_INV_monitora_flag_z~5_combout\,
	combout => \monitora_flag_z~6_combout\);

\monitora_flag_z~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~7_combout\ = ( !\ULA|ula25|mux_ula|saida_MUX~0_combout\ & ( \monitora_flag_z~6_combout\ & ( (!\ULA|ula23|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula24|mux_ula|saida_MUX~0_combout\ & ((!\ULA|ula1|mux_ula|saida_MUX~1_combout\) # 
-- (!\ULA|ula25|soma_sub|saida~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula23|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula24|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula25|soma_sub|ALT_INV_saida~combout\,
	datae => \ULA|ula25|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ALT_INV_monitora_flag_z~6_combout\,
	combout => \monitora_flag_z~7_combout\);

\monitora_flag_z~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~8_combout\ = ( !\ULA|ula28|mux_ula|saida_MUX~0_combout\ & ( \monitora_flag_z~7_combout\ & ( (!\ULA|ula26|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula27|mux_ula|saida_MUX~1_combout\ & ((!\ULA|ula1|mux_ula|saida_MUX~1_combout\) # 
-- (!\ULA|ula28|soma_sub|saida~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula26|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula27|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \ULA|ula28|soma_sub|ALT_INV_saida~combout\,
	datae => \ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\,
	dataf => \ALT_INV_monitora_flag_z~7_combout\,
	combout => \monitora_flag_z~8_combout\);

\monitora_flag_z~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~9_combout\ = ( !\ULA|ula0|mux_ula|saida_MUX~1_combout\ & ( \monitora_flag_z~8_combout\ & ( (!\ULA|ula29|mux_ula|saida_MUX~0_combout\ & ((!\ULA|ula0|mux_ula|saida_MUX~0_combout\) # (!\ULA|ula30|soma_sub|carry_out~combout\ $ 
-- (!\ULA|ula31|soma_sub|saida~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100010010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula29|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	datad => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	dataf => \ALT_INV_monitora_flag_z~8_combout\,
	combout => \monitora_flag_z~9_combout\);

\ROM|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~7_combout\ = (!\PC_entity|DOUT\(5) & ((!\PC_entity|DOUT\(2) & (\PC_entity|DOUT\(3) & !\PC_entity|DOUT\(4))) # (\PC_entity|DOUT\(2) & ((\PC_entity|DOUT\(4))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010010100000000001001010000000000100101000000000010010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~7_combout\);

\PC_Soma_imediato|Add0~118\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~118_cout\ = CARRY(( \ROM|memROM~11_combout\ ) + ( \PC_Soma_Constante|Add0~21_sumout\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~11_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~21_sumout\,
	cin => GND,
	cout => \PC_Soma_imediato|Add0~118_cout\);

\PC_Soma_imediato|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~5_sumout\ = SUM(( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \ROM|memROM~7_combout\)) ) + ( \PC_Soma_Constante|Add0~5_sumout\ ) + ( \PC_Soma_imediato|Add0~118_cout\ ))
-- \PC_Soma_imediato|Add0~6\ = CARRY(( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \ROM|memROM~7_combout\)) ) + ( \PC_Soma_Constante|Add0~5_sumout\ ) + ( \PC_Soma_imediato|Add0~118_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datac => \PC_entity|ALT_INV_DOUT\(6),
	datad => \ROM|ALT_INV_memROM~7_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~5_sumout\,
	cin => \PC_Soma_imediato|Add0~118_cout\,
	sumout => \PC_Soma_imediato|Add0~5_sumout\,
	cout => \PC_Soma_imediato|Add0~6\);

\PC_Soma_imediato|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~9_sumout\ = SUM(( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \ROM|memROM~10_combout\)) ) + ( \PC_Soma_Constante|Add0~9_sumout\ ) + ( \PC_Soma_imediato|Add0~6\ ))
-- \PC_Soma_imediato|Add0~10\ = CARRY(( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \ROM|memROM~10_combout\)) ) + ( \PC_Soma_Constante|Add0~9_sumout\ ) + ( \PC_Soma_imediato|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datad => \ROM|ALT_INV_memROM~10_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~9_sumout\,
	cin => \PC_Soma_imediato|Add0~6\,
	sumout => \PC_Soma_imediato|Add0~9_sumout\,
	cout => \PC_Soma_imediato|Add0~10\);

\mux_PC|saida_MUX[4]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[4]~2_combout\ = ( \monitora_flag_z~9_combout\ & ( \PC_Soma_imediato|Add0~9_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\) # (\PC_Soma_Constante|Add0~9_sumout\)))) # (\UC|Equal3~0_combout\ & 
-- (\ROM|memROM~12_combout\)) ) ) ) # ( !\monitora_flag_z~9_combout\ & ( \PC_Soma_imediato|Add0~9_sumout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~9_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~12_combout\)) ) ) ) # ( 
-- \monitora_flag_z~9_combout\ & ( !\PC_Soma_imediato|Add0~9_sumout\ & ( (!\UC|Equal3~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \PC_Soma_Constante|Add0~9_sumout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~12_combout\)) ) ) ) # ( 
-- !\monitora_flag_z~9_combout\ & ( !\PC_Soma_imediato|Add0~9_sumout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~9_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~12_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101000000110101010100001111010101011100111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~12_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~9_sumout\,
	datad => \UC|ALT_INV_Equal3~0_combout\,
	datae => \ALT_INV_monitora_flag_z~9_combout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~9_sumout\,
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

\ROM|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~8_combout\ = ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & \PC_entity|DOUT\(2))) ) ) ) # ( !\PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & 
-- (!\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000010000000100000000000000000000000000000000000",
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
-- \mux_PC|saida_MUX[3]~1_combout\ = ( \monitora_flag_z~9_combout\ & ( \PC_Soma_imediato|Add0~5_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\) # (\PC_Soma_Constante|Add0~5_sumout\)))) # (\UC|Equal3~0_combout\ & 
-- (\ROM|memROM~8_combout\)) ) ) ) # ( !\monitora_flag_z~9_combout\ & ( \PC_Soma_imediato|Add0~5_sumout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~5_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~8_combout\)) ) ) ) # ( 
-- \monitora_flag_z~9_combout\ & ( !\PC_Soma_imediato|Add0~5_sumout\ & ( (!\UC|Equal3~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \PC_Soma_Constante|Add0~5_sumout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~8_combout\)) ) ) ) # ( 
-- !\monitora_flag_z~9_combout\ & ( !\PC_Soma_imediato|Add0~5_sumout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~5_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~8_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101000000110101010100001111010101011100111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~8_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~5_sumout\,
	datad => \UC|ALT_INV_Equal3~0_combout\,
	datae => \ALT_INV_monitora_flag_z~9_combout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~5_sumout\,
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

\ROM|memROM~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~11_combout\ = ( !\PC_entity|DOUT\(6) & ( !\PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	dataf => \PC_entity|ALT_INV_DOUT\(2),
	combout => \ROM|memROM~11_combout\);

\mux_PC|saida_MUX[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[2]~5_combout\ = ( \monitora_flag_z~9_combout\ & ( (!\UC|Equal3~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \PC_Soma_Constante|Add0~21_sumout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~11_combout\)) ) ) # ( 
-- !\monitora_flag_z~9_combout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~21_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~11_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101000000110101010100001111010101010000001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~11_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~21_sumout\,
	datad => \UC|ALT_INV_Equal3~0_combout\,
	datae => \ALT_INV_monitora_flag_z~9_combout\,
	combout => \mux_PC|saida_MUX[2]~5_combout\);

\PC_entity|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(2));

\ROM|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~5_combout\ = ((!\PC_entity|DOUT\(4) & ((\PC_entity|DOUT\(3)))) # (\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(2)))) # (\PC_entity|DOUT\(5))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011101011111111001110101111111100111010111111110011101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~5_combout\);

\ROM|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~6_combout\ = (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & !\ROM|memROM~5_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~5_combout\,
	combout => \ROM|memROM~6_combout\);

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

\PC_Soma_imediato|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~13_sumout\ = SUM(( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & !\ROM|memROM~5_combout\)) ) + ( \PC_Soma_Constante|Add0~13_sumout\ ) + ( \PC_Soma_imediato|Add0~10\ ))
-- \PC_Soma_imediato|Add0~14\ = CARRY(( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & !\ROM|memROM~5_combout\)) ) + ( \PC_Soma_Constante|Add0~13_sumout\ ) + ( \PC_Soma_imediato|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datad => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~13_sumout\,
	cin => \PC_Soma_imediato|Add0~10\,
	sumout => \PC_Soma_imediato|Add0~13_sumout\,
	cout => \PC_Soma_imediato|Add0~14\);

\mux_PC|saida_MUX[5]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[5]~3_combout\ = ( \monitora_flag_z~9_combout\ & ( \PC_Soma_imediato|Add0~13_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\) # (\PC_Soma_Constante|Add0~13_sumout\)))) # (\UC|Equal3~0_combout\ & 
-- (\ROM|memROM~6_combout\)) ) ) ) # ( !\monitora_flag_z~9_combout\ & ( \PC_Soma_imediato|Add0~13_sumout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~13_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~6_combout\)) ) ) ) # ( 
-- \monitora_flag_z~9_combout\ & ( !\PC_Soma_imediato|Add0~13_sumout\ & ( (!\UC|Equal3~0_combout\ & (((\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \PC_Soma_Constante|Add0~13_sumout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~6_combout\)) ) ) ) # ( 
-- !\monitora_flag_z~9_combout\ & ( !\PC_Soma_imediato|Add0~13_sumout\ & ( (!\UC|Equal3~0_combout\ & ((\PC_Soma_Constante|Add0~13_sumout\))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101000000110101010100001111010101011100111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~6_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~13_sumout\,
	datad => \UC|ALT_INV_Equal3~0_combout\,
	datae => \ALT_INV_monitora_flag_z~9_combout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~13_sumout\,
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

\PC_Soma_Constante|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~17_sumout\ = SUM(( \PC_entity|DOUT\(6) ) + ( GND ) + ( \PC_Soma_Constante|Add0~14\ ))
-- \PC_Soma_Constante|Add0~18\ = CARRY(( \PC_entity|DOUT\(6) ) + ( GND ) + ( \PC_Soma_Constante|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(6),
	cin => \PC_Soma_Constante|Add0~14\,
	sumout => \PC_Soma_Constante|Add0~17_sumout\,
	cout => \PC_Soma_Constante|Add0~18\);

\PC_Soma_imediato|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~17_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~17_sumout\ ) + ( \PC_Soma_imediato|Add0~14\ ))
-- \PC_Soma_imediato|Add0~18\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~17_sumout\ ) + ( \PC_Soma_imediato|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~17_sumout\,
	cin => \PC_Soma_imediato|Add0~14\,
	sumout => \PC_Soma_imediato|Add0~17_sumout\,
	cout => \PC_Soma_imediato|Add0~18\);

\mux_PC|saida_MUX[6]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[6]~4_combout\ = ( \PC_Soma_imediato|Add0~17_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~17_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~17_sumout\ & ( (\PC_Soma_Constante|Add0~17_sumout\ & (!\UC|Equal3~0_combout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000010000001100001011000000110000000100000011000010110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \PC_Soma_Constante|ALT_INV_Add0~17_sumout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~17_sumout\,
	combout => \mux_PC|saida_MUX[6]~4_combout\);

\PC_entity|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[6]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(6));

\ULA|ula8|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|mux_ula|saida_MUX~2_combout\ = ( !\PC_entity|DOUT\(7) & ( (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(5) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000001000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(6),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(7),
	combout => \ULA|ula8|mux_ula|saida_MUX~2_combout\);

\ULA|ula1|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|mux_ula|saida_MUX~1_combout\ = (!\ULA|ula8|mux_ula|saida_MUX~2_combout\ & !\ULA|ula8|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datab => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula1|mux_ula|saida_MUX~1_combout\);

\ULA|ula28|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|mux_ula|saida_MUX~1_combout\ = ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & \ULA|ula28|soma_sub|saida~combout\)) # (\ULA|ula28|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111100011111000111110001111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ULA|ula28|soma_sub|ALT_INV_saida~combout\,
	datac => \ULA|ula28|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|mux_ula|saida_MUX~1_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[28]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[28]~28_combout\ = (!\UC|sel_mux4~0_combout\ & ((\RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\))) # (\UC|sel_mux4~0_combout\ & (\ULA|ula28|mux_ula|saida_MUX~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_sel_mux4~0_combout\,
	datac => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a28~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[28]~28_combout\);

\bancoRegs|registrador~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[28]~28_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~66_q\);

\bancoRegs|saidaA[28]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[28]~28_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~322_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~66_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~66_q\,
	datab => \bancoRegs|ALT_INV_registrador~322_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[28]~28_combout\);

\ULA|ula28|soma_sub|saida_and~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|soma_sub|saida_and~0_combout\ = (\bancoRegs|saidaA[28]~28_combout\ & \ULA|ula28|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[28]~28_combout\,
	datab => \ULA|ula28|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|soma_sub|saida_and~0_combout\);

\ULA|ula29|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|soma_sub|carry_out~combout\ = (!\bancoRegs|saidaA[29]~29_combout\ & ((!\ULA|ula29|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula28|soma_sub|saida_xor2~combout\ & !\ULA|ula28|soma_sub|saida_and~0_combout\)))) # 
-- (\bancoRegs|saidaA[29]~29_combout\ & (!\ULA|ula28|soma_sub|saida_xor2~combout\ & (!\ULA|ula28|soma_sub|saida_and~0_combout\ & !\ULA|ula29|mux_inverteB|saida_MUX~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100010000000111110001000000011111000100000001111100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula28|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[29]~29_combout\,
	datad => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula29|soma_sub|carry_out~combout\);

\bancoRegs|registrador~324\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[30]~30_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~324_q\);

\bancoRegs|registrador~1222\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1222_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~68_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~68_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1222_combout\);

\bancoRegs|registrador~1182\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1182_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1222_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1222_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1222_combout\ & ( (\bancoRegs|registrador~324_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~324_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1222_combout\,
	combout => \bancoRegs|registrador~1182_combout\);

\bancoRegs|saidaB[30]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[30]~17_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1182_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1182_combout\,
	combout => \bancoRegs|saidaB[30]~17_combout\);

\ULA|ula30|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ = (!\UC|Equal2~0_combout\ & (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\bancoRegs|saidaB[30]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001010000010100000101000001010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datac => \bancoRegs|ALT_INV_saidaB[30]~17_combout\,
	combout => \ULA|ula30|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula30|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\bancoRegs|saidaA[30]~30_combout\ & (\ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # (\bancoRegs|saidaA[30]~30_combout\ & 
-- ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\ULA|ula30|mux_inverteB|saida_MUX~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[30]~30_combout\,
	datab => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[30]~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[30]~30_combout\ = ( \UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ & ( ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula29|soma_sub|carry_out~combout\ $ 
-- (\ULA|ula30|soma_sub|saida_xor~combout\)))) # (\ULA|ula30|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ ) ) # ( \UC|sel_mux4~0_combout\ & ( 
-- !\RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ & ( ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula29|soma_sub|carry_out~combout\ $ (\ULA|ula30|soma_sub|saida_xor~combout\)))) # (\ULA|ula30|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010011111111111111111111111110000100111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula30|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \UC|ALT_INV_sel_mux4~0_combout\,
	dataf => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a30~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[30]~30_combout\);

\bancoRegs|registrador~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[30]~30_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~68_q\);

\bancoRegs|saidaA[30]~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[30]~30_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~324_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~68_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~68_q\,
	datab => \bancoRegs|ALT_INV_registrador~324_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[30]~30_combout\);

\ULA|ula30|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[30]~30_combout\ $ (!\ULA|ula30|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[30]~30_combout\,
	datab => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|soma_sub|saida_xor~combout\);

\ULA|ula30|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|mux_ula|saida_MUX~1_combout\ = ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula29|soma_sub|carry_out~combout\ $ (\ULA|ula30|soma_sub|saida_xor~combout\)))) # (\ULA|ula30|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100111111111000010011111111100001001111111110000100111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula29|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula30|soma_sub|ALT_INV_saida_xor~combout\,
	datac => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datad => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|mux_ula|saida_MUX~1_combout\);

\PC_Soma_Constante|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~1_sumout\ = SUM(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))
-- \PC_Soma_Constante|Add0~2\ = CARRY(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(7),
	cin => \PC_Soma_Constante|Add0~18\,
	sumout => \PC_Soma_Constante|Add0~1_sumout\,
	cout => \PC_Soma_Constante|Add0~2\);

\ROM|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~1_combout\ = (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(6) & ((\PC_entity|DOUT\(4)) # (\PC_entity|DOUT\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000000011100000000000001110000000000000111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(3),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~1_combout\);

\PC_Soma_imediato|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~1_sumout\ = SUM(( (!\PC_entity|DOUT\(7) & \ROM|memROM~1_combout\) ) + ( \PC_Soma_Constante|Add0~1_sumout\ ) + ( \PC_Soma_imediato|Add0~18\ ))
-- \PC_Soma_imediato|Add0~2\ = CARRY(( (!\PC_entity|DOUT\(7) & \ROM|memROM~1_combout\) ) + ( \PC_Soma_Constante|Add0~1_sumout\ ) + ( \PC_Soma_imediato|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datad => \ROM|ALT_INV_memROM~1_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~1_sumout\,
	cin => \PC_Soma_imediato|Add0~18\,
	sumout => \PC_Soma_imediato|Add0~1_sumout\,
	cout => \PC_Soma_imediato|Add0~2\);

\mux_PC|saida_MUX[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[7]~0_combout\ = ( \UC|Equal3~0_combout\ & ( \monitora_flag_z~9_combout\ & ( \ROM|memROM~2_combout\ ) ) ) # ( !\UC|Equal3~0_combout\ & ( \monitora_flag_z~9_combout\ & ( (!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & 
-- ((\PC_Soma_imediato|Add0~1_sumout\))) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\ & (\PC_Soma_Constante|Add0~1_sumout\)) ) ) ) # ( \UC|Equal3~0_combout\ & ( !\monitora_flag_z~9_combout\ & ( \ROM|memROM~2_combout\ ) ) ) # ( !\UC|Equal3~0_combout\ & ( 
-- !\monitora_flag_z~9_combout\ & ( \PC_Soma_Constante|Add0~1_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111010101010101010100000011110011110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~1_sumout\,
	datad => \PC_Soma_imediato|ALT_INV_Add0~1_sumout\,
	datae => \UC|ALT_INV_Equal3~0_combout\,
	dataf => \ALT_INV_monitora_flag_z~9_combout\,
	combout => \mux_PC|saida_MUX[7]~0_combout\);

\PC_entity|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(7));

\ROM|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~2_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(5) & ((\PC_entity|DOUT\(4)) # (\PC_entity|DOUT\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000000000000000000000000000101010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~2_combout\);

\UC_ULA|ula_ctrl[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC_ULA|ula_ctrl[2]~1_combout\ = ( !\monitora_flag_z~0_combout\ & ( \UC_ULA|ula_ctrl~0_combout\ ) ) # ( !\monitora_flag_z~0_combout\ & ( !\UC_ULA|ula_ctrl~0_combout\ & ( (!\ROM|memROM~2_combout\) # ((!\ROM|memROM~8_combout\) # 
-- (\UC|palavraControle[9]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	datad => \UC|ALT_INV_palavraControle[9]~0_combout\,
	datae => \ALT_INV_monitora_flag_z~0_combout\,
	dataf => \UC_ULA|ALT_INV_ula_ctrl~0_combout\,
	combout => \UC_ULA|ula_ctrl[2]~1_combout\);

\bancoRegs|registrador~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[31]~31_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~69_q\);

\bancoRegs|saidaA[31]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[31]~31_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~325_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( 
-- (\bancoRegs|registrador~69_q\ & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~69_q\,
	datab => \bancoRegs|ALT_INV_registrador~325_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[31]~31_combout\);

\ULA|ula31|mux_ula|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_ula|saida_MUX~0_combout\ = (\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ((!\ULA|ula31|mux_inverteB|saida_MUX~0_combout\ & (\bancoRegs|saidaA[31]~31_combout\ & \ULA|ula8|mux_ula|saida_MUX~2_combout\)) # 
-- (\ULA|ula31|mux_inverteB|saida_MUX~0_combout\ & ((\ULA|ula8|mux_ula|saida_MUX~2_combout\) # (\bancoRegs|saidaA[31]~31_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100000000000101110000000000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datab => \bancoRegs|ALT_INV_saidaA[31]~31_combout\,
	datac => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	datad => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|mux_ula|saida_MUX~0_combout\);

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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[31]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[31]~31_combout\ = ( \UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ & ( ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula30|soma_sub|carry_out~combout\ $ 
-- (\ULA|ula31|soma_sub|saida~0_combout\)))) # (\ULA|ula31|mux_ula|saida_MUX~0_combout\) ) ) ) # ( !\UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ ) ) # ( \UC|sel_mux4~0_combout\ & ( 
-- !\RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ & ( ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula30|soma_sub|carry_out~combout\ $ (\ULA|ula31|soma_sub|saida~0_combout\)))) # (\ULA|ula31|mux_ula|saida_MUX~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000011111111111111111111111110010000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	datad => \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datae => \UC|ALT_INV_sel_mux4~0_combout\,
	dataf => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a31~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[31]~31_combout\);

\bancoRegs|registrador~325\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[31]~31_combout\,
	ena => \bancoRegs|registrador~1191_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~325_q\);

\bancoRegs|registrador~1223\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1223_combout\ = ( \ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \ROM|memROM~15_combout\ & ( \ROM|memROM~14_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( 
-- !\ROM|memROM~15_combout\ & ( (\bancoRegs|registrador~69_q\ & !\ROM|memROM~14_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~69_q\,
	datad => \ROM|ALT_INV_memROM~14_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \ROM|ALT_INV_memROM~15_combout\,
	combout => \bancoRegs|registrador~1223_combout\);

\bancoRegs|registrador~1186\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1186_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1223_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|registrador~1223_combout\ & ( !\ROM|memROM~15_combout\ ) ) ) # ( 
-- !\ROM|memROM~2_combout\ & ( !\bancoRegs|registrador~1223_combout\ & ( (\bancoRegs|registrador~325_q\ & \ROM|memROM~15_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \bancoRegs|ALT_INV_registrador~325_q\,
	datad => \ROM|ALT_INV_memROM~15_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1223_combout\,
	combout => \bancoRegs|registrador~1186_combout\);

\bancoRegs|saidaB[31]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[31]~18_combout\ = (\bancoRegs|Equal0~0_combout\ & \bancoRegs|registrador~1186_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1186_combout\,
	combout => \bancoRegs|saidaB[31]~18_combout\);

\mux_rt_imediato|saida_MUX[31]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_imediato|saida_MUX[31]~0_combout\ = (!\UC|Equal2~0_combout\ & \bancoRegs|saidaB[31]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_Equal2~0_combout\,
	datab => \bancoRegs|ALT_INV_saidaB[31]~18_combout\,
	combout => \mux_rt_imediato|saida_MUX[31]~0_combout\);

\ULA|ula31|mux_inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_inverteB|saida_MUX~0_combout\ = !\UC_ULA|ula_ctrl[2]~1_combout\ $ (\mux_rt_imediato|saida_MUX[31]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\,
	combout => \ULA|ula31|mux_inverteB|saida_MUX~0_combout\);

\ULA|ula31|soma_sub|saida~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|soma_sub|saida~0_combout\ = !\ULA|ula31|mux_inverteB|saida_MUX~0_combout\ $ (!\bancoRegs|saidaA[31]~31_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula31|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datab => \bancoRegs|ALT_INV_saidaA[31]~31_combout\,
	combout => \ULA|ula31|soma_sub|saida~0_combout\);

\bancoRegs|saidaB[0]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaB[0]~20_combout\ = (\bancoRegs|registrador~1062_combout\ & \bancoRegs|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
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
	portbre => \UC|Equal1~0_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\mux_ULA_mem|saida_MUX[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_ULA_mem|saida_MUX[0]~0_combout\ = ( \UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ & ( ((\ULA|ula0|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula30|soma_sub|carry_out~combout\ $ 
-- (\ULA|ula31|soma_sub|saida~0_combout\)))) # (\ULA|ula0|mux_ula|saida_MUX~1_combout\) ) ) ) # ( !\UC|sel_mux4~0_combout\ & ( \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ ) ) # ( \UC|sel_mux4~0_combout\ & ( 
-- !\RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ & ( ((\ULA|ula0|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula30|soma_sub|carry_out~combout\ $ (\ULA|ula31|soma_sub|saida~0_combout\)))) # (\ULA|ula0|mux_ula|saida_MUX~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010011111111111111111111111110000100111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	datac => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datae => \UC|ALT_INV_sel_mux4~0_combout\,
	dataf => \RAM|memRAM_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	combout => \mux_ULA_mem|saida_MUX[0]~0_combout\);

\bancoRegs|registrador~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_ULA_mem|saida_MUX[0]~0_combout\,
	ena => \bancoRegs|registrador~1190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~38_q\);

\bancoRegs|saidaA[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|saidaA[0]~0_combout\ = ( \ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~294_q\ & !\ROM|memROM~0_combout\) ) ) ) # ( !\ROM|memROM~2_combout\ & ( \bancoRegs|Equal1~0_combout\ & ( (\bancoRegs|registrador~38_q\ 
-- & !\ROM|memROM~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~38_q\,
	datab => \bancoRegs|ALT_INV_registrador~294_q\,
	datad => \ROM|ALT_INV_memROM~0_combout\,
	datae => \ROM|ALT_INV_memROM~2_combout\,
	dataf => \bancoRegs|ALT_INV_Equal1~0_combout\,
	combout => \bancoRegs|saidaA[0]~0_combout\);

\ULA|ula0|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|soma_sub|carry_out~combout\ = ( \UC_ULA|ula_ctrl[2]~1_combout\ & ( (\bancoRegs|saidaA[0]~0_combout\ & (\bancoRegs|registrador~1062_combout\ & (\bancoRegs|Equal0~0_combout\ & !\UC|Equal2~0_combout\))) ) ) # ( !\UC_ULA|ula_ctrl[2]~1_combout\ & ( 
-- ((!\UC|Equal2~0_combout\ & ((!\bancoRegs|registrador~1062_combout\) # (!\bancoRegs|Equal0~0_combout\)))) # (\bancoRegs|saidaA[0]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110101010101000000010000000011111101010101010000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[0]~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1062_combout\,
	datac => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datad => \UC|ALT_INV_Equal2~0_combout\,
	datae => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	combout => \ULA|ula0|soma_sub|carry_out~combout\);

\ULA|ula3|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_xor~combout\ = ( \bancoRegs|saidaA[3]~3_combout\ & ( \bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (((!\UC_ULA|ula_ctrl[2]~1_combout\))))) # (\UC|Equal2~0_combout\ & 
-- (((!\ROM|memROM~6_combout\)))) ) ) ) # ( !\bancoRegs|saidaA[3]~3_combout\ & ( \bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & (!\bancoRegs|Equal0~0_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\))))) # (\UC|Equal2~0_combout\ & 
-- (((\ROM|memROM~6_combout\)))) ) ) ) # ( \bancoRegs|saidaA[3]~3_combout\ & ( !\bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & ((\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (!\ROM|memROM~6_combout\)) ) ) ) # ( 
-- !\bancoRegs|saidaA[3]~3_combout\ & ( !\bancoRegs|registrador~1074_combout\ & ( (!\UC|Equal2~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\))) # (\UC|Equal2~0_combout\ & (\ROM|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001100000011000011001111110010100011010100110101110010101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \ROM|ALT_INV_memROM~6_combout\,
	datac => \UC|ALT_INV_Equal2~0_combout\,
	datad => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[3]~3_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1074_combout\,
	combout => \ULA|ula3|soma_sub|saida_xor~combout\);

\ULA|ula3|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|soma_sub|saida_xor2~combout\ = ( \ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula3|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~1_combout\ & 
-- \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # (\ULA|ula0|soma_sub|carry_out~combout\ & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~1_combout\)))) # (\bancoRegs|saidaA[2]~2_combout\) ) ) ) # ( 
-- !\ULA|ula2|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula3|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[2]~2_combout\ & ((!\ULA|ula0|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[1]~1_combout\ & \ULA|ula1|mux_inverteB|saida_MUX~0_combout\)) # 
-- (\ULA|ula0|soma_sub|carry_out~combout\ & ((\ULA|ula1|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[1]~1_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula0|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[1]~1_combout\,
	datac => \ULA|ula1|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[2]~2_combout\,
	datae => \ULA|ula2|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula3|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula3|soma_sub|saida_xor2~combout\);

\ULA|ula5|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|soma_sub|carry_out~combout\ = ( !\bancoRegs|saidaA[5]~5_combout\ & ( \ULA|ula5|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[4]~4_combout\ & ((!\ULA|ula4|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula3|soma_sub|saida_xor2~combout\ 
-- & !\ULA|ula3|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[4]~4_combout\ & (!\ULA|ula3|soma_sub|saida_xor2~combout\ & (!\ULA|ula3|soma_sub|saida_and~0_combout\ & !\ULA|ula4|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( 
-- \bancoRegs|saidaA[5]~5_combout\ & ( !\ULA|ula5|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[4]~4_combout\ & ((!\ULA|ula4|mux_inverteB|saida_MUX~0_combout\) # ((!\ULA|ula3|soma_sub|saida_xor2~combout\ & 
-- !\ULA|ula3|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[4]~4_combout\ & (!\ULA|ula3|soma_sub|saida_xor2~combout\ & (!\ULA|ula3|soma_sub|saida_and~0_combout\ & !\ULA|ula4|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( 
-- !\bancoRegs|saidaA[5]~5_combout\ & ( !\ULA|ula5|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula3|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula3|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[4]~4_combout\,
	datad => \ULA|ula4|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[5]~5_combout\,
	dataf => \ULA|ula5|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula5|soma_sub|carry_out~combout\);

\ULA|ula8|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_xor~combout\ = ( \bancoRegs|registrador~1094_combout\ & ( !\bancoRegs|saidaA[8]~8_combout\ $ (((!\bancoRegs|Equal0~0_combout\ $ (!\UC_ULA|ula_ctrl[2]~1_combout\)) # (\UC|Equal2~0_combout\))) ) ) # ( 
-- !\bancoRegs|registrador~1094_combout\ & ( !\bancoRegs|saidaA[8]~8_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\) # (\UC|Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000111111100001000111101111000000001111111000010001111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[8]~8_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1094_combout\,
	combout => \ULA|ula8|soma_sub|saida_xor~combout\);

\ULA|ula8|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|soma_sub|saida_xor2~combout\ = ( \ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula8|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula5|soma_sub|carry_out~combout\ & ((\ULA|ula6|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[6]~6_combout\))) # (\ULA|ula5|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[6]~6_combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[7]~7_combout\) ) ) ) # ( !\ULA|ula7|mux_inverteB|saida_MUX~0_combout\ & ( 
-- \ULA|ula8|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[7]~7_combout\ & ((!\ULA|ula5|soma_sub|carry_out~combout\ & ((\ULA|ula6|mux_inverteB|saida_MUX~0_combout\) # (\bancoRegs|saidaA[6]~6_combout\))) # (\ULA|ula5|soma_sub|carry_out~combout\ & 
-- (\bancoRegs|saidaA[6]~6_combout\ & \ULA|ula6|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula5|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[6]~6_combout\,
	datac => \ULA|ula6|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[7]~7_combout\,
	datae => \ULA|ula7|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula8|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula8|soma_sub|saida_xor2~combout\);

\ULA|ula10|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|soma_sub|carry_out~combout\ = ( !\bancoRegs|saidaA[10]~10_combout\ & ( \ULA|ula10|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[9]~9_combout\ & ((!\ULA|ula9|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula8|soma_sub|saida_xor2~combout\ & !\ULA|ula8|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[9]~9_combout\ & (!\ULA|ula8|soma_sub|saida_xor2~combout\ & (!\ULA|ula8|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula9|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \bancoRegs|saidaA[10]~10_combout\ & ( !\ULA|ula10|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[9]~9_combout\ & ((!\ULA|ula9|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula8|soma_sub|saida_xor2~combout\ & !\ULA|ula8|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[9]~9_combout\ & (!\ULA|ula8|soma_sub|saida_xor2~combout\ & (!\ULA|ula8|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula9|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\bancoRegs|saidaA[10]~10_combout\ & ( !\ULA|ula10|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula8|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula8|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[9]~9_combout\,
	datad => \ULA|ula9|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[10]~10_combout\,
	dataf => \ULA|ula10|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula10|soma_sub|carry_out~combout\);

\ULA|ula13|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_xor~combout\ = ( \bancoRegs|registrador~1114_combout\ & ( !\bancoRegs|saidaA[13]~13_combout\ $ (((!\bancoRegs|Equal0~0_combout\ $ (!\UC_ULA|ula_ctrl[2]~1_combout\)) # (\UC|Equal2~0_combout\))) ) ) # ( 
-- !\bancoRegs|registrador~1114_combout\ & ( !\bancoRegs|saidaA[13]~13_combout\ $ (((\UC_ULA|ula_ctrl[2]~1_combout\) # (\UC|Equal2~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000111111100001000111101111000000001111111000010001111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_Equal0~0_combout\,
	datab => \UC|ALT_INV_Equal2~0_combout\,
	datac => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[13]~13_combout\,
	datae => \bancoRegs|ALT_INV_registrador~1114_combout\,
	combout => \ULA|ula13|soma_sub|saida_xor~combout\);

\ULA|ula13|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|soma_sub|saida_xor2~combout\ = ( \ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula13|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula10|soma_sub|carry_out~combout\ & ((\ULA|ula11|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[11]~11_combout\))) # (\ULA|ula10|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[11]~11_combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[12]~12_combout\) ) ) ) # ( 
-- !\ULA|ula12|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula13|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[12]~12_combout\ & ((!\ULA|ula10|soma_sub|carry_out~combout\ & ((\ULA|ula11|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[11]~11_combout\))) # (\ULA|ula10|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[11]~11_combout\ & \ULA|ula11|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula10|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[11]~11_combout\,
	datac => \ULA|ula11|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[12]~12_combout\,
	datae => \ULA|ula12|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula13|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula13|soma_sub|saida_xor2~combout\);

\ULA|ula15|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|soma_sub|carry_out~combout\ = ( !\bancoRegs|saidaA[15]~15_combout\ & ( \ULA|ula15|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[14]~14_combout\ & ((!\ULA|ula14|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula13|soma_sub|saida_xor2~combout\ & !\ULA|ula13|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[14]~14_combout\ & (!\ULA|ula13|soma_sub|saida_xor2~combout\ & (!\ULA|ula13|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula14|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \bancoRegs|saidaA[15]~15_combout\ & ( !\ULA|ula15|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[14]~14_combout\ & ((!\ULA|ula14|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula13|soma_sub|saida_xor2~combout\ & !\ULA|ula13|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[14]~14_combout\ & (!\ULA|ula13|soma_sub|saida_xor2~combout\ & (!\ULA|ula13|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula14|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\bancoRegs|saidaA[15]~15_combout\ & ( !\ULA|ula15|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula13|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula13|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[14]~14_combout\,
	datad => \ULA|ula14|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[15]~15_combout\,
	dataf => \ULA|ula15|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula15|soma_sub|carry_out~combout\);

\ULA|ula18|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[18]~18_combout\ $ (!\ULA|ula18|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[18]~18_combout\,
	datab => \ULA|ula18|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula18|soma_sub|saida_xor~combout\);

\ULA|ula18|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|soma_sub|saida_xor2~combout\ = ( \ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula18|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula15|soma_sub|carry_out~combout\ & ((\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[16]~16_combout\))) # (\ULA|ula15|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[16]~16_combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[17]~17_combout\) ) ) ) # ( 
-- !\ULA|ula17|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula18|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[17]~17_combout\ & ((!\ULA|ula15|soma_sub|carry_out~combout\ & ((\ULA|ula16|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[16]~16_combout\))) # (\ULA|ula15|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[16]~16_combout\ & \ULA|ula16|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula15|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[16]~16_combout\,
	datac => \ULA|ula16|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[17]~17_combout\,
	datae => \ULA|ula17|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula18|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula18|soma_sub|saida_xor2~combout\);

\ULA|ula20|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|soma_sub|carry_out~combout\ = ( !\bancoRegs|saidaA[20]~20_combout\ & ( \ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[19]~19_combout\ & ((!\ULA|ula19|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula18|soma_sub|saida_xor2~combout\ & !\ULA|ula18|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[19]~19_combout\ & (!\ULA|ula18|soma_sub|saida_xor2~combout\ & (!\ULA|ula18|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula19|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \bancoRegs|saidaA[20]~20_combout\ & ( !\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[19]~19_combout\ & ((!\ULA|ula19|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula18|soma_sub|saida_xor2~combout\ & !\ULA|ula18|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[19]~19_combout\ & (!\ULA|ula18|soma_sub|saida_xor2~combout\ & (!\ULA|ula18|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula19|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\bancoRegs|saidaA[20]~20_combout\ & ( !\ULA|ula20|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula18|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula18|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[19]~19_combout\,
	datad => \ULA|ula19|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[20]~20_combout\,
	dataf => \ULA|ula20|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula20|soma_sub|carry_out~combout\);

\ULA|ula23|soma_sub|saida_xor\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|soma_sub|saida_xor~combout\ = !\bancoRegs|saidaA[23]~23_combout\ $ (!\ULA|ula23|mux_inverteB|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_saidaA[23]~23_combout\,
	datab => \ULA|ula23|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula23|soma_sub|saida_xor~combout\);

\ULA|ula23|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|soma_sub|saida_xor2~combout\ = ( \ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula23|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula20|soma_sub|carry_out~combout\ & ((\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[21]~21_combout\))) # (\ULA|ula20|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[21]~21_combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[22]~22_combout\) ) ) ) # ( 
-- !\ULA|ula22|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula23|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[22]~22_combout\ & ((!\ULA|ula20|soma_sub|carry_out~combout\ & ((\ULA|ula21|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[21]~21_combout\))) # (\ULA|ula20|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[21]~21_combout\ & \ULA|ula21|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[21]~21_combout\,
	datac => \ULA|ula21|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[22]~22_combout\,
	datae => \ULA|ula22|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula23|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula23|soma_sub|saida_xor2~combout\);

\ULA|ula25|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|soma_sub|carry_out~combout\ = ( !\bancoRegs|saidaA[25]~25_combout\ & ( \ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[24]~24_combout\ & ((!\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula23|soma_sub|saida_xor2~combout\ & !\ULA|ula23|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[24]~24_combout\ & (!\ULA|ula23|soma_sub|saida_xor2~combout\ & (!\ULA|ula23|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula24|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \bancoRegs|saidaA[25]~25_combout\ & ( !\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[24]~24_combout\ & ((!\ULA|ula24|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula23|soma_sub|saida_xor2~combout\ & !\ULA|ula23|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[24]~24_combout\ & (!\ULA|ula23|soma_sub|saida_xor2~combout\ & (!\ULA|ula23|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula24|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\bancoRegs|saidaA[25]~25_combout\ & ( !\ULA|ula25|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula23|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula23|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[24]~24_combout\,
	datad => \ULA|ula24|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[25]~25_combout\,
	dataf => \ULA|ula25|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|soma_sub|carry_out~combout\);

\ULA|ula28|soma_sub|saida_xor2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|soma_sub|saida_xor2~combout\ = ( \ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula28|soma_sub|saida_xor~combout\ & ( ((!\ULA|ula25|soma_sub|carry_out~combout\ & ((\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[26]~26_combout\))) # (\ULA|ula25|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[26]~26_combout\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\))) # (\bancoRegs|saidaA[27]~27_combout\) ) ) ) # ( 
-- !\ULA|ula27|mux_inverteB|saida_MUX~0_combout\ & ( \ULA|ula28|soma_sub|saida_xor~combout\ & ( (\bancoRegs|saidaA[27]~27_combout\ & ((!\ULA|ula25|soma_sub|carry_out~combout\ & ((\ULA|ula26|mux_inverteB|saida_MUX~0_combout\) # 
-- (\bancoRegs|saidaA[26]~26_combout\))) # (\ULA|ula25|soma_sub|carry_out~combout\ & (\bancoRegs|saidaA[26]~26_combout\ & \ULA|ula26|mux_inverteB|saida_MUX~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001010110010101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula25|soma_sub|ALT_INV_carry_out~combout\,
	datab => \bancoRegs|ALT_INV_saidaA[26]~26_combout\,
	datac => \ULA|ula26|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[27]~27_combout\,
	datae => \ULA|ula27|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	dataf => \ULA|ula28|soma_sub|ALT_INV_saida_xor~combout\,
	combout => \ULA|ula28|soma_sub|saida_xor2~combout\);

\ULA|ula30|soma_sub|carry_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|soma_sub|carry_out~combout\ = ( !\bancoRegs|saidaA[30]~30_combout\ & ( \ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[29]~29_combout\ & ((!\ULA|ula29|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula28|soma_sub|saida_xor2~combout\ & !\ULA|ula28|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[29]~29_combout\ & (!\ULA|ula28|soma_sub|saida_xor2~combout\ & (!\ULA|ula28|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula29|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( \bancoRegs|saidaA[30]~30_combout\ & ( !\ULA|ula30|mux_inverteB|saida_MUX~0_combout\ & ( (!\bancoRegs|saidaA[29]~29_combout\ & ((!\ULA|ula29|mux_inverteB|saida_MUX~0_combout\) # 
-- ((!\ULA|ula28|soma_sub|saida_xor2~combout\ & !\ULA|ula28|soma_sub|saida_and~0_combout\)))) # (\bancoRegs|saidaA[29]~29_combout\ & (!\ULA|ula28|soma_sub|saida_xor2~combout\ & (!\ULA|ula28|soma_sub|saida_and~0_combout\ & 
-- !\ULA|ula29|mux_inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\bancoRegs|saidaA[30]~30_combout\ & ( !\ULA|ula30|mux_inverteB|saida_MUX~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110001000000011111000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula28|soma_sub|ALT_INV_saida_xor2~combout\,
	datab => \ULA|ula28|soma_sub|ALT_INV_saida_and~0_combout\,
	datac => \bancoRegs|ALT_INV_saidaA[29]~29_combout\,
	datad => \ULA|ula29|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	datae => \bancoRegs|ALT_INV_saidaA[30]~30_combout\,
	dataf => \ULA|ula30|mux_inverteB|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|soma_sub|carry_out~combout\);

\ULA|ula0|mux_ula|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|mux_ula|saida_MUX~2_combout\ = ((\ULA|ula0|mux_ula|saida_MUX~0_combout\ & (!\ULA|ula30|soma_sub|carry_out~combout\ $ (\ULA|ula31|soma_sub|saida~0_combout\)))) # (\ULA|ula0|mux_ula|saida_MUX~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100111111111000010011111111100001001111111110000100111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	datac => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula0|mux_ula|ALT_INV_saida_MUX~1_combout\,
	combout => \ULA|ula0|mux_ula|saida_MUX~2_combout\);

\ULA|ula31|mux_ula|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|mux_ula|saida_MUX~1_combout\ = ((\ULA|ula1|mux_ula|saida_MUX~1_combout\ & (!\ULA|ula30|soma_sub|carry_out~combout\ $ (\ULA|ula31|soma_sub|saida~0_combout\)))) # (\ULA|ula31|mux_ula|saida_MUX~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000111111111001000011111111100100001111111110010000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datab => \ULA|ula1|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \ULA|ula31|soma_sub|ALT_INV_saida~0_combout\,
	datad => \ULA|ula31|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|mux_ula|saida_MUX~1_combout\);

\PC_Soma_Constante|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~25_sumout\ = SUM(( \PC_entity|DOUT\(8) ) + ( GND ) + ( \PC_Soma_Constante|Add0~2\ ))
-- \PC_Soma_Constante|Add0~26\ = CARRY(( \PC_entity|DOUT\(8) ) + ( GND ) + ( \PC_Soma_Constante|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(8),
	cin => \PC_Soma_Constante|Add0~2\,
	sumout => \PC_Soma_Constante|Add0~25_sumout\,
	cout => \PC_Soma_Constante|Add0~26\);

\PC_Soma_imediato|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~21_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~25_sumout\ ) + ( \PC_Soma_imediato|Add0~2\ ))
-- \PC_Soma_imediato|Add0~22\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~25_sumout\ ) + ( \PC_Soma_imediato|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~25_sumout\,
	cin => \PC_Soma_imediato|Add0~2\,
	sumout => \PC_Soma_imediato|Add0~21_sumout\,
	cout => \PC_Soma_imediato|Add0~22\);

\mux_PC|saida_MUX[8]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[8]~6_combout\ = ( \PC_Soma_imediato|Add0~21_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~25_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~21_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~25_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~25_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~21_sumout\,
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

\PC_Soma_imediato|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~25_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~29_sumout\ ) + ( \PC_Soma_imediato|Add0~22\ ))
-- \PC_Soma_imediato|Add0~26\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~29_sumout\ ) + ( \PC_Soma_imediato|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~29_sumout\,
	cin => \PC_Soma_imediato|Add0~22\,
	sumout => \PC_Soma_imediato|Add0~25_sumout\,
	cout => \PC_Soma_imediato|Add0~26\);

\mux_PC|saida_MUX[9]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[9]~7_combout\ = ( \PC_Soma_imediato|Add0~25_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~29_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~25_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~29_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~29_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~25_sumout\,
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

\PC_Soma_imediato|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~29_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~33_sumout\ ) + ( \PC_Soma_imediato|Add0~26\ ))
-- \PC_Soma_imediato|Add0~30\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~33_sumout\ ) + ( \PC_Soma_imediato|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~33_sumout\,
	cin => \PC_Soma_imediato|Add0~26\,
	sumout => \PC_Soma_imediato|Add0~29_sumout\,
	cout => \PC_Soma_imediato|Add0~30\);

\mux_PC|saida_MUX[10]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[10]~8_combout\ = ( \PC_Soma_imediato|Add0~29_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~33_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~29_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~33_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~33_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~29_sumout\,
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

\PC_Soma_imediato|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~33_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~37_sumout\ ) + ( \PC_Soma_imediato|Add0~30\ ))
-- \PC_Soma_imediato|Add0~34\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~37_sumout\ ) + ( \PC_Soma_imediato|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~37_sumout\,
	cin => \PC_Soma_imediato|Add0~30\,
	sumout => \PC_Soma_imediato|Add0~33_sumout\,
	cout => \PC_Soma_imediato|Add0~34\);

\mux_PC|saida_MUX[11]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[11]~9_combout\ = ( \PC_Soma_imediato|Add0~33_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~37_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~33_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~37_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~37_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~33_sumout\,
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

\PC_Soma_imediato|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~37_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~41_sumout\ ) + ( \PC_Soma_imediato|Add0~34\ ))
-- \PC_Soma_imediato|Add0~38\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~41_sumout\ ) + ( \PC_Soma_imediato|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~41_sumout\,
	cin => \PC_Soma_imediato|Add0~34\,
	sumout => \PC_Soma_imediato|Add0~37_sumout\,
	cout => \PC_Soma_imediato|Add0~38\);

\mux_PC|saida_MUX[12]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[12]~10_combout\ = ( \PC_Soma_imediato|Add0~37_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~41_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~37_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~41_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~41_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~37_sumout\,
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

\PC_Soma_imediato|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~41_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~45_sumout\ ) + ( \PC_Soma_imediato|Add0~38\ ))
-- \PC_Soma_imediato|Add0~42\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~45_sumout\ ) + ( \PC_Soma_imediato|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~45_sumout\,
	cin => \PC_Soma_imediato|Add0~38\,
	sumout => \PC_Soma_imediato|Add0~41_sumout\,
	cout => \PC_Soma_imediato|Add0~42\);

\mux_PC|saida_MUX[13]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[13]~11_combout\ = ( \PC_Soma_imediato|Add0~41_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~45_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~41_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~45_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~45_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~41_sumout\,
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

\PC_Soma_imediato|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~45_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~49_sumout\ ) + ( \PC_Soma_imediato|Add0~42\ ))
-- \PC_Soma_imediato|Add0~46\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~49_sumout\ ) + ( \PC_Soma_imediato|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~49_sumout\,
	cin => \PC_Soma_imediato|Add0~42\,
	sumout => \PC_Soma_imediato|Add0~45_sumout\,
	cout => \PC_Soma_imediato|Add0~46\);

\mux_PC|saida_MUX[14]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[14]~12_combout\ = ( \PC_Soma_imediato|Add0~45_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~49_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~45_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~49_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~49_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~45_sumout\,
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

\PC_Soma_imediato|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~49_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~53_sumout\ ) + ( \PC_Soma_imediato|Add0~46\ ))
-- \PC_Soma_imediato|Add0~50\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~53_sumout\ ) + ( \PC_Soma_imediato|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~53_sumout\,
	cin => \PC_Soma_imediato|Add0~46\,
	sumout => \PC_Soma_imediato|Add0~49_sumout\,
	cout => \PC_Soma_imediato|Add0~50\);

\mux_PC|saida_MUX[15]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[15]~13_combout\ = ( \PC_Soma_imediato|Add0~49_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~53_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~49_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~53_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~53_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~49_sumout\,
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

\PC_Soma_imediato|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~53_sumout\ = SUM(( (!\PC_entity|DOUT\(7) & \ROM|memROM~1_combout\) ) + ( \PC_Soma_Constante|Add0~57_sumout\ ) + ( \PC_Soma_imediato|Add0~50\ ))
-- \PC_Soma_imediato|Add0~54\ = CARRY(( (!\PC_entity|DOUT\(7) & \ROM|memROM~1_combout\) ) + ( \PC_Soma_Constante|Add0~57_sumout\ ) + ( \PC_Soma_imediato|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datad => \ROM|ALT_INV_memROM~1_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~57_sumout\,
	cin => \PC_Soma_imediato|Add0~50\,
	sumout => \PC_Soma_imediato|Add0~53_sumout\,
	cout => \PC_Soma_imediato|Add0~54\);

\mux_PC|saida_MUX[16]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[16]~14_combout\ = ( \PC_Soma_Constante|Add0~57_sumout\ & ( \PC_Soma_imediato|Add0~53_sumout\ & ( (!\UC|Equal3~0_combout\) # (\ROM|memROM~2_combout\) ) ) ) # ( !\PC_Soma_Constante|Add0~57_sumout\ & ( \PC_Soma_imediato|Add0~53_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~2_combout\)) ) ) ) # ( \PC_Soma_Constante|Add0~57_sumout\ & ( !\PC_Soma_imediato|Add0~53_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~2_combout\)) ) ) ) # ( !\PC_Soma_Constante|Add0~57_sumout\ & ( !\PC_Soma_imediato|Add0~53_sumout\ & ( 
-- (\ROM|memROM~2_combout\ & \UC|Equal3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101010011010100000101110001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~57_sumout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~53_sumout\,
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

\PC_Soma_imediato|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~57_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~61_sumout\ ) + ( \PC_Soma_imediato|Add0~54\ ))
-- \PC_Soma_imediato|Add0~58\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~61_sumout\ ) + ( \PC_Soma_imediato|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~61_sumout\,
	cin => \PC_Soma_imediato|Add0~54\,
	sumout => \PC_Soma_imediato|Add0~57_sumout\,
	cout => \PC_Soma_imediato|Add0~58\);

\mux_PC|saida_MUX[17]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[17]~15_combout\ = ( \PC_Soma_imediato|Add0~57_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~61_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~57_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~61_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~61_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~57_sumout\,
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

\PC_Soma_imediato|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~61_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~65_sumout\ ) + ( \PC_Soma_imediato|Add0~58\ ))
-- \PC_Soma_imediato|Add0~62\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~65_sumout\ ) + ( \PC_Soma_imediato|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~65_sumout\,
	cin => \PC_Soma_imediato|Add0~58\,
	sumout => \PC_Soma_imediato|Add0~61_sumout\,
	cout => \PC_Soma_imediato|Add0~62\);

\mux_PC|saida_MUX[18]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[18]~16_combout\ = ( \PC_Soma_Constante|Add0~65_sumout\ & ( \PC_Soma_imediato|Add0~61_sumout\ & ( (!\UC|Equal3~0_combout\) # (\ROM|memROM~14_combout\) ) ) ) # ( !\PC_Soma_Constante|Add0~65_sumout\ & ( \PC_Soma_imediato|Add0~61_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~14_combout\)) ) ) ) # ( \PC_Soma_Constante|Add0~65_sumout\ & ( !\PC_Soma_imediato|Add0~61_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~14_combout\)) ) ) ) # ( !\PC_Soma_Constante|Add0~65_sumout\ & ( !\PC_Soma_imediato|Add0~61_sumout\ & ( 
-- (\ROM|memROM~14_combout\ & \UC|Equal3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101010011010100000101110001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~14_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~65_sumout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~61_sumout\,
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

\PC_Soma_imediato|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~65_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~69_sumout\ ) + ( \PC_Soma_imediato|Add0~62\ ))
-- \PC_Soma_imediato|Add0~66\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~69_sumout\ ) + ( \PC_Soma_imediato|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~69_sumout\,
	cin => \PC_Soma_imediato|Add0~62\,
	sumout => \PC_Soma_imediato|Add0~65_sumout\,
	cout => \PC_Soma_imediato|Add0~66\);

\mux_PC|saida_MUX[19]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[19]~17_combout\ = ( \PC_Soma_Constante|Add0~69_sumout\ & ( \PC_Soma_imediato|Add0~65_sumout\ & ( (!\UC|Equal3~0_combout\) # (\ROM|memROM~2_combout\) ) ) ) # ( !\PC_Soma_Constante|Add0~69_sumout\ & ( \PC_Soma_imediato|Add0~65_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~2_combout\)) ) ) ) # ( \PC_Soma_Constante|Add0~69_sumout\ & ( !\PC_Soma_imediato|Add0~65_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~2_combout\)) ) ) ) # ( !\PC_Soma_Constante|Add0~69_sumout\ & ( !\PC_Soma_imediato|Add0~65_sumout\ & ( 
-- (\ROM|memROM~2_combout\ & \UC|Equal3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101010011010100000101110001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~69_sumout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~65_sumout\,
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

\PC_Soma_imediato|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~69_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~73_sumout\ ) + ( \PC_Soma_imediato|Add0~66\ ))
-- \PC_Soma_imediato|Add0~70\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~73_sumout\ ) + ( \PC_Soma_imediato|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~73_sumout\,
	cin => \PC_Soma_imediato|Add0~66\,
	sumout => \PC_Soma_imediato|Add0~69_sumout\,
	cout => \PC_Soma_imediato|Add0~70\);

\mux_PC|saida_MUX[20]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[20]~18_combout\ = ( \PC_Soma_imediato|Add0~69_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~73_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~69_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~73_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~73_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~69_sumout\,
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

\PC_Soma_imediato|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~73_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~77_sumout\ ) + ( \PC_Soma_imediato|Add0~70\ ))
-- \PC_Soma_imediato|Add0~74\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~77_sumout\ ) + ( \PC_Soma_imediato|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~77_sumout\,
	cin => \PC_Soma_imediato|Add0~70\,
	sumout => \PC_Soma_imediato|Add0~73_sumout\,
	cout => \PC_Soma_imediato|Add0~74\);

\mux_PC|saida_MUX[21]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[21]~19_combout\ = ( \PC_Soma_Constante|Add0~77_sumout\ & ( \PC_Soma_imediato|Add0~73_sumout\ & ( (!\UC|Equal3~0_combout\) # (\ROM|memROM~15_combout\) ) ) ) # ( !\PC_Soma_Constante|Add0~77_sumout\ & ( \PC_Soma_imediato|Add0~73_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~15_combout\)) ) ) ) # ( \PC_Soma_Constante|Add0~77_sumout\ & ( !\PC_Soma_imediato|Add0~73_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~15_combout\)) ) ) ) # ( !\PC_Soma_Constante|Add0~77_sumout\ & ( !\PC_Soma_imediato|Add0~73_sumout\ & ( 
-- (\ROM|memROM~15_combout\ & \UC|Equal3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101010011010100000101110001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~15_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~77_sumout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~73_sumout\,
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

\PC_Soma_imediato|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~77_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~81_sumout\ ) + ( \PC_Soma_imediato|Add0~74\ ))
-- \PC_Soma_imediato|Add0~78\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~81_sumout\ ) + ( \PC_Soma_imediato|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~81_sumout\,
	cin => \PC_Soma_imediato|Add0~74\,
	sumout => \PC_Soma_imediato|Add0~77_sumout\,
	cout => \PC_Soma_imediato|Add0~78\);

\mux_PC|saida_MUX[22]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[22]~20_combout\ = ( \PC_Soma_imediato|Add0~77_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~81_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~77_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~81_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~81_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~77_sumout\,
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

\PC_Soma_imediato|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~81_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~85_sumout\ ) + ( \PC_Soma_imediato|Add0~78\ ))
-- \PC_Soma_imediato|Add0~82\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~85_sumout\ ) + ( \PC_Soma_imediato|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~85_sumout\,
	cin => \PC_Soma_imediato|Add0~78\,
	sumout => \PC_Soma_imediato|Add0~81_sumout\,
	cout => \PC_Soma_imediato|Add0~82\);

\mux_PC|saida_MUX[23]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[23]~21_combout\ = ( \PC_Soma_Constante|Add0~85_sumout\ & ( \PC_Soma_imediato|Add0~81_sumout\ & ( (!\UC|Equal3~0_combout\) # (\ROM|memROM~0_combout\) ) ) ) # ( !\PC_Soma_Constante|Add0~85_sumout\ & ( \PC_Soma_imediato|Add0~81_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~0_combout\)) ) ) ) # ( \PC_Soma_Constante|Add0~85_sumout\ & ( !\PC_Soma_imediato|Add0~81_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~0_combout\)) ) ) ) # ( !\PC_Soma_Constante|Add0~85_sumout\ & ( !\PC_Soma_imediato|Add0~81_sumout\ & ( 
-- (\ROM|memROM~0_combout\ & \UC|Equal3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101010011010100000101110001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~85_sumout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~81_sumout\,
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

\PC_Soma_imediato|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~85_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~89_sumout\ ) + ( \PC_Soma_imediato|Add0~82\ ))
-- \PC_Soma_imediato|Add0~86\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~89_sumout\ ) + ( \PC_Soma_imediato|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~89_sumout\,
	cin => \PC_Soma_imediato|Add0~82\,
	sumout => \PC_Soma_imediato|Add0~85_sumout\,
	cout => \PC_Soma_imediato|Add0~86\);

\mux_PC|saida_MUX[24]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[24]~22_combout\ = ( \PC_Soma_imediato|Add0~85_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~89_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~85_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~89_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~89_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~85_sumout\,
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

\PC_Soma_imediato|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~89_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~93_sumout\ ) + ( \PC_Soma_imediato|Add0~86\ ))
-- \PC_Soma_imediato|Add0~90\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~93_sumout\ ) + ( \PC_Soma_imediato|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~93_sumout\,
	cin => \PC_Soma_imediato|Add0~86\,
	sumout => \PC_Soma_imediato|Add0~89_sumout\,
	cout => \PC_Soma_imediato|Add0~90\);

\mux_PC|saida_MUX[25]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[25]~23_combout\ = ( \PC_Soma_imediato|Add0~89_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~93_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~89_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~93_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~93_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~89_sumout\,
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

\PC_Soma_imediato|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~93_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~97_sumout\ ) + ( \PC_Soma_imediato|Add0~90\ ))
-- \PC_Soma_imediato|Add0~94\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~97_sumout\ ) + ( \PC_Soma_imediato|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~97_sumout\,
	cin => \PC_Soma_imediato|Add0~90\,
	sumout => \PC_Soma_imediato|Add0~93_sumout\,
	cout => \PC_Soma_imediato|Add0~94\);

\mux_PC|saida_MUX[26]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[26]~24_combout\ = ( \PC_Soma_Constante|Add0~97_sumout\ & ( \PC_Soma_imediato|Add0~93_sumout\ & ( (!\UC|Equal3~0_combout\) # (\ROM|memROM~2_combout\) ) ) ) # ( !\PC_Soma_Constante|Add0~97_sumout\ & ( \PC_Soma_imediato|Add0~93_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~2_combout\)) ) ) ) # ( \PC_Soma_Constante|Add0~97_sumout\ & ( !\PC_Soma_imediato|Add0~93_sumout\ & ( 
-- (!\UC|Equal3~0_combout\ & (((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) # (\UC|Equal3~0_combout\ & (\ROM|memROM~2_combout\)) ) ) ) # ( !\PC_Soma_Constante|Add0~97_sumout\ & ( !\PC_Soma_imediato|Add0~93_sumout\ & ( 
-- (\ROM|memROM~2_combout\ & \UC|Equal3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101010011010100000101110001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~2_combout\,
	datab => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datac => \UC|ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_monitora_flag_z~9_combout\,
	datae => \PC_Soma_Constante|ALT_INV_Add0~97_sumout\,
	dataf => \PC_Soma_imediato|ALT_INV_Add0~93_sumout\,
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

\PC_Soma_imediato|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~97_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~101_sumout\ ) + ( \PC_Soma_imediato|Add0~94\ ))
-- \PC_Soma_imediato|Add0~98\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~101_sumout\ ) + ( \PC_Soma_imediato|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~101_sumout\,
	cin => \PC_Soma_imediato|Add0~94\,
	sumout => \PC_Soma_imediato|Add0~97_sumout\,
	cout => \PC_Soma_imediato|Add0~98\);

\mux_PC|saida_MUX[27]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[27]~25_combout\ = ( \PC_Soma_imediato|Add0~97_sumout\ & ( (!\UC|Equal3~0_combout\ & (((!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)) # (\PC_Soma_Constante|Add0~101_sumout\))) ) ) # ( 
-- !\PC_Soma_imediato|Add0~97_sumout\ & ( (!\UC|Equal3~0_combout\ & (\PC_Soma_Constante|Add0~101_sumout\ & ((!\monitora_flag_z~9_combout\) # (\ULA|ula30|mux_ula|saida_MUX~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000010001100110000000000110001000000100011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \UC|ALT_INV_Equal3~0_combout\,
	datac => \ALT_INV_monitora_flag_z~9_combout\,
	datad => \PC_Soma_Constante|ALT_INV_Add0~101_sumout\,
	datae => \PC_Soma_imediato|ALT_INV_Add0~97_sumout\,
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

\PC_Soma_imediato|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~101_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~105_sumout\ ) + ( \PC_Soma_imediato|Add0~98\ ))
-- \PC_Soma_imediato|Add0~102\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~105_sumout\ ) + ( \PC_Soma_imediato|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~105_sumout\,
	cin => \PC_Soma_imediato|Add0~98\,
	sumout => \PC_Soma_imediato|Add0~101_sumout\,
	cout => \PC_Soma_imediato|Add0~102\);

\mux_PC|saida_MUX[28]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[28]~26_combout\ = (!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & ((!\monitora_flag_z~9_combout\ & (\PC_Soma_Constante|Add0~105_sumout\)) # (\monitora_flag_z~9_combout\ & ((\PC_Soma_imediato|Add0~101_sumout\))))) # 
-- (\ULA|ula30|mux_ula|saida_MUX~1_combout\ & (((\PC_Soma_Constante|Add0~105_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110100101111000011010010111100001101001011110000110100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ALT_INV_monitora_flag_z~9_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~105_sumout\,
	datad => \PC_Soma_imediato|ALT_INV_Add0~101_sumout\,
	combout => \mux_PC|saida_MUX[28]~26_combout\);

\PC_entity|DOUT[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[28]~26_combout\,
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

\PC_Soma_imediato|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~105_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~109_sumout\ ) + ( \PC_Soma_imediato|Add0~102\ ))
-- \PC_Soma_imediato|Add0~106\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~109_sumout\ ) + ( \PC_Soma_imediato|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~109_sumout\,
	cin => \PC_Soma_imediato|Add0~102\,
	sumout => \PC_Soma_imediato|Add0~105_sumout\,
	cout => \PC_Soma_imediato|Add0~106\);

\mux_PC|saida_MUX[29]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[29]~27_combout\ = (!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & ((!\monitora_flag_z~9_combout\ & (\PC_Soma_Constante|Add0~109_sumout\)) # (\monitora_flag_z~9_combout\ & ((\PC_Soma_imediato|Add0~105_sumout\))))) # 
-- (\ULA|ula30|mux_ula|saida_MUX~1_combout\ & (((\PC_Soma_Constante|Add0~109_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110100101111000011010010111100001101001011110000110100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ALT_INV_monitora_flag_z~9_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~109_sumout\,
	datad => \PC_Soma_imediato|ALT_INV_Add0~105_sumout\,
	combout => \mux_PC|saida_MUX[29]~27_combout\);

\PC_entity|DOUT[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[29]~27_combout\,
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

\PC_Soma_imediato|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~109_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~113_sumout\ ) + ( \PC_Soma_imediato|Add0~106\ ))
-- \PC_Soma_imediato|Add0~110\ = CARRY(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~113_sumout\ ) + ( \PC_Soma_imediato|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~113_sumout\,
	cin => \PC_Soma_imediato|Add0~106\,
	sumout => \PC_Soma_imediato|Add0~109_sumout\,
	cout => \PC_Soma_imediato|Add0~110\);

\mux_PC|saida_MUX[30]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[30]~28_combout\ = (!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & ((!\monitora_flag_z~9_combout\ & (\PC_Soma_Constante|Add0~113_sumout\)) # (\monitora_flag_z~9_combout\ & ((\PC_Soma_imediato|Add0~109_sumout\))))) # 
-- (\ULA|ula30|mux_ula|saida_MUX~1_combout\ & (((\PC_Soma_Constante|Add0~113_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110100101111000011010010111100001101001011110000110100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ALT_INV_monitora_flag_z~9_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~113_sumout\,
	datad => \PC_Soma_imediato|ALT_INV_Add0~109_sumout\,
	combout => \mux_PC|saida_MUX[30]~28_combout\);

\PC_entity|DOUT[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[30]~28_combout\,
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

\PC_Soma_imediato|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_imediato|Add0~113_sumout\ = SUM(( \ROM|memROM~9_combout\ ) + ( \PC_Soma_Constante|Add0~117_sumout\ ) + ( \PC_Soma_imediato|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM|ALT_INV_memROM~9_combout\,
	dataf => \PC_Soma_Constante|ALT_INV_Add0~117_sumout\,
	cin => \PC_Soma_imediato|Add0~110\,
	sumout => \PC_Soma_imediato|Add0~113_sumout\);

\mux_PC|saida_MUX[31]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_PC|saida_MUX[31]~29_combout\ = (!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & ((!\monitora_flag_z~9_combout\ & (\PC_Soma_Constante|Add0~117_sumout\)) # (\monitora_flag_z~9_combout\ & ((\PC_Soma_imediato|Add0~113_sumout\))))) # 
-- (\ULA|ula30|mux_ula|saida_MUX~1_combout\ & (((\PC_Soma_Constante|Add0~117_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110100101111000011010010111100001101001011110000110100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ALT_INV_monitora_flag_z~9_combout\,
	datac => \PC_Soma_Constante|ALT_INV_Add0~117_sumout\,
	datad => \PC_Soma_imediato|ALT_INV_Add0~113_sumout\,
	combout => \mux_PC|saida_MUX[31]~29_combout\);

\PC_entity|DOUT[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \mux_PC|saida_MUX[31]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(31));

\ULA|ula31|Overflow_exists|overflow~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|Overflow_exists|overflow~0_combout\ = ( \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( ((\bancoRegs|saidaA[31]~31_combout\) # (\mux_rt_imediato|saida_MUX[31]~0_combout\)) # (\UC_ULA|ula_ctrl[2]~1_combout\) 
-- ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( \ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( ((!\mux_rt_imediato|saida_MUX[31]~0_combout\) # (!\bancoRegs|saidaA[31]~31_combout\)) # (\UC_ULA|ula_ctrl[2]~1_combout\) ) ) ) # ( 
-- \ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\mux_rt_imediato|saida_MUX[31]~0_combout\) # (!\bancoRegs|saidaA[31]~31_combout\) ) ) ) # ( !\ULA|ula8|mux_ula|saida_MUX~2_combout\ & ( 
-- !\ULA|ula8|mux_ula|saida_MUX~0_combout\ & ( (!\mux_rt_imediato|saida_MUX[31]~0_combout\ & ((!\UC_ULA|ula_ctrl[2]~1_combout\ $ (\ULA|ula30|soma_sub|carry_out~combout\)) # (\bancoRegs|saidaA[31]~31_combout\))) # (\mux_rt_imediato|saida_MUX[31]~0_combout\ & 
-- ((!\bancoRegs|saidaA[31]~31_combout\) # (!\UC_ULA|ula_ctrl[2]~1_combout\ $ (!\ULA|ula30|soma_sub|carry_out~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001111111110110111111111111000011111111111101010101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC_ULA|ALT_INV_ula_ctrl[2]~1_combout\,
	datab => \ULA|ula30|soma_sub|ALT_INV_carry_out~combout\,
	datac => \mux_rt_imediato|ALT_INV_saida_MUX[31]~0_combout\,
	datad => \bancoRegs|ALT_INV_saidaA[31]~31_combout\,
	datae => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~2_combout\,
	dataf => \ULA|ula8|mux_ula|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|Overflow_exists|overflow~0_combout\);

\monitora_flag_z~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \monitora_flag_z~10_combout\ = (!\ULA|ula30|mux_ula|saida_MUX~1_combout\ & \monitora_flag_z~9_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula30|mux_ula|ALT_INV_saida_MUX~1_combout\,
	datab => \ALT_INV_monitora_flag_z~9_combout\,
	combout => \monitora_flag_z~10_combout\);

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


