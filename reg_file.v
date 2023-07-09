`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:03 10/28/2022 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file(input clk, input rst, input [4:0] rs_add, input [4:0] rt_add, input [1:0] w_dest, input [31:0] reg_write_data, output [31:0] rs_data, output [31:0] rt_data);

	reg [31:0] reg_file[31:0];
	
	always @(posedge clk)// or posedge rst)
		begin
			if (rst)
				begin
					reg_file[0] <= 32'd0;
					reg_file[1] <= 32'd0;
					reg_file[2] <= 32'd0;
					reg_file[3] <= 32'd0;
					reg_file[4] <= 32'd0;
					reg_file[5] <= 32'd0;
					reg_file[6] <= 32'd0;
					reg_file[7] <= 32'd0;
					reg_file[8] <= 32'd0;
					reg_file[9] <= 32'd0;
					reg_file[10] <= 32'd0;
					reg_file[11] <= 32'd0;
					reg_file[12] <= 32'd0;
					reg_file[13] <= 32'd0;
					reg_file[14] <= 32'd0;
					reg_file[15] <= 32'd0;
					reg_file[16] <= 32'd0;
					reg_file[17] <= 32'd0;
					reg_file[18] <= 32'd0;
					reg_file[19] <= 32'd0;
					reg_file[20] <= 32'd0;
					reg_file[21] <= 32'd0;
					reg_file[22] <= 32'd0;
					reg_file[23] <= 32'd0;
					reg_file[24] <= 32'd0;
					reg_file[25] <= 32'd0;
					reg_file[26] <= 32'd0;
					reg_file[27] <= 32'd0;
					reg_file[28] <= 32'd0;
					reg_file[29] <= 32'd0;
					reg_file[30] <= 32'd0;
					reg_file[31] <= 32'd0;
				end
			else
				begin
					case (w_dest)
					2'b00 : ;
					2'b01 : reg_file[rs_add] <= reg_write_data;
					2'b10 : reg_file[rt_add] <= reg_write_data;
					2'b11 : reg_file[5'd31] <= reg_write_data;
					default : ;
					endcase
				end
		end
		
		assign rs_data = reg_file[rs_add];
		assign rt_data = reg_file[rt_add];
		
//		always @ (reg_write_data)
//			begin
				
//			end
			
		
	
endmodule