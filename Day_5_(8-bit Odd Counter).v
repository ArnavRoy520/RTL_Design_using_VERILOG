`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 08.06.2024 09:52:41
// Design Name: 8-bit Odd Counter
// Module Name: odd_counter
// Project Name: 8-bit Odd Counter
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


module odd_counter(
    input wire clk,
    input wire rst,
    output reg [7:0] cnt_o
    );
    wire [7:0] nxt_cnt;

  always @(posedge clk or posedge rst)
    if (rst)
      cnt_o <= 8'h1;
    else
      cnt_o <= nxt_cnt;

  assign nxt_cnt = cnt_o + 8'h2;

endmodule
