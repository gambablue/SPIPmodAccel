## Clock signal
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];

## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {LED[0]}];
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports {LED[1]}];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports {LED[2]}];
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports {LED[3]}];
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports {LED[4]}];
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports {LED[5]}];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports {LED[6]}];
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports {LED[7]}];
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports {LED[8]}];
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports {LED[9]}];
set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports {LED[10]}];
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports {LED[11]}];
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports {LED[12]}];
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports {LED[13]}];
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports {LED[14]}];
#set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports {LED[15]}]
##Buttons
##7 Segment Display
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports {SEG[0]}];
set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports {SEG[1]}];
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {SEG[2]}];
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports {SEG[3]}];
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {SEG[4]}];
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {SEG[5]}];
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {SEG[6]}];

set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports DP];

set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {AN[0]}];
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {AN[1]}];
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports {AN[2]}];
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports {AN[3]}];

##Accelerometer
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { ACL_MISO }]; #IO_L11P_T1_SRCC_15 Sch=acl_miso
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { ACL_MOSI }]; #IO_L5N_T0_AD9N_15 Sch=acl_mosi
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { ACL_SCLK }]; #IO_L14P_T2_SRCC_15 Sch=acl_sclk
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { ACL_CSN }]; #IO_L12P_T1_MRCC_15 Sch=acl_csn
#set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }]; #IO_L2P_T0_AD8P_15 Sch=acl_int[1]
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }]; #IO_L20P_T3_A20_15 Sch=acl_int[2]