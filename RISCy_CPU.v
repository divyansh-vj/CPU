`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:31:26 11/02/2022 
// Design Name: 
// Module Name:    RISCy_CPU 
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
module RISCy_CPU(input clk, input rst, output [31:0] display_reg);
	
	wire x_imm, mem_write, enable, instr_enable, select, neg_clk, sp_clk, clk_divider, clock;
	wire [1:0] x_out, write_dest, switch;
	wire [31:0] instruction, instruction_address, rs_data, rt_data, ALU_in1, ALU_in2, ALU_out, extended_imm, mem_out, return_address, data_add;
	reg [31:0] reg_write_data;
	wire [2:0] B_op, x_ALU;
	wire [3:0] ALU_control_line;
	wire [2:0] flag;
	clk_divider clk_div(.clk(clk), .newclk(clk_divider) );
	assign clock = (select == 1'b0) ? clk : clk_divider;
	assign neg_clk = ~clock;
	PC_unit PC(.B1(B_op[2]), .B2(B_op[1]), .B3(B_op[0]), .C(flag[0]), .L(flag[2]), .E(flag[1]), .rs(rs_data), .abs_add(instruction[25:0]), .PC_rel_add(instruction[20:0]), .clk(clock), .rst(rst), .ret_add(return_address), .PC_out(instruction_address), .enable(enable), .instr_enable(instr_enable), .count(mem_out), .select(select) , .switch(switch));
	Instruction_memory instr_mem(.clk(clock), .instr_address(instruction_address), .instruction(instruction), .enable(enable));
	CONTROLLER Controller(.op_code(instruction[31:26]), .B_op(B_op), .x_out(x_out), .x_imm(x_imm), .x_ALU(x_ALU), .write_dest(write_dest), .mem_write(mem_write), .instr_enable(instr_enable));
	
	reg_file REG_file(.clk(clock), .rst(rst), .rs_add(instruction[25:21]), .rt_add(instruction[20:16]), .w_dest(write_dest), .reg_write_data(reg_write_data), .rs_data(rs_data), .rt_data(rt_data));
	
	assign extended_imm = $signed(instruction[15:0]);
	assign ALU_in2 = ((x_imm == 1'b1)? extended_imm : rt_data);
	assign ALU_in1 = rs_data;
	
	
	ALU_controller ALU_control(.fn_code(instruction[5:0]), .x_ALU(x_ALU), .control(ALU_control_line));
	ALU ALU_CPU(.clk(clock), .in1(ALU_in1), .in2_old(ALU_in2), .shamt(instruction[15:6]), .control(ALU_control_line), .flag(flag), .out(ALU_out));
	assign data_add = (select == 1'b0) ? ALU_out : instruction_address;
	assign sp_clk = (select == 1'b0) ? clock : neg_clk;
	Data_memory data_mem(.clk(sp_clk), .data_address(data_add), .write_data(rt_data), .write_enable(mem_write), .read_data(mem_out));
	always @(x_out or ALU_out or return_address or mem_out)
		begin
			casex(x_out)
				2'b00: reg_write_data = return_address;
				2'b01: reg_write_data = ALU_out;
				2'b10: reg_write_data = mem_out; 
				default: reg_write_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
			endcase
		end
		
	assign display_reg = (select == 1'b0) ? 32'd0 : mem_out;
		
	
endmodule