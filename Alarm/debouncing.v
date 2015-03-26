`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:15 05/04/2014 
// Design Name: 
// Module Name:    debouncing 
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
module Debouncing(
    input In,
    input clk,
	 input rst,
    output X
    );
	 
	 wire temp1,temp2,temp3;
D_flipflop ONE(In,clk,rst,temp1),
			  TWO(temp1,clk,rst,temp2),
			  Three(temp2,clk,rst,temp3);
assign X= temp1 && temp2 && temp3 ;

endmodule
