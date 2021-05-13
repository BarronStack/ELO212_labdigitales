`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2021 15:51:45
// Design Name: 
// Module Name: counter_test
// 
//////////////////////////////////////////////////////////////////////////////////
module counter_test(
    );

    logic clk, reset;
    logic [3:0] count4;
    logic [4:0] count5;
    logic [7:0] count8;
    
    top_module2 DUT(
        .clk(clk),
        .reset(reset),
        .count4(count4),
        .count5(count5),
        .count8(count8)
    );
    
    // Genera la señal del reloj
    always #5 clk = ~clk;  
    
    initial begin
        clk = 0;
        reset = 1;
        
        // Modifico el reset tras 10 unidades de tiempo
        #10 reset = 0; 
        
        #30 reset = 1;
        #10 reset = 0;
    end
endmodule
