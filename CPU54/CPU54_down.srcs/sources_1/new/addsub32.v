`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:29:43
// Design Name: 
// Module Name: addsub32
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

module addsub32(a,b,aluc,r,zero,carry,negative,overflow);
    input [31:0] a;
    input [31:0] b;
    input [3:0] aluc;
    output reg [31:0] r;
    output zero;
    output reg carry;
    output negative;
    output reg overflow;
    
    assign zero=(r==32'h0)?1'b1:1'b0;
    assign negative=(r[31]==1'b1)?1'b1:1'b0;
    always@(*)
    begin
        case(aluc)
        4'b0000:begin
            r=a+b;
            if(a[31]==1&&b[31]==1 || a[31]^b[31]==1&&r[31]==0)
                carry=1;
            else
                carry=0;
                overflow=0;
             //不影响此标志位的话，z？
        end//Addu
        
        4'b0010:begin
            r=a+b;
            if(a[31]^b[31]==0 && r[31]^a[31]==1)//正+正=负；负+负=正
                overflow=1;
            else
                overflow=0;
            carry=0;
        end//Add
        
        4'b0001:begin //subu
            r=a-b;
            if(a<b)
                carry=1;
            else
                carry=0;
            overflow=0;
        end//Subu
        
        4'b0011:begin
            r=a-b;
            if(a[31]^b[31]==1 && r[31]==b[31])//正-负=负  负-正=正
                overflow=1;
            else
                overflow=0;
            carry=0;
        end//Sub
        
        default:
            ;
      endcase
    end
endmodule
