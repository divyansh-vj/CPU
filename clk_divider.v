`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:37 11/09/2022 
// Design Name: 
// Module Name:    clk_divider 
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
module clk_divider(input clk, output wire newclk);
reg[21:0] temp_counter = 0;
always @(posedge clk)
	begin
		temp_counter <= temp_counter + 21'd1;
	end
assign newclk = temp_counter[21];
endmodule