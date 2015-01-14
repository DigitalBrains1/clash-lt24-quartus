library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.types.all;

entity lt24 is
	port
	(
		
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector(1 downto 0);
		GPIO_0 : inout std_logic_vector(33 downto 0));
end lt24;

architecture rtl of lt24 is

	component topEntity_0
  port(eta_i1      : in std_logic;
       clk1000     : in std_logic;
       clk1000_rst : in std_logic;
       topLet_o    : out std_logic);
	end component;

begin
	clash : topEntity_0
		port map(
		        eta_i1 => GPIO_0(3),
			clk1000 => CLOCK_50,
			clk1000_rst => KEY(0),
			topLet_o => GPIO_0(4));
end rtl;

