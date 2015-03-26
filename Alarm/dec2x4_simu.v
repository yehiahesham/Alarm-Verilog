`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:24:27 05/05/2014
// Design Name:   dec2x4
// Module Name:   C:/Users/yehia/Desktop/Project Alarm/Alarm/dec2x4_simu.v
// Project Name:  Alarm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dec2x4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dec2x4_simu;

	// Inputs
	reg [1:0] In;

	// Outputs
	wire [3:0] Out;

	// Instantiate the Unit Under Test (UUT)
	dec2x4 uut (
		.In(In), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		In = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		In = 0;
		#50
		In = 1;
		#50
		In = 2;
		#50
		In = 3;
		

	end
      
endmodule

