`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:27 10/28/2022 
// Design Name: 
// Module Name:    Instruction_memory 
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
module Instruction_memory(input clk, input enable, input [31:0] instr_address, output [31:0] instruction);

Instruction_memory_block instruction_memory (
  .clka(clk), // input clka
  .ena(enable), // input ena
  .addra(instr_address[11:0]), // input [11 : 0] addra
  .douta(instruction) // output [31 : 0] douta
);

endmodule