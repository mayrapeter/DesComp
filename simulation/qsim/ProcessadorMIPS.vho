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

-- DATE "11/06/2020 21:17:49"

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
SIGNAL \clk~input_o\ : std_logic;
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

BEGIN

ww_clk <= clk;
ULA_saida <= ww_ULA_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ULA_saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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


