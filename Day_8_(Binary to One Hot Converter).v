`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 12.06.2024 22:23:32
// Design Name: Binary to one hot code
// Module Name: one_hot
// Project Name: Binary to one hot code
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


module one_hot#(
    parameter binary_word = 4,
    parameter one_hot_word = 16
)(
    input wire [binary_word-1:0] bin_i,
    output wire [one_hot_word-1:0] one_hot_o
    );
    
    assign one_hot_o = 1'b1<<bin_i;
    
endmodule
