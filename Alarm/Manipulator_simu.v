`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:31:10 05/05/2014
// Design Name:   ring_counter
// Module Name:   C:/Users/yehia/Desktop/Project Alarm/Alarm/manipulator_simu.v
// Project Name:  Alarm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ring_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module manipulator_simu;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] selector;

	// Instantiate the Unit Under Test (UUT)
	ring_counter uut (
		.clk(clk), 
		.reset(reset), 
		.selector(selector)
	);
always #50 clk= !clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset =1;
        
		// Add stimulus here

	end
      
endmodule

