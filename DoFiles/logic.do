vsim Project.logic
add wave sim:/logic/a
add wave sim:/logic/b
add wave sim:/logic/s
add wave sim:/logic/f
add wave sim:/logic/x0
add wave sim:/logic/x1
add wave sim:/logic/x2
add wave sim:/logic/x3
force -freeze sim:/logic/a 55000055 0
force -freeze sim:/logic/b 55115500 0
force -freeze sim:/logic/s 0 0
run
force -freeze sim:/logic/s 1 0
run
force -freeze sim:/logic/s 2 0
run
force -freeze sim:/logic/s 3 0
run