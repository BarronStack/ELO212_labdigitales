`timescale 1ns / 1ps

module decoder_nbit #(parameter N = 4)(
    input logic [N-1:0] inDecoder,
    output logic [2**N-1:0] outDecoder
    );

    always_comb begin
        outDecoder = 1'b1 << inDecoder ;
    end
endmodule


