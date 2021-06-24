`timescale 1ns / 1ps

module counter_nbit #(parameter N = 4) (
    input logic clk, reset,
    output logic [N-1:0] count
    );
    
    // Posedge implica canto positivo o "de subida" del clock   
    always_ff @(posedge clk) begin
        if (reset)
            // Operador asignaci�n <= ejecuta en cadad canto positivo del clk. 
            count <= 0;
        else
            count <= count+1; 
    end
endmodule

