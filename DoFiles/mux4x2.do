vsim Project.mux4x2
add wave sim:/mux4x2/a
add wave sim:/mux4x2/b
add wave sim:/mux4x2/c
add wave sim:/mux4x2/d
add wave sim:/mux4x2/s0
add wave sim:/mux4x2/s1
add wave sim:/mux4x2/x
force -freeze sim:/mux4x2/a 00001111 0
force -freeze sim:/mux4x2/b 11110000 0
force -freeze sim:/mux4x2/c 55550000 0
force -freeze sim:/mux4x2/d 00005555 0
force -freeze sim:/mux4x2/s0 0 0
force -freeze sim:/mux4x2/s1 0 0
run
force -freeze sim:/mux4x2/s0 1 0
run
force -freeze sim:/mux4x2/s0 0 0
force -freeze sim:/mux4x2/s1 1 0
run
force -freeze sim:/mux4x2/s0 1 0
run