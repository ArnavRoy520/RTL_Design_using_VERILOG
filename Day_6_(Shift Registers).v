`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 10.06.2024 14:02:45
// Design Name: Shift Register
// Module Name: shift_reg
// Project Name: Shift Register
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


module shift_reg(
    input wire clk,
    input wire rst,
    input wire in,
    output wire [3:0] out
    );
    reg [3:0] sr;
    wire [3:0] buff;

  always @(posedge clk or posedge rst)
    if (rst)
      sr <= 4'h0;
    else
      sr <= buff;

  assign buff = {sr[2:0], in};
  assign out = sr;
endmodule

