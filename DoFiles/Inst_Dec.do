vsim Project.inst_dec
add wave sim:/inst_dec/clk
add wave sim:/inst_dec/rst
add wave sim:/inst_dec/instruction
add wave sim:/inst_dec/rom
add wave sim:/inst_dec/maddress
add wave sim:/inst_dec/imm
mem load -i {D:/Uni/3rd/Second Term/VLSI/Project/Doc/ID.mem} /inst_dec/addarray
mem load -filltype value -filldata 07 -fillradix hexadecimal /inst_dec/addarray(1)
force -freeze sim:/inst_dec/rom 000000 0
force -freeze sim:/inst_dec/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/inst_dec/rst 1 0
force -freeze sim:/inst_dec/instruction 00000024 0
run
force -freeze sim:/inst_dec/rst 0 0
run
run
run
run
force -freeze sim:/inst_dec/rom 400000 0
run
force -freeze sim:/inst_dec/rom 100000 0
force -freeze sim:/inst_dec/rom 080000 0
run
run
force -freeze sim:/inst_dec/instruction 00000020 0
run
force -freeze sim:/inst_dec/instruction 08000000 0
run
force -freeze sim:/inst_dec/rom 060000 0
run
run
force -freeze sim:/inst_dec/rom 000000 0
run
run
run
force -freeze sim:/inst_dec/rom 080000 0
run
force -freeze sim:/inst_dec/instruction 00000020 0
run
run
force -freeze sim:/inst_dec/rom 000000 0
run
force -freeze sim:/inst_dec/rom 060000 0
run