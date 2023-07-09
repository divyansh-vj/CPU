`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:29 10/26/2022 
// Design Name: 
// Module Name:    adder_16bit 
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

module adder_16bit(input[15:0] in1, input[15:0] in2, input c_in, output[15:0] sum, output P$$, output G$$);
wire[3:0] C, P, G;
wire p0c0, p1p0c0, p1g0, p2p1p0c0, p2p1g0, p2g1, p3p2p1g0, p3p2g1, p3g2;
assign C[0] = c_in;

adder_4bit CLA1(.in1(in1[3:0]), .in2(in2[3:0]), .c_in(C[0]), .out(sum[3:0]), .P$(P[0]), .G$(G[0]));
adder_4bit CLA2(.in1(in1[7:4]), .in2(in2[7:4]), .c_in(C[1]), .out(sum[7:4]), .P$(P[1]), .G$(G[1]));
adder_4bit CLA3(.in1(in1[11:8]), .in2(in2[11:8]), .c_in(C[2]), .out(sum[11:8]), .P$(P[2]), .G$(G[2]));
adder_4bit CLA4(.in1(in1[15:12]), .in2(in2[15:12]), .c_in(C[3]), .out(sum[15:12]), .P$(P[3]), .G$(G[3]));


and g1(p0c0, P[0], C[0]);
or g2(C[1], p0c0, G[0]);

and g3(p1p0c0, P[1], P[0], C[0]);
and g4(p1g0, P[1], G[0]);
or g5(C[2], p1p0c0, p1g0, G[1]);

and g6(p2p1p0c0, P[2], P[1], P[0], C[0]);
and g7(p2p1g0, P[2], P[1], G[0]);
and g8(p2g1, P[2], G[1]);
or g9(C[3], p2p1p0c0, p2p1g0, p2g1, G[2]);

and g11(p3p2p1g0, P[3], P[2], P[1], G[0]);
and g12(p3p2g1, P[3], P[2], G[1]);
and g13(p3g2, P[3], G[2]);

and g15(P$$, P[3], P[2], P[1], P[0]);
or g16(G$$, p3p2p1g0, p3p2g1, p3g2, G[3]);

endmodule