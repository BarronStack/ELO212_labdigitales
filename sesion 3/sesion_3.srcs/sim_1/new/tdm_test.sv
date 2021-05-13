`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 21:33:39
// Design Name: 
// Module Name: tdm_test
// 
//////////////////////////////////////////////////////////////////////////////////

module tdm_test(
    );
    
    logic clk_in,reset,reset2,reset16,DecoderA,DecoderB,DecoderC,DecoderD;
    logic [6:0] out_sevenSeg;
    
    tdm_display DUT (
        .clk_in(clk_in),
        .reset(reset),
        .reset2(reset2),
        .reset16(reset16),
        .DecoderA(DecoderA),
        .DecoderB(DecoderB),
        .DecoderC(DecoderC),
        .DecoderD(DecoderD),
        .out_sevenSeg(out_sevenSeg)
    );
    
    always #5 clk_in = ~clk_in; 
    
    initial begin
        clk_in = 0;
        reset = 1;
        
        // Modifico el reset tras 10 unidades de tiempo para generar 2 frecuencias nuevas
        #10 
        reset = 0;
        reset2 = 1;
        reset16 = 1;
         
        // Dejo los reset de ambos contadores en HIGH para inicializar la cuenta en 0
        #20 
        reset2 = 0;
        // Tras 50 unidades de tiempo seteo los reset de ambos en LOW para que comienzen a contar
        #50 
        reset16 = 0;
    end
    
    
    
endmodule
