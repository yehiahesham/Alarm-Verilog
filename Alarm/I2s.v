`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:18 05/16/2014 
// Design Name: 
// Module Name:    I2s 
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
module I2s(
	 input CLK,
	 input reset,
	 output S_CLK,
	 output LR_CLK,
	 output M_CLK,
	 output reg Sin
    );
	 
wire [15:0] data= 16'b1101101101101110;
wire clk1,clk2,clk3;

clk1  five_hundred_500KHz	 (CLK,reset,clk1);
clk2  four_4KHz			 	 (CLK,reset,clk2);
clk3 thirty_two_times_128KHz(CLK,reset,clk3);

assign M_CLK = clk1;
assign LR_CLK = clk2;
assign S_CLK = clk3;
integer i=0;
always @(posedge clk3 or negedge reset)
begin 
	if (!reset)
		i <=0;
	else
		begin
		Sin<=data[i];
		i <= i+1;
		end
end
endmodule
