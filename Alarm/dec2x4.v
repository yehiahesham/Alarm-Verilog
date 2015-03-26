`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:47:39 05/05/2014 
// Design Name: 
// Module Name:    dec2x4 
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
2'b 00 : Out = 4'b0001;
2'b 01 : Out = 4'b0010;
2'b 10 : Out = 4'b0100;
2'b 11 : Out = 4'b1000;
endcase
endmodule
