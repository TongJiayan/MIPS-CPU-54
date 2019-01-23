`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 12:30:29
// Design Name: 
// Module Name: instmem
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

module instmem(
    input im_ena,		//高电平有效，可读写；
    input [9:0] address,	//由pcreg传入的指令地址
    output reg [31:0] instruction	//读出的指令
    );
    wire [9:0] addr_tmp;  //除以4
    assign addr_tmp=address>>>2;
	reg [31:0] reg_inst[0:1023];
	integer i;
	initial			//初始化都为0
	begin
		for(i=0;i<32;i=i+1)
            reg_inst[0]=32'h0;
            reg_inst[1]=32'h0;
            reg_inst[2]=32'h0;
            reg_inst[3]=32'h0;
            reg_inst[4]=32'h0;
            reg_inst[5]=32'h0;
            reg_inst[6]=32'h0;
            reg_inst[7]=32'h0;
            reg_inst[8]=32'h0;
            reg_inst[9]=32'h0;
            reg_inst[10]=32'h0;
            reg_inst[11]=32'h0;
            reg_inst[12]=32'h0;
            reg_inst[13]=32'h0;
            reg_inst[14]=32'h0;
            reg_inst[15]=32'h0;
            reg_inst[16]=32'h0;
            reg_inst[17]=32'h0;
            reg_inst[18]=32'h0;
            reg_inst[19]=32'h0;
            reg_inst[20]=32'h0;
            reg_inst[21]=32'h0;
            reg_inst[22]=32'h0;
            reg_inst[23]=32'h0;
            reg_inst[24]=32'h0;
            reg_inst[25]=32'h0;
            reg_inst[26]=32'h0;
            reg_inst[27]=32'h0;
            reg_inst[28]=32'h0;
            reg_inst[29]=32'h0;
            reg_inst[30]=32'h0;
            reg_inst[31]=32'h0;
	end

	always @(*) begin
		if (im_ena==1) begin
			// reset
			instruction=reg_inst[addr_tmp];
		end
		else begin
			instruction=32'hzzzz_zzzz;
		end
	end
endmodule
