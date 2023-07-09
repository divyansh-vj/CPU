`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:53 10/26/2022 
// Design Name: 
// Module Name:    adder_32bit 
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
module adder_32bit(input [31:0] in1, input [31:0] in2, input c_in, output [31:0] sum, output c_out);
wire[1:0] P, G;
wire[2:0] C;
wire p0c0, p1p0c0, p1g0;
assign C[0] = c_in;

adder_16bit CLA1(.in1(in1[15:0]), .in2(in2[15:0]), .c_in(C[0]), .sum(sum[15:0]), .P$$(P[0]), .G$$(G[0]));
adder_16bit CLA2(.in1(in1[31:16]), .in2(in2[31:16]), .c_in(C[1]), .sum(sum[31:16]), .P$$(P[1]), .G$$(G[1]));

and g1(p0c0, P[0], C[0]);
or g2(C[1], p0c0, G[0]);

and g3(p1p0c0, P[1], P[0], C[0]);
and g4(p1g0, P[1], G[0]);
or g5(C[2], p1p0c0, p1g0, G[1]);

assign c_out = C[2];


endmodule