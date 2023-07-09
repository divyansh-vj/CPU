`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:48:58 11/09/2022
// Design Name:   adder_32bit
// Module Name:   /home/shashwat/Documents/COA LAB/CPU_grp21/adder_test.v
// Project Name:  CPU_grp21
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_test;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg c_in;

	// Outputs
	wire [31:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	adder_32bit uut (
		.in1(in1), 
		.in2(in2), 
		.c_in(c_in), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		in1 = -32;
		in2 = -11;
        
		// Add stimulus here

	end
      
endmodule

