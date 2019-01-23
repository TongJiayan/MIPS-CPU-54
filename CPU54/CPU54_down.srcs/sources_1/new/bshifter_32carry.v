`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:31:43
// Design Name: 
// Module Name: bshifter_32carry
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


module bshifter32_carry(a,b,aluc,r,zero,carry,negative);
    input [31:0] a;
    input [31:0] b;//b<<  >>  >>>a
    input [3:0] aluc;
    output reg [31:0] r;
    output zero;
    output reg carry;
    output negative;
    wire [4:0]tmp_a;
    
    assign zero=(r==32'h0)?1'b1:1'b0;
    assign negative=(r[31]==1'b1)?1'b1:1'b0;
    assign tmp_a=a[4:0];
    
    always@(*)
    begin
        casez(aluc)
        4'b1101:begin
            if(tmp_a!=0)
            begin
                r=b>>(tmp_a-1);
                carry=r[0];
                r=r>>1; 
            end  
            else
            begin
                r=b>>tmp_a;
                carry=r[0];        
            end     
        end//¬ﬂº≠”““∆
        
        4'b111?:begin
            if(tmp_a!=0)
            begin
                r=b<<(tmp_a-1);
                carry=r[31];
                r=r<<1;
            end
            else
            begin
                r=b<<tmp_a;
                carry=r[31];
            end
        end//◊Û“∆
        
        4'b1100:begin
            if(tmp_a!=0)
            begin
              case(tmp_a)
                 5'b00000:r=b;
                 5'b00001:r={b[31],b[31:1]};
                 5'b00010:r={{2{b[31]}},b[31:2]};
                 5'b00011:r={{3{b[31]}},b[31:3]};
                 5'b00100:r={{4{b[31]}},b[31:4]};
                 5'b00101:r={{5{b[31]}},b[31:5]};
                 5'b00110:r={{6{b[31]}},b[31:6]};
                 5'b00111:r={{7{b[31]}},b[31:7]};
                 5'b01000:r={{8{b[31]}},b[31:8]};
                 5'b01001:r={{9{b[31]}},b[31:9]};
                 5'b01010:r={{10{b[31]}},b[31:10]};
                 5'b01011:r={{11{b[31]}},b[31:11]};
                 5'b01100:r={{12{b[31]}},b[31:12]};
                 5'b01101:r={{13{b[31]}},b[31:13]};
                 5'b01110:r={{14{b[31]}},b[31:14]};
                 5'b01111:r={{15{b[31]}},b[31:15]};
                 5'b10000:r={{16{b[31]}},b[31:16]};
                 5'b10001:r={{17{b[31]}},b[31:17]};
                 5'b10010:r={{18{b[31]}},b[31:18]};
                 5'b10011:r={{19{b[31]}},b[31:19]};
                 5'b10100:r={{20{b[31]}},b[31:20]};
                 5'b10101:r={{21{b[31]}},b[31:21]};
                 5'b10110:r={{22{b[31]}},b[31:22]};
                 5'b10111:r={{23{b[31]}},b[31:23]};
                 5'b11000:r={{24{b[31]}},b[31:24]};
                 5'b11001:r={{25{b[31]}},b[31:25]};
                 5'b11010:r={{26{b[31]}},b[31:26]};
                 5'b11011:r={{27{b[31]}},b[31:27]};
                 5'b11100:r={{28{b[31]}},b[31:28]};
                 5'b11101:r={{29{b[31]}},b[31:29]};
                 5'b11110:r={{30{b[31]}},b[31:30]};
                 5'b11111:r=b[31]?32'hffff_ffff:32'h0000_0000;
                 endcase
            end
            else
            begin
                r=b>>>tmp_a;
                carry=r[0];
            end
        end//À„ ı”““∆
      endcase
    end 
endmodule
