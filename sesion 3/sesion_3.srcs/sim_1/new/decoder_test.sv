`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 20:33:37
// Design Name: 
// Module Name: decoder_test
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


module decoder_test(
    );
    
    logic [2:0] in;
    logic [7:0] out;
    
    decoder_nbit #(.N(3)) DUT (
        .inDecoder(in),
        .outDecoder(out)
    );
    
    initial begin
    in = 3'b000;
    #10
    in = 3'b001;
    #10
    in = 3'b010;
    #10
    in = 3'b011;
    #10
    in = 3'b100;
    #10
    in = 3'b101;
    #10
    in = 3'b110;
    #10
    in = 3'b111;
    #10
    in = 3'b000;
    end
endmodule
