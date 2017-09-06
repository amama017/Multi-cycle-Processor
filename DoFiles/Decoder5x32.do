vsim Project.decoder5x32
add wave sim:/decoder5x32/en
add wave sim:/decoder5x32/s
add wave sim:/decoder5x32/dataout
force -freeze sim:/decoder5x32/en 0 0
force -freeze sim:/decoder5x32/s 01 0
run
force -freeze sim:/decoder5x32/s 07 0
run
force -freeze sim:/decoder5x32/en 1 0
run
force -freeze sim:/decoder5x32/s 06 0
run
force -freeze sim:/decoder5x32/s 16 0
run
force -freeze sim:/decoder5x32/s 00 0
run