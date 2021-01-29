library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cnt_12 is
   port(nRst, clk      : in std_logic;
        digit_one, digit_ten   : out std_logic_vector(3 downto 0);
        carry      : out std_logic);
end cnt_12;

architecture design of cnt_12 is
   signal hr_cnt_one, hr_cnt_ten : std_logic_vector(3 downto 0);
begin
      digit_one <= hr_cnt_one;
      digit_ten <= hr_cnt_ten;
      
      
      process(nRst, clk)
      begin 
         if(nRst = '0') then 
            hr_cnt_one <= (others => '0');
            hr_cnt_ten <= (others => '0');
         
         elsif(falling_edge(clk)) then
            
            if(hr_cnt_one = 9) then
               hr_cnt_one <= (others => '0');
               hr_cnt_ten <= hr_cnt_ten + 1;
            elsif((hr_cnt_ten = 1) and (hr_cnt_one = 2)) then
               carry <= '1';
               hr_cnt_ten <= (others => '0');
               hr_cnt_one <= (others => '0');
            else 
               hr_cnt_one <= hr_cnt_one + 1;
               carry <= '0';
            end if;
         end if;
      end process;
      
end design;