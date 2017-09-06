vsim Project.memory
add wave sim:/memory/clk
add wave sim:/memory/rst
add wave sim:/memory/en
add wave sim:/memory/rw
add wave sim:/memory/maren
add wave sim:/memory/mdren
add wave sim:/memory/mars1
add wave sim:/memory/mars2
add wave sim:/memory/mdrs1
add wave sim:/memory/mdrs2
add wave sim:/memory/s
add wave sim:/memory/dstbus
add wave sim:/memory/ir
add wave sim:/memory/scr1
add wave sim:/memory/scr2
add wave sim:/memory/mdrin
add wave sim:/memory/mdrout
add wave sim:/memory/marout
add wave sim:/memory/ramout
add wave sim:/memory/muxin
force -freeze sim:/memory/rst 1 0
force -freeze sim:/memory/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/memory/en 0 0
force -freeze sim:/memory/rw 0 0
force -freeze sim:/memory/maren 0 0
force -freeze sim:/memory/mdren 0 0
force -freeze sim:/memory/mars1 0 0
force -freeze sim:/memory/mars2 0 0
force -freeze sim:/memory/mdrs1 0 0
force -freeze sim:/memory/mdrs2 0 0
force -freeze sim:/memory/s 0 0
force -freeze sim:/memory/dstbus 00001111 0
mem load -skip 0 -filltype value -filldata {55 } -fillradix hexadecimal /memory/ram/ram
run
run
force -freeze sim:/memory/rst 0 0
force -freeze sim:/memory/mdren 1 0
run
force -freeze sim:/memory/mdren 0 0
run
force -freeze sim:/memory/en 1 0
run
force -freeze sim:/memory/s 1 0
run
force -freeze sim:/memory/mdrs1 1 0
force -freeze sim:/memory/mars2 1 0
run
force -freeze sim:/memory/rw 1 0
run
run
force -freeze sim:/memory/rw 0 0
run
run