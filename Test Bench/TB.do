vdel -all work 
vlib work
vmap work work


vcom -work work problem.vhd
vcom -work work problem_tb.vhd
vsim work.problem_tb
add wave -unsigned *
run 65 ns
wave zoom full