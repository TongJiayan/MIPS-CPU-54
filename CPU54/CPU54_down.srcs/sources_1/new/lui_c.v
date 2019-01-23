`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:27:04
// Design Name: 
// Module Name: lui_c
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

module lui_c(b,r,zero,negative);
    input [31:0] b;
    output [31:0] r;
    output zero;
    output negative;

    assign r={b[15:0],16'b0}; 
    assign zero=(r==32'h0)?1'b1:1'b0;
    assign negative=(r[31]==1'b1)?1'b1:1'b0;
endmodule
