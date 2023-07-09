`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:13 10/26/2022 
// Design Name: 
// Module Name:    adder_1bit 
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
module adder_1bit(input in1, input in2, input cin, output out, output P, output G);
	xor g1(P,in1,in2);
	and g2(G,in1,in2);
	xor g3(out,P,cin);
endmodule