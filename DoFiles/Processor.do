vsim Project.processor
add wave sim:/processor/clk
add wave sim:/processor/rst
add wave sim:/processor/src1
add wave sim:/processor/src2
add wave sim:/processor/dst
add wave sim:/processor/outir
add wave sim:/processor/inir
add wave sim:/processor/controlsignals
add wave sim:/processor/regsel
add wave sim:/processor/imm
add wave sim:/processor/z
force -freeze sim:/processor/rst 1 0
force -freeze sim:/processor/clk 1 0, 0 {50 ns} -r 100
mem load -i {D:/Uni/3rd/Second Term/VLSI/Project/MemFiles/Rom.mem} /processor/dec/rom1/rom
mem load -i {D:/Uni/3rd/Second Term/VLSI/Project/MemFiles/ID.mem} /processor/dec/instdecoder/addarray
mem load -i {D:/Uni/3rd/Second Term/VLSI/Project/MemFiles/Ram.mem} /processor/mem/ram/ram
run
run
force -freeze sim:/processor/rst 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run