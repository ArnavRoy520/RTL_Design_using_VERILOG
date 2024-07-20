`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 20.07.2024 15:31:25
// Design Name: Parameterized Fixed Arbiter
// Module Name: arbiter
// Project Name: Parameterized Fixed Arbiter
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


module arbiter#(
    parameter NUM_PORTS = 4
)(
    input wire [NUM_PORTS-1:0]req_i,
    output wire [NUM_PORTS-1:0]gnt_o
    );
    assign gnt_o[0]=req_i[0];
    genvar i;
    for(i=1; i < NUM_PORTS; i=i+1)
    begin
        assign gnt_o[i] = req_i[i]& ~(| req_i[i-1 :0]);
    end
endmodule

