`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 16:12:52
// Design Name: 
// Module Name: MUX
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


module MUX(
    input logic [3:0] A,B,C,D,E,
    input logic [2:0] sel,
    output logic [3:0] out
    );
    
    always_comb begin 
        case (sel)
           3'd0 : out = A;
           3'd1 : out = B;
           3'd2 : out = C;
           3'd3 : out = D;
           3'd4 : out = E;
        endcase
    end
endmodule