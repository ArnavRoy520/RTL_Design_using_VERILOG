`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 06.06.2024 10:24:35
// Design Name: 2:1 MUX (8-bits)testbench
// Module Name: two2one_MUX_tb
// Project Name: 2:1 MUX (8-bits)
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


module two2one_MUX_tb;
 reg [7:0] a_i,b_i;
 reg  sel_i;
 wire [7:0] y_o;
 
 two2one_MUX MUX(.a_i(a_i), .b_i(b_i), .sel_i(sel_i), .y_o(y_o));
 
 initial 
 begin
 $dumpfile("two2one_MUX.v");
 $dumpvars (0, two2one_MUX_tb);
 
 for (integer i = 0; i < 10; i=i+1) 
    begin
        a_i   = $urandom_range (0, 8'hFF);
        b_i   = $urandom_range (0, 8'hFF);
        sel_i = $random%2;
      #5;
    end
 end
initial
    begin
        $monitor("time = %d, a_i = %8b, b_i = %8b, sel_i = %b, y_o = %8b ",$time, a_i, b_i, sel_i, y_o);
    end
endmodule
