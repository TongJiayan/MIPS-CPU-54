`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 17:49:59
// Design Name: 
// Module Name: countZero
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


module countZero(
    input [31:0] data,
    output [31:0] count
    );
    reg [31:0] count_tmp=0;
    assign count = count_tmp;
    reg flag;
    integer i;
    always @(*) 
    begin
        flag=1'b0;
        count_tmp=0;
        for(i=31;i>=0;i=i-1)
        begin
            if(data[i]==1'b1)
                flag=1'b1;
            else if(flag==1'b0 && data[i]==1'b0)
            begin
                count_tmp=count_tmp+1;    
            end
        end
    end
endmodule