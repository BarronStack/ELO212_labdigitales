`timescale 1ns / 1ps

module mux #(parameter width = 16)(
    input logic  sel,
    input   logic [width - 1:0] A,B,
    output  logic [width - 1:0] out
    );
    
    always_comb begin 
        case (sel)
            1'b0: out = A;
            1'b1: out = B;
        endcase
    end
endmodule

