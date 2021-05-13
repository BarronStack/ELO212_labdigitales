`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 30.04.2021 16:32:57
// Design Name: 
// Module Name: top_module
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    input logic clk, reset,
    output logic fib,on,
    output logic [6:0] sevenSeg 
    );
    
    logic [3:0] count;
    
    assign on = 1;
    
    counter_4bit DUT1(
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    fib_rec DUT2(
        .BCD_in(count),
        .fib(fib)
    );
   
    BCD_to_sevenSeg DUT3(
        .BCD_in(count),
        .sevenSeg(sevenSeg)
    );
endmodule