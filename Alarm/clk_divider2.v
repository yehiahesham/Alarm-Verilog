`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:34 05/05/2014 
// Design Name: 
// Module Name:    clk_divider2 
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
module clk_divider2( input Clk, output reg Clk2);
integer counter ;
always @(posedge Clk )
begin
if(counter < 25000000)
	counter <= counter+1;
else begin
		Clk2= ~ Clk2;
		counter <=0;
		end
end

endmodule