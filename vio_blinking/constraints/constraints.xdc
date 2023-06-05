#constraint for reset button

set_property PACKAGE_PIN G12 [get_ports reset]
set_property IOSTANDARD LVCMOS25 [get_ports reset]

#define constraints for switches 1 through 5
set_property PACKAGE_PIN Y28 [get_ports sw_1]
set_property IOSTANDARD LVCMOS25 [get_ports sw_1]

set_property PACKAGE_PIN AA28 [get_ports sw_2]
set_property IOSTANDARD LVCMOS25 [get_ports sw_2]

set_property PACKAGE_PIN W29 [get_ports sw_3]
set_property IOSTANDARD LVCMOS25 [get_ports sw_3]

set_property PACKAGE_PIN Y29 [get_ports sw_4]
set_property IOSTANDARD LVCMOS25 [get_ports sw_4]

#define constraints for leds 0 through 7
set_property PACKAGE_PIN AB8 [get_ports l_0]
set_property IOSTANDARD LVCMOS15 [get_ports l_0]

set_property PACKAGE_PIN AA8 [get_ports l_1]
set_property IOSTANDARD LVCMOS15 [get_ports l_1]

set_property PACKAGE_PIN AC9 [get_ports l_2]
set_property IOSTANDARD LVCMOS15 [get_ports l_2]

set_property PACKAGE_PIN AB9 [get_ports l_3]
set_property IOSTANDARD LVCMOS15 [get_ports l_3]


set_property PACKAGE_PIN AE26 [get_ports l_4]
set_property IOSTANDARD LVCMOS25 [get_ports l_4]

set_property PACKAGE_PIN G19 [get_ports l_5]
set_property IOSTANDARD LVCMOS25 [get_ports l_5]

set_property PACKAGE_PIN E18 [get_ports l_6]
set_property IOSTANDARD LVCMOS25 [get_ports l_6]

set_property PACKAGE_PIN F16 [get_ports l_7]
set_property IOSTANDARD LVCMOS25 [get_ports l_7]

#define constraints for system clocks
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_in1_n]

set_property PACKAGE_PIN AD12 [get_ports clk_in1_p]
set_property PACKAGE_PIN AD11 [get_ports clk_in1_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_in1_p]

#set_property -dict {PACKAGE_PIN W29     IOSTANDARD LVCMOS25} [get_ports {swtch_3}];
#set_property -dict {PACKAGE_PIN Y29     IOSTANDARD LVCMOS25} [get_ports {swtch_4}];

set_property MARK_DEBUG true [get_nets probe_out0]
set_property MARK_DEBUG true [get_nets probe_out1]
set_property MARK_DEBUG true [get_nets probe_out2]
set_property MARK_DEBUG true [get_nets probe_out3]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_out1]
