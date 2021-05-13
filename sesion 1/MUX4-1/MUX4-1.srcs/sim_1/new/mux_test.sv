`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 16:02:07
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
    
    logic [3:0] A,B,C,D,out;
    logic [1:0] sel;
    
    mux DUT(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .sel(sel),
    .out(out)
    );
    
    initial begin
    A = 4'd2;     
    B = 4'd5;      
    C = 4'd8;     
    D = 4'd10;
    sel = 2'b00;    
    #10
    sel = 2'b01;    
    #10
    sel = 2'b10;
    #10
    sel = 2'b11;
    #10
    sel = 2'b10;

    end    
endmodule
