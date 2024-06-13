`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 13.06.2024 14:10:02
// Design Name: Binary to gray converter
// Module Name: gray_conv
// Project Name: Binary to gray converter
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


module gray_conv #(
    parameter wrd_len = 4
)(
    input wire [wrd_len -1:0] bin_i,
    output wire [wrd_len -1:0] gray_o
    );
    assign gray_o[wrd_len-1] = bin_i[wrd_len-1];
    genvar i;
    for(i = wrd_len-2; i>=0; i=i-1)
        assign gray_o[i]=bin_i[i+1] ^ bin_i[i];
    
endmodule
