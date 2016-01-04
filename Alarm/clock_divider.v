`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:50 04/09/2014 
// Design Name: 
// Module Name:    clock_divider 
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

module ClockDivider( clk, out, rst);
	input clk,rst;
	output reg out;
	integer i;	
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			i <= 0;//25'b0000000000000000000000000;
			out <= 1'b0;
		end
		else begin
				if(i<124999)//2*200*i<50000000
					i <= i+1;
				else begin
					out <= !out;
					i <= 0;//25'b0000000000000000000000000;
				end
			end
	end
endmodule




/*module clock_divider(
	input clk,
	output reg clk2,
	input reset 
    );
	reg  [25:0] counter;

always @(posedge clk)
begin 
	if(reset==1)
		counter=0;
	else
	counter = counter+1;
			if(counter == 125000)//50x10^6/200=250x10^3/2=125x10^3
				begin
					clk2=~clk2;
					 counter=0;
				end

end

endmodule
*/