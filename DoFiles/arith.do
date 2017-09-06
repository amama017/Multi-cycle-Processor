vsim Project.arith
add wave sim:/arith/a
add wave sim:/arith/b
add wave sim:/arith/s
add wave sim:/arith/f
add wave sim:/arith/bout
add wave sim:/arith/add
force -freeze sim:/arith/a 00001100 0
force -freeze sim:/arith/b 00000055 0
force -freeze sim:/arith/s 0 0
run
force -freeze sim:/arith/s 1 0
run
force -freeze sim:/arith/s 2 0
run
force -freeze sim:/arith/s 3 0
run