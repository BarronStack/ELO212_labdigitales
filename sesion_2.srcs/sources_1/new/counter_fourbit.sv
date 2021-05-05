`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 30.04.2021 15:04:56
// Design Name: 
// Module Name: counter_fourbit
// 
//////////////////////////////////////////////////////////////////////////////////

module counter_4bit(
    input logic clk, reset,
    output logic [3:0] count
    );
    
    always_ff @(posedge clk) begin
        if (reset)
            // Operador asignación <= ejecuta en cadad canto positivo del clk. 
            count <= 4'b0;
        else
            count <= count+1; 
    end
endmodule

/*
Si bien puede utilizarse el operador asignación = dentro de un bloque always
causa que las asignaciones se realizen de manera secuencial y no paralela 
como con <=

Esto implica circuitos más lentos. No se usan en circuitos sintetizados. 
*/ 