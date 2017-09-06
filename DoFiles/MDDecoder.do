vsim Project.mddecoder
add wave sim:/mddecoder/s
add wave sim:/mddecoder/dataout
force -freeze sim:/mddecoder/s 0 0
run
force -freeze sim:/mddecoder/s 1 0
run
force -freeze sim:/mddecoder/s 2 0
run