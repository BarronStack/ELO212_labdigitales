`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2021 17:16:41
// Design Name: 
// Module Name: counter_fib_seven_test
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

module counter_fib_seven_test(
    );
    logic clk, reset, fib;
    logic [6:0] sevenSeg;
    
    top_module DUT(
        .clk(clk),
        .reset(reset),
        .fib(fib),
        .sevenSeg(sevenSeg)
    );
    
    // Genera la señal del reloj
    always #5 clk = ~clk;  
    
    initial begin
        clk = 0;
        reset = 1;
        
        // Modifico el reset tras 10 unidades de tiempo
        #10 reset = 0; 
        
    end
endmodule
