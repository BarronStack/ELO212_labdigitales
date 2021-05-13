`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 12.05.2021 20:57:07
// Module Name: mux
// 
//////////////////////////////////////////////////////////////////////////////////

module mux(
    input logic [2:0] sel,
    input logic [3:0] A,B,C,D,E,F,G,H,
    output logic [3:0] out
    );
    
    always_comb begin 
        case (sel)
            3'b000: out = A;
            3'b001: out = B;
            3'b010: out = C;
            3'b011: out = D;
            3'b100: out = E;
            3'b101: out = F;
            3'b110: out = G;
            3'b111: out = H;
        endcase
    end
endmodule
