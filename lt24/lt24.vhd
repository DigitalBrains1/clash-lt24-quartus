library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.types.all;

entity lt24 is
	port
	(
		
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector(1 downto 0);
		GPIO_0 : inout std_logic_vector(33 downto 0);
		LT24_LCD_ON : out std_logic;
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
  port(eta_i1      : in std_logic_vector(16 downto 0);
       clk1000     : in std_logic;
       clk1000_rst : in std_logic;
       topLet_o    : out std_logic_vector(23 downto 0));
	end component;

	signal clashi : std_logic_vector(16 downto 0);
	signal clasho : std_logic_vector(23 downto 0);
	signal ltdin : std_logic_vector(15 downto 0);
	signal ltdout : std_logic_vector(15 downto 0);
	signal oe : std_logic;
	signal rxd : std_logic;
	signal txd : std_logic;

begin
	clash : topEntity_0
		port map(
		        eta_i1 => clashi,
			clk1000 => CLOCK_50,
			clk1000_rst => KEY(0),
			topLet_o => clasho);
	
	lt24d : bidir16
		port map(
			bidir => LT24_D,
			oe => oe,
			clk => CLOCK_50,
			i => ltdout,
			o => ltdin);
	
	clashi(15 downto 0) <= ltdin;
	clashi(16) <= rxd;
	rxd <= GPIO_0(2);
	
	txd <= clasho(23);
	GPIO_0(4) <= txd;
	LT24_LCD_ON <= clasho(22);
	LT24_CS_N <= clasho(21);
	LT24_RESET_N <= clasho(20);
	LT24_RS <= clasho(19); -- D/CX
	LT24_WR_N <= clasho(18);
	LT24_RD_N <= clasho(17);
	ltdout <= clasho(16 downto 1);
	oe <= clasho(0);
end rtl;

