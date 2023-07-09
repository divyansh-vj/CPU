`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:11 10/26/2022 
// Design Name: 
// Module Name:    adder_4bit 
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
module adder_4bit(input[3:0] in1, input[3:0] in2, input c_in, output[3:0] out, output P$, output G$);
wire[3:0] G;
wire[3:0] P;
wire[3:0] C;
wire p0c0, p1p0c0, p1g0, p2p1p0c0, p2p1g0, p2g1, p3p2p1g0, p3p2g1, p3g2;
assign C[0] = c_in;


adder_1bit a1(.in1(in1[0]), .in2(in2[0]), .cin(C[0]), .out(out[0]), .P(P[0]), .G(G[0]));
and g1(p0c0, P[0], C[0]);
or g2(C[1], p0c0, G[0]);

adder_1bit a2(.in1(in1[1]), .in2(in2[1]), .cin(C[1]), .out(out[1]), .P(P[1]), .G(G[1]));
and g3(p1p0c0, P[1], P[0], C[0]);
and g4(p1g0, P[1], G[0]);
or g5(C[2], p1p0c0, p1g0, G[1]);

adder_1bit a3(.in1(in1[2]), .in2(in2[2]), .cin(C[2]), .out(out[2]), .P(P[2]), .G(G[2]));
and g6(p2p1p0c0, P[2], P[1], P[0], C[0]);
and g7(p2p1g0, P[2], P[1], G[0]);
and g8(p2g1, P[2], G[1]);
or g9(C[3], p2p1p0c0, p2p1g0, p2g1, G[2]);

adder_1bit a4(.in1(in1[3]), .in2(in2[3]), .cin(C[3]), .out(out[3]), .P(P[3]), .G(G[3]));

and g10(p3p2p1g0, P[3], P[2], P[1], G[0]);
and g11(p3p2g1, P[3], P[2], G[1]);
and g12(p3g2, P[3], G[2]);
and g13(P$, P[3], P[2], P[1], P[0]);
or g14(G$, p3p2p1g0, p3p2g1, p3g2, G[3]);

endmodule