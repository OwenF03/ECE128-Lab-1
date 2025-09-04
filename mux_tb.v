`timescale 1ns / 1ps
//Owen Funk
// ECE 128 Lab 1
// Testbench file for Multiplexor module(s)

//Testbench module for multiplexor design
module mux_tb;
    
    wire y; 
    reg [7:0] in;
    reg [2:0] sel;
    reg [1:0] des;
    integer i, j; //Loop vars
    
    Multiplexor DUT(.i(in), .s(sel), .y(y), .des(des));
    
    //Set variables
    initial begin
        in[0] = 1;
        in[1] = 0;
        in[2] = 1;
        in[3] = 0;
        in[4] = 1;
        in[5] = 0;
        in[6] = 1;
        in[7] = 0;
        sel = 0;
        des = 0;
    end
    
    initial begin
        for(i = 0; i < 3; i = i + 1)begin
            if( i == 0) $display("Testing Structural Mux"); 
            if( i == 1) $display("Testing Behavioral Mux"); 
            if(i == 2) $display("Testing Dataflow Mux"); 
            for( j = 0; j < 8; j = j + 1)begin
                #10 sel = sel + 1; 
            end
            des = i + 1; //Switch design 
            sel = 0; // Set selection bits to zero
         end
         $finish;
    end
    
    initial begin
        $monitor("\tSel : %d\t y: %d", sel, y);
    end
    
endmodule
