`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 30.04.2021 13:47:39
// Design Name: 
// Module Name: BCD_to_sevenSeg

//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////



module BCD_to_sevenSeg(
    input logic [3:0] BCD_in,
    output logic [6:0] sevenSeg
    );
    
    always_comb begin
        case(BCD_in)
            4'd0: sevenSeg = 7'b1111110; 
            4'd1: sevenSeg = 7'b0110000;
            4'd2: sevenSeg = 7'b1101101;
            4'd3: sevenSeg = 7'b1111001;
            4'd4: sevenSeg = 7'b0110010;
            4'd5: sevenSeg = 7'b1011011;
            4'd6: sevenSeg = 7'b1011111;
            4'd7: sevenSeg = 7'b1110000;
            4'd8: sevenSeg = 7'b1111111;
            4'd9: sevenSeg = 7'b1111011;
            default: sevenSeg = 7'b0000000;
        endcase
    end
endmodule