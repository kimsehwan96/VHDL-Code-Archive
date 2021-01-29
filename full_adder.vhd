library ieee;
use ieee.std_logic_1164.all;

entity full_adder_VDL is
	port( X : in std_logic;
			Y : in std_logic;
			Ci : in std_logic;
			S : out std_logic;
			Co : out std_logic
			);
end full_adder_VDL;

architecture BEH of full_adder_VDL is

signal temp1 : std_logic;
signal temp2 : std_logic;
signal temp3 : std_logic;

	component half_adder_VDL2 is
	port(X, Y : in std_logic;
			S, C : out std_logic
			);
	end component;
	
	component OR_VDL is 
	port(A,B : in std_logic; 
			C : out std_logic
			);
	end component;
	
begin
	HALF1 : half_adder_VDL2 port map(X,Y, temp1, temp2);
	HALF2 : half_adder_VDL2 port map(temp1, Ci, S, temp3);
	ORG : 	OR_VDL port map(temp3, temp2, Co);

end BEH;
	