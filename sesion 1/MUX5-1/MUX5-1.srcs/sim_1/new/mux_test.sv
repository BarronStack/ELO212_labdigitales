`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 16:21:20
// Design Name: 
// Module Name: mux_test
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


module mux_test(
    );
    logic [3:0] A,B,C,D,E,out;
    logic [2:0] sel;
     
     MUX DUT(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .out(out),
        .sel(sel)
     );
     
     initial begin
     A = 4'b0000;
     B = 4'b0001;
     C = 4'b0010;
     D = 4'b0011;
     E = 4'b0100;
     sel = 3'd0; 
     
     #10
     sel = 3'd4;
     #10
     sel = 3'd2;
     #10
     sel = 3'd3;
     #10
     sel = 3'd1;
     #10
     sel = 3'd0;
     #10
     sel = 3'd2;
     end
endmodule
