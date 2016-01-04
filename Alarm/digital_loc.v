`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:50:05 04/08/2014 
// Design Name: 
// Module Name:    digital_loc 
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
module digital_loc(
    input key_a,
    input key_b,
    input key_c,
    input key_d,
    input reset,
	 input clk,	 
    output [6:0] postion_state,
	 output  [3:0] x,
	 output reg [1:0] Led2,
	 output  [3:0] selector,
	 output reg dot,
	 output S_CLK,
	 output LR_CLK,
	 output M_CLK,
	 output  Sin
    );
	  wire clk2;
	 reg [3:0] min2; reg[3:0] min1; reg[2:0] H1; reg [3:0] H2;
	 reg [3:0] A_min2; reg [3:0] A_min1; reg [1:0] A_H1; reg [3:0] A_H2;
	 reg [5:0] sec;
	 ClockDivider twohundredHZ(clk, clk2, reset);
	 wire tempa, tempb, tempc, tempd;
	 Debouncing a(key_a,clk2,reset,tempa),
					b(key_b,clk2,reset,tempb),
					c(key_c,clk2,reset,tempc),
					d(key_d,clk2,reset,tempd);				
	 
	 wire tempAA,tempBB,tempCC,tempDD;
	 
	Rising_Edge_Detector		AA(tempa,clk2,reset,tempAA),
									BB(tempb,clk2,reset,tempBB),
									CC(tempc,clk2,reset,tempCC),
									DD(tempd,clk2,reset,tempDD);

//________________________________________________________________	 
reg [3:0]control_code;
integer interal_counter=0;
reg alarm_sound; 
initial min2=4'b0000; 
initial min1=4'b0000;
initial H1=4'b0000;
initial H2=4'b0000;
initial Led2=2'b00;
initial dot=0;
initial sec=6'b000000;
reg [20:0] old_value;
reg condition_alarm;

//_______________________________________________________________
 reg [3:0] state, nextState; 
// States Encoding 
parameter state_Clock=4'b0001        ,state_Adjust_min2= 4'b0010;
parameter state_Adjust_min1= 4'b0011 ,state_Adjust_H2= 4'b0100;
parameter state_Adjust_H1= 4'b0101   ,state_Adjust_Amin2= 4'b0110;
parameter state_Adjust_Amin1= 4'b0111,state_Adjust_AH2= 4'b1000;
parameter state_Adjust_AH1= 4'b1001  ,state_Pause=4'b1010;
parameter state_Stop_A= 4'b1011      , state_Adjust_X=4'b1111;
assign x = state;
// Next state generation 
always @ (tempAA or tempBB   or state ) 
if(!tempAA && !tempBB   )
	nextState=state;
else
 case (state)
	state_Clock: begin condition_alarm<=0; if(tempAA) nextState = state_Adjust_min2;
	else if(tempBB) nextState =state_Pause;
	else  nextState = state_Clock; end
	
	state_Pause: begin condition_alarm<=0; if(tempBB) nextState=state_Clock;
	else nextState=state_Pause; end
	
	state_Adjust_min2: begin condition_alarm<=0; if(tempAA) nextState= state_Adjust_min1;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_min1: begin condition_alarm<=0; if(tempAA) nextState= state_Adjust_H2;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_H2: begin condition_alarm<=0; if(tempAA) nextState= state_Adjust_H1;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_H1: begin condition_alarm<=0; if(tempAA) nextState= state_Adjust_Amin2;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_Amin2: begin condition_alarm<=1; if(tempAA) nextState= state_Adjust_Amin1;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_Amin1: begin condition_alarm<=1; if(tempAA) nextState= state_Adjust_AH2;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_AH2:begin condition_alarm<=1; if(tempAA) nextState= state_Adjust_AH1;
	else if(tempBB) nextState= state_Clock; end
	
	state_Adjust_AH1:begin condition_alarm<=1; if(tempAA) nextState= state_Adjust_min2;
	else if(tempBB) nextState= state_Clock; end
	
	
 default: nextState = state_Adjust_X;
 endcase
 
 // Update state FF's with the triggering edge of the clock 
always @ (posedge clk2 or negedge reset) 
begin 
	if(!reset) 
		state <= state_Clock; 
	else 
		state <= nextState; 
end 

//___________________________________________________________________________________
always @(posedge clk2 or negedge reset)//u or tempCC or tempDD )
	if(!reset )
			begin
				min2<=0;
				min1<=0;
				H1 <=0;
				H2 <=0;
				sec<=0;
				A_min2<=0;
				A_min1<=4'b0000;
				A_H1 <=0;
				A_H2 <=0;
				Led2<=2'b00;
				alarm_sound<=0;
			end
else begin 
if(interal_counter<199)
					interal_counter<=interal_counter+1;
else begin
							interal_counter<=0;
							dot<=!dot;
if(state == state_Pause) begin min2<=min2; min1<=min1; H1<=H1; H2<=H2; dot<=0; end  //Pause
else if(Led2==2'b11)
							begin
							Led2<=2'b00; alarm_sound<=0; sec<=old_value[5:0];
							min2<=old_value[9:6]; min1<= old_value[13:10]; H2<= old_value[17:14]; H1<= old_value[20:18];
							old_value <=21'b000000000000000000000;
							end
/*else if(min2 == 4'b1010)
							begin
							sec<=old_value[5:0];
							min2<=old_value[9:6]; min1<= old_value[13:10]; H2<= old_value[17:14]; H1<= old_value[20:18];
							old_value <=21'b000000000000000000000;
							end */

else begin
					sec <= sec+1'b1;
							if(sec == 6'b111100)
								begin sec <= 6'b000000;  min2<=min2+1'b1; end
							if(min2==4'b1001)
								begin min2<=4'b0000; min1<=min1+1'b1; end
							if( (min1==4'b0101) && (min2==4'b1001) )
								begin min1<=4'b0000; H2<=H2+1'b1; end
							if( (H2==4'b1001) && (min1==4'b0101) && (min2==4'b1001) )
								begin H2<=4'b0000; H1<=H1+1'b1; end
							if( (H1==3'b010) && (H2==4'b0011) && (min1==4'b0101) && (min2==4'b1001) )
								begin H1<=3'b000; H2<=4'b0000; end
							if( (H1==A_H1) && (H2==A_H2) && (min1==A_min1) && (min2==A_min2) && (sec==6'b000000))
								begin 
								Led2<=2'b11; alarm_sound<=1;
								old_value <={H1,H2,min1,min2,(sec+1'b1)};
								min2<= 4'b1111; min1<= 4'b1111; H2<= 4'b1111; H1<= 3'b111;
								end
							/*if(condition_alarm == 1 )
								begin 
								old_value <={H1,H2,min1,min2,(sec+1'b1)};
								//min2<= 4'b1010; min1<= 4'b1010; H2<= 4'b1010; H1<= 3'b011;
								end*/
		end
		end

if((state != state_Clock) && (state != state_Pause))
		begin
		dot<=0;
		begin min2<=min2; min1<=min1; H1<=H1; H2<=H2; end 
		 if((tempCC==1) && (state == state_Adjust_min2))   
			if(min2==4'b1001)
					min2 <= 4'b0000;
			else	min2<=min2+1'b1; 
			//______________
	else if((tempCC==1) && (state == state_Adjust_min1))
			if(min1==4'b0101)
					min1 <= 4'b0000;
			else	min1<=min1+1'b1; 
			//____________
	else if((tempCC==1) && (state == state_Adjust_H2))
			if( H2==4'b1001)
					H2<=4'b0000;
			else
					H2<=H2+1'b1; 
			//_____________
	else if((tempCC==1) && (state == state_Adjust_H1))
			if(H1==3'b010)
				H1<=3'b000;
			else	H1<=H1+1'b1;
			////\\\\\\		
	else if((tempCC==1) && (state == state_Adjust_Amin2))   
			begin
			if(A_min2==4'b1001)
					A_min2 <= 4'b0000;
			else	A_min2<= A_min2+1'b1; 
			end
			//______________
	else if((tempCC==1) && (state == state_Adjust_Amin1))
			begin
			if(A_min1==4'b0101)
					A_min1 <= 4'b0000;
			else	A_min1<=A_min1+1'b1; 
			end
			//____________
	else if((tempCC==1) && (state == state_Adjust_AH2))
			begin
			if( A_H2==4'b1001)
					A_H2<=4'b0000;
			else
					A_H2<=A_H2+1'b1; 
			end
			//_____________
	else if((tempCC==1) && (state == state_Adjust_AH1))
			begin
			if(A_H1==2'b10)
				A_H1<=2'b00;
			else	A_H1<=A_H1+1'b1;
			end
//*******************
if((tempDD==1) && (state == state_Adjust_min2))  
			if( min2==0)
					min2<= 4'b1001;
			else
					min2<=min2-1'b1;
			//______________
	else if((tempDD==1) && (state == state_Adjust_min1))
			
			if(min1==0)
				min1 <= 4'b0101;
			else
				min1<=min1-1'b1; 	 
			//____________
	else if((tempDD==1) && (state == state_Adjust_H2))
			if( H2==0)
				H2<=4'b1001;
			else
				H2<=H2-1'b1; 
			//_____________
	else if((tempDD==1) && (state == state_Adjust_H1))
			if (H1==0)
				H1 <= 3'b010;
			else
				H1 <= H1-1'b1;
		/////\\\\\\
	else if((tempDD==1) && (state == state_Adjust_Amin2))  
			begin
			if( A_min2==0)
					A_min2<= 4'b1001;
			else
					A_min2<=A_min2-1'b1;
			end
			//______________
	else if((tempDD==1) && (state == state_Adjust_Amin1))
			begin
			if(A_min1==0)
				A_min1 <= 4'b0101;
			else
				A_min1<=A_min1-1'b1; 
			end
			//____________
	else if((tempDD==1) && (state == state_Adjust_AH2))
			begin
			if( A_H2==0)
				A_H2<=4'b1001;
			else
				A_H2<=A_H2-1'b1; 
			end
			//_____________
	else if((tempDD==1) && (state == state_Adjust_AH1))
			begin
			if (A_H1==0)
				A_H1 <= 2'b10;
			else
				A_H1 <= A_H1-1'b1;
			end
end
end 
I2s sound(clk,alarm_sound,S_CLK,LR_CLK,M_CLK,Sin);
dec print_satus(sec,min2,min1,H2,H1,condition_alarm,A_min2, A_min1, A_H2,A_H1,clk2,reset, postion_state,selector);
endmodule 