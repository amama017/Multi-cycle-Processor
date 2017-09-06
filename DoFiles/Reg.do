vsim Project.reg
add wave sim:/reg/clk
add wave sim:/reg/rst
add wave sim:/reg/en
add wave sim:/reg/s1
add wave sim:/reg/s2
add wave sim:/reg/ip
add wave sim:/reg/op1
add wave sim:/reg/op2
add wave sim:/reg/dff
force -freeze sim:/reg/rst 1 0
force -freeze sim:/reg/en 1 0
force -freeze sim:/reg/s1 0 0
force -freeze sim:/reg/s2 0 0
force -freeze sim:/reg/ip 00001111 0
force -freeze sim:/reg/clk 1 0, 0 {50 ns} -r 100
run
force -freeze sim:/reg/rst 0 0
run
force -freeze sim:/reg/en 0 0
run
force -freeze sim:/reg/s1 1 0
run
force -freeze sim:/reg/s1 0 0
force -freeze sim:/reg/ip 11110000 0
force -freeze sim:/reg/s2 1 0
run
run
force -freeze sim:/reg/en 1 0
run
run