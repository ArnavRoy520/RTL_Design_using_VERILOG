`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 01.07.2024 21:50:20
// Design Name: MUX using different constructs
// Module Name: mux_tb
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


module mux_tb();
 reg [3:0] a_i;
  reg [3:0] sel_i;

  // Output using ternary operator
  wire     y_ter_o;
  // Output using case
  wire     y_case_o;
  // Ouput using if-else
  wire     y_ifelse_o;
  // Output using for loop
  wire     y_loop_o;
  // Output using and-or tree
  wire     y_aor_o;

  // Module instance
  mux MUX (a_i, sel_i, y_ter_o, y_case_o, y_ifelse_o, y_loop_o, y_aor_o);
  
  // VCD
  initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux_tb);
  end
  // Stimulus
  initial begin
    for (integer i =0; i<32; i=i+1) begin
      a_i   = $urandom_range(0, 4'hF);
      sel_i = 1'b1 << $urandom_range(0, 2'h3); // one-hot
      #5;
    end
    $finish();
  end

  initial
    begin
        $monitor("time = %d, a_i = %4b, sel_i = %4b, y_ter_o = %b, y_case_o = %b, y_ifelse_o = %b, y_loop_o = %b, y_aor_o = %b", $time, a_i, sel_i, y_ter_o, y_case_o, y_ifelse_o, y_loop_o, y_aor_o);
    end


endmodule

