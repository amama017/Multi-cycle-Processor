vsim work.registers
# vsim work.registers 
# Loading C:\FPGAdv72PS\Modeltech\win32/../std.standard
# Loading C:\FPGAdv72PS\Modeltech\win32/../ieee.std_logic_1164(body)
# Loading work.registers(a_registers)
# Loading work.tri_state_buffer(a_tri_state_buffer)
# Loading C:\FPGAdv72PS\Modeltech\win32/../ieee.numeric_std(body)
# Loading work.decoder5x32(rtl)
# Loading work.my_ndff(a_my_ndff)
# Loading work.reg(structure)
add wave sim:/registers/dst
add wave sim:/registers/src2
add wave sim:/registers/src1
add wave sim:/registers/En
add wave sim:/registers/s
add wave sim:/registers/cout
add wave sim:/registers/bin
add wave sim:/registers/ain
add wave sim:/registers/cin
add wave sim:/registers/bout
add wave sim:/registers/aout
add wave sim:/registers/en
add wave sim:/registers/rst
add wave sim:/registers/clk
add wave sim:/registers/n
force -freeze sim:/registers/rst 0 0
force -freeze sim:/registers/en 1 0
force -freeze sim:/registers/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/registers/aout 0 0
force -freeze sim:/registers/bout 0 0
force -freeze sim:/registers/cin 0 0
force -freeze sim:/registers/ain 0 0
force -freeze sim:/registers/bin 0 0
force -freeze sim:/registers/cout 0 0
force -freeze sim:/registers/s 0000 0
force -freeze sim:/registers/En 0 0
force -freeze sim:/registers/dst 00001111 0
run
force -freeze sim:/registers/rst 1 0
run
force -freeze sim:/registers/rst 0 0
run
force -freeze sim:/registers/cin 1 0
run
force -freeze sim:/registers/En 1 0
force -freeze sim:/registers/cout 1 0
force -freeze sim:/registers/cin 0 0
run
force -freeze sim:/registers/En 3 0
force -freeze sim:/registers/cout 0 0
force -freeze sim:/registers/ain 1 0
run
force -freeze sim:/registers/ain 0 0
force -freeze sim:/registers/aout 1 0
run
force -freeze sim:/registers/bin 1 0
run
force -freeze sim:/registers/bin 0 0
force -freeze sim:/registers/bout 1 0