`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 20.07.2024 16:46:34
// Design Name: Round Robin Arbiter
// Module Name: RR_arbiter
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


module RR_arbiter(
  input     wire        clk,
  input     wire        reset,

  input     wire[3:0]   req_i,
  output    wire[3:0]  gnt_o
);

 
  reg[3:0] nxt_mask;

  always @(posedge clk or posedge reset)
    if (reset)
      mask_q <= 4'hF;
    else
      mask_q <= nxt_mask;


  always@(*) begin
    nxt_mask = mask_q;
         if (gnt_o[0]) nxt_mask = 4'b1110;
    else if (gnt_o[1]) nxt_mask = 4'b1100;
    else if (gnt_o[2]) nxt_mask = 4'b1000;
    else if (gnt_o[3]) nxt_mask = 4'b0000;
  end

  
  wire[3:0] mask_req;

  assign mask_req = req_i & mask_q;

  wire[3:0] mask_gnt;
  wire[3:0] raw_gnt;
  
  arbiter #(4) maskedGnt (.req_i (mask_req), .gnt_o (mask_gnt));
  arbiter #(4) rawGnt    (.req_i (req_i),    .gnt_o (raw_gnt));

  
  assign gnt_o = |mask_req ? mask_gnt : raw_gnt;

endmodule
