



library IEEE;
Use IEEE.std_logic_1164.all;

entity comparer is
	port
	(
		A	: in std_logic;
		B	: in std_logic;
		PPi	: in std_logic;
		PGi	: in std_logic;
		EGi	: in std_logic;
		PPo	: out std_logic;
		PGo	: out std_logic;
		EGo	: out std_logic
	
	);
end comparer;



architecture combinational of comparer is
begin

	PPo <= (PPi) or (A and not B and not PGi and not EGi) or (not A and B and EGi);
	PGo <= (PGi) or (A and not B and EGi) or (not A and B and not PPi and not EGi);
	EGo <= (not A and not B and not PPi and not PGi) or (A and B and not PPi and not PGi);
end combinational;