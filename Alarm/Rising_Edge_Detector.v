`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:26 05/04/2014 
// Design Name: 
// Module Name:    Rising_Edge_Detector 
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
module Rising_Edge_Detector(
input LEVEL,
input clk,
input rst,
output Z
    );
reg [1:0] state, nextState; 

// States Encoding 
parameter ONE=2'b00, ZERO=2'b01, EDGE=2'b10, X = 2'b11 ; 
 
// Next state generation 
always @ (LEVEL or state)  begin
 case (state) 
 ONE: if (LEVEL) nextState = ONE; 
	else nextState = ZERO; 
 ZERO: if (LEVEL) nextState = EDGE; 
	else nextState = ZERO; 
 EDGE: if (LEVEL) nextState = ONE; 
	else nextState = ZERO;
 default:
	nextState = X;
 endcase
 end
// Update state FF's with the triggering edge of the clock 
always @ (posedge clk or negedge rst) begin 
 if(!rst) state <= ZERO; 
 else state <= nextState; 
end 
 
// output generation 
assign Z = (state == EDGE); 
endmodule 
