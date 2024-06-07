`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 07.06.2024 15:41:12
// Design Name: 8 bit ALU
// Module Name: ALU_tb
// Project Name: ALU
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


module ALU_tb();
    reg [7:0] a_i, b_i;
    reg [2:0] op_i;
    wire [7:0] alu_o;

    ALU alu_inst (.a_i(a_i), .b_i(b_i), .op_i(op_i), .alu_o(alu_o));

    initial begin
        $dumpfile("ALU.vcd");
        $dumpvars(0, ALU_tb);
    end

    initial begin
        for (integer i = 0; i < 8; i = i + 1) begin
            a_i = $random % 256;
            b_i = $random % 256;
            op_i = $random % 8;
            #5;
        end
    end

    initial begin
        $monitor("time = %d, a_i = %8b, b_i = %8b, op_i = %3b, alu_o = %8b", $time, a_i, b_i, op_i, alu_o);
    end
endmodule
