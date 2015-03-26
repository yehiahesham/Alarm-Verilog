`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:20 05/05/2014
// Design Name:   UpCounter_SyncReset
// Module Name:   C:/Users/yehia/Desktop/Project Alarm/Alarm/upcounter_simu.v
// Project Name:  Alarm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UpCounter_SyncReset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module upcounter_simu;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [1:0] Q;

	// Instantiate the Unit Under Test (UUT)
	UpCounter_SyncReset uut (
		.clk(clk), 
		.rst(rst), 
		.Q(Q)
	);
always #50 clk= !clk; 
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;                               
		// Wait 100 ns for global reset to finish
		#100;
        
		rst = 1;
		
	end
      
endmodule