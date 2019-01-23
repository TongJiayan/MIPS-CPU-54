`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 18:06:42
// Design Name: 
// Module Name: sccomp_dataflow
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


module sccomp_dataflow(
    input clk_in,
    input reset,//高电平有效，复位
    input [15:0] sw,
    output [7:0] o_seg,
    output [7:0] o_sel
    );
    //wire [7:0] o_seg;
    //wire [7:0] o_sel;
    
    wire [31:0] inst;
    wire [31:0] pc;
    wire [31:0] addr;
    
    wire clk_out;
    wire locked;
    clk_wiz_0 clk( clk_in,clk_out,reset,locked);
    wire rst=reset|~locked;
    
    wire [31:0] dram_data_out;
    wire DM_W;
    wire DM_R;
    wire [31:0] wdata;
    wire [31:0] rdata;
    wire [31:0] ip_in;
    wire seg7_cs;
    wire switch_cs;
    assign ip_in=pc-32'h00400000;
    wire [1:0] DM_W_BH;
    wire [2:0] BH_sel;
    cpu sccpu(clk_out,rst,inst,rdata,pc,DM_W_BH,BH_sel,DM_W,DM_R,addr,wdata);
    iram imem_inst(ip_in[12:2],inst);//右移2位，取低11位
    dram dm(clk_out,rst,DM_W,DM_W_BH,BH_sel,addr-32'h10010000,wdata,dram_data_out);
    /*地址译码*/
    io_sel io_mem(addr,DM_W,DM_R,seg7_cs, switch_cs);
    seg7x16 seg7(clk_out, rst, seg7_cs, wdata, o_seg, o_sel);
    sw_mem_sel sw_mem(switch_cs, sw, dram_data_out, rdata);    
endmodule
