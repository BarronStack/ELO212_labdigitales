`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 14:48:55
// Design Name: 
// Module Name: fibbinario
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

module fibbinario(
    input logic A, B, C, D,
    output logic Y
    );
    
    logic E,F,G,H;
    assign E = A & B;  
    assign F = B & C;
    assign G = C & D;
    assign H = E | F | G;
    
    assign Y = ~H;
endmodule
