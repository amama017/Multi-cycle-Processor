vsim Project.my_adder
add wave sim:/my_adder/a
add wave sim:/my_adder/b
add wave sim:/my_adder/cin
add wave sim:/my_adder/s
add wave sim:/my_adder/cout
force -freeze sim:/my_adder/a 0 0
force -freeze sim:/my_adder/b 0 0
force -freeze sim:/my_adder/cin 0 0
run
force -freeze sim:/my_adder/cin 1 0
run
force -freeze sim:/my_adder/a 1 0
run
force -freeze sim:/my_adder/b 1 0
run
force -freeze sim:/my_adder/cin 0 0
run
force -freeze sim:/my_adder/a 0 0
run