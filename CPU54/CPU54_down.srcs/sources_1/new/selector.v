`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/02 11:41:10
// Design Name: 
// Module Name: selector
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/21 12:41:14
// Design Name: 
// Module Name: mux5x21
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


module mux5x21(
    input [4:0] in_a,
    input [4:0] in_b,
    input m,
    output reg [4:0] out_c
    );
    always @(*)
    begin
        if(m==0)
            out_c<=in_a;
        else if(m==1)
            out_c<=in_b;
        else 
            out_c<=5'bxxxxx;
    end
endmodule

module mux32x21(
    input [31:0] in_a,
    input [31:0] in_b,
    input m,
    output reg [31:0] out_c
    );
    always @(*)
    begin
        if(m==0)
            out_c<=in_a;
        else if(m==1)
            out_c<=in_b;
        else
            out_c<=32'hxxxx_xxxx;
    end
endmodule

module mux32x41(
    input [31:0] in_a,
    input [31:0] in_b,
    input [31:0] in_c,
    input [31:0] in_d,
    input [1:0] ps,
    output reg [31:0] out_e
    );
    always @(*)
    begin
      if(ps==2'b00)
        out_e<=in_a;
      else if(ps==2'b01)
        out_e<=in_b;
      else if(ps==2'b10)
        out_e<=in_c;
      else if(ps==2'b11)
        out_e<=in_d;
      else 
        out_e<=32'hxxxx_xxxx;      
    end
endmodule

module mux32x81(
    input [31:0] in_a,
    input [31:0] in_b,
    input [31:0] in_c,
    input [31:0] in_d,
    input [31:0] in_e,
    input [31:0] in_f,
    input [31:0] in_g,
    input [31:0] in_h,
    input m0,
    input m1,
    input m2,
    output reg [31:0] out_e
    );
    wire [2:0] ps;
    assign ps={m0,m1,m2};
    always @(*)
    begin
      if(ps==3'b000)
        out_e<=in_a;
      else if(ps==3'b001)
        out_e<=in_b;
      else if(ps==3'b010)
        out_e<=in_c;
      else if(ps==3'b011)
        out_e<=in_d;
      else if(ps==3'b100)
        out_e<=in_e;
      else if(ps==3'b101)
        out_e<=in_f;
      else if(ps==3'b110)
        out_e<=in_g;
      else if(ps==3'b111)
        out_e<=in_h;
      else
        out_e=32'hxxxx_xxxx;  
    end
endmodule