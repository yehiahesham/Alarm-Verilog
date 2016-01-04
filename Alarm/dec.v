`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:33 04/08/2014 
// Design Name: 
// Module Name:    Dec 
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
module dec(
	input [5:0] sec,
	input [3:0] min2,
	input [3:0] min1,
	input [3:0] H2,
	input [2:0] H1,
	input condition,
	input [3:0] Amin2,
	input [3:0] Amin1,
	input [3:0] AH2,
	input [1:0] AH1,
	input clk,
	input reset,
	output reg [6:0] out,
	output reg [3:0]selector
	);
	reg [6:0] out_min2;
	reg [6:0] out_min1;
	reg [6:0] out_H2;
	reg [6:0] out_H1;
	reg [6:0] out_Amin2;
	reg [6:0] out_Amin1;
	reg [6:0] out_AH2;
	reg [6:0] out_AH1;
	
	
always @ ( min2 or min1 or H1 or H2 or Amin2 or Amin1 or AH1 or AH2 or sec)
begin
	 case (min2)
			4'b0000: out_min2=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out_min2=7'b1001111; //1
			4'b0010: out_min2=7'b0010010;
			4'b0011: out_min2=7'b0000110; 
			4'b0100: out_min2=7'b1001100; 
			4'b0101: out_min2=7'b0100100;
			4'b0110: out_min2=7'b0100000;  
			4'b0111: out_min2=7'b0001111; 
			4'b1000: out_min2=7'b0000000; 
			4'b1001: out_min2=7'b0000100;
			4'b1010: out_min2=7'b0001000; // A 
			4'b1111: out_min2=7'b1101010; // m 

		endcase
case (min1)
			4'b0000: out_min1=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out_min1=7'b1001111; //1
			4'b0010: out_min1=7'b0010010;
			4'b0011: out_min1=7'b0000110; 
			4'b0100: out_min1=7'b1001100; 
			4'b0101: out_min1=7'b0100100;
			4'b0110: out_min1=7'b0100000;  
			4'b0111: out_min1=7'b0001111; 
			4'b1000: out_min1=7'b0000000; 
			4'b1001: out_min1=7'b0000100;
			4'b1010: out_min1=7'b1110000; //t
			4'b1111: out_min1=7'b0001000; //A

		endcase
		case (H2)
			4'b0000: out_H2=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out_H2=7'b1001111; //1
			4'b0010: out_H2=7'b0010010;
			4'b0011: out_H2=7'b0000110; 
			4'b0100: out_H2=7'b1001100; 
			4'b0101: out_H2=7'b0100100;
			4'b0110: out_H2=7'b0100000;  
			4'b0111: out_H2=7'b0001111; 
			4'b1000: out_H2=7'b0000000; 
			4'b1001: out_H2=7'b0000100; 
			4'b1010: out_H2=7'b0010000; //E
			4'b1111: out_H2=7'b1110001; //L

		endcase
		case (H1)
			3'b000: out_H1=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			3'b001: out_H1=7'b1001111; //1
			3'b010: out_H1=7'b0010010;
			3'b011: out_H1=7'b0100100;		//S
			3'b111: out_H1=7'b0001000;		//A	
		endcase

case (Amin2)
			4'b0000: out_Amin2=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out_Amin2=7'b1001111; //1
			4'b0010: out_Amin2=7'b0010010;
			4'b0011: out_Amin2=7'b0000110; 
			4'b0100: out_Amin2=7'b1001100; 
			4'b0101: out_Amin2=7'b0100100;
			4'b0110: out_Amin2=7'b0100000;  
			4'b0111: out_Amin2=7'b0001111; 
			4'b1000: out_Amin2=7'b0000000; 
			4'b1001: out_Amin2=7'b0000100;

		endcase
case (Amin1)
			4'b0000: out_Amin1=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out_Amin1=7'b1001111; //1
			4'b0010: out_Amin1=7'b0010010;
			4'b0011: out_Amin1=7'b0000110; 
			4'b0100: out_Amin1=7'b1001100; 
			4'b0101: out_Amin1=7'b0100100;
			4'b0110: out_Amin1=7'b0100000;  
			4'b0111: out_Amin1=7'b0001111; 
			4'b1000: out_Amin1=7'b0000000; 
			4'b1001: out_Amin1=7'b0000100;

		endcase
		case (AH2)
			4'b0000: out_AH2=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			4'b0001: out_AH2=7'b1001111; //1
			4'b0010: out_AH2=7'b0010010;
			4'b0011: out_AH2=7'b0000110; 
			4'b0100: out_AH2=7'b1001100; 
			4'b0101: out_AH2=7'b0100100;
			4'b0110: out_AH2=7'b0100000;  
			4'b0111: out_AH2=7'b0001111; 
			4'b1000: out_AH2=7'b0000000; 
			4'b1001: out_AH2=7'b0000100; 


		endcase
		case (AH1)
			2'b00: out_AH1=7'b0000001; //0 //[6/a]......[0/g] // zero is light up and 1 is dark
			2'b01: out_AH1=7'b1001111; //1
			2'b10: out_AH1=7'b0010010;	
		endcase
end
wire [1:0] kk;
UpCounter_SyncReset clock_only(clk,reset,kk);


always @(*)
if(condition==1'b1)
	case(kk) 
	2'b00:begin selector= 4'b1110; out=out_Amin2; end
	2'b01:begin selector= 4'b1101; out=out_Amin1; end
	2'b10:begin selector= 4'b1011; out=out_AH2; end
	2'b11:begin selector= 4'b0111; out=out_AH1; end
	endcase	
else
	case(kk) 
	2'b00:begin selector= 4'b1110; out=out_min2; end
	2'b01:begin selector= 4'b1101; out=out_min1; end
	2'b10:begin selector= 4'b1011; out=out_H2; end
	2'b11:begin selector= 4'b0111; out=out_H1; end
	endcase

endmodule
