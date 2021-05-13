`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 14:58:55
// Design Name: 
// Module Name: Test_fibbinario
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


module Test_fibbinario(
    );
    logic At, Bt, Ct, Dt, Yt;
    
    fibbinario test(
        .A(At),
        .B(Bt),
        .C(Ct),
        .D(Dt),
        .Y(Yt)
    );
    
    initial begin
        At = 1'b0;          // Input 0000
        Bt = 1'b0;          // Output 1 si es fibbinairo
        Ct = 1'b0;
        Dt = 1'b0;
        
        #5
        At = 1'b1;          // Input 1010
        Ct = 1'b1;          // Output 1 si es fibbinario
    
        #5
        Bt = 1'b1;          // Input 1110 
                            // Output 0 no es fibbinario
        #5
        At = 1'b0;          // Input 0110
                            // Output 0 no es fibbinario
        #10
        Ct = 1'b0;          // Input 0100
                            // Output 1 si es fibbinario
    end
endmodule
