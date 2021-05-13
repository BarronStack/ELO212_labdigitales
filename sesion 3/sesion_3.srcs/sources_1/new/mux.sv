`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 23.04.2021 15:52:41
// Design Name: 
// Module Name: mux
// 
//////////////////////////////////////////////////////////////////////////////////

module mux(
    input logic [1:0] sel,
    input logic [6:0] A,B,C,D,
    output logic [6:0] out
    );
    
    always_comb begin 
        case (sel)
            2'b00: out = A;
            2'b01: out = B;
            2'b10: out = C;
            2'b11: out = D;
        endcase
    end
endmodule
