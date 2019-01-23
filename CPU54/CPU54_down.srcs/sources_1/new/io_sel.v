`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 18:02:03
// Design Name: 
// Module Name: io_sel
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


module io_sel(
    input [31:0] addr,
	 //input cs,
	 input sig_w,
	 input sig_r,
	 output seg7_cs,
	 output switch_cs
    );
assign seg7_cs = (addr == 32'h10010000 && sig_w == 1) ? 1 : 0;
assign switch_cs = (addr == 32'h10010010 && sig_r == 1) ? 1 : 0;
//assign seg7_cs = (addr == 32'h10010000 && cs == 1 && sig_w == 1) ? 1 : 0;
//assign switch_cs = (addr == 32'h10010010 && cs == 1 && sig_r == 1) ? 1 : 0;
endmodule
