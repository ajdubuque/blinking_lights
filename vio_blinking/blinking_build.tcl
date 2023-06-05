# /* 
#        _________   ________     ________       
#       / U OF M  \ | LSA    \   / Physics\
#       \__ATLAS__/ |   ___   | |   ______/
#          |   |    |  |   \  | |  |
#          |   |    |  |___/  | |  \______     
#          |   |    |         | |         \
#          \___/    |________/   \________/
# */  

# // Author : T. Martin Baer & Aimee Dubuque 
# // Email  : tbaer@umich.edu adubuque@umich.edu
# // File   : blinking_build.tcl
# // Create : 2021-06-05 15:47
# // Revise : 2021-06-05 15:47
# // Editor : Vim, tab size (4)
# // Description: 
# //
# // -----------------------------------------------------------------------------


#*****************************************************************************************
#################################  README FIRST ##########################################
#*****************************************************************************************

# In order to execute the tcl script and build the project, run Vivado and go to: 
# Tools -> Run Tcl Script...
#
# An alternative way would be to open a terminal, and run this command:
# vivado -mode batch -source <PATH>/blinking_build.tcl
#
# For more info on how to make further changes to the script, see: 
# http://xillybus.com/tutorials/vivado-version-control-packaging

set_param general.maxThreads 8

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]
set source_dir "$origin_dir/sources"
set constrain_dir "$origin_dir/constraints"
set firmware_dir "$origin_dir/../vio_blinking_rebuild"


create_project blinking_rebuild $firmware_dir -part xc7k325tffg900-2 -force
set_property board_part xilinx.com:kc705:part0:1.6 [current_project]
set_property target_language VHDL [current_project]


#*****************************************************************************************
#################################  Adding Source #########################################
#*****************************************************************************************

add_files -fileset sources_1 $source_dir


#*****************************************************************************************
#################################  Adding Constrain ######################################
#****************************************campu*************************************************
add_files -fileset constrs_1 $constrain_dir


#*****************************************************************************************
#################################  Set Top Module ######################################
#*****************************************************************************************
set obj [get_filesets sources_1]
set_property -name "top" -value "top" -objects $obj


##################################################################
# CREATE IP vio_0
##################################################################

set vio vio_0
create_ip -name vio -vendor xilinx.com -library ip -module_name $vio

set_property -dict { 
  CONFIG.C_PROBE_OUT3_WIDTH {1}
  CONFIG.C_PROBE_OUT2_WIDTH {1}
  CONFIG.C_PROBE_OUT1_WIDTH {1}
  CONFIG.C_PROBE_OUT0_WIDTH {1}
  CONFIG.C_PROBE_IN3_WIDTH {1}
  CONFIG.C_PROBE_IN2_WIDTH {1}
  CONFIG.C_PROBE_IN1_WIDTH {1}
  CONFIG.C_PROBE_IN0_WIDTH {1}
  CONFIG.C_NUM_PROBE_OUT {4}
  CONFIG.C_NUM_PROBE_IN {4}
} [get_ips $vio]

##################################################################
# CREATE IP sys_clk
##################################################################

set clk_wiz clk_wiz_1
create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name $clk_wiz

set_property -dict { 
  CONFIG.PRIM_IN_FREQ {200}
  CONFIG.CLKIN1_JITTER_PS {10.0}
  CONFIG.CLKOUT2_USED {false}
  CONFIG.NUM_OUT_CLKS {1}
  CONFIG.CLK_OUT1_PORT {clk_out1}
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100}
  CONFIG.PRIM_SOURCE {Differential_clock_capable_pin}
  CONFIG.USE_RESET {true}
  CONFIG.MMCM_CLKFBOUT_MULT_F {5.000}
  CONFIG.MMCM_CLKIN1_PERIOD {5.000}
  CONFIG.MMCM_CLKIN2_PERIOD {10.0}
  CONFIG.MMCM_CLKOUT0_DIVIDE {10.000}
  CONFIG.CLKOUT1_JITTER {112.316}
  CONFIG.CLKOUT1_PHASE_ERROR {89.971}
} [get_ips $clk_wiz]

