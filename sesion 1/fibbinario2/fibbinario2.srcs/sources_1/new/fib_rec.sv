`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 15:20:21
// Design Name: 
// Module Name: fib_rec
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

/*
Binario Decimal Fib
0000    0       1
0001    1       1
0010    2       1
0011    3       0
0100    4       1
0101    5       1
0110    6       0
0111    7       0
1000    8       1
1001    9       1
1010    10      1
1011    11      0
1100    12      0
1101    13      0
1110    14      0
1111    15      0
*/

module fib_rec(
    input logic [3:0] BCD_in ,
    output logic fib
    );
    
    always_comb begin
    if (BCD_in == 4'd0 || BCD_in == 4'd1 || BCD_in == 4'd2 || BCD_in == 4'd4 || BCD_in == 4'd5 || BCD_in == 4'd8 || BCD_in == 4'd9 || BCD_in == 4'd10)
        fib = 1;
    else
        fib = 0;    
    end
endmodule
