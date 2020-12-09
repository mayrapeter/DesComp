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
-- Generated on "12/08/2020 19:58:55"
                                                             
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
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL jr_out : STD_LOGIC;
SIGNAL KEY : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL monitora_flag_z : STD_LOGIC;
SIGNAL mux_imed_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL overflow : STD_LOGIC;
SIGNAL PC_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ULA_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT ProcessadorMIPS
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	jr_out : OUT STD_LOGIC;
	KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	monitora_flag_z : OUT STD_LOGIC;
	mux_imed_saida : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	overflow : OUT STD_LOGIC;
	PC_saida : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ULA_saida : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ProcessadorMIPS
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	jr_out => jr_out,
	KEY => KEY,
	monitora_flag_z => monitora_flag_z,
	mux_imed_saida => mux_imed_saida,
	overflow => overflow,
	PC_saida => PC_saida,
	SW => SW,
	ULA_saida => ULA_saida
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 10000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;
END ProcessadorMIPS_arch;
