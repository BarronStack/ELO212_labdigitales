`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 17:00:53
// Design Name: 
// Module Name: two_bitadder
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


module two_bitadder(
    input logic [1:0] A,B,
    output logic [2:0] X
    );
    
    always_comb begin
        X = A + B;
    end
    
endmodule
