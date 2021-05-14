`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 13.05.2021 02:10:09
// Design Name: 
// Module Name: S4_actividad2
// 
//////////////////////////////////////////////////////////////////////////////////

module S4_actividad2(
    // CONSULTAR SI EL TOP MODULE DEBE SER PARAMETRIZADO TMB O NO
	input logic clock, reset, load, dec, enable,
	input logic [7:0] load_value,
	output logic [7:0] counterN
    );
    
    counter_nbit #(.N(8)) DUT(
        .clock(clock),
        .reset(reset),
        .load(load),
        .enable(enable),
        .dec(dec),
        .load_value(load_value),
        .count(counterN)
    );
    
endmodule