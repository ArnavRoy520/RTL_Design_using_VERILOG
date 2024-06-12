`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 12.06.2024 22:28:06
// Design Name: Binary to one hot code
// Module Name: one_hot_tb
// Project Name: Binary to one hot code
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


module one_hot_tb();
  localparam BIN_W = 4;
  localparam ONE_HOT_W = 16;

  reg [BIN_W-1:0] bin_i;
  wire [ONE_HOT_W-1:0] one_hot_o;

  one_hot #(BIN_W, ONE_HOT_W) one_hot_instanciate (bin_i, one_hot_o);
initial begin
    $dumpfile("one_hot.v");
    $dumpvars(2, one_hot_tb);
  end
  initial begin
    for(integer i=0; i<32; i=i+1) 
    begin
      bin_i = $urandom_range(0, 4'hF);
      #5;
    end
    $finish();
  end

  initial
    begin
        $monitor("time = %d, Binary_Data = %4b, One_hot_Encoded_data = %16b", $time, bin_i, one_hot_o);
    end

endmodule
