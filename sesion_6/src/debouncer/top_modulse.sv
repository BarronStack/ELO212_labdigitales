mescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2021 16:05:42
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(
	input 	logic clk,                 // base clock
	input 	logic rst,                 // global reset
	input 	logic PB,                  // raw asynchronous input from mechanical PB         
	output 	logic PB_pressed_status,   // clean and synchronized pulse for button pressed
	output  logic PB_pressed_pulse,    // high if button is pressed
	output  logic PB_released_pulse    // clean and synchronized pulse for button released
 );

    
    PB_Debouncer_FSM #(.DELAY(15)) dummy_debouncer (
        .clk(clk),
        .rst(rst),
        .PB(PB),
        .PB_pressed_status(PB_pressed_status),
        .PB_pressed_pulse(PB_pressed_pulse),
        .PB_released_pulse(PB_released_pulse)
    );
    /*
    
    PB_Debouncer_counter #(.DELAY(15)) dummy_debouncer2(
        .clk(clk),
        .rst(rst),
        .PB(PB),
        .PB_pressed_status(PB_pressed_status),
        .PB_pressed_pulse(PB_pressed_pulse),
        .PB_released_pulse(PB_released_pulse)
    );
    */
    
    
    
    

endmodule

