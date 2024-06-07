`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 07:40:39
// Design Name: 
// Module Name: D_FF_tb
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


module D_FF_tb;
    reg clk, rst, d_i;
    wire q_no_rst, q_sync_rst, q_async_rst;

  D_FF d_ff(clk, rst, d_i, q_no_rst, q_sync_rst, q_async_rst);

 initial 
    begin
        $dumpfile("D_FF.vcd");
        $dumpvars(0, D_FF_tb);
    end
  always 
    begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

  // Adding stimulus knowingly
  initial 
  begin
    rst = 1'b1;
    d_i = 1'b0;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    d_i = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    rst = 1'b1;
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
  end
// Adding stimulus randomly
 initial
    begin
        for(integer i=0; i<20; i=i+1)
            begin
                d_i = $urandom_range(0,1'b1);
                rst = $urandom_range(0,1'b1);
                #5;
            end
    end
  initial
    begin
        $monitor("time = %d, clk = %b, d_i = %b, rst = %b, q_no_rst = %b, q_sync_rst = %b, q_async_rst = %b", $time, clk, d_i, rst, q_no_rst, q_sync_rst, q_async_rst);
    end
endmodule
