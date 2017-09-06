vsim Project.memdecoder
add wave sim:/memdecoder/s
add wave sim:/memdecoder/dataout
add wave sim:/memdecoder/en
force -freeze sim:/memdecoder/s 0 0
run
force -freeze sim:/memdecoder/s 1 0
run
force -freeze sim:/memdecoder/s 2 0
run