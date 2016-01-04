`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:58:55 04/09/2014
// Design Name:   ClockDivider
// Module Name:   I:/EX9/EX_9_4/clk2simu.v
// Project Name:  EX_9_4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ClockDivider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk2simu;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	ClockDivider uut (
		.clk(clk), 
		.out(out), 
		.rst(rst)
	);
always #5 clk=!clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst=1;
		// Add stimulus here

	end
      
endmodule

