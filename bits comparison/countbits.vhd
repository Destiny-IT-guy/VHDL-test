

library IEEE;
use IEEE.std_logic_1164.all;

entity countbits is

	generic (N : integer :=4);
	
	port
	(
		A : in std_logic_vector(N-1 downto 0); --MSB au LSB
		B : in std_logic_vector(N-1 downto 0);
		--PPi	: in std_logic;
		--PGi	: in std_logic;
		--EGi	: in std_logic;
		PPo	: out std_logic;
		PGo	: out std_logic;
		EGo	: out std_logic
		
		
	);
end countbits;
	
architecture iterative of countbits is 

signal Egs : std_logic_vector(N downto 0);  
signal PPs : std_logic_vector(N downto 0);
signal PGs : std_logic_vector(N downto 0);

	
	
begin

	EGs(0) <= '0';
	PPs(0) <= '0';	
	PGs(0) <= '0';

	
	cellsconnexion : for i in 0 to N-1 generate 
		ithConnexion : entity work.comparer port map 
		(		
				
			PPi => PPs(i),
         	PPo => PPs(i+1), 
         	A   => A(N-1-i),
         	B   => B(N-1-i),
         	PGi => PGs(i),
         	PGo => PGs(i+1),
         	EGi => EGs(i),
         	EGo => EGs(i+1)
			
		);
	end generate;
	
	
	
	PGo <= PGs(N); 
	PPo <= PPs(N); 
	EGo <= EGs(N);
	
end iterative;