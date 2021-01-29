library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test is
	port(	RESET, CLK, Chg		:	in		std_logic;
			Y		:	out	std_logic_vector(3 downto 0));
end test;

architecture design of test is
	signal X : std_logic_vector(3 downto 0);
begin
	Y <= X;
	
	process(CLK, RESET)
	begin
	
		if(RESET = '1') then
			X <= "0000";
		elsif(CLK'event and CLK = '1') then
			X <= X(2 downto 0) & not X(3);
		end if;
		
		
	end process;

end design;