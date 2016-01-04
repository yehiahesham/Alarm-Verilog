`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:18 04/09/2014
// Design Name:   digital_loc
// Module Name:   I:/EX9/EX_9_4/simu.v
// Project Name:  EX_9_4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: digital_loc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simu;

	// Inputs
	reg key_a;
	reg key_b;
	reg key_c;
	reg key_d;
	reg reset;
	reg clk;

	// Outputs
	wire clk2;
	wire [6:0] postion_state;
	wire [3:0] x;

	// Instantiate the Unit Under Test (UUT)
	digital_loc uut (
		.key_a(key_a), 
		.key_b(key_b), 
		.key_c(key_c), 
		.key_d(key_d), 
		.reset(reset), 
		.clk(clk), 
		.clk2(clk2), 
		.postion_state(postion_state), 
		.x(x)
	);

	always #5 clk=!clk;
	initial begin
		// Initialize Inputs
		key_a = 0;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      key_a = 1;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#10;
		key_a = 0;
		key_b = 0;
		key_c = 1;
		key_d = 0;
		#10;
		key_a = 1;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#10;
		key_a = 0;
		key_b = 1;
		key_c = 0;
		key_d = 0;
		#10;
		key_a = 0;
		key_b = 0;
		key_c = 1;
		key_d = 0;
		#10;
		key_a = 0;
		key_b = 0;
		key_c = 0;
		key_d = 1;
		#10;
		// Add stimulus here

	end
      
endmodule

