`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:08 05/08/2014 
// Design Name: 
// Module Name:    keep_data_or_not 
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
module keep_data_or_not(
input LEVEL,
input clk,
input rst,
output reg Z
    );
reg [1:0] state, nextState; 

// States Encoding 
parameter ONE=2'b00, two=2'b01, three=2'b10, four = 2'b11 ; 
 
// Next state generation 
always @ (LEVEL or state)  begin
 case (state) 
 ONE: if (LEVEL) begin nextState = two; Z<=0; end 
	else begin nextState = ONE; Z<=0; end
 two: if (LEVEL) begin nextState = two; Z<=0; end 
	else begin nextState = three ; Z<=1; end
 three :if (LEVEL) begin nextState = four ; Z<=1; end 
	else begin nextState = three; Z<=1; end
 four :if (LEVEL) begin nextState = four ; Z<=1; end 
	else begin nextState = ONE ; Z<=0; end
 endcase
 end
// Update state FF's with the triggering edge of the clock 
always @ (posedge clk or negedge rst) begin 
 if(!rst) state <= ONE; 
 else state <= nextState; 
end  
endmodule 