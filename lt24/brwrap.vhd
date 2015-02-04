LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY blockramwrapper IS
	GENERIC (
		address_reg_b		: STRING;
		clock_enable_input_a		: STRING;
		clock_enable_input_b		: STRING;
		clock_enable_output_a		: STRING;
		clock_enable_output_b		: STRING;
		indata_reg_b		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		numwords_a		: NATURAL;
		numwords_b		: NATURAL;
		operation_mode		: STRING;
		outdata_aclr_a		: STRING;
		outdata_aclr_b		: STRING;
		outdata_reg_a		: STRING;
		outdata_reg_b		: STRING;
		power_up_uninitialized		: STRING;
		ram_block_type		: STRING;
		read_during_write_mode_mixed_ports		: STRING;
		read_during_write_mode_port_a		: STRING;
		read_during_write_mode_port_b		: STRING;
		widthad_a		: NATURAL;
		widthad_b		: NATURAL;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_byteena_a		: NATURAL;
		width_byteena_b		: NATURAL;
		wrcontrol_wraddress_reg_b		: STRING
	);
	PORT (
			clock0	: IN STD_LOGIC ;
			wren_a	: IN STD_LOGIC ;
			address_b	: IN STD_LOGIC_VECTOR;
			data_b	: IN STD_LOGIC_VECTOR;
			q_a	: OUT STD_LOGIC_VECTOR;
			wren_b	: IN STD_LOGIC;
			address_a	: IN STD_LOGIC_VECTOR;
			data_a	: IN STD_LOGIC_VECTOR;
			q_b	: OUT STD_LOGIC_VECTOR
	);
END blockramwrapper;

ARCHITECTURE SYN OF blockramwrapper IS

	COMPONENT altsyncram
	GENERIC (
		address_reg_b		: STRING;
		clock_enable_input_a		: STRING;
		clock_enable_input_b		: STRING;
		clock_enable_output_a		: STRING;
		clock_enable_output_b		: STRING;
		indata_reg_b		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		numwords_a		: NATURAL;
		numwords_b		: NATURAL;
		operation_mode		: STRING;
		outdata_aclr_a		: STRING;
		outdata_aclr_b		: STRING;
		outdata_reg_a		: STRING;
		outdata_reg_b		: STRING;
		power_up_uninitialized		: STRING;
		ram_block_type		: STRING;
		read_during_write_mode_mixed_ports		: STRING;
		read_during_write_mode_port_a		: STRING;
		read_during_write_mode_port_b		: STRING;
		widthad_a		: NATURAL;
		widthad_b		: NATURAL;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_byteena_a		: NATURAL;
		width_byteena_b		: NATURAL;
		wrcontrol_wraddress_reg_b		: STRING
	);
	PORT (
			clock0	: IN STD_LOGIC ;
			wren_a	: IN STD_LOGIC ;
			address_b	: IN STD_LOGIC_VECTOR;
			data_b	: IN STD_LOGIC_VECTOR;
			q_a	: OUT STD_LOGIC_VECTOR;
			wren_b	: IN STD_LOGIC;
			address_a	: IN STD_LOGIC_VECTOR;
			data_a	: IN STD_LOGIC_VECTOR;
			q_b	: OUT STD_LOGIC_VECTOR
	);
	END COMPONENT;

BEGIN
	altsyncram_component : altsyncram
	GENERIC MAP (
		address_reg_b => address_reg_b,
		clock_enable_input_a => clock_enable_input_a,
		clock_enable_input_b => clock_enable_input_b,
		clock_enable_output_a => clock_enable_output_a,
		clock_enable_output_b => clock_enable_output_b,
		indata_reg_b => indata_reg_b,
		intended_device_family => intended_device_family,
		lpm_type => lpm_type,
		numwords_a => numwords_a,
		numwords_b => numwords_b,
		operation_mode => operation_mode,
		outdata_aclr_a => outdata_aclr_a,
		outdata_aclr_b => outdata_aclr_b,
		outdata_reg_a => outdata_reg_a,
		outdata_reg_b => outdata_reg_b,
		power_up_uninitialized => power_up_uninitialized,
		ram_block_type => ram_block_type,
		read_during_write_mode_mixed_ports => read_during_write_mode_mixed_ports,
		read_during_write_mode_port_a => read_during_write_mode_port_a,
		read_during_write_mode_port_b => read_during_write_mode_port_b,
		widthad_a => widthad_a,
		widthad_b => widthad_b,
		width_a => width_a,
		width_b => width_b,
		width_byteena_a => width_byteena_a,
		width_byteena_b => width_byteena_b,
		wrcontrol_wraddress_reg_b => wrcontrol_wraddress_reg_b
	)
	PORT MAP (
		clock0 => clock0,
		wren_a => wren_a,
		address_b => address_b,
		data_b => data_b,
		wren_b => wren_b,
		address_a => address_a,
		data_a => data_a,
		q_a => q_a,
		q_b => q_b
	);

END SYN;