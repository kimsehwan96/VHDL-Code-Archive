library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cnt_60 is
	port(
		nRst, clk				: in std_logic;
		digit_one, digit_ten : out std_logic_vector(3 downto 0);
		carry						: out std_logic);
end cnt_60;

architecture design of cnt_60 is
	signal sec_cnt_one, sec_cnt_ten : std_logic_vector(3 downto 0);
begin
	digit_one <= sec_cnt_one;
	digit_ten <= sec_cnt_ten;
	
	carry <= '1' when ((sec_cnt_ten = 5) and sec_cnt_one = 9) else '0';
	
	process(nRst, clk)
	begin
		if (nRst = '0') then 
			sec_cnt_one <= (others => '0');
			sec_cnt_ten <= (others => '0');
		elsif falling_edge(clk) then
			if(sec_cnt_one = 9) then
				sec_cnt_one <= (others => '0');
				if(sec_cnt_ten = 5) then
					sec_cnt_ten <= (others => '0');
				else
					sec_cnt_ten <= sec_cnt_ten + 1;
				end if;
			else
				sec_cnt_one <= sec_cnt_one +1;
			end if;
		end if;
	end process;
end design;