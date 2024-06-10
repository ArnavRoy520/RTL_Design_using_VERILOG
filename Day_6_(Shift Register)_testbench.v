`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer:Arnav Roy 
// 
// Create Date: 10.06.2024 14:06:46
// Design Name: Shift Registerr
// Module Name: shift_reg_tb
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


module shift_reg_tb();
    reg clk, rst, in;
    wire [3:0]   out;

  shift_reg shift_reg_inst (clk, rst, in, out);

initial begin
    $dumpfile("shift_reg.v");
    $dumpvars(0, shift_reg_tb);
  end
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end


  initial begin
    rst <= 1'b1;
    in <= 1'b0;
    @(posedge clk);
    rst <= 1'b0;
    @(posedge clk);
    for (integer i=0; i<20; i=i+1) 
    begin
      in <= $random%2;
      @(posedge clk);
    end
    $finish();
  end
initial
    begin
        $monitor("time = %d, clk = %b,rst = %b, in = %b, out = %4b", $time, clk,rst, in,out);
    end
 
  
endmodule
