`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:04:35 11/02/2022 
// Design Name: 
// Module Name:    CONTROLLER 
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
module CONTROLLER(input [5:0] op_code, output reg [2:0] B_op, output reg [1:0] x_out, output reg x_imm, output reg [2:0] x_ALU, output reg [1:0] write_dest, output reg mem_write, output reg instr_enable);

always @(op_code)
	begin
		casex(op_code)
			6'd0: begin
						B_op <= 3'b111;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b001;
						write_dest <= 2'b01;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd15: begin
						B_op <= 3'b000;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd16: begin
						B_op <= 3'b001;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd17: begin
						B_op <= 3'b010;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd18: begin
						B_op <= 3'b011;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd19: begin
						B_op <= 3'b100;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd20: begin
						B_op <= 3'b000;
						x_out <= 2'b00;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b11;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd21: begin
						B_op <= 3'b101;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd22: begin
						B_op <= 3'b110;
						x_out <= 2'b01;
						x_imm <= 1'b0;
						x_ALU <= 3'b000;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd63: begin
						B_op <= 3'b111;
						x_out <= 2'b01;
						x_imm <= 1'b1;
						x_ALU <= 3'b010;
						write_dest <= 2'b01;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd62: begin
						B_op <= 3'b111;
						x_out <= 2'b01;
						x_imm <= 1'b1;
						x_ALU <= 3'b011;
						write_dest <= 2'b01;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd61: begin
						B_op <= 3'b111;
						x_out <= 2'b10;
						x_imm <= 1'b1;
						x_ALU <= 3'b010;
						write_dest <= 2'b10;
						mem_write <= 1'b0;
						instr_enable <= 1'b1;
					end
			6'd60: begin
						B_op <= 3'b111;
						x_out <= 2'b01;
						x_imm <= 1'b1;
						x_ALU <= 3'b010;
						write_dest <= 2'b00;
						mem_write <= 1'b1;
						instr_enable <= 1'b1;
					end
			6'd45: begin
						B_op <= 3'bxxx;
						x_out <= 2'bxx;
						x_imm <= 1'bx;
						x_ALU <= 3'bxxx;
						write_dest <= 2'b00;
						mem_write <= 1'b0;
						instr_enable <= 1'b0;
					end
			default: begin
							B_op <= 3'bxxx;
							x_out <= 2'bxx;
							x_imm <= 1'bx;
							x_ALU <= 3'bxxx;
							write_dest <= 2'bxx;
							mem_write <= 1'bx;
							instr_enable <= 1'bx;
						end
		endcase
	end
			


endmodule