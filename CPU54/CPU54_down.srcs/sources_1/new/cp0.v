`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 17:49:59
// Design Name: 
// Module Name: cp0
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


module CP0(
	input clk,
	input rst,//high level is effective
	input we,//Ð´ÓÐÐ§ÐÅºÅ
	input mfc0,//instruction of cpu0,
	//eg.mfc0 rt,rd :rd->rt
	input mtc0,//instruction of cpu0,
	//eg.mtc0 rt,rd :(GP register)rt->rd
	input [31:0] pc,//current instruction'addr
	input [4:0] addr,//Rd,specifies CP0 register
	input [31:0] data,//wdata,written to CP0 register from GP register(rt) 
	input exception,
	input eret,
	input [4:0] cause,
	output [31:0] rdata,//Data from CP0 register for GP register
	output [31:0] status,
	output [31:0] exc_addr //Addr for PC at the beginning of an exception
	);

   
    reg [31:0] cp0_regfile [0:31];
    assign rdata=(mfc0==1'b1)?cp0_regfile[addr]:32'hzzzz_zzzz;
    assign status = cp0_regfile[12];
    assign exc_addr=(exception && (eret==1))?cp0_regfile[14]:((exception && (eret==0) )?1:32'bz);
    reg [31:0] status_tmp;
    always @(posedge clk or posedge rst) 
    begin
    	if (rst) 
    	begin
    		// reset
    		cp0_regfile[0]=32'h0000_0000;
			cp0_regfile[1]=32'h0000_0000;
			cp0_regfile[2]=32'h0000_0000;
			cp0_regfile[3]=32'h0000_0000;
			cp0_regfile[4]=32'h0000_0000;
			cp0_regfile[5]=32'h0000_0000;
			cp0_regfile[6]=32'h0000_0000;
			cp0_regfile[7]=32'h0000_0000;
			cp0_regfile[8]=32'h0000_0000;
			cp0_regfile[9]=32'h0000_0000;
			cp0_regfile[10]=32'h0000_0000;
			cp0_regfile[11]=32'h0000_0000;
			cp0_regfile[12]=32'h0000_000e;//status[3:1]ÎªÖÐ¶ÏÆÁ±ÎÎ»£¬status[1]ÆÁ±Îsyscall£¬[2]ÆÁ±Îbreak£¬[3]ÆÁ±Îteq
			cp0_regfile[13]=32'h0000_0000;
			cp0_regfile[14]=32'h0000_0000;
			cp0_regfile[15]=32'h0000_0000;
			cp0_regfile[16]=32'h0000_0000;
			cp0_regfile[17]=32'h0000_0000;
			cp0_regfile[18]=32'h0000_0000;
			cp0_regfile[19]=32'h0000_0000;
			cp0_regfile[20]=32'h0000_0000;
			cp0_regfile[21]=32'h0000_0000;
			cp0_regfile[22]=32'h0000_0000;
			cp0_regfile[23]=32'h0000_0000;
			cp0_regfile[24]=32'h0000_0000;
			cp0_regfile[25]=32'h0000_0000;
			cp0_regfile[26]=32'h0000_0000;
			cp0_regfile[27]=32'h0000_0000;
			cp0_regfile[28]=32'h0000_0000;
			cp0_regfile[29]=32'h0000_0000;
			cp0_regfile[30]=32'h0000_0000;
			cp0_regfile[31]=32'h0000_0000;
    	end
    	else 
    	begin
    		if(we)
    		begin
    			if(exception==1'b0)
    			begin
    			if(mtc0==1'b1)
	    			begin
	    				cp0_regfile[addr]=data;
	    			end
    			end
	    		
    			else if(exception==1'b1)//Abnormal
    			begin
    				status_tmp=cp0_regfile[12];//ÔÝ´æ
    				if(eret==1'b0)
	    			begin
		    			cp0_regfile[14]<=pc;
		    			cp0_regfile[13]<={24'b0,cause,2'b00}; //
		    			cp0_regfile[12]<=(status_tmp<<5);
	    			end
    				else
    				begin
    					cp0_regfile[12]<=status_tmp;//»Ö¸´
    				end
    				
    			end
    		end
    	end
    end


endmodule
