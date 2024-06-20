`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 19.06.2024 14:32:56
// Design Name: Sequence Detector for 111000000111
// Module Name: detect_tb
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


module detect_tb();
reg clk,rst, x_i;
  wire det_o;

  detect Detect_instantiation (clk,rst, x_i, det_o);
initial begin
    $dumpfile("detect.v");
    $dumpvars(0, detect_tb);
  end
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  reg [11:0] seq = 12'b111000000111;

  initial 
  begin
    rst <= 1'b1;
    x_i <= 1'b1;
    @(posedge clk);
    rst <= 1'b0;
    @(posedge clk);
    for (integer i=0; i<12; i=i+1) 
    begin
      x_i <= seq[i];
      @(posedge clk);
    end
    for (integer i=0; i<12; i=i+1) 
    begin
      x_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end
initial
    begin
        $monitor("time = %d, clk = %b, rst = %b, input = %b, Detected = %b", $time, clk,rst,x_i,det_o);
    end

endmodule

