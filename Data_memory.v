`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:19:26 11/02/2022 
// Design Name: 
// Module Name:    Data_memory 
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
module Data_memory(input clk, input [31:0] data_address, input [31:0] write_data, input write_enable, output [31:0] read_data);

wire negclk;
assign negclk = ~clk;
Data_memory_block data_memory (
  .clka(negclk), // input clka
  .wea(write_enable), // input [0 : 0] wea
  .addra(data_address[11:0]), // input [11 : 0] addra
  .dina(write_data), // input [31 : 0] dina
  .douta(read_data) // output [31 : 0] douta
);


endmodule