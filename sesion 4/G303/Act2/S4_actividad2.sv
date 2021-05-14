`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 13.05.2021 02:10:09
// Design Name: 
// Module Name: S4_actividad2
// 
//////////////////////////////////////////////////////////////////////////////////

module S4_actividad2 #(parameter N = 4)(
    input logic clock, reset, load, dec, enable,
	input logic [N-1:0] load_value,
	output logic [N-1:0] counterN
    );
    
    counter_nbit #(.N(N)) DUT(
        .clock(clock),
        .reset(reset),
        .load(load),
        .enable(enable),
        .dec(dec),
        .load_value(load_value),
        .count(counterN)
    );
    
endmodule