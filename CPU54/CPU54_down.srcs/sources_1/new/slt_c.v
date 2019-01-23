`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:24:26
// Design Name: 
// Module Name: slt_c
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


module slt_c(a,b,aluc,r,zero,negative);
    input [31:0] a;
    input [31:0] b;
    output reg [31:0] r;
    input [3:0] aluc;
    output zero;
    output reg negative;

    assign zero=(a==b)?1'b1:1'b0;
    
    always@ (*)
    begin
        case(aluc)
        4'b1011:begin
            if(a[31]^b[31]==0)//���������Ƚϻ����������Ƚ�
                begin
                    negative=(a<b)?1'b1:1'b0;
                    r=(a<b)?1'b1:1'b0;
                end
            else if(a[31]==1&&b[31]==0)//a������b����
                begin
                    negative=1'b1;  
                    r=1;
                end
            else if(a[31]==0 && b[31]==1)//a������b����
                begin
                    negative=1'b0;
                    r=0;
                end
            else    
                ;
        end//�з���
        
        4'b1010:begin
            r=(a<b)?32'h0000_0001:32'h0;
            negative=1'b0;
        end//�޷���
        endcase
    end    
endmodule
