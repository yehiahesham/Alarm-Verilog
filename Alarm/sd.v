`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:55 05/09/2014 
// Design Name: 
// Module Name:    sd 
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
module UpCounter_SyncReset(clk, rst, Q); 
input clk, rst; 
output reg [1:0] Q; 

 
always @ (posedge clk) begin 
	if(!rst)
		Q<=2'b00; //Synchronous reset - Active Low 
	else begin 
		if(Q == 2'b11) 
			Q<=2'b00; 
		else
			Q<=Q+1'b1; 
			end 
end 
endmodule