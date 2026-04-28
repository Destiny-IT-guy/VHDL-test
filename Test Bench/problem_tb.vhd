

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity problem_tb is
end problem_tb;

architecture testbench of problem_tb is

	signal clk_tb : std_logic;
	signal clear_tb : std_logic;
	signal A_tb : unsigned(7 downto 0);
	signal B_tb : unsigned(7 downto 0);
	signal act_tb : std_logic;
	signal op_tb : std_logic;
	signal S_tb : unsigned(15 downto 0);
	
	constant C_CLK_PERIOD : time := 10 ns;
	
begin

		clk_gen : process
		begin
			clk_tb <= '1';
			wait for C_CLK_PERIOD / 2;
			clk_tb <= '0';
			wait for C_CLK_PERIOD / 2;
		end process clk_gen;
		
		
		main : process
		begin 
		
				-- act and op 0,0  0
				wait for C_CLK_Period;
				clear_tb <= '0';
				A_tb <= to_unsigned(26 ,8);
				B_tb <= to_unsigned(11 ,8);
				act_tb <= '0';
				op_tb <= '0';
				
				-- act and op 1,0 addition
				wait for C_CLK_PERIOD * 3/2;
				clear_tb <= '0';
				A_tb <= to_unsigned(26 ,8);	
				B_tb <= to_unsigned(11 ,8);
				act_tb <= '1';
				op_tb <= '0';
				
				-- act and op 1,1  multiplication
				wait for C_CLK_PERIOD * 1;
				clear_tb <= '0';
				A_tb <= to_unsigned(26 ,8);	
				B_tb <= to_unsigned(11 ,8);
				act_tb <= '1';
				op_tb <= '1';
				
				-- act and op and clear 1,0,1  0
				wait for C_CLK_PERIOD * 1;
				clear_tb <= '1';
				A_tb <= to_unsigned(26 ,8);
				B_tb <= to_unsigned(11 ,8);
				act_tb <= '1';
				op_tb <= '0';
				
				-- same but clear 0
				wait for C_CLK_PERIOD * 1/2;
				clear_tb <= '0';
				A_tb <= to_unsigned(255 ,8);
				B_tb <= to_unsigned(255 ,8);
				act_tb <= '1';
				op_tb <= '0';
				
				-- act and op 1,1 big multiplication
				wait for C_CLK_PERIOD * 1/2;
				clear_tb <= '0';
				A_tb <= to_unsigned(255 ,8);
				B_tb <= to_unsigned(255 ,8);
				act_tb <= '1';
				op_tb <= '1';
				wait;
				
				
				
		end process;
		
DUT : entity work.problem
		port map (
			clear  => clear_tb,
			clk  => clk_tb,
			A => A_tb,
			B => B_tb,
			S => S_tb,
			act => act_tb,
			op => op_tb
		);

end architecture testbench;
