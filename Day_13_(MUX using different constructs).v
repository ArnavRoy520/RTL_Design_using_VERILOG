`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 01.07.2024 21:32:49
// Design Name: MUX using different constructs
// Module Name: mux
// Project Name: MUX using different constructs
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


module mux(
    input wire [3:0] a_i,
    input wire[3:0] sel_i,
    output wire y_ter_o,
    output reg y_case_o,
    output reg y_ifelse_o,
    output reg y_loop_o,
    output wire y_aor_o
    );
    // for ternary operator
    assign y_ter_o = sel_i[0] ? a_i[0] : sel_i[1] ? a_i[1] : sel_i[2] ? a_i[2] : a_i[3];
    
    // for case
    always begin
    case(sel_i)
        4'b0001 : y_case_o = a_i[0];
        4'b0010 : y_case_o = a_i[1];
        4'b0100 : y_case_o = a_i[2];
        4'b1000 : y_case_o = a_i[3];
     endcase
    end
   // for if-else
   always begin
   if(sel_i[0])
   y_ifelse_o = a_i[0];
   else if(sel_i[1])
   y_ifelse_o = a_i[1];
   else if(sel_i[2])
   y_ifelse_o = a_i[2];
   else if(sel_i[3])
   y_ifelse_o = a_i[3];
   else               
   y_ifelse_o = 1'bx;
   end    
   
  // by Using for loop
  always begin
    y_loop_o = 4'b0;
    for (integer i=0; i<4; i=i+1) begin
      y_loop_o = (sel_i[i] & a_i[i]) | y_loop_o;
    end
  end 
  
  // for and-or tree
  assign y_aor_o = (sel_i[0] & a_i[0]) | (sel_i[1] & a_i[1]) | (sel_i[2] & a_i[2]) | (sel_i[3] & a_i[3]); 

endmodule

