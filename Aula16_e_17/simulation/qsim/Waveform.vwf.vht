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
-- Generated on "11/13/2020 19:21:55"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ULA_e_UCULA
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ULA_e_UCULA_vhd_vec_tst IS
END ULA_e_UCULA_vhd_vec_tst;
ARCHITECTURE ULA_e_UCULA_arch OF ULA_e_UCULA_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL entradaA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL entradaB : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL funct : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL overflow : STD_LOGIC;
SIGNAL ULA_op : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ULA_saida : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT ULA_e_UCULA
	PORT (
	entradaA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	entradaB : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	funct : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	overflow : BUFFER STD_LOGIC;
	ULA_op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ULA_saida : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ULA_e_UCULA
	PORT MAP (
-- list connections between master ports and signals
	entradaA => entradaA,
	entradaB => entradaB,
	funct => funct,
	overflow => overflow,
	ULA_op => ULA_op,
	ULA_saida => ULA_saida
	);
-- entradaA[31]
t_prcs_entradaA_31: PROCESS
BEGIN
	entradaA(31) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_31;
-- entradaA[30]
t_prcs_entradaA_30: PROCESS
BEGIN
	entradaA(30) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_30;
-- entradaA[29]
t_prcs_entradaA_29: PROCESS
BEGIN
	entradaA(29) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_29;
-- entradaA[28]
t_prcs_entradaA_28: PROCESS
BEGIN
	entradaA(28) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_28;
-- entradaA[27]
t_prcs_entradaA_27: PROCESS
BEGIN
	entradaA(27) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_27;
-- entradaA[26]
t_prcs_entradaA_26: PROCESS
BEGIN
	entradaA(26) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_26;
-- entradaA[25]
t_prcs_entradaA_25: PROCESS
BEGIN
	entradaA(25) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_25;
-- entradaA[24]
t_prcs_entradaA_24: PROCESS
BEGIN
	entradaA(24) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_24;
-- entradaA[23]
t_prcs_entradaA_23: PROCESS
BEGIN
	entradaA(23) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_23;
-- entradaA[22]
t_prcs_entradaA_22: PROCESS
BEGIN
	entradaA(22) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_22;
-- entradaA[21]
t_prcs_entradaA_21: PROCESS
BEGIN
	entradaA(21) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_21;
-- entradaA[20]
t_prcs_entradaA_20: PROCESS
BEGIN
	entradaA(20) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_20;
-- entradaA[19]
t_prcs_entradaA_19: PROCESS
BEGIN
	entradaA(19) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_19;
-- entradaA[18]
t_prcs_entradaA_18: PROCESS
BEGIN
	entradaA(18) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_18;
-- entradaA[17]
t_prcs_entradaA_17: PROCESS
BEGIN
	entradaA(17) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_17;
-- entradaA[16]
t_prcs_entradaA_16: PROCESS
BEGIN
	entradaA(16) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_16;
-- entradaA[15]
t_prcs_entradaA_15: PROCESS
BEGIN
	entradaA(15) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_15;
-- entradaA[14]
t_prcs_entradaA_14: PROCESS
BEGIN
	entradaA(14) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_14;
-- entradaA[13]
t_prcs_entradaA_13: PROCESS
BEGIN
	entradaA(13) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_13;
-- entradaA[12]
t_prcs_entradaA_12: PROCESS
BEGIN
	entradaA(12) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_12;
-- entradaA[11]
t_prcs_entradaA_11: PROCESS
BEGIN
	entradaA(11) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_11;
-- entradaA[10]
t_prcs_entradaA_10: PROCESS
BEGIN
	entradaA(10) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_10;
-- entradaA[9]
t_prcs_entradaA_9: PROCESS
BEGIN
	entradaA(9) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_9;
-- entradaA[8]
t_prcs_entradaA_8: PROCESS
BEGIN
	entradaA(8) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_8;
-- entradaA[7]
t_prcs_entradaA_7: PROCESS
BEGIN
	entradaA(7) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_7;
-- entradaA[6]
t_prcs_entradaA_6: PROCESS
BEGIN
	entradaA(6) <= '0';
	WAIT FOR 640000 ps;
	entradaA(6) <= '1';
WAIT;
END PROCESS t_prcs_entradaA_6;
-- entradaA[5]
t_prcs_entradaA_5: PROCESS
BEGIN
	entradaA(5) <= '0';
	WAIT FOR 320000 ps;
	entradaA(5) <= '1';
	WAIT FOR 320000 ps;
	entradaA(5) <= '0';
	WAIT FOR 320000 ps;
	entradaA(5) <= '1';
WAIT;
END PROCESS t_prcs_entradaA_5;
-- entradaA[4]
t_prcs_entradaA_4: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		entradaA(4) <= '0';
		WAIT FOR 160000 ps;
		entradaA(4) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	entradaA(4) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_4;
-- entradaA[3]
t_prcs_entradaA_3: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		entradaA(3) <= '0';
		WAIT FOR 80000 ps;
		entradaA(3) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	entradaA(3) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_3;
-- entradaA[2]
t_prcs_entradaA_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		entradaA(2) <= '0';
		WAIT FOR 40000 ps;
		entradaA(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	entradaA(2) <= '0';
WAIT;
END PROCESS t_prcs_entradaA_2;
-- entradaA[1]
t_prcs_entradaA_1: PROCESS
BEGIN
LOOP
	entradaA(1) <= '0';
	WAIT FOR 20000 ps;
	entradaA(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_entradaA_1;
-- entradaA[0]
t_prcs_entradaA_0: PROCESS
BEGIN
LOOP
	entradaA(0) <= '0';
	WAIT FOR 10000 ps;
	entradaA(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_entradaA_0;
-- entradaB[31]
t_prcs_entradaB_31: PROCESS
BEGIN
	entradaB(31) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_31;
-- entradaB[30]
t_prcs_entradaB_30: PROCESS
BEGIN
	entradaB(30) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_30;
-- entradaB[29]
t_prcs_entradaB_29: PROCESS
BEGIN
	entradaB(29) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_29;
-- entradaB[28]
t_prcs_entradaB_28: PROCESS
BEGIN
	entradaB(28) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_28;
-- entradaB[27]
t_prcs_entradaB_27: PROCESS
BEGIN
	entradaB(27) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_27;
-- entradaB[26]
t_prcs_entradaB_26: PROCESS
BEGIN
	entradaB(26) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_26;
-- entradaB[25]
t_prcs_entradaB_25: PROCESS
BEGIN
	entradaB(25) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_25;
-- entradaB[24]
t_prcs_entradaB_24: PROCESS
BEGIN
	entradaB(24) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_24;
-- entradaB[23]
t_prcs_entradaB_23: PROCESS
BEGIN
	entradaB(23) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_23;
-- entradaB[22]
t_prcs_entradaB_22: PROCESS
BEGIN
	entradaB(22) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_22;
-- entradaB[21]
t_prcs_entradaB_21: PROCESS
BEGIN
	entradaB(21) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_21;
-- entradaB[20]
t_prcs_entradaB_20: PROCESS
BEGIN
	entradaB(20) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_20;
-- entradaB[19]
t_prcs_entradaB_19: PROCESS
BEGIN
	entradaB(19) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_19;
-- entradaB[18]
t_prcs_entradaB_18: PROCESS
BEGIN
	entradaB(18) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_18;
-- entradaB[17]
t_prcs_entradaB_17: PROCESS
BEGIN
	entradaB(17) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_17;
-- entradaB[16]
t_prcs_entradaB_16: PROCESS
BEGIN
	entradaB(16) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_16;
-- entradaB[15]
t_prcs_entradaB_15: PROCESS
BEGIN
	entradaB(15) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_15;
-- entradaB[14]
t_prcs_entradaB_14: PROCESS
BEGIN
	entradaB(14) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_14;
-- entradaB[13]
t_prcs_entradaB_13: PROCESS
BEGIN
	entradaB(13) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_13;
-- entradaB[12]
t_prcs_entradaB_12: PROCESS
BEGIN
	entradaB(12) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_12;
-- entradaB[11]
t_prcs_entradaB_11: PROCESS
BEGIN
	entradaB(11) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_11;
-- entradaB[10]
t_prcs_entradaB_10: PROCESS
BEGIN
	entradaB(10) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_10;
-- entradaB[9]
t_prcs_entradaB_9: PROCESS
BEGIN
	entradaB(9) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_9;
-- entradaB[8]
t_prcs_entradaB_8: PROCESS
BEGIN
	entradaB(8) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_8;
-- entradaB[7]
t_prcs_entradaB_7: PROCESS
BEGIN
	entradaB(7) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_7;
-- entradaB[6]
t_prcs_entradaB_6: PROCESS
BEGIN
	entradaB(6) <= '0';
	WAIT FOR 620000 ps;
	entradaB(6) <= '1';
WAIT;
END PROCESS t_prcs_entradaB_6;
-- entradaB[5]
t_prcs_entradaB_5: PROCESS
BEGIN
	entradaB(5) <= '0';
	WAIT FOR 300000 ps;
	entradaB(5) <= '1';
	WAIT FOR 320000 ps;
	entradaB(5) <= '0';
	WAIT FOR 320000 ps;
	entradaB(5) <= '1';
WAIT;
END PROCESS t_prcs_entradaB_5;
-- entradaB[4]
t_prcs_entradaB_4: PROCESS
BEGIN
	entradaB(4) <= '0';
	WAIT FOR 140000 ps;
	FOR i IN 1 TO 2
	LOOP
		entradaB(4) <= '1';
		WAIT FOR 160000 ps;
		entradaB(4) <= '0';
		WAIT FOR 160000 ps;
	END LOOP;
	entradaB(4) <= '1';
	WAIT FOR 160000 ps;
	entradaB(4) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_4;
-- entradaB[3]
t_prcs_entradaB_3: PROCESS
BEGIN
	entradaB(3) <= '0';
	WAIT FOR 60000 ps;
	FOR i IN 1 TO 5
	LOOP
		entradaB(3) <= '1';
		WAIT FOR 80000 ps;
		entradaB(3) <= '0';
		WAIT FOR 80000 ps;
	END LOOP;
	entradaB(3) <= '1';
	WAIT FOR 80000 ps;
	entradaB(3) <= '0';
WAIT;
END PROCESS t_prcs_entradaB_3;
-- entradaB[2]
t_prcs_entradaB_2: PROCESS
BEGIN
	entradaB(2) <= '0';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 12
	LOOP
		entradaB(2) <= '1';
		WAIT FOR 40000 ps;
		entradaB(2) <= '0';
		WAIT FOR 40000 ps;
	END LOOP;
	entradaB(2) <= '1';
WAIT;
END PROCESS t_prcs_entradaB_2;
-- entradaB[1]
t_prcs_entradaB_1: PROCESS
BEGIN
LOOP
	entradaB(1) <= '1';
	WAIT FOR 20000 ps;
	entradaB(1) <= '0';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_entradaB_1;
-- entradaB[0]
t_prcs_entradaB_0: PROCESS
BEGIN
LOOP
	entradaB(0) <= '0';
	WAIT FOR 10000 ps;
	entradaB(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_entradaB_0;
-- funct[5]
t_prcs_funct_5: PROCESS
BEGIN
	funct(5) <= '0';
WAIT;
END PROCESS t_prcs_funct_5;
-- funct[4]
t_prcs_funct_4: PROCESS
BEGIN
	funct(4) <= '0';
WAIT;
END PROCESS t_prcs_funct_4;
-- funct[3]
t_prcs_funct_3: PROCESS
BEGIN
	funct(3) <= '0';
WAIT;
END PROCESS t_prcs_funct_3;
-- funct[2]
t_prcs_funct_2: PROCESS
BEGIN
	funct(2) <= '0';
WAIT;
END PROCESS t_prcs_funct_2;
-- funct[1]
t_prcs_funct_1: PROCESS
BEGIN
	funct(1) <= '0';
WAIT;
END PROCESS t_prcs_funct_1;
-- funct[0]
t_prcs_funct_0: PROCESS
BEGIN
	funct(0) <= '0';
WAIT;
END PROCESS t_prcs_funct_0;
-- ULA_op[1]
t_prcs_ULA_op_1: PROCESS
BEGIN
	ULA_op(1) <= '0';
WAIT;
END PROCESS t_prcs_ULA_op_1;
-- ULA_op[0]
t_prcs_ULA_op_0: PROCESS
BEGIN
	ULA_op(0) <= '0';
WAIT;
END PROCESS t_prcs_ULA_op_0;
END ULA_e_UCULA_arch;
