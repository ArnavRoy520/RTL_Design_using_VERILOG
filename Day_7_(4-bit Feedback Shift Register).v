`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 10.06.2024 14:37:33
// Design Name: 4-bit Feedback shift register
// Module Name: shift_reg
// Project Name: 4-bit Feedback shift register
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


module shift_reg(
    input wire clk,
    input wire rst,
    output wire [3:0] out
    );
    reg [3:0] sr;
    wire [3:0] buff;
    
    always@ (posedge clk or posedge rst)
        if(rst)
            sr <= 4'b1110;
        else
            sr <= buff;
     assign  buff = {sr[2:0], sr[3]^sr[1]};
     assign out = sr;
          
endmodule
