`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 06.05.2021 00:40:37
// Design Name: 
// Module Name: clk_test
// 
//////////////////////////////////////////////////////////////////////////////////
//
// Ejemplo a partir de una señal T = 10ns / F = 100MHz con COUNTER_MAX = 5 generaba nueva señal de T = 100ns / F = 10MHz
// Por ende se puede desprender que COUNTER_MAX = (CLK_IN / CLK_OUT) / 2
//    
// El contador representa la cantidad de periodos del clk_in deben transcurrir para que cambie el canto del reloj
//
//  CLK_out = 50MHz / COUNTER_MAX = (100MHz / 2 * 50MHz) = 1
//  CLK_out = 30MHz / COUNTER_MAX = (100MHz / 2 * 30MHz) = 1.6 
//  CLK_out = 10MHz / COUNTER_MAX = (100MHz / 2 * 10MHz) = 5
//  CLK_out = 1MHz  / COUNTER_MAX = (100MHz / 2 * 1MHz)  = 50

// Frecuencia in / Frecuencia out * 2 = COUNTER_MAX
// Frecuencia in / COUNTER MAX * 2 = Frecuencia out 
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_test(
    );
    logic clk_in,reset,clk_out_50M,clk_out_30M,clk_out_10M,clk_out_1M;
    
    top_module DUT(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out_50M(clk_out_50M),
        .clk_out_30M(clk_out_30M),
        .clk_out_10M(clk_out_10M),
        .clk_out_1M(clk_out_1M)
    );

    // Genera la señal del reloj entrante 
    // Periodo de la señal = 2 veces #N
    always #5 clk_in = ~clk_in;  
    
    initial begin
        clk_in = 0;
        reset = 1;
        
        // Modifico el reset tras 20 unidades de tiempo
        #10 reset = 0; 
    end
endmodule