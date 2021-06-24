`timescale 1ns / 1ps


module top_module #(parameter N = 16)(
    input logic clk, reset, load_A, load_B, load_Op, updateRes,
    input logic [N-1:0] In,
    output logic[N/2 - 2 : 0]   Segments,
    output logic[N/2 - 1 : 0]   Anodes,
    output logic[3 : 0]   LEDs
 );

    logic [15:0] A,B, Result, tmp_Result;
    logic [1:0] OpCode;
    logic [3:0] Status;

    // Registro para entrada A

    registro #(.N(8)) reg_A(
        .clk(clk),
        .reset(reset),
        .load(load_A),
        .In(In),
        .Out(A)
    );
    // Registro para entrada B

    registro #(.N(8)) reg_B(
        .clk(clk),
        .reset(reset),
        .load(load_B),
        .In(In),
        .Out(B)
    );
    // Registro para OpCode
    registro #(.N(8)) reg_Op(
        .clk(clk),
        .reset(reset),
        .load(load_Op),
        .In(In),
        .Out(OpCode)
    );

    // Registros A y B y Opcode, se ingresa a Alu
    ALU_ref #(.C_WIDTH(N)) alu_inst (
        .A(A),
        .B(B),
        .OpCode(OpCode),
        .Result(tmp_Result),
        .Status(Status)
    );


    // Registro para salida de la ALU
    registro #(.N(4)) reg_status (
        .clk(clk),
        .reset(reset),
        .load(updateRes),
        .In(Status),
        .Out(LEDs)
    );

    registro #(.N(16)) reg_bcd(
        .clk(CLk),
        .reset(reset),
        .load(updateRes),
        .In(tmp_Result),
        .Out(Result)
    );

    // Ingreso al BCD
    S4_actividad1 Display(
        .BCD_in({16'b0,Result}),    
        .clock(clk),
        .reset(reset),
        .segments(Segments),
        .anodos(Anodes)
    );




    
endmodule
