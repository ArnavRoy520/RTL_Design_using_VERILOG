`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 17.06.2024 22:36:41
// Design Name: 4-bit Counnter
// Module Name: count
// Project Name: 4-bit Counter
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


module count(
    input wire clk,
    input wire rst,
    input wire load_i,
    input wire[3:0] load_val_i,
    output wire[3:0] count_o
    );
    reg[3:0] load_ff;

  always @(posedge clk or posedge rst)
    if (rst)
      load_ff <= 4'h0;
    else if (load_i)
      load_ff <= load_val_i;

  reg[3:0] count_ff;
  wire[3:0] nxt_count;

  always @(posedge clk or posedge rst)
    if (rst)
      count_ff <= 4'h0;
    else
      count_ff <= nxt_count;

  assign nxt_count = load_i ? load_val_i :(count_ff == 4'hF) ? load_ff :count_ff + 4'h1;

  assign count_o = count_ff;

endmodule

