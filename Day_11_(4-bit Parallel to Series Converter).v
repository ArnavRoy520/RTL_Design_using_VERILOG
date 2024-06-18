`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 18.06.2024 15:15:25
// Design Name: 4-bit Parallel to Serial converter
// Module Name: parallel_to_serial
// Project Name: 4-bit Parallel to Serial converter
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


module parallel_to_serial(
    input wire clk,
    input wire rst,
    output wire serial_o,
    input wire [3:0] parallel_i,
    output wire empty_o,
    output wire valid_o
    );
   
  reg [3:0] shift_ff;
  wire [3:0] nxt_shift;

  always @(posedge clk or posedge rst)
    if (rst)
      shift_ff <= 4'h0;
    else
      shift_ff <= nxt_shift;

 
  assign nxt_shift = empty_o ? parallel_i :
                               {1'b0, shift_ff[3:1]};

  assign serial_o = shift_ff[0];

  
  reg [2:0] count_ff;
  wire [2:0] nxt_count;

  always @(posedge clk or posedge rst)
    if (rst)
      count_ff <= 3'h0;
    else
      count_ff <= nxt_count;

  assign nxt_count = (count_ff == 3'h4) ? 3'h0 :
                                          count_ff + 3'h1;

  assign valid_o = |count_ff;

  assign empty_o = (count_ff == 3'h0);

endmodule

