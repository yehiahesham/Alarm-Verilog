`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:20:23 05/05/2014 
// Design Name: 
// Module Name:    Half_adder_2bit 
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
module Half_adder_2bit(
    );

odule full_adder_3bit(
    input [2:0] A,
    input [2:0] B,
    input Cin,
   output [2:0] Sum, 
	output Cout
    );
	 
wire temp1, temp2;
full_adder_1bit 	One(A[0],B[0],Cin,Sum[0],temp1),
						two(A[1],B[1],temp1,Sum[1],temp2),
						three(A[2],B[2],temp2,Sum[2],Cout);


endmodule
