`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Create Date: 04.05.2021 17:51:15
// Design Name: 
// Module Name: top_module2
//
//////////////////////////////////////////////////////////////////////////////////


module top_module2(
    input logic clk, reset,
    output logic [3:0] count4, 
    output logic [4:0] count5,
    output logic [7:0] count8
    );
    
    counter_nbit #(
        .N(4)
    ) DUT1(
        .clk(clk),
        .reset(reset),
        .count(count4)
    );
    
    counter_nbit #(
        .N(5)
    ) DUT2(
        .clk(clk),
        .reset(reset),
        .count(count5)
    );
    
    counter_nbit #(
        .N(8)
    ) DUT3(
        .clk(clk),
        .reset(reset),
        .count(count8)
    );

endmodule
