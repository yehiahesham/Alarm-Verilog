`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:34 05/16/2014 
// Design Name: 
// Module Name:    clk1 
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
module clk1 ( 
	input clk,
	input rst,
	output reg out);
	
	integer i;	
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			i <= 0;//25'b0000000000000000000000000;
			out <= 1'b0;
		end
		else begin
				if(i<5)
					i <= i+1;
				else begin
					out <= !out;
					i <= 0;//25'b0000000000000000000000000;
				end
			end
	end
endmodule

