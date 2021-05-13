`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 17:01:33
// Design Name: 
// Module Name: four_bitadder
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


module four_bitadder(
    input logic [3:0] A,B,
    output logic [4:0] X
    );
    
    always_comb begin
        X = A + B;
    end
endmodule
