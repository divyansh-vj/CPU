`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:23 10/26/2022 
// Design Name: 
// Module Name:    PC_unit 
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
module PC_unit(input B1, input B2, input B3, input C, input L, input E, input [31:0] rs, input [25:0] abs_add, input [20:0] PC_rel_add, input clk, input rst, output reg [31:0] ret_add, output [31:0] PC_out, output reg enable, input instr_enable, input [31:0] count, output reg select, output reg [1:0] switch);
	reg [31:0] PC;//, mux_out;
	//reg [31:0] ;
	//reg [31:0] ;
	wire [1:0] sel;
	wire [31:0] final_PC_rel_add, inc_PC, ext_PC_rel_add, final_abs_add;
	reg counter, change;
	//reg [1:0] switch;
	reg [31:0] dis_counter;
	
//	always @(PC_rel_add)
//		begin
//			ext_PC_rel_add = $signed(PC_rel_add);
//		end
		
//	always @(abs_add)
//		begin
//			final_abs_add = {inc_PC[31:26], abs_add};
//		end
		
//	always @(PC)
//		begin
//			adder_32bit pc_increment(.in1(PC), .in2(32'd1), .c_in(1'b0), .sum(inc_PC), .c_out());
//			adder_32bit pc_relative_addressing(.in1(inc_PC), .in2(ext_PC_rel_add), .c_in(1'b0), .sum(final_PC_rel_add), .c_out());
//			ret_add = inc_PC;
//		end
	
//	PC_combinational_unit pc_comb(.B1(B1), .B2(B2), .B3(B3), .C(C), .L(L), .E(E), .sel(sel));
	
//	always @(rs or abs_add or PC_rel_add or ret_add)
//		begin
//			case(sel)
//				2'b00: mux_out = rs;
//				2'b01: mux_out = ext_abs_add;
//				2'b10: mux_out = ext_PC_rel_add;
//				2'b11: mux_out = inc_PC;
//				default: mux_out = inc_PC;
//			endcase
//		end
	
	
	
	
	//initial
		//begin
			//PC <= 32'd0;
			//mux_out <= 32'd0;
		//end
		
	
	always @(negedge clk)// or posedge rst)
		begin
			if(rst)
				begin
					enable = 1'b0;
					counter = 1'b1;
					switch = 2'd2;
					select = 0;
					change = 1;
				end
			else
			
//			adder_32bit pc_increment(.in1(PC), .in2(32'd1), .c_in(1'b0), .sum(inc_PC), .c_out());
//			adder_32bit pc_relative_addressing(.in1(inc_PC), .in2(ext_PC_rel_add), .c_in(1'b0), .sum(final_PC_rel_add), .c_out());
			
//			PC_combinational_unit pc_comb(.B1(B1), .B2(B2), .B3(B3), .C(C), .L(L), .E(E), .sel(sel));
				begin
					if(counter == 1)
						begin
							PC = 32'd0;
							enable = 1'b1;
							counter = 1'b0;
						end
					else
						begin
							if(instr_enable == 1'b0)
								begin
									if(switch == 2)
										
										
											begin
												PC = 32'd1;
												select = 1;
												switch = switch -1;
												//change = change - 1;
											end
					
										
										//else
											//change = 1;
									else if(switch == 1)
										begin
											dis_counter = count;
											PC = inc_PC;
											switch = switch -1;
										end
									else if(switch == 0)
										begin
											if(dis_counter!=1)
												begin
													PC = inc_PC;
													dis_counter = dis_counter-1;
												end
											else
												begin
													PC = inc_PC;
													switch = 2;
												end
										end			
								end
							else
								begin
									enable = 1'b1;
									case(sel)
										2'b00: PC = rs;
										2'b01: PC = final_abs_add;
										2'b10: PC = final_PC_rel_add;
										2'b11: PC = inc_PC;
										default: PC = inc_PC;
									endcase
								end
						end
				end
			//PC = mux_out;
		end
		
		always @(posedge clk)
			begin
				ret_add = inc_PC;
			end
		
	assign final_abs_add = {inc_PC[31:26], abs_add};
	assign ext_PC_rel_add = $signed(PC_rel_add);
	adder_32bit pc_increment(.in1(PC), .in2(32'd1), .c_in(1'b0), .sum(inc_PC), .c_out());
	adder_32bit pc_relative_addressing(.in1(inc_PC), .in2(ext_PC_rel_add), .c_in(1'b0), .sum(final_PC_rel_add), .c_out());
	PC_combinational_unit pc_comb(.B1(B1), .B2(B2), .B3(B3), .C(C), .L(L), .E(E), .sel(sel));
	//assign ret_add = inc_PC;
	assign PC_out = PC;


endmodule