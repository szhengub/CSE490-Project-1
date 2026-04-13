#Notes:
# get_ports [module name] --> How to reference the modules
# PACKAGE_PIN --> Physical hardware on board (ex. U18)
# IOSTANDARD --> Tells chip which voltage to use (LVCMOS33)

###################################################
#OTHER CLOCK (i dont know if this one works???)
##################################################
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10.0 [get_ports clock]

#######################
#reset 
#using SW1 (v16)
#######################
set_property PACKAGE_PIN V16 [get_ports reset]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]



#######################
#LEDs 
#######################
set_property PACKAGE_PIN U16 [get_ports {datapathOutput[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[0]}]

set_property PACKAGE_PIN E19 [get_ports {datapathOutput[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[1]}]

set_property PACKAGE_PIN U19 [get_ports {datapathOutput[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[2]}]

set_property PACKAGE_PIN V19 [get_ports {datapathOutput[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[3]}]

set_property PACKAGE_PIN W18 [get_ports {datapathOutput[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[4]}]

set_property PACKAGE_PIN U15 [get_ports {datapathOutput[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[5]}]

set_property PACKAGE_PIN U14 [get_ports {datapathOutput[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[6]}]

set_property PACKAGE_PIN V14 [get_ports {datapathOutput[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[7]}]

set_property PACKAGE_PIN V13 [get_ports {datapathOutput[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[8]}]

set_property PACKAGE_PIN V3  [get_ports {datapathOutput[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[9]}]

set_property PACKAGE_PIN W3 [get_ports {datapathOutput[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[10]}]

set_property PACKAGE_PIN U3 [get_ports {datapathOutput[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[11]}]

set_property PACKAGE_PIN P3 [get_ports {datapathOutput[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[12]}]

set_property PACKAGE_PIN N3 [get_ports {datapathOutput[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[13]}]

set_property PACKAGE_PIN P1 [get_ports {datapathOutput[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[14]}]

set_property PACKAGE_PIN L1 [get_ports {datapathOutput[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {datapathOutput[15]}]














