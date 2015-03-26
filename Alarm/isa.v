`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:43 05/04/2014 
// Design Name: 
// Module Name:    isa 
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
module Clock(
	 input clk,
	 input rst,
    input [3:0] M1,
    input [3:0] M2,
	 input [3:0] H1,
	 input [3:0] H2,
	 input [5:0] Sec,
	 output reg [3:0] M1u,//updated
	 output reg [3:0] M2u,
	 output reg [3:0] H1u,
	 output reg [3:0] H2u,
	 output reg [5:0] Secu
    );

always@ (posedge clk)
begin 
	Secu = Sec + 1'b1;
		if( rst | Secu==6'b111100)
			begin
				Secu = 6'b0000;
				M1u = M1 + 1'b1;
			end
//////////////////

		if( rst | M1u==4'b1001)
			begin
				M1u = 4'b0000;
				M2u = M2 + 1'b1;
			end

///////////////////

		if( rst | M2u==4'b0110)
				begin
					M2u = 4'b0000;
					H1u = H1 + 1'b1;
				end
		
///////////////////

		if( rst | H1u==4'b1001)
				begin
					H1u=4'b0000;
					H2u = H2 + 1'b1;
				end
		
///////////////////

		if (H2u==4'b0010 & H1u==4'b0100)
			begin
				H2u=4'b0000;
				H1u=4'b0000;
			end
				

end
endmodule
