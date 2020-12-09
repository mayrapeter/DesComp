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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/09/2020 00:14:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ProcessadorMIPS
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ProcessadorMIPS_vhd_vec_tst IS
END ProcessadorMIPS_vhd_vec_tst;
ARCHITECTURE ProcessadorMIPS_arch OF ProcessadorMIPS_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL imediato : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL imediatoIDEX : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL jr_out : STD_LOGIC;
SIGNAL monitora_flag_z : STD_LOGIC;
SIGNAL mux_imed_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL overflow : STD_LOGIC;
SIGNAL PC_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL saidaA_ULA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ULA_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT ProcessadorMIPS
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	imediato : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	imediatoIDEX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	jr_out : OUT STD_LOGIC;
	monitora_flag_z : OUT STD_LOGIC;
	mux_imed_saida : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	overflow : OUT STD_LOGIC;
	PC_saida : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	saidaA_ULA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	ULA_saida : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ProcessadorMIPS
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	imediato => imediato,
	imediatoIDEX => imediatoIDEX,
	jr_out => jr_out,
	monitora_flag_z => monitora_flag_z,
	mux_imed_saida => mux_imed_saida,
	overflow => overflow,
	PC_saida => PC_saida,
	saidaA_ULA => saidaA_ULA,
	ULA_saida => ULA_saida
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 74
	LOOP
		CLOCK_50 <= '0';
		WAIT FOR 10000 ps;
		CLOCK_50 <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	CLOCK_50 <= '0';
WAIT;
END PROCESS t_prcs_CLOCK_50;
END ProcessadorMIPS_arch;
