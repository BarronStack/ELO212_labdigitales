`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// 
// Create Date: 06.05.2021 12:35:11
// Design Name: 
// Module Name: new_clock_divider
// 
//////////////////////////////////////////////////////////////////////////////////

// Los parámetros FIn y FOut representan las frecuencias  

module new_clock_divider #(parameter FIn = 100 , FOut = 50) (
    input logic clk_in,reset,
    output logic clk_out
    );
    
    localparam COUNTER_MAX = FIn / (2 * FOut);
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter = 'd0;
    
    // Cada vez que el contador llegue a su valor máximo se resetea
    // el contador y se invierte el valor del reloj de salida. 
        
    always_ff @(posedge clk_in) begin
        if (reset == 1'b1) begin
            // Reset sincrónico - setear contador y salida en valores conocidos
            counter <= 'd0;
            clk_out <= 0; 
        end else if (counter == COUNTER_MAX -1) begin
            // Reset del contador e invierte salida
            counter <= 'd0;
            clk_out <= ~clk_out;    
        end else begin
            // Incrementa el contador y mantiene la salida con valor anterior
            counter <= counter + 'd1;
            clk_out <= clk_out;
        end
    end
endmodule
