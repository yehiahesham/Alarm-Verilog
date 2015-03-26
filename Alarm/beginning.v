`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:41 05/04/2014 
// Design Name: 
// Module Name:    beginning 
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
module beginning(
    input Clk,
    input x1,
    input x2,
	// input x3,
    input reset,
    output Led,
	 output [6:0] s,
	 output  [3:0]temp_manipulator
    );
	 
reg  state, nextState; 
wire B1, B2;
// States Encoding 
parameter state_A= 1'b0, state_B= 1'b1;

wire Clk2,Clk3;
wire y_1,y_2;
//___________________ getting the desired clk
clk_divider i(Clk,Clk2);
clk_divider2 i2(Clk,Clk3);
//___________________ capturing the right data from the buttons
Debouncing  one(x1,Clk,reset,y_1),
				ne (x2,Clk,reset,y_2);
				//two(x3,Clk2,reset,y_3);
				
Rising_Edge_Detector  As(y_1,Clk,reset,B1),
							 Bs(y_2,Clk,reset,B2);
							// Cs(y_3,Clk2,reset,B3);
//_____________________ Next state generation 
always @ (B1 or B2  or state) 
 begin 
	 case (state) 
	 state_A: if (B1==1 & B2==1) nextState = state_B;
			else nextState = state_A; 
	 state_B : if (B2==1 )  nextState = state_A;
			else nextState = state_B; 
	 endcase
 end
 //________________________ Update state FF's with the triggering edge of the clock 
always @ (posedge Clk2 or negedge reset) 
begin 
	if(!reset) 
		state = state_A; 
	else 
		state = nextState; 
end 
//_______________________________ first output
assign Led = (state == state_B);

//________________________________ the 7-segment manipulation 

//Clock 			Adel(Clk2,reset,);
//_____________________ displaying all 7-segment data 
ring_counter 	manipulator(Clk2,reset,temp_manipulator);
//______________________________ displying the finial output
de_7seg 			is(4'b0001,s);

	 endmodule
