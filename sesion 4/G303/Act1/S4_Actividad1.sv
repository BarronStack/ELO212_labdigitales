`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2021 20:42:01
// Design Name: 
// Module Name: S4_Actividad1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Segments = {CA, CB, CC, CD, CE, CF, CG}
// Anodos   = {AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0}

module S4_actividad1 (
	input  logic [31:0] BCD_in,
	input  logic clock, reset,
	output logic [6:0] segments, 
	output logic [7:0] anodos   
);

// Implementación del sistema 
logic [2:0] signal;
logic [3:0] BCD;
logic [7:0] catodos;

assign anodos = ~catodos;

counter_nbit #(.N(3)) DUT1(
    .clk(clock),
    .reset(reset),
    .count(signal) 
);

decoder_nbit #(.N(3)) DUT2 (
    .inDecoder(signal),
    .outDecoder(catodos)
);

mux DUT3(
    .sel(signal),
    .A(BCD_in[3:0]),
    .B(BCD_in[7:4]),
    .C(BCD_in[11:8]),
    .D(BCD_in[15:12]),
    .E(BCD_in[19:16]),
    .F(BCD_in[23:20]),
    .G(BCD_in[27:24]),
    .H(BCD_in[31:28]),
    .out(BCD)
);

BCD_to_sevenSeg DUT4(
    .BCD_in(BCD),
    .sevenSeg(segments)
);

endmodule
