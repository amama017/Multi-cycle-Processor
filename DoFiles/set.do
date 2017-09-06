vsim Project.set
add wave sim:/set/a
add wave sim:/set/b
add wave sim:/set/s
add wave sim:/set/f
force -freeze sim:/set/a 00005555 0
force -freeze sim:/set/b 00005500 0
force -freeze sim:/set/s 0 0
run
force -freeze sim:/set/b 00005555 0
run
force -freeze sim:/set/b 00005500 0
force -freeze sim:/set/s 1 0
run
force -freeze sim:/set/b 00006500 0
run
force -freeze sim:/set/s 2 0
run
force -freeze sim:/set/b 00005500 0
run
force -freeze sim:/set/b 00005555 0
force -freeze sim:/set/s 1 0
run
force -freeze sim:/set/s 3 0
run
force -freeze sim:/set/s 2 0
run