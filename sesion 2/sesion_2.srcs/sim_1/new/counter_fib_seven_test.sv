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
    logic clk, reset, fib,on;
    logic [6:0] sevenSeg;
    
    top_module DUT(
        .clk(clk),
        .reset(reset),
        .fib(fib),
        .sevenSeg(sevenSeg),
        .on(on)
    );
    
    // Genera la señal del reloj
    always #10 clk = ~clk;  
    
    initial begin
        clk = 0;
        reset = 1;
        
        // Modifico el reset tras 20 unidades de tiempo
        #20 reset = 0; 
        
    end
endmodule
