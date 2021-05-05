`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 04.05.2021 17:49:39
// Design Name: 
// Module Name: counter_nbit
// 
//////////////////////////////////////////////////////////////////////////////////

module counter_nbit # (parameter N = 4) (
    input logic clk, reset,
    output logic [N-1:0] count
    );
    
    always_ff @(posedge clk) begin
        if (reset)
            // Operador asignación <= ejecuta en cadad canto positivo del clk. 
            count <= 0;
        else
            count <= count+1; 
    end
endmodule
