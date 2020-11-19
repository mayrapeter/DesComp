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

-- DATE "11/12/2020 15:24:01"

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
	PC_saida : OUT std_logic_vector(31 DOWNTO 0)
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
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~1_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~10\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~13_sumout\ : std_logic;
SIGNAL \ROM|memROM~10_combout\ : std_logic;
SIGNAL \ROM|memROM~18_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~14\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~17_sumout\ : std_logic;
SIGNAL \ROM|memROM~5_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~18\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~21_sumout\ : std_logic;
SIGNAL \ROM|memROM~12_combout\ : std_logic;
SIGNAL \ROM|memROM~19_combout\ : std_logic;
SIGNAL \ROM|memROM~1_combout\ : std_logic;
SIGNAL \ROM|memROM~2_combout\ : std_logic;
SIGNAL \ROM|memROM~7_combout\ : std_logic;
SIGNAL \ROM|memROM~8_combout\ : std_logic;
SIGNAL \UC|Equal7~0_combout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~2\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~5_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~6\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~9_sumout\ : std_logic;
SIGNAL \ROM|memROM~9_combout\ : std_logic;
SIGNAL \ROM|memROM~17_combout\ : std_logic;
SIGNAL \ROM|memROM~0_combout\ : std_logic;
SIGNAL \UC|Equal7~1_combout\ : std_logic;
SIGNAL \UC|sel_mux3~1_combout\ : std_logic;
SIGNAL \UC|sel_mux4~0_combout\ : std_logic;
SIGNAL \ROM|memROM~6_combout\ : std_logic;
SIGNAL \ROM|memROM~13_combout\ : std_logic;
SIGNAL \ROM|memROM~14_combout\ : std_logic;
SIGNAL \mux_rt_rd|saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \ROM|memROM~16_combout\ : std_logic;
SIGNAL \mux_rt_rd|saida_MUX[4]~1_combout\ : std_logic;
SIGNAL \ROM|memROM~4_combout\ : std_logic;
SIGNAL \ROM|memROM~15_combout\ : std_logic;
SIGNAL \mux_rt_rd|saida_MUX[3]~2_combout\ : std_logic;
SIGNAL \ROM|memROM~3_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1350_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1351_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~76_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1356_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~588_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1352_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1353_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~140_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1357_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~652_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1120_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1360_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1364_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~556_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1361_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~108_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1365_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~620_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1121_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1358_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~844_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1355_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~396_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1359_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~908_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1122_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1362_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~300_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1366_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~812_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1363_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~364_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1367_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~876_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1123_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1124_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~77_q\ : std_logic;
SIGNAL \bancoRegs|registrador~45_q\ : std_logic;
SIGNAL \bancoRegs|registrador~301_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1129_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~589_q\ : std_logic;
SIGNAL \bancoRegs|registrador~557_q\ : std_logic;
SIGNAL \bancoRegs|registrador~845_q\ : std_logic;
SIGNAL \bancoRegs|registrador~813_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1130_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~141_q\ : std_logic;
SIGNAL \bancoRegs|registrador~109_q\ : std_logic;
SIGNAL \bancoRegs|registrador~397_q\ : std_logic;
SIGNAL \bancoRegs|registrador~365_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1131_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~653_q\ : std_logic;
SIGNAL \bancoRegs|registrador~621_q\ : std_logic;
SIGNAL \bancoRegs|registrador~909_q\ : std_logic;
SIGNAL \bancoRegs|registrador~877_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1132_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1133_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~1354_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~333_q\ : std_logic;
SIGNAL \ROM|memROM~21_combout\ : std_logic;
SIGNAL \ROM|memROM~20_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1396_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1125_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~331_q\ : std_logic;
SIGNAL \bancoRegs|registrador~395_q\ : std_logic;
SIGNAL \bancoRegs|registrador~363_q\ : std_logic;
SIGNAL \bancoRegs|registrador~139_q\ : std_logic;
SIGNAL \bancoRegs|registrador~107_q\ : std_logic;
SIGNAL \bancoRegs|registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1388_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1112_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~330_q\ : std_logic;
SIGNAL \bancoRegs|registrador~394_q\ : std_logic;
SIGNAL \bancoRegs|registrador~362_q\ : std_logic;
SIGNAL \bancoRegs|registrador~138_q\ : std_logic;
SIGNAL \bancoRegs|registrador~106_q\ : std_logic;
SIGNAL \bancoRegs|registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1384_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1103_combout\ : std_logic;
SIGNAL \ROM|memROM~11_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~329_q\ : std_logic;
SIGNAL \bancoRegs|registrador~393_q\ : std_logic;
SIGNAL \bancoRegs|registrador~361_q\ : std_logic;
SIGNAL \bancoRegs|registrador~137_q\ : std_logic;
SIGNAL \bancoRegs|registrador~105_q\ : std_logic;
SIGNAL \bancoRegs|registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1380_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1094_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~328_q\ : std_logic;
SIGNAL \bancoRegs|registrador~392_q\ : std_logic;
SIGNAL \bancoRegs|registrador~360_q\ : std_logic;
SIGNAL \bancoRegs|registrador~136_q\ : std_logic;
SIGNAL \bancoRegs|registrador~104_q\ : std_logic;
SIGNAL \bancoRegs|registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1376_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1085_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~327_q\ : std_logic;
SIGNAL \bancoRegs|registrador~391_q\ : std_logic;
SIGNAL \bancoRegs|registrador~359_q\ : std_logic;
SIGNAL \bancoRegs|registrador~135_q\ : std_logic;
SIGNAL \bancoRegs|registrador~103_q\ : std_logic;
SIGNAL \bancoRegs|registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1372_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~295_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1076_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~326_q\ : std_logic;
SIGNAL \bancoRegs|registrador~390_q\ : std_logic;
SIGNAL \bancoRegs|registrador~358_q\ : std_logic;
SIGNAL \bancoRegs|registrador~134_q\ : std_logic;
SIGNAL \bancoRegs|registrador~102_q\ : std_logic;
SIGNAL \bancoRegs|registrador~38_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1368_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~294_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1067_combout\ : std_logic;
SIGNAL \ULA|Add0~2\ : std_logic;
SIGNAL \ULA|Add0~5_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~71_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1071_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~583_q\ : std_logic;
SIGNAL \bancoRegs|registrador~551_q\ : std_logic;
SIGNAL \bancoRegs|registrador~839_q\ : std_logic;
SIGNAL \bancoRegs|registrador~807_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1072_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1073_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~647_q\ : std_logic;
SIGNAL \bancoRegs|registrador~615_q\ : std_logic;
SIGNAL \bancoRegs|registrador~903_q\ : std_logic;
SIGNAL \bancoRegs|registrador~871_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1074_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1075_combout\ : std_logic;
SIGNAL \ULA|Add0~6\ : std_logic;
SIGNAL \ULA|Add0~10\ : std_logic;
SIGNAL \ULA|Add0~14\ : std_logic;
SIGNAL \ULA|Add0~18\ : std_logic;
SIGNAL \ULA|Add0~22\ : std_logic;
SIGNAL \ULA|Add0~26\ : std_logic;
SIGNAL \ULA|Add0~29_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~332_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1392_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1116_combout\ : std_logic;
SIGNAL \ULA|Add0~25_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~75_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1107_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~587_q\ : std_logic;
SIGNAL \bancoRegs|registrador~555_q\ : std_logic;
SIGNAL \bancoRegs|registrador~843_q\ : std_logic;
SIGNAL \bancoRegs|registrador~811_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1108_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1109_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~651_q\ : std_logic;
SIGNAL \bancoRegs|registrador~619_q\ : std_logic;
SIGNAL \bancoRegs|registrador~907_q\ : std_logic;
SIGNAL \bancoRegs|registrador~875_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1110_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1111_combout\ : std_logic;
SIGNAL \ULA|Add0~21_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~74_q\ : std_logic;
SIGNAL \bancoRegs|registrador~586_q\ : std_logic;
SIGNAL \bancoRegs|registrador~650_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1098_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~554_q\ : std_logic;
SIGNAL \bancoRegs|registrador~618_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1099_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~842_q\ : std_logic;
SIGNAL \bancoRegs|registrador~906_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1100_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~810_q\ : std_logic;
SIGNAL \bancoRegs|registrador~874_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1101_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1102_combout\ : std_logic;
SIGNAL \ULA|Add0~17_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~73_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1089_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~585_q\ : std_logic;
SIGNAL \bancoRegs|registrador~553_q\ : std_logic;
SIGNAL \bancoRegs|registrador~841_q\ : std_logic;
SIGNAL \bancoRegs|registrador~809_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1090_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1091_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~649_q\ : std_logic;
SIGNAL \bancoRegs|registrador~617_q\ : std_logic;
SIGNAL \bancoRegs|registrador~905_q\ : std_logic;
SIGNAL \bancoRegs|registrador~873_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1092_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1093_combout\ : std_logic;
SIGNAL \ULA|Add0~13_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~72_q\ : std_logic;
SIGNAL \bancoRegs|registrador~584_q\ : std_logic;
SIGNAL \bancoRegs|registrador~648_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1080_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~552_q\ : std_logic;
SIGNAL \bancoRegs|registrador~616_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1081_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~840_q\ : std_logic;
SIGNAL \bancoRegs|registrador~904_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1082_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~808_q\ : std_logic;
SIGNAL \bancoRegs|registrador~872_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1083_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1084_combout\ : std_logic;
SIGNAL \ULA|Add0~9_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~70_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1062_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~582_q\ : std_logic;
SIGNAL \bancoRegs|registrador~646_q\ : std_logic;
SIGNAL \bancoRegs|registrador~838_q\ : std_logic;
SIGNAL \bancoRegs|registrador~902_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1063_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1064_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~550_q\ : std_logic;
SIGNAL \bancoRegs|registrador~614_q\ : std_logic;
SIGNAL \bancoRegs|registrador~806_q\ : std_logic;
SIGNAL \bancoRegs|registrador~870_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1065_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1066_combout\ : std_logic;
SIGNAL \ULA|Add0~1_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~78_q\ : std_logic;
SIGNAL \bancoRegs|registrador~590_q\ : std_logic;
SIGNAL \bancoRegs|registrador~142_q\ : std_logic;
SIGNAL \bancoRegs|registrador~654_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1138_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|registrador~558_q\ : std_logic;
SIGNAL \bancoRegs|registrador~110_q\ : std_logic;
SIGNAL \bancoRegs|registrador~622_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1139_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~846_q\ : std_logic;
SIGNAL \bancoRegs|registrador~398_q\ : std_logic;
SIGNAL \bancoRegs|registrador~910_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1140_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|registrador~814_q\ : std_logic;
SIGNAL \bancoRegs|registrador~366_q\ : std_logic;
SIGNAL \bancoRegs|registrador~878_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1141_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1142_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~334_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1400_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1134_combout\ : std_logic;
SIGNAL \ULA|Add0~30\ : std_logic;
SIGNAL \ULA|Add0~33_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~79_q\ : std_logic;
SIGNAL \bancoRegs|registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1147_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~591_q\ : std_logic;
SIGNAL \bancoRegs|registrador~559_q\ : std_logic;
SIGNAL \bancoRegs|registrador~847_q\ : std_logic;
SIGNAL \bancoRegs|registrador~815_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1148_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~143_q\ : std_logic;
SIGNAL \bancoRegs|registrador~111_q\ : std_logic;
SIGNAL \bancoRegs|registrador~399_q\ : std_logic;
SIGNAL \bancoRegs|registrador~367_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1149_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~655_q\ : std_logic;
SIGNAL \bancoRegs|registrador~623_q\ : std_logic;
SIGNAL \bancoRegs|registrador~911_q\ : std_logic;
SIGNAL \bancoRegs|registrador~879_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1150_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1151_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~335_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1404_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1143_combout\ : std_logic;
SIGNAL \ULA|Add0~34\ : std_logic;
SIGNAL \ULA|Add0~37_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~80_q\ : std_logic;
SIGNAL \bancoRegs|registrador~592_q\ : std_logic;
SIGNAL \bancoRegs|registrador~144_q\ : std_logic;
SIGNAL \bancoRegs|registrador~656_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1152_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|registrador~560_q\ : std_logic;
SIGNAL \bancoRegs|registrador~112_q\ : std_logic;
SIGNAL \bancoRegs|registrador~624_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1153_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~336_q\ : std_logic;
SIGNAL \bancoRegs|registrador~848_q\ : std_logic;
SIGNAL \bancoRegs|registrador~400_q\ : std_logic;
SIGNAL \bancoRegs|registrador~912_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1154_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|registrador~816_q\ : std_logic;
SIGNAL \bancoRegs|registrador~368_q\ : std_logic;
SIGNAL \bancoRegs|registrador~880_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1155_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1156_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1408_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1157_combout\ : std_logic;
SIGNAL \UC|sel_mux3~0_combout\ : std_logic;
SIGNAL \ULA|Add0~38\ : std_logic;
SIGNAL \ULA|Add0~41_sumout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~81_q\ : std_logic;
SIGNAL \bancoRegs|registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|registrador~337_q\ : std_logic;
SIGNAL \bancoRegs|registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1161_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~593_q\ : std_logic;
SIGNAL \bancoRegs|registrador~561_q\ : std_logic;
SIGNAL \bancoRegs|registrador~849_q\ : std_logic;
SIGNAL \bancoRegs|registrador~817_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1162_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~145_q\ : std_logic;
SIGNAL \bancoRegs|registrador~113_q\ : std_logic;
SIGNAL \bancoRegs|registrador~401_q\ : std_logic;
SIGNAL \bancoRegs|registrador~369_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1163_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~657_q\ : std_logic;
SIGNAL \bancoRegs|registrador~625_q\ : std_logic;
SIGNAL \bancoRegs|registrador~913_q\ : std_logic;
SIGNAL \bancoRegs|registrador~881_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1164_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1165_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1412_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1166_combout\ : std_logic;
SIGNAL \ULA|Add0~42\ : std_logic;
SIGNAL \ULA|Add0~45_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~82_q\ : std_logic;
SIGNAL \bancoRegs|registrador~594_q\ : std_logic;
SIGNAL \bancoRegs|registrador~146_q\ : std_logic;
SIGNAL \bancoRegs|registrador~658_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1174_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|registrador~562_q\ : std_logic;
SIGNAL \bancoRegs|registrador~114_q\ : std_logic;
SIGNAL \bancoRegs|registrador~626_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1175_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~850_q\ : std_logic;
SIGNAL \bancoRegs|registrador~402_q\ : std_logic;
SIGNAL \bancoRegs|registrador~914_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1176_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|registrador~818_q\ : std_logic;
SIGNAL \bancoRegs|registrador~370_q\ : std_logic;
SIGNAL \bancoRegs|registrador~882_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1177_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1178_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~338_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1416_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1170_combout\ : std_logic;
SIGNAL \ULA|Add0~46\ : std_logic;
SIGNAL \ULA|Add0~49_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~83_q\ : std_logic;
SIGNAL \bancoRegs|registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1183_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~595_q\ : std_logic;
SIGNAL \bancoRegs|registrador~563_q\ : std_logic;
SIGNAL \bancoRegs|registrador~851_q\ : std_logic;
SIGNAL \bancoRegs|registrador~819_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1184_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~147_q\ : std_logic;
SIGNAL \bancoRegs|registrador~115_q\ : std_logic;
SIGNAL \bancoRegs|registrador~403_q\ : std_logic;
SIGNAL \bancoRegs|registrador~371_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1185_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~659_q\ : std_logic;
SIGNAL \bancoRegs|registrador~627_q\ : std_logic;
SIGNAL \bancoRegs|registrador~915_q\ : std_logic;
SIGNAL \bancoRegs|registrador~883_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1186_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1187_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~339_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1420_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1179_combout\ : std_logic;
SIGNAL \ULA|Add0~50\ : std_logic;
SIGNAL \ULA|Add0~53_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~84_q\ : std_logic;
SIGNAL \bancoRegs|registrador~596_q\ : std_logic;
SIGNAL \bancoRegs|registrador~148_q\ : std_logic;
SIGNAL \bancoRegs|registrador~660_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1192_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|registrador~564_q\ : std_logic;
SIGNAL \bancoRegs|registrador~116_q\ : std_logic;
SIGNAL \bancoRegs|registrador~628_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1193_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~852_q\ : std_logic;
SIGNAL \bancoRegs|registrador~404_q\ : std_logic;
SIGNAL \bancoRegs|registrador~916_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1194_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|registrador~820_q\ : std_logic;
SIGNAL \bancoRegs|registrador~372_q\ : std_logic;
SIGNAL \bancoRegs|registrador~884_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1195_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1196_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~340_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1424_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1188_combout\ : std_logic;
SIGNAL \ULA|Add0~54\ : std_logic;
SIGNAL \ULA|Add0~57_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~85_q\ : std_logic;
SIGNAL \bancoRegs|registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1201_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~597_q\ : std_logic;
SIGNAL \bancoRegs|registrador~565_q\ : std_logic;
SIGNAL \bancoRegs|registrador~853_q\ : std_logic;
SIGNAL \bancoRegs|registrador~821_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1202_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~149_q\ : std_logic;
SIGNAL \bancoRegs|registrador~117_q\ : std_logic;
SIGNAL \bancoRegs|registrador~405_q\ : std_logic;
SIGNAL \bancoRegs|registrador~373_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1203_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~661_q\ : std_logic;
SIGNAL \bancoRegs|registrador~629_q\ : std_logic;
SIGNAL \bancoRegs|registrador~917_q\ : std_logic;
SIGNAL \bancoRegs|registrador~885_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1204_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1205_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~341_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1428_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1197_combout\ : std_logic;
SIGNAL \ULA|Add0~58\ : std_logic;
SIGNAL \ULA|Add0~61_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~86_q\ : std_logic;
SIGNAL \bancoRegs|registrador~598_q\ : std_logic;
SIGNAL \bancoRegs|registrador~150_q\ : std_logic;
SIGNAL \bancoRegs|registrador~662_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1210_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|registrador~566_q\ : std_logic;
SIGNAL \bancoRegs|registrador~118_q\ : std_logic;
SIGNAL \bancoRegs|registrador~630_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1211_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~854_q\ : std_logic;
SIGNAL \bancoRegs|registrador~406_q\ : std_logic;
SIGNAL \bancoRegs|registrador~918_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1212_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|registrador~822_q\ : std_logic;
SIGNAL \bancoRegs|registrador~374_q\ : std_logic;
SIGNAL \bancoRegs|registrador~886_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1213_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1214_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~342_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1432_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1206_combout\ : std_logic;
SIGNAL \ULA|Add0~62\ : std_logic;
SIGNAL \ULA|Add0~65_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~87_q\ : std_logic;
SIGNAL \bancoRegs|registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1219_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~599_q\ : std_logic;
SIGNAL \bancoRegs|registrador~567_q\ : std_logic;
SIGNAL \bancoRegs|registrador~855_q\ : std_logic;
SIGNAL \bancoRegs|registrador~823_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1220_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~151_q\ : std_logic;
SIGNAL \bancoRegs|registrador~119_q\ : std_logic;
SIGNAL \bancoRegs|registrador~407_q\ : std_logic;
SIGNAL \bancoRegs|registrador~375_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1221_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~663_q\ : std_logic;
SIGNAL \bancoRegs|registrador~631_q\ : std_logic;
SIGNAL \bancoRegs|registrador~919_q\ : std_logic;
SIGNAL \bancoRegs|registrador~887_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1222_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1223_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~343_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1436_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1215_combout\ : std_logic;
SIGNAL \ULA|Add0~66\ : std_logic;
SIGNAL \ULA|Add0~69_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~88_q\ : std_logic;
SIGNAL \bancoRegs|registrador~600_q\ : std_logic;
SIGNAL \bancoRegs|registrador~152_q\ : std_logic;
SIGNAL \bancoRegs|registrador~664_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1228_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|registrador~568_q\ : std_logic;
SIGNAL \bancoRegs|registrador~120_q\ : std_logic;
SIGNAL \bancoRegs|registrador~632_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1229_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~856_q\ : std_logic;
SIGNAL \bancoRegs|registrador~408_q\ : std_logic;
SIGNAL \bancoRegs|registrador~920_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1230_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|registrador~824_q\ : std_logic;
SIGNAL \bancoRegs|registrador~376_q\ : std_logic;
SIGNAL \bancoRegs|registrador~888_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1231_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1232_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~344_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1440_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1224_combout\ : std_logic;
SIGNAL \ULA|Add0~70\ : std_logic;
SIGNAL \ULA|Add0~73_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~89_q\ : std_logic;
SIGNAL \bancoRegs|registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1237_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~601_q\ : std_logic;
SIGNAL \bancoRegs|registrador~569_q\ : std_logic;
SIGNAL \bancoRegs|registrador~857_q\ : std_logic;
SIGNAL \bancoRegs|registrador~825_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1238_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~153_q\ : std_logic;
SIGNAL \bancoRegs|registrador~121_q\ : std_logic;
SIGNAL \bancoRegs|registrador~409_q\ : std_logic;
SIGNAL \bancoRegs|registrador~377_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1239_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~665_q\ : std_logic;
SIGNAL \bancoRegs|registrador~633_q\ : std_logic;
SIGNAL \bancoRegs|registrador~921_q\ : std_logic;
SIGNAL \bancoRegs|registrador~889_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1240_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1241_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~345_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1444_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1233_combout\ : std_logic;
SIGNAL \ULA|Add0~74\ : std_logic;
SIGNAL \ULA|Add0~77_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~90_q\ : std_logic;
SIGNAL \bancoRegs|registrador~602_q\ : std_logic;
SIGNAL \bancoRegs|registrador~154_q\ : std_logic;
SIGNAL \bancoRegs|registrador~666_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1246_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|registrador~570_q\ : std_logic;
SIGNAL \bancoRegs|registrador~122_q\ : std_logic;
SIGNAL \bancoRegs|registrador~634_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1247_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~858_q\ : std_logic;
SIGNAL \bancoRegs|registrador~410_q\ : std_logic;
SIGNAL \bancoRegs|registrador~922_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1248_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|registrador~826_q\ : std_logic;
SIGNAL \bancoRegs|registrador~378_q\ : std_logic;
SIGNAL \bancoRegs|registrador~890_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1249_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1250_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~346_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1448_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1242_combout\ : std_logic;
SIGNAL \ULA|Add0~78\ : std_logic;
SIGNAL \ULA|Add0~81_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~91_q\ : std_logic;
SIGNAL \bancoRegs|registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1255_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~603_q\ : std_logic;
SIGNAL \bancoRegs|registrador~571_q\ : std_logic;
SIGNAL \bancoRegs|registrador~859_q\ : std_logic;
SIGNAL \bancoRegs|registrador~827_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1256_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~155_q\ : std_logic;
SIGNAL \bancoRegs|registrador~123_q\ : std_logic;
SIGNAL \bancoRegs|registrador~411_q\ : std_logic;
SIGNAL \bancoRegs|registrador~379_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1257_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~667_q\ : std_logic;
SIGNAL \bancoRegs|registrador~635_q\ : std_logic;
SIGNAL \bancoRegs|registrador~923_q\ : std_logic;
SIGNAL \bancoRegs|registrador~891_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1258_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1259_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~347_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1452_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1251_combout\ : std_logic;
SIGNAL \ULA|Add0~82\ : std_logic;
SIGNAL \ULA|Add0~85_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~92_q\ : std_logic;
SIGNAL \bancoRegs|registrador~604_q\ : std_logic;
SIGNAL \bancoRegs|registrador~156_q\ : std_logic;
SIGNAL \bancoRegs|registrador~668_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1264_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|registrador~572_q\ : std_logic;
SIGNAL \bancoRegs|registrador~124_q\ : std_logic;
SIGNAL \bancoRegs|registrador~636_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1265_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~860_q\ : std_logic;
SIGNAL \bancoRegs|registrador~412_q\ : std_logic;
SIGNAL \bancoRegs|registrador~924_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1266_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|registrador~828_q\ : std_logic;
SIGNAL \bancoRegs|registrador~380_q\ : std_logic;
SIGNAL \bancoRegs|registrador~892_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1267_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1268_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~348_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1456_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1260_combout\ : std_logic;
SIGNAL \ULA|Add0~86\ : std_logic;
SIGNAL \ULA|Add0~89_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~93_q\ : std_logic;
SIGNAL \bancoRegs|registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1273_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~605_q\ : std_logic;
SIGNAL \bancoRegs|registrador~573_q\ : std_logic;
SIGNAL \bancoRegs|registrador~861_q\ : std_logic;
SIGNAL \bancoRegs|registrador~829_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1274_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~157_q\ : std_logic;
SIGNAL \bancoRegs|registrador~125_q\ : std_logic;
SIGNAL \bancoRegs|registrador~413_q\ : std_logic;
SIGNAL \bancoRegs|registrador~381_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1275_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~669_q\ : std_logic;
SIGNAL \bancoRegs|registrador~637_q\ : std_logic;
SIGNAL \bancoRegs|registrador~925_q\ : std_logic;
SIGNAL \bancoRegs|registrador~893_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1276_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1277_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~349_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1460_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1269_combout\ : std_logic;
SIGNAL \ULA|Add0~90\ : std_logic;
SIGNAL \ULA|Add0~93_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~94_q\ : std_logic;
SIGNAL \bancoRegs|registrador~606_q\ : std_logic;
SIGNAL \bancoRegs|registrador~158_q\ : std_logic;
SIGNAL \bancoRegs|registrador~670_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1282_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|registrador~574_q\ : std_logic;
SIGNAL \bancoRegs|registrador~126_q\ : std_logic;
SIGNAL \bancoRegs|registrador~638_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1283_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~862_q\ : std_logic;
SIGNAL \bancoRegs|registrador~414_q\ : std_logic;
SIGNAL \bancoRegs|registrador~926_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1284_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|registrador~830_q\ : std_logic;
SIGNAL \bancoRegs|registrador~382_q\ : std_logic;
SIGNAL \bancoRegs|registrador~894_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1285_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1286_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~350_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1464_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1278_combout\ : std_logic;
SIGNAL \ULA|Add0~94\ : std_logic;
SIGNAL \ULA|Add0~97_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~95_q\ : std_logic;
SIGNAL \bancoRegs|registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1291_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~607_q\ : std_logic;
SIGNAL \bancoRegs|registrador~575_q\ : std_logic;
SIGNAL \bancoRegs|registrador~863_q\ : std_logic;
SIGNAL \bancoRegs|registrador~831_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1292_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~159_q\ : std_logic;
SIGNAL \bancoRegs|registrador~127_q\ : std_logic;
SIGNAL \bancoRegs|registrador~415_q\ : std_logic;
SIGNAL \bancoRegs|registrador~383_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1293_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~671_q\ : std_logic;
SIGNAL \bancoRegs|registrador~639_q\ : std_logic;
SIGNAL \bancoRegs|registrador~927_q\ : std_logic;
SIGNAL \bancoRegs|registrador~895_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1294_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1295_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~351_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1468_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1287_combout\ : std_logic;
SIGNAL \ULA|Add0~98\ : std_logic;
SIGNAL \ULA|Add0~101_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~96_q\ : std_logic;
SIGNAL \bancoRegs|registrador~608_q\ : std_logic;
SIGNAL \bancoRegs|registrador~160_q\ : std_logic;
SIGNAL \bancoRegs|registrador~672_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1300_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|registrador~576_q\ : std_logic;
SIGNAL \bancoRegs|registrador~128_q\ : std_logic;
SIGNAL \bancoRegs|registrador~640_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1301_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~864_q\ : std_logic;
SIGNAL \bancoRegs|registrador~416_q\ : std_logic;
SIGNAL \bancoRegs|registrador~928_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1302_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|registrador~832_q\ : std_logic;
SIGNAL \bancoRegs|registrador~384_q\ : std_logic;
SIGNAL \bancoRegs|registrador~896_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1303_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1304_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~352_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1472_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1296_combout\ : std_logic;
SIGNAL \ULA|Add0~102\ : std_logic;
SIGNAL \ULA|Add0~105_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~97_q\ : std_logic;
SIGNAL \bancoRegs|registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1309_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~609_q\ : std_logic;
SIGNAL \bancoRegs|registrador~577_q\ : std_logic;
SIGNAL \bancoRegs|registrador~865_q\ : std_logic;
SIGNAL \bancoRegs|registrador~833_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1310_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~161_q\ : std_logic;
SIGNAL \bancoRegs|registrador~129_q\ : std_logic;
SIGNAL \bancoRegs|registrador~417_q\ : std_logic;
SIGNAL \bancoRegs|registrador~385_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1311_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~673_q\ : std_logic;
SIGNAL \bancoRegs|registrador~641_q\ : std_logic;
SIGNAL \bancoRegs|registrador~929_q\ : std_logic;
SIGNAL \bancoRegs|registrador~897_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1312_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1313_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~353_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1476_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1305_combout\ : std_logic;
SIGNAL \ULA|Add0~106\ : std_logic;
SIGNAL \ULA|Add0~109_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~98_q\ : std_logic;
SIGNAL \bancoRegs|registrador~610_q\ : std_logic;
SIGNAL \bancoRegs|registrador~162_q\ : std_logic;
SIGNAL \bancoRegs|registrador~674_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1318_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|registrador~578_q\ : std_logic;
SIGNAL \bancoRegs|registrador~130_q\ : std_logic;
SIGNAL \bancoRegs|registrador~642_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1319_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~866_q\ : std_logic;
SIGNAL \bancoRegs|registrador~418_q\ : std_logic;
SIGNAL \bancoRegs|registrador~930_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1320_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|registrador~834_q\ : std_logic;
SIGNAL \bancoRegs|registrador~386_q\ : std_logic;
SIGNAL \bancoRegs|registrador~898_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1321_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1322_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~354_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1480_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1314_combout\ : std_logic;
SIGNAL \ULA|Add0~110\ : std_logic;
SIGNAL \ULA|Add0~113_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~99_q\ : std_logic;
SIGNAL \bancoRegs|registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1327_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~611_q\ : std_logic;
SIGNAL \bancoRegs|registrador~579_q\ : std_logic;
SIGNAL \bancoRegs|registrador~867_q\ : std_logic;
SIGNAL \bancoRegs|registrador~835_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1328_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~163_q\ : std_logic;
SIGNAL \bancoRegs|registrador~131_q\ : std_logic;
SIGNAL \bancoRegs|registrador~419_q\ : std_logic;
SIGNAL \bancoRegs|registrador~387_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1329_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~675_q\ : std_logic;
SIGNAL \bancoRegs|registrador~643_q\ : std_logic;
SIGNAL \bancoRegs|registrador~931_q\ : std_logic;
SIGNAL \bancoRegs|registrador~899_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1330_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1331_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~355_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1484_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1323_combout\ : std_logic;
SIGNAL \ULA|Add0~114\ : std_logic;
SIGNAL \ULA|Add0~117_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~100_q\ : std_logic;
SIGNAL \bancoRegs|registrador~612_q\ : std_logic;
SIGNAL \bancoRegs|registrador~164_q\ : std_logic;
SIGNAL \bancoRegs|registrador~676_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1336_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|registrador~580_q\ : std_logic;
SIGNAL \bancoRegs|registrador~132_q\ : std_logic;
SIGNAL \bancoRegs|registrador~644_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1337_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~868_q\ : std_logic;
SIGNAL \bancoRegs|registrador~420_q\ : std_logic;
SIGNAL \bancoRegs|registrador~932_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1338_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|registrador~836_q\ : std_logic;
SIGNAL \bancoRegs|registrador~388_q\ : std_logic;
SIGNAL \bancoRegs|registrador~900_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1339_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1340_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~356_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1488_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1332_combout\ : std_logic;
SIGNAL \ULA|Add0~118\ : std_logic;
SIGNAL \ULA|Add0~121_sumout\ : std_logic;
SIGNAL \bancoRegs|registrador~101_q\ : std_logic;
SIGNAL \bancoRegs|registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1345_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~613_q\ : std_logic;
SIGNAL \bancoRegs|registrador~581_q\ : std_logic;
SIGNAL \bancoRegs|registrador~869_q\ : std_logic;
SIGNAL \bancoRegs|registrador~837_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1346_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~165_q\ : std_logic;
SIGNAL \bancoRegs|registrador~133_q\ : std_logic;
SIGNAL \bancoRegs|registrador~421_q\ : std_logic;
SIGNAL \bancoRegs|registrador~389_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1347_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~677_q\ : std_logic;
SIGNAL \bancoRegs|registrador~645_q\ : std_logic;
SIGNAL \bancoRegs|registrador~933_q\ : std_logic;
SIGNAL \bancoRegs|registrador~901_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1348_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1349_combout\ : std_logic;
SIGNAL \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ : std_logic;
SIGNAL \bancoRegs|registrador~357_q\ : std_logic;
SIGNAL \bancoRegs|registrador~1492_combout\ : std_logic;
SIGNAL \bancoRegs|registrador~1341_combout\ : std_logic;
SIGNAL \ULA|Add0~122\ : std_logic;
SIGNAL \ULA|Add0~125_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~22\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~25_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~26\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~29_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~30\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~33_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~34\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~37_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~38\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~41_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~42\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~45_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~46\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~49_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~50\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~53_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~54\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~57_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~58\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~61_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~62\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~65_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~66\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~69_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~70\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~73_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~74\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~77_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~78\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~81_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~82\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~85_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~86\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~89_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~90\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~93_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~94\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~97_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~98\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~101_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~102\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~105_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~106\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~109_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~110\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~113_sumout\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~114\ : std_logic;
SIGNAL \PC_Soma_Constante|Add0~117_sumout\ : std_logic;
SIGNAL \PC_entity|DOUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \PC_entity|ALT_INV_DOUT\ : std_logic_vector(31 DOWNTO 2);
SIGNAL \bancoRegs|ALT_INV_registrador~1112_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~875_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~907_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~619_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~651_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~363_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~395_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~107_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~139_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~811_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~843_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~555_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~587_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~299_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~331_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~43_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~75_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1103_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~874_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~362_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~810_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~298_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~906_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~394_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~842_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~330_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~618_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~106_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~554_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~42_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~650_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~138_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~586_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~74_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1094_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~873_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~905_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~617_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~649_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~361_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~393_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~105_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~137_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~809_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~841_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~553_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~585_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~297_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~329_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~41_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~73_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1085_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~872_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~360_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~808_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~296_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~904_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~392_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~840_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~328_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~616_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~104_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~552_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~40_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~648_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~136_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~584_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~72_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1076_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~871_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~903_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~615_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~647_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~359_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~391_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~103_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~135_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~807_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~839_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~551_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~583_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~295_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~327_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~39_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~71_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1067_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~870_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~806_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~614_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~550_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~358_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~294_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~102_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~38_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~902_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~838_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~646_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~582_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~390_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~326_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~134_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~70_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~851_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~563_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~595_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~307_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~339_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~51_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~83_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1179_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~882_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~370_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~818_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~306_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~914_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~402_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~850_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~338_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~626_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~114_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~562_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~50_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~658_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~146_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~594_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~82_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1170_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1166_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~881_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~913_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~625_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~657_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~369_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~401_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~113_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~145_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~817_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~849_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~561_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~593_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~305_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~337_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~49_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~81_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1157_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~880_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~368_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~816_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~304_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~912_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~400_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~848_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~336_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~624_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~112_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~560_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~48_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~656_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~144_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~592_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~80_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~879_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~911_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~623_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~655_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~367_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~399_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~111_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~143_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~815_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~847_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~559_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~591_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~303_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~335_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~47_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~79_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1143_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~878_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~366_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~814_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~302_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~910_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~398_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~846_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~334_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~622_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~110_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~558_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~46_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~654_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~142_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~590_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~78_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1134_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~877_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~909_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~621_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~653_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~365_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~397_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~109_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~141_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~813_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~845_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~557_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~589_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~301_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~333_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~45_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~77_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1125_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~876_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~364_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~812_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~300_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~908_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~396_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~844_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~332_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~620_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~108_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~556_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~44_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~652_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~140_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~588_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~76_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1116_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~378_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~826_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~314_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~922_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~410_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~858_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~346_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~634_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~122_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~570_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~58_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~666_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~154_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~602_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~90_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1242_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~889_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~921_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~633_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~665_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~377_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~409_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~121_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~153_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~825_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~857_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~569_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~601_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~313_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~345_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~57_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~89_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1233_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~888_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~376_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~824_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~312_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~920_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~408_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~856_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~344_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~632_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~120_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~568_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~56_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~664_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~152_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~600_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~88_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1224_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~887_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~919_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~631_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~663_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~375_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~407_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~119_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~151_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~823_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~855_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~567_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~599_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~311_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~343_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~55_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~87_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1215_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~886_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~374_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~822_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~310_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~918_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~406_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~854_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~342_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~630_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~118_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~566_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~54_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~662_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~150_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~598_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~86_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1206_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~885_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~917_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~629_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~661_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~373_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~405_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~117_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~149_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~821_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~853_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~565_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~597_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~309_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~341_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~53_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~85_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1197_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~884_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~372_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~820_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~308_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~916_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~404_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~852_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~340_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~628_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~116_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~564_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~52_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~660_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~148_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~596_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~84_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1188_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~883_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~915_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~627_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~659_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~371_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~403_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~115_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~147_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~819_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~578_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~66_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~674_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~162_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~610_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~98_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1314_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~897_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~929_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~641_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~673_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~385_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~417_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~129_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~161_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~833_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~865_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~577_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~609_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~321_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~353_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~65_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~97_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1305_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~896_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~384_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~832_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~320_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~928_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~416_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~864_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~352_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~640_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~128_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~576_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~64_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~672_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~160_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~608_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~96_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1296_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~895_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~927_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~639_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~671_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~383_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~415_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~127_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~159_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~831_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~863_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~575_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~607_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~319_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~351_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~63_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~95_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1287_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~894_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~382_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~830_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~318_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~926_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~414_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~862_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~350_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~638_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~126_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~574_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~62_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~670_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~158_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~606_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~94_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1278_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~893_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~925_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~637_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~669_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~381_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~413_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~125_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~157_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~829_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~861_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~573_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~605_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~317_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~349_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~61_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~93_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1269_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~892_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~380_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~828_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~316_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~924_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~412_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~860_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~348_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~636_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~124_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~572_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~60_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~668_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~156_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~604_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~92_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1260_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~891_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~923_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~635_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~667_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~379_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~411_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~123_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~155_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~827_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~859_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~571_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~603_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~315_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~347_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~59_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~91_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1251_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~890_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1376_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1372_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1368_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~901_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~933_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~645_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~677_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~389_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~421_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~133_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~165_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~837_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~869_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~581_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~613_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~325_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~357_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~69_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~101_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1341_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~900_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~388_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~836_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~324_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~932_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~420_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~868_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~356_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~644_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~132_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~580_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~68_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~676_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~164_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~612_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~100_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1332_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~899_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~931_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~643_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~675_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~387_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~419_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~131_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~163_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~835_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~867_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~579_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~611_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~323_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~355_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~67_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~99_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1323_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~898_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~386_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~834_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~322_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~930_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~418_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~866_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~354_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~642_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~130_q\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1154_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1153_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1152_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1151_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1150_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1149_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1148_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1147_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1142_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1141_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1140_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1139_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1138_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1133_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1132_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1131_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1130_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1129_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1124_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1123_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1122_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1121_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1120_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~12_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1111_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1110_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1109_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1108_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1107_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~11_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1102_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1101_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1100_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1099_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1098_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~10_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1093_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1092_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1091_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1090_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1089_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~9_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1084_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1083_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1082_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1081_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1080_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1075_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1074_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1073_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1072_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1071_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1066_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1065_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1064_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1063_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1062_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1492_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1488_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1484_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1480_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1476_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1472_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1468_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1464_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1460_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1456_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1452_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1448_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1444_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1440_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1436_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1432_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1428_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1424_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1420_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1416_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1412_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1408_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1404_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1400_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1396_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1392_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1388_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1384_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1380_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1352_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1350_combout\ : std_logic;
SIGNAL \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\ : std_logic;
SIGNAL \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\ : std_logic;
SIGNAL \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~21_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~20_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1349_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1348_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1347_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1346_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1345_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1340_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1339_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1338_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1337_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1336_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1331_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1330_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1329_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1328_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1327_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1322_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1321_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1320_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1319_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1318_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1313_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1312_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1311_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1310_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1309_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1304_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1303_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1302_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1301_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1300_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1295_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1294_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1293_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1292_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1291_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1286_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1285_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1284_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1283_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1282_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1277_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1276_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1275_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1274_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1273_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1268_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1267_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1266_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1265_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1264_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1259_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1258_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1257_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1256_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1255_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1250_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1249_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1248_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1247_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1246_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1241_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1240_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1239_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1238_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1237_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1232_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1231_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1230_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1229_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1228_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1223_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1222_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1221_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1220_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1219_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1214_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1213_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1212_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1211_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1210_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1205_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1204_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1203_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1202_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1201_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~16_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1196_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1195_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1194_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1193_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1192_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~15_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1187_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1186_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1185_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1184_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1183_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1178_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1177_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1176_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1175_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1174_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~14_combout\ : std_logic;
SIGNAL \ROM|ALT_INV_memROM~13_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1165_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1164_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1163_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1162_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1161_combout\ : std_logic;
SIGNAL \UC|ALT_INV_sel_mux3~0_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1156_combout\ : std_logic;
SIGNAL \bancoRegs|ALT_INV_registrador~1155_combout\ : std_logic;
SIGNAL \UC|ALT_INV_sel_mux3~1_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ULA_saida <= ww_ULA_saida;
PC_saida <= ww_PC_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1066_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1075_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1084_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1093_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1102_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1111_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1124_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1133_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1142_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1151_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1156_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1165_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1178_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1187_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1196_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1205_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1214_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1223_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1232_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1241_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1250_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1259_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1268_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1277_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1286_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1295_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1304_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1313_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1322_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1331_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1340_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\(0);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\(0) <= \bancoRegs|registrador~1349_combout\;

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\ <= (\ULA|Add0~29_sumout\ & \ULA|Add0~25_sumout\ & \ULA|Add0~21_sumout\ & \ULA|Add0~17_sumout\ & \ULA|Add0~13_sumout\ & \ULA|Add0~9_sumout\);

\RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\ <= \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\(0);
\PC_entity|ALT_INV_DOUT\(2) <= NOT \PC_entity|DOUT\(2);
\bancoRegs|ALT_INV_registrador~1112_combout\ <= NOT \bancoRegs|registrador~1112_combout\;
\bancoRegs|ALT_INV_registrador~875_q\ <= NOT \bancoRegs|registrador~875_q\;
\bancoRegs|ALT_INV_registrador~907_q\ <= NOT \bancoRegs|registrador~907_q\;
\bancoRegs|ALT_INV_registrador~619_q\ <= NOT \bancoRegs|registrador~619_q\;
\bancoRegs|ALT_INV_registrador~651_q\ <= NOT \bancoRegs|registrador~651_q\;
\bancoRegs|ALT_INV_registrador~363_q\ <= NOT \bancoRegs|registrador~363_q\;
\bancoRegs|ALT_INV_registrador~395_q\ <= NOT \bancoRegs|registrador~395_q\;
\bancoRegs|ALT_INV_registrador~107_q\ <= NOT \bancoRegs|registrador~107_q\;
\bancoRegs|ALT_INV_registrador~139_q\ <= NOT \bancoRegs|registrador~139_q\;
\bancoRegs|ALT_INV_registrador~811_q\ <= NOT \bancoRegs|registrador~811_q\;
\bancoRegs|ALT_INV_registrador~843_q\ <= NOT \bancoRegs|registrador~843_q\;
\bancoRegs|ALT_INV_registrador~555_q\ <= NOT \bancoRegs|registrador~555_q\;
\bancoRegs|ALT_INV_registrador~587_q\ <= NOT \bancoRegs|registrador~587_q\;
\bancoRegs|ALT_INV_registrador~299_q\ <= NOT \bancoRegs|registrador~299_q\;
\bancoRegs|ALT_INV_registrador~331_q\ <= NOT \bancoRegs|registrador~331_q\;
\bancoRegs|ALT_INV_registrador~43_q\ <= NOT \bancoRegs|registrador~43_q\;
\bancoRegs|ALT_INV_registrador~75_q\ <= NOT \bancoRegs|registrador~75_q\;
\bancoRegs|ALT_INV_registrador~1103_combout\ <= NOT \bancoRegs|registrador~1103_combout\;
\bancoRegs|ALT_INV_registrador~874_q\ <= NOT \bancoRegs|registrador~874_q\;
\bancoRegs|ALT_INV_registrador~362_q\ <= NOT \bancoRegs|registrador~362_q\;
\bancoRegs|ALT_INV_registrador~810_q\ <= NOT \bancoRegs|registrador~810_q\;
\bancoRegs|ALT_INV_registrador~298_q\ <= NOT \bancoRegs|registrador~298_q\;
\bancoRegs|ALT_INV_registrador~906_q\ <= NOT \bancoRegs|registrador~906_q\;
\bancoRegs|ALT_INV_registrador~394_q\ <= NOT \bancoRegs|registrador~394_q\;
\bancoRegs|ALT_INV_registrador~842_q\ <= NOT \bancoRegs|registrador~842_q\;
\bancoRegs|ALT_INV_registrador~330_q\ <= NOT \bancoRegs|registrador~330_q\;
\bancoRegs|ALT_INV_registrador~618_q\ <= NOT \bancoRegs|registrador~618_q\;
\bancoRegs|ALT_INV_registrador~106_q\ <= NOT \bancoRegs|registrador~106_q\;
\bancoRegs|ALT_INV_registrador~554_q\ <= NOT \bancoRegs|registrador~554_q\;
\bancoRegs|ALT_INV_registrador~42_q\ <= NOT \bancoRegs|registrador~42_q\;
\bancoRegs|ALT_INV_registrador~650_q\ <= NOT \bancoRegs|registrador~650_q\;
\bancoRegs|ALT_INV_registrador~138_q\ <= NOT \bancoRegs|registrador~138_q\;
\bancoRegs|ALT_INV_registrador~586_q\ <= NOT \bancoRegs|registrador~586_q\;
\bancoRegs|ALT_INV_registrador~74_q\ <= NOT \bancoRegs|registrador~74_q\;
\bancoRegs|ALT_INV_registrador~1094_combout\ <= NOT \bancoRegs|registrador~1094_combout\;
\bancoRegs|ALT_INV_registrador~873_q\ <= NOT \bancoRegs|registrador~873_q\;
\bancoRegs|ALT_INV_registrador~905_q\ <= NOT \bancoRegs|registrador~905_q\;
\bancoRegs|ALT_INV_registrador~617_q\ <= NOT \bancoRegs|registrador~617_q\;
\bancoRegs|ALT_INV_registrador~649_q\ <= NOT \bancoRegs|registrador~649_q\;
\bancoRegs|ALT_INV_registrador~361_q\ <= NOT \bancoRegs|registrador~361_q\;
\bancoRegs|ALT_INV_registrador~393_q\ <= NOT \bancoRegs|registrador~393_q\;
\bancoRegs|ALT_INV_registrador~105_q\ <= NOT \bancoRegs|registrador~105_q\;
\bancoRegs|ALT_INV_registrador~137_q\ <= NOT \bancoRegs|registrador~137_q\;
\bancoRegs|ALT_INV_registrador~809_q\ <= NOT \bancoRegs|registrador~809_q\;
\bancoRegs|ALT_INV_registrador~841_q\ <= NOT \bancoRegs|registrador~841_q\;
\bancoRegs|ALT_INV_registrador~553_q\ <= NOT \bancoRegs|registrador~553_q\;
\bancoRegs|ALT_INV_registrador~585_q\ <= NOT \bancoRegs|registrador~585_q\;
\bancoRegs|ALT_INV_registrador~297_q\ <= NOT \bancoRegs|registrador~297_q\;
\bancoRegs|ALT_INV_registrador~329_q\ <= NOT \bancoRegs|registrador~329_q\;
\bancoRegs|ALT_INV_registrador~41_q\ <= NOT \bancoRegs|registrador~41_q\;
\bancoRegs|ALT_INV_registrador~73_q\ <= NOT \bancoRegs|registrador~73_q\;
\bancoRegs|ALT_INV_registrador~1085_combout\ <= NOT \bancoRegs|registrador~1085_combout\;
\bancoRegs|ALT_INV_registrador~872_q\ <= NOT \bancoRegs|registrador~872_q\;
\bancoRegs|ALT_INV_registrador~360_q\ <= NOT \bancoRegs|registrador~360_q\;
\bancoRegs|ALT_INV_registrador~808_q\ <= NOT \bancoRegs|registrador~808_q\;
\bancoRegs|ALT_INV_registrador~296_q\ <= NOT \bancoRegs|registrador~296_q\;
\bancoRegs|ALT_INV_registrador~904_q\ <= NOT \bancoRegs|registrador~904_q\;
\bancoRegs|ALT_INV_registrador~392_q\ <= NOT \bancoRegs|registrador~392_q\;
\bancoRegs|ALT_INV_registrador~840_q\ <= NOT \bancoRegs|registrador~840_q\;
\bancoRegs|ALT_INV_registrador~328_q\ <= NOT \bancoRegs|registrador~328_q\;
\bancoRegs|ALT_INV_registrador~616_q\ <= NOT \bancoRegs|registrador~616_q\;
\bancoRegs|ALT_INV_registrador~104_q\ <= NOT \bancoRegs|registrador~104_q\;
\bancoRegs|ALT_INV_registrador~552_q\ <= NOT \bancoRegs|registrador~552_q\;
\bancoRegs|ALT_INV_registrador~40_q\ <= NOT \bancoRegs|registrador~40_q\;
\bancoRegs|ALT_INV_registrador~648_q\ <= NOT \bancoRegs|registrador~648_q\;
\bancoRegs|ALT_INV_registrador~136_q\ <= NOT \bancoRegs|registrador~136_q\;
\bancoRegs|ALT_INV_registrador~584_q\ <= NOT \bancoRegs|registrador~584_q\;
\bancoRegs|ALT_INV_registrador~72_q\ <= NOT \bancoRegs|registrador~72_q\;
\bancoRegs|ALT_INV_registrador~1076_combout\ <= NOT \bancoRegs|registrador~1076_combout\;
\bancoRegs|ALT_INV_registrador~871_q\ <= NOT \bancoRegs|registrador~871_q\;
\bancoRegs|ALT_INV_registrador~903_q\ <= NOT \bancoRegs|registrador~903_q\;
\bancoRegs|ALT_INV_registrador~615_q\ <= NOT \bancoRegs|registrador~615_q\;
\bancoRegs|ALT_INV_registrador~647_q\ <= NOT \bancoRegs|registrador~647_q\;
\bancoRegs|ALT_INV_registrador~359_q\ <= NOT \bancoRegs|registrador~359_q\;
\bancoRegs|ALT_INV_registrador~391_q\ <= NOT \bancoRegs|registrador~391_q\;
\bancoRegs|ALT_INV_registrador~103_q\ <= NOT \bancoRegs|registrador~103_q\;
\bancoRegs|ALT_INV_registrador~135_q\ <= NOT \bancoRegs|registrador~135_q\;
\bancoRegs|ALT_INV_registrador~807_q\ <= NOT \bancoRegs|registrador~807_q\;
\bancoRegs|ALT_INV_registrador~839_q\ <= NOT \bancoRegs|registrador~839_q\;
\bancoRegs|ALT_INV_registrador~551_q\ <= NOT \bancoRegs|registrador~551_q\;
\bancoRegs|ALT_INV_registrador~583_q\ <= NOT \bancoRegs|registrador~583_q\;
\bancoRegs|ALT_INV_registrador~295_q\ <= NOT \bancoRegs|registrador~295_q\;
\bancoRegs|ALT_INV_registrador~327_q\ <= NOT \bancoRegs|registrador~327_q\;
\bancoRegs|ALT_INV_registrador~39_q\ <= NOT \bancoRegs|registrador~39_q\;
\bancoRegs|ALT_INV_registrador~71_q\ <= NOT \bancoRegs|registrador~71_q\;
\bancoRegs|ALT_INV_registrador~1067_combout\ <= NOT \bancoRegs|registrador~1067_combout\;
\bancoRegs|ALT_INV_registrador~870_q\ <= NOT \bancoRegs|registrador~870_q\;
\bancoRegs|ALT_INV_registrador~806_q\ <= NOT \bancoRegs|registrador~806_q\;
\bancoRegs|ALT_INV_registrador~614_q\ <= NOT \bancoRegs|registrador~614_q\;
\bancoRegs|ALT_INV_registrador~550_q\ <= NOT \bancoRegs|registrador~550_q\;
\bancoRegs|ALT_INV_registrador~358_q\ <= NOT \bancoRegs|registrador~358_q\;
\bancoRegs|ALT_INV_registrador~294_q\ <= NOT \bancoRegs|registrador~294_q\;
\bancoRegs|ALT_INV_registrador~102_q\ <= NOT \bancoRegs|registrador~102_q\;
\bancoRegs|ALT_INV_registrador~38_q\ <= NOT \bancoRegs|registrador~38_q\;
\bancoRegs|ALT_INV_registrador~902_q\ <= NOT \bancoRegs|registrador~902_q\;
\bancoRegs|ALT_INV_registrador~838_q\ <= NOT \bancoRegs|registrador~838_q\;
\bancoRegs|ALT_INV_registrador~646_q\ <= NOT \bancoRegs|registrador~646_q\;
\bancoRegs|ALT_INV_registrador~582_q\ <= NOT \bancoRegs|registrador~582_q\;
\bancoRegs|ALT_INV_registrador~390_q\ <= NOT \bancoRegs|registrador~390_q\;
\bancoRegs|ALT_INV_registrador~326_q\ <= NOT \bancoRegs|registrador~326_q\;
\bancoRegs|ALT_INV_registrador~134_q\ <= NOT \bancoRegs|registrador~134_q\;
\bancoRegs|ALT_INV_registrador~70_q\ <= NOT \bancoRegs|registrador~70_q\;
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
\PC_entity|ALT_INV_DOUT\(7) <= NOT \PC_entity|DOUT\(7);
\PC_entity|ALT_INV_DOUT\(6) <= NOT \PC_entity|DOUT\(6);
\PC_entity|ALT_INV_DOUT\(5) <= NOT \PC_entity|DOUT\(5);
\PC_entity|ALT_INV_DOUT\(4) <= NOT \PC_entity|DOUT\(4);
\PC_entity|ALT_INV_DOUT\(3) <= NOT \PC_entity|DOUT\(3);
\bancoRegs|ALT_INV_registrador~851_q\ <= NOT \bancoRegs|registrador~851_q\;
\bancoRegs|ALT_INV_registrador~563_q\ <= NOT \bancoRegs|registrador~563_q\;
\bancoRegs|ALT_INV_registrador~595_q\ <= NOT \bancoRegs|registrador~595_q\;
\bancoRegs|ALT_INV_registrador~307_q\ <= NOT \bancoRegs|registrador~307_q\;
\bancoRegs|ALT_INV_registrador~339_q\ <= NOT \bancoRegs|registrador~339_q\;
\bancoRegs|ALT_INV_registrador~51_q\ <= NOT \bancoRegs|registrador~51_q\;
\bancoRegs|ALT_INV_registrador~83_q\ <= NOT \bancoRegs|registrador~83_q\;
\bancoRegs|ALT_INV_registrador~1179_combout\ <= NOT \bancoRegs|registrador~1179_combout\;
\bancoRegs|ALT_INV_registrador~882_q\ <= NOT \bancoRegs|registrador~882_q\;
\bancoRegs|ALT_INV_registrador~370_q\ <= NOT \bancoRegs|registrador~370_q\;
\bancoRegs|ALT_INV_registrador~818_q\ <= NOT \bancoRegs|registrador~818_q\;
\bancoRegs|ALT_INV_registrador~306_q\ <= NOT \bancoRegs|registrador~306_q\;
\bancoRegs|ALT_INV_registrador~914_q\ <= NOT \bancoRegs|registrador~914_q\;
\bancoRegs|ALT_INV_registrador~402_q\ <= NOT \bancoRegs|registrador~402_q\;
\bancoRegs|ALT_INV_registrador~850_q\ <= NOT \bancoRegs|registrador~850_q\;
\bancoRegs|ALT_INV_registrador~338_q\ <= NOT \bancoRegs|registrador~338_q\;
\bancoRegs|ALT_INV_registrador~626_q\ <= NOT \bancoRegs|registrador~626_q\;
\bancoRegs|ALT_INV_registrador~114_q\ <= NOT \bancoRegs|registrador~114_q\;
\bancoRegs|ALT_INV_registrador~562_q\ <= NOT \bancoRegs|registrador~562_q\;
\bancoRegs|ALT_INV_registrador~50_q\ <= NOT \bancoRegs|registrador~50_q\;
\bancoRegs|ALT_INV_registrador~658_q\ <= NOT \bancoRegs|registrador~658_q\;
\bancoRegs|ALT_INV_registrador~146_q\ <= NOT \bancoRegs|registrador~146_q\;
\bancoRegs|ALT_INV_registrador~594_q\ <= NOT \bancoRegs|registrador~594_q\;
\bancoRegs|ALT_INV_registrador~82_q\ <= NOT \bancoRegs|registrador~82_q\;
\bancoRegs|ALT_INV_registrador~1170_combout\ <= NOT \bancoRegs|registrador~1170_combout\;
\bancoRegs|ALT_INV_registrador~1166_combout\ <= NOT \bancoRegs|registrador~1166_combout\;
\bancoRegs|ALT_INV_registrador~881_q\ <= NOT \bancoRegs|registrador~881_q\;
\bancoRegs|ALT_INV_registrador~913_q\ <= NOT \bancoRegs|registrador~913_q\;
\bancoRegs|ALT_INV_registrador~625_q\ <= NOT \bancoRegs|registrador~625_q\;
\bancoRegs|ALT_INV_registrador~657_q\ <= NOT \bancoRegs|registrador~657_q\;
\bancoRegs|ALT_INV_registrador~369_q\ <= NOT \bancoRegs|registrador~369_q\;
\bancoRegs|ALT_INV_registrador~401_q\ <= NOT \bancoRegs|registrador~401_q\;
\bancoRegs|ALT_INV_registrador~113_q\ <= NOT \bancoRegs|registrador~113_q\;
\bancoRegs|ALT_INV_registrador~145_q\ <= NOT \bancoRegs|registrador~145_q\;
\bancoRegs|ALT_INV_registrador~817_q\ <= NOT \bancoRegs|registrador~817_q\;
\bancoRegs|ALT_INV_registrador~849_q\ <= NOT \bancoRegs|registrador~849_q\;
\bancoRegs|ALT_INV_registrador~561_q\ <= NOT \bancoRegs|registrador~561_q\;
\bancoRegs|ALT_INV_registrador~593_q\ <= NOT \bancoRegs|registrador~593_q\;
\bancoRegs|ALT_INV_registrador~305_q\ <= NOT \bancoRegs|registrador~305_q\;
\bancoRegs|ALT_INV_registrador~337_q\ <= NOT \bancoRegs|registrador~337_q\;
\bancoRegs|ALT_INV_registrador~49_q\ <= NOT \bancoRegs|registrador~49_q\;
\bancoRegs|ALT_INV_registrador~81_q\ <= NOT \bancoRegs|registrador~81_q\;
\bancoRegs|ALT_INV_registrador~1157_combout\ <= NOT \bancoRegs|registrador~1157_combout\;
\bancoRegs|ALT_INV_registrador~880_q\ <= NOT \bancoRegs|registrador~880_q\;
\bancoRegs|ALT_INV_registrador~368_q\ <= NOT \bancoRegs|registrador~368_q\;
\bancoRegs|ALT_INV_registrador~816_q\ <= NOT \bancoRegs|registrador~816_q\;
\bancoRegs|ALT_INV_registrador~304_q\ <= NOT \bancoRegs|registrador~304_q\;
\bancoRegs|ALT_INV_registrador~912_q\ <= NOT \bancoRegs|registrador~912_q\;
\bancoRegs|ALT_INV_registrador~400_q\ <= NOT \bancoRegs|registrador~400_q\;
\bancoRegs|ALT_INV_registrador~848_q\ <= NOT \bancoRegs|registrador~848_q\;
\bancoRegs|ALT_INV_registrador~336_q\ <= NOT \bancoRegs|registrador~336_q\;
\bancoRegs|ALT_INV_registrador~624_q\ <= NOT \bancoRegs|registrador~624_q\;
\bancoRegs|ALT_INV_registrador~112_q\ <= NOT \bancoRegs|registrador~112_q\;
\bancoRegs|ALT_INV_registrador~560_q\ <= NOT \bancoRegs|registrador~560_q\;
\bancoRegs|ALT_INV_registrador~48_q\ <= NOT \bancoRegs|registrador~48_q\;
\bancoRegs|ALT_INV_registrador~656_q\ <= NOT \bancoRegs|registrador~656_q\;
\bancoRegs|ALT_INV_registrador~144_q\ <= NOT \bancoRegs|registrador~144_q\;
\bancoRegs|ALT_INV_registrador~592_q\ <= NOT \bancoRegs|registrador~592_q\;
\bancoRegs|ALT_INV_registrador~80_q\ <= NOT \bancoRegs|registrador~80_q\;
\bancoRegs|ALT_INV_registrador~879_q\ <= NOT \bancoRegs|registrador~879_q\;
\bancoRegs|ALT_INV_registrador~911_q\ <= NOT \bancoRegs|registrador~911_q\;
\bancoRegs|ALT_INV_registrador~623_q\ <= NOT \bancoRegs|registrador~623_q\;
\bancoRegs|ALT_INV_registrador~655_q\ <= NOT \bancoRegs|registrador~655_q\;
\bancoRegs|ALT_INV_registrador~367_q\ <= NOT \bancoRegs|registrador~367_q\;
\bancoRegs|ALT_INV_registrador~399_q\ <= NOT \bancoRegs|registrador~399_q\;
\bancoRegs|ALT_INV_registrador~111_q\ <= NOT \bancoRegs|registrador~111_q\;
\bancoRegs|ALT_INV_registrador~143_q\ <= NOT \bancoRegs|registrador~143_q\;
\bancoRegs|ALT_INV_registrador~815_q\ <= NOT \bancoRegs|registrador~815_q\;
\bancoRegs|ALT_INV_registrador~847_q\ <= NOT \bancoRegs|registrador~847_q\;
\bancoRegs|ALT_INV_registrador~559_q\ <= NOT \bancoRegs|registrador~559_q\;
\bancoRegs|ALT_INV_registrador~591_q\ <= NOT \bancoRegs|registrador~591_q\;
\bancoRegs|ALT_INV_registrador~303_q\ <= NOT \bancoRegs|registrador~303_q\;
\bancoRegs|ALT_INV_registrador~335_q\ <= NOT \bancoRegs|registrador~335_q\;
\bancoRegs|ALT_INV_registrador~47_q\ <= NOT \bancoRegs|registrador~47_q\;
\bancoRegs|ALT_INV_registrador~79_q\ <= NOT \bancoRegs|registrador~79_q\;
\bancoRegs|ALT_INV_registrador~1143_combout\ <= NOT \bancoRegs|registrador~1143_combout\;
\bancoRegs|ALT_INV_registrador~878_q\ <= NOT \bancoRegs|registrador~878_q\;
\bancoRegs|ALT_INV_registrador~366_q\ <= NOT \bancoRegs|registrador~366_q\;
\bancoRegs|ALT_INV_registrador~814_q\ <= NOT \bancoRegs|registrador~814_q\;
\bancoRegs|ALT_INV_registrador~302_q\ <= NOT \bancoRegs|registrador~302_q\;
\bancoRegs|ALT_INV_registrador~910_q\ <= NOT \bancoRegs|registrador~910_q\;
\bancoRegs|ALT_INV_registrador~398_q\ <= NOT \bancoRegs|registrador~398_q\;
\bancoRegs|ALT_INV_registrador~846_q\ <= NOT \bancoRegs|registrador~846_q\;
\bancoRegs|ALT_INV_registrador~334_q\ <= NOT \bancoRegs|registrador~334_q\;
\bancoRegs|ALT_INV_registrador~622_q\ <= NOT \bancoRegs|registrador~622_q\;
\bancoRegs|ALT_INV_registrador~110_q\ <= NOT \bancoRegs|registrador~110_q\;
\bancoRegs|ALT_INV_registrador~558_q\ <= NOT \bancoRegs|registrador~558_q\;
\bancoRegs|ALT_INV_registrador~46_q\ <= NOT \bancoRegs|registrador~46_q\;
\bancoRegs|ALT_INV_registrador~654_q\ <= NOT \bancoRegs|registrador~654_q\;
\bancoRegs|ALT_INV_registrador~142_q\ <= NOT \bancoRegs|registrador~142_q\;
\bancoRegs|ALT_INV_registrador~590_q\ <= NOT \bancoRegs|registrador~590_q\;
\bancoRegs|ALT_INV_registrador~78_q\ <= NOT \bancoRegs|registrador~78_q\;
\bancoRegs|ALT_INV_registrador~1134_combout\ <= NOT \bancoRegs|registrador~1134_combout\;
\bancoRegs|ALT_INV_registrador~877_q\ <= NOT \bancoRegs|registrador~877_q\;
\bancoRegs|ALT_INV_registrador~909_q\ <= NOT \bancoRegs|registrador~909_q\;
\bancoRegs|ALT_INV_registrador~621_q\ <= NOT \bancoRegs|registrador~621_q\;
\bancoRegs|ALT_INV_registrador~653_q\ <= NOT \bancoRegs|registrador~653_q\;
\bancoRegs|ALT_INV_registrador~365_q\ <= NOT \bancoRegs|registrador~365_q\;
\bancoRegs|ALT_INV_registrador~397_q\ <= NOT \bancoRegs|registrador~397_q\;
\bancoRegs|ALT_INV_registrador~109_q\ <= NOT \bancoRegs|registrador~109_q\;
\bancoRegs|ALT_INV_registrador~141_q\ <= NOT \bancoRegs|registrador~141_q\;
\bancoRegs|ALT_INV_registrador~813_q\ <= NOT \bancoRegs|registrador~813_q\;
\bancoRegs|ALT_INV_registrador~845_q\ <= NOT \bancoRegs|registrador~845_q\;
\bancoRegs|ALT_INV_registrador~557_q\ <= NOT \bancoRegs|registrador~557_q\;
\bancoRegs|ALT_INV_registrador~589_q\ <= NOT \bancoRegs|registrador~589_q\;
\bancoRegs|ALT_INV_registrador~301_q\ <= NOT \bancoRegs|registrador~301_q\;
\bancoRegs|ALT_INV_registrador~333_q\ <= NOT \bancoRegs|registrador~333_q\;
\bancoRegs|ALT_INV_registrador~45_q\ <= NOT \bancoRegs|registrador~45_q\;
\bancoRegs|ALT_INV_registrador~77_q\ <= NOT \bancoRegs|registrador~77_q\;
\bancoRegs|ALT_INV_registrador~1125_combout\ <= NOT \bancoRegs|registrador~1125_combout\;
\bancoRegs|ALT_INV_registrador~876_q\ <= NOT \bancoRegs|registrador~876_q\;
\bancoRegs|ALT_INV_registrador~364_q\ <= NOT \bancoRegs|registrador~364_q\;
\bancoRegs|ALT_INV_registrador~812_q\ <= NOT \bancoRegs|registrador~812_q\;
\bancoRegs|ALT_INV_registrador~300_q\ <= NOT \bancoRegs|registrador~300_q\;
\bancoRegs|ALT_INV_registrador~908_q\ <= NOT \bancoRegs|registrador~908_q\;
\bancoRegs|ALT_INV_registrador~396_q\ <= NOT \bancoRegs|registrador~396_q\;
\bancoRegs|ALT_INV_registrador~844_q\ <= NOT \bancoRegs|registrador~844_q\;
\bancoRegs|ALT_INV_registrador~332_q\ <= NOT \bancoRegs|registrador~332_q\;
\bancoRegs|ALT_INV_registrador~620_q\ <= NOT \bancoRegs|registrador~620_q\;
\bancoRegs|ALT_INV_registrador~108_q\ <= NOT \bancoRegs|registrador~108_q\;
\bancoRegs|ALT_INV_registrador~556_q\ <= NOT \bancoRegs|registrador~556_q\;
\bancoRegs|ALT_INV_registrador~44_q\ <= NOT \bancoRegs|registrador~44_q\;
\bancoRegs|ALT_INV_registrador~652_q\ <= NOT \bancoRegs|registrador~652_q\;
\bancoRegs|ALT_INV_registrador~140_q\ <= NOT \bancoRegs|registrador~140_q\;
\bancoRegs|ALT_INV_registrador~588_q\ <= NOT \bancoRegs|registrador~588_q\;
\bancoRegs|ALT_INV_registrador~76_q\ <= NOT \bancoRegs|registrador~76_q\;
\bancoRegs|ALT_INV_registrador~1116_combout\ <= NOT \bancoRegs|registrador~1116_combout\;
\bancoRegs|ALT_INV_registrador~378_q\ <= NOT \bancoRegs|registrador~378_q\;
\bancoRegs|ALT_INV_registrador~826_q\ <= NOT \bancoRegs|registrador~826_q\;
\bancoRegs|ALT_INV_registrador~314_q\ <= NOT \bancoRegs|registrador~314_q\;
\bancoRegs|ALT_INV_registrador~922_q\ <= NOT \bancoRegs|registrador~922_q\;
\bancoRegs|ALT_INV_registrador~410_q\ <= NOT \bancoRegs|registrador~410_q\;
\bancoRegs|ALT_INV_registrador~858_q\ <= NOT \bancoRegs|registrador~858_q\;
\bancoRegs|ALT_INV_registrador~346_q\ <= NOT \bancoRegs|registrador~346_q\;
\bancoRegs|ALT_INV_registrador~634_q\ <= NOT \bancoRegs|registrador~634_q\;
\bancoRegs|ALT_INV_registrador~122_q\ <= NOT \bancoRegs|registrador~122_q\;
\bancoRegs|ALT_INV_registrador~570_q\ <= NOT \bancoRegs|registrador~570_q\;
\bancoRegs|ALT_INV_registrador~58_q\ <= NOT \bancoRegs|registrador~58_q\;
\bancoRegs|ALT_INV_registrador~666_q\ <= NOT \bancoRegs|registrador~666_q\;
\bancoRegs|ALT_INV_registrador~154_q\ <= NOT \bancoRegs|registrador~154_q\;
\bancoRegs|ALT_INV_registrador~602_q\ <= NOT \bancoRegs|registrador~602_q\;
\bancoRegs|ALT_INV_registrador~90_q\ <= NOT \bancoRegs|registrador~90_q\;
\bancoRegs|ALT_INV_registrador~1242_combout\ <= NOT \bancoRegs|registrador~1242_combout\;
\bancoRegs|ALT_INV_registrador~889_q\ <= NOT \bancoRegs|registrador~889_q\;
\bancoRegs|ALT_INV_registrador~921_q\ <= NOT \bancoRegs|registrador~921_q\;
\bancoRegs|ALT_INV_registrador~633_q\ <= NOT \bancoRegs|registrador~633_q\;
\bancoRegs|ALT_INV_registrador~665_q\ <= NOT \bancoRegs|registrador~665_q\;
\bancoRegs|ALT_INV_registrador~377_q\ <= NOT \bancoRegs|registrador~377_q\;
\bancoRegs|ALT_INV_registrador~409_q\ <= NOT \bancoRegs|registrador~409_q\;
\bancoRegs|ALT_INV_registrador~121_q\ <= NOT \bancoRegs|registrador~121_q\;
\bancoRegs|ALT_INV_registrador~153_q\ <= NOT \bancoRegs|registrador~153_q\;
\bancoRegs|ALT_INV_registrador~825_q\ <= NOT \bancoRegs|registrador~825_q\;
\bancoRegs|ALT_INV_registrador~857_q\ <= NOT \bancoRegs|registrador~857_q\;
\bancoRegs|ALT_INV_registrador~569_q\ <= NOT \bancoRegs|registrador~569_q\;
\bancoRegs|ALT_INV_registrador~601_q\ <= NOT \bancoRegs|registrador~601_q\;
\bancoRegs|ALT_INV_registrador~313_q\ <= NOT \bancoRegs|registrador~313_q\;
\bancoRegs|ALT_INV_registrador~345_q\ <= NOT \bancoRegs|registrador~345_q\;
\bancoRegs|ALT_INV_registrador~57_q\ <= NOT \bancoRegs|registrador~57_q\;
\bancoRegs|ALT_INV_registrador~89_q\ <= NOT \bancoRegs|registrador~89_q\;
\bancoRegs|ALT_INV_registrador~1233_combout\ <= NOT \bancoRegs|registrador~1233_combout\;
\bancoRegs|ALT_INV_registrador~888_q\ <= NOT \bancoRegs|registrador~888_q\;
\bancoRegs|ALT_INV_registrador~376_q\ <= NOT \bancoRegs|registrador~376_q\;
\bancoRegs|ALT_INV_registrador~824_q\ <= NOT \bancoRegs|registrador~824_q\;
\bancoRegs|ALT_INV_registrador~312_q\ <= NOT \bancoRegs|registrador~312_q\;
\bancoRegs|ALT_INV_registrador~920_q\ <= NOT \bancoRegs|registrador~920_q\;
\bancoRegs|ALT_INV_registrador~408_q\ <= NOT \bancoRegs|registrador~408_q\;
\bancoRegs|ALT_INV_registrador~856_q\ <= NOT \bancoRegs|registrador~856_q\;
\bancoRegs|ALT_INV_registrador~344_q\ <= NOT \bancoRegs|registrador~344_q\;
\bancoRegs|ALT_INV_registrador~632_q\ <= NOT \bancoRegs|registrador~632_q\;
\bancoRegs|ALT_INV_registrador~120_q\ <= NOT \bancoRegs|registrador~120_q\;
\bancoRegs|ALT_INV_registrador~568_q\ <= NOT \bancoRegs|registrador~568_q\;
\bancoRegs|ALT_INV_registrador~56_q\ <= NOT \bancoRegs|registrador~56_q\;
\bancoRegs|ALT_INV_registrador~664_q\ <= NOT \bancoRegs|registrador~664_q\;
\bancoRegs|ALT_INV_registrador~152_q\ <= NOT \bancoRegs|registrador~152_q\;
\bancoRegs|ALT_INV_registrador~600_q\ <= NOT \bancoRegs|registrador~600_q\;
\bancoRegs|ALT_INV_registrador~88_q\ <= NOT \bancoRegs|registrador~88_q\;
\bancoRegs|ALT_INV_registrador~1224_combout\ <= NOT \bancoRegs|registrador~1224_combout\;
\bancoRegs|ALT_INV_registrador~887_q\ <= NOT \bancoRegs|registrador~887_q\;
\bancoRegs|ALT_INV_registrador~919_q\ <= NOT \bancoRegs|registrador~919_q\;
\bancoRegs|ALT_INV_registrador~631_q\ <= NOT \bancoRegs|registrador~631_q\;
\bancoRegs|ALT_INV_registrador~663_q\ <= NOT \bancoRegs|registrador~663_q\;
\bancoRegs|ALT_INV_registrador~375_q\ <= NOT \bancoRegs|registrador~375_q\;
\bancoRegs|ALT_INV_registrador~407_q\ <= NOT \bancoRegs|registrador~407_q\;
\bancoRegs|ALT_INV_registrador~119_q\ <= NOT \bancoRegs|registrador~119_q\;
\bancoRegs|ALT_INV_registrador~151_q\ <= NOT \bancoRegs|registrador~151_q\;
\bancoRegs|ALT_INV_registrador~823_q\ <= NOT \bancoRegs|registrador~823_q\;
\bancoRegs|ALT_INV_registrador~855_q\ <= NOT \bancoRegs|registrador~855_q\;
\bancoRegs|ALT_INV_registrador~567_q\ <= NOT \bancoRegs|registrador~567_q\;
\bancoRegs|ALT_INV_registrador~599_q\ <= NOT \bancoRegs|registrador~599_q\;
\bancoRegs|ALT_INV_registrador~311_q\ <= NOT \bancoRegs|registrador~311_q\;
\bancoRegs|ALT_INV_registrador~343_q\ <= NOT \bancoRegs|registrador~343_q\;
\bancoRegs|ALT_INV_registrador~55_q\ <= NOT \bancoRegs|registrador~55_q\;
\bancoRegs|ALT_INV_registrador~87_q\ <= NOT \bancoRegs|registrador~87_q\;
\bancoRegs|ALT_INV_registrador~1215_combout\ <= NOT \bancoRegs|registrador~1215_combout\;
\bancoRegs|ALT_INV_registrador~886_q\ <= NOT \bancoRegs|registrador~886_q\;
\bancoRegs|ALT_INV_registrador~374_q\ <= NOT \bancoRegs|registrador~374_q\;
\bancoRegs|ALT_INV_registrador~822_q\ <= NOT \bancoRegs|registrador~822_q\;
\bancoRegs|ALT_INV_registrador~310_q\ <= NOT \bancoRegs|registrador~310_q\;
\bancoRegs|ALT_INV_registrador~918_q\ <= NOT \bancoRegs|registrador~918_q\;
\bancoRegs|ALT_INV_registrador~406_q\ <= NOT \bancoRegs|registrador~406_q\;
\bancoRegs|ALT_INV_registrador~854_q\ <= NOT \bancoRegs|registrador~854_q\;
\bancoRegs|ALT_INV_registrador~342_q\ <= NOT \bancoRegs|registrador~342_q\;
\bancoRegs|ALT_INV_registrador~630_q\ <= NOT \bancoRegs|registrador~630_q\;
\bancoRegs|ALT_INV_registrador~118_q\ <= NOT \bancoRegs|registrador~118_q\;
\bancoRegs|ALT_INV_registrador~566_q\ <= NOT \bancoRegs|registrador~566_q\;
\bancoRegs|ALT_INV_registrador~54_q\ <= NOT \bancoRegs|registrador~54_q\;
\bancoRegs|ALT_INV_registrador~662_q\ <= NOT \bancoRegs|registrador~662_q\;
\bancoRegs|ALT_INV_registrador~150_q\ <= NOT \bancoRegs|registrador~150_q\;
\bancoRegs|ALT_INV_registrador~598_q\ <= NOT \bancoRegs|registrador~598_q\;
\bancoRegs|ALT_INV_registrador~86_q\ <= NOT \bancoRegs|registrador~86_q\;
\bancoRegs|ALT_INV_registrador~1206_combout\ <= NOT \bancoRegs|registrador~1206_combout\;
\bancoRegs|ALT_INV_registrador~885_q\ <= NOT \bancoRegs|registrador~885_q\;
\bancoRegs|ALT_INV_registrador~917_q\ <= NOT \bancoRegs|registrador~917_q\;
\bancoRegs|ALT_INV_registrador~629_q\ <= NOT \bancoRegs|registrador~629_q\;
\bancoRegs|ALT_INV_registrador~661_q\ <= NOT \bancoRegs|registrador~661_q\;
\bancoRegs|ALT_INV_registrador~373_q\ <= NOT \bancoRegs|registrador~373_q\;
\bancoRegs|ALT_INV_registrador~405_q\ <= NOT \bancoRegs|registrador~405_q\;
\bancoRegs|ALT_INV_registrador~117_q\ <= NOT \bancoRegs|registrador~117_q\;
\bancoRegs|ALT_INV_registrador~149_q\ <= NOT \bancoRegs|registrador~149_q\;
\bancoRegs|ALT_INV_registrador~821_q\ <= NOT \bancoRegs|registrador~821_q\;
\bancoRegs|ALT_INV_registrador~853_q\ <= NOT \bancoRegs|registrador~853_q\;
\bancoRegs|ALT_INV_registrador~565_q\ <= NOT \bancoRegs|registrador~565_q\;
\bancoRegs|ALT_INV_registrador~597_q\ <= NOT \bancoRegs|registrador~597_q\;
\bancoRegs|ALT_INV_registrador~309_q\ <= NOT \bancoRegs|registrador~309_q\;
\bancoRegs|ALT_INV_registrador~341_q\ <= NOT \bancoRegs|registrador~341_q\;
\bancoRegs|ALT_INV_registrador~53_q\ <= NOT \bancoRegs|registrador~53_q\;
\bancoRegs|ALT_INV_registrador~85_q\ <= NOT \bancoRegs|registrador~85_q\;
\bancoRegs|ALT_INV_registrador~1197_combout\ <= NOT \bancoRegs|registrador~1197_combout\;
\bancoRegs|ALT_INV_registrador~884_q\ <= NOT \bancoRegs|registrador~884_q\;
\bancoRegs|ALT_INV_registrador~372_q\ <= NOT \bancoRegs|registrador~372_q\;
\bancoRegs|ALT_INV_registrador~820_q\ <= NOT \bancoRegs|registrador~820_q\;
\bancoRegs|ALT_INV_registrador~308_q\ <= NOT \bancoRegs|registrador~308_q\;
\bancoRegs|ALT_INV_registrador~916_q\ <= NOT \bancoRegs|registrador~916_q\;
\bancoRegs|ALT_INV_registrador~404_q\ <= NOT \bancoRegs|registrador~404_q\;
\bancoRegs|ALT_INV_registrador~852_q\ <= NOT \bancoRegs|registrador~852_q\;
\bancoRegs|ALT_INV_registrador~340_q\ <= NOT \bancoRegs|registrador~340_q\;
\bancoRegs|ALT_INV_registrador~628_q\ <= NOT \bancoRegs|registrador~628_q\;
\bancoRegs|ALT_INV_registrador~116_q\ <= NOT \bancoRegs|registrador~116_q\;
\bancoRegs|ALT_INV_registrador~564_q\ <= NOT \bancoRegs|registrador~564_q\;
\bancoRegs|ALT_INV_registrador~52_q\ <= NOT \bancoRegs|registrador~52_q\;
\bancoRegs|ALT_INV_registrador~660_q\ <= NOT \bancoRegs|registrador~660_q\;
\bancoRegs|ALT_INV_registrador~148_q\ <= NOT \bancoRegs|registrador~148_q\;
\bancoRegs|ALT_INV_registrador~596_q\ <= NOT \bancoRegs|registrador~596_q\;
\bancoRegs|ALT_INV_registrador~84_q\ <= NOT \bancoRegs|registrador~84_q\;
\bancoRegs|ALT_INV_registrador~1188_combout\ <= NOT \bancoRegs|registrador~1188_combout\;
\bancoRegs|ALT_INV_registrador~883_q\ <= NOT \bancoRegs|registrador~883_q\;
\bancoRegs|ALT_INV_registrador~915_q\ <= NOT \bancoRegs|registrador~915_q\;
\bancoRegs|ALT_INV_registrador~627_q\ <= NOT \bancoRegs|registrador~627_q\;
\bancoRegs|ALT_INV_registrador~659_q\ <= NOT \bancoRegs|registrador~659_q\;
\bancoRegs|ALT_INV_registrador~371_q\ <= NOT \bancoRegs|registrador~371_q\;
\bancoRegs|ALT_INV_registrador~403_q\ <= NOT \bancoRegs|registrador~403_q\;
\bancoRegs|ALT_INV_registrador~115_q\ <= NOT \bancoRegs|registrador~115_q\;
\bancoRegs|ALT_INV_registrador~147_q\ <= NOT \bancoRegs|registrador~147_q\;
\bancoRegs|ALT_INV_registrador~819_q\ <= NOT \bancoRegs|registrador~819_q\;
\bancoRegs|ALT_INV_registrador~578_q\ <= NOT \bancoRegs|registrador~578_q\;
\bancoRegs|ALT_INV_registrador~66_q\ <= NOT \bancoRegs|registrador~66_q\;
\bancoRegs|ALT_INV_registrador~674_q\ <= NOT \bancoRegs|registrador~674_q\;
\bancoRegs|ALT_INV_registrador~162_q\ <= NOT \bancoRegs|registrador~162_q\;
\bancoRegs|ALT_INV_registrador~610_q\ <= NOT \bancoRegs|registrador~610_q\;
\bancoRegs|ALT_INV_registrador~98_q\ <= NOT \bancoRegs|registrador~98_q\;
\bancoRegs|ALT_INV_registrador~1314_combout\ <= NOT \bancoRegs|registrador~1314_combout\;
\bancoRegs|ALT_INV_registrador~897_q\ <= NOT \bancoRegs|registrador~897_q\;
\bancoRegs|ALT_INV_registrador~929_q\ <= NOT \bancoRegs|registrador~929_q\;
\bancoRegs|ALT_INV_registrador~641_q\ <= NOT \bancoRegs|registrador~641_q\;
\bancoRegs|ALT_INV_registrador~673_q\ <= NOT \bancoRegs|registrador~673_q\;
\bancoRegs|ALT_INV_registrador~385_q\ <= NOT \bancoRegs|registrador~385_q\;
\bancoRegs|ALT_INV_registrador~417_q\ <= NOT \bancoRegs|registrador~417_q\;
\bancoRegs|ALT_INV_registrador~129_q\ <= NOT \bancoRegs|registrador~129_q\;
\bancoRegs|ALT_INV_registrador~161_q\ <= NOT \bancoRegs|registrador~161_q\;
\bancoRegs|ALT_INV_registrador~833_q\ <= NOT \bancoRegs|registrador~833_q\;
\bancoRegs|ALT_INV_registrador~865_q\ <= NOT \bancoRegs|registrador~865_q\;
\bancoRegs|ALT_INV_registrador~577_q\ <= NOT \bancoRegs|registrador~577_q\;
\bancoRegs|ALT_INV_registrador~609_q\ <= NOT \bancoRegs|registrador~609_q\;
\bancoRegs|ALT_INV_registrador~321_q\ <= NOT \bancoRegs|registrador~321_q\;
\bancoRegs|ALT_INV_registrador~353_q\ <= NOT \bancoRegs|registrador~353_q\;
\bancoRegs|ALT_INV_registrador~65_q\ <= NOT \bancoRegs|registrador~65_q\;
\bancoRegs|ALT_INV_registrador~97_q\ <= NOT \bancoRegs|registrador~97_q\;
\bancoRegs|ALT_INV_registrador~1305_combout\ <= NOT \bancoRegs|registrador~1305_combout\;
\bancoRegs|ALT_INV_registrador~896_q\ <= NOT \bancoRegs|registrador~896_q\;
\bancoRegs|ALT_INV_registrador~384_q\ <= NOT \bancoRegs|registrador~384_q\;
\bancoRegs|ALT_INV_registrador~832_q\ <= NOT \bancoRegs|registrador~832_q\;
\bancoRegs|ALT_INV_registrador~320_q\ <= NOT \bancoRegs|registrador~320_q\;
\bancoRegs|ALT_INV_registrador~928_q\ <= NOT \bancoRegs|registrador~928_q\;
\bancoRegs|ALT_INV_registrador~416_q\ <= NOT \bancoRegs|registrador~416_q\;
\bancoRegs|ALT_INV_registrador~864_q\ <= NOT \bancoRegs|registrador~864_q\;
\bancoRegs|ALT_INV_registrador~352_q\ <= NOT \bancoRegs|registrador~352_q\;
\bancoRegs|ALT_INV_registrador~640_q\ <= NOT \bancoRegs|registrador~640_q\;
\bancoRegs|ALT_INV_registrador~128_q\ <= NOT \bancoRegs|registrador~128_q\;
\bancoRegs|ALT_INV_registrador~576_q\ <= NOT \bancoRegs|registrador~576_q\;
\bancoRegs|ALT_INV_registrador~64_q\ <= NOT \bancoRegs|registrador~64_q\;
\bancoRegs|ALT_INV_registrador~672_q\ <= NOT \bancoRegs|registrador~672_q\;
\bancoRegs|ALT_INV_registrador~160_q\ <= NOT \bancoRegs|registrador~160_q\;
\bancoRegs|ALT_INV_registrador~608_q\ <= NOT \bancoRegs|registrador~608_q\;
\bancoRegs|ALT_INV_registrador~96_q\ <= NOT \bancoRegs|registrador~96_q\;
\bancoRegs|ALT_INV_registrador~1296_combout\ <= NOT \bancoRegs|registrador~1296_combout\;
\bancoRegs|ALT_INV_registrador~895_q\ <= NOT \bancoRegs|registrador~895_q\;
\bancoRegs|ALT_INV_registrador~927_q\ <= NOT \bancoRegs|registrador~927_q\;
\bancoRegs|ALT_INV_registrador~639_q\ <= NOT \bancoRegs|registrador~639_q\;
\bancoRegs|ALT_INV_registrador~671_q\ <= NOT \bancoRegs|registrador~671_q\;
\bancoRegs|ALT_INV_registrador~383_q\ <= NOT \bancoRegs|registrador~383_q\;
\bancoRegs|ALT_INV_registrador~415_q\ <= NOT \bancoRegs|registrador~415_q\;
\bancoRegs|ALT_INV_registrador~127_q\ <= NOT \bancoRegs|registrador~127_q\;
\bancoRegs|ALT_INV_registrador~159_q\ <= NOT \bancoRegs|registrador~159_q\;
\bancoRegs|ALT_INV_registrador~831_q\ <= NOT \bancoRegs|registrador~831_q\;
\bancoRegs|ALT_INV_registrador~863_q\ <= NOT \bancoRegs|registrador~863_q\;
\bancoRegs|ALT_INV_registrador~575_q\ <= NOT \bancoRegs|registrador~575_q\;
\bancoRegs|ALT_INV_registrador~607_q\ <= NOT \bancoRegs|registrador~607_q\;
\bancoRegs|ALT_INV_registrador~319_q\ <= NOT \bancoRegs|registrador~319_q\;
\bancoRegs|ALT_INV_registrador~351_q\ <= NOT \bancoRegs|registrador~351_q\;
\bancoRegs|ALT_INV_registrador~63_q\ <= NOT \bancoRegs|registrador~63_q\;
\bancoRegs|ALT_INV_registrador~95_q\ <= NOT \bancoRegs|registrador~95_q\;
\bancoRegs|ALT_INV_registrador~1287_combout\ <= NOT \bancoRegs|registrador~1287_combout\;
\bancoRegs|ALT_INV_registrador~894_q\ <= NOT \bancoRegs|registrador~894_q\;
\bancoRegs|ALT_INV_registrador~382_q\ <= NOT \bancoRegs|registrador~382_q\;
\bancoRegs|ALT_INV_registrador~830_q\ <= NOT \bancoRegs|registrador~830_q\;
\bancoRegs|ALT_INV_registrador~318_q\ <= NOT \bancoRegs|registrador~318_q\;
\bancoRegs|ALT_INV_registrador~926_q\ <= NOT \bancoRegs|registrador~926_q\;
\bancoRegs|ALT_INV_registrador~414_q\ <= NOT \bancoRegs|registrador~414_q\;
\bancoRegs|ALT_INV_registrador~862_q\ <= NOT \bancoRegs|registrador~862_q\;
\bancoRegs|ALT_INV_registrador~350_q\ <= NOT \bancoRegs|registrador~350_q\;
\bancoRegs|ALT_INV_registrador~638_q\ <= NOT \bancoRegs|registrador~638_q\;
\bancoRegs|ALT_INV_registrador~126_q\ <= NOT \bancoRegs|registrador~126_q\;
\bancoRegs|ALT_INV_registrador~574_q\ <= NOT \bancoRegs|registrador~574_q\;
\bancoRegs|ALT_INV_registrador~62_q\ <= NOT \bancoRegs|registrador~62_q\;
\bancoRegs|ALT_INV_registrador~670_q\ <= NOT \bancoRegs|registrador~670_q\;
\bancoRegs|ALT_INV_registrador~158_q\ <= NOT \bancoRegs|registrador~158_q\;
\bancoRegs|ALT_INV_registrador~606_q\ <= NOT \bancoRegs|registrador~606_q\;
\bancoRegs|ALT_INV_registrador~94_q\ <= NOT \bancoRegs|registrador~94_q\;
\bancoRegs|ALT_INV_registrador~1278_combout\ <= NOT \bancoRegs|registrador~1278_combout\;
\bancoRegs|ALT_INV_registrador~893_q\ <= NOT \bancoRegs|registrador~893_q\;
\bancoRegs|ALT_INV_registrador~925_q\ <= NOT \bancoRegs|registrador~925_q\;
\bancoRegs|ALT_INV_registrador~637_q\ <= NOT \bancoRegs|registrador~637_q\;
\bancoRegs|ALT_INV_registrador~669_q\ <= NOT \bancoRegs|registrador~669_q\;
\bancoRegs|ALT_INV_registrador~381_q\ <= NOT \bancoRegs|registrador~381_q\;
\bancoRegs|ALT_INV_registrador~413_q\ <= NOT \bancoRegs|registrador~413_q\;
\bancoRegs|ALT_INV_registrador~125_q\ <= NOT \bancoRegs|registrador~125_q\;
\bancoRegs|ALT_INV_registrador~157_q\ <= NOT \bancoRegs|registrador~157_q\;
\bancoRegs|ALT_INV_registrador~829_q\ <= NOT \bancoRegs|registrador~829_q\;
\bancoRegs|ALT_INV_registrador~861_q\ <= NOT \bancoRegs|registrador~861_q\;
\bancoRegs|ALT_INV_registrador~573_q\ <= NOT \bancoRegs|registrador~573_q\;
\bancoRegs|ALT_INV_registrador~605_q\ <= NOT \bancoRegs|registrador~605_q\;
\bancoRegs|ALT_INV_registrador~317_q\ <= NOT \bancoRegs|registrador~317_q\;
\bancoRegs|ALT_INV_registrador~349_q\ <= NOT \bancoRegs|registrador~349_q\;
\bancoRegs|ALT_INV_registrador~61_q\ <= NOT \bancoRegs|registrador~61_q\;
\bancoRegs|ALT_INV_registrador~93_q\ <= NOT \bancoRegs|registrador~93_q\;
\bancoRegs|ALT_INV_registrador~1269_combout\ <= NOT \bancoRegs|registrador~1269_combout\;
\bancoRegs|ALT_INV_registrador~892_q\ <= NOT \bancoRegs|registrador~892_q\;
\bancoRegs|ALT_INV_registrador~380_q\ <= NOT \bancoRegs|registrador~380_q\;
\bancoRegs|ALT_INV_registrador~828_q\ <= NOT \bancoRegs|registrador~828_q\;
\bancoRegs|ALT_INV_registrador~316_q\ <= NOT \bancoRegs|registrador~316_q\;
\bancoRegs|ALT_INV_registrador~924_q\ <= NOT \bancoRegs|registrador~924_q\;
\bancoRegs|ALT_INV_registrador~412_q\ <= NOT \bancoRegs|registrador~412_q\;
\bancoRegs|ALT_INV_registrador~860_q\ <= NOT \bancoRegs|registrador~860_q\;
\bancoRegs|ALT_INV_registrador~348_q\ <= NOT \bancoRegs|registrador~348_q\;
\bancoRegs|ALT_INV_registrador~636_q\ <= NOT \bancoRegs|registrador~636_q\;
\bancoRegs|ALT_INV_registrador~124_q\ <= NOT \bancoRegs|registrador~124_q\;
\bancoRegs|ALT_INV_registrador~572_q\ <= NOT \bancoRegs|registrador~572_q\;
\bancoRegs|ALT_INV_registrador~60_q\ <= NOT \bancoRegs|registrador~60_q\;
\bancoRegs|ALT_INV_registrador~668_q\ <= NOT \bancoRegs|registrador~668_q\;
\bancoRegs|ALT_INV_registrador~156_q\ <= NOT \bancoRegs|registrador~156_q\;
\bancoRegs|ALT_INV_registrador~604_q\ <= NOT \bancoRegs|registrador~604_q\;
\bancoRegs|ALT_INV_registrador~92_q\ <= NOT \bancoRegs|registrador~92_q\;
\bancoRegs|ALT_INV_registrador~1260_combout\ <= NOT \bancoRegs|registrador~1260_combout\;
\bancoRegs|ALT_INV_registrador~891_q\ <= NOT \bancoRegs|registrador~891_q\;
\bancoRegs|ALT_INV_registrador~923_q\ <= NOT \bancoRegs|registrador~923_q\;
\bancoRegs|ALT_INV_registrador~635_q\ <= NOT \bancoRegs|registrador~635_q\;
\bancoRegs|ALT_INV_registrador~667_q\ <= NOT \bancoRegs|registrador~667_q\;
\bancoRegs|ALT_INV_registrador~379_q\ <= NOT \bancoRegs|registrador~379_q\;
\bancoRegs|ALT_INV_registrador~411_q\ <= NOT \bancoRegs|registrador~411_q\;
\bancoRegs|ALT_INV_registrador~123_q\ <= NOT \bancoRegs|registrador~123_q\;
\bancoRegs|ALT_INV_registrador~155_q\ <= NOT \bancoRegs|registrador~155_q\;
\bancoRegs|ALT_INV_registrador~827_q\ <= NOT \bancoRegs|registrador~827_q\;
\bancoRegs|ALT_INV_registrador~859_q\ <= NOT \bancoRegs|registrador~859_q\;
\bancoRegs|ALT_INV_registrador~571_q\ <= NOT \bancoRegs|registrador~571_q\;
\bancoRegs|ALT_INV_registrador~603_q\ <= NOT \bancoRegs|registrador~603_q\;
\bancoRegs|ALT_INV_registrador~315_q\ <= NOT \bancoRegs|registrador~315_q\;
\bancoRegs|ALT_INV_registrador~347_q\ <= NOT \bancoRegs|registrador~347_q\;
\bancoRegs|ALT_INV_registrador~59_q\ <= NOT \bancoRegs|registrador~59_q\;
\bancoRegs|ALT_INV_registrador~91_q\ <= NOT \bancoRegs|registrador~91_q\;
\bancoRegs|ALT_INV_registrador~1251_combout\ <= NOT \bancoRegs|registrador~1251_combout\;
\bancoRegs|ALT_INV_registrador~890_q\ <= NOT \bancoRegs|registrador~890_q\;
\bancoRegs|ALT_INV_registrador~1376_combout\ <= NOT \bancoRegs|registrador~1376_combout\;
\bancoRegs|ALT_INV_registrador~1372_combout\ <= NOT \bancoRegs|registrador~1372_combout\;
\bancoRegs|ALT_INV_registrador~1368_combout\ <= NOT \bancoRegs|registrador~1368_combout\;
\bancoRegs|ALT_INV_registrador~901_q\ <= NOT \bancoRegs|registrador~901_q\;
\bancoRegs|ALT_INV_registrador~933_q\ <= NOT \bancoRegs|registrador~933_q\;
\bancoRegs|ALT_INV_registrador~645_q\ <= NOT \bancoRegs|registrador~645_q\;
\bancoRegs|ALT_INV_registrador~677_q\ <= NOT \bancoRegs|registrador~677_q\;
\bancoRegs|ALT_INV_registrador~389_q\ <= NOT \bancoRegs|registrador~389_q\;
\bancoRegs|ALT_INV_registrador~421_q\ <= NOT \bancoRegs|registrador~421_q\;
\bancoRegs|ALT_INV_registrador~133_q\ <= NOT \bancoRegs|registrador~133_q\;
\bancoRegs|ALT_INV_registrador~165_q\ <= NOT \bancoRegs|registrador~165_q\;
\bancoRegs|ALT_INV_registrador~837_q\ <= NOT \bancoRegs|registrador~837_q\;
\bancoRegs|ALT_INV_registrador~869_q\ <= NOT \bancoRegs|registrador~869_q\;
\bancoRegs|ALT_INV_registrador~581_q\ <= NOT \bancoRegs|registrador~581_q\;
\bancoRegs|ALT_INV_registrador~613_q\ <= NOT \bancoRegs|registrador~613_q\;
\bancoRegs|ALT_INV_registrador~325_q\ <= NOT \bancoRegs|registrador~325_q\;
\bancoRegs|ALT_INV_registrador~357_q\ <= NOT \bancoRegs|registrador~357_q\;
\bancoRegs|ALT_INV_registrador~69_q\ <= NOT \bancoRegs|registrador~69_q\;
\bancoRegs|ALT_INV_registrador~101_q\ <= NOT \bancoRegs|registrador~101_q\;
\bancoRegs|ALT_INV_registrador~1341_combout\ <= NOT \bancoRegs|registrador~1341_combout\;
\bancoRegs|ALT_INV_registrador~900_q\ <= NOT \bancoRegs|registrador~900_q\;
\bancoRegs|ALT_INV_registrador~388_q\ <= NOT \bancoRegs|registrador~388_q\;
\bancoRegs|ALT_INV_registrador~836_q\ <= NOT \bancoRegs|registrador~836_q\;
\bancoRegs|ALT_INV_registrador~324_q\ <= NOT \bancoRegs|registrador~324_q\;
\bancoRegs|ALT_INV_registrador~932_q\ <= NOT \bancoRegs|registrador~932_q\;
\bancoRegs|ALT_INV_registrador~420_q\ <= NOT \bancoRegs|registrador~420_q\;
\bancoRegs|ALT_INV_registrador~868_q\ <= NOT \bancoRegs|registrador~868_q\;
\bancoRegs|ALT_INV_registrador~356_q\ <= NOT \bancoRegs|registrador~356_q\;
\bancoRegs|ALT_INV_registrador~644_q\ <= NOT \bancoRegs|registrador~644_q\;
\bancoRegs|ALT_INV_registrador~132_q\ <= NOT \bancoRegs|registrador~132_q\;
\bancoRegs|ALT_INV_registrador~580_q\ <= NOT \bancoRegs|registrador~580_q\;
\bancoRegs|ALT_INV_registrador~68_q\ <= NOT \bancoRegs|registrador~68_q\;
\bancoRegs|ALT_INV_registrador~676_q\ <= NOT \bancoRegs|registrador~676_q\;
\bancoRegs|ALT_INV_registrador~164_q\ <= NOT \bancoRegs|registrador~164_q\;
\bancoRegs|ALT_INV_registrador~612_q\ <= NOT \bancoRegs|registrador~612_q\;
\bancoRegs|ALT_INV_registrador~100_q\ <= NOT \bancoRegs|registrador~100_q\;
\bancoRegs|ALT_INV_registrador~1332_combout\ <= NOT \bancoRegs|registrador~1332_combout\;
\bancoRegs|ALT_INV_registrador~899_q\ <= NOT \bancoRegs|registrador~899_q\;
\bancoRegs|ALT_INV_registrador~931_q\ <= NOT \bancoRegs|registrador~931_q\;
\bancoRegs|ALT_INV_registrador~643_q\ <= NOT \bancoRegs|registrador~643_q\;
\bancoRegs|ALT_INV_registrador~675_q\ <= NOT \bancoRegs|registrador~675_q\;
\bancoRegs|ALT_INV_registrador~387_q\ <= NOT \bancoRegs|registrador~387_q\;
\bancoRegs|ALT_INV_registrador~419_q\ <= NOT \bancoRegs|registrador~419_q\;
\bancoRegs|ALT_INV_registrador~131_q\ <= NOT \bancoRegs|registrador~131_q\;
\bancoRegs|ALT_INV_registrador~163_q\ <= NOT \bancoRegs|registrador~163_q\;
\bancoRegs|ALT_INV_registrador~835_q\ <= NOT \bancoRegs|registrador~835_q\;
\bancoRegs|ALT_INV_registrador~867_q\ <= NOT \bancoRegs|registrador~867_q\;
\bancoRegs|ALT_INV_registrador~579_q\ <= NOT \bancoRegs|registrador~579_q\;
\bancoRegs|ALT_INV_registrador~611_q\ <= NOT \bancoRegs|registrador~611_q\;
\bancoRegs|ALT_INV_registrador~323_q\ <= NOT \bancoRegs|registrador~323_q\;
\bancoRegs|ALT_INV_registrador~355_q\ <= NOT \bancoRegs|registrador~355_q\;
\bancoRegs|ALT_INV_registrador~67_q\ <= NOT \bancoRegs|registrador~67_q\;
\bancoRegs|ALT_INV_registrador~99_q\ <= NOT \bancoRegs|registrador~99_q\;
\bancoRegs|ALT_INV_registrador~1323_combout\ <= NOT \bancoRegs|registrador~1323_combout\;
\bancoRegs|ALT_INV_registrador~898_q\ <= NOT \bancoRegs|registrador~898_q\;
\bancoRegs|ALT_INV_registrador~386_q\ <= NOT \bancoRegs|registrador~386_q\;
\bancoRegs|ALT_INV_registrador~834_q\ <= NOT \bancoRegs|registrador~834_q\;
\bancoRegs|ALT_INV_registrador~322_q\ <= NOT \bancoRegs|registrador~322_q\;
\bancoRegs|ALT_INV_registrador~930_q\ <= NOT \bancoRegs|registrador~930_q\;
\bancoRegs|ALT_INV_registrador~418_q\ <= NOT \bancoRegs|registrador~418_q\;
\bancoRegs|ALT_INV_registrador~866_q\ <= NOT \bancoRegs|registrador~866_q\;
\bancoRegs|ALT_INV_registrador~354_q\ <= NOT \bancoRegs|registrador~354_q\;
\bancoRegs|ALT_INV_registrador~642_q\ <= NOT \bancoRegs|registrador~642_q\;
\bancoRegs|ALT_INV_registrador~130_q\ <= NOT \bancoRegs|registrador~130_q\;
\bancoRegs|ALT_INV_registrador~1154_combout\ <= NOT \bancoRegs|registrador~1154_combout\;
\bancoRegs|ALT_INV_registrador~1153_combout\ <= NOT \bancoRegs|registrador~1153_combout\;
\bancoRegs|ALT_INV_registrador~1152_combout\ <= NOT \bancoRegs|registrador~1152_combout\;
\bancoRegs|ALT_INV_registrador~1151_combout\ <= NOT \bancoRegs|registrador~1151_combout\;
\bancoRegs|ALT_INV_registrador~1150_combout\ <= NOT \bancoRegs|registrador~1150_combout\;
\bancoRegs|ALT_INV_registrador~1149_combout\ <= NOT \bancoRegs|registrador~1149_combout\;
\bancoRegs|ALT_INV_registrador~1148_combout\ <= NOT \bancoRegs|registrador~1148_combout\;
\bancoRegs|ALT_INV_registrador~1147_combout\ <= NOT \bancoRegs|registrador~1147_combout\;
\bancoRegs|ALT_INV_registrador~1142_combout\ <= NOT \bancoRegs|registrador~1142_combout\;
\bancoRegs|ALT_INV_registrador~1141_combout\ <= NOT \bancoRegs|registrador~1141_combout\;
\bancoRegs|ALT_INV_registrador~1140_combout\ <= NOT \bancoRegs|registrador~1140_combout\;
\bancoRegs|ALT_INV_registrador~1139_combout\ <= NOT \bancoRegs|registrador~1139_combout\;
\bancoRegs|ALT_INV_registrador~1138_combout\ <= NOT \bancoRegs|registrador~1138_combout\;
\bancoRegs|ALT_INV_registrador~1133_combout\ <= NOT \bancoRegs|registrador~1133_combout\;
\bancoRegs|ALT_INV_registrador~1132_combout\ <= NOT \bancoRegs|registrador~1132_combout\;
\bancoRegs|ALT_INV_registrador~1131_combout\ <= NOT \bancoRegs|registrador~1131_combout\;
\bancoRegs|ALT_INV_registrador~1130_combout\ <= NOT \bancoRegs|registrador~1130_combout\;
\bancoRegs|ALT_INV_registrador~1129_combout\ <= NOT \bancoRegs|registrador~1129_combout\;
\bancoRegs|ALT_INV_registrador~1124_combout\ <= NOT \bancoRegs|registrador~1124_combout\;
\bancoRegs|ALT_INV_registrador~1123_combout\ <= NOT \bancoRegs|registrador~1123_combout\;
\bancoRegs|ALT_INV_registrador~1122_combout\ <= NOT \bancoRegs|registrador~1122_combout\;
\bancoRegs|ALT_INV_registrador~1121_combout\ <= NOT \bancoRegs|registrador~1121_combout\;
\bancoRegs|ALT_INV_registrador~1120_combout\ <= NOT \bancoRegs|registrador~1120_combout\;
\ROM|ALT_INV_memROM~12_combout\ <= NOT \ROM|memROM~12_combout\;
\bancoRegs|ALT_INV_registrador~1111_combout\ <= NOT \bancoRegs|registrador~1111_combout\;
\bancoRegs|ALT_INV_registrador~1110_combout\ <= NOT \bancoRegs|registrador~1110_combout\;
\bancoRegs|ALT_INV_registrador~1109_combout\ <= NOT \bancoRegs|registrador~1109_combout\;
\bancoRegs|ALT_INV_registrador~1108_combout\ <= NOT \bancoRegs|registrador~1108_combout\;
\bancoRegs|ALT_INV_registrador~1107_combout\ <= NOT \bancoRegs|registrador~1107_combout\;
\ROM|ALT_INV_memROM~11_combout\ <= NOT \ROM|memROM~11_combout\;
\bancoRegs|ALT_INV_registrador~1102_combout\ <= NOT \bancoRegs|registrador~1102_combout\;
\bancoRegs|ALT_INV_registrador~1101_combout\ <= NOT \bancoRegs|registrador~1101_combout\;
\bancoRegs|ALT_INV_registrador~1100_combout\ <= NOT \bancoRegs|registrador~1100_combout\;
\bancoRegs|ALT_INV_registrador~1099_combout\ <= NOT \bancoRegs|registrador~1099_combout\;
\bancoRegs|ALT_INV_registrador~1098_combout\ <= NOT \bancoRegs|registrador~1098_combout\;
\ROM|ALT_INV_memROM~10_combout\ <= NOT \ROM|memROM~10_combout\;
\bancoRegs|ALT_INV_registrador~1093_combout\ <= NOT \bancoRegs|registrador~1093_combout\;
\bancoRegs|ALT_INV_registrador~1092_combout\ <= NOT \bancoRegs|registrador~1092_combout\;
\bancoRegs|ALT_INV_registrador~1091_combout\ <= NOT \bancoRegs|registrador~1091_combout\;
\bancoRegs|ALT_INV_registrador~1090_combout\ <= NOT \bancoRegs|registrador~1090_combout\;
\bancoRegs|ALT_INV_registrador~1089_combout\ <= NOT \bancoRegs|registrador~1089_combout\;
\ROM|ALT_INV_memROM~9_combout\ <= NOT \ROM|memROM~9_combout\;
\bancoRegs|ALT_INV_registrador~1084_combout\ <= NOT \bancoRegs|registrador~1084_combout\;
\bancoRegs|ALT_INV_registrador~1083_combout\ <= NOT \bancoRegs|registrador~1083_combout\;
\bancoRegs|ALT_INV_registrador~1082_combout\ <= NOT \bancoRegs|registrador~1082_combout\;
\bancoRegs|ALT_INV_registrador~1081_combout\ <= NOT \bancoRegs|registrador~1081_combout\;
\bancoRegs|ALT_INV_registrador~1080_combout\ <= NOT \bancoRegs|registrador~1080_combout\;
\bancoRegs|ALT_INV_registrador~1075_combout\ <= NOT \bancoRegs|registrador~1075_combout\;
\bancoRegs|ALT_INV_registrador~1074_combout\ <= NOT \bancoRegs|registrador~1074_combout\;
\bancoRegs|ALT_INV_registrador~1073_combout\ <= NOT \bancoRegs|registrador~1073_combout\;
\bancoRegs|ALT_INV_registrador~1072_combout\ <= NOT \bancoRegs|registrador~1072_combout\;
\bancoRegs|ALT_INV_registrador~1071_combout\ <= NOT \bancoRegs|registrador~1071_combout\;
\ROM|ALT_INV_memROM~8_combout\ <= NOT \ROM|memROM~8_combout\;
\ROM|ALT_INV_memROM~7_combout\ <= NOT \ROM|memROM~7_combout\;
\bancoRegs|ALT_INV_registrador~1066_combout\ <= NOT \bancoRegs|registrador~1066_combout\;
\ROM|ALT_INV_memROM~6_combout\ <= NOT \ROM|memROM~6_combout\;
\ROM|ALT_INV_memROM~5_combout\ <= NOT \ROM|memROM~5_combout\;
\bancoRegs|ALT_INV_registrador~1065_combout\ <= NOT \bancoRegs|registrador~1065_combout\;
\bancoRegs|ALT_INV_registrador~1064_combout\ <= NOT \bancoRegs|registrador~1064_combout\;
\bancoRegs|ALT_INV_registrador~1063_combout\ <= NOT \bancoRegs|registrador~1063_combout\;
\bancoRegs|ALT_INV_registrador~1062_combout\ <= NOT \bancoRegs|registrador~1062_combout\;
\ROM|ALT_INV_memROM~4_combout\ <= NOT \ROM|memROM~4_combout\;
\ROM|ALT_INV_memROM~3_combout\ <= NOT \ROM|memROM~3_combout\;
\ROM|ALT_INV_memROM~2_combout\ <= NOT \ROM|memROM~2_combout\;
\ROM|ALT_INV_memROM~1_combout\ <= NOT \ROM|memROM~1_combout\;
\ROM|ALT_INV_memROM~0_combout\ <= NOT \ROM|memROM~0_combout\;
\PC_entity|ALT_INV_DOUT\(31) <= NOT \PC_entity|DOUT\(31);
\PC_entity|ALT_INV_DOUT\(30) <= NOT \PC_entity|DOUT\(30);
\PC_entity|ALT_INV_DOUT\(29) <= NOT \PC_entity|DOUT\(29);
\PC_entity|ALT_INV_DOUT\(28) <= NOT \PC_entity|DOUT\(28);
\bancoRegs|ALT_INV_registrador~1492_combout\ <= NOT \bancoRegs|registrador~1492_combout\;
\bancoRegs|ALT_INV_registrador~1488_combout\ <= NOT \bancoRegs|registrador~1488_combout\;
\bancoRegs|ALT_INV_registrador~1484_combout\ <= NOT \bancoRegs|registrador~1484_combout\;
\bancoRegs|ALT_INV_registrador~1480_combout\ <= NOT \bancoRegs|registrador~1480_combout\;
\bancoRegs|ALT_INV_registrador~1476_combout\ <= NOT \bancoRegs|registrador~1476_combout\;
\bancoRegs|ALT_INV_registrador~1472_combout\ <= NOT \bancoRegs|registrador~1472_combout\;
\bancoRegs|ALT_INV_registrador~1468_combout\ <= NOT \bancoRegs|registrador~1468_combout\;
\bancoRegs|ALT_INV_registrador~1464_combout\ <= NOT \bancoRegs|registrador~1464_combout\;
\bancoRegs|ALT_INV_registrador~1460_combout\ <= NOT \bancoRegs|registrador~1460_combout\;
\bancoRegs|ALT_INV_registrador~1456_combout\ <= NOT \bancoRegs|registrador~1456_combout\;
\bancoRegs|ALT_INV_registrador~1452_combout\ <= NOT \bancoRegs|registrador~1452_combout\;
\bancoRegs|ALT_INV_registrador~1448_combout\ <= NOT \bancoRegs|registrador~1448_combout\;
\bancoRegs|ALT_INV_registrador~1444_combout\ <= NOT \bancoRegs|registrador~1444_combout\;
\bancoRegs|ALT_INV_registrador~1440_combout\ <= NOT \bancoRegs|registrador~1440_combout\;
\bancoRegs|ALT_INV_registrador~1436_combout\ <= NOT \bancoRegs|registrador~1436_combout\;
\bancoRegs|ALT_INV_registrador~1432_combout\ <= NOT \bancoRegs|registrador~1432_combout\;
\bancoRegs|ALT_INV_registrador~1428_combout\ <= NOT \bancoRegs|registrador~1428_combout\;
\bancoRegs|ALT_INV_registrador~1424_combout\ <= NOT \bancoRegs|registrador~1424_combout\;
\bancoRegs|ALT_INV_registrador~1420_combout\ <= NOT \bancoRegs|registrador~1420_combout\;
\bancoRegs|ALT_INV_registrador~1416_combout\ <= NOT \bancoRegs|registrador~1416_combout\;
\bancoRegs|ALT_INV_registrador~1412_combout\ <= NOT \bancoRegs|registrador~1412_combout\;
\bancoRegs|ALT_INV_registrador~1408_combout\ <= NOT \bancoRegs|registrador~1408_combout\;
\bancoRegs|ALT_INV_registrador~1404_combout\ <= NOT \bancoRegs|registrador~1404_combout\;
\bancoRegs|ALT_INV_registrador~1400_combout\ <= NOT \bancoRegs|registrador~1400_combout\;
\bancoRegs|ALT_INV_registrador~1396_combout\ <= NOT \bancoRegs|registrador~1396_combout\;
\bancoRegs|ALT_INV_registrador~1392_combout\ <= NOT \bancoRegs|registrador~1392_combout\;
\bancoRegs|ALT_INV_registrador~1388_combout\ <= NOT \bancoRegs|registrador~1388_combout\;
\bancoRegs|ALT_INV_registrador~1384_combout\ <= NOT \bancoRegs|registrador~1384_combout\;
\bancoRegs|ALT_INV_registrador~1380_combout\ <= NOT \bancoRegs|registrador~1380_combout\;
\bancoRegs|ALT_INV_registrador~1352_combout\ <= NOT \bancoRegs|registrador~1352_combout\;
\bancoRegs|ALT_INV_registrador~1350_combout\ <= NOT \bancoRegs|registrador~1350_combout\;
\mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\ <= NOT \mux_rt_rd|saida_MUX[3]~2_combout\;
\mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\ <= NOT \mux_rt_rd|saida_MUX[4]~1_combout\;
\mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\ <= NOT \mux_rt_rd|saida_MUX[0]~0_combout\;
\ROM|ALT_INV_memROM~21_combout\ <= NOT \ROM|memROM~21_combout\;
\ROM|ALT_INV_memROM~20_combout\ <= NOT \ROM|memROM~20_combout\;
\bancoRegs|ALT_INV_registrador~1349_combout\ <= NOT \bancoRegs|registrador~1349_combout\;
\bancoRegs|ALT_INV_registrador~1348_combout\ <= NOT \bancoRegs|registrador~1348_combout\;
\bancoRegs|ALT_INV_registrador~1347_combout\ <= NOT \bancoRegs|registrador~1347_combout\;
\bancoRegs|ALT_INV_registrador~1346_combout\ <= NOT \bancoRegs|registrador~1346_combout\;
\bancoRegs|ALT_INV_registrador~1345_combout\ <= NOT \bancoRegs|registrador~1345_combout\;
\bancoRegs|ALT_INV_registrador~1340_combout\ <= NOT \bancoRegs|registrador~1340_combout\;
\bancoRegs|ALT_INV_registrador~1339_combout\ <= NOT \bancoRegs|registrador~1339_combout\;
\bancoRegs|ALT_INV_registrador~1338_combout\ <= NOT \bancoRegs|registrador~1338_combout\;
\bancoRegs|ALT_INV_registrador~1337_combout\ <= NOT \bancoRegs|registrador~1337_combout\;
\bancoRegs|ALT_INV_registrador~1336_combout\ <= NOT \bancoRegs|registrador~1336_combout\;
\bancoRegs|ALT_INV_registrador~1331_combout\ <= NOT \bancoRegs|registrador~1331_combout\;
\bancoRegs|ALT_INV_registrador~1330_combout\ <= NOT \bancoRegs|registrador~1330_combout\;
\bancoRegs|ALT_INV_registrador~1329_combout\ <= NOT \bancoRegs|registrador~1329_combout\;
\bancoRegs|ALT_INV_registrador~1328_combout\ <= NOT \bancoRegs|registrador~1328_combout\;
\bancoRegs|ALT_INV_registrador~1327_combout\ <= NOT \bancoRegs|registrador~1327_combout\;
\bancoRegs|ALT_INV_registrador~1322_combout\ <= NOT \bancoRegs|registrador~1322_combout\;
\bancoRegs|ALT_INV_registrador~1321_combout\ <= NOT \bancoRegs|registrador~1321_combout\;
\bancoRegs|ALT_INV_registrador~1320_combout\ <= NOT \bancoRegs|registrador~1320_combout\;
\bancoRegs|ALT_INV_registrador~1319_combout\ <= NOT \bancoRegs|registrador~1319_combout\;
\bancoRegs|ALT_INV_registrador~1318_combout\ <= NOT \bancoRegs|registrador~1318_combout\;
\bancoRegs|ALT_INV_registrador~1313_combout\ <= NOT \bancoRegs|registrador~1313_combout\;
\bancoRegs|ALT_INV_registrador~1312_combout\ <= NOT \bancoRegs|registrador~1312_combout\;
\bancoRegs|ALT_INV_registrador~1311_combout\ <= NOT \bancoRegs|registrador~1311_combout\;
\bancoRegs|ALT_INV_registrador~1310_combout\ <= NOT \bancoRegs|registrador~1310_combout\;
\bancoRegs|ALT_INV_registrador~1309_combout\ <= NOT \bancoRegs|registrador~1309_combout\;
\bancoRegs|ALT_INV_registrador~1304_combout\ <= NOT \bancoRegs|registrador~1304_combout\;
\bancoRegs|ALT_INV_registrador~1303_combout\ <= NOT \bancoRegs|registrador~1303_combout\;
\bancoRegs|ALT_INV_registrador~1302_combout\ <= NOT \bancoRegs|registrador~1302_combout\;
\bancoRegs|ALT_INV_registrador~1301_combout\ <= NOT \bancoRegs|registrador~1301_combout\;
\bancoRegs|ALT_INV_registrador~1300_combout\ <= NOT \bancoRegs|registrador~1300_combout\;
\bancoRegs|ALT_INV_registrador~1295_combout\ <= NOT \bancoRegs|registrador~1295_combout\;
\bancoRegs|ALT_INV_registrador~1294_combout\ <= NOT \bancoRegs|registrador~1294_combout\;
\bancoRegs|ALT_INV_registrador~1293_combout\ <= NOT \bancoRegs|registrador~1293_combout\;
\bancoRegs|ALT_INV_registrador~1292_combout\ <= NOT \bancoRegs|registrador~1292_combout\;
\bancoRegs|ALT_INV_registrador~1291_combout\ <= NOT \bancoRegs|registrador~1291_combout\;
\bancoRegs|ALT_INV_registrador~1286_combout\ <= NOT \bancoRegs|registrador~1286_combout\;
\bancoRegs|ALT_INV_registrador~1285_combout\ <= NOT \bancoRegs|registrador~1285_combout\;
\bancoRegs|ALT_INV_registrador~1284_combout\ <= NOT \bancoRegs|registrador~1284_combout\;
\bancoRegs|ALT_INV_registrador~1283_combout\ <= NOT \bancoRegs|registrador~1283_combout\;
\bancoRegs|ALT_INV_registrador~1282_combout\ <= NOT \bancoRegs|registrador~1282_combout\;
\bancoRegs|ALT_INV_registrador~1277_combout\ <= NOT \bancoRegs|registrador~1277_combout\;
\bancoRegs|ALT_INV_registrador~1276_combout\ <= NOT \bancoRegs|registrador~1276_combout\;
\bancoRegs|ALT_INV_registrador~1275_combout\ <= NOT \bancoRegs|registrador~1275_combout\;
\bancoRegs|ALT_INV_registrador~1274_combout\ <= NOT \bancoRegs|registrador~1274_combout\;
\bancoRegs|ALT_INV_registrador~1273_combout\ <= NOT \bancoRegs|registrador~1273_combout\;
\bancoRegs|ALT_INV_registrador~1268_combout\ <= NOT \bancoRegs|registrador~1268_combout\;
\bancoRegs|ALT_INV_registrador~1267_combout\ <= NOT \bancoRegs|registrador~1267_combout\;
\bancoRegs|ALT_INV_registrador~1266_combout\ <= NOT \bancoRegs|registrador~1266_combout\;
\bancoRegs|ALT_INV_registrador~1265_combout\ <= NOT \bancoRegs|registrador~1265_combout\;
\bancoRegs|ALT_INV_registrador~1264_combout\ <= NOT \bancoRegs|registrador~1264_combout\;
\bancoRegs|ALT_INV_registrador~1259_combout\ <= NOT \bancoRegs|registrador~1259_combout\;
\bancoRegs|ALT_INV_registrador~1258_combout\ <= NOT \bancoRegs|registrador~1258_combout\;
\bancoRegs|ALT_INV_registrador~1257_combout\ <= NOT \bancoRegs|registrador~1257_combout\;
\bancoRegs|ALT_INV_registrador~1256_combout\ <= NOT \bancoRegs|registrador~1256_combout\;
\bancoRegs|ALT_INV_registrador~1255_combout\ <= NOT \bancoRegs|registrador~1255_combout\;
\bancoRegs|ALT_INV_registrador~1250_combout\ <= NOT \bancoRegs|registrador~1250_combout\;
\bancoRegs|ALT_INV_registrador~1249_combout\ <= NOT \bancoRegs|registrador~1249_combout\;
\bancoRegs|ALT_INV_registrador~1248_combout\ <= NOT \bancoRegs|registrador~1248_combout\;
\bancoRegs|ALT_INV_registrador~1247_combout\ <= NOT \bancoRegs|registrador~1247_combout\;
\bancoRegs|ALT_INV_registrador~1246_combout\ <= NOT \bancoRegs|registrador~1246_combout\;
\bancoRegs|ALT_INV_registrador~1241_combout\ <= NOT \bancoRegs|registrador~1241_combout\;
\bancoRegs|ALT_INV_registrador~1240_combout\ <= NOT \bancoRegs|registrador~1240_combout\;
\bancoRegs|ALT_INV_registrador~1239_combout\ <= NOT \bancoRegs|registrador~1239_combout\;
\bancoRegs|ALT_INV_registrador~1238_combout\ <= NOT \bancoRegs|registrador~1238_combout\;
\bancoRegs|ALT_INV_registrador~1237_combout\ <= NOT \bancoRegs|registrador~1237_combout\;
\bancoRegs|ALT_INV_registrador~1232_combout\ <= NOT \bancoRegs|registrador~1232_combout\;
\bancoRegs|ALT_INV_registrador~1231_combout\ <= NOT \bancoRegs|registrador~1231_combout\;
\bancoRegs|ALT_INV_registrador~1230_combout\ <= NOT \bancoRegs|registrador~1230_combout\;
\bancoRegs|ALT_INV_registrador~1229_combout\ <= NOT \bancoRegs|registrador~1229_combout\;
\bancoRegs|ALT_INV_registrador~1228_combout\ <= NOT \bancoRegs|registrador~1228_combout\;
\bancoRegs|ALT_INV_registrador~1223_combout\ <= NOT \bancoRegs|registrador~1223_combout\;
\bancoRegs|ALT_INV_registrador~1222_combout\ <= NOT \bancoRegs|registrador~1222_combout\;
\bancoRegs|ALT_INV_registrador~1221_combout\ <= NOT \bancoRegs|registrador~1221_combout\;
\bancoRegs|ALT_INV_registrador~1220_combout\ <= NOT \bancoRegs|registrador~1220_combout\;
\bancoRegs|ALT_INV_registrador~1219_combout\ <= NOT \bancoRegs|registrador~1219_combout\;
\bancoRegs|ALT_INV_registrador~1214_combout\ <= NOT \bancoRegs|registrador~1214_combout\;
\bancoRegs|ALT_INV_registrador~1213_combout\ <= NOT \bancoRegs|registrador~1213_combout\;
\bancoRegs|ALT_INV_registrador~1212_combout\ <= NOT \bancoRegs|registrador~1212_combout\;
\bancoRegs|ALT_INV_registrador~1211_combout\ <= NOT \bancoRegs|registrador~1211_combout\;
\bancoRegs|ALT_INV_registrador~1210_combout\ <= NOT \bancoRegs|registrador~1210_combout\;
\bancoRegs|ALT_INV_registrador~1205_combout\ <= NOT \bancoRegs|registrador~1205_combout\;
\bancoRegs|ALT_INV_registrador~1204_combout\ <= NOT \bancoRegs|registrador~1204_combout\;
\bancoRegs|ALT_INV_registrador~1203_combout\ <= NOT \bancoRegs|registrador~1203_combout\;
\bancoRegs|ALT_INV_registrador~1202_combout\ <= NOT \bancoRegs|registrador~1202_combout\;
\bancoRegs|ALT_INV_registrador~1201_combout\ <= NOT \bancoRegs|registrador~1201_combout\;
\ROM|ALT_INV_memROM~16_combout\ <= NOT \ROM|memROM~16_combout\;
\bancoRegs|ALT_INV_registrador~1196_combout\ <= NOT \bancoRegs|registrador~1196_combout\;
\bancoRegs|ALT_INV_registrador~1195_combout\ <= NOT \bancoRegs|registrador~1195_combout\;
\bancoRegs|ALT_INV_registrador~1194_combout\ <= NOT \bancoRegs|registrador~1194_combout\;
\bancoRegs|ALT_INV_registrador~1193_combout\ <= NOT \bancoRegs|registrador~1193_combout\;
\bancoRegs|ALT_INV_registrador~1192_combout\ <= NOT \bancoRegs|registrador~1192_combout\;
\ROM|ALT_INV_memROM~15_combout\ <= NOT \ROM|memROM~15_combout\;
\bancoRegs|ALT_INV_registrador~1187_combout\ <= NOT \bancoRegs|registrador~1187_combout\;
\bancoRegs|ALT_INV_registrador~1186_combout\ <= NOT \bancoRegs|registrador~1186_combout\;
\bancoRegs|ALT_INV_registrador~1185_combout\ <= NOT \bancoRegs|registrador~1185_combout\;
\bancoRegs|ALT_INV_registrador~1184_combout\ <= NOT \bancoRegs|registrador~1184_combout\;
\bancoRegs|ALT_INV_registrador~1183_combout\ <= NOT \bancoRegs|registrador~1183_combout\;
\bancoRegs|ALT_INV_registrador~1178_combout\ <= NOT \bancoRegs|registrador~1178_combout\;
\bancoRegs|ALT_INV_registrador~1177_combout\ <= NOT \bancoRegs|registrador~1177_combout\;
\bancoRegs|ALT_INV_registrador~1176_combout\ <= NOT \bancoRegs|registrador~1176_combout\;
\bancoRegs|ALT_INV_registrador~1175_combout\ <= NOT \bancoRegs|registrador~1175_combout\;
\bancoRegs|ALT_INV_registrador~1174_combout\ <= NOT \bancoRegs|registrador~1174_combout\;
\ROM|ALT_INV_memROM~14_combout\ <= NOT \ROM|memROM~14_combout\;
\ROM|ALT_INV_memROM~13_combout\ <= NOT \ROM|memROM~13_combout\;
\bancoRegs|ALT_INV_registrador~1165_combout\ <= NOT \bancoRegs|registrador~1165_combout\;
\bancoRegs|ALT_INV_registrador~1164_combout\ <= NOT \bancoRegs|registrador~1164_combout\;
\bancoRegs|ALT_INV_registrador~1163_combout\ <= NOT \bancoRegs|registrador~1163_combout\;
\bancoRegs|ALT_INV_registrador~1162_combout\ <= NOT \bancoRegs|registrador~1162_combout\;
\bancoRegs|ALT_INV_registrador~1161_combout\ <= NOT \bancoRegs|registrador~1161_combout\;
\UC|ALT_INV_sel_mux3~0_combout\ <= NOT \UC|sel_mux3~0_combout\;
\bancoRegs|ALT_INV_registrador~1156_combout\ <= NOT \bancoRegs|registrador~1156_combout\;
\bancoRegs|ALT_INV_registrador~1155_combout\ <= NOT \bancoRegs|registrador~1155_combout\;
\UC|ALT_INV_sel_mux3~1_combout\ <= NOT \UC|sel_mux3~1_combout\;

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

\ROM|memROM~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~10_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(2) & (\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) # (\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & \PC_entity|DOUT\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001001000000000000000000000000000010010000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~10_combout\);

\ROM|memROM~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~18_combout\ = (!\PC_entity|DOUT\(7) & \ROM|memROM~10_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \ROM|ALT_INV_memROM~10_combout\,
	combout => \ROM|memROM~18_combout\);

\PC_entity|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~13_sumout\,
	asdata => \ROM|memROM~18_combout\,
	sload => \UC|Equal7~0_combout\,
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

\ROM|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~5_combout\ = ( !\PC_entity|DOUT\(4) & ( \PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(3)))) ) ) ) # ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & 
-- (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000100010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~5_combout\);

\PC_entity|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~17_sumout\,
	asdata => \ROM|memROM~5_combout\,
	sload => \UC|Equal7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(6));

\PC_Soma_Constante|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~21_sumout\ = SUM(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))
-- \PC_Soma_Constante|Add0~22\ = CARRY(( \PC_entity|DOUT\(7) ) + ( GND ) + ( \PC_Soma_Constante|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(7),
	cin => \PC_Soma_Constante|Add0~18\,
	sumout => \PC_Soma_Constante|Add0~21_sumout\,
	cout => \PC_Soma_Constante|Add0~22\);

\ROM|memROM~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~12_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & ((\PC_entity|DOUT\(3)) # (\PC_entity|DOUT\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000000000000000000000001110000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~12_combout\);

\ROM|memROM~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~19_combout\ = (!\PC_entity|DOUT\(7) & \ROM|memROM~12_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \ROM|ALT_INV_memROM~12_combout\,
	combout => \ROM|memROM~19_combout\);

\PC_entity|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~21_sumout\,
	asdata => \ROM|memROM~19_combout\,
	sload => \UC|Equal7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(7));

\ROM|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~1_combout\ = (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & ((\PC_entity|DOUT\(3)) # (\PC_entity|DOUT\(2))))) # (\PC_entity|DOUT\(4) & (((\PC_entity|DOUT\(5)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000001111011100000000111101110000000011110111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~1_combout\);

\ROM|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~2_combout\ = ((\ROM|memROM~1_combout\) # (\PC_entity|DOUT\(6))) # (\PC_entity|DOUT\(7))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~1_combout\,
	combout => \ROM|memROM~2_combout\);

\ROM|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~7_combout\ = (!\PC_entity|DOUT\(2) & (\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) $ (\PC_entity|DOUT\(5))))) # (\PC_entity|DOUT\(2) & ((!\PC_entity|DOUT\(4) $ (\PC_entity|DOUT\(5)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000111011100000000011101110000000001110111000000000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~7_combout\);

\ROM|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~8_combout\ = ((\ROM|memROM~7_combout\) # (\PC_entity|DOUT\(6))) # (\PC_entity|DOUT\(7))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~7_combout\,
	combout => \ROM|memROM~8_combout\);

\UC|Equal7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal7~0_combout\ = (!\ROM|memROM~0_combout\ & (\ROM|memROM~2_combout\ & !\ROM|memROM~8_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000000100000001000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	combout => \UC|Equal7~0_combout\);

\PC_entity|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~1_sumout\,
	sclr => \UC|Equal7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(2));

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

\PC_entity|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~5_sumout\,
	sclr => \UC|Equal7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(3));

\ROM|memROM~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~9_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(2) & (\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & \PC_entity|DOUT\(5)))) # (\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100000000000000000000000000100001000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~9_combout\);

\ROM|memROM~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~17_combout\ = (!\PC_entity|DOUT\(7) & \ROM|memROM~9_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \ROM|ALT_INV_memROM~9_combout\,
	combout => \ROM|memROM~17_combout\);

\PC_entity|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~9_sumout\,
	asdata => \ROM|memROM~17_combout\,
	sload => \UC|Equal7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC_entity|DOUT\(4));

\ROM|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~0_combout\ = (\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(7) & !\PC_entity|DOUT\(6))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(4),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(7),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~0_combout\);

\UC|Equal7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Equal7~1_combout\ = (!\ROM|memROM~0_combout\ & (!\ROM|memROM~2_combout\ & !\ROM|memROM~8_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	combout => \UC|Equal7~1_combout\);

\UC|sel_mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|sel_mux3~1_combout\ = (!\PC_entity|DOUT\(5) & (\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(6) & !\PC_entity|DOUT\(7))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000001000000000000000100000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(5),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(6),
	datad => \PC_entity|ALT_INV_DOUT\(7),
	combout => \UC|sel_mux3~1_combout\);

\UC|sel_mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|sel_mux4~0_combout\ = (!\ROM|memROM~2_combout\ & ((\ROM|memROM~8_combout\))) # (\ROM|memROM~2_combout\ & ((!\ROM|memROM~8_combout\) # (\ROM|memROM~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110100111101001111010011110100111101001111010011110100111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~8_combout\,
	combout => \UC|sel_mux4~0_combout\);

\ROM|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~6_combout\ = ( \PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(6))) ) ) # ( !\PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(5) & !\PC_entity|DOUT\(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000100010000000000010100000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(4),
	datac => \PC_entity|ALT_INV_DOUT\(5),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	datae => \PC_entity|ALT_INV_DOUT\(2),
	combout => \ROM|memROM~6_combout\);

\ROM|memROM~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~13_combout\ = ( \PC_entity|DOUT\(3) & ( (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(7) & !\PC_entity|DOUT\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(4),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(7),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	datae => \PC_entity|ALT_INV_DOUT\(3),
	combout => \ROM|memROM~13_combout\);

\ROM|memROM~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~14_combout\ = (!\PC_entity|DOUT\(2) & \ROM|memROM~13_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \ROM|ALT_INV_memROM~13_combout\,
	combout => \ROM|memROM~14_combout\);

\mux_rt_rd|saida_MUX[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_rd|saida_MUX[0]~0_combout\ = ( \ROM|memROM~14_combout\ & ( ((!\ROM|memROM~0_combout\ & (\ROM|memROM~2_combout\ & \ROM|memROM~8_combout\))) # (\ROM|memROM~6_combout\) ) ) # ( !\ROM|memROM~14_combout\ & ( (\ROM|memROM~6_combout\ & 
-- (((!\ROM|memROM~2_combout\) # (!\ROM|memROM~8_combout\)) # (\ROM|memROM~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001101000011110010111100001111000011010000111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~6_combout\,
	datad => \ROM|ALT_INV_memROM~8_combout\,
	datae => \ROM|ALT_INV_memROM~14_combout\,
	combout => \mux_rt_rd|saida_MUX[0]~0_combout\);

\ROM|memROM~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~16_combout\ = (\PC_entity|DOUT\(2) & \ROM|memROM~13_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \ROM|ALT_INV_memROM~13_combout\,
	combout => \ROM|memROM~16_combout\);

\mux_rt_rd|saida_MUX[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_rd|saida_MUX[4]~1_combout\ = ( \ROM|memROM~16_combout\ & ( ((!\ROM|memROM~0_combout\ & (\ROM|memROM~2_combout\ & \ROM|memROM~8_combout\))) # (\ROM|memROM~5_combout\) ) ) # ( !\ROM|memROM~16_combout\ & ( (\ROM|memROM~5_combout\ & 
-- (((!\ROM|memROM~2_combout\) # (!\ROM|memROM~8_combout\)) # (\ROM|memROM~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001101000011110010111100001111000011010000111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~5_combout\,
	datad => \ROM|ALT_INV_memROM~8_combout\,
	datae => \ROM|ALT_INV_memROM~16_combout\,
	combout => \mux_rt_rd|saida_MUX[4]~1_combout\);

\ROM|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~4_combout\ = ( !\PC_entity|DOUT\(4) & ( \PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) $ (!\PC_entity|DOUT\(3))))) ) ) ) # ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) 
-- & (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) $ (!\PC_entity|DOUT\(3))))) ) ) ) # ( !\PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000010001000000000001000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~4_combout\);

\ROM|memROM~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~15_combout\ = ( !\PC_entity|DOUT\(7) & ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(2) $ (!\PC_entity|DOUT\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(7),
	dataf => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~15_combout\);

\mux_rt_rd|saida_MUX[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mux_rt_rd|saida_MUX[3]~2_combout\ = ( \ROM|memROM~15_combout\ & ( ((!\ROM|memROM~0_combout\ & (\ROM|memROM~2_combout\ & \ROM|memROM~8_combout\))) # (\ROM|memROM~4_combout\) ) ) # ( !\ROM|memROM~15_combout\ & ( (\ROM|memROM~4_combout\ & 
-- (((!\ROM|memROM~2_combout\) # (!\ROM|memROM~8_combout\)) # (\ROM|memROM~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001101000011110010111100001111000011010000111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~4_combout\,
	datad => \ROM|ALT_INV_memROM~8_combout\,
	datae => \ROM|ALT_INV_memROM~15_combout\,
	combout => \mux_rt_rd|saida_MUX[3]~2_combout\);

\ROM|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~3_combout\ = ( !\PC_entity|DOUT\(4) & ( \PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (\PC_entity|DOUT\(2) & \PC_entity|DOUT\(3)))) ) ) ) # ( \PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & 
-- (!\PC_entity|DOUT\(6) & (!\PC_entity|DOUT\(2) & !\PC_entity|DOUT\(3)))) ) ) ) # ( !\PC_entity|DOUT\(4) & ( !\PC_entity|DOUT\(5) & ( (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & ((!\PC_entity|DOUT\(2)) # (!\PC_entity|DOUT\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010000000100000000000000000000000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \PC_entity|ALT_INV_DOUT\(2),
	datad => \PC_entity|ALT_INV_DOUT\(3),
	datae => \PC_entity|ALT_INV_DOUT\(4),
	dataf => \PC_entity|ALT_INV_DOUT\(5),
	combout => \ROM|memROM~3_combout\);

\bancoRegs|registrador~1350\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1350_combout\ = (!\ROM|memROM~0_combout\ & ((!\ROM|memROM~2_combout\ & (!\ROM|memROM~3_combout\ & !\ROM|memROM~8_combout\)) # (\ROM|memROM~2_combout\ & ((\ROM|memROM~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000100010100000000010001010000000001000101000000000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~8_combout\,
	combout => \bancoRegs|registrador~1350_combout\);

\bancoRegs|registrador~1351\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1351_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1351_combout\);

\bancoRegs|registrador~76\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~76_q\);

\bancoRegs|registrador~1356\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1356_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000001000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1356_combout\);

\bancoRegs|registrador~588\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~588_q\);

\bancoRegs|registrador~1352\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1352_combout\ = (!\ROM|memROM~0_combout\ & (!\ROM|memROM~2_combout\ & (\ROM|memROM~3_combout\ & !\ROM|memROM~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000001000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \ROM|ALT_INV_memROM~3_combout\,
	datad => \ROM|ALT_INV_memROM~8_combout\,
	combout => \bancoRegs|registrador~1352_combout\);

\bancoRegs|registrador~1353\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1353_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1353_combout\);

\bancoRegs|registrador~140\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~140_q\);

\bancoRegs|registrador~1357\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1357_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000001000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1357_combout\);

\bancoRegs|registrador~652\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~652_q\);

\bancoRegs|registrador~1120\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1120_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~652_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~140_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~588_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~76_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~76_q\,
	datab => \bancoRegs|ALT_INV_registrador~588_q\,
	datac => \bancoRegs|ALT_INV_registrador~140_q\,
	datad => \bancoRegs|ALT_INV_registrador~652_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1120_combout\);

\bancoRegs|registrador~1360\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1360_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1360_combout\);

\bancoRegs|registrador~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~44_q\);

\bancoRegs|registrador~1364\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1364_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000010000000000000001000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1364_combout\);

\bancoRegs|registrador~556\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~556_q\);

\bancoRegs|registrador~1361\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1361_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000001000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1361_combout\);

\bancoRegs|registrador~108\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~108_q\);

\bancoRegs|registrador~1365\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1365_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (!\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000010000000000000001000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1365_combout\);

\bancoRegs|registrador~620\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~620_q\);

\bancoRegs|registrador~1121\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1121_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~620_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~108_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~556_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~44_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~44_q\,
	datab => \bancoRegs|ALT_INV_registrador~556_q\,
	datac => \bancoRegs|ALT_INV_registrador~108_q\,
	datad => \bancoRegs|ALT_INV_registrador~620_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1121_combout\);

\bancoRegs|registrador~1358\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1358_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1358_combout\);

\bancoRegs|registrador~844\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~844_q\);

\bancoRegs|registrador~1355\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1355_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000001000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1355_combout\);

\bancoRegs|registrador~396\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~396_q\);

\bancoRegs|registrador~1359\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1359_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1359_combout\);

\bancoRegs|registrador~908\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~908_q\);

\bancoRegs|registrador~1122\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1122_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~908_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~396_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~844_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~332_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~332_q\,
	datab => \bancoRegs|ALT_INV_registrador~844_q\,
	datac => \bancoRegs|ALT_INV_registrador~396_q\,
	datad => \bancoRegs|ALT_INV_registrador~908_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1122_combout\);

\bancoRegs|registrador~1362\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1362_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000100000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1362_combout\);

\bancoRegs|registrador~300\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~300_q\);

\bancoRegs|registrador~1366\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1366_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000000000000000100000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1366_combout\);

\bancoRegs|registrador~812\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~812_q\);

\bancoRegs|registrador~1363\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1363_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000100000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1363_combout\);

\bancoRegs|registrador~364\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~364_q\);

\bancoRegs|registrador~1367\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1367_combout\ = (!\mux_rt_rd|saida_MUX[0]~0_combout\ & (\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1352_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000000000000000100000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1352_combout\,
	combout => \bancoRegs|registrador~1367_combout\);

\bancoRegs|registrador~876\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~876_q\);

\bancoRegs|registrador~1123\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1123_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~876_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~364_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~812_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~300_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~300_q\,
	datab => \bancoRegs|ALT_INV_registrador~812_q\,
	datac => \bancoRegs|ALT_INV_registrador~364_q\,
	datad => \bancoRegs|ALT_INV_registrador~876_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1123_combout\);

\bancoRegs|registrador~1124\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1124_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1122_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1123_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1120_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1121_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1120_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1121_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1122_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1123_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1124_combout\);

\bancoRegs|registrador~77\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~77_q\);

\bancoRegs|registrador~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~301_q\);

\bancoRegs|registrador~1129\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1129_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~333_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~301_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~77_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~45_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~77_q\,
	datab => \bancoRegs|ALT_INV_registrador~45_q\,
	datac => \bancoRegs|ALT_INV_registrador~333_q\,
	datad => \bancoRegs|ALT_INV_registrador~301_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1129_combout\);

\bancoRegs|registrador~589\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~589_q\);

\bancoRegs|registrador~557\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~557_q\);

\bancoRegs|registrador~845\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~845_q\);

\bancoRegs|registrador~813\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~813_q\);

\bancoRegs|registrador~1130\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1130_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~845_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~813_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~589_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~557_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~589_q\,
	datab => \bancoRegs|ALT_INV_registrador~557_q\,
	datac => \bancoRegs|ALT_INV_registrador~845_q\,
	datad => \bancoRegs|ALT_INV_registrador~813_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1130_combout\);

\bancoRegs|registrador~141\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~141_q\);

\bancoRegs|registrador~109\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~109_q\);

\bancoRegs|registrador~397\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~397_q\);

\bancoRegs|registrador~365\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~365_q\);

\bancoRegs|registrador~1131\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1131_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~397_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~365_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~141_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~109_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~141_q\,
	datab => \bancoRegs|ALT_INV_registrador~109_q\,
	datac => \bancoRegs|ALT_INV_registrador~397_q\,
	datad => \bancoRegs|ALT_INV_registrador~365_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1131_combout\);

\bancoRegs|registrador~653\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~653_q\);

\bancoRegs|registrador~621\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~621_q\);

\bancoRegs|registrador~909\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~909_q\);

\bancoRegs|registrador~877\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~877_q\);

\bancoRegs|registrador~1132\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1132_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~909_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~877_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~653_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~621_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~653_q\,
	datab => \bancoRegs|ALT_INV_registrador~621_q\,
	datac => \bancoRegs|ALT_INV_registrador~909_q\,
	datad => \bancoRegs|ALT_INV_registrador~877_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1132_combout\);

\bancoRegs|registrador~1133\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1133_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1132_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1131_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1130_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1129_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1129_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1130_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1131_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1132_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1133_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

\bancoRegs|registrador~1354\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1354_combout\ = (\mux_rt_rd|saida_MUX[0]~0_combout\ & (!\mux_rt_rd|saida_MUX[4]~1_combout\ & (\mux_rt_rd|saida_MUX[3]~2_combout\ & \bancoRegs|registrador~1350_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000001000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mux_rt_rd|ALT_INV_saida_MUX[0]~0_combout\,
	datab => \mux_rt_rd|ALT_INV_saida_MUX[4]~1_combout\,
	datac => \mux_rt_rd|ALT_INV_saida_MUX[3]~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1350_combout\,
	combout => \bancoRegs|registrador~1354_combout\);

\bancoRegs|registrador~333\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~29_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~333_q\);

\ROM|memROM~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~21_combout\ = ( \PC_entity|DOUT\(2) & ( !\PC_entity|DOUT\(3) & ( (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(7) & !\PC_entity|DOUT\(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(4),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(7),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	datae => \PC_entity|ALT_INV_DOUT\(2),
	dataf => \PC_entity|ALT_INV_DOUT\(3),
	combout => \ROM|memROM~21_combout\);

\ROM|memROM~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~20_combout\ = ( \PC_entity|DOUT\(2) & ( (!\PC_entity|DOUT\(4) & (!\PC_entity|DOUT\(5) & (!\PC_entity|DOUT\(7) & !\PC_entity|DOUT\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(4),
	datab => \PC_entity|ALT_INV_DOUT\(5),
	datac => \PC_entity|ALT_INV_DOUT\(7),
	datad => \PC_entity|ALT_INV_DOUT\(6),
	datae => \PC_entity|ALT_INV_DOUT\(2),
	combout => \ROM|memROM~20_combout\);

\bancoRegs|registrador~1396\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1396_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~45_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~77_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~109_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~141_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~77_q\,
	datab => \bancoRegs|ALT_INV_registrador~141_q\,
	datac => \bancoRegs|ALT_INV_registrador~109_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~45_q\,
	combout => \bancoRegs|registrador~1396_combout\);

\bancoRegs|registrador~1125\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1125_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1396_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1396_combout\ & ((\bancoRegs|registrador~301_q\))) # 
-- (\bancoRegs|registrador~1396_combout\ & (\bancoRegs|registrador~333_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1396_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1396_combout\ & 
-- ((\bancoRegs|registrador~365_q\))) # (\bancoRegs|registrador~1396_combout\ & (\bancoRegs|registrador~397_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~333_q\,
	datab => \bancoRegs|ALT_INV_registrador~397_q\,
	datac => \bancoRegs|ALT_INV_registrador~365_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1396_combout\,
	datag => \bancoRegs|ALT_INV_registrador~301_q\,
	combout => \bancoRegs|registrador~1125_combout\);

\bancoRegs|registrador~331\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~331_q\);

\bancoRegs|registrador~395\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~395_q\);

\bancoRegs|registrador~363\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~363_q\);

\bancoRegs|registrador~139\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~139_q\);

\bancoRegs|registrador~107\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~107_q\);

\bancoRegs|registrador~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~43_q\);

\bancoRegs|registrador~1388\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1388_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~43_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~75_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~107_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~139_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~75_q\,
	datab => \bancoRegs|ALT_INV_registrador~139_q\,
	datac => \bancoRegs|ALT_INV_registrador~107_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~43_q\,
	combout => \bancoRegs|registrador~1388_combout\);

\bancoRegs|registrador~299\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~299_q\);

\bancoRegs|registrador~1112\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1112_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1388_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1388_combout\ & ((\bancoRegs|registrador~299_q\))) # 
-- (\bancoRegs|registrador~1388_combout\ & (\bancoRegs|registrador~331_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1388_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1388_combout\ & 
-- ((\bancoRegs|registrador~363_q\))) # (\bancoRegs|registrador~1388_combout\ & (\bancoRegs|registrador~395_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~331_q\,
	datab => \bancoRegs|ALT_INV_registrador~395_q\,
	datac => \bancoRegs|ALT_INV_registrador~363_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1388_combout\,
	datag => \bancoRegs|ALT_INV_registrador~299_q\,
	combout => \bancoRegs|registrador~1112_combout\);

\bancoRegs|registrador~330\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~330_q\);

\bancoRegs|registrador~394\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~394_q\);

\bancoRegs|registrador~362\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~362_q\);

\bancoRegs|registrador~138\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~138_q\);

\bancoRegs|registrador~106\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~106_q\);

\bancoRegs|registrador~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~42_q\);

\bancoRegs|registrador~1384\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1384_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~42_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~74_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~106_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~138_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~74_q\,
	datab => \bancoRegs|ALT_INV_registrador~138_q\,
	datac => \bancoRegs|ALT_INV_registrador~106_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~42_q\,
	combout => \bancoRegs|registrador~1384_combout\);

\bancoRegs|registrador~298\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~298_q\);

\bancoRegs|registrador~1103\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1103_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1384_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1384_combout\ & ((\bancoRegs|registrador~298_q\))) # 
-- (\bancoRegs|registrador~1384_combout\ & (\bancoRegs|registrador~330_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1384_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1384_combout\ & 
-- ((\bancoRegs|registrador~362_q\))) # (\bancoRegs|registrador~1384_combout\ & (\bancoRegs|registrador~394_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~330_q\,
	datab => \bancoRegs|ALT_INV_registrador~394_q\,
	datac => \bancoRegs|ALT_INV_registrador~362_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1384_combout\,
	datag => \bancoRegs|ALT_INV_registrador~298_q\,
	combout => \bancoRegs|registrador~1103_combout\);

\ROM|memROM~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|memROM~11_combout\ = ( !\PC_entity|DOUT\(6) & ( (!\PC_entity|DOUT\(2) & (!\PC_entity|DOUT\(3) & (!\PC_entity|DOUT\(4) & \PC_entity|DOUT\(5)))) # (\PC_entity|DOUT\(2) & (\PC_entity|DOUT\(3) & (\PC_entity|DOUT\(4) & !\PC_entity|DOUT\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000110000000000000000000000000000001100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(2),
	datab => \PC_entity|ALT_INV_DOUT\(3),
	datac => \PC_entity|ALT_INV_DOUT\(4),
	datad => \PC_entity|ALT_INV_DOUT\(5),
	datae => \PC_entity|ALT_INV_DOUT\(6),
	combout => \ROM|memROM~11_combout\);

\bancoRegs|registrador~329\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~329_q\);

\bancoRegs|registrador~393\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~393_q\);

\bancoRegs|registrador~361\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~361_q\);

\bancoRegs|registrador~137\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~137_q\);

\bancoRegs|registrador~105\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~105_q\);

\bancoRegs|registrador~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~41_q\);

\bancoRegs|registrador~1380\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1380_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~41_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~73_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~105_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~137_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~73_q\,
	datab => \bancoRegs|ALT_INV_registrador~137_q\,
	datac => \bancoRegs|ALT_INV_registrador~105_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~41_q\,
	combout => \bancoRegs|registrador~1380_combout\);

\bancoRegs|registrador~297\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~297_q\);

\bancoRegs|registrador~1094\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1094_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1380_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1380_combout\ & ((\bancoRegs|registrador~297_q\))) # 
-- (\bancoRegs|registrador~1380_combout\ & (\bancoRegs|registrador~329_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1380_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1380_combout\ & 
-- ((\bancoRegs|registrador~361_q\))) # (\bancoRegs|registrador~1380_combout\ & (\bancoRegs|registrador~393_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~329_q\,
	datab => \bancoRegs|ALT_INV_registrador~393_q\,
	datac => \bancoRegs|ALT_INV_registrador~361_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1380_combout\,
	datag => \bancoRegs|ALT_INV_registrador~297_q\,
	combout => \bancoRegs|registrador~1094_combout\);

\bancoRegs|registrador~328\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~328_q\);

\bancoRegs|registrador~392\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~392_q\);

\bancoRegs|registrador~360\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~360_q\);

\bancoRegs|registrador~136\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~136_q\);

\bancoRegs|registrador~104\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~104_q\);

\bancoRegs|registrador~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~40_q\);

\bancoRegs|registrador~1376\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1376_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~40_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~72_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~104_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~136_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~72_q\,
	datab => \bancoRegs|ALT_INV_registrador~136_q\,
	datac => \bancoRegs|ALT_INV_registrador~104_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~40_q\,
	combout => \bancoRegs|registrador~1376_combout\);

\bancoRegs|registrador~296\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~296_q\);

\bancoRegs|registrador~1085\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1085_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1376_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1376_combout\ & ((\bancoRegs|registrador~296_q\))) # 
-- (\bancoRegs|registrador~1376_combout\ & (\bancoRegs|registrador~328_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1376_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1376_combout\ & 
-- ((\bancoRegs|registrador~360_q\))) # (\bancoRegs|registrador~1376_combout\ & (\bancoRegs|registrador~392_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~328_q\,
	datab => \bancoRegs|ALT_INV_registrador~392_q\,
	datac => \bancoRegs|ALT_INV_registrador~360_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1376_combout\,
	datag => \bancoRegs|ALT_INV_registrador~296_q\,
	combout => \bancoRegs|registrador~1085_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\bancoRegs|registrador~327\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~327_q\);

\bancoRegs|registrador~391\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~391_q\);

\bancoRegs|registrador~359\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~359_q\);

\bancoRegs|registrador~135\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~135_q\);

\bancoRegs|registrador~103\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~103_q\);

\bancoRegs|registrador~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~39_q\);

\bancoRegs|registrador~1372\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1372_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~39_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~71_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~103_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~135_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~71_q\,
	datab => \bancoRegs|ALT_INV_registrador~135_q\,
	datac => \bancoRegs|ALT_INV_registrador~103_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~39_q\,
	combout => \bancoRegs|registrador~1372_combout\);

\bancoRegs|registrador~295\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~295_q\);

\bancoRegs|registrador~1076\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1076_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1372_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1372_combout\ & ((\bancoRegs|registrador~295_q\))) # 
-- (\bancoRegs|registrador~1372_combout\ & (\bancoRegs|registrador~327_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1372_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1372_combout\ & 
-- ((\bancoRegs|registrador~359_q\))) # (\bancoRegs|registrador~1372_combout\ & (\bancoRegs|registrador~391_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~327_q\,
	datab => \bancoRegs|ALT_INV_registrador~391_q\,
	datac => \bancoRegs|ALT_INV_registrador~359_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1372_combout\,
	datag => \bancoRegs|ALT_INV_registrador~295_q\,
	combout => \bancoRegs|registrador~1076_combout\);

\bancoRegs|registrador~326\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~326_q\);

\bancoRegs|registrador~390\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~390_q\);

\bancoRegs|registrador~358\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~358_q\);

\bancoRegs|registrador~134\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~134_q\);

\bancoRegs|registrador~102\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~102_q\);

\bancoRegs|registrador~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~38_q\);

\bancoRegs|registrador~1368\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1368_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~38_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~70_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~102_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~134_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~70_q\,
	datab => \bancoRegs|ALT_INV_registrador~134_q\,
	datac => \bancoRegs|ALT_INV_registrador~102_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~38_q\,
	combout => \bancoRegs|registrador~1368_combout\);

\bancoRegs|registrador~294\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~294_q\);

\bancoRegs|registrador~1067\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1067_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1368_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1368_combout\ & ((\bancoRegs|registrador~294_q\))) # 
-- (\bancoRegs|registrador~1368_combout\ & (\bancoRegs|registrador~326_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1368_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1368_combout\ & 
-- ((\bancoRegs|registrador~358_q\))) # (\bancoRegs|registrador~1368_combout\ & (\bancoRegs|registrador~390_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~326_q\,
	datab => \bancoRegs|ALT_INV_registrador~390_q\,
	datac => \bancoRegs|ALT_INV_registrador~358_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1368_combout\,
	datag => \bancoRegs|ALT_INV_registrador~294_q\,
	combout => \bancoRegs|registrador~1067_combout\);

\ULA|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~1_sumout\ = SUM(( \bancoRegs|registrador~1067_combout\ ) + ( (\bancoRegs|registrador~1066_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~2_combout\ $ (!\ROM|memROM~8_combout\)))) ) + ( !VCC ))
-- \ULA|Add0~2\ = CARRY(( \bancoRegs|registrador~1067_combout\ ) + ( (\bancoRegs|registrador~1066_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~2_combout\ $ (!\ROM|memROM~8_combout\)))) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101001111000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1066_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1067_combout\,
	dataf => \ROM|ALT_INV_memROM~8_combout\,
	cin => GND,
	sumout => \ULA|Add0~1_sumout\,
	cout => \ULA|Add0~2\);

\ULA|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~5_sumout\ = SUM(( \bancoRegs|registrador~1076_combout\ ) + ( (\bancoRegs|registrador~1075_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~2_combout\ $ (!\ROM|memROM~8_combout\)))) ) + ( \ULA|Add0~2\ ))
-- \ULA|Add0~6\ = CARRY(( \bancoRegs|registrador~1076_combout\ ) + ( (\bancoRegs|registrador~1075_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~2_combout\ $ (!\ROM|memROM~8_combout\)))) ) + ( \ULA|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101001111000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~2_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1075_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1076_combout\,
	dataf => \ROM|ALT_INV_memROM~8_combout\,
	cin => \ULA|Add0~2\,
	sumout => \ULA|Add0~5_sumout\,
	cout => \ULA|Add0~6\);

\bancoRegs|registrador~71\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~71_q\);

\bancoRegs|registrador~1071\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1071_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~327_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~295_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~71_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~39_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~71_q\,
	datab => \bancoRegs|ALT_INV_registrador~39_q\,
	datac => \bancoRegs|ALT_INV_registrador~327_q\,
	datad => \bancoRegs|ALT_INV_registrador~295_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1071_combout\);

\bancoRegs|registrador~583\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~583_q\);

\bancoRegs|registrador~551\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~551_q\);

\bancoRegs|registrador~839\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~839_q\);

\bancoRegs|registrador~807\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~807_q\);

\bancoRegs|registrador~1072\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1072_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~839_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~807_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~583_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~551_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~583_q\,
	datab => \bancoRegs|ALT_INV_registrador~551_q\,
	datac => \bancoRegs|ALT_INV_registrador~839_q\,
	datad => \bancoRegs|ALT_INV_registrador~807_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1072_combout\);

\bancoRegs|registrador~1073\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1073_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~391_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~359_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~135_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~103_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~135_q\,
	datab => \bancoRegs|ALT_INV_registrador~103_q\,
	datac => \bancoRegs|ALT_INV_registrador~391_q\,
	datad => \bancoRegs|ALT_INV_registrador~359_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1073_combout\);

\bancoRegs|registrador~647\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~647_q\);

\bancoRegs|registrador~615\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~615_q\);

\bancoRegs|registrador~903\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~903_q\);

\bancoRegs|registrador~871\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~5_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~871_q\);

\bancoRegs|registrador~1074\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1074_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~903_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~871_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~647_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~615_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~647_q\,
	datab => \bancoRegs|ALT_INV_registrador~615_q\,
	datac => \bancoRegs|ALT_INV_registrador~903_q\,
	datad => \bancoRegs|ALT_INV_registrador~871_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1074_combout\);

\bancoRegs|registrador~1075\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1075_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1074_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1073_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1072_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1071_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1071_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1072_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1073_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1074_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1075_combout\);

\ULA|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~9_sumout\ = SUM(( \bancoRegs|registrador~1085_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1084_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~9_combout\)))) ) + ( \ULA|Add0~6\ ))
-- \ULA|Add0~10\ = CARRY(( \bancoRegs|registrador~1085_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1084_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~9_combout\)))) ) + ( \ULA|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011011000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_sel_mux3~1_combout\,
	datab => \PC_entity|ALT_INV_DOUT\(7),
	datac => \bancoRegs|ALT_INV_registrador~1084_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1085_combout\,
	dataf => \ROM|ALT_INV_memROM~9_combout\,
	cin => \ULA|Add0~6\,
	sumout => \ULA|Add0~9_sumout\,
	cout => \ULA|Add0~10\);

\ULA|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~13_sumout\ = SUM(( \bancoRegs|registrador~1094_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1093_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~10_combout\)))) ) + ( \ULA|Add0~10\ ))
-- \ULA|Add0~14\ = CARRY(( \bancoRegs|registrador~1094_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1093_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~10_combout\)))) ) + ( \ULA|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011011000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_sel_mux3~1_combout\,
	datab => \PC_entity|ALT_INV_DOUT\(7),
	datac => \bancoRegs|ALT_INV_registrador~1093_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1094_combout\,
	dataf => \ROM|ALT_INV_memROM~10_combout\,
	cin => \ULA|Add0~10\,
	sumout => \ULA|Add0~13_sumout\,
	cout => \ULA|Add0~14\);

\ULA|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~17_sumout\ = SUM(( \bancoRegs|registrador~1103_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1102_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~11_combout\)))) ) + ( \ULA|Add0~14\ ))
-- \ULA|Add0~18\ = CARRY(( \bancoRegs|registrador~1103_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1102_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~11_combout\)))) ) + ( \ULA|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011011000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_sel_mux3~1_combout\,
	datab => \PC_entity|ALT_INV_DOUT\(7),
	datac => \bancoRegs|ALT_INV_registrador~1102_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1103_combout\,
	dataf => \ROM|ALT_INV_memROM~11_combout\,
	cin => \ULA|Add0~14\,
	sumout => \ULA|Add0~17_sumout\,
	cout => \ULA|Add0~18\);

\ULA|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~21_sumout\ = SUM(( \bancoRegs|registrador~1112_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1111_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~12_combout\)))) ) + ( \ULA|Add0~18\ ))
-- \ULA|Add0~22\ = CARRY(( \bancoRegs|registrador~1112_combout\ ) + ( (!\UC|sel_mux3~1_combout\ & (((\bancoRegs|registrador~1111_combout\)))) # (\UC|sel_mux3~1_combout\ & (!\PC_entity|DOUT\(7) & ((\ROM|memROM~12_combout\)))) ) + ( \ULA|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011011000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_sel_mux3~1_combout\,
	datab => \PC_entity|ALT_INV_DOUT\(7),
	datac => \bancoRegs|ALT_INV_registrador~1111_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1112_combout\,
	dataf => \ROM|ALT_INV_memROM~12_combout\,
	cin => \ULA|Add0~18\,
	sumout => \ULA|Add0~21_sumout\,
	cout => \ULA|Add0~22\);

\ULA|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~25_sumout\ = SUM(( \bancoRegs|registrador~1116_combout\ ) + ( (\bancoRegs|registrador~1124_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~22\ ))
-- \ULA|Add0~26\ = CARRY(( \bancoRegs|registrador~1116_combout\ ) + ( (\bancoRegs|registrador~1124_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \ROM|ALT_INV_memROM~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1116_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1124_combout\,
	cin => \ULA|Add0~22\,
	sumout => \ULA|Add0~25_sumout\,
	cout => \ULA|Add0~26\);

\ULA|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~29_sumout\ = SUM(( \bancoRegs|registrador~1125_combout\ ) + ( (\bancoRegs|registrador~1133_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~26\ ))
-- \ULA|Add0~30\ = CARRY(( \bancoRegs|registrador~1125_combout\ ) + ( (\bancoRegs|registrador~1133_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \ROM|ALT_INV_memROM~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1125_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1133_combout\,
	cin => \ULA|Add0~26\,
	sumout => \ULA|Add0~29_sumout\,
	cout => \ULA|Add0~30\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\bancoRegs|registrador~332\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~25_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~332_q\);

\bancoRegs|registrador~1392\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1392_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~44_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~76_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~108_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~140_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~76_q\,
	datab => \bancoRegs|ALT_INV_registrador~140_q\,
	datac => \bancoRegs|ALT_INV_registrador~108_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~44_q\,
	combout => \bancoRegs|registrador~1392_combout\);

\bancoRegs|registrador~1116\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1116_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1392_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1392_combout\ & ((\bancoRegs|registrador~300_q\))) # 
-- (\bancoRegs|registrador~1392_combout\ & (\bancoRegs|registrador~332_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1392_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1392_combout\ & 
-- ((\bancoRegs|registrador~364_q\))) # (\bancoRegs|registrador~1392_combout\ & (\bancoRegs|registrador~396_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~332_q\,
	datab => \bancoRegs|ALT_INV_registrador~396_q\,
	datac => \bancoRegs|ALT_INV_registrador~364_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1392_combout\,
	datag => \bancoRegs|ALT_INV_registrador~300_q\,
	combout => \bancoRegs|registrador~1116_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\bancoRegs|registrador~75\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~75_q\);

\bancoRegs|registrador~1107\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1107_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~331_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~299_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~75_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~43_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~75_q\,
	datab => \bancoRegs|ALT_INV_registrador~43_q\,
	datac => \bancoRegs|ALT_INV_registrador~331_q\,
	datad => \bancoRegs|ALT_INV_registrador~299_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1107_combout\);

\bancoRegs|registrador~587\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~587_q\);

\bancoRegs|registrador~555\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~555_q\);

\bancoRegs|registrador~843\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~843_q\);

\bancoRegs|registrador~811\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~811_q\);

\bancoRegs|registrador~1108\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1108_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~843_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~811_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~587_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~555_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~587_q\,
	datab => \bancoRegs|ALT_INV_registrador~555_q\,
	datac => \bancoRegs|ALT_INV_registrador~843_q\,
	datad => \bancoRegs|ALT_INV_registrador~811_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1108_combout\);

\bancoRegs|registrador~1109\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1109_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~395_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~363_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~139_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~107_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~139_q\,
	datab => \bancoRegs|ALT_INV_registrador~107_q\,
	datac => \bancoRegs|ALT_INV_registrador~395_q\,
	datad => \bancoRegs|ALT_INV_registrador~363_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1109_combout\);

\bancoRegs|registrador~651\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~651_q\);

\bancoRegs|registrador~619\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~619_q\);

\bancoRegs|registrador~907\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~907_q\);

\bancoRegs|registrador~875\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~21_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~875_q\);

\bancoRegs|registrador~1110\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1110_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~907_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~875_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~651_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~619_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~651_q\,
	datab => \bancoRegs|ALT_INV_registrador~619_q\,
	datac => \bancoRegs|ALT_INV_registrador~907_q\,
	datad => \bancoRegs|ALT_INV_registrador~875_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1110_combout\);

\bancoRegs|registrador~1111\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1111_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1110_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1109_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1108_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1107_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1107_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1108_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1109_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1110_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1111_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\bancoRegs|registrador~74\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~74_q\);

\bancoRegs|registrador~586\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~586_q\);

\bancoRegs|registrador~650\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~650_q\);

\bancoRegs|registrador~1098\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1098_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~650_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~138_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~586_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~74_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~74_q\,
	datab => \bancoRegs|ALT_INV_registrador~586_q\,
	datac => \bancoRegs|ALT_INV_registrador~138_q\,
	datad => \bancoRegs|ALT_INV_registrador~650_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1098_combout\);

\bancoRegs|registrador~554\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~554_q\);

\bancoRegs|registrador~618\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~618_q\);

\bancoRegs|registrador~1099\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1099_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~618_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~106_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~554_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~42_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~42_q\,
	datab => \bancoRegs|ALT_INV_registrador~554_q\,
	datac => \bancoRegs|ALT_INV_registrador~106_q\,
	datad => \bancoRegs|ALT_INV_registrador~618_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1099_combout\);

\bancoRegs|registrador~842\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~842_q\);

\bancoRegs|registrador~906\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~906_q\);

\bancoRegs|registrador~1100\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1100_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~906_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~394_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~842_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~330_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~330_q\,
	datab => \bancoRegs|ALT_INV_registrador~842_q\,
	datac => \bancoRegs|ALT_INV_registrador~394_q\,
	datad => \bancoRegs|ALT_INV_registrador~906_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1100_combout\);

\bancoRegs|registrador~810\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~810_q\);

\bancoRegs|registrador~874\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~17_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~874_q\);

\bancoRegs|registrador~1101\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1101_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~874_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~362_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~810_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~298_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~298_q\,
	datab => \bancoRegs|ALT_INV_registrador~810_q\,
	datac => \bancoRegs|ALT_INV_registrador~362_q\,
	datad => \bancoRegs|ALT_INV_registrador~874_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1101_combout\);

\bancoRegs|registrador~1102\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1102_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1100_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1101_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1098_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1099_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1098_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1099_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1100_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1101_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1102_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\bancoRegs|registrador~73\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~73_q\);

\bancoRegs|registrador~1089\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1089_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~329_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~297_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~73_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~41_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~73_q\,
	datab => \bancoRegs|ALT_INV_registrador~41_q\,
	datac => \bancoRegs|ALT_INV_registrador~329_q\,
	datad => \bancoRegs|ALT_INV_registrador~297_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1089_combout\);

\bancoRegs|registrador~585\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~585_q\);

\bancoRegs|registrador~553\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~553_q\);

\bancoRegs|registrador~841\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~841_q\);

\bancoRegs|registrador~809\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~809_q\);

\bancoRegs|registrador~1090\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1090_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~841_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~809_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~585_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~553_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~585_q\,
	datab => \bancoRegs|ALT_INV_registrador~553_q\,
	datac => \bancoRegs|ALT_INV_registrador~841_q\,
	datad => \bancoRegs|ALT_INV_registrador~809_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1090_combout\);

\bancoRegs|registrador~1091\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1091_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~393_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~361_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~137_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~105_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~137_q\,
	datab => \bancoRegs|ALT_INV_registrador~105_q\,
	datac => \bancoRegs|ALT_INV_registrador~393_q\,
	datad => \bancoRegs|ALT_INV_registrador~361_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1091_combout\);

\bancoRegs|registrador~649\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~649_q\);

\bancoRegs|registrador~617\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~617_q\);

\bancoRegs|registrador~905\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~905_q\);

\bancoRegs|registrador~873\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~13_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~873_q\);

\bancoRegs|registrador~1092\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1092_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~905_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~873_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~649_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~617_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~649_q\,
	datab => \bancoRegs|ALT_INV_registrador~617_q\,
	datac => \bancoRegs|ALT_INV_registrador~905_q\,
	datad => \bancoRegs|ALT_INV_registrador~873_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1092_combout\);

\bancoRegs|registrador~1093\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1093_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1092_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1091_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1090_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1089_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1089_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1090_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1091_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1092_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1093_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\bancoRegs|registrador~72\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~72_q\);

\bancoRegs|registrador~584\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~584_q\);

\bancoRegs|registrador~648\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~648_q\);

\bancoRegs|registrador~1080\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1080_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~648_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~136_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~584_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~72_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~72_q\,
	datab => \bancoRegs|ALT_INV_registrador~584_q\,
	datac => \bancoRegs|ALT_INV_registrador~136_q\,
	datad => \bancoRegs|ALT_INV_registrador~648_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1080_combout\);

\bancoRegs|registrador~552\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~552_q\);

\bancoRegs|registrador~616\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~616_q\);

\bancoRegs|registrador~1081\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1081_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~616_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~104_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~552_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~40_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~40_q\,
	datab => \bancoRegs|ALT_INV_registrador~552_q\,
	datac => \bancoRegs|ALT_INV_registrador~104_q\,
	datad => \bancoRegs|ALT_INV_registrador~616_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1081_combout\);

\bancoRegs|registrador~840\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~840_q\);

\bancoRegs|registrador~904\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~904_q\);

\bancoRegs|registrador~1082\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1082_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~904_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~392_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~840_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~328_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~328_q\,
	datab => \bancoRegs|ALT_INV_registrador~840_q\,
	datac => \bancoRegs|ALT_INV_registrador~392_q\,
	datad => \bancoRegs|ALT_INV_registrador~904_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1082_combout\);

\bancoRegs|registrador~808\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~808_q\);

\bancoRegs|registrador~872\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~9_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~872_q\);

\bancoRegs|registrador~1083\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1083_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~872_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~360_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~808_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~296_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~296_q\,
	datab => \bancoRegs|ALT_INV_registrador~808_q\,
	datac => \bancoRegs|ALT_INV_registrador~360_q\,
	datad => \bancoRegs|ALT_INV_registrador~872_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1083_combout\);

\bancoRegs|registrador~1084\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1084_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1082_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1083_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1080_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1081_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1080_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1081_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1082_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1083_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1084_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\bancoRegs|registrador~70\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~70_q\);

\bancoRegs|registrador~1062\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1062_combout\ = ( \ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~390_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~326_q\ ) ) ) # ( \ROM|memROM~3_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~134_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~70_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~70_q\,
	datab => \bancoRegs|ALT_INV_registrador~134_q\,
	datac => \bancoRegs|ALT_INV_registrador~326_q\,
	datad => \bancoRegs|ALT_INV_registrador~390_q\,
	datae => \ROM|ALT_INV_memROM~3_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1062_combout\);

\bancoRegs|registrador~582\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~582_q\);

\bancoRegs|registrador~646\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~646_q\);

\bancoRegs|registrador~838\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~838_q\);

\bancoRegs|registrador~902\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~902_q\);

\bancoRegs|registrador~1063\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1063_combout\ = ( \ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~902_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~838_q\ ) ) ) # ( \ROM|memROM~3_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~646_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~582_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~582_q\,
	datab => \bancoRegs|ALT_INV_registrador~646_q\,
	datac => \bancoRegs|ALT_INV_registrador~838_q\,
	datad => \bancoRegs|ALT_INV_registrador~902_q\,
	datae => \ROM|ALT_INV_memROM~3_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1063_combout\);

\bancoRegs|registrador~1064\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1064_combout\ = ( \ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~358_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~294_q\ ) ) ) # ( \ROM|memROM~3_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~102_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~38_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~38_q\,
	datab => \bancoRegs|ALT_INV_registrador~102_q\,
	datac => \bancoRegs|ALT_INV_registrador~294_q\,
	datad => \bancoRegs|ALT_INV_registrador~358_q\,
	datae => \ROM|ALT_INV_memROM~3_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1064_combout\);

\bancoRegs|registrador~550\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~550_q\);

\bancoRegs|registrador~614\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~614_q\);

\bancoRegs|registrador~806\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~806_q\);

\bancoRegs|registrador~870\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~1_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~870_q\);

\bancoRegs|registrador~1065\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1065_combout\ = ( \ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~870_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~806_q\ ) ) ) # ( \ROM|memROM~3_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~614_q\ ) ) ) # ( !\ROM|memROM~3_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~550_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~550_q\,
	datab => \bancoRegs|ALT_INV_registrador~614_q\,
	datac => \bancoRegs|ALT_INV_registrador~806_q\,
	datad => \bancoRegs|ALT_INV_registrador~870_q\,
	datae => \ROM|ALT_INV_memROM~3_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1065_combout\);

\bancoRegs|registrador~1066\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1066_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~6_combout\ & ( \bancoRegs|registrador~1063_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~6_combout\ & ( \bancoRegs|registrador~1062_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( \bancoRegs|registrador~1065_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~6_combout\ & ( \bancoRegs|registrador~1064_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000001111111101010101010101010011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1062_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1063_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1064_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1065_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~6_combout\,
	combout => \bancoRegs|registrador~1066_combout\);

\bancoRegs|registrador~78\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~78_q\);

\bancoRegs|registrador~590\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~590_q\);

\bancoRegs|registrador~142\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~142_q\);

\bancoRegs|registrador~654\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~654_q\);

\bancoRegs|registrador~1138\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1138_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~654_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~142_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~590_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~78_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~78_q\,
	datab => \bancoRegs|ALT_INV_registrador~590_q\,
	datac => \bancoRegs|ALT_INV_registrador~142_q\,
	datad => \bancoRegs|ALT_INV_registrador~654_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1138_combout\);

\bancoRegs|registrador~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~46_q\);

\bancoRegs|registrador~558\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~558_q\);

\bancoRegs|registrador~110\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~110_q\);

\bancoRegs|registrador~622\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~622_q\);

\bancoRegs|registrador~1139\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1139_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~622_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~110_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~558_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~46_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~46_q\,
	datab => \bancoRegs|ALT_INV_registrador~558_q\,
	datac => \bancoRegs|ALT_INV_registrador~110_q\,
	datad => \bancoRegs|ALT_INV_registrador~622_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1139_combout\);

\bancoRegs|registrador~846\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~846_q\);

\bancoRegs|registrador~398\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~398_q\);

\bancoRegs|registrador~910\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~910_q\);

\bancoRegs|registrador~1140\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1140_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~910_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~398_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~846_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~334_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~334_q\,
	datab => \bancoRegs|ALT_INV_registrador~846_q\,
	datac => \bancoRegs|ALT_INV_registrador~398_q\,
	datad => \bancoRegs|ALT_INV_registrador~910_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1140_combout\);

\bancoRegs|registrador~302\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~302_q\);

\bancoRegs|registrador~814\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~814_q\);

\bancoRegs|registrador~366\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~366_q\);

\bancoRegs|registrador~878\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~878_q\);

\bancoRegs|registrador~1141\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1141_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~878_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~366_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~814_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~302_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~302_q\,
	datab => \bancoRegs|ALT_INV_registrador~814_q\,
	datac => \bancoRegs|ALT_INV_registrador~366_q\,
	datad => \bancoRegs|ALT_INV_registrador~878_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1141_combout\);

\bancoRegs|registrador~1142\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1142_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1140_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1141_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1138_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1139_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1138_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1139_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1140_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1141_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1142_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

\bancoRegs|registrador~334\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~33_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~334_q\);

\bancoRegs|registrador~1400\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1400_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~46_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~78_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~110_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~142_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~78_q\,
	datab => \bancoRegs|ALT_INV_registrador~142_q\,
	datac => \bancoRegs|ALT_INV_registrador~110_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~46_q\,
	combout => \bancoRegs|registrador~1400_combout\);

\bancoRegs|registrador~1134\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1134_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1400_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1400_combout\ & ((\bancoRegs|registrador~302_q\))) # 
-- (\bancoRegs|registrador~1400_combout\ & (\bancoRegs|registrador~334_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1400_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1400_combout\ & 
-- ((\bancoRegs|registrador~366_q\))) # (\bancoRegs|registrador~1400_combout\ & (\bancoRegs|registrador~398_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~334_q\,
	datab => \bancoRegs|ALT_INV_registrador~398_q\,
	datac => \bancoRegs|ALT_INV_registrador~366_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1400_combout\,
	datag => \bancoRegs|ALT_INV_registrador~302_q\,
	combout => \bancoRegs|registrador~1134_combout\);

\ULA|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~33_sumout\ = SUM(( \bancoRegs|registrador~1134_combout\ ) + ( (\bancoRegs|registrador~1142_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~30\ ))
-- \ULA|Add0~34\ = CARRY(( \bancoRegs|registrador~1134_combout\ ) + ( (\bancoRegs|registrador~1142_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \ROM|ALT_INV_memROM~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1134_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1142_combout\,
	cin => \ULA|Add0~30\,
	sumout => \ULA|Add0~33_sumout\,
	cout => \ULA|Add0~34\);

\bancoRegs|registrador~79\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~79_q\);

\bancoRegs|registrador~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~303_q\);

\bancoRegs|registrador~1147\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1147_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~335_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~303_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~79_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~47_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~79_q\,
	datab => \bancoRegs|ALT_INV_registrador~47_q\,
	datac => \bancoRegs|ALT_INV_registrador~335_q\,
	datad => \bancoRegs|ALT_INV_registrador~303_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1147_combout\);

\bancoRegs|registrador~591\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~591_q\);

\bancoRegs|registrador~559\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~559_q\);

\bancoRegs|registrador~847\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~847_q\);

\bancoRegs|registrador~815\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~815_q\);

\bancoRegs|registrador~1148\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1148_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~847_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~815_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~591_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~559_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~591_q\,
	datab => \bancoRegs|ALT_INV_registrador~559_q\,
	datac => \bancoRegs|ALT_INV_registrador~847_q\,
	datad => \bancoRegs|ALT_INV_registrador~815_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1148_combout\);

\bancoRegs|registrador~143\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~143_q\);

\bancoRegs|registrador~111\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~111_q\);

\bancoRegs|registrador~399\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~399_q\);

\bancoRegs|registrador~367\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~367_q\);

\bancoRegs|registrador~1149\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1149_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~399_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~367_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~143_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~111_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~143_q\,
	datab => \bancoRegs|ALT_INV_registrador~111_q\,
	datac => \bancoRegs|ALT_INV_registrador~399_q\,
	datad => \bancoRegs|ALT_INV_registrador~367_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1149_combout\);

\bancoRegs|registrador~655\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~655_q\);

\bancoRegs|registrador~623\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~623_q\);

\bancoRegs|registrador~911\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~911_q\);

\bancoRegs|registrador~879\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~879_q\);

\bancoRegs|registrador~1150\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1150_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~911_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~879_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~655_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~623_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~655_q\,
	datab => \bancoRegs|ALT_INV_registrador~623_q\,
	datac => \bancoRegs|ALT_INV_registrador~911_q\,
	datad => \bancoRegs|ALT_INV_registrador~879_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1150_combout\);

\bancoRegs|registrador~1151\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1151_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1150_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1149_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1148_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1147_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1147_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1148_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1149_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1150_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1151_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

\bancoRegs|registrador~335\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~37_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~335_q\);

\bancoRegs|registrador~1404\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1404_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~47_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~79_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~111_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~143_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~79_q\,
	datab => \bancoRegs|ALT_INV_registrador~143_q\,
	datac => \bancoRegs|ALT_INV_registrador~111_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~47_q\,
	combout => \bancoRegs|registrador~1404_combout\);

\bancoRegs|registrador~1143\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1143_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1404_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1404_combout\ & ((\bancoRegs|registrador~303_q\))) # 
-- (\bancoRegs|registrador~1404_combout\ & (\bancoRegs|registrador~335_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1404_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1404_combout\ & 
-- ((\bancoRegs|registrador~367_q\))) # (\bancoRegs|registrador~1404_combout\ & (\bancoRegs|registrador~399_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~335_q\,
	datab => \bancoRegs|ALT_INV_registrador~399_q\,
	datac => \bancoRegs|ALT_INV_registrador~367_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1404_combout\,
	datag => \bancoRegs|ALT_INV_registrador~303_q\,
	combout => \bancoRegs|registrador~1143_combout\);

\ULA|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~37_sumout\ = SUM(( \bancoRegs|registrador~1143_combout\ ) + ( (\bancoRegs|registrador~1151_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~34\ ))
-- \ULA|Add0~38\ = CARRY(( \bancoRegs|registrador~1143_combout\ ) + ( (\bancoRegs|registrador~1151_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \ROM|ALT_INV_memROM~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1143_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1151_combout\,
	cin => \ULA|Add0~34\,
	sumout => \ULA|Add0~37_sumout\,
	cout => \ULA|Add0~38\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

\bancoRegs|registrador~80\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~80_q\);

\bancoRegs|registrador~592\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~592_q\);

\bancoRegs|registrador~144\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~144_q\);

\bancoRegs|registrador~656\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~656_q\);

\bancoRegs|registrador~1152\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1152_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~656_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~144_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~592_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~80_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~80_q\,
	datab => \bancoRegs|ALT_INV_registrador~592_q\,
	datac => \bancoRegs|ALT_INV_registrador~144_q\,
	datad => \bancoRegs|ALT_INV_registrador~656_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1152_combout\);

\bancoRegs|registrador~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~48_q\);

\bancoRegs|registrador~560\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~560_q\);

\bancoRegs|registrador~112\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~112_q\);

\bancoRegs|registrador~624\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~624_q\);

\bancoRegs|registrador~1153\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1153_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~624_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~112_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~560_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~48_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~48_q\,
	datab => \bancoRegs|ALT_INV_registrador~560_q\,
	datac => \bancoRegs|ALT_INV_registrador~112_q\,
	datad => \bancoRegs|ALT_INV_registrador~624_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1153_combout\);

\bancoRegs|registrador~336\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~336_q\);

\bancoRegs|registrador~848\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~848_q\);

\bancoRegs|registrador~400\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~400_q\);

\bancoRegs|registrador~912\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~912_q\);

\bancoRegs|registrador~1154\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1154_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~912_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~400_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~848_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~336_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~336_q\,
	datab => \bancoRegs|ALT_INV_registrador~848_q\,
	datac => \bancoRegs|ALT_INV_registrador~400_q\,
	datad => \bancoRegs|ALT_INV_registrador~912_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1154_combout\);

\bancoRegs|registrador~304\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~304_q\);

\bancoRegs|registrador~816\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~816_q\);

\bancoRegs|registrador~368\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~368_q\);

\bancoRegs|registrador~880\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~41_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~880_q\);

\bancoRegs|registrador~1155\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1155_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~880_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~368_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~816_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~304_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~304_q\,
	datab => \bancoRegs|ALT_INV_registrador~816_q\,
	datac => \bancoRegs|ALT_INV_registrador~368_q\,
	datad => \bancoRegs|ALT_INV_registrador~880_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1155_combout\);

\bancoRegs|registrador~1156\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1156_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1154_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1155_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1152_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1153_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1152_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1153_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1154_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1155_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1156_combout\);

\bancoRegs|registrador~1408\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1408_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~48_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~80_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~112_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~144_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~80_q\,
	datab => \bancoRegs|ALT_INV_registrador~144_q\,
	datac => \bancoRegs|ALT_INV_registrador~112_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~48_q\,
	combout => \bancoRegs|registrador~1408_combout\);

\bancoRegs|registrador~1157\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1157_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1408_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1408_combout\ & ((\bancoRegs|registrador~304_q\))) # 
-- (\bancoRegs|registrador~1408_combout\ & (\bancoRegs|registrador~336_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1408_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1408_combout\ & 
-- ((\bancoRegs|registrador~368_q\))) # (\bancoRegs|registrador~1408_combout\ & (\bancoRegs|registrador~400_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~336_q\,
	datab => \bancoRegs|ALT_INV_registrador~400_q\,
	datac => \bancoRegs|ALT_INV_registrador~368_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1408_combout\,
	datag => \bancoRegs|ALT_INV_registrador~304_q\,
	combout => \bancoRegs|registrador~1157_combout\);

\UC|sel_mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|sel_mux3~0_combout\ = (!\PC_entity|DOUT\(7) & (!\PC_entity|DOUT\(6) & (!\ROM|memROM~1_combout\ $ (!\ROM|memROM~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100010000000000010001000000000001000100000000000100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC_entity|ALT_INV_DOUT\(7),
	datab => \PC_entity|ALT_INV_DOUT\(6),
	datac => \ROM|ALT_INV_memROM~1_combout\,
	datad => \ROM|ALT_INV_memROM~7_combout\,
	combout => \UC|sel_mux3~0_combout\);

\ULA|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~41_sumout\ = SUM(( \bancoRegs|registrador~1157_combout\ ) + ( (\bancoRegs|registrador~1156_combout\ & ((!\ROM|memROM~0_combout\) # (\UC|sel_mux3~0_combout\))) ) + ( \ULA|Add0~38\ ))
-- \ULA|Add0~42\ = CARRY(( \bancoRegs|registrador~1157_combout\ ) + ( (\bancoRegs|registrador~1156_combout\ & ((!\ROM|memROM~0_combout\) # (\UC|sel_mux3~0_combout\))) ) + ( \ULA|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1156_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1157_combout\,
	dataf => \UC|ALT_INV_sel_mux3~0_combout\,
	cin => \ULA|Add0~38\,
	sumout => \ULA|Add0~41_sumout\,
	cout => \ULA|Add0~42\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

\bancoRegs|registrador~81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~81_q\);

\bancoRegs|registrador~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~49_q\);

\bancoRegs|registrador~337\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~337_q\);

\bancoRegs|registrador~305\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~305_q\);

\bancoRegs|registrador~1161\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1161_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~337_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~305_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~81_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~49_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~81_q\,
	datab => \bancoRegs|ALT_INV_registrador~49_q\,
	datac => \bancoRegs|ALT_INV_registrador~337_q\,
	datad => \bancoRegs|ALT_INV_registrador~305_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1161_combout\);

\bancoRegs|registrador~593\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~593_q\);

\bancoRegs|registrador~561\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~561_q\);

\bancoRegs|registrador~849\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~849_q\);

\bancoRegs|registrador~817\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~817_q\);

\bancoRegs|registrador~1162\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1162_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~849_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~817_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~593_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~561_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~593_q\,
	datab => \bancoRegs|ALT_INV_registrador~561_q\,
	datac => \bancoRegs|ALT_INV_registrador~849_q\,
	datad => \bancoRegs|ALT_INV_registrador~817_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1162_combout\);

\bancoRegs|registrador~145\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~145_q\);

\bancoRegs|registrador~113\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~113_q\);

\bancoRegs|registrador~401\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~401_q\);

\bancoRegs|registrador~369\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~369_q\);

\bancoRegs|registrador~1163\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1163_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~401_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~369_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~145_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~113_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~145_q\,
	datab => \bancoRegs|ALT_INV_registrador~113_q\,
	datac => \bancoRegs|ALT_INV_registrador~401_q\,
	datad => \bancoRegs|ALT_INV_registrador~369_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1163_combout\);

\bancoRegs|registrador~657\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~657_q\);

\bancoRegs|registrador~625\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~625_q\);

\bancoRegs|registrador~913\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~913_q\);

\bancoRegs|registrador~881\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~45_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~881_q\);

\bancoRegs|registrador~1164\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1164_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~913_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~881_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~657_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~625_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~657_q\,
	datab => \bancoRegs|ALT_INV_registrador~625_q\,
	datac => \bancoRegs|ALT_INV_registrador~913_q\,
	datad => \bancoRegs|ALT_INV_registrador~881_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1164_combout\);

\bancoRegs|registrador~1165\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1165_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1164_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1163_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1162_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1161_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1161_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1162_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1163_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1164_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1165_combout\);

\bancoRegs|registrador~1412\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1412_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~49_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~81_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~113_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~145_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~81_q\,
	datab => \bancoRegs|ALT_INV_registrador~145_q\,
	datac => \bancoRegs|ALT_INV_registrador~113_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~49_q\,
	combout => \bancoRegs|registrador~1412_combout\);

\bancoRegs|registrador~1166\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1166_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1412_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1412_combout\ & ((\bancoRegs|registrador~305_q\))) # 
-- (\bancoRegs|registrador~1412_combout\ & (\bancoRegs|registrador~337_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1412_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1412_combout\ & 
-- ((\bancoRegs|registrador~369_q\))) # (\bancoRegs|registrador~1412_combout\ & (\bancoRegs|registrador~401_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~337_q\,
	datab => \bancoRegs|ALT_INV_registrador~401_q\,
	datac => \bancoRegs|ALT_INV_registrador~369_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1412_combout\,
	datag => \bancoRegs|ALT_INV_registrador~305_q\,
	combout => \bancoRegs|registrador~1166_combout\);

\ULA|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~45_sumout\ = SUM(( \bancoRegs|registrador~1166_combout\ ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~1165_combout\)) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & ((\ROM|memROM~14_combout\))) # (\UC|sel_mux3~0_combout\ & 
-- (\bancoRegs|registrador~1165_combout\)))) ) + ( \ULA|Add0~42\ ))
-- \ULA|Add0~46\ = CARRY(( \bancoRegs|registrador~1166_combout\ ) + ( (!\ROM|memROM~0_combout\ & (\bancoRegs|registrador~1165_combout\)) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & ((\ROM|memROM~14_combout\))) # (\UC|sel_mux3~0_combout\ & 
-- (\bancoRegs|registrador~1165_combout\)))) ) + ( \ULA|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110110001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1165_combout\,
	datac => \ROM|ALT_INV_memROM~14_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1166_combout\,
	dataf => \UC|ALT_INV_sel_mux3~0_combout\,
	cin => \ULA|Add0~42\,
	sumout => \ULA|Add0~45_sumout\,
	cout => \ULA|Add0~46\);

\bancoRegs|registrador~82\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~82_q\);

\bancoRegs|registrador~594\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~594_q\);

\bancoRegs|registrador~146\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~146_q\);

\bancoRegs|registrador~658\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~658_q\);

\bancoRegs|registrador~1174\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1174_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~658_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~146_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~594_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~82_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~82_q\,
	datab => \bancoRegs|ALT_INV_registrador~594_q\,
	datac => \bancoRegs|ALT_INV_registrador~146_q\,
	datad => \bancoRegs|ALT_INV_registrador~658_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1174_combout\);

\bancoRegs|registrador~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~50_q\);

\bancoRegs|registrador~562\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~562_q\);

\bancoRegs|registrador~114\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~114_q\);

\bancoRegs|registrador~626\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~626_q\);

\bancoRegs|registrador~1175\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1175_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~626_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~114_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~562_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~50_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~50_q\,
	datab => \bancoRegs|ALT_INV_registrador~562_q\,
	datac => \bancoRegs|ALT_INV_registrador~114_q\,
	datad => \bancoRegs|ALT_INV_registrador~626_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1175_combout\);

\bancoRegs|registrador~850\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~850_q\);

\bancoRegs|registrador~402\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~402_q\);

\bancoRegs|registrador~914\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~914_q\);

\bancoRegs|registrador~1176\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1176_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~914_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~402_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~850_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~338_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~338_q\,
	datab => \bancoRegs|ALT_INV_registrador~850_q\,
	datac => \bancoRegs|ALT_INV_registrador~402_q\,
	datad => \bancoRegs|ALT_INV_registrador~914_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1176_combout\);

\bancoRegs|registrador~306\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~306_q\);

\bancoRegs|registrador~818\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~818_q\);

\bancoRegs|registrador~370\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~370_q\);

\bancoRegs|registrador~882\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~882_q\);

\bancoRegs|registrador~1177\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1177_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~882_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~370_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~818_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~306_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~306_q\,
	datab => \bancoRegs|ALT_INV_registrador~818_q\,
	datac => \bancoRegs|ALT_INV_registrador~370_q\,
	datad => \bancoRegs|ALT_INV_registrador~882_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1177_combout\);

\bancoRegs|registrador~1178\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1178_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1176_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1177_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1174_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1175_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1174_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1175_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1176_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1177_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1178_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

\bancoRegs|registrador~338\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~49_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~338_q\);

\bancoRegs|registrador~1416\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1416_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~50_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~82_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~114_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~146_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~82_q\,
	datab => \bancoRegs|ALT_INV_registrador~146_q\,
	datac => \bancoRegs|ALT_INV_registrador~114_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~50_q\,
	combout => \bancoRegs|registrador~1416_combout\);

\bancoRegs|registrador~1170\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1170_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1416_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1416_combout\ & ((\bancoRegs|registrador~306_q\))) # 
-- (\bancoRegs|registrador~1416_combout\ & (\bancoRegs|registrador~338_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1416_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1416_combout\ & 
-- ((\bancoRegs|registrador~370_q\))) # (\bancoRegs|registrador~1416_combout\ & (\bancoRegs|registrador~402_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~338_q\,
	datab => \bancoRegs|ALT_INV_registrador~402_q\,
	datac => \bancoRegs|ALT_INV_registrador~370_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1416_combout\,
	datag => \bancoRegs|ALT_INV_registrador~306_q\,
	combout => \bancoRegs|registrador~1170_combout\);

\ULA|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~49_sumout\ = SUM(( \bancoRegs|registrador~1170_combout\ ) + ( (\bancoRegs|registrador~1178_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~46\ ))
-- \ULA|Add0~50\ = CARRY(( \bancoRegs|registrador~1170_combout\ ) + ( (\bancoRegs|registrador~1178_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \ROM|ALT_INV_memROM~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1170_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1178_combout\,
	cin => \ULA|Add0~46\,
	sumout => \ULA|Add0~49_sumout\,
	cout => \ULA|Add0~50\);

\bancoRegs|registrador~83\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~83_q\);

\bancoRegs|registrador~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~307_q\);

\bancoRegs|registrador~1183\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1183_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~339_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~307_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~83_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~51_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~83_q\,
	datab => \bancoRegs|ALT_INV_registrador~51_q\,
	datac => \bancoRegs|ALT_INV_registrador~339_q\,
	datad => \bancoRegs|ALT_INV_registrador~307_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1183_combout\);

\bancoRegs|registrador~595\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~595_q\);

\bancoRegs|registrador~563\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~563_q\);

\bancoRegs|registrador~851\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~851_q\);

\bancoRegs|registrador~819\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~819_q\);

\bancoRegs|registrador~1184\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1184_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~851_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~819_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~595_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~563_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~595_q\,
	datab => \bancoRegs|ALT_INV_registrador~563_q\,
	datac => \bancoRegs|ALT_INV_registrador~851_q\,
	datad => \bancoRegs|ALT_INV_registrador~819_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1184_combout\);

\bancoRegs|registrador~147\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~147_q\);

\bancoRegs|registrador~115\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~115_q\);

\bancoRegs|registrador~403\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~403_q\);

\bancoRegs|registrador~371\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~371_q\);

\bancoRegs|registrador~1185\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1185_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~403_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~371_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~147_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~115_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~147_q\,
	datab => \bancoRegs|ALT_INV_registrador~115_q\,
	datac => \bancoRegs|ALT_INV_registrador~403_q\,
	datad => \bancoRegs|ALT_INV_registrador~371_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1185_combout\);

\bancoRegs|registrador~659\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~659_q\);

\bancoRegs|registrador~627\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~627_q\);

\bancoRegs|registrador~915\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~915_q\);

\bancoRegs|registrador~883\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~883_q\);

\bancoRegs|registrador~1186\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1186_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~915_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~883_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~659_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~627_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~659_q\,
	datab => \bancoRegs|ALT_INV_registrador~627_q\,
	datac => \bancoRegs|ALT_INV_registrador~915_q\,
	datad => \bancoRegs|ALT_INV_registrador~883_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1186_combout\);

\bancoRegs|registrador~1187\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1187_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1186_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1185_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1184_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1183_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1183_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1184_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1185_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1186_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1187_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

\bancoRegs|registrador~339\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~53_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~339_q\);

\bancoRegs|registrador~1420\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1420_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~51_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~83_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~115_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~147_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~83_q\,
	datab => \bancoRegs|ALT_INV_registrador~147_q\,
	datac => \bancoRegs|ALT_INV_registrador~115_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~51_q\,
	combout => \bancoRegs|registrador~1420_combout\);

\bancoRegs|registrador~1179\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1179_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1420_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1420_combout\ & ((\bancoRegs|registrador~307_q\))) # 
-- (\bancoRegs|registrador~1420_combout\ & (\bancoRegs|registrador~339_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1420_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1420_combout\ & 
-- ((\bancoRegs|registrador~371_q\))) # (\bancoRegs|registrador~1420_combout\ & (\bancoRegs|registrador~403_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~339_q\,
	datab => \bancoRegs|ALT_INV_registrador~403_q\,
	datac => \bancoRegs|ALT_INV_registrador~371_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1420_combout\,
	datag => \bancoRegs|ALT_INV_registrador~307_q\,
	combout => \bancoRegs|registrador~1179_combout\);

\ULA|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~53_sumout\ = SUM(( \bancoRegs|registrador~1179_combout\ ) + ( (\bancoRegs|registrador~1187_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~50\ ))
-- \ULA|Add0~54\ = CARRY(( \bancoRegs|registrador~1179_combout\ ) + ( (\bancoRegs|registrador~1187_combout\ & ((!\ROM|memROM~0_combout\) # (!\ROM|memROM~8_combout\ $ (!\ROM|memROM~2_combout\)))) ) + ( \ULA|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \ROM|ALT_INV_memROM~8_combout\,
	datac => \ROM|ALT_INV_memROM~2_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1179_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1187_combout\,
	cin => \ULA|Add0~50\,
	sumout => \ULA|Add0~53_sumout\,
	cout => \ULA|Add0~54\);

\bancoRegs|registrador~84\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~84_q\);

\bancoRegs|registrador~596\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~596_q\);

\bancoRegs|registrador~148\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~148_q\);

\bancoRegs|registrador~660\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~660_q\);

\bancoRegs|registrador~1192\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1192_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~660_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~148_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~596_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~84_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~84_q\,
	datab => \bancoRegs|ALT_INV_registrador~596_q\,
	datac => \bancoRegs|ALT_INV_registrador~148_q\,
	datad => \bancoRegs|ALT_INV_registrador~660_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1192_combout\);

\bancoRegs|registrador~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~52_q\);

\bancoRegs|registrador~564\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~564_q\);

\bancoRegs|registrador~116\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~116_q\);

\bancoRegs|registrador~628\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~628_q\);

\bancoRegs|registrador~1193\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1193_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~628_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~116_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~564_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~52_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~52_q\,
	datab => \bancoRegs|ALT_INV_registrador~564_q\,
	datac => \bancoRegs|ALT_INV_registrador~116_q\,
	datad => \bancoRegs|ALT_INV_registrador~628_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1193_combout\);

\bancoRegs|registrador~852\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~852_q\);

\bancoRegs|registrador~404\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~404_q\);

\bancoRegs|registrador~916\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~916_q\);

\bancoRegs|registrador~1194\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1194_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~916_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~404_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~852_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~340_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~340_q\,
	datab => \bancoRegs|ALT_INV_registrador~852_q\,
	datac => \bancoRegs|ALT_INV_registrador~404_q\,
	datad => \bancoRegs|ALT_INV_registrador~916_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1194_combout\);

\bancoRegs|registrador~308\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~308_q\);

\bancoRegs|registrador~820\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~820_q\);

\bancoRegs|registrador~372\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~372_q\);

\bancoRegs|registrador~884\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~884_q\);

\bancoRegs|registrador~1195\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1195_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~884_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~372_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~820_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~308_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~308_q\,
	datab => \bancoRegs|ALT_INV_registrador~820_q\,
	datac => \bancoRegs|ALT_INV_registrador~372_q\,
	datad => \bancoRegs|ALT_INV_registrador~884_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1195_combout\);

\bancoRegs|registrador~1196\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1196_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1194_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1195_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1192_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1193_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1192_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1193_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1194_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1195_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1196_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

\bancoRegs|registrador~340\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~57_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~340_q\);

\bancoRegs|registrador~1424\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1424_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~52_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~84_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~116_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~148_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~84_q\,
	datab => \bancoRegs|ALT_INV_registrador~148_q\,
	datac => \bancoRegs|ALT_INV_registrador~116_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~52_q\,
	combout => \bancoRegs|registrador~1424_combout\);

\bancoRegs|registrador~1188\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1188_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1424_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1424_combout\ & ((\bancoRegs|registrador~308_q\))) # 
-- (\bancoRegs|registrador~1424_combout\ & (\bancoRegs|registrador~340_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1424_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1424_combout\ & 
-- ((\bancoRegs|registrador~372_q\))) # (\bancoRegs|registrador~1424_combout\ & (\bancoRegs|registrador~404_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~340_q\,
	datab => \bancoRegs|ALT_INV_registrador~404_q\,
	datac => \bancoRegs|ALT_INV_registrador~372_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1424_combout\,
	datag => \bancoRegs|ALT_INV_registrador~308_q\,
	combout => \bancoRegs|registrador~1188_combout\);

\ULA|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~57_sumout\ = SUM(( \bancoRegs|registrador~1188_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1196_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~15_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1196_combout\))))) ) + ( \ULA|Add0~54\ ))
-- \ULA|Add0~58\ = CARRY(( \bancoRegs|registrador~1188_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1196_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~15_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1196_combout\))))) ) + ( \ULA|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~15_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1188_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1196_combout\,
	cin => \ULA|Add0~54\,
	sumout => \ULA|Add0~57_sumout\,
	cout => \ULA|Add0~58\);

\bancoRegs|registrador~85\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~85_q\);

\bancoRegs|registrador~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~309_q\);

\bancoRegs|registrador~1201\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1201_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~341_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~309_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~85_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~53_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~85_q\,
	datab => \bancoRegs|ALT_INV_registrador~53_q\,
	datac => \bancoRegs|ALT_INV_registrador~341_q\,
	datad => \bancoRegs|ALT_INV_registrador~309_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1201_combout\);

\bancoRegs|registrador~597\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~597_q\);

\bancoRegs|registrador~565\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~565_q\);

\bancoRegs|registrador~853\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~853_q\);

\bancoRegs|registrador~821\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~821_q\);

\bancoRegs|registrador~1202\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1202_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~853_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~821_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~597_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~565_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~597_q\,
	datab => \bancoRegs|ALT_INV_registrador~565_q\,
	datac => \bancoRegs|ALT_INV_registrador~853_q\,
	datad => \bancoRegs|ALT_INV_registrador~821_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1202_combout\);

\bancoRegs|registrador~149\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~149_q\);

\bancoRegs|registrador~117\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~117_q\);

\bancoRegs|registrador~405\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~405_q\);

\bancoRegs|registrador~373\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~373_q\);

\bancoRegs|registrador~1203\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1203_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~405_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~373_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~149_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~117_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~149_q\,
	datab => \bancoRegs|ALT_INV_registrador~117_q\,
	datac => \bancoRegs|ALT_INV_registrador~405_q\,
	datad => \bancoRegs|ALT_INV_registrador~373_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1203_combout\);

\bancoRegs|registrador~661\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~661_q\);

\bancoRegs|registrador~629\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~629_q\);

\bancoRegs|registrador~917\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~917_q\);

\bancoRegs|registrador~885\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~885_q\);

\bancoRegs|registrador~1204\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1204_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~917_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~885_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~661_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~629_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~661_q\,
	datab => \bancoRegs|ALT_INV_registrador~629_q\,
	datac => \bancoRegs|ALT_INV_registrador~917_q\,
	datad => \bancoRegs|ALT_INV_registrador~885_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1204_combout\);

\bancoRegs|registrador~1205\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1205_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1204_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1203_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1202_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1201_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1201_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1202_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1203_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1204_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1205_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

\bancoRegs|registrador~341\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~61_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~341_q\);

\bancoRegs|registrador~1428\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1428_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~53_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~85_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~117_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~149_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~85_q\,
	datab => \bancoRegs|ALT_INV_registrador~149_q\,
	datac => \bancoRegs|ALT_INV_registrador~117_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~53_q\,
	combout => \bancoRegs|registrador~1428_combout\);

\bancoRegs|registrador~1197\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1197_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1428_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1428_combout\ & ((\bancoRegs|registrador~309_q\))) # 
-- (\bancoRegs|registrador~1428_combout\ & (\bancoRegs|registrador~341_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1428_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1428_combout\ & 
-- ((\bancoRegs|registrador~373_q\))) # (\bancoRegs|registrador~1428_combout\ & (\bancoRegs|registrador~405_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~341_q\,
	datab => \bancoRegs|ALT_INV_registrador~405_q\,
	datac => \bancoRegs|ALT_INV_registrador~373_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1428_combout\,
	datag => \bancoRegs|ALT_INV_registrador~309_q\,
	combout => \bancoRegs|registrador~1197_combout\);

\ULA|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~61_sumout\ = SUM(( \bancoRegs|registrador~1197_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1205_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1205_combout\))))) ) + ( \ULA|Add0~58\ ))
-- \ULA|Add0~62\ = CARRY(( \bancoRegs|registrador~1197_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1205_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1205_combout\))))) ) + ( \ULA|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1197_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1205_combout\,
	cin => \ULA|Add0~58\,
	sumout => \ULA|Add0~61_sumout\,
	cout => \ULA|Add0~62\);

\bancoRegs|registrador~86\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~86_q\);

\bancoRegs|registrador~598\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~598_q\);

\bancoRegs|registrador~150\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~150_q\);

\bancoRegs|registrador~662\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~662_q\);

\bancoRegs|registrador~1210\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1210_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~662_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~150_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~598_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~86_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~86_q\,
	datab => \bancoRegs|ALT_INV_registrador~598_q\,
	datac => \bancoRegs|ALT_INV_registrador~150_q\,
	datad => \bancoRegs|ALT_INV_registrador~662_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1210_combout\);

\bancoRegs|registrador~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~54_q\);

\bancoRegs|registrador~566\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~566_q\);

\bancoRegs|registrador~118\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~118_q\);

\bancoRegs|registrador~630\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~630_q\);

\bancoRegs|registrador~1211\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1211_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~630_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~118_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~566_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~54_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~54_q\,
	datab => \bancoRegs|ALT_INV_registrador~566_q\,
	datac => \bancoRegs|ALT_INV_registrador~118_q\,
	datad => \bancoRegs|ALT_INV_registrador~630_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1211_combout\);

\bancoRegs|registrador~854\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~854_q\);

\bancoRegs|registrador~406\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~406_q\);

\bancoRegs|registrador~918\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~918_q\);

\bancoRegs|registrador~1212\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1212_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~918_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~406_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~854_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~342_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~342_q\,
	datab => \bancoRegs|ALT_INV_registrador~854_q\,
	datac => \bancoRegs|ALT_INV_registrador~406_q\,
	datad => \bancoRegs|ALT_INV_registrador~918_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1212_combout\);

\bancoRegs|registrador~310\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~310_q\);

\bancoRegs|registrador~822\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~822_q\);

\bancoRegs|registrador~374\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~374_q\);

\bancoRegs|registrador~886\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~886_q\);

\bancoRegs|registrador~1213\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1213_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~886_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~374_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~822_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~310_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~310_q\,
	datab => \bancoRegs|ALT_INV_registrador~822_q\,
	datac => \bancoRegs|ALT_INV_registrador~374_q\,
	datad => \bancoRegs|ALT_INV_registrador~886_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1213_combout\);

\bancoRegs|registrador~1214\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1214_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1212_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1213_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1210_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1211_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1210_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1211_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1212_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1213_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1214_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16_PORTBDATAOUT_bus\);

\bancoRegs|registrador~342\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~65_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a16~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~342_q\);

\bancoRegs|registrador~1432\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1432_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~54_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~86_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~118_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~150_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~86_q\,
	datab => \bancoRegs|ALT_INV_registrador~150_q\,
	datac => \bancoRegs|ALT_INV_registrador~118_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~54_q\,
	combout => \bancoRegs|registrador~1432_combout\);

\bancoRegs|registrador~1206\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1206_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1432_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1432_combout\ & ((\bancoRegs|registrador~310_q\))) # 
-- (\bancoRegs|registrador~1432_combout\ & (\bancoRegs|registrador~342_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1432_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1432_combout\ & 
-- ((\bancoRegs|registrador~374_q\))) # (\bancoRegs|registrador~1432_combout\ & (\bancoRegs|registrador~406_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~342_q\,
	datab => \bancoRegs|ALT_INV_registrador~406_q\,
	datac => \bancoRegs|ALT_INV_registrador~374_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1432_combout\,
	datag => \bancoRegs|ALT_INV_registrador~310_q\,
	combout => \bancoRegs|registrador~1206_combout\);

\ULA|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~65_sumout\ = SUM(( \bancoRegs|registrador~1206_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1214_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1214_combout\))))) ) + ( \ULA|Add0~62\ ))
-- \ULA|Add0~66\ = CARRY(( \bancoRegs|registrador~1206_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1214_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1214_combout\))))) ) + ( \ULA|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1206_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1214_combout\,
	cin => \ULA|Add0~62\,
	sumout => \ULA|Add0~65_sumout\,
	cout => \ULA|Add0~66\);

\bancoRegs|registrador~87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~87_q\);

\bancoRegs|registrador~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~311_q\);

\bancoRegs|registrador~1219\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1219_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~343_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~311_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~87_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~55_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~87_q\,
	datab => \bancoRegs|ALT_INV_registrador~55_q\,
	datac => \bancoRegs|ALT_INV_registrador~343_q\,
	datad => \bancoRegs|ALT_INV_registrador~311_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1219_combout\);

\bancoRegs|registrador~599\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~599_q\);

\bancoRegs|registrador~567\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~567_q\);

\bancoRegs|registrador~855\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~855_q\);

\bancoRegs|registrador~823\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~823_q\);

\bancoRegs|registrador~1220\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1220_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~855_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~823_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~599_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~567_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~599_q\,
	datab => \bancoRegs|ALT_INV_registrador~567_q\,
	datac => \bancoRegs|ALT_INV_registrador~855_q\,
	datad => \bancoRegs|ALT_INV_registrador~823_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1220_combout\);

\bancoRegs|registrador~151\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~151_q\);

\bancoRegs|registrador~119\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~119_q\);

\bancoRegs|registrador~407\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~407_q\);

\bancoRegs|registrador~375\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~375_q\);

\bancoRegs|registrador~1221\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1221_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~407_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~375_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~151_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~119_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~151_q\,
	datab => \bancoRegs|ALT_INV_registrador~119_q\,
	datac => \bancoRegs|ALT_INV_registrador~407_q\,
	datad => \bancoRegs|ALT_INV_registrador~375_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1221_combout\);

\bancoRegs|registrador~663\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~663_q\);

\bancoRegs|registrador~631\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~631_q\);

\bancoRegs|registrador~919\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~919_q\);

\bancoRegs|registrador~887\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~887_q\);

\bancoRegs|registrador~1222\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1222_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~919_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~887_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~663_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~631_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~663_q\,
	datab => \bancoRegs|ALT_INV_registrador~631_q\,
	datac => \bancoRegs|ALT_INV_registrador~919_q\,
	datad => \bancoRegs|ALT_INV_registrador~887_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1222_combout\);

\bancoRegs|registrador~1223\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1223_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1222_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1221_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1220_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1219_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1219_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1220_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1221_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1222_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1223_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17_PORTBDATAOUT_bus\);

\bancoRegs|registrador~343\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~69_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a17~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~343_q\);

\bancoRegs|registrador~1436\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1436_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~55_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~87_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~119_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~151_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~87_q\,
	datab => \bancoRegs|ALT_INV_registrador~151_q\,
	datac => \bancoRegs|ALT_INV_registrador~119_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~55_q\,
	combout => \bancoRegs|registrador~1436_combout\);

\bancoRegs|registrador~1215\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1215_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1436_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1436_combout\ & ((\bancoRegs|registrador~311_q\))) # 
-- (\bancoRegs|registrador~1436_combout\ & (\bancoRegs|registrador~343_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1436_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1436_combout\ & 
-- ((\bancoRegs|registrador~375_q\))) # (\bancoRegs|registrador~1436_combout\ & (\bancoRegs|registrador~407_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~343_q\,
	datab => \bancoRegs|ALT_INV_registrador~407_q\,
	datac => \bancoRegs|ALT_INV_registrador~375_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1436_combout\,
	datag => \bancoRegs|ALT_INV_registrador~311_q\,
	combout => \bancoRegs|registrador~1215_combout\);

\ULA|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~69_sumout\ = SUM(( \bancoRegs|registrador~1215_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1223_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1223_combout\))))) ) + ( \ULA|Add0~66\ ))
-- \ULA|Add0~70\ = CARRY(( \bancoRegs|registrador~1215_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1223_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1223_combout\))))) ) + ( \ULA|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1215_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1223_combout\,
	cin => \ULA|Add0~66\,
	sumout => \ULA|Add0~69_sumout\,
	cout => \ULA|Add0~70\);

\bancoRegs|registrador~88\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~88_q\);

\bancoRegs|registrador~600\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~600_q\);

\bancoRegs|registrador~152\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~152_q\);

\bancoRegs|registrador~664\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~664_q\);

\bancoRegs|registrador~1228\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1228_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~664_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~152_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~600_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~88_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~88_q\,
	datab => \bancoRegs|ALT_INV_registrador~600_q\,
	datac => \bancoRegs|ALT_INV_registrador~152_q\,
	datad => \bancoRegs|ALT_INV_registrador~664_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1228_combout\);

\bancoRegs|registrador~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~56_q\);

\bancoRegs|registrador~568\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~568_q\);

\bancoRegs|registrador~120\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~120_q\);

\bancoRegs|registrador~632\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~632_q\);

\bancoRegs|registrador~1229\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1229_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~632_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~120_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~568_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~56_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~56_q\,
	datab => \bancoRegs|ALT_INV_registrador~568_q\,
	datac => \bancoRegs|ALT_INV_registrador~120_q\,
	datad => \bancoRegs|ALT_INV_registrador~632_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1229_combout\);

\bancoRegs|registrador~856\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~856_q\);

\bancoRegs|registrador~408\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~408_q\);

\bancoRegs|registrador~920\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~920_q\);

\bancoRegs|registrador~1230\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1230_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~920_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~408_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~856_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~344_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~344_q\,
	datab => \bancoRegs|ALT_INV_registrador~856_q\,
	datac => \bancoRegs|ALT_INV_registrador~408_q\,
	datad => \bancoRegs|ALT_INV_registrador~920_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1230_combout\);

\bancoRegs|registrador~312\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~312_q\);

\bancoRegs|registrador~824\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~824_q\);

\bancoRegs|registrador~376\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~376_q\);

\bancoRegs|registrador~888\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~888_q\);

\bancoRegs|registrador~1231\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1231_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~888_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~376_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~824_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~312_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~312_q\,
	datab => \bancoRegs|ALT_INV_registrador~824_q\,
	datac => \bancoRegs|ALT_INV_registrador~376_q\,
	datad => \bancoRegs|ALT_INV_registrador~888_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1231_combout\);

\bancoRegs|registrador~1232\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1232_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1230_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1231_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1228_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1229_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1228_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1229_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1230_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1231_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1232_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18_PORTBDATAOUT_bus\);

\bancoRegs|registrador~344\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~73_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a18~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~344_q\);

\bancoRegs|registrador~1440\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1440_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~56_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~88_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~120_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~152_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~88_q\,
	datab => \bancoRegs|ALT_INV_registrador~152_q\,
	datac => \bancoRegs|ALT_INV_registrador~120_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~56_q\,
	combout => \bancoRegs|registrador~1440_combout\);

\bancoRegs|registrador~1224\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1224_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1440_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1440_combout\ & ((\bancoRegs|registrador~312_q\))) # 
-- (\bancoRegs|registrador~1440_combout\ & (\bancoRegs|registrador~344_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1440_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1440_combout\ & 
-- ((\bancoRegs|registrador~376_q\))) # (\bancoRegs|registrador~1440_combout\ & (\bancoRegs|registrador~408_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~344_q\,
	datab => \bancoRegs|ALT_INV_registrador~408_q\,
	datac => \bancoRegs|ALT_INV_registrador~376_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1440_combout\,
	datag => \bancoRegs|ALT_INV_registrador~312_q\,
	combout => \bancoRegs|registrador~1224_combout\);

\ULA|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~73_sumout\ = SUM(( \bancoRegs|registrador~1224_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1232_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1232_combout\))))) ) + ( \ULA|Add0~70\ ))
-- \ULA|Add0~74\ = CARRY(( \bancoRegs|registrador~1224_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1232_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1232_combout\))))) ) + ( \ULA|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1224_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1232_combout\,
	cin => \ULA|Add0~70\,
	sumout => \ULA|Add0~73_sumout\,
	cout => \ULA|Add0~74\);

\bancoRegs|registrador~89\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~89_q\);

\bancoRegs|registrador~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~313_q\);

\bancoRegs|registrador~1237\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1237_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~345_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~313_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~89_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~57_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~89_q\,
	datab => \bancoRegs|ALT_INV_registrador~57_q\,
	datac => \bancoRegs|ALT_INV_registrador~345_q\,
	datad => \bancoRegs|ALT_INV_registrador~313_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1237_combout\);

\bancoRegs|registrador~601\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~601_q\);

\bancoRegs|registrador~569\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~569_q\);

\bancoRegs|registrador~857\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~857_q\);

\bancoRegs|registrador~825\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~825_q\);

\bancoRegs|registrador~1238\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1238_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~857_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~825_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~601_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~569_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~601_q\,
	datab => \bancoRegs|ALT_INV_registrador~569_q\,
	datac => \bancoRegs|ALT_INV_registrador~857_q\,
	datad => \bancoRegs|ALT_INV_registrador~825_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1238_combout\);

\bancoRegs|registrador~153\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~153_q\);

\bancoRegs|registrador~121\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~121_q\);

\bancoRegs|registrador~409\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~409_q\);

\bancoRegs|registrador~377\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~377_q\);

\bancoRegs|registrador~1239\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1239_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~409_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~377_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~153_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~121_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~153_q\,
	datab => \bancoRegs|ALT_INV_registrador~121_q\,
	datac => \bancoRegs|ALT_INV_registrador~409_q\,
	datad => \bancoRegs|ALT_INV_registrador~377_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1239_combout\);

\bancoRegs|registrador~665\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~665_q\);

\bancoRegs|registrador~633\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~633_q\);

\bancoRegs|registrador~921\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~921_q\);

\bancoRegs|registrador~889\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~889_q\);

\bancoRegs|registrador~1240\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1240_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~921_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~889_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~665_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~633_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~665_q\,
	datab => \bancoRegs|ALT_INV_registrador~633_q\,
	datac => \bancoRegs|ALT_INV_registrador~921_q\,
	datad => \bancoRegs|ALT_INV_registrador~889_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1240_combout\);

\bancoRegs|registrador~1241\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1241_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1240_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1239_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1238_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1237_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1237_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1238_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1239_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1240_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1241_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19_PORTBDATAOUT_bus\);

\bancoRegs|registrador~345\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~77_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a19~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~345_q\);

\bancoRegs|registrador~1444\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1444_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~57_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~89_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~121_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~153_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~89_q\,
	datab => \bancoRegs|ALT_INV_registrador~153_q\,
	datac => \bancoRegs|ALT_INV_registrador~121_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~57_q\,
	combout => \bancoRegs|registrador~1444_combout\);

\bancoRegs|registrador~1233\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1233_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1444_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1444_combout\ & ((\bancoRegs|registrador~313_q\))) # 
-- (\bancoRegs|registrador~1444_combout\ & (\bancoRegs|registrador~345_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1444_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1444_combout\ & 
-- ((\bancoRegs|registrador~377_q\))) # (\bancoRegs|registrador~1444_combout\ & (\bancoRegs|registrador~409_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~345_q\,
	datab => \bancoRegs|ALT_INV_registrador~409_q\,
	datac => \bancoRegs|ALT_INV_registrador~377_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1444_combout\,
	datag => \bancoRegs|ALT_INV_registrador~313_q\,
	combout => \bancoRegs|registrador~1233_combout\);

\ULA|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~77_sumout\ = SUM(( \bancoRegs|registrador~1233_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1241_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1241_combout\))))) ) + ( \ULA|Add0~74\ ))
-- \ULA|Add0~78\ = CARRY(( \bancoRegs|registrador~1233_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1241_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1241_combout\))))) ) + ( \ULA|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1233_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1241_combout\,
	cin => \ULA|Add0~74\,
	sumout => \ULA|Add0~77_sumout\,
	cout => \ULA|Add0~78\);

\bancoRegs|registrador~90\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~90_q\);

\bancoRegs|registrador~602\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~602_q\);

\bancoRegs|registrador~154\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~154_q\);

\bancoRegs|registrador~666\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~666_q\);

\bancoRegs|registrador~1246\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1246_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~666_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~154_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~602_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~90_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~90_q\,
	datab => \bancoRegs|ALT_INV_registrador~602_q\,
	datac => \bancoRegs|ALT_INV_registrador~154_q\,
	datad => \bancoRegs|ALT_INV_registrador~666_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1246_combout\);

\bancoRegs|registrador~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~58_q\);

\bancoRegs|registrador~570\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~570_q\);

\bancoRegs|registrador~122\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~122_q\);

\bancoRegs|registrador~634\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~634_q\);

\bancoRegs|registrador~1247\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1247_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~634_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~122_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~570_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~58_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~58_q\,
	datab => \bancoRegs|ALT_INV_registrador~570_q\,
	datac => \bancoRegs|ALT_INV_registrador~122_q\,
	datad => \bancoRegs|ALT_INV_registrador~634_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1247_combout\);

\bancoRegs|registrador~858\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~858_q\);

\bancoRegs|registrador~410\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~410_q\);

\bancoRegs|registrador~922\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~922_q\);

\bancoRegs|registrador~1248\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1248_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~922_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~410_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~858_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~346_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~346_q\,
	datab => \bancoRegs|ALT_INV_registrador~858_q\,
	datac => \bancoRegs|ALT_INV_registrador~410_q\,
	datad => \bancoRegs|ALT_INV_registrador~922_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1248_combout\);

\bancoRegs|registrador~314\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~314_q\);

\bancoRegs|registrador~826\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~826_q\);

\bancoRegs|registrador~378\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~378_q\);

\bancoRegs|registrador~890\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~890_q\);

\bancoRegs|registrador~1249\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1249_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~890_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~378_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~826_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~314_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~314_q\,
	datab => \bancoRegs|ALT_INV_registrador~826_q\,
	datac => \bancoRegs|ALT_INV_registrador~378_q\,
	datad => \bancoRegs|ALT_INV_registrador~890_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1249_combout\);

\bancoRegs|registrador~1250\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1250_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1248_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1249_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1246_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1247_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1246_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1247_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1248_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1249_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1250_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20_PORTBDATAOUT_bus\);

\bancoRegs|registrador~346\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~81_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a20~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~346_q\);

\bancoRegs|registrador~1448\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1448_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~58_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~90_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~122_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~154_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~90_q\,
	datab => \bancoRegs|ALT_INV_registrador~154_q\,
	datac => \bancoRegs|ALT_INV_registrador~122_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~58_q\,
	combout => \bancoRegs|registrador~1448_combout\);

\bancoRegs|registrador~1242\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1242_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1448_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1448_combout\ & ((\bancoRegs|registrador~314_q\))) # 
-- (\bancoRegs|registrador~1448_combout\ & (\bancoRegs|registrador~346_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1448_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1448_combout\ & 
-- ((\bancoRegs|registrador~378_q\))) # (\bancoRegs|registrador~1448_combout\ & (\bancoRegs|registrador~410_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~346_q\,
	datab => \bancoRegs|ALT_INV_registrador~410_q\,
	datac => \bancoRegs|ALT_INV_registrador~378_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1448_combout\,
	datag => \bancoRegs|ALT_INV_registrador~314_q\,
	combout => \bancoRegs|registrador~1242_combout\);

\ULA|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~81_sumout\ = SUM(( \bancoRegs|registrador~1242_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1250_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1250_combout\))))) ) + ( \ULA|Add0~78\ ))
-- \ULA|Add0~82\ = CARRY(( \bancoRegs|registrador~1242_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1250_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1250_combout\))))) ) + ( \ULA|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1242_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1250_combout\,
	cin => \ULA|Add0~78\,
	sumout => \ULA|Add0~81_sumout\,
	cout => \ULA|Add0~82\);

\bancoRegs|registrador~91\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~91_q\);

\bancoRegs|registrador~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~315_q\);

\bancoRegs|registrador~1255\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1255_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~347_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~315_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~91_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~59_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~91_q\,
	datab => \bancoRegs|ALT_INV_registrador~59_q\,
	datac => \bancoRegs|ALT_INV_registrador~347_q\,
	datad => \bancoRegs|ALT_INV_registrador~315_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1255_combout\);

\bancoRegs|registrador~603\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~603_q\);

\bancoRegs|registrador~571\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~571_q\);

\bancoRegs|registrador~859\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~859_q\);

\bancoRegs|registrador~827\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~827_q\);

\bancoRegs|registrador~1256\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1256_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~859_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~827_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~603_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~571_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~603_q\,
	datab => \bancoRegs|ALT_INV_registrador~571_q\,
	datac => \bancoRegs|ALT_INV_registrador~859_q\,
	datad => \bancoRegs|ALT_INV_registrador~827_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1256_combout\);

\bancoRegs|registrador~155\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~155_q\);

\bancoRegs|registrador~123\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~123_q\);

\bancoRegs|registrador~411\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~411_q\);

\bancoRegs|registrador~379\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~379_q\);

\bancoRegs|registrador~1257\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1257_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~411_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~379_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~155_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~123_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~155_q\,
	datab => \bancoRegs|ALT_INV_registrador~123_q\,
	datac => \bancoRegs|ALT_INV_registrador~411_q\,
	datad => \bancoRegs|ALT_INV_registrador~379_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1257_combout\);

\bancoRegs|registrador~667\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~667_q\);

\bancoRegs|registrador~635\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~635_q\);

\bancoRegs|registrador~923\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~923_q\);

\bancoRegs|registrador~891\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~891_q\);

\bancoRegs|registrador~1258\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1258_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~923_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~891_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~667_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~635_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~667_q\,
	datab => \bancoRegs|ALT_INV_registrador~635_q\,
	datac => \bancoRegs|ALT_INV_registrador~923_q\,
	datad => \bancoRegs|ALT_INV_registrador~891_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1258_combout\);

\bancoRegs|registrador~1259\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1259_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1258_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1257_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1256_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1255_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1255_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1256_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1257_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1258_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1259_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21_PORTBDATAOUT_bus\);

\bancoRegs|registrador~347\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~85_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a21~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~347_q\);

\bancoRegs|registrador~1452\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1452_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~59_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~91_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~123_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~155_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~91_q\,
	datab => \bancoRegs|ALT_INV_registrador~155_q\,
	datac => \bancoRegs|ALT_INV_registrador~123_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~59_q\,
	combout => \bancoRegs|registrador~1452_combout\);

\bancoRegs|registrador~1251\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1251_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1452_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1452_combout\ & ((\bancoRegs|registrador~315_q\))) # 
-- (\bancoRegs|registrador~1452_combout\ & (\bancoRegs|registrador~347_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1452_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1452_combout\ & 
-- ((\bancoRegs|registrador~379_q\))) # (\bancoRegs|registrador~1452_combout\ & (\bancoRegs|registrador~411_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~347_q\,
	datab => \bancoRegs|ALT_INV_registrador~411_q\,
	datac => \bancoRegs|ALT_INV_registrador~379_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1452_combout\,
	datag => \bancoRegs|ALT_INV_registrador~315_q\,
	combout => \bancoRegs|registrador~1251_combout\);

\ULA|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~85_sumout\ = SUM(( \bancoRegs|registrador~1251_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1259_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1259_combout\))))) ) + ( \ULA|Add0~82\ ))
-- \ULA|Add0~86\ = CARRY(( \bancoRegs|registrador~1251_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1259_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1259_combout\))))) ) + ( \ULA|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1251_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1259_combout\,
	cin => \ULA|Add0~82\,
	sumout => \ULA|Add0~85_sumout\,
	cout => \ULA|Add0~86\);

\bancoRegs|registrador~92\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~92_q\);

\bancoRegs|registrador~604\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~604_q\);

\bancoRegs|registrador~156\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~156_q\);

\bancoRegs|registrador~668\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~668_q\);

\bancoRegs|registrador~1264\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1264_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~668_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~156_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~604_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~92_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~92_q\,
	datab => \bancoRegs|ALT_INV_registrador~604_q\,
	datac => \bancoRegs|ALT_INV_registrador~156_q\,
	datad => \bancoRegs|ALT_INV_registrador~668_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1264_combout\);

\bancoRegs|registrador~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~60_q\);

\bancoRegs|registrador~572\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~572_q\);

\bancoRegs|registrador~124\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~124_q\);

\bancoRegs|registrador~636\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~636_q\);

\bancoRegs|registrador~1265\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1265_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~636_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~124_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~572_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~60_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~60_q\,
	datab => \bancoRegs|ALT_INV_registrador~572_q\,
	datac => \bancoRegs|ALT_INV_registrador~124_q\,
	datad => \bancoRegs|ALT_INV_registrador~636_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1265_combout\);

\bancoRegs|registrador~860\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~860_q\);

\bancoRegs|registrador~412\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~412_q\);

\bancoRegs|registrador~924\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~924_q\);

\bancoRegs|registrador~1266\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1266_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~924_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~412_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~860_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~348_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~348_q\,
	datab => \bancoRegs|ALT_INV_registrador~860_q\,
	datac => \bancoRegs|ALT_INV_registrador~412_q\,
	datad => \bancoRegs|ALT_INV_registrador~924_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1266_combout\);

\bancoRegs|registrador~316\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~316_q\);

\bancoRegs|registrador~828\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~828_q\);

\bancoRegs|registrador~380\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~380_q\);

\bancoRegs|registrador~892\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~892_q\);

\bancoRegs|registrador~1267\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1267_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~892_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~380_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~828_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~316_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~316_q\,
	datab => \bancoRegs|ALT_INV_registrador~828_q\,
	datac => \bancoRegs|ALT_INV_registrador~380_q\,
	datad => \bancoRegs|ALT_INV_registrador~892_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1267_combout\);

\bancoRegs|registrador~1268\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1268_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1266_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1267_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1264_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1265_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1264_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1265_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1266_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1267_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1268_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22_PORTBDATAOUT_bus\);

\bancoRegs|registrador~348\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~89_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a22~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~348_q\);

\bancoRegs|registrador~1456\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1456_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~60_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~92_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~124_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~156_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~92_q\,
	datab => \bancoRegs|ALT_INV_registrador~156_q\,
	datac => \bancoRegs|ALT_INV_registrador~124_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~60_q\,
	combout => \bancoRegs|registrador~1456_combout\);

\bancoRegs|registrador~1260\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1260_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1456_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1456_combout\ & ((\bancoRegs|registrador~316_q\))) # 
-- (\bancoRegs|registrador~1456_combout\ & (\bancoRegs|registrador~348_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1456_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1456_combout\ & 
-- ((\bancoRegs|registrador~380_q\))) # (\bancoRegs|registrador~1456_combout\ & (\bancoRegs|registrador~412_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~348_q\,
	datab => \bancoRegs|ALT_INV_registrador~412_q\,
	datac => \bancoRegs|ALT_INV_registrador~380_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1456_combout\,
	datag => \bancoRegs|ALT_INV_registrador~316_q\,
	combout => \bancoRegs|registrador~1260_combout\);

\ULA|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~89_sumout\ = SUM(( \bancoRegs|registrador~1260_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1268_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1268_combout\))))) ) + ( \ULA|Add0~86\ ))
-- \ULA|Add0~90\ = CARRY(( \bancoRegs|registrador~1260_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1268_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1268_combout\))))) ) + ( \ULA|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1260_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1268_combout\,
	cin => \ULA|Add0~86\,
	sumout => \ULA|Add0~89_sumout\,
	cout => \ULA|Add0~90\);

\bancoRegs|registrador~93\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~93_q\);

\bancoRegs|registrador~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~317_q\);

\bancoRegs|registrador~1273\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1273_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~349_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~317_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~93_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~61_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~93_q\,
	datab => \bancoRegs|ALT_INV_registrador~61_q\,
	datac => \bancoRegs|ALT_INV_registrador~349_q\,
	datad => \bancoRegs|ALT_INV_registrador~317_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1273_combout\);

\bancoRegs|registrador~605\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~605_q\);

\bancoRegs|registrador~573\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~573_q\);

\bancoRegs|registrador~861\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~861_q\);

\bancoRegs|registrador~829\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~829_q\);

\bancoRegs|registrador~1274\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1274_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~861_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~829_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~605_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~573_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~605_q\,
	datab => \bancoRegs|ALT_INV_registrador~573_q\,
	datac => \bancoRegs|ALT_INV_registrador~861_q\,
	datad => \bancoRegs|ALT_INV_registrador~829_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1274_combout\);

\bancoRegs|registrador~157\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~157_q\);

\bancoRegs|registrador~125\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~125_q\);

\bancoRegs|registrador~413\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~413_q\);

\bancoRegs|registrador~381\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~381_q\);

\bancoRegs|registrador~1275\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1275_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~413_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~381_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~157_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~125_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~157_q\,
	datab => \bancoRegs|ALT_INV_registrador~125_q\,
	datac => \bancoRegs|ALT_INV_registrador~413_q\,
	datad => \bancoRegs|ALT_INV_registrador~381_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1275_combout\);

\bancoRegs|registrador~669\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~669_q\);

\bancoRegs|registrador~637\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~637_q\);

\bancoRegs|registrador~925\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~925_q\);

\bancoRegs|registrador~893\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~893_q\);

\bancoRegs|registrador~1276\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1276_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~925_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~893_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~669_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~637_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~669_q\,
	datab => \bancoRegs|ALT_INV_registrador~637_q\,
	datac => \bancoRegs|ALT_INV_registrador~925_q\,
	datad => \bancoRegs|ALT_INV_registrador~893_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1276_combout\);

\bancoRegs|registrador~1277\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1277_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1276_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1275_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1274_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1273_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1273_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1274_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1275_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1276_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1277_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23_PORTBDATAOUT_bus\);

\bancoRegs|registrador~349\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~93_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a23~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~349_q\);

\bancoRegs|registrador~1460\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1460_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~61_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~93_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~125_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~157_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~93_q\,
	datab => \bancoRegs|ALT_INV_registrador~157_q\,
	datac => \bancoRegs|ALT_INV_registrador~125_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~61_q\,
	combout => \bancoRegs|registrador~1460_combout\);

\bancoRegs|registrador~1269\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1269_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1460_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1460_combout\ & ((\bancoRegs|registrador~317_q\))) # 
-- (\bancoRegs|registrador~1460_combout\ & (\bancoRegs|registrador~349_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1460_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1460_combout\ & 
-- ((\bancoRegs|registrador~381_q\))) # (\bancoRegs|registrador~1460_combout\ & (\bancoRegs|registrador~413_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~349_q\,
	datab => \bancoRegs|ALT_INV_registrador~413_q\,
	datac => \bancoRegs|ALT_INV_registrador~381_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1460_combout\,
	datag => \bancoRegs|ALT_INV_registrador~317_q\,
	combout => \bancoRegs|registrador~1269_combout\);

\ULA|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~93_sumout\ = SUM(( \bancoRegs|registrador~1269_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1277_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1277_combout\))))) ) + ( \ULA|Add0~90\ ))
-- \ULA|Add0~94\ = CARRY(( \bancoRegs|registrador~1269_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1277_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1277_combout\))))) ) + ( \ULA|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1269_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1277_combout\,
	cin => \ULA|Add0~90\,
	sumout => \ULA|Add0~93_sumout\,
	cout => \ULA|Add0~94\);

\bancoRegs|registrador~94\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~94_q\);

\bancoRegs|registrador~606\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~606_q\);

\bancoRegs|registrador~158\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~158_q\);

\bancoRegs|registrador~670\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~670_q\);

\bancoRegs|registrador~1282\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1282_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~670_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~158_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~606_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~94_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~94_q\,
	datab => \bancoRegs|ALT_INV_registrador~606_q\,
	datac => \bancoRegs|ALT_INV_registrador~158_q\,
	datad => \bancoRegs|ALT_INV_registrador~670_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1282_combout\);

\bancoRegs|registrador~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~62_q\);

\bancoRegs|registrador~574\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~574_q\);

\bancoRegs|registrador~126\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~126_q\);

\bancoRegs|registrador~638\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~638_q\);

\bancoRegs|registrador~1283\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1283_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~638_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~126_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~574_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~62_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~62_q\,
	datab => \bancoRegs|ALT_INV_registrador~574_q\,
	datac => \bancoRegs|ALT_INV_registrador~126_q\,
	datad => \bancoRegs|ALT_INV_registrador~638_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1283_combout\);

\bancoRegs|registrador~862\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~862_q\);

\bancoRegs|registrador~414\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~414_q\);

\bancoRegs|registrador~926\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~926_q\);

\bancoRegs|registrador~1284\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1284_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~926_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~414_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~862_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~350_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~350_q\,
	datab => \bancoRegs|ALT_INV_registrador~862_q\,
	datac => \bancoRegs|ALT_INV_registrador~414_q\,
	datad => \bancoRegs|ALT_INV_registrador~926_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1284_combout\);

\bancoRegs|registrador~318\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~318_q\);

\bancoRegs|registrador~830\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~830_q\);

\bancoRegs|registrador~382\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~382_q\);

\bancoRegs|registrador~894\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~894_q\);

\bancoRegs|registrador~1285\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1285_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~894_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~382_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~830_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~318_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~318_q\,
	datab => \bancoRegs|ALT_INV_registrador~830_q\,
	datac => \bancoRegs|ALT_INV_registrador~382_q\,
	datad => \bancoRegs|ALT_INV_registrador~894_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1285_combout\);

\bancoRegs|registrador~1286\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1286_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1284_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1285_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1282_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1283_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1282_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1283_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1284_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1285_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1286_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24_PORTBDATAOUT_bus\);

\bancoRegs|registrador~350\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~97_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a24~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~350_q\);

\bancoRegs|registrador~1464\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1464_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~62_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~94_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~126_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~158_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~94_q\,
	datab => \bancoRegs|ALT_INV_registrador~158_q\,
	datac => \bancoRegs|ALT_INV_registrador~126_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~62_q\,
	combout => \bancoRegs|registrador~1464_combout\);

\bancoRegs|registrador~1278\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1278_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1464_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1464_combout\ & ((\bancoRegs|registrador~318_q\))) # 
-- (\bancoRegs|registrador~1464_combout\ & (\bancoRegs|registrador~350_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1464_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1464_combout\ & 
-- ((\bancoRegs|registrador~382_q\))) # (\bancoRegs|registrador~1464_combout\ & (\bancoRegs|registrador~414_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~350_q\,
	datab => \bancoRegs|ALT_INV_registrador~414_q\,
	datac => \bancoRegs|ALT_INV_registrador~382_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1464_combout\,
	datag => \bancoRegs|ALT_INV_registrador~318_q\,
	combout => \bancoRegs|registrador~1278_combout\);

\ULA|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~97_sumout\ = SUM(( \bancoRegs|registrador~1278_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1286_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1286_combout\))))) ) + ( \ULA|Add0~94\ ))
-- \ULA|Add0~98\ = CARRY(( \bancoRegs|registrador~1278_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1286_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1286_combout\))))) ) + ( \ULA|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1278_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1286_combout\,
	cin => \ULA|Add0~94\,
	sumout => \ULA|Add0~97_sumout\,
	cout => \ULA|Add0~98\);

\bancoRegs|registrador~95\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~95_q\);

\bancoRegs|registrador~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~319_q\);

\bancoRegs|registrador~1291\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1291_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~351_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~319_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~95_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~63_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~95_q\,
	datab => \bancoRegs|ALT_INV_registrador~63_q\,
	datac => \bancoRegs|ALT_INV_registrador~351_q\,
	datad => \bancoRegs|ALT_INV_registrador~319_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1291_combout\);

\bancoRegs|registrador~607\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~607_q\);

\bancoRegs|registrador~575\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~575_q\);

\bancoRegs|registrador~863\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~863_q\);

\bancoRegs|registrador~831\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~831_q\);

\bancoRegs|registrador~1292\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1292_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~863_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~831_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~607_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~575_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~607_q\,
	datab => \bancoRegs|ALT_INV_registrador~575_q\,
	datac => \bancoRegs|ALT_INV_registrador~863_q\,
	datad => \bancoRegs|ALT_INV_registrador~831_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1292_combout\);

\bancoRegs|registrador~159\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~159_q\);

\bancoRegs|registrador~127\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~127_q\);

\bancoRegs|registrador~415\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~415_q\);

\bancoRegs|registrador~383\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~383_q\);

\bancoRegs|registrador~1293\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1293_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~415_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~383_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~159_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~127_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~159_q\,
	datab => \bancoRegs|ALT_INV_registrador~127_q\,
	datac => \bancoRegs|ALT_INV_registrador~415_q\,
	datad => \bancoRegs|ALT_INV_registrador~383_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1293_combout\);

\bancoRegs|registrador~671\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~671_q\);

\bancoRegs|registrador~639\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~639_q\);

\bancoRegs|registrador~927\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~927_q\);

\bancoRegs|registrador~895\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~895_q\);

\bancoRegs|registrador~1294\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1294_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~927_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~895_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~671_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~639_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~671_q\,
	datab => \bancoRegs|ALT_INV_registrador~639_q\,
	datac => \bancoRegs|ALT_INV_registrador~927_q\,
	datad => \bancoRegs|ALT_INV_registrador~895_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1294_combout\);

\bancoRegs|registrador~1295\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1295_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1294_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1293_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1292_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1291_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1291_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1292_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1293_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1294_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1295_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25_PORTBDATAOUT_bus\);

\bancoRegs|registrador~351\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~101_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a25~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~351_q\);

\bancoRegs|registrador~1468\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1468_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~63_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~95_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~127_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~159_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~95_q\,
	datab => \bancoRegs|ALT_INV_registrador~159_q\,
	datac => \bancoRegs|ALT_INV_registrador~127_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~63_q\,
	combout => \bancoRegs|registrador~1468_combout\);

\bancoRegs|registrador~1287\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1287_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1468_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1468_combout\ & ((\bancoRegs|registrador~319_q\))) # 
-- (\bancoRegs|registrador~1468_combout\ & (\bancoRegs|registrador~351_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1468_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1468_combout\ & 
-- ((\bancoRegs|registrador~383_q\))) # (\bancoRegs|registrador~1468_combout\ & (\bancoRegs|registrador~415_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~351_q\,
	datab => \bancoRegs|ALT_INV_registrador~415_q\,
	datac => \bancoRegs|ALT_INV_registrador~383_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1468_combout\,
	datag => \bancoRegs|ALT_INV_registrador~319_q\,
	combout => \bancoRegs|registrador~1287_combout\);

\ULA|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~101_sumout\ = SUM(( \bancoRegs|registrador~1287_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1295_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1295_combout\))))) ) + ( \ULA|Add0~98\ ))
-- \ULA|Add0~102\ = CARRY(( \bancoRegs|registrador~1287_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1295_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1295_combout\))))) ) + ( \ULA|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1287_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1295_combout\,
	cin => \ULA|Add0~98\,
	sumout => \ULA|Add0~101_sumout\,
	cout => \ULA|Add0~102\);

\bancoRegs|registrador~96\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~96_q\);

\bancoRegs|registrador~608\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~608_q\);

\bancoRegs|registrador~160\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~160_q\);

\bancoRegs|registrador~672\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~672_q\);

\bancoRegs|registrador~1300\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1300_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~672_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~160_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~608_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~96_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~96_q\,
	datab => \bancoRegs|ALT_INV_registrador~608_q\,
	datac => \bancoRegs|ALT_INV_registrador~160_q\,
	datad => \bancoRegs|ALT_INV_registrador~672_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1300_combout\);

\bancoRegs|registrador~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~64_q\);

\bancoRegs|registrador~576\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~576_q\);

\bancoRegs|registrador~128\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~128_q\);

\bancoRegs|registrador~640\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~640_q\);

\bancoRegs|registrador~1301\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1301_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~640_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~128_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~576_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~64_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~64_q\,
	datab => \bancoRegs|ALT_INV_registrador~576_q\,
	datac => \bancoRegs|ALT_INV_registrador~128_q\,
	datad => \bancoRegs|ALT_INV_registrador~640_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1301_combout\);

\bancoRegs|registrador~864\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~864_q\);

\bancoRegs|registrador~416\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~416_q\);

\bancoRegs|registrador~928\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~928_q\);

\bancoRegs|registrador~1302\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1302_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~928_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~416_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~864_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~352_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~352_q\,
	datab => \bancoRegs|ALT_INV_registrador~864_q\,
	datac => \bancoRegs|ALT_INV_registrador~416_q\,
	datad => \bancoRegs|ALT_INV_registrador~928_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1302_combout\);

\bancoRegs|registrador~320\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~320_q\);

\bancoRegs|registrador~832\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~832_q\);

\bancoRegs|registrador~384\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~384_q\);

\bancoRegs|registrador~896\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~896_q\);

\bancoRegs|registrador~1303\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1303_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~896_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~384_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~832_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~320_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~320_q\,
	datab => \bancoRegs|ALT_INV_registrador~832_q\,
	datac => \bancoRegs|ALT_INV_registrador~384_q\,
	datad => \bancoRegs|ALT_INV_registrador~896_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1303_combout\);

\bancoRegs|registrador~1304\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1304_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1302_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1303_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1300_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1301_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1300_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1301_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1302_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1303_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1304_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26_PORTBDATAOUT_bus\);

\bancoRegs|registrador~352\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~105_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a26~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~352_q\);

\bancoRegs|registrador~1472\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1472_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~64_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~96_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~128_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~160_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~96_q\,
	datab => \bancoRegs|ALT_INV_registrador~160_q\,
	datac => \bancoRegs|ALT_INV_registrador~128_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~64_q\,
	combout => \bancoRegs|registrador~1472_combout\);

\bancoRegs|registrador~1296\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1296_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1472_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1472_combout\ & ((\bancoRegs|registrador~320_q\))) # 
-- (\bancoRegs|registrador~1472_combout\ & (\bancoRegs|registrador~352_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1472_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1472_combout\ & 
-- ((\bancoRegs|registrador~384_q\))) # (\bancoRegs|registrador~1472_combout\ & (\bancoRegs|registrador~416_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~352_q\,
	datab => \bancoRegs|ALT_INV_registrador~416_q\,
	datac => \bancoRegs|ALT_INV_registrador~384_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1472_combout\,
	datag => \bancoRegs|ALT_INV_registrador~320_q\,
	combout => \bancoRegs|registrador~1296_combout\);

\ULA|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~105_sumout\ = SUM(( \bancoRegs|registrador~1296_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1304_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1304_combout\))))) ) + ( \ULA|Add0~102\ ))
-- \ULA|Add0~106\ = CARRY(( \bancoRegs|registrador~1296_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1304_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1304_combout\))))) ) + ( \ULA|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1296_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1304_combout\,
	cin => \ULA|Add0~102\,
	sumout => \ULA|Add0~105_sumout\,
	cout => \ULA|Add0~106\);

\bancoRegs|registrador~97\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~97_q\);

\bancoRegs|registrador~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~321_q\);

\bancoRegs|registrador~1309\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1309_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~353_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~321_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~97_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~65_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~97_q\,
	datab => \bancoRegs|ALT_INV_registrador~65_q\,
	datac => \bancoRegs|ALT_INV_registrador~353_q\,
	datad => \bancoRegs|ALT_INV_registrador~321_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1309_combout\);

\bancoRegs|registrador~609\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~609_q\);

\bancoRegs|registrador~577\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~577_q\);

\bancoRegs|registrador~865\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~865_q\);

\bancoRegs|registrador~833\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~833_q\);

\bancoRegs|registrador~1310\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1310_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~865_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~833_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~609_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~577_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~609_q\,
	datab => \bancoRegs|ALT_INV_registrador~577_q\,
	datac => \bancoRegs|ALT_INV_registrador~865_q\,
	datad => \bancoRegs|ALT_INV_registrador~833_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1310_combout\);

\bancoRegs|registrador~161\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~161_q\);

\bancoRegs|registrador~129\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~129_q\);

\bancoRegs|registrador~417\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~417_q\);

\bancoRegs|registrador~385\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~385_q\);

\bancoRegs|registrador~1311\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1311_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~417_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~385_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~161_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~129_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~161_q\,
	datab => \bancoRegs|ALT_INV_registrador~129_q\,
	datac => \bancoRegs|ALT_INV_registrador~417_q\,
	datad => \bancoRegs|ALT_INV_registrador~385_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1311_combout\);

\bancoRegs|registrador~673\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~673_q\);

\bancoRegs|registrador~641\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~641_q\);

\bancoRegs|registrador~929\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~929_q\);

\bancoRegs|registrador~897\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~897_q\);

\bancoRegs|registrador~1312\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1312_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~929_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~897_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~673_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~641_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~673_q\,
	datab => \bancoRegs|ALT_INV_registrador~641_q\,
	datac => \bancoRegs|ALT_INV_registrador~929_q\,
	datad => \bancoRegs|ALT_INV_registrador~897_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1312_combout\);

\bancoRegs|registrador~1313\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1313_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1312_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1311_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1310_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1309_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1309_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1310_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1311_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1312_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1313_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27_PORTBDATAOUT_bus\);

\bancoRegs|registrador~353\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~109_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a27~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~353_q\);

\bancoRegs|registrador~1476\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1476_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~65_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~97_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~129_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~161_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~97_q\,
	datab => \bancoRegs|ALT_INV_registrador~161_q\,
	datac => \bancoRegs|ALT_INV_registrador~129_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~65_q\,
	combout => \bancoRegs|registrador~1476_combout\);

\bancoRegs|registrador~1305\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1305_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1476_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1476_combout\ & ((\bancoRegs|registrador~321_q\))) # 
-- (\bancoRegs|registrador~1476_combout\ & (\bancoRegs|registrador~353_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1476_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1476_combout\ & 
-- ((\bancoRegs|registrador~385_q\))) # (\bancoRegs|registrador~1476_combout\ & (\bancoRegs|registrador~417_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~353_q\,
	datab => \bancoRegs|ALT_INV_registrador~417_q\,
	datac => \bancoRegs|ALT_INV_registrador~385_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1476_combout\,
	datag => \bancoRegs|ALT_INV_registrador~321_q\,
	combout => \bancoRegs|registrador~1305_combout\);

\ULA|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~109_sumout\ = SUM(( \bancoRegs|registrador~1305_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1313_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1313_combout\))))) ) + ( \ULA|Add0~106\ ))
-- \ULA|Add0~110\ = CARRY(( \bancoRegs|registrador~1305_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1313_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1313_combout\))))) ) + ( \ULA|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1305_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1313_combout\,
	cin => \ULA|Add0~106\,
	sumout => \ULA|Add0~109_sumout\,
	cout => \ULA|Add0~110\);

\bancoRegs|registrador~98\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~98_q\);

\bancoRegs|registrador~610\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~610_q\);

\bancoRegs|registrador~162\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~162_q\);

\bancoRegs|registrador~674\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~674_q\);

\bancoRegs|registrador~1318\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1318_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~674_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~162_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~610_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~98_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~98_q\,
	datab => \bancoRegs|ALT_INV_registrador~610_q\,
	datac => \bancoRegs|ALT_INV_registrador~162_q\,
	datad => \bancoRegs|ALT_INV_registrador~674_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1318_combout\);

\bancoRegs|registrador~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~66_q\);

\bancoRegs|registrador~578\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~578_q\);

\bancoRegs|registrador~130\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~130_q\);

\bancoRegs|registrador~642\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~642_q\);

\bancoRegs|registrador~1319\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1319_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~642_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~130_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~578_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~66_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~66_q\,
	datab => \bancoRegs|ALT_INV_registrador~578_q\,
	datac => \bancoRegs|ALT_INV_registrador~130_q\,
	datad => \bancoRegs|ALT_INV_registrador~642_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1319_combout\);

\bancoRegs|registrador~866\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~866_q\);

\bancoRegs|registrador~418\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~418_q\);

\bancoRegs|registrador~930\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~930_q\);

\bancoRegs|registrador~1320\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1320_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~930_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~418_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~866_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~354_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~354_q\,
	datab => \bancoRegs|ALT_INV_registrador~866_q\,
	datac => \bancoRegs|ALT_INV_registrador~418_q\,
	datad => \bancoRegs|ALT_INV_registrador~930_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1320_combout\);

\bancoRegs|registrador~322\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~322_q\);

\bancoRegs|registrador~834\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~834_q\);

\bancoRegs|registrador~386\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~386_q\);

\bancoRegs|registrador~898\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~898_q\);

\bancoRegs|registrador~1321\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1321_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~898_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~386_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~834_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~322_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~322_q\,
	datab => \bancoRegs|ALT_INV_registrador~834_q\,
	datac => \bancoRegs|ALT_INV_registrador~386_q\,
	datad => \bancoRegs|ALT_INV_registrador~898_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1321_combout\);

\bancoRegs|registrador~1322\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1322_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1320_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1321_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1318_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1319_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1318_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1319_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1320_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1321_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1322_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28_PORTBDATAOUT_bus\);

\bancoRegs|registrador~354\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~113_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a28~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~354_q\);

\bancoRegs|registrador~1480\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1480_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~66_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~98_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~130_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~162_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~98_q\,
	datab => \bancoRegs|ALT_INV_registrador~162_q\,
	datac => \bancoRegs|ALT_INV_registrador~130_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~66_q\,
	combout => \bancoRegs|registrador~1480_combout\);

\bancoRegs|registrador~1314\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1314_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1480_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1480_combout\ & ((\bancoRegs|registrador~322_q\))) # 
-- (\bancoRegs|registrador~1480_combout\ & (\bancoRegs|registrador~354_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1480_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1480_combout\ & 
-- ((\bancoRegs|registrador~386_q\))) # (\bancoRegs|registrador~1480_combout\ & (\bancoRegs|registrador~418_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~354_q\,
	datab => \bancoRegs|ALT_INV_registrador~418_q\,
	datac => \bancoRegs|ALT_INV_registrador~386_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1480_combout\,
	datag => \bancoRegs|ALT_INV_registrador~322_q\,
	combout => \bancoRegs|registrador~1314_combout\);

\ULA|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~113_sumout\ = SUM(( \bancoRegs|registrador~1314_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1322_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1322_combout\))))) ) + ( \ULA|Add0~110\ ))
-- \ULA|Add0~114\ = CARRY(( \bancoRegs|registrador~1314_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1322_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1322_combout\))))) ) + ( \ULA|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1314_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1322_combout\,
	cin => \ULA|Add0~110\,
	sumout => \ULA|Add0~113_sumout\,
	cout => \ULA|Add0~114\);

\bancoRegs|registrador~99\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~99_q\);

\bancoRegs|registrador~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~323_q\);

\bancoRegs|registrador~1327\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1327_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~355_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~323_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~99_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~67_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~99_q\,
	datab => \bancoRegs|ALT_INV_registrador~67_q\,
	datac => \bancoRegs|ALT_INV_registrador~355_q\,
	datad => \bancoRegs|ALT_INV_registrador~323_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1327_combout\);

\bancoRegs|registrador~611\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~611_q\);

\bancoRegs|registrador~579\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~579_q\);

\bancoRegs|registrador~867\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~867_q\);

\bancoRegs|registrador~835\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~835_q\);

\bancoRegs|registrador~1328\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1328_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~867_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~835_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~611_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~579_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~611_q\,
	datab => \bancoRegs|ALT_INV_registrador~579_q\,
	datac => \bancoRegs|ALT_INV_registrador~867_q\,
	datad => \bancoRegs|ALT_INV_registrador~835_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1328_combout\);

\bancoRegs|registrador~163\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~163_q\);

\bancoRegs|registrador~131\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~131_q\);

\bancoRegs|registrador~419\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~419_q\);

\bancoRegs|registrador~387\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~387_q\);

\bancoRegs|registrador~1329\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1329_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~419_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~387_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~163_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~131_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~163_q\,
	datab => \bancoRegs|ALT_INV_registrador~131_q\,
	datac => \bancoRegs|ALT_INV_registrador~419_q\,
	datad => \bancoRegs|ALT_INV_registrador~387_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1329_combout\);

\bancoRegs|registrador~675\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~675_q\);

\bancoRegs|registrador~643\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~643_q\);

\bancoRegs|registrador~931\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~931_q\);

\bancoRegs|registrador~899\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~899_q\);

\bancoRegs|registrador~1330\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1330_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~931_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~899_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~675_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~643_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~675_q\,
	datab => \bancoRegs|ALT_INV_registrador~643_q\,
	datac => \bancoRegs|ALT_INV_registrador~931_q\,
	datad => \bancoRegs|ALT_INV_registrador~899_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1330_combout\);

\bancoRegs|registrador~1331\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1331_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1330_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1329_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1328_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1327_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1327_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1328_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1329_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1330_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1331_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29_PORTBDATAOUT_bus\);

\bancoRegs|registrador~355\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~117_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a29~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~355_q\);

\bancoRegs|registrador~1484\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1484_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~67_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~99_q\)))) 
-- ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~131_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # (\bancoRegs|registrador~163_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~99_q\,
	datab => \bancoRegs|ALT_INV_registrador~163_q\,
	datac => \bancoRegs|ALT_INV_registrador~131_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~67_q\,
	combout => \bancoRegs|registrador~1484_combout\);

\bancoRegs|registrador~1323\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1323_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1484_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1484_combout\ & ((\bancoRegs|registrador~323_q\))) # 
-- (\bancoRegs|registrador~1484_combout\ & (\bancoRegs|registrador~355_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1484_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1484_combout\ & 
-- ((\bancoRegs|registrador~387_q\))) # (\bancoRegs|registrador~1484_combout\ & (\bancoRegs|registrador~419_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~355_q\,
	datab => \bancoRegs|ALT_INV_registrador~419_q\,
	datac => \bancoRegs|ALT_INV_registrador~387_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1484_combout\,
	datag => \bancoRegs|ALT_INV_registrador~323_q\,
	combout => \bancoRegs|registrador~1323_combout\);

\ULA|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~117_sumout\ = SUM(( \bancoRegs|registrador~1323_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1331_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1331_combout\))))) ) + ( \ULA|Add0~114\ ))
-- \ULA|Add0~118\ = CARRY(( \bancoRegs|registrador~1323_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1331_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1331_combout\))))) ) + ( \ULA|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1323_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1331_combout\,
	cin => \ULA|Add0~114\,
	sumout => \ULA|Add0~117_sumout\,
	cout => \ULA|Add0~118\);

\bancoRegs|registrador~100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~100_q\);

\bancoRegs|registrador~612\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~612_q\);

\bancoRegs|registrador~164\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~164_q\);

\bancoRegs|registrador~676\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~676_q\);

\bancoRegs|registrador~1336\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1336_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~676_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~164_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~612_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~100_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~100_q\,
	datab => \bancoRegs|ALT_INV_registrador~612_q\,
	datac => \bancoRegs|ALT_INV_registrador~164_q\,
	datad => \bancoRegs|ALT_INV_registrador~676_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1336_combout\);

\bancoRegs|registrador~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~68_q\);

\bancoRegs|registrador~580\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~580_q\);

\bancoRegs|registrador~132\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~132_q\);

\bancoRegs|registrador~644\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~644_q\);

\bancoRegs|registrador~1337\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1337_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~644_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~132_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~580_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~68_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~68_q\,
	datab => \bancoRegs|ALT_INV_registrador~580_q\,
	datac => \bancoRegs|ALT_INV_registrador~132_q\,
	datad => \bancoRegs|ALT_INV_registrador~644_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1337_combout\);

\bancoRegs|registrador~868\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~868_q\);

\bancoRegs|registrador~420\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~420_q\);

\bancoRegs|registrador~932\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~932_q\);

\bancoRegs|registrador~1338\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1338_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~932_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~420_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~868_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~356_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~356_q\,
	datab => \bancoRegs|ALT_INV_registrador~868_q\,
	datac => \bancoRegs|ALT_INV_registrador~420_q\,
	datad => \bancoRegs|ALT_INV_registrador~932_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1338_combout\);

\bancoRegs|registrador~324\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~324_q\);

\bancoRegs|registrador~836\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~836_q\);

\bancoRegs|registrador~388\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~388_q\);

\bancoRegs|registrador~900\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~900_q\);

\bancoRegs|registrador~1339\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1339_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~900_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~388_q\ ) ) ) # ( \ROM|memROM~5_combout\ & 
-- ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~836_q\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~324_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~324_q\,
	datab => \bancoRegs|ALT_INV_registrador~836_q\,
	datac => \bancoRegs|ALT_INV_registrador~388_q\,
	datad => \bancoRegs|ALT_INV_registrador~900_q\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1339_combout\);

\bancoRegs|registrador~1340\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1340_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1338_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1339_combout\ ) ) ) # ( 
-- \ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1336_combout\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~1337_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1336_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1337_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1338_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1339_combout\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1340_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30_PORTBDATAOUT_bus\);

\bancoRegs|registrador~356\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~121_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a30~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~356_q\);

\bancoRegs|registrador~1488\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1488_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~68_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # 
-- (\bancoRegs|registrador~100_q\)))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~132_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # 
-- (\bancoRegs|registrador~164_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~100_q\,
	datab => \bancoRegs|ALT_INV_registrador~164_q\,
	datac => \bancoRegs|ALT_INV_registrador~132_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~68_q\,
	combout => \bancoRegs|registrador~1488_combout\);

\bancoRegs|registrador~1332\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1332_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1488_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1488_combout\ & ((\bancoRegs|registrador~324_q\))) # 
-- (\bancoRegs|registrador~1488_combout\ & (\bancoRegs|registrador~356_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1488_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1488_combout\ & 
-- ((\bancoRegs|registrador~388_q\))) # (\bancoRegs|registrador~1488_combout\ & (\bancoRegs|registrador~420_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~356_q\,
	datab => \bancoRegs|ALT_INV_registrador~420_q\,
	datac => \bancoRegs|ALT_INV_registrador~388_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1488_combout\,
	datag => \bancoRegs|ALT_INV_registrador~324_q\,
	combout => \bancoRegs|registrador~1332_combout\);

\ULA|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~121_sumout\ = SUM(( \bancoRegs|registrador~1332_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1340_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1340_combout\))))) ) + ( \ULA|Add0~118\ ))
-- \ULA|Add0~122\ = CARRY(( \bancoRegs|registrador~1332_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1340_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ & 
-- ((\bancoRegs|registrador~1340_combout\))))) ) + ( \ULA|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1332_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1340_combout\,
	cin => \ULA|Add0~118\,
	sumout => \ULA|Add0~121_sumout\,
	cout => \ULA|Add0~122\);

\bancoRegs|registrador~101\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1351_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~101_q\);

\bancoRegs|registrador~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1360_combout\,
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
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1362_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~325_q\);

\bancoRegs|registrador~1345\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1345_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~357_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~325_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~101_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~69_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~101_q\,
	datab => \bancoRegs|ALT_INV_registrador~69_q\,
	datac => \bancoRegs|ALT_INV_registrador~357_q\,
	datad => \bancoRegs|ALT_INV_registrador~325_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1345_combout\);

\bancoRegs|registrador~613\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1356_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~613_q\);

\bancoRegs|registrador~581\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1364_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~581_q\);

\bancoRegs|registrador~869\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1358_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~869_q\);

\bancoRegs|registrador~837\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1366_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~837_q\);

\bancoRegs|registrador~1346\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1346_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~869_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~837_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~613_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~581_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~613_q\,
	datab => \bancoRegs|ALT_INV_registrador~581_q\,
	datac => \bancoRegs|ALT_INV_registrador~869_q\,
	datad => \bancoRegs|ALT_INV_registrador~837_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1346_combout\);

\bancoRegs|registrador~165\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1353_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~165_q\);

\bancoRegs|registrador~133\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1361_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~133_q\);

\bancoRegs|registrador~421\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1355_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~421_q\);

\bancoRegs|registrador~389\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1363_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~389_q\);

\bancoRegs|registrador~1347\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1347_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~421_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~389_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~165_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~133_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~165_q\,
	datab => \bancoRegs|ALT_INV_registrador~133_q\,
	datac => \bancoRegs|ALT_INV_registrador~421_q\,
	datad => \bancoRegs|ALT_INV_registrador~389_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1347_combout\);

\bancoRegs|registrador~677\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1357_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~677_q\);

\bancoRegs|registrador~645\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1365_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~645_q\);

\bancoRegs|registrador~933\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1359_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~933_q\);

\bancoRegs|registrador~901\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1367_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~901_q\);

\bancoRegs|registrador~1348\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1348_combout\ = ( \ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~933_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( \ROM|memROM~4_combout\ & ( \bancoRegs|registrador~901_q\ ) ) ) # ( \ROM|memROM~6_combout\ & 
-- ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~677_q\ ) ) ) # ( !\ROM|memROM~6_combout\ & ( !\ROM|memROM~4_combout\ & ( \bancoRegs|registrador~645_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~677_q\,
	datab => \bancoRegs|ALT_INV_registrador~645_q\,
	datac => \bancoRegs|ALT_INV_registrador~933_q\,
	datad => \bancoRegs|ALT_INV_registrador~901_q\,
	datae => \ROM|ALT_INV_memROM~6_combout\,
	dataf => \ROM|ALT_INV_memROM~4_combout\,
	combout => \bancoRegs|registrador~1348_combout\);

\bancoRegs|registrador~1349\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1349_combout\ = ( \ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1348_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( \ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1347_combout\ ) ) ) # ( 
-- \ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1346_combout\ ) ) ) # ( !\ROM|memROM~5_combout\ & ( !\ROM|memROM~3_combout\ & ( \bancoRegs|registrador~1345_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~1345_combout\,
	datab => \bancoRegs|ALT_INV_registrador~1346_combout\,
	datac => \bancoRegs|ALT_INV_registrador~1347_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1348_combout\,
	datae => \ROM|ALT_INV_memROM~5_combout\,
	dataf => \ROM|ALT_INV_memROM~3_combout\,
	combout => \bancoRegs|registrador~1349_combout\);

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
	portbre => \UC|Equal7~1_combout\,
	clk0 => \clk~input_o\,
	portadatain => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTADATAIN_bus\,
	portaaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\,
	portbaddr => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31_PORTBDATAOUT_bus\);

\bancoRegs|registrador~357\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ULA|Add0~125_sumout\,
	asdata => \RAM|memRAM_rtl_0|auto_generated|ram_block1a31~portbdataout\,
	sload => \UC|sel_mux4~0_combout\,
	ena => \bancoRegs|registrador~1354_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegs|registrador~357_q\);

\bancoRegs|registrador~1492\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1492_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~69_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # 
-- (\bancoRegs|registrador~101_q\)))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~20_combout\ & (((\bancoRegs|registrador~133_q\ & !\ROM|memROM~13_combout\)))) # (\ROM|memROM~20_combout\ & (((\ROM|memROM~13_combout\)) # 
-- (\bancoRegs|registrador~165_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111101010101000011110011001100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~101_q\,
	datab => \bancoRegs|ALT_INV_registrador~165_q\,
	datac => \bancoRegs|ALT_INV_registrador~133_q\,
	datad => \ROM|ALT_INV_memROM~20_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \ROM|ALT_INV_memROM~13_combout\,
	datag => \bancoRegs|ALT_INV_registrador~69_q\,
	combout => \bancoRegs|registrador~1492_combout\);

\bancoRegs|registrador~1341\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegs|registrador~1341_combout\ = ( !\ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1492_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1492_combout\ & ((\bancoRegs|registrador~325_q\))) # 
-- (\bancoRegs|registrador~1492_combout\ & (\bancoRegs|registrador~357_q\))))) ) ) # ( \ROM|memROM~21_combout\ & ( ((!\ROM|memROM~13_combout\ & (((\bancoRegs|registrador~1492_combout\)))) # (\ROM|memROM~13_combout\ & ((!\bancoRegs|registrador~1492_combout\ & 
-- ((\bancoRegs|registrador~389_q\))) # (\bancoRegs|registrador~1492_combout\ & (\bancoRegs|registrador~421_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111010101011111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \bancoRegs|ALT_INV_registrador~357_q\,
	datab => \bancoRegs|ALT_INV_registrador~421_q\,
	datac => \bancoRegs|ALT_INV_registrador~389_q\,
	datad => \ROM|ALT_INV_memROM~13_combout\,
	datae => \ROM|ALT_INV_memROM~21_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1492_combout\,
	datag => \bancoRegs|ALT_INV_registrador~325_q\,
	combout => \bancoRegs|registrador~1341_combout\);

\ULA|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|Add0~125_sumout\ = SUM(( \bancoRegs|registrador~1341_combout\ ) + ( (!\ROM|memROM~0_combout\ & (((\bancoRegs|registrador~1349_combout\)))) # (\ROM|memROM~0_combout\ & ((!\UC|sel_mux3~0_combout\ & (\ROM|memROM~16_combout\)) # (\UC|sel_mux3~0_combout\ 
-- & ((\bancoRegs|registrador~1349_combout\))))) ) + ( \ULA|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110100000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|ALT_INV_memROM~0_combout\,
	datab => \UC|ALT_INV_sel_mux3~0_combout\,
	datac => \ROM|ALT_INV_memROM~16_combout\,
	datad => \bancoRegs|ALT_INV_registrador~1341_combout\,
	dataf => \bancoRegs|ALT_INV_registrador~1349_combout\,
	cin => \ULA|Add0~122\,
	sumout => \ULA|Add0~125_sumout\);

\PC_Soma_Constante|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC_Soma_Constante|Add0~25_sumout\ = SUM(( \PC_entity|DOUT\(8) ) + ( GND ) + ( \PC_Soma_Constante|Add0~22\ ))
-- \PC_Soma_Constante|Add0~26\ = CARRY(( \PC_entity|DOUT\(8) ) + ( GND ) + ( \PC_Soma_Constante|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC_entity|ALT_INV_DOUT\(8),
	cin => \PC_Soma_Constante|Add0~22\,
	sumout => \PC_Soma_Constante|Add0~25_sumout\,
	cout => \PC_Soma_Constante|Add0~26\);

\PC_entity|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~25_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~29_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~33_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~37_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~41_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~45_sumout\,
	asdata => \ROM|memROM~14_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~49_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~53_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~57_sumout\,
	asdata => \ROM|memROM~15_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~61_sumout\,
	asdata => \ROM|memROM~16_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~65_sumout\,
	asdata => \ROM|memROM~6_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~69_sumout\,
	asdata => \ROM|memROM~3_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~73_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~77_sumout\,
	asdata => \ROM|memROM~4_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~81_sumout\,
	asdata => \ROM|memROM~5_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~85_sumout\,
	asdata => \ROM|memROM~20_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~89_sumout\,
	asdata => \ROM|memROM~21_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~93_sumout\,
	sclr => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~97_sumout\,
	asdata => \ROM|memROM~13_combout\,
	sload => \UC|Equal7~0_combout\,
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

\PC_entity|DOUT[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PC_Soma_Constante|Add0~101_sumout\,
	sclr => \UC|Equal7~0_combout\,
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
END structure;


