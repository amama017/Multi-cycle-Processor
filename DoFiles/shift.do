vsim Project.shift
add wave sim:/shift/a
add wave sim:/shift/b
add wave sim:/shift/s
add wave sim:/shift/f
force -freeze sim:/shift/a 00100110 0
force -freeze sim:/shift/b 00000000 0
force -freeze sim:/shift/s 0 0
run
force -freeze sim:/shift/b 00000002 0
run
force -freeze sim:/shift/s 1 0
run
force -freeze sim:/shift/s 2 0
run
force -freeze sim:/shift/s 3 0
run