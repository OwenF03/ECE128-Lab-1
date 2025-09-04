`timescale 1ns / 1ps
// Owen Funk
// ECE 128
// Lab 1
module Multiplexor
(
    input [7:0]i,
    input [2:0]s, 
    input [1:0]design,
    output y
);
    
    always @(*) begin
        case(design)
            0: mux8_1_struct(i, s, y); 
            1: mux8_1_dataflow(i, s, y);
            2: mux8_1_dataflow(i, s, y);
        endcase
    end

endmodule

module mux8_1_struct(input [7:0] i, input [2:0] s, output y);

endmodule

module mux8_1_dataflow(input [7:0] i, input [2:0] s, output y);

endmodule

module mux8_1_behavioral(input [7:0] i, input [2:0] s, output y);

endmodule

