`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 30.04.2021 16:56:00
// Design Name: 
// Module Name: fib_rec
// 
//////////////////////////////////////////////////////////////////////////////////

module fib_rec(
    input logic [3:0] BCD_in,   // BCD 8421 INPUT
    output logic fib            // High if is fibbinary
    );
    
    always_comb begin
        if(BCD_in == 4'd0 || BCD_in == 4'd1 || BCD_in == 4'd2 || BCD_in == 4'd4 || BCD_in == 4'd5 || BCD_in == 4'd8 || BCD_in == 4'd9 || BCD_in == 4'd10)
            fib = 1;
        else 
            fib = 0; 
    end
endmodule
