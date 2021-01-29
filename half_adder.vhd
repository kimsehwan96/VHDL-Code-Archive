library ieee;
use ieee.std_logic_1164.all;


entity half_adder_VDL is
	port (X : in std_logic;
			Y : in std_logic;
			S : out std_logic;
			C : out std_logic
			);
end half_adder_VDL;

architecture beh of half_adder_VDL is

	component AND_VDL
		port(A, B : in std_logic;
				C : out std_logic
				);
	end component;
		
	component XOR_VDL
		port(A, B : in std_logic;
				S : out std_logic
				);
	end component;
	
begin 

	ANDG : AND_VDL port map(X,Y,C);
	XORG : XOR_VDL port map(X,Y,S);
	
end beh;