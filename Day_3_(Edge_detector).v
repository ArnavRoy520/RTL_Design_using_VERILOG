`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 07.06.2024 14:02:57
// Design Name: Edge Detector
// Module Name: Edge_detector
// Project Name: Edge_detector
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


module Edge_detector(
    input wire clk,
    input wire rst,
    input wire d_i,
    output wire rising_edge,
    output wire falling_edge
    );
    
    reg d_buff;
    
    always@ (posedge clk or posedge rst)
        if(rst)
            d_buff <= 1'b0;
        else
            d_buff <= d_i;
            
     // if signal goes from 0 to 1 (i.e d_i goes from 0 to 1) then its a rising edge
        assign rising_edge = ~d_buff & d_i;       ////// hence we can say that for d_buff which is the delayed value of d_i should be 0 
     
     // if signal goes from 1 to 0 (i.e d_i goes from 1 to 0) then its a fallig edge
        assign falling_edge = d_buff & ~d_i;      //// in this the presnt value is 0 hence we are inverting it
endmodule
