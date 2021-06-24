`timescale 1ns / 1ps


module semaforo(
    input logic clk, reset, TA, TB,
    output logic LA, LB
    );


    localparam YELLOW   = 3'b001;
    localparam RED      = 3'b010;
    localparam GREEN    = 3'b100;

// Codificaci�n de cada estado
    enum logic [3:0] {S0, S1, S2, S3} state, next_state;

always_ff @( posedge clk ) begin 
    if(reset) 
        state <= S0;
    else 
        state <= next_state;
end

always_comb begin
    case (state)
        S0: begin
            if(TA) next_state = S0;
            else next_state = S1;
        end
        S1: next_state = S2; // Inconditional state
        S2: begin
            if(TB) next_state = S2;
            else next_state = S3;
        end
        S3: next_state = S0;
        default: next_state = S0;
    endcase
end

// output 
always_comb begin 
    case(S0)
        S0: begin
            LA = GREEN;
            LB = RED;
        end
        S1: begin
            LA = YELLOW;
            LB = RED;
        end
        S2: begin
            LA = RED;
            LB = GREEN;
        end
        S3: begin
            LA = RED;
            LB = YELLOW;
        end
        default:begin
            LA = GREEN;
            LB = RED;
        end
        
    endcase
end


endmodule

