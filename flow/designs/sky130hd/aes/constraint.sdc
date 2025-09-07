############### Preliminaries ###############

current_design aes_cipher_top

set clk_period 4.5
set clk_io_pct 0.2
set duty_cycle 0.4

set clk_1_rise 0.0
set clk_1_fall [expr {$clk_period * $duty_cycle}]
set clk_2_rise [expr {$clk_period / 2}]
set clk_2_fall [expr ($clk_period / 2) + ($clk_period * $duty_cycle)]

set clk_1_waveform_list {}
lappend clk_1_waveform_list $clk_1_rise
lappend clk_1_waveform_list $clk_1_fall

set clk_2_waveform_list {}
lappend clk_2_waveform_list $clk_2_rise
lappend clk_2_waveform_list $clk_2_fall


############### Set up clock 1 ###############

set clk_1_name clk
set clk_1_port_name clk

set clk_1_port [get_ports $clk_1_port_name]

create_clock -name $clk_1_name -period $clk_period $clk_1_port -waveform $clk_1_waveform_list


############### Set up clock 2 ###############

set clk_2_name clk_2
set clk_2_port_name clk_2

set clk_2_port [get_ports $clk_2_port_name]

create_clock -name $clk_2_name -period $clk_period $clk_2_port -waveform $clk_2_waveform_list


############### Create non-clock inputs ###############

set non_clock_inputs [all_inputs -no_clocks]


############### Set delays for clock 1 ###############

set_input_delay [expr $clk_period * $clk_io_pct] -clock $clk_1_name $non_clock_inputs
set_output_delay [expr $clk_period * $clk_io_pct] -clock $clk_1_name [all_outputs]


############### Set delays for clock 2 ###############

set_input_delay [expr $clk_period * $clk_io_pct] -clock $clk_2_name $non_clock_inputs
set_output_delay [expr $clk_period * $clk_io_pct] -clock $clk_2_name [all_outputs]
