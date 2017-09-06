vsim Project.my_ndff
add wave sim:/my_ndff/clk
add wave sim:/my_ndff/rst
add wave sim:/my_ndff/en
add wave sim:/my_ndff/d
add wave sim:/my_ndff/q
force -freeze sim:/my_ndff/rst 1 0
force -freeze sim:/my_ndff/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/my_ndff/d 00001111 0
force -freeze sim:/my_ndff/en 0 0
run
run
run
force -freeze sim:/my_ndff/en 1 0
run
force -freeze sim:/my_ndff/rst 0 0
run
run
force -freeze sim:/my_ndff/en 0 0
run
run
force -freeze sim:/my_ndff/d 00001110 0
run
force -freeze sim:/my_ndff/en 1 0
run
run
force -freeze sim:/my_ndff/d 00001111 0
run
noforce sim:/my_ndff/q
run
force -freeze sim:/my_ndff/en 0 0
run
noforce sim:/my_ndff/q
run