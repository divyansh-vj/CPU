`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:56 11/08/2022 
// Design Name: 
// Module Name:    diff 
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
module diff(input [31:0] in, output reg [31:0] out);
integer N;
always @(in)
	begin 
		out = 32'b11111111111111111111111111111111;
		for(N=31;N>=0;N=N-1)
			if(in[N])
				begin
					out = N;
				end
	end

endmodule
