`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:19:21 11/08/2022
// Design Name:   RISCy_CPU
// Module Name:   /home/shashwat/Documents/COA LAB/CPU_grp21/RISCy_test.v
// Project Name:  CPU_grp21
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RISCy_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RISCy_test;

	// Inputs
	reg clk;
	reg rst;
	wire [31:0] display_reg;

	// Instantiate the Unit Under Test (UUT)
	RISCy_CPU uut (
		.clk(clk), 
		.rst(rst),
		.display_reg(display_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 1;
		#15
		rst = 0;
		// Add stimulus here

	end
	always #1 clk=~clk;
      
endmodule

