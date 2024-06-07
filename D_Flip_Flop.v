`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 07.06.2024 07:35:04
// Design Name: D_Flip_Flop
// Module Name: D_FF
// Project Name: D_Flip_Flop
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


module D_FF(
    input clk,
    input rst,
    input d_i,
    output reg q_no_rst,
    output reg q_sync_rst,
    output reg q_async_rst
    );
    
    // No reset mode
  always @(posedge clk)
    q_no_rst <= d_i;

  // Sync reset mode
  always @(posedge clk)
    if (rst)
      q_sync_rst <= 1'b0;
    else
      q_sync_rst <= d_i;

  // Async reset mode
  always @(posedge clk or posedge rst)
    if (rst)
      q_async_rst <= 1'b0;
    else
      q_async_rst <= d_i;
      
endmodule
