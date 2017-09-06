vsim Project.tri_state_buffer
add wave sim:/tri_state_buffer/en
add wave sim:/tri_state_buffer/ip
add wave sim:/tri_state_buffer/op
force -freeze sim:/tri_state_buffer/ip 00001111 0
force -freeze sim:/tri_state_buffer/en 1 0
run
force -freeze sim:/tri_state_buffer/en 0 0
run
force -freeze sim:/tri_state_buffer/ip 00001110 0
run
force -freeze sim:/tri_state_buffer/en 1 0
run
force -freeze sim:/tri_state_buffer/ip 00001111 0
run