`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:52 05/09/2014 
// Design Name: 
// Module Name:    aasd 
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
module dec2x4(
    input [1:0] In,
    output reg [3:0] Out
    );
always @(In)
case (In)
2'b 00 : Out = 4'b1110;
2'b 01 : Out = 4'b1101;
2'b 10 : Out = 4'b1011;
2'b 11 : Out = 4'b0111;
endcase
endmodule