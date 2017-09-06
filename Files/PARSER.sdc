echo "** LOG(ChipTop.sdc): SCENARIO (S0)"

set PERIOD  26
set INPUT_DELAY  1.0
set OUTPUT_DELAY  1.0
set CLOCK_LATENCY 1.5
set MIN_IO_DELAY 1.0
set MAX_TRANSITION 1.1
set MAX_CAPACITANCE 80.0

echo "** LOG(ChipTop.sdc): S0 PERIOD: $PERIOD"

## CLOCK BASICS
create_clock -name "clock" -period $PERIOD [get_ports Clk]
set_clock_latency $CLOCK_LATENCY [get_clocks clock ]
set_clock_uncertainty 0.3 [get_clocks clock ]
set_clock_transition 0.4 [get_clocks clock ]


## GROUPING
group_path  -name CLOCK -to clock -weight 1

group_path  -name INPUTS -through [all_inputs] -weight 1

group_path  -name OUTPUTS -to [all_outputs] -weight 1


## IN/OUT
set INPUTPORTS [remove_from_collection [all_inputs] [get_ports Clk ]]
set OUTPUTPORTS [all_outputs]
  
set_input_delay -clock "clock" -max $INPUT_DELAY $INPUTPORTS 
set_output_delay -clock "clock" -max $OUTPUT_DELAY $OUTPUTPORTS
set_input_delay -clock "clock" -min $MIN_IO_DELAY $INPUTPORTS 
set_output_delay -clock "clock" -min $MIN_IO_DELAY $OUTPUTPORTS

#set REFLIB [get_object_name [index_collection [get_libs *wc] 0]]
set REFLIB saed90nm_max
set BUFFER "NBUFFX16"
set BUF_IN_PIN "IN"
set BUF_OUT_PIN "Q"

set_load [expr 5 * [load_of $REFLIB/$BUFFER/$BUF_IN_PIN]] [all_outputs]

set_driving_cell -library $REFLIB -lib_cell $BUFFER -pin $BUF_OUT_PIN [all_inputs]

remove_driving_cell [get_ports Clk]


## DRC
set_max_transition $MAX_TRANSITION [current_design]
set_max_capacitance $MAX_CAPACITANCE [current_design]
set_max_fanout 20 [current_design]
