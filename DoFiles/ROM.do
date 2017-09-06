vsim Project.rom
add wave sim:/rom/clk
add wave sim:/rom/address
add wave sim:/rom/dout
force -freeze sim:/rom/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/rom/address 00 0
mem load -skip 0 -filltype inc -filldata {0 } -fillradix hexadecimal /rom/rom
run
run
force -freeze sim:/rom/address 03 0
run
run