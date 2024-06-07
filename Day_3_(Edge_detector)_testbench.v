`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 07.06.2024 14:15:49
// Design Name: Edge Detector
// Module Name: Edge_detector_tb
// Project Name: 
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


module Edge_detector_tb();
  reg    clk, rst, d_i;
  wire    rising_edge;
  wire    falling_edge;

  Edge_detector EdgeDetect ( clk, rst, d_i, rising_edge, falling_edge);
 
  initial begin
    $dumpfile("Edge_detector.vcd");
    $dumpvars(0, Edge_detector_tb);
  end
  // clk
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    rst <= 1'b1;
    d_i <= 1'b1;
    @(posedge clk);
    rst <= 1'b0;
    @(posedge clk);
    for (integer i=0; i<32; i=i+1) 
    begin
      d_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end
    initial
    begin 
        $monitor("time = %d, clk = %b, rst = %b, d_i = %b, rising_edge = %b, falling_edge =%b", $time, clk, rst, d_i, rising_edge, falling_edge);
    end    
endmodule
