

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity problem is
	port
	(
		A : in unsigned(7 downto 0);
		B : in unsigned(7 downto 0);
		act : in std_logic;
		op : in std_logic;
		clk : in std_logic;
		clear : in std_logic;
		S : out unsigned(15 downto 0)
	);
end problem;

architecture logic of problem is

	signal R2 : unsigned(15 downto 0);

	
begin

		R2 <= to_unsigned(0, 16);
		
		
		process(clk, clear)
		begin
				if clear = '1' then
					S <= (others => '0');
				elsif rising_edge(clk) then
					if act = '1' then
						if op = '0' then
							S <= resize(A, 16) + resize(B, 16);
						else
							s <= A * B;
						end if;
					else
						S <= R2;
					end if;
				
				end if;
		end process;
						
		
		
end logic;		
				 