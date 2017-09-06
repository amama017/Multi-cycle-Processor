# ************************************************************************** 
# 
# ************************************************************************** 
#
#===========================================================================
# 
# This file contains all the technology dependent variables used by all the
# synthesis scripts to create the gate level design.
#
#===========================================================================
#----------------------------------------------------------------------------
echo $design_name

   set LIBRARY_NAME models/saed90nm_typ_ht_pg
   set OPERATING_COND TYPICAL
   set MIN_LIBRARY_NAME models/saed90nm_min_pg
   set MIN_OPERATING_COND BEST
   set MAX_LIBRARY_NAME models/saed90nm_max_pg
   set MAX_OPERATING_COND WOREST
   set WIRELOAD_NAME ForQa
   set WIRELOAD_LIB_NAME models/saed90nm_min_pg
   set WIRELOAD_LIB_NAME_MIN models/saed90nm_min_pg

#----------------------------------------------------------------------------
# ***** LIBRARY SETUP ***********

  lappend search_path ../models




# Set std cell library
set target_library "$MAX_LIBRARY_NAME.db"

# Set Custom wireload library. Only if you have one
# otherwise set it to ""  
set custom_wireload_library ""
# Set DesignWare Foundation library
set synthetic_library dw_foundation.sldb

#----------------------------------------------------------------------------
# Setting up Link library (This doesn't need to be changed)
#----------------------------------------------------------------------------
set link_library "$target_library"

if {$custom_wireload_library != ""} then {\
  lappend link_library $custom_wireload_library}
# if not pt_shell link synthetic library
if {[regexp {pt_shell} $synopsys_program_name] == 0} \
 {lappend link_library $synthetic_library}
if {[regexp {fpc_shell} $synopsys_program_name] == 1} {
  lappend link_path "$target_library" 
}
if {[regexp {astro} $synopsys_program_name] == 1} {
    set link_library ""
}

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# ***** MWDB SETUP
#----------------------------------------------------------------------------
# The following section defines the setup files and locations needed to to
#  create the MilkyWay database.
#----------------------------------------------------------------------------

set lib_path ../ref
set mw_reference_library [list ${lib_path}/saed90nm_fr 
		     ]

set TLUPLUS true
set MW_TECH_FILE ${lib_path}/tech/saed90nm.tf
set MAX_TLUPLUS ${lib_path}/tlup/saed90nm_1p9m_1t_Cmax.tluplus
set NOM_TLUPLUS ${lib_path}/tlup/saed90nm_1p9m_1t_nominal.tluplus
set MIN_TLUPLUS ${lib_path}/tlup/saed90nm_1p9m_1t_Cmin.tluplus
set MAP_FILE    ${lib_path}/tlup/tech2itf.map
set mw_logic1_net VDD
set mw_logic0_net VSS

#----------------------------------------------------------------------------
# Use TLUPlus for RC Computation
# If you do not have TLUPlus, Comment out the following lines
#----------------------------------------------------------------------------
if { [info exists synopsys_program_name] } {
   if { [regexp {^psyn} $synopsys_program_name] } {
	set_tlu_plus_files -max_tluplus $MAX_TLUPLUS \
                        -min_tluplus $MIN_TLUPLUS \
			-tech2itf_map $MAP_FILE
   } 
}
#----------------------------------------------------------------------------
# Describes the type of cell to use as driver for the inputs and a load
# for the outputs of the design.
#----------------------------------------------------------------------------
set DRIVING_CELL INVX16
set OUTPUT_LOAD_PIN "$LIBRARY_NAME\/$DRIVING_CELL\/QN"
set OUTPUT_LOAD_VALUE 0.1025

if {[catch {getenv "scan_switch"} scan_switch]} {
   setenv scan_switch false
}
if {[catch {getenv "dft_switch"} dft_switch]} {
   setenv dft_switch false
}

# OCV derate settings
set OCV_DERATE_ENABLE    false  ;# Enable/Disable OCV derate
set OCV_DERATE_PERCENT   5      ;# OCV derate factor in precent

#----------------------------------------------------------------------------
# MISC VARIABLES
#----------------------------------------------------------------------------
set CRITICAL_RANGE  0.5  ;# critical_range for violated paths optimization 0.5
set RC_SCALE_FACTOR 1.05 ;# net RC scale factor 


#----------------------------------------------------------------------------
# COFIGURE MCMM MODE 
#----------------------------------------------------------------------------
set MCMM_ENABLE        false ;# Enable MCMM mode
set MCMM_FAST_RUN_TIME false ;# If true MCMM uses only dominant scenario (fast). if "false" MCMM uses all scenarios (slow)



#----------------------------------------------------------------------------
#***** CLOCK VARIABLES ******
#----------------------------------------------------------------------------
# set the clock period 
# Overconstrain the clock period during synthesis but for finial STA using
# PrimeTime constraint the clock to the right value

if {[regexp {pt_shell} $synopsys_program_name] == 1} {
  set PRIMARY_CLK_PERIOD 2.5
} else {
  set PRIMARY_CLK_PERIOD 2.2
}
set sys_clk 100.0

# PLB clocks cannot have a frequency faster than the primary clock
# The PLB clocks must be synchronous with respect to the primary clock
# PLB clock must have a frequency that satisfies the relationship: 
# K/N (K>N, N=1,2,3)
set K 2
set N 1
set pclk [expr $PRIMARY_CLK_PERIOD * $K/$N]

# The following are used to set up clock uncertanity constraints.
# CLK_SKEW + CLK_JITTER are used to set up skews within the same clock domain. # BETWEEN_CORECLK_SKEW_MAX/MIN are used to set up skews between the 
# coreClk and the other clock domains.
set CLK_SKEW 0.10
set CLK_JITTER 0.075
set BETWEEN_CORECLK_SKEW_MAX 0.20
set BETWEEN_CORECLK_SKEW_MIN 0.05

# set the clock duty cycle
set PRIMARY_CLK_DUTY 0.5

#----------------------------------------------------------------------------
#***** DRC VARIABLES ******
#----------------------------------------------------------------------------
# max_transition to set on the design
set MAX_TRANS 0.5
# max_fanout to set on the design
set MAX_FANOUT 20

#----------------------------------------------------------------------------
#***** MISC Section *****
#----------------------------------------------------------------------------

set hdlin_keep_feedback true
set hdlin_preserve_sequential true
set compile_delete_unloaded_sequential_cells false
# Used to preserve the testability registers
set compile_seqmap_propagate_constants false
set compile_seqmap_propagate_high_effort false



#----------------------------------------------------------------------------
# Design Variables
#----------------------------------------------------------------------------
set sitemap cnx4site
if { $synopsys_program_name == "icc_shell" } { set enable_recovery_removal_arcs "true" }


set CLK_TREE_REF_LIST [list NBUFFX4 NBUFFX2 NBUFFX8 NBUFFX16 NBUFFX32]




if { [regexp {^dc.*} $synopsys_program_name] || [regexp {^icc.*} $synopsys_program_name]} {
  set timing_non_unate_clock_compatibility true } 



