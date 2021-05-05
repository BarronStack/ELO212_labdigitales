`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 30.04.2021 14:03:09
// Design Name: 
// Module Name: sevenSeg_test
// 
//////////////////////////////////////////////////////////////////////////////////


module sevenSeg_test();
    
    logic [3:0] BCD_in;
    logic [6:0] sevenSeg;
    
    BCD_to_sevenSeg DUT(
        .BCD_in(BCD_in),
        .sevenSeg(sevenSeg)
    );
    
    initial begin
        BCD_in = 4'd0;
        #10
        BCD_in  = 4'd1;
        #10
        BCD_in = 4'd2;
        #10
        BCD_in = 4'd3;
        #10
        BCD_in = 4'd4;
        #10
        BCD_in = 4'd5;
        #10
        BCD_in  = 4'd6;
        #10
        BCD_in = 4'd7;
        #10
        BCD_in = 4'd8;
        #10
        BCD_in = 4'd9;
        #10
        BCD_in = 4'd10;
        #10
        BCD_in = 4'd11;
        #10
        BCD_in = 4'd12;
        #10
        BCD_in = 4'd13;
        #10
        BCD_in = 4'd14;
        #10
        BCD_in = 4'd15;
    end
endmodule
