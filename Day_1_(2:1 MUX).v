`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 06.06.2024 10:13:05
// Design Name: 2:1 MUX (8-bits)
// Module Name: two2one_MUX
// Project Name: 2:1 MUX (8-bits) using verilog
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


module two2one_MUX(
    input [7:0] a_i,
    input [7:0] b_i,
    input sel_i,
    output [7:0] y_o
    );
    assign y_o = sel_i ? a_i : b_i;
   
endmodule
