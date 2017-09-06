vsim Project.sync_ram
add wave sim:/sync_ram/clk
add wave sim:/sync_ram/we
add wave sim:/sync_ram/en
add wave sim:/sync_ram/address
add wave sim:/sync_ram/din
add wave sim:/sync_ram/dout
mem load -skip 0 -filltype value -filldata {55 } -fillradix hexadecimal /sync_ram/ram
mem load -skip 0 -filltype value -filldata {55 } -fillradix hexadecimal /sync_ram/ram
force -freeze sim:/sync_ram/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/sync_ram/en 0 0
force -freeze sim:/sync_ram/we 0 0
force -freeze sim:/sync_ram/address 00000000 0
force -freeze sim:/sync_ram/din 00111001 0
run
force -freeze sim:/sync_ram/en 1 0
run
run
force -freeze sim:/sync_ram/we 1 0
run
force -freeze sim:/sync_ram/we 0 0
run
run