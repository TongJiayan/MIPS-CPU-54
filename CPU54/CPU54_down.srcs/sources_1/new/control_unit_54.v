`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/04 17:49:59
// Design Name: 
// Module Name: control_unit_54
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


module control_unit_54(
//    input clk_in,
	input [5:0] op,
	input [4:0] rsc,
	input [31:0] rs,
	input [31:0] rt,
	input [5:0] func,
	input busy,//�ɳ˳������������ź�
	input z,//ALU��zero����
	input n,//ALU��negetive����
	//output RF_R,/
	output RF_W,//�Ĵ����ѵ�д�źţ��½���+�ߵ�ƽ��Ч
	//output CPR_R
	output CPR_W,//����Ĵ�����д�źţ��½���+�ߵ�ƽ��Ч
	output M0,
	output M1,
	output M2,//����������Ҫ����д��Ĵ����ѵ����ݵ�ѡ��
	output M3,
	output M4,
	output M5,//����������Ҫ������ALU����A,B�ӿڵ�����ѡ��
	output M7,//ѡ��Rdc
	output M10,//HI�Ĵ�����������Դѡ��
	output M11,//LO�Ĵ�����������Դѡ��
	output [1:0] PC_SOURCE,//PC������Դ��ѡ��
	output [3:0] ALUC,
	
	output DM_W,//���ݼĴ�����д�źţ��ߵ�ƽ��Ч
	output DM_R,
	output SEXT,//������չ������ָʾ������չ���ߵ�ƽ������0��չ���͵�ƽ��
	output IS_JAL,
	output DIV_MUL_RST,//�ߵ�ƽ��Ч����ִ�г˳�����ʱ����DIVMUL�����ļĴ������㣻
	output DIV_MUL_START,//START=!RST & ~busy
	output [1:0] DIVMUL_sel,//�˳����������У���/�޷��ų�/������ѡ��
	output [2:0] BH_sel,//LB,LH,LBU,LHU��LW��ѡ���ź�
	output [1:0] DM_W_BH,//SW,SH,SB�Ĵ�������DMEM
	output LO_W,//д��LO�Ĵ�����д�źţ��ߵ�ƽ��Ч��ʱ���½���д��
	output HI_W, //д��HI�Ĵ�����д�źţ��ߵ�ƽ��Ч��ʱ���½���д��
	output MFC0,
	output MTC0,
	output EXCEPTION,
	output ERET,
	output [4:0] CAUSE
	);
    wire ADD,ADDU,SUB,SUBU,AND,OR,XOR,NOR,SLT,SLTU;
    wire SLL,SRL,SRA,SLLV,SRLV,SRAV,JR,ADDI,ADDIU,ANDI,ORI,XORI;
    wire LW,SW,BEQ,BNE,SLTI,SLTIU,LUI,J,JAL,CLZ,DIVU;
    wire JALR,LB,LBU,LHU,SB,SH,LH,MFHI,MFLO;
    wire MTHI,MTLO,MUL,MULTU,SYSCALL,TEQ,BGEZ,BREAK,DIV;

	instruction_decoder inst_decode(op,rsc,func,ADD,ADDU,SUB,SUBU,AND, OR,XOR,
         NOR,SLT,SLTU,SLL,SRL,SRA,SLLV,SRLV,SRAV,JR,ADDI,ADDIU,ANDI,ORI,XORI,
         LW,SW,BEQ,BNE,SLTI,SLTIU,LUI,J,JAL,CLZ,DIVU,ERET,JALR,LB,LBU,LHU,
         SB,SH,LH,MFC0,MFHI,MFLO,MTC0,MTHI,MTLO,//��ĸo
         MUL,MULTU,SYSCALL,TEQ, BGEZ,BREAK,DIV);
    
    assign EXCEPTION = BREAK | TEQ &(rs==rt) | SYSCALL;
    assign CAUSE[4]=1'b0;
    assign CAUSE[3]=BREAK||SYSCALL||(TEQ && rt==rs);
    assign CAUSE[2]=TEQ;
    assign CAUSE[1]=1'b0;
    assign CAUSE[0]=(TEQ && rt==rs)||BREAK;
    assign HI_W = DIV | DIVU | MUL | MULTU | MTHI;
    assign LO_W = DIV | DIVU | MUL | MULTU | MTLO;
    assign DM_W_BH[0] = SH;
    assign DM_W_BH[1] = SH | SB;
    assign BH_sel[0] = LBU | LHU;
    assign BH_sel[1] = LH | LHU;
    assign BH_sel[2] = LB | LBU | LH | LHU;
    assign DIVMUL_sel[0] = MULTU | DIVU;
    assign DIVMUL_sel[1] = MULTU | MUL;
    assign DIV_MUL_RST = ~DIV & ~DIVU;
    assign DIV_MUL_START = (DIV | DIVU) & ~busy;
    assign IS_JAL = JAL ;
    assign SEXT = ADDI | ADDIU | LUI | SLTI | LW | SW | BEQ | BNE | LB | LBU | LHU | LH | SB | SH;
    assign DM_W = SW | SB | SH;
    assign DM_R = LW | LB | LBU | LH | LHU;
    assign ALUC[0] = SUB | SUBU | OR | NOR | SLT | SRLV | SRL | ORI | SLTI | BEQ | BNE | BGEZ;
    assign ALUC[1] = ADD | SUB | XOR | NOR | SLT | SLTU | SLLV | SLL | ADDI | XORI | SLTI | SLTIU | LW | SW | BEQ | BNE | BGEZ | LB | LH | LBU | LHU | SB | SH ;                
    assign ALUC[2] = AND | OR | XOR | NOR | SRAV | SLLV | SRLV | SLL | SRA | SRL | ANDI | ORI | XORI;
    assign ALUC[3] = SRAV | SLLV | SRLV | SLL | SRA | SRL | SLT | SLTU | LUI | SLTI | SLTIU;
    assign PC_SOURCE[0] = BEQ & z | BNE & ~z | JR | BGEZ & ~n | JALR;
    assign PC_SOURCE[1] = J | JAL | JR | JALR;
    assign M11 = DIV | DIVU | MUL | MULTU;
    assign M10 = MTHI;
    assign M7 = ADDU | ADD | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SRAV | SLLV | SRLV | SLL | SRA | SRL | JALR | CLZ | MFLO | MFHI | MUL | MULTU;
	assign M5 = BGEZ; 
	assign M4 = ADDI | ADDIU | ANDI | ADDI | ADDIU | ORI | XORI | LUI | SLTI | SLTIU | LW | SW | LB | LH | LBU | LHU | SB | SH ;   
	assign M3 = ADDU | ADD | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SRAV | SLLV | SRLV | ADDI | ADDIU | ANDI | ORI | XORI | SLTI | SLTIU | SW | LW | BEQ | BNE | JR | BGEZ | LH | LHU | LB | LBU | SB | SH ;
	assign M2 = LW | LB | LBU | LH | LHU | CLZ | MFHI | MUL | MULTU;
	assign M1 = JAL | JALR | CLZ | MFC0 | MUL | MULTU;
	assign M0 = MFC0 | MFLO | MFHI | MUL | MULTU;
	assign CPR_W = MTC0 | EXCEPTION; ////////////////////////////////////
	assign RF_W = ADDU | ADD | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SRAV | SLLV | SRLV | SLL | SRL | SRA |ADDI | ADDIU | ANDI | ORI | XORI | LUI | SLTI | SLTIU | LW | JAL | JALR | LB | LBU | LH | LHU | CLZ | MFC0 | MFLO | MFHI | MUL | MULTU ;
//    always @(posedge clk_in)
//        DIV_MUL_START = (DIV | DIVU) & ~busy;
endmodule