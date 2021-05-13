`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 12.05.2021 20:54:42
// Module Name: decoder_nbit
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder_nbit #(parameter N = 4)(
    input logic [N-1:0] inDecoder,
    output logic [2**N-1:0] outDecoder
    );

    always_comb begin
        outDecoder = 1'b1 << inDecoder ;
    end
endmodule
