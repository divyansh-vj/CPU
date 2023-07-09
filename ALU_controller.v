`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:59:16 11/02/2022 
// Design Name: 
// Module Name:    ALU_controller 
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
module ALU_controller(input [5:0] fn_code, input[2:0] x_ALU, output reg[3:0] control);//, input clk);

always @(fn_code or x_ALU)//posedge clk)
	begin
		casex(x_ALU)
			3'b000 : control <= 4'b0111;
			3'b001 : 
				begin
					casex(fn_code)
						6'd1: control <= 4'b0001;
						6'd2: control <= 4'b0010;
						6'd3: control <= 4'b0011;
						6'd4: control <= 4'b0100;
						6'd5: control <= 4'b0000;
						6'd6: control <= 4'b1110;
						6'd7: control <= 4'b1101;
						6'd8: control <= 4'b0110;
						6'd9: control <= 4'b0101;
						6'd10: control <= 4'b1111;
						6'd11: control <= 4'b0111;
						default : control <= 4'bxxxx;
					endcase
				end
			3'b010 : control <= 4'b0001;
			3'b011 : control <= 4'b0010;
			default : control <= 4'bxxxx;
		endcase
	end
endmodule