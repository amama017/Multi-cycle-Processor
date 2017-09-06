vsim Project.decoders
add wave sim:/decoders/clk
add wave sim:/decoders/rst
add wave sim:/decoders/instruction
add wave sim:/decoders/regsel
add wave sim:/decoders/controlsignals
add wave sim:/decoders/imm
add wave sim:/decoders/outrom
add wave sim:/decoders/maddress
add wave sim:/decoders/outdstdecoder
add wave sim:/decoders/outmddecoder
add wave sim:/decoders/outmemdecoder
add wave sim:/decoders/outregdecoder_1
add wave sim:/decoders/outregdecoder_2
force -freeze sim:/decoders/rst 1 0
force -freeze sim:/decoders/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/decoders/instruction 003b2820 0
mem load -i {D:/Uni/3rd/Second Term/VLSI/Project/Doc/ID.mem} /decoders/instdecoder/addarray
mem load -i {D:/Uni/3rd/Second Term/VLSI/Project/Doc/ROM.mem} /decoders/rom1/rom
run
run
force -freeze sim:/decoders/rst 0 0
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
force -freeze sim:/decoders/rst 1 0
run
force -freeze sim:/decoders/rst 0 0
run
run
run
run
run