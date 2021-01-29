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
		variable cnt : integer;
	begin
		if(RESET = '1') then
			X <= "0001";
		elsif(CLK'event and CLK = '1') then
			X <= X(2 downto 0) & X(3);
		end if;
		
	end process;

end design;

--X(2 downto 0) & X(3)이라는 새로운연산을 보임.....X(3210) 을 X(2103)순으로 바꿔주는연산임