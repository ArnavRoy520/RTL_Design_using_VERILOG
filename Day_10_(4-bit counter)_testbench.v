`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer:Arnav Roy
// 
// Create Date: 17.06.2024 22:36:41
// Design Name: 4-bit Counnter
// Module Name: count_tb
// Project Name: 4-bit Counter
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


module count_tb();
reg clk, rst, load_i;
reg [3:0] load_val_i;
wire [3:0]count_o;

  count count_instantiation (clk, rst, load_i, load_val_i, count_o);
initial begin
    $dumpfile("count.v");
    $dumpvars(0, count_tb);
  end

  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  integer cycles;
  initial begin
    rst <= 1'b1;
    load_i <= 1'b0;
    load_val_i <= 4'h0;
    @(posedge clk);
    rst <= 1'b0;
    for (integer i=0; i<3; i=i+1) 
    begin
      load_i <= 1;
      load_val_i <= 3*i;
      cycles = 4'hF - load_val_i[3:0];
      @(posedge clk);
      load_i <= 0;
      while (cycles) begin
        cycles = cycles - 1;
        @(posedge clk);
      end
    end
    $finish();
  end
initial
    begin
        $monitor("time = %d, clk = %b, rst = %b, load_i = %b, load_val_i = %4b, count_o = %4b", $time, clk, rst, load_i, load_val_i, count_o);
    end

  
endmodule

