`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 15:34:01
// Design Name: 
// Module Name: fib_test
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


module fib_test(
    );
    logic [3:0] BCD_in;
    logic fib;
    
    fib_rec DUT(
        .BCD_in(BCD_in),
        .fib(fib));
    
    initial begin
        BCD_in = 4'b0000;
        #5
        BCD_in = 4'b0001;
        #5
        BCD_in = 4'b0011;
        #5
        BCD_in = 4'b0110;
        #5
        BCD_in = 4'b1010;
        
    end 
endmodule
