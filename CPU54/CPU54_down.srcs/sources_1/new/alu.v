`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:30:47
// Design Name: 
// Module Name: alu
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


module alu(a,b,aluc,r,zero,carry,negative,overflow);
    input [31:0] a;
    input [31:0] b;
    input [3:0] aluc;
    output reg [31:0] r;//无符号，如果定义成有符号，会把高位当成标志位处理，没法正确处理无符号相加
    output reg zero=0;
    output reg carry=0;
    output reg negative=0;
    output reg overflow=0;
    
    wire [7:0]cf;
    wire [7:0]zf;
    wire [7:0]nf;
    wire [7:0]of;
    wire [31:0]result[0:7];
    
    addsub32 as(a,b,aluc,result[0],zf[0],cf[0],nf[0],of[0]);
    and_c ad(a,b,result[1],zf[1],nf[1]);
    bshifter32_carry shifer(a,b,aluc,result[2],zf[2],cf[2],nf[2]);
    lui_c lui(b,result[3],zf[3],nf[3]);
    nor_c n(a,b,result[4],zf[4],nf[4]);
    or_c o(a,b,result[5],zf[5],nf[5]);
    slt_c s(a,b,aluc,result[6],zf[6],nf[6]);
    xor_c x(a,b,result[7],zf[7],nf[7]);
    
    always@(*)
    begin
        casez(aluc)
        4'b00??:begin
            r=result[0];
            carry=cf[0];
            zero=zf[0];
            negative=nf[0];
            overflow=of[0];
        end
        
        4'b0100:begin//AND
            r=result[1];
           // carry=0;
            zero=zf[1];
            negative=nf[1];
            //overflow=0;
        end
        
        4'b11??:begin//移位
            r=result[2];
            carry=cf[2];
            zero=zf[2];
            negative=nf[2];
            //overflow=0;            
        end
        
        4'b100?:begin//lui
            r=result[3];
            //carry=0;
            zero=zf[3];
            negative=nf[3];
            //overflow=0;            
        end
        
        4'b0111:begin//nor
            r=result[4];
            //carry=0;
            zero=zf[4];
            negative=nf[4];
            //overflow=0;            
        end
        
        4'b0101:begin//or
            r=result[5];
            //carry=0;
            zero=zf[5];
            negative=nf[5];
            //overflow=0;           
        end
        
        4'b101?:begin
            r=result[6];
            //carry=0;
            zero=zf[6];
            negative=nf[6];
            //overflow=0;            
        end
        
        4'b0110:begin
            r=result[7];
            //carry=0;
            zero=zf[7];
            negative=nf[7];
            //overflow=0;            
        end
       
        default:
            ;
        endcase
    end
endmodule

