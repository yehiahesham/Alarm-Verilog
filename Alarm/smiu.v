`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:56:45 05/19/2014
// Design Name:   digital_loc
// Module Name:   C:/Users/yehia/Desktop/experiment/first try to collect all/smiu.v
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

module smiu;

	// Inputs
	reg key_a;
	reg key_b;
	reg key_c;
	reg key_d;
	reg reset;
	reg clk;
	reg Pause;

	// Outputs
	wire [6:0] postion_state;
	wire [3:0] x;
	wire [1:0] Led2;
	wire [3:0] selector;
	wire dot;
	wire S_CLK;
	wire LR_CLK;
	wire M_CLK;
	wire Sin;
	wire clk2;
	wire clk3;

	// Instantiate the Unit Under Test (UUT)
	digital_loc uut (
		.key_a(key_a), 
		.key_b(key_b), 
		.key_c(key_c), 
		.key_d(key_d), 
		.reset(reset), 
		.clk(clk), 
		.Pause(Pause), 
		.postion_state(postion_state), 
		.x(x), 
		.Led2(Led2), 
		.selector(selector), 
		.dot(dot), 
		.S_CLK(S_CLK), 
		.LR_CLK(LR_CLK), 
		.M_CLK(M_CLK), 
		.Sin(Sin), 
		.clk2(clk2), 
		.clk3(clk3)
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
		Pause=0;

		// Wait 100 ns for global reset to finish
		#100;
      key_a = 1;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#50
		key_a = 1;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#50
		key_a = 1;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#50
		key_a = 1;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#50
		key_a = 0;
		key_b = 0;
		key_c = 1;
		key_d = 0;
		#50
		key_a = 0;
		key_b = 0;
		key_c = 0;
		key_d = 0;
		#50
		key_a = 0;
		key_b = 0;
		key_c = 0;
		key_d = 1;
		#50
		key_a = 0;
		key_b = 0;
		key_c = 0;
		key_d = 0;
				


	end
      
endmodule

