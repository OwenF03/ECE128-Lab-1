`timescale 1ns / 1ps

//8 - 1 multiplexor using structural modeling
module mux8_1_struct(input [7:0] i, input [2:0] s, output y);
    
    wire [7:0] ao;
	wire [2:0] sn;
	
	not(sn[0], s[0]);
	not(sn[1], s[1]);
	not(sn[2], s[2]);
	
	and(ao[0], i[0], sn[2], sn[1], sn[0]);
	and(ao[1], i[1], sn[2], sn[1], s[0]);
	and(ao[2], i[2], sn[2], s[1], sn[0]);
	and(ao[3], i[3], sn[2], s[1], s[0]);
	and(ao[4], i[4], s[2], sn[1], sn[0]);
	and(ao[5], i[5], s[2], sn[1], s[0]);
	and(ao[6], i[6], s[2], s[1], sn[0]);
	and(ao[7], i[7], s[2], s[1], s[0]); 
	
	or(y, ao[7], ao[6], ao[5], ao[4], ao[3], ao[2], ao[1], ao[0]); 
endmodule

//8 - 1 multiplexor using behavioral modeling
module mux8_1_behavioral(input [7:0] i, input [2:0] s, output reg y);
    
    always @(*) begin
		y <= i[s]; 
    end

endmodule

//8 - 1 multiplexor using dataflow modeling
module mux8_1_dataflow(input [7:0] i, input [2:0] s, output y);
    
   assign y = (~s[2] & ~s[1] & ~s[0]) ? i[0] :
             (~s[2] & ~s[1]& s[0]) ? i[1] : 
             (~s[2] & s[1] & ~s[0]) ? i[2] :
             (~s[2] & s[1] & s[0]) ? i[3] :
		     (s[2] & ~s[1] & ~s[0]) ? i[4] :
		     (s[2] & ~s[1] & s[0]) ? i[5] :
		     (s[2] & s[1] & ~s[0]) ? i[6] :
		     (s[2] & s[1] & s[0]) ? i[7] : 0;
		    
endmodule

// Module to test different multiplexor designs 
// Standard mux inputs
// @param des controls the design being used for the mux
module Multiplexor(input [7:0] i, input [2:0] s, output y, input [1:0] des);
    wire y_s, y_b, y_d; 
    mux8_1_struct       a(i, s, y_s);
    mux8_1_behavioral   b(i, s, y_b);
    mux8_1_dataflow     c(i, s, y_d);
    assign y = (des == 0) ? y_s :
               (des == 1) ? y_b :
               (des == 2) ? y_d :
               0;
    
endmodule


