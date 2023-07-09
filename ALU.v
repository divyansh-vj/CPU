`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:48:48 11/02/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(input clk, input [31:0] in1, input [31:0] in2_old, input [9:0] shamt, input [3:0] control, output reg[2:0] flag, output reg[31:0] out);

wire [31:0] diff,add, comp, band, bxor, sll, srl, sra, in2;

wire carry;
//always @(control[3])
//	begin
//		if(control[3] == 1) in2 <= $signed(shamt);
//	end
	
assign in2 = ((control[3] == 1) ? $signed(shamt) : in2_old);
	
assign band = in1 & in2;
assign bxor = in1 ^ in2;
assign sll = in1 << in2;
assign srl = in1 >> in2;
assign sra = $signed(in1) >>> in2;
assign comp = ((~in2) + 32'd1);
adder_32bit adder(.in1(in1), .in2(in2), .c_in(1'b0), .sum(add), .c_out(carry));
diff dif(.in(bxor), .out(diff));

// carry, =0, <0
always @(*)
	begin 
		//flag[0] <= 1'b0;
		flag[1] <= 1'b0;
		if (in1 == 32'b0)
			flag[1] <= 1'b1;
		flag[2] <= 0;
		if (in1[31] == 1'b1)
			flag[2] <= 1;
		case(control[2:0])
		   3'b000 : out <= diff;
			3'b001 : out <= add;
					//flag[0] <= carry;
			
			3'b010 : out <= comp;
			3'b011 : out <= band;
			3'b100 : out <= bxor;
			3'b101 : out <= srl;
			3'b110 : out <= sll;
			3'b111 : out <= sra;
		endcase
	end
	
always @(posedge clk)
	begin
		flag[0] = carry;
	end
	
endmodule