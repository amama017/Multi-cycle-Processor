vsim Project.demux
add wave sim:/demux/a
add wave sim:/demux/b
add wave sim:/demux/s2
add wave sim:/demux/datain
force -freeze sim:/demux/datain 55550000 0
force -freeze sim:/demux/s2 1 0
run
force -freeze sim:/demux/s2 0 0
run