`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 06.05.2021 21:21:31
// Design Name: 
// Module Name: tdm_display
// 
//////////////////////////////////////////////////////////////////////////////////

module tdm_display(
    input logic clk_in,reset,reset16,reset2,
    output logic DecoderA,DecoderB,DecoderC,DecoderD,
    output logic [6:0] out_sevenSeg
    );
    
    logic clk_out_1;
    logic [15:0] counter_16;
    logic [1:0] counter_2;
    logic [3:0] outDecoder;
    logic [6:0] sevenSeg1,sevenSeg2,sevenSeg3,sevenSeg4;
    
    assign DecoderA = outDecoder[3];
    assign DecoderB = outDecoder[2];
    assign DecoderC = outDecoder[1];
    assign DecoderD = outDecoder[0];
    
    // Primer divisor de frecuencia que conecta al contador 16Bits
    new_clock_divider #(
    .FIn(100),
    .FOut(25)
    ) CLK_1 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_1)
    );

    // Contador de 16bits
    counter_nbit #(
        .N(16)
    ) counter_16bit (
        .clk(clk_out_1),
        .reset(reset16),
        .count(counter_16)
    );
    
    // Contador de 16bits
    counter_nbit #(
        .N(2)
    ) counter_2bit (
        .clk(clk_in),
        .reset(reset2),
        .count(counter_2)
    );    
    
    // Decodificador N bits
    decoder_nbit decoder (
        .inDecoder(counter_2),
        .outDecoder(outDecoder)
    );
    
    // 4 bits que generan información al primer display 
    BCD_to_sevenSeg display1(
        .BCD_in(counter_16[3:0]),
        .sevenSeg(sevenSeg1)
    );
    
    // 4 bits que generan información al segundo display 
    BCD_to_sevenSeg display2(
        .BCD_in(counter_16[7:4]),
        .sevenSeg(sevenSeg2)
    );
    
    // 4 bits que generan información al tercer display 
    BCD_to_sevenSeg display3(
        .BCD_in(counter_16[11:8]),
        .sevenSeg(sevenSeg3)
    );
    
    // 4 bits que generan información al cuarto display 
    BCD_to_sevenSeg display4(
        .BCD_in(counter_16[15:12]),
        .sevenSeg(sevenSeg4)
    );
    
    mux multiplex (
        .A(sevenSeg1),
        .B(sevenSeg2),
        .C(sevenSeg3),
        .D(sevenSeg4),
        .sel(counter_2),
        .out(out_sevenSeg)
    );
endmodule
