`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 19:12:45
// Design Name: 
// Module Name: DIVU
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


module DIVU(
	input [31:0] dividend,
	input [31:0] divisor,
	input start,
	input clock,
	input reset,
	output [31:0]q,
	output [31:0]r,
	output reg busy
);

wire [32:0]sub_add;	//加减法器
reg [4:0] count;	//循环次数
reg [31:0] reg_q;	//存放商,被除数
reg [31:0] reg_r;	//存放余数
reg [31:0] reg_b;	//存放除数
//reg busy2;
reg r_sign;			//余数符号，若为负，下次迭代加上除数；反之减去除数
assign sub_add = r_sign?({reg_r,q[31]}+{1'b0,reg_b}):({reg_r,q[31]}-{1'b0,reg_b});
assign r = r_sign?reg_r+reg_b:reg_r;
assign q = reg_q ;
always @(negedge clock or posedge reset) begin
	if (reset) begin      //reset高电平复位
		// reset
		count<=5'b0;
		busy<=0;
		//busy2<=0;
	end
	else begin
		//busy2<=busy;
		if(start)begin    //start低电平开始运算，初始化
			reg_r<=31'b0;
			r_sign<=0;
			reg_q<=dividend;
			reg_b<=divisor;
			count<=5'b0;
			busy<=1'b1;
		end
		else if(busy)begin
			reg_r<=sub_add[31:0];
			r_sign<=sub_add[32];
			reg_q<={reg_q[30:0],~sub_add[32]};
			count<=count+5'b1;
			if(count==5'b11111)busy<=0;   //结束除法运算
		end
	end
end
endmodule