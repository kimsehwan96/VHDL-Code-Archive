package my_package is

	subtype summary is integer range 0 to 512;  -- 두 8비트 입력을 더한 최소~최댓값 설정
	subtype indata1intver is integer range 0 to 256; 첫번째 입력(8비트)에 대한 최소~최대값
	subtype indata2intver is integer range 0 to 256; 두번째 입력(8비트)에 대한 최소~최대값
	
	end my_package;



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library work;
use work.my_package.all;

entity ham is

port ( indata1 : in std_logic_vector(7 downto 0);			-- 첫번째 8비트 입력
		 indata2 : in std_logic_vector(7 downto 0);         -- 두번째 8비트 입력
		 fnd_data0 : out std_logic_vector(6 downto 0);     -- 1의자리 세그먼트
		 fnd_data1 : out std_logic_vector (6 downto 0);    -- 10의자리 세그먼트
		 fnd_data2 : out std_logic_vector (6 downto 0));   -- 100의자리 세그먼트
		 
		 end ham;
		 
		 architecture design of ham is
		 
		 begin
		 
		 process(indata1, indata2)
		 variable indata1intver : integer := 0; 			-- 로직벡터 값을 정수형으로 바꾸기 위한 변수
		 variable indata2intver : integer := 0;
		 variable summary : integer := 0;			-- 두 입력값을 정수형으로 받아 합할 변수
		 variable num1, num10, num100 : integer := 0;		-- 1의자리, 10의자리, 100의자리 정수 값을 저장할 변수
		 begin 
		 if((indata1 or indata2) /= "00000000") then	
		 indata1intver := conv_integer(indata1);		-- 로직벡터 입력 1의 값을 정수형으로 변환
		 indata2intver := conv_integer(indata2);		-- 로직벡터 입력 2의 값을 정수형으로 변환
		 summary := (indata1intver + indata2intver);	-- 정수형으로 변환한 두 값을 더해서 summary변수에 저장
		 num100 := (summary / 100);				-- 두 정수형 값의 합의 100의자리 값을 구해서 num100 변수에 저장
		 num10 := ((summary - (num100*100))/10);		-- 두 정수형 값의 합의 10의자리 값을 구해서 num100변수에 저장
		 num1 := summary -(num100*100)-(num10*10);		-- 두 정수형 값의 합의 1의자리 값을 구해서 num1 변수에 저장
		 end if;
		 
		 case num1 is 							 -- 1의자리 변수의 값을 세그먼트에 표시
		      when 0 => fnd_data0 <= "1000000";
				when 1 => fnd_data0 <= "1111001";
				when 2 => fnd_data0 <= "0100100";
				when 3 => fnd_data0 <= "0110000";
				when 4 => fnd_data0 <= "0011001";
				when 5 => fnd_data0 <= "0010010";
				when 6 => fnd_data0 <= "0000010";
				when 7 => fnd_data0 <= "1011000";
				when 8 => fnd_data0 <= "0000000";
				when 9 => fnd_data0 <= "0010000";
				when others => fnd_data0 <= "1111111";
				
				
				end case;
				
				 case num10 is 		-- 10의자리 값을 세그먼트에 표시
		      when 0 => fnd_data1 <= "1000000";
				when 1 => fnd_data1 <= "1111001";
				when 2 => fnd_data1 <= "0100100";
				when 3 => fnd_data1 <= "0110000";
				when 4 => fnd_data1 <= "0011001";
				when 5 => fnd_data1 <= "0010010";
				when 6 => fnd_data1 <= "0000010";
				when 7 => fnd_data1 <= "1011000";
				when 8 => fnd_data1 <= "0000000";
				when 9 => fnd_data1 <= "0010000";
				when others => fnd_data1 <= "1111111";
				
				
				end case;
				
					
				 case num100 is 	-- 100의자리 값을 세그먼트에 표시
		      when 0 => fnd_data2 <= "1000000";
				when 1 => fnd_data2 <= "1111001";
				when 2 => fnd_data2 <= "0100100";
				when 3 => fnd_data2 <= "0110000";
				when 4 => fnd_data2 <= "0011001";
				when 5 => fnd_data2 <= "0010010";
				when 6 => fnd_data2 <= "0000010";
				when 7 => fnd_data2 <= "1011000";
				when 8 => fnd_data2 <= "0000000";
				when 9 => fnd_data2 <= "0010000";
				when others => fnd_data2 <= "1111111";
				
				
				end case;
				
				
				
		 
		 
		 
		 
		 end process;
		 end design;