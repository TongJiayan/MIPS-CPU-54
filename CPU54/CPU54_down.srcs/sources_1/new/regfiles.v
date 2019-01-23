`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:21:01
// Design Name: 
// Module Name: regfiles
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

module regfile(
    input clk_in,//�½���д������
    input rst,//�����źţ��ߵ�ƽ��Ч�����мĴ������㣬�첽
    input we,//д�źţ��ߵ�ƽ��Ч
    input [4:0] raddr1,//�����ݵĵ�ַ1��Rs
    input [4:0] raddr2,//�����ݵĵ�ַ2��Rt
    input [4:0] waddr,//д���ݵĵ�ַ��Rd
    input [31:0] wdata,//д�������
    output [31:0] rdata1,//��ȡ������1
    output [31:0] rdata2//��ȡ������2
    );
    reg [31:0] array_reg [0:32];
    assign rdata1 = array_reg[raddr1];
    assign rdata2 = array_reg[raddr2];
    always @(posedge clk_in or posedge rst) 
    begin
        if (rst==1'b1) 
        begin
            // reset
            array_reg[0]=32'h0;
            array_reg[1]=32'h0;
            array_reg[2]=32'h0;
            array_reg[3]=32'h0;
            array_reg[4]=32'h0;
            array_reg[5]=32'h0;
            array_reg[6]=32'h0;
            array_reg[7]=32'h0;
            array_reg[8]=32'h0;
            array_reg[9]=32'h0;
            array_reg[10]=32'h0;
            array_reg[11]=32'h0;
            array_reg[12]=32'h0;
            array_reg[13]=32'h0;
            array_reg[14]=32'h0;
            array_reg[15]=32'h0;
            array_reg[16]=32'h0;
            array_reg[17]=32'h0;
            array_reg[18]=32'h0;
            array_reg[19]=32'h0;
            array_reg[20]=32'h0;
            array_reg[21]=32'h0;
            array_reg[22]=32'h0;
            array_reg[23]=32'h0;
            array_reg[24]=32'h0;
            array_reg[25]=32'h0;
            array_reg[26]=32'h0;
            array_reg[27]=32'h0;
            array_reg[28]=32'h0;
            array_reg[29]=32'h0;
            array_reg[30]=32'h0;
            array_reg[31]=32'h0;
            array_reg[32]=32'h0;
        end
        else if(we==1'b1) //д�ź���Ч
        begin
            if(waddr==5'b00000)
                array_reg[waddr]=32'h0;
            else
                array_reg[waddr]=wdata;
        end
    end
endmodule

