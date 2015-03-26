`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:25:00 05/05/2014 
// Design Name: 
// Module Name:    Up_counter_2bit 
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
			Q<=Q+2'b01; 
			end 
end 
endmodule 