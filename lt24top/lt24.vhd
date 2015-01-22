library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.all;
use work.types.all;

entity lt24 is
	port
	(
		
		CLOCK_50 : in std_logic;
		RESETn : in std_logic;
		action : in unsigned(2 downto 0);
       		din    : in unsigned(15 downto 0);
		ready  : out std_logic;
		dout   : out unsigned(15 downto 0);
		LT24_CS_N : out std_logic;
		LT24_RESET_N : out std_logic;
		LT24_RS : out std_logic; -- D/CX
		LT24_WR_N : out std_logic;
		LT24_RD_N : out std_logic;
		LT24_D : inout std_logic_vector(15 downto 0));

end lt24;

architecture rtl of lt24 is

	component bidir16
	port
	(
		bidir : inout std_logic_vector(15 downto 0);
		oe    : in std_logic;
	        clk   : in std_logic;
	        i     : in std_logic_vector(15 downto 0);
	        o     : out std_logic_vector(15 downto 0));
	end component;
	
	component topEntity_0
  port(i_i1        : in std_logic_vector(34 downto 0);
       clk1000     : in std_logic;
       clk1000_rst : in std_logic;
       bodyVar_o   : out std_logic_vector(38 downto 0));
	end component;

	signal clashi : std_logic_vector(34 downto 0);
	signal clasho : std_logic_vector(38 downto 0);

	signal ltdin  : std_logic_vector(15 downto 0);

	signal csx    : std_logic;
	signal resx   : std_logic;
	signal dcx    : std_logic;
	signal wrx    : std_logic;
	signal rdx    : std_logic;
	signal ltdout : std_logic_vector(15 downto 0);
	signal oe     : std_logic;
begin
	clash : topEntity_0
		port map(
		        i_i1 => clashi,
			clk1000 => CLOCK_50,
			clk1000_rst => RESETn,
			bodyVar_o => clasho);
	
	lt24d : bidir16
		port map(
			bidir => LT24_D,
			oe => oe,
			clk => CLOCK_50,
			i => ltdout,
			o => ltdin);
	
	clashi(34 downto 32) <= std_logic_vector(action);
	clashi(31 downto 16) <= std_logic_vector(din);
	clashi(15 downto 0) <= ltdin;

	ready <= clasho(38);
	dout <= unsigned(clasho (37 downto 22));
	LT24_CS_N <= clasho(21);
	LT24_RESET_N <= clasho(20);
	LT24_RS <= clasho(19); -- D/CX
	LT24_WR_N <= clasho(18);
	LT24_RD_N <= clasho(17);
	ltdout <= clasho(16 downto 1);
	oe <= clasho(0);
end rtl;

