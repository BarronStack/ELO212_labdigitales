`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 06.05.2021 11:32:24
// Design Name: 
// Module Name: top_module
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
    input logic clk_in,reset,
    output logic clk_out_50M,clk_out_30M,clk_out_10M,clk_out_1M
    );
    
    // CLK_out = 50MHz / COUNTER_MAX = (100MHz / 2 * 50MHz) = 1
    new_clock_divider #(
    .FIn(100),
    .FOut(50)
    ) CLK_50 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_50M)
    );
    
    // CLK_out = 30MHz / COUNTER_MAX = (100MHz / 2 * 30MHz) = 1.6 ~ 2
    new_clock_divider #(
    .FIn(100),
    .FOut(25)
    ) CLK_30 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_30M)
    );
    
    // CLK_out = 10MHz / COUNTER_MAX = (100MHz / 2 * 10MHz) = 5
    new_clock_divider #(
    .FIn(100),
    .FOut(10)
    ) CLK_10 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_10M)
    );
    
    
    // CLK_out = 1MHz  / COUNTER_MAX = (100MHz / 2 * 1MHz)  = 50    
    new_clock_divider #(
    .FIn(100),
    .FOut(1)
    ) CLK_1 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_1M)
    );    
    
    
    /*
    // CLK_out = 50MHz / COUNTER_MAX = (100MHz / 2 * 50MHz) = 1
    clock_divider #(.COUNTER_MAX(1)
    ) CLK_50 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_50M)
    );
    
    // CLK_out = 30MHz / COUNTER_MAX = (100MHz / 2 * 30MHz) = 1.6 ~ 2
    clock_divider #(.COUNTER_MAX(2)
    ) CLK_30 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_30M)
    );
    
    // CLK_out = 10MHz / COUNTER_MAX = (100MHz / 2 * 10MHz) = 5
    clock_divider #(.COUNTER_MAX(5)
    ) CLK_10 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_10M)
    );
    
    // CLK_out = 1MHz  / COUNTER_MAX = (100MHz / 2 * 1MHz)  = 50
    clock_divider #(.COUNTER_MAX(50)
    ) CLK_1 (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out_1M)
    );
    */
endmodule
