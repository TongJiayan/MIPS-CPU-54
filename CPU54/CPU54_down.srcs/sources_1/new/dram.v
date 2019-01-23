`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 12:36:05
// Design Name: 
// Module Name: dram
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


module dram(
    input clk_in,//�½��ش���д��������wena��Чʱ��д
	input reset,
    input wena,//�ߵ�ƽ��Ч
    input [1:0] DM_W_BH,//д��һ���ֽڣ���2���ֽڵ�ѡ���ź�
    input [2:0] BH_sel,//��ȡ����ʱ��ѡ�����B,H��BU,HU����W
    input [31:0] addr,
    input [31:0] data_in,
    output [31:0] data_out
    );
    reg [31:0]dataram[0:1023];
    reg [31:0] data_out_tmp;
    reg [7:0] tmp_8;
    reg [15:0] tmp_16;
    assign data_out=data_out_tmp;

    always @(*)  
    begin
        if (BH_sel[2]==0)//LW
        begin
            data_out_tmp=dataram[addr];
        end
            
        else if (BH_sel[1]==0)
        begin
            tmp_8=dataram[addr][7:0];
            if (BH_sel[0]==1'b0)//LB
            begin
                data_out_tmp={{24{tmp_8[7]}},tmp_8};
            end
            else //LBU
            begin
                data_out_tmp={24'b0,tmp_8};   
            end
        end

        else 
        begin
            tmp_16=dataram[addr][15:0];
            if(BH_sel[0]==1'b0)//LH
            begin
                data_out_tmp={{16{tmp_16[15]}},tmp_16};
            end
            else 
            begin
                data_out_tmp={16'b0,tmp_16};    
            end
        end
    end

    always @(negedge clk_in or posedge reset) 
    begin
        if(reset==1'b1)
            begin
                dataram[0]=32'h0;
                dataram[1]=32'h0;

            end
        else if (wena==1'b1) 
        begin
            // write
            if (DM_W_BH[1]==1'b0)
                dataram[addr]=data_in;
            else if(DM_W_BH[0]==1'b0)//SB,��data_in�ĵ�8λ����dataram[addr]
                dataram[addr][7:0]=data_in[7:0];
            else//SH,��data_in�ĵ�16λ,��dataram[addr]
                dataram[addr][15:0]=data_in[15:0];
        end
    end
endmodule
