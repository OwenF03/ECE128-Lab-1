# ECE128 Lab 1
# Owen Funk and David Riley

## Description

Design and test an 8-1 Multiplexor on a Basys 3 FPGA. The design was implemented and tested using AMD Vivado 2023.1.

## Instructions to run

Download Multiplexor.v, mux_tb.v and constraints.xdc. Create a new project targeting the xc7a35tcpg236 chip. Import Multiplexor.v into the design sources, mux_tb.v into the simulation sources, and constraints.xdc into the constraint sources. Select the desired mux design top module (not the Multiplexor module), and set it as the top module. Once selected, run generate bitstream, and upload the bitstream to the FPGA for testing. 

If simulation is desired, run behaviorial simulations. This will run a simulation of the Multiplexor module, which wraps the three different mux designs and outputs all of the test results into a single waveform. 

