vsim Project.mux
add wave sim:/mux/a
add wave sim:/mux/b
add wave sim:/mux/s1
add wave sim:/mux/dataout
force -freeze sim:/mux/a 00001111 0
force -freeze sim:/mux/b 55550000 0
force -freeze sim:/mux/s1 1 0
run
force -freeze sim:/mux/s1 0 0
run