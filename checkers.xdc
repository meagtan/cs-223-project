# Clock signal 
set_property PACKAGE_PIN W5 [get_ports clk]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports clk] 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 


#LEDs
set_property PACKAGE_PIN W3 [get_ports {play[0]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {play[0]}]
set_property PACKAGE_PIN P1 [get_ports {play[1]}]  	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports {play[1]}] 
 	 
#7 segment display 
 set_property PACKAGE_PIN W7 [get_ports {seg[0]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}] 
 set_property PACKAGE_PIN W6 [get_ports {seg[1]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}] 
 set_property PACKAGE_PIN U8 [get_ports {seg[2]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}] 
 set_property PACKAGE_PIN V8 [get_ports {seg[3]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}] 
 set_property PACKAGE_PIN U5 [get_ports {seg[4]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}] 
 set_property PACKAGE_PIN V5 [get_ports {seg[5]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}] 
 set_property PACKAGE_PIN U7 [get_ports {seg[6]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}] 
 set_property PACKAGE_PIN V7 [get_ports dp]  	 	 	 	  
 	 set_property IOSTANDARD LVCMOS33 [get_ports dp] 
 set_property PACKAGE_PIN U2 [get_ports {an[0]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}] 
 set_property PACKAGE_PIN U4 [get_ports {an[1]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
 set_property PACKAGE_PIN V4 [get_ports {an[2]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
 set_property PACKAGE_PIN W4 [get_ports {an[3]}] 	 	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}] 
  
#Buttons 
set_property PACKAGE_PIN T18 [get_ports btnU]                           
     set_property IOSTANDARD LVCMOS33 [get_ports btnU] 
set_property PACKAGE_PIN W19 [get_ports btnL]                           
     set_property IOSTANDARD LVCMOS33 [get_ports btnL] 
set_property PACKAGE_PIN T17 [get_ports btnR]                           
     set_property IOSTANDARD LVCMOS33 [get_ports btnR] 
set_property PACKAGE_PIN U17 [get_ports btnD]                           
     set_property IOSTANDARD LVCMOS33 [get_ports btnD] 
set_property PACKAGE_PIN U18 [get_ports btnC]                           
     set_property IOSTANDARD LVCMOS33 [get_ports btnC] 
  

##Pmod Header JB 
##Sch name = JB1 
 set_property PACKAGE_PIN A14 [get_ports {cols[0]}]  	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {cols[0]}] 
#Sch name = JB2 
 set_property PACKAGE_PIN A16 [get_ports {cols[1]}]  	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {cols[1]}] 
#Sch name = JB3 
 set_property PACKAGE_PIN B15 [get_ports {cols[2]}]  	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {cols[2]}] 
##Sch name = JB4 
 set_property PACKAGE_PIN B16 [get_ports {cols[3]}]  	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {cols[3]}] 
##Sch name = JB7 
set_property PACKAGE_PIN A15 [get_ports {cols[4]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {cols[4]}] 
##Sch name = JB8 
set_property PACKAGE_PIN A17 [get_ports {cols[5]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {cols[5]}] 
##Sch name = JB9 
set_property PACKAGE_PIN C15 [get_ports {cols[6]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {cols[6]}] 
##Sch name = JB10  
 set_property PACKAGE_PIN C16 [get_ports {cols[7]}]  	 	 	 	 
 	 set_property IOSTANDARD LVCMOS33 [get_ports {cols[7]}] 
  
##Pmod Header JC 
##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports {ds}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {ds}] 
###Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports {oe}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {oe}] 
###Sch name = JC3 
set_property PACKAGE_PIN N17 [get_ports {stclk}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {stclk}] 
###Sch name = JC4 
set_property PACKAGE_PIN P18 [get_ports {srclk}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {srclk}] 
###Sch name = JC7 
set_property PACKAGE_PIN L17 [get_ports {mr}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {mr}] 
