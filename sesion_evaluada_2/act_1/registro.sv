`timescale 1ns / 1ps


module registro #(parameter N = 8)(
    input logic clk, reset, load,
    input logic [N-1:0] In,
    output logic [N-1:0] Out
    );

    always_ff @( posedge clk ) begin
        if(reset) Out <= 'b0;
        else if(load) Out <= In;
    end
endmodule
