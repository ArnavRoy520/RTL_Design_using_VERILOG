`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 20.07.2024 15:48:05
// Design Name: Parameterized Fixed Arbiter
// Module Name: arbiter_tb
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


module arbiter_tb();
    localparam NUM_PORTS = 4;
    
    reg [NUM_PORTS-1:0]req_i;
    wire [NUM_PORTS-1:0] gnt_o;
    
    arbiter #(NUM_PORTS) arbiter_insta(.req_i(req_i), .gnt_o(gnt_o));
    
    initial begin
        $dumpfile ("arbiter.vcd");
        $dumpvars (0, arbiter_tb);
    end
    
    initial begin
        for(integer i=0; i<50; i = i+1) begin
            req_i = $urandom_range(0, 2**NUM_PORTS-1);
            #5;
        end
    end
    
    initial
    begin
        $monitor("time = %d, req_i = %4b, gnt_o = %4b", $time, req_i, gnt_o);
    end

endmodule

