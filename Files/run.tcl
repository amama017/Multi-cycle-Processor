source scripts/setup.tcl

read_file -format vhdl {Code/mux.vhd}
analyze -library WORK -format vhdl {Code/mux.vhd}
elaborate MUX -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/mux4x2.vhd}
analyze -library WORK -format vhdl {Code/mux4x2.vhd}
elaborate MUX4X2 -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/my_adder.vhd}
analyze -library WORK -format vhdl {Code/my_adder.vhd}
elaborate MY_ADDER -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/my_nadder.vhd}
analyze -library WORK -format vhdl {Code/my_nadder.vhd}
elaborate MY_NADDER -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/my_nDFF.vhd}
analyze -library WORK -format vhdl {Code/my_nDFF.vhd}
elaborate MY_NDFF -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/RegDecoder.vhd}
analyze -library WORK -format vhdl {Code/RegDecoder.vhd}
elaborate REGDECODER -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/DstDecoder.vhd}
analyze -library WORK -format vhdl {Code/DstDecoder.vhd}
elaborate DSTDECODER -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/MemDecoder.vhd}
analyze -library WORK -format vhdl {Code/MemDecoder.vhd}
elaborate MEMDECODER -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/decoder5x32.vhd}
analyze -library WORK -format vhdl {Code/decoder5x32.vhd}
elaborate DECODER5X32 -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/logic.vhd}
analyze -library WORK -format vhdl {Code/logic.vhd}
elaborate LOGIC -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/arith.vhd}
analyze -library WORK -format vhdl {Code/arith.vhd}
elaborate ARITH -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/set.vhd}
analyze -library WORK -format vhdl {Code/set.vhd}
elaborate SET -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/shift.vhd}
analyze -library WORK -format vhdl {Code/shift.vhd}
elaborate SHIFT -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/ALSU.vhd}
analyze -library WORK -format vhdl {Code/ALSU.vhd}
elaborate ALSU -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/ROM.vhd}
analyze -library WORK -format vhdl {Code/ROM.vhd}
elaborate ROM -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Extend.vhd}
analyze -library WORK -format vhdl {Code/Extend.vhd}
elaborate EXTEND -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/inst_dec.vhd}
analyze -library WORK -format vhdl {Code/inst_dec.vhd}
elaborate INST_DEC -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Decoders.vhd}
analyze -library WORK -format vhdl {Code/Decoders.vhd}
elaborate DECODERS -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/RAM.vhd}
analyze -library WORK -format vhdl {Code/RAM.vhd}
elaborate SYNC_RAM -architecture RTL -library DEFAULT
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Tri_state_buffer.vhd}
analyze -library WORK -format vhdl {Code/Tri_state_buffer.vhd}
elaborate TRI_STATE_BUFFER -architecture RTL -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Reg.vhd}
analyze -library WORK -format vhdl {Code/Reg.vhd}
elaborate REG -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/IR.vhd}
analyze -library WORK -format vhdl {Code/IR.vhd}
elaborate IR -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Registers.vhd}
analyze -library WORK -format vhdl {Code/Registers.vhd}
elaborate REGISTERS -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Memory.vhd}
analyze -library WORK -format vhdl {Code/Memory.vhd}
elaborate MEMORY -architecture ARCMEMORY -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor

read_file -format vhdl {Code/Processor.vhd}
analyze -library WORK -format vhdl {Code/Processor.vhd}
elaborate PROCESSOR -architecture STRUCTURE -library DEFAULT -parameters "n = 32"
#link
#check_design
#source PARSER.sdc
#compile -exact_map
#report_area
#report_timing
#report_constraint
#report_qor
