vsim Project.dstdecoder
add wave sim:/dstdecoder/s
add wave sim:/dstdecoder/dataout
force -freeze sim:/dstdecoder/s 0 0
run
force -freeze sim:/dstdecoder/s 1 0
run
force -freeze sim:/dstdecoder/s 2 0
run
force -freeze sim:/dstdecoder/s 3 0
run