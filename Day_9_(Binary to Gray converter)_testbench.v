`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 13.06.2024 14:16:14
// Design Name: Binary to gray converter
// Module Name: gray_conv_tb
// Project Name: Binary to gray converter
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


module gray_conv_tb();
parameter wrd_len = 5;

  reg [wrd_len-1:0] bin_i;
  wire [wrd_len-1:0] gray_o;

  gray_conv #(wrd_len) gray_conv_instantiation (bin_i, gray_o);
  initial begin
    $dumpfile("gray_conv.v");
    $dumpvars(2, gray_conv_tb);
  end
  initial 
  begin
    for (integer i=0; i<2**wrd_len; i=i+1) 
    begin
      bin_i = i;
      #5;
    end
    $finish();
  end
 initial
    begin
        $monitor("time = %d, Binary Input = %4b, Gray Code output = %4b", $time, bin_i, gray_o);
    end

  
endmodule

