`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 08.06.2024 10:20:29
// Design Name: 8-bit Odd Counter
// Module Name: odd_count_tb
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


module odd_count_tb();
  reg clk, rst;
  wire [7:0] cnt_o;

  odd_counter Counter_inst (clk, rst, cnt_o);
  initial begin
    $dumpfile("odd_counter.v");
    $dumpvars(0, odd_count_tb);
   end
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial begin
    rst <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    rst <= 1'b0;
    for (integer i=0; i<128; i=i+1)
      @(posedge clk);
    $finish();
  end
 initial
    begin
        $monitor("time = %d, clk = %b, rst = %b, odd counter = %8b", $time, clk, rst, cnt_o);
    end

  
endmodule
