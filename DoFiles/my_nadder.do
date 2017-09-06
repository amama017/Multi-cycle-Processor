vsim Project.my_nadder
add wave sim:/my_nadder/a
add wave sim:/my_nadder/b
add wave sim:/my_nadder/cin
add wave sim:/my_nadder/s
add wave sim:/my_nadder/cout
add wave sim:/my_nadder/temp
force -freeze sim:/my_nadder/a 02 0
force -freeze sim:/my_nadder/b 15 0
force -freeze sim:/my_nadder/cin 0 0
run
force -freeze sim:/my_nadder/cin 1 0
run
force -freeze sim:/my_nadder/a a2 0
run