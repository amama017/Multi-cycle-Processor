vsim Project.ir
add wave sim:/ir/clk
add wave sim:/ir/rst
add wave sim:/ir/en
add wave sim:/ir/s1
add wave sim:/ir/s2
add wave sim:/ir/imm
add wave sim:/ir/ip
add wave sim:/ir/op1
add wave sim:/ir/op2
add wave sim:/ir/op3
add wave sim:/ir/dff
force -freeze sim:/ir/rst 1 0
force -freeze sim:/ir/en 0 0
force -freeze sim:/ir/s1 0 0
force -freeze sim:/ir/s2 0 0
force -freeze sim:/ir/imm 1 0
force -freeze sim:/ir/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/ir/ip 11105500 0
run
force -freeze sim:/ir/rst 0 0
run
force -freeze sim:/ir/en 1 0
run
force -freeze sim:/ir/en 0 0
force -freeze sim:/ir/s1 1 0
run
force -freeze sim:/ir/imm 0 0
force -freeze sim:/ir/s2 1 0
run