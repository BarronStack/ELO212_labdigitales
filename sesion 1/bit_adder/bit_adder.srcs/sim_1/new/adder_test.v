`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 17:06:43
// Design Name: 
// Module Name: adder_test
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

module adder_test(
    );
    logic [3:0] A,B;
    logic [4:0] X;  
    
    one_bitadder DUT(
        .A(A),
        .B(B),
        .X(X)
    );
    
    initial begin
    A = 5'b0000;
    B = 5'b0001; 
    #10
    A = 5'b1111;
    B = 5'b1111; 
    #10
    A = 5'b0100;
    B = 5'b0010; 
    #10
    A = 4'b0101;
    B = 4'b1010; 
    end
    
    
    
endmodule
