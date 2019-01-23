`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 17:51:12
// Design Name: 
// Module Name: cpu54
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


module cpu(
	input clk_in,
	input reset,//高电平有效
	input [31:0] instruction,
	input [31:0] dram_data_out,
	output [31:0] pc,
	output [1:0] DM_W_BH,
	output [2:0] BH_sel,
	output DM_W,
	output DM_R,
	output [31:0] addr,//数据存储器待存取的地址
	output [31:0] wdata
    );
	wire RF_W;//寄存器堆的写信号，下降沿+高电平有效
	//wire CPR_R
	wire CPR_W;//特殊寄存器的写信号，下降沿+高电平有效
	wire M0;
	wire M1;
	wire M2;//以上三个主要负责写入寄存器堆的数据的选择
	wire M3;
	wire M4;
	wire M5;//以上三个主要负责传入ALU部件A,B接口的数据选择
	wire M7;//选择Rdc
	wire M10;//HI寄存器的数据来源选择
	wire M11;//LO寄存器的数据来源选择
	wire [1:0] PC_SOURCE;//PC数据来源的选择
	wire [3:0] ALUC;
	//wire DM_R,
	//wire DM_W;//数据寄存器的写信号，高电平有效
	wire SEXT;//传给扩展部件，指示符号扩展（高电平）还是0扩展（低电平）
	wire IS_JAL;
	wire DIV_MUL_RST;//高电平有效。不执行乘除运算时，对DIVMUL部件的寄存器置零；
	wire DIV_MUL_START;//START=!RST & ~busy
	wire busy;
	wire [1:0] DIVMUL_sel;//乘除法器部件中，有/无符号乘/除法的选择
	//wire [2:0] BH_sel;//LB,LH,LBU,LHU，LW的选择信号
	//wire [1:0] DM_W_BH;//SW,SH,SB的处理，传入DMEM
	wire LO_W;//写入LO寄存器的写信号，高电平有效，时钟下降沿写入
	wire HI_W;//写入HI寄存器的写信号，高电平有效，时钟下降沿写入
	wire MFC0;
	wire MTC0;

	//接口，信号定义///////////////////////////////////
	//拆解指令instruction
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] rsc;//Rsc
	wire [4:0] rtc;//Rtc
	wire [4:0] rdc;
	wire [4:0] r31=5'b11111;
	wire [31:0] rs;
	wire [31:0] rt;
	wire [4:0] shamt;//5位的offset
	wire [15:0] immediate;//16位立即数
	wire [17:0]immediate_tmp;//immediate||00
	wire [25:0] j_addr;//J,Jal指令中的address

	//PC四路选择器数据来源
	wire [31:0]next_pc;
	wire [31:0]pc4;//PC+4
	wire [31:0]pc4offset;//pc+4+offset||00
	wire [31:0]pc4offset_tmp;
	wire [31:0]pc4addr00;//(pc+4)[31:28]||address||00
	wire [31:0]pc4addr00_tmp;
	wire [31:0]pcrs;

	wire [31:0] rf_wdata;//写入dataram的数据

	//ALU数据输入及运算标志
    wire [31:0] alu_a;
    wire [31:0] alu_b;
    wire [31:0] alu_r;
    wire zero;    //判断运算结果是否为0
    wire carry;    //判断是否进位
    wire negative;//判断结果是否为负
    wire overflow;//判断结果是否溢出

    wire [31:0] zero_null;//替死鬼
    wire [31:0] zero_num; //前导0的个数
    wire [31:0] LO_out;//LO寄存器读取的数据
    wire [31:0] LO_in;
    wire [31:0] HI_in;
    wire [31:0] HI_out;//HI寄存器读取的数据
    wire [31:0] cpr_out;//从CP0特殊寄存器堆读取的数据

    wire EXCEPTION;
    wire ERET;
    wire [4:0] CAUSE;
    wire [31:0] status;
    wire [31:0] exc_addr;
    
    wire [31:0] q;
    wire [31:0] r;
    
   // wire [31:0] dram_data_out;
    wire [31:0] res; //从乘除法器出来，结果result的低32位写入regfile
    //wire [31:0] addr;
	///////////////////////////////////////////////////



	//实例化控制器
	control_unit_54 cu54(op,rsc,rs,rt,func,busy,zero,negative,RF_W,CPR_W,M0,M1,M2,M3,M4,M5,M7,M10,M11,PC_SOURCE,ALUC,DM_W,DM_R,SEXT,IS_JAL,DIV_MUL_RST,DIV_MUL_START,DIVMUL_sel,BH_sel,DM_W_BH,LO_W,HI_W,MFC0,MTC0,EXCEPTION,ERET,CAUSE);
	//由于写入地址有rtc和rdc两种，所以要先经过mux7
	wire [4:0] rdc_tmp0;
	wire [4:0] rdc_tmp1;
	assign op[5:0] = instruction[31:26];
	assign func[5:0] = instruction[5:0];
	assign rsc = instruction[25:21];
	assign rtc = instruction[20:16];
	assign rdc_tmp1 = instruction[15:11];
	assign shamt = instruction[10:6];
	assign immediate = instruction[15:0];
	assign j_addr = instruction[25:0];
	assign immediate_tmp ={immediate,{2'b00}} ;//在计算pc+4+offset||00时需要用


	
	//时钟上升沿控制PC的更新，将next_pc传给PC，其中next_pc已经经过数据来源选择器
	add2 npc(pc,32'h0000_0004,pc4);
	ext18 extoffset(immediate_tmp,SEXT,pc4offset_tmp);
	add2 pc4offset_inst(pc4,pc4offset_tmp,pc4offset);
	assign pc4addr00_tmp = {{pc4[31:28]},j_addr,{2'b00}};//j  jal;
	//assign pc4addr00 = pc4addr00_tmp-32'h0040_0000;
	assign pc4addr00 = pc4addr00_tmp;
	//assign pcrs = rs-32'h0040_0000;
	assign pcrs = rs;
	mux32x41 mux41(pc4,pc4offset,pc4addr00,pcrs,PC_SOURCE,next_pc);
	pcreg pcreg_inst(clk_in,reset,busy,next_pc,pc);

	//实例化指令寄存器
	//wire im_ena=1'b1;
	//instmem instmen_inst(im_ena,pc[9:0],instruction);
    //iram iram_inst(pc,in)
	//选择Rdc
	mux5x21 mux7(rtc,rdc_tmp1,M7,rdc_tmp0);
	mux5x21 mux8(rdc_tmp0,r31,IS_JAL,rdc);

	//选择rf_wdata
	
	wire [31:0] pc4_jal;
	//assign pc4_jal = pc4+32'h0040_0000;
	assign pc4_jal=pc4;
	//从这七个数据来源中，根据选择信号M0-M2进行选择，得到rf_wdata
	mux32x81 mux2(alu_r,dram_data_out,pc4_jal,zero_num,LO_out,HI_out,cpr_out,res,M0,M1,M2,rf_wdata);
	//实例化regfiles
	regfile cpu_ref(clk_in,reset,RF_W,rsc,rtc,rdc,rf_wdata,rs,rt);


	//实例化ALU部件
	

    wire [31:0] tmp_a;
    wire [31:0] tmp_b;
    ext5 extshamt(shamt,SEXT,tmp_a);
    mux32x21 mux3(tmp_a,rs,M3,alu_a);
    ext16 extimm(immediate,SEXT,tmp_b);
    wire [31:0] zero_b_in;
    assign zero_b_in = 32'h0;
    assign zero_null = 32'h0;
    mux32x41 mux4(rt,tmp_b,zero_b_in,zero_null,{M5,M4},alu_b);
	alu alu_inst(alu_a,alu_b,ALUC,alu_r,zero,carry,negative,overflow);


	//实例化countZero部件
	countZero cz(rs,zero_num);

    //实例化乘除法器
    divmul divm(rs,rt,DIV_MUL_START,DIVMUL_sel,clk_in,DIV_MUL_RST,q,r,res,busy);
	//实例化LO部件
	mux32x21 mux11(rs,q,M11,LO_in);
	HILOreg LO(LO_in,LO_W,clk_in,LO_out);
	//实例化HI部件
	mux32x21 mux10(r,rs,M10,HI_in);
	HILOreg HI(HI_in,HI_W,clk_in,HI_out);

	//实例化CP0，即特殊寄存器堆
	CP0 cp0(clk_in,reset,CPR_W,MFC0,MTC0,pc,rdc_tmp1,rt,EXCEPTION,ERET,CAUSE,cpr_out,status,exc_addr);
	
	//实例化dmem,之后拿出CPU
	//wire [31:0] addr;
	//assign addr=alu_r-32'h10010000;
	assign addr=alu_r;
	assign wdata=rt;
	//dram dm(clk_in,reset,DM_W,DM_W_BH,BH_sel,addr,wdata,dram_data_out);
	//dram dm(clk_in,DM_W,DM_W_BH,BH_sel,alu_r[9:0],rt,dram_data_out);
	//dram dm(clk_in,DM_W,alu_r[9:0],rt,dram_data_out);
endmodule
