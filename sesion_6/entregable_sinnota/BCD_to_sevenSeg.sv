`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Al trabajar con los displays de una tarjeta Nexys4DDR/NexysA7 los �nodos del segmento se encuentran
// invertidos por lo que para tanto encender cada display como cada uno de los segmentos del display
// deben estar en low para funcionar.
//////////////////////////////////////////////////////////////////////////////////

module BCD_to_sevenSeg(
    input logic [3:0] BCD_in,
    output logic [6:0] sevenSeg
    );
    
    // S�mbolos hexadecimal a representar en notaci�n BCD 8241 
    // 0 1 2 3 4 5 6 7 8 9 A b C d E F
    // Producto que en el display coincidirian may�sculas con n�meros b y d se representan como min�sculas 
    always_comb begin
        case(BCD_in)
            // Al igual que en casos anteriores se toma el output como
            // a b c d e f g  
            4'b0000: sevenSeg = 7'b0000001; // 0    0 0 0 0 0 0 1
            4'b0001: sevenSeg = 7'b1001111; // 1    1 0 0 1 1 1 1 
            4'b0010: sevenSeg = 7'b0010010; // 2    0 0 1 0 0 1 0
            4'b0011: sevenSeg = 7'b0000110; // 3    0 0 0 0 1 1 0
            4'b0100: sevenSeg = 7'b1001100; // 4    1 0 0 1 1 0 0
            4'b0101: sevenSeg = 7'b0100100; // 5    0 1 0 0 1 0 0
            4'b0110: sevenSeg = 7'b0100000; // 6    0 1 0 0 0 0 0
            4'b0111: sevenSeg = 7'b0001111; // 7    0 0 0 1 1 1 1
            4'b1000: sevenSeg = 7'b0000000; // 8    0 0 0 0 0 0 0
            4'b1001: sevenSeg = 7'b0001100; // 9    0 0 0 1 1 0 0
            4'b1010: sevenSeg = 7'b0001000; // A    0 0 0 1 0 0 0 
            4'b1011: sevenSeg = 7'b1100000; // b    1 1 0 0 0 0 0     
            4'b1100: sevenSeg = 7'b0110001; // C    0 1 1 0 0 0 1
            4'b1101: sevenSeg = 7'b1000010; // d    1 0 0 0 0 1 0
            4'b1110: sevenSeg = 7'b0110000; // E    0 1 1 0 0 0 0
            4'b1111: sevenSeg = 7'b0111000; // F    0 1 1 1 0 0 0 
            default: sevenSeg = 7'b1111111; // Off
        endcase
    end
endmodule
