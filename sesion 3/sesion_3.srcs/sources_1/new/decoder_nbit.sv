`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:31:19
// Design Name: 
// Module Name: decoder_nbit
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder_nbit #(parameter N = 2)(
    input logic [N-1:0] inDecoder,
    output logic [2**N-1:0] outDecoder
    );

    always_comb begin
        outDecoder = 1'b1 << inDecoder ;
    end
endmodule
