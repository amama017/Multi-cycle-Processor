vsim Project.extend
add wave sim:/extend/imm
add wave sim:/extend/din
add wave sim:/extend/dout
force -freeze sim:/extend/imm 1 0
force -freeze sim:/extend/din 1105500 0
run
force -freeze sim:/extend/imm 0 0
run