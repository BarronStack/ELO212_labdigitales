`timescale 1ns / 1ps


module RE_pollish_FSM #(parameter WIDTH = 16)(
    input logic     clk,
    input logic     reset,
    input logic     DataDebouncedIn,

    output logic    out_LoadOpA,
    output logic    out_LoadOpB,
    output logic    out_LoadOpCode,
    output logic    out_updateRes,
    output logic    out_ToDisplaySel,
    output logic    [2:0]out_Status
    );


    enum logic[7:0] {Entering_OpA,
    Load_OpA,
    Entering_OpB,
    Load_OpB,
    Entering_OpCode,
    Load_OpCode,
    Show_Result} state, next_state;


/*
Flip flop logic
*/
always_ff @( posedge clk ) begin : clk_things
    if (reset)  state <=  Entering_OpA;
    else        state <= next_state;
end

/*
Logic for state change
*/
always_comb begin
    next_state = state;
    case (state)
        Entering_OpA:
        begin
            if (DataDebouncedIn) next_state = Load_OpA;
        end 
        Load_OpA:
        begin
            next_state = Entering_OpB;
        end
        Entering_OpB:
        begin
            if (DataDebouncedIn) next_state = Load_OpB;
        end
        Load_OpB:
        begin
            next_state = Entering_OpCode;
        end
        Entering_OpCode:
        begin
            if(DataDebouncedIn) next_state = Load_OpCode;
        end
        Load_OpCode:
        begin
            next_state = Show_Result;
        end
        Show_Result:
        begin
            if (DataDebouncedIn) next_state = Entering_OpA;
        end
//        default: 
//        begin
//            next_state = next_state;
//        end
    endcase
end

/*
Logic for output management
*/
always_comb begin
    // default assignments
    out_LoadOpA           = 1'b0;
    out_LoadOpB           = 1'b0;
    out_LoadOpCode        = 1'b0;
    out_updateRes          = 1'b0;
    out_ToDisplaySel       = 1'b0;
    out_Status              = 1'b0;

    case (state)
        Entering_OpA:
        begin
            out_Status      = 0;
        end
        Load_OpA:
        begin
            out_LoadOpA     = 1'b1;
            out_Status      = 1;
        end
        Entering_OpB:
        begin
            out_Status      = 2;
        end
        Load_OpB:
        begin
            out_LoadOpB     = 1'b1;
            out_Status      = 3;
        end
        Entering_OpCode:
        begin
            out_Status      = 4;
        end
        Load_OpCode:
        begin
            out_LoadOpCode  = 1'b1;
            out_Status      = 5;
        end
        Show_Result:
        begin
            out_ToDisplaySel = 1'b1;
            out_Status      = 6;
        end
    endcase
end


endmodule
