`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:43 10/26/2022 
// Design Name: 
// Module Name:    PC_combinational_unit 
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
module PC_combinational_unit(input B1, input B2, input B3, input C, input L, input E, output [1:0] sel);

wire S1$, S2$, B1$, B2$, B3$, C$, E$, L$, B1$B2$B3$, B1$B2$B3, B1B2$B3C, B1B2B3$C$, B1$B2B3$E$L, B1$B2B3EL$, B1B2$B3$E$;

not g13(B1$, B1);
not g14(B2$, B2);
not g15(B3$, B3);
not g16(C$, C);
not g17(E$, E);
not g18(L$, L);

and g1(B1$B2$B3$, B1$, B2$, B3$);
and g2(B1$B2$B3, B1$, B2$, B3);
and g3(B1B2$B3C, B1, B2$, B3, C);
and g4(B1B2B3$C$, B1, B2, B3$, C$);
or g5(S1$, B1$B2$B3$, B1$B2$B3, B1B2$B3C, B1B2B3$C$);
not g6(sel[1], S1$);


and g7(B1$B2$B3, B1$, B2$, B3);
and g8(B1$B2B3$E$L, B1$, B2, B3$, E$, L);
and g9(B1$B2B3EL$, B1$, B2, B3, E, L$);
and g10(B1B2$B3$E$, B1, B2$, B3$, E$);
or g11(S2$, B1$B2$B3, B1$B2B3$E$L, B1$B2B3EL$, B1B2$B3$E$);
not g12(sel[0], S2$);

endmodule