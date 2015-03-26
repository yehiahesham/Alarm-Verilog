`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:38:59 05/05/2014 
// Design Name: 
// Module Name:    dec 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module de_7seg(
    input [3:0] In,
    output reg [6:0] out
    );
always @ (In)
	 case (In)
			4'b0000: out=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out=7'b1001111; //1
			4'b0010: out=7'b0010010;
			4'b0011: out=7'b0000110; 
			4'b0100: out=7'b1001100; 
			4'b0101: out=7'b0100100;
			4'b0110: out=7'b0100000;  
			4'b0111: out=7'b0001111; 
			4'b1000: out=7'b0000000; 
			4'b1001: out=7'b0000100; 
			4'b1010: out=7'b0001001; //10
			4'b1011: out=7'b1100000; //11
			4'b1100: out=7'b0110001; 
			4'b1101: out=7'b1000010; 
			4'b1110: out=7'b0110000; //14
			4'b1111: out=7'b0111000; //15
		endcase

endmodule
