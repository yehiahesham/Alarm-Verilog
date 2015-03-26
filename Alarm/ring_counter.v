`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:40:41 05/05/2014 
// Design Name: 
// Module Name:    ring_counter 
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
module ring_counter(
input clk,
input reset,
output  [3:0] selector 
    );
wire [1:0] counter_out;
UpCounter_SyncReset two_bit_counter(clk,reset,counter_out);
dec2x4 rotating (counter_out,selector);
endmodule
