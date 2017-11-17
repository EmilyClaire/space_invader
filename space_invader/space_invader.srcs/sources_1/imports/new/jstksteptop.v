`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent
// Engineer: Kaitlyn Franz
// 
// Create Date: 01/26/2016 10:10:29 AM
// Design Name: PmodJSTKservocontrol
// Module Name: jstksteptop
// Project Name: claw
// Target Devices: Basys 3
// Tool Versions: 2015.4
// Description: This project takes input from the pmodJSTK and moves
// two servos accordingly. It also has two switches to enable each
// of the servos individually. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jstksteptop(
    input clk,
    input rst,
    input [1:0] sw_en,
    input [3:3] sw,
    output jstk_input_ss_0,
    input jstk_input_miso_2,
    output jstk_input_sclk_3,
    output [3:0] an,
    output [6:0] seg,
    output [3:0] signal_x,
    output [3:0] signal_y
    
    
    );
    
    // wire to connect the joystick data bewtween the Joystick 
    // interface and the decoder
    wire [9:0] x_data_net, y_data_net;
    
    // wire to connect the direction from the decoder to the 
    // Servo controller
    wire [1:0] x_direction_net, y_direction_net;
    
    // Instatiation of a joystick controller
    // connects the SPI connections to Pmod 
    // connector JA. Outputs the joystick values
    // to the seven segment display. Outputs the joystick 
    // data.
    PmodJSTK_Demo joystick_input(
        .CLK(clk),
        .RST(rst),
        .MISO(jstk_input_miso_2),
         .SW(sw),
        .SS(jstk_input_ss_0),
        .SCLK(jstk_input_sclk_3),
         .AN(an),
         .SEG(seg),
         .x_data(x_data_net),
         .y_data(y_data_net)
        );
        
    // Decoder that decodes the joystick data into 
    // the x and y direction signals.    
    jstk_data_decoder decode(
        .x_data(x_data_net),
        .y_data(y_data_net),
        .x_direction(x_direction_net),
        .y_direction(y_direction_net)
        );
        
    // Pmod step interface for the X direction.
    // Enable is connected to switch 0, and outputs to 
    // Pmod header JB.
    pmod_step_interface x (
        .clk(clk),
        .rst(rst),
        .direction(x_direction_net),
        .en(sw_en[0]),
        .signal_out(signal_x)
        );
    
    // Pmod step interface for the Y direction.
    // Enable is connected to switch 1, and outputs to 
    // Pmod header JC.
    pmod_step_interface y(
        .clk(clk),
        .rst(rst),
        .direction(y_direction_net),
        .en(sw_en[1]),
        .signal_out(signal_y)
        );      
endmodule
