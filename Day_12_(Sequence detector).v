`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 19.06.2024 14:32:56
// Design Name: Sequence Detector for 111000000111
// Module Name: detect
// Project Name: Sequence Detector for 111000000111
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


module detect(
    input wire clk,
    input wire rst,
    input wire x_i,
    output wire det_o
    );
    
  reg[11:0] shift_ff;
  wire[11:0] nxt_shift;

  always @(posedge clk or posedge rst)
    if (rst)
      shift_ff <= 12'h0;
    else
      shift_ff <= nxt_shift;

  assign nxt_shift = {shift_ff[10:0], x_i};

  assign det_o = (shift_ff[11:0] == 12'b111000000111);
endmodule

