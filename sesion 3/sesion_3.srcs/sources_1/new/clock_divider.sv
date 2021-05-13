`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 06.05.2021 00:30:04
// Design Name: 
// Module Name: clock_divider
//
//////////////////////////////////////////////////////////////////////////////////

module clock_divider #(parameter COUNTER_MAX = 100) (
    input logic clk_in,reset,
    output logic clk_out
    );
    
    // Localparam permite definir ctes internas al modulo a trav�s de expresiones matem�ticas complejas
    // $ representa una llamada a funciones del sistema y no son sintetizables
    
    // Al momento de sintetizar el c�digo estos valores se convierten en ctes dentro del m�dulo
    // y pueden ser utilizadas por par�metros del dise�o interno del m�dulo.
      
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter = 'd0;
    
    // Cada vez que el contador llegue a su valor m�ximo se resetea
    // el contador y se invierte el valor del reloj de salida. 
        
    always_ff @(posedge clk_in) begin
        if (reset == 1'b1) begin
            // Reset sincr�nico - setear contador y salida en valores conocidos
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
