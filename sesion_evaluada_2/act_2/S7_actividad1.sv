`timescale 1ns / 1ps


module S7_actividad2 #(parameter N_DEBOUNCER = 10)(
    input logic             clk,
    input logic             resetN, // To debounce signal
    input logic             Enter,
    input logic             Undo,   // Now, we have an undo signal that must go in into the pollish FSM
    input logic [15:0]      DataIn, // To alu

    output logic [15:0]     ToDisplay,
    output logic [3:0]      Flags,
    output logic [2:0]      Status
    );

	logic PB_pressed_status_enter;   // clean and synchronized pulse for button pressed
	logic PB_pressed_pulse_enter;    // high if button is pressed
	logic PB_released_pulse_enter;    // clean and synchronized pulse for button released


    /*
    Adding debouncer of the UNDO signal
    */

    logic PB_pressed_status_undo;   // clean and synchronized pulse for button pressed
	logic PB_pressed_pulse_enter_undo;    // high if button is pressed
	logic PB_released_pulse_undo;    // clean and synchronized pulse for button released

    assign resetN_neg = ~resetN;
    localparam width = 16;

    // Debounce the resetN input
    debouncer_FSM #(.DELAY(1)) dummy_debouncer (
        .clk(clk),
        .rst(resetN_neg),
        .PB(Enter),
        .PB_pressed_status(PB_pressed_status_enter),
        .PB_pressed_pulse(PB_pressed_pulse_enter),
        .PB_released_pulse(PB_released_pulse_enter)
    );

    debouncer_FSM #(.DELAY(1)) dummy_debouncer_forundo (
        .clk(clk),
        .rst(resetN_neg),
        .PB(Undo),
        .PB_pressed_status(PB_pressed_status_undo),
        .PB_pressed_pulse(PB_pressed_pulse_enter_undo),
        .PB_released_pulse(PB_released_pulse_undo)
    );

    // Inputs to the ALU 
    logic toalu_loadopA;
    logic toalu_loadopB;
    logic toalu_loadopOp;

    logic toDisplaySel;
    
    // Enter the clean input to the pollish
    // updateRes must go to the ALU result register
    // ToDisplaySel to the display selector
    // Status to the status output 
    RE_pollish_FSM #(.WIDTH(width)) dummy_pollish_fsm (
        .DataDebouncedIn(PB_pressed_pulse_enter),
        .UndoDebouncedIn(PB_pressed_pulse_enter_undo),
        .clk(clk),
        .reset(resetN_neg),
        .out_LoadOpA(toalu_loadopA),
        .out_LoadOpB(toalu_loadopB),
        .out_LoadOpCode(toalu_loadopOp),

        .out_Status(Status),
        .out_ToDisplaySel(toDisplaySel),
        .out_updateRes(afteralu_updateRes)
    );

    // Create each register for the ALU
    // A, B, OpCode
    // Registro para salida de la ALU
    logic [width:0] out_reg_A;
    logic [width:0] out_reg_B;
    logic [1:0] out_reg_Op;
    registro #(.N(width)) reg_A (
        .clk(clk),
        .reset(resetN_neg),
        .load(toalu_loadopA),
        .In(DataIn),
        .Out(out_reg_A)
    );

    registro #(.N(width)) reg_B (
        .clk(clk),
        .reset(resetN_neg),
        .load(toalu_loadopB),
        .In(DataIn),
        .Out(out_reg_B)
    );

    registro #(.N(2)) reg_Op (
        .clk(clk),
        .reset(resetN_neg),
        .load(toalu_loadopOp),
        .In(DataIn),
        .Out(out_reg_Op)
    );


    // Instanciate the alu
    ALU_ref #(.C_WIDTH(width)) dummy_alu_ref(
        .A(out_reg_A),
        .B(out_reg_B),
        .OpCode(out_reg_Op),
        .Result(alu_result),
        .Status(alu_flags)
    );

    // Output of alu must go in to a register, so create the cable
    logic [width-1:0] alu_result;
    logic [3:0] alu_flags;
    logic afteralu_updateRes;
    logic afteralu_Result;
    logic to_displaySelector;

    registro #(.N(width)) reg_result (
        .clk(clk),
        .reset(resetN_neg),
        .load(afteralu_updateRes),
        .In(alu_result),
        .Out(to_displaySelector)
    );

    
    registro #(.N(4)) reg_flags (
        .clk(clk),
        .reset(resetN_neg),
        .load(afteralu_updateRes),
        .In(alu_flags),
        .Out(Flags)
    );




endmodule

