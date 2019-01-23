`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/03 16:04:16
// Design Name: 
// Module Name: divmul
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


module divmul(
    input [31:0] a,
    input [31:0] b,
    input start,
    input [1:0] DIMU_sel,
    input clk_in,
    input reset,
    output reg [31:0] q,
    output reg [31:0] r,
    output [31:0] res,
    output busy
    );
    reg [63:0] result;
    assign res=result[31:0];
    
    wire [32:0] zero_a={1'b0,a};
    wire [32:0] zero_b={1'b0,b};
    
    reg start_divu;
    reg start_div;
    wire busy_divu,busy_div;
    wire [31:0]q_divu;
    wire [31:0]q_div;
    wire [31:0] r_divu;
    wire [31:0] r_div;
    DIVU divu_inst(a,b,start_divu,clk_in,reset,q_divu,r_divu,busy_divu);
    DIV div_inst(a,b,start_div,clk_in,reset,q_div,r_div,busy_div);
    assign busy=busy_divu | busy_div;
    
    always @(*)
    begin
        case(DIMU_sel)
            2'b00:begin //DIV
                if(start==1'b1)
                begin
                    start_div=1;
                    start_divu=0;
                end
                else
                begin
                    start_div=0;
                    start_divu=0;
                end
            end
            2'b01:begin //DIVU
                if(start==1'b1)
                begin
                    start_div=0;
                    start_divu=1;
                end
                else
                begin
                    start_div=0;
                    start_divu=0;
                end            
            end
            2'b10:begin //MULT
                start_div=0;
                start_divu=0;
            end
            2'b11:begin //MULTU
                start_div=0;
                start_divu=0;        
            end
            endcase        
    end
        
    always @(negedge clk_in or posedge start)
    begin
        if(start==1'b1)
        begin
            case(DIMU_sel)
            2'b00:begin //DIV
                q=q_div;
                r=r_div;
            end
            2'b01:begin //DIVU          
                q=q_divu;
                r=r_divu;
            end
            endcase
        end
        
        else
        begin
            case(DIMU_sel)
            2'b10:begin
                result=a*b;
                q=result[31:0];
                r=result[63:32];
            end
            
            2'b11:begin
                result=zero_a*zero_b;
                q=result[31:0];
                r=result[63:32];        
            end
            endcase            
        end
        
    end
endmodule
