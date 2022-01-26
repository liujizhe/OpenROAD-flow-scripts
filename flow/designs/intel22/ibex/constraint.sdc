current_design ibex_core
set clk_name  core_clock
set clk_period 8000
#
create_clock -name $clk_name -period $clk_period [get_ports {clk_i}]
#
set_input_delay  [expr $clk_period * 0.2] -clock $clk_name [all_inputs]
set_output_delay [expr $clk_period * 0.2] -clock $clk_name [all_outputs]
