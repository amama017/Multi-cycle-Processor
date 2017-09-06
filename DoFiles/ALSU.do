vsim work.alsu
# vsim work.alsu 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.alsu(a_alsu)
# Loading ieee.numeric_std(body)
# Loading work.arith(a_arith)
# Loading work.my_nadder(a_my_nadder)
# Loading work.my_adder(a_my_adder)
# Loading work.logic(a_logic)
# Loading work.mux(a_mux)
# Loading work.shift(a_shift)
# Loading work.set(a_set)
add wave sim:/alsu/*
force -freeze sim:/alsu/A 00000003 0
force -freeze sim:/alsu/B 00000002 0
force -freeze sim:/alsu/S 0 0
run
force -freeze sim:/alsu/S 1 0
run
force -freeze sim:/alsu/S 2 0
run
force -freeze sim:/alsu/S 3 0
run
force -freeze sim:/alsu/S 4 0
run
force -freeze sim:/alsu/S 5 0
run
force -freeze sim:/alsu/S 6 0
run
force -freeze sim:/alsu/S 7 0
run
force -freeze sim:/alsu/S 8 0
run
force -freeze sim:/alsu/B 00000003 0
run
force -freeze sim:/alsu/S 9 0
run
force -freeze sim:/alsu/B 00000002 0
run
force -freeze sim:/alsu/S A 0
run
force -freeze sim:/alsu/A 00000001 0
run
force -freeze sim:/alsu/S B 0
run
force -freeze sim:/alsu/A 00000003 0
run
force -freeze sim:/alsu/S C 0
force -freeze sim:/alsu/A FFFF0000 0
force -freeze sim:/alsu/B 00000004 0
run
force -freeze sim:/alsu/S D 0
run
force -freeze sim:/alsu/S E 0
run
force -freeze sim:/alsu/S F 0
run
force -freeze sim:/alsu/A 00001111 0
run
