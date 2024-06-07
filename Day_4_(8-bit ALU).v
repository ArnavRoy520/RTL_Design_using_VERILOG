`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 07.06.2024 15:21:57
// Design Name: 8 bit ALU
// Module Name: ALU
// Project Name:ALU 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input wire [7:0] a_i,
    input wire [7:0] b_i,
    input wire [2:0] op_i,
    output reg [7:0] alu_o
    );
    reg carry;
    
    always @(*) begin
        carry = 0; // Initialize carry to avoid latches
        case(op_i)
            3'b000: {carry, alu_o} = {1'b0, a_i} + {1'b0, b_i};
            3'b001: alu_o = a_i - b_i;
            3'b010: alu_o = a_i << b_i[2:0];
            3'b011: alu_o = a_i >> b_i[2:0];
            3'b100: alu_o = a_i & b_i;
            3'b101: alu_o = a_i | b_i;
            3'b110: alu_o = a_i ^ b_i;
            3'b111: alu_o = {7'b0, a_i == b_i};
            default: alu_o = 8'b0; // Default case to avoid latches
        endcase
    end
endmodule
