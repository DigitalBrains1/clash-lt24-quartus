library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bidir16 is
	port
	(
		bidir : inout std_logic_vector(15 downto 0);
		oe    : in std_logic;
	        clk   : in std_logic;
	        i     : in std_logic_vector(15 downto 0);
	        o     : out std_logic_vector(15 downto 0));
end bidir16;

architecture behavioral of bidir16 is
	signal iff : std_logic_vector(15 downto 0); -- DFF storing i
	signal off : std_logic_vector(15 downto 0); -- DFF storing o

begin
	process(clk)
	begin
		if rising_edge(clk) then
			iff <= i;
			o <= off;
		end if;
	end process;
	process (oe, bidir, iff)
	begin
		if (oe = '0') then
			bidir <= "ZZZZZZZZZZZZZZZZ";
			off <= bidir;
		else
			bidir <= iff;
			off <= bidir;
		end if;
	end process;
end behavioral;

