`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 10.06.2024 14:53:18
// Design Name: 4-bit Feedback shift register
// Module Name: shift_reg_tb
// Project Name: 4-bit Feedback shift register
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


module shift_reg_tb();
    reg clk, rst;

  wire [3:0] out;

  shift_reg shift_reg_instantiation (clk, rst, out);
  initial 
  begin
    $dumpfile("shift_reg.v");
    $dumpvars(0, shift_reg_tb);
  end
  always 
  begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  initial 
  begin
    rst <= 1'b1;
    @(posedge clk);
    rst <= 1'b0;
    for (integer i=0; i<30; i=i+1)
      @(posedge clk);
    $finish();
  end
initial
    begin
        $monitor("time = %d, clk = %b, rst = %b, out = %4b", $time, clk, rst,out);
    end

  
endmodule
