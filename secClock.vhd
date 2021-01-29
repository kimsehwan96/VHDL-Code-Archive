library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity sec_clock is

port ( 
			nRst, clk : in std_logic;
			sec_sig : out std_logic
			);
			
		end sec_clock;
		
		
		architecture design of sec_clock is
		
		
		signal cnt : std_logic_vector (31 downto 0);
		signal sig : std_logic;
		
		begin
		
		sec_sig <= sig;
		process(nRst, clk)
		begin
		
		if(nRst = '0') then
		sig <= '0';
		cnt <= (others => '0');
		elsif rising_edge(clk) then
		if(cnt = 24999999) then  -- 25*10^6  ..... 25M => 25*10^6   / cnt => 32bit => 2^32 => 4*10^9
		cnt <= (others => '0');    -- others => '0' -> cnt = "0000000000000000000000000000"
		sig <= not sig;
		
		else
		
		cnt <= cnt + 1;
		
		end if;
		end if;
		
	end process;
	end design;