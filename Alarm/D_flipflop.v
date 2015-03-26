`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:08 05/04/2014 
// Design Name: 
// Module Name:    D_flipflop 
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

module D_flipflop(
    input D,
    input clk,
    input reset,
	 output reg Q
    );

always @ (posedge clk or negedge reset)
if (!reset)
Q <= 1'b0;
else
Q <= D;

endmodule
