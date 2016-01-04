`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:11 05/15/2014 
// Design Name: 
// Module Name:    ClockDivider2 
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
module ClockDivider2( clk, out, rst);
	input clk,rst;
	output reg out;
	integer i;	
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			i <= 0;//25'b0000000000000000000000000;
			out <= 1'b0;
		end
		else begin
				if(i<24999999)//2*200*i<50000000
					i <= i+1;
				else begin
					out <= !out;
					i <= 0;//25'b0000000000000000000000000;
				end
			end
	end
endmodule

