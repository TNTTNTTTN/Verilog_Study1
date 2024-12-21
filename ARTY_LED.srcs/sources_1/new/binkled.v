`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/19 13:46:43
// Design Name: 
// Module Name: binkled
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


module binkled(
    input clk,
    input [2:0] btn,
    output [3:0] led,
    output reg led4_r
    );

    reg [3:0] Dcounter = 4'b0000;
    reg [3:0] button;
    always @(posedge clk) begin
        button <= btn;
        led4_r = led4_r ^ (btn[1]& ~button[1]);
        if (btn[2] && ~button[2])
            Dcounter <= 4'b0000;
        else if (btn[0] && ~button[0])
            if (led4_r)
                Dcounter <= Dcounter - 4'b0001;
            else
                Dcounter <= Dcounter + 4'b0001;
    end   
    assign led = Dcounter;        
    
endmodule
