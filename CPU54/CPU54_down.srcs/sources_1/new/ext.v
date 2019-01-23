`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 12:35:30
// Design Name: 
// Module Name: ext
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


module ext5(
    input [4:0] imm5,
    input sext,
    output [31:0] r
    );
	assign r = sext?{{27{imm5[4]}},imm5}:{{27'b0},imm5};
endmodule

module ext16(
	input [15:0] imm16,
	input sext,
	output [31:0] r
	);
	assign r = sext?{{16{imm16[15]}},imm16}:{{16'b0},imm16};
endmodule

module ext18(
	input [17:0] imm18,
	input sext,
	output [31:0] r
	);
	assign r = sext?{{14{imm18[17]}},imm18}:{{14'b0},imm18};
endmodule
