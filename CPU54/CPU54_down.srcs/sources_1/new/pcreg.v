`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:53:07
// Design Name: 
// Module Name: pcreg
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


module pcreg(
    input clk_in,
    input reset,//�ߵ�ƽ��Ч����λ
    input busy,//��muldiv����������busy��Чʱ��pcreg�Ķ���Ч
    input [31:0]data_in,
    output reg [31:0]data_out
    );
	
	always @(posedge clk_in or posedge reset) begin //�첽��reset�ߵ�ƽ����
		if (reset==1'b1) begin
			// reset
			data_out<=32'h0040_0000;
			//data_out<=32'h0000_0000;
		end
		else if(busy==1'b0)
		begin
			data_out<=data_in;
		end
	end
endmodule
