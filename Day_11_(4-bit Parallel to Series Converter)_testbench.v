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


module parallel_to_serial_tb();
    reg clk, rst;
    wire empty_o;
reg [3:0] parallel_i;
  wire serial_o;
  wire valid_o;

  parallel_to_serial p2s_inst (clk,rst,serial_o,parallel_i, empty_o,valid_o);
initial begin
    $dumpfile("parallel_to_serial.v");
    $dumpvars(0, parallel_to_serial_tb);
  end
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  initial begin
    rst <= 1'b1;
    parallel_i <= 4'h0;
    @(negedge clk);
    rst <= 1'b0;
    @(posedge clk);
    for (integer i=0; i<32; i=i+1) 
    begin
      parallel_i <= $urandom_range(0, 4'hF);
      @(posedge clk);
    end
    $finish();
  end
 initial
    begin
        $monitor("time = %d, clk = %b, rst = %b, parallel input = %4b, serial output = %b, empty_o = %b, valid_o = %b", $time, clk, rst,parallel_i, serial_o, empty_o,valid_o);
    end

  
endmodule

