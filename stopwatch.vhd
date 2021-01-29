library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity stopwatch is

port ( clear : in std_logic;
		 start_stop : in std_logic;
		 clk : in std_logic;
		 fnd_mSEC_1 : out std_logic_vector(6 downto 0);
		 fnd_mSEC_10 : out std_logic_vector (6 downto 0);
		 fnd_SEC_1 : out std_logic_vector (6 downto 0);
		 fnd_SEC_10 : out std_logic_vector (6 downto 0));
		 
		 
end stopwatch;

architecture design of stopwatch is


component sec_10 is

port ( nrst : in std_logic;
		clk : in std_logic;
		digit_one : out std_logic_vector (3 downto 0);
		carry : out std_logic ) ;
		
		end component;
		
		
		component mux is
		port (x : in std_logic;
				y : in std_logic;
				sel : in std_logic;
				z : out std_logic);
				
				end component;
				
		component sec_clock is
		port ( 
			nRst, clk : in std_logic;
			sec_sig : out std_logic
			);
			
			end component;
			
			
		component fnd_decoder is
			port(data : in std_logic_vector(3 downto 0);
			fnd_data : out std_logic_vector(6 downto 0));
			
			end component;
			
			
			
			
		signal sec_sig_sig : std_logic;
		signal sec_clock_0 : std_logic;
		signal sec_clock_1 : std_logic;
		signal sec_clock_2 : std_logic;
		signal sec_clock_3 : std_logic;
		signal sec_carry_0 : std_logic;
		signal sec_carry_1 : std_logic;
		signal sec_carry_2 : std_logic;
		signal sec_0 : std_logic_vector(3 downto 0);
		signal sec_1 : std_logic_vector(3 downto 0);
		signal sec_2 : std_logic_vector(3 downto 0);
		signal sec_3 : std_logic_vector(3 downto 0);
		
		
		
		begin
		
		
		U_sec_gen : sec_clock
		port map (
					  nRSt => clear,
					  clk => clk,
					  sec_sig => sec_sig_sig);
					  
		U_mux_1 : mux
		port map ( x => sec_sig_sig,
					  y => start_stop,
					  sel => start_stop,
					  z => sec_clock_0);
		U_mux_2 : mux
		port map ( x => sec_carry_0,
					  y =>  start_stop,
					  sel => start_stop,
					  z => sec_clock_1);
		U_mux_3 : mux
		port map ( x => sec_carry_1,
					  y =>  start_stop,
					  sel => start_stop,
					  z => sec_clock_2);
	   U_mux_4 : mux
		port map ( x => sec_carry_2,
					  y =>  start_stop,
					  sel => start_stop,
					  z => sec_clock_3);
					  
		U_cnt_1 : sec_10
		port map (nrst => clear,
					 clk => sec_clock_0,
					 digit_one => sec_0,
					 carry => sec_carry_0);
	  U_cnt_2 : sec_10
		port map (nrst => clear,
					 clk => sec_clock_1,
					 digit_one => sec_1,
					 carry => sec_carry_1);
	 U_cnt_3 : sec_10
		port map (nrst => clear,
					 clk => sec_clock_2,
					 digit_one => sec_2,
					 carry => sec_carry_2);
  U_cnt_4 : sec_10
		port map (nrst => clear,
					 clk => sec_clock_3,
					 digit_one => sec_3
					 );
					 
					 
	U_fnd_1 : fnd_decoder
		port map (data => sec_0,
					 fnd_data => fnd_mSEC_1);
	U_fnd_2 : fnd_decoder
		port map (data => sec_1,
					 fnd_data => fnd_mSEC_10);
	U_fnd_3 : fnd_decoder
		port map (data => sec_2,
					 fnd_data => fnd_SEC_1);
	U_fnd_4 : fnd_decoder
		port map (data => sec_3,
					 fnd_data => fnd_SEC_10);
					 
					 
end design;

		
					 
	
	
		
		
		
		