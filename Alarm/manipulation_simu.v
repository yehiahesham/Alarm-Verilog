`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:36:07 05/05/2014
// Design Name:   ring_counter
// Module Name:   C:/Users/yehia/Desktop/Project Alarm/Alarm/manipulation_simu.v
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

module manipulation_simu;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] selector;

	// Instantiate the Unit Under Test (UUT)
	ring_counter uut (
		.clk(clk), 
		.selector(selector)
	);

		always #50 clk= !clk;
	initial begin
		// Initialize Inputs
		#100;
		clk = 1;

	
        
		
	end
      
endmodule

