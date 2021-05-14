`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 13.05.2021 02:12:53
// Design Name: 
// Module Name: counter_nbit
// 
//////////////////////////////////////////////////////////////////////////////////
/*
reset
- 1 / contador a 0
- 0 / contador propaga

load
- 1 / contador a load_value
- 0 / contador continua con normalidad

enable
- 1 / contador opera aumentando-decrementando 
- 0 / contador en pausa

dec
- 1 / contador dismuniye el valor
- 0 / contador aumenta el valor
*/
//////////////////////////////////////////////////////////////////////////////////
module counter_nbit # (parameter N = 4) (
    input logic clock, reset, load, dec, enable,
    input logic [N-1:0] load_value,
    output logic [N-1:0] count
    );
    
    always_ff @(posedge clock) begin
        // Chequeo si reset == 1 para setear contador en cero 
        if (reset)
            count <= 0;
            // Chequeo si load == 1 para cargar el contador a load_value 
        else if (load) 
                count <= load_value;
                // Chequeo si enable == 1 para mantener funcionando el contador
            else if (enable) begin
                    if (dec)
                        count <= count - 1;
                    else
                        count <= count + 1;
                end
                else
                    count <= count;
    end
endmodule


/*
        if (reset) 
            count <= 0;
        else
            count <= count+1; 


*/