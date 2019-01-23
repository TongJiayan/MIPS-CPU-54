`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 19:44:17
// Design Name: 
// Module Name: DIV
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


module DIV(
	input [31:0] dividend,
	input [31:0] divisor,
	input start,
	input clock,
	input reset,
	output [31:0]q,
	output [31:0]r,
	output busy
);

wire [31:0] im_divisor;	//³ýÊý²¹Âë
wire [31:0] im_dividend;
wire [31:0] reg_q;
wire [31:0] reg_r;
assign im_dividend = dividend[31]?(~dividend+1):dividend;
assign im_divisor = divisor[31]?(~divisor+1):divisor;
assign q = (divisor[31]^dividend[31])?(~reg_q+1):reg_q;
assign r = (dividend[31])?(~reg_r+1):reg_r;
DIVU divu_inst(im_dividend,im_divisor,start,clock,reset,reg_q,reg_r,busy);
endmodule
