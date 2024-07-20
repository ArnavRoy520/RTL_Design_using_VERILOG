`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 20.07.2024 17:58:38
// Design Name: Round Robin Arbiter
// Module Name: RR_arbiter_TB
// Project Name: Round Robin Arbiter
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


module RR_arbiter_TB();
        reg clk;
        reg reset;

  reg [3:0]   req_i;
  wire [3:0]   gnt_o;

  RR_arbiter rr_arbiter_inst (.clk(clk), .reset(reset), .req_i(req_i), .gnt_o(gnt_o));

  initial begin
    $dumpfile("RR_arbiter.vcd");
    $dumpvars(0, RR_arbiter_TB);
  end

  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    reset <= 1'b1;
    req_i <= 4'h0;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    @(posedge clk);
    for (integer i =0; i<32; i=i+1) begin
      req_i <= $urandom_range(0, 4'hF);
      @(posedge clk);
    end
    $finish();
  end

initial
    begin
        $monitor("time = %d, clk = %b, reset = %b, req_i = %4b, gnt_o = %4b", $time, clk, reset, req_i, gnt_o);
    end

endmodule
