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
	input reset,//�ߵ�ƽ��Ч
	input [31:0] instruction,
	input [31:0] dram_data_out,
	output [31:0] pc,
	output [1:0] DM_W_BH,
	output [2:0] BH_sel,
	output DM_W,
	output DM_R,
	output [31:0] addr,//���ݴ洢������ȡ�ĵ�ַ
	output [31:0] wdata
    );
	wire RF_W;//�Ĵ����ѵ�д�źţ��½���+�ߵ�ƽ��Ч
	//wire CPR_R
	wire CPR_W;//����Ĵ�����д�źţ��½���+�ߵ�ƽ��Ч
	wire M0;
	wire M1;
	wire M2;//����������Ҫ����д��Ĵ����ѵ����ݵ�ѡ��
	wire M3;
	wire M4;
	wire M5;//����������Ҫ������ALU����A,B�ӿڵ�����ѡ��
	wire M7;//ѡ��Rdc
	wire M10;//HI�Ĵ�����������Դѡ��
	wire M11;//LO�Ĵ�����������Դѡ��
	wire [1:0] PC_SOURCE;//PC������Դ��ѡ��
	wire [3:0] ALUC;
	//wire DM_R,
	//wire DM_W;//���ݼĴ�����д�źţ��ߵ�ƽ��Ч
	wire SEXT;//������չ������ָʾ������չ���ߵ�ƽ������0��չ���͵�ƽ��
	wire IS_JAL;
	wire DIV_MUL_RST;//�ߵ�ƽ��Ч����ִ�г˳�����ʱ����DIVMUL�����ļĴ������㣻
	wire DIV_MUL_START;//START=!RST & ~busy
	wire busy;
	wire [1:0] DIVMUL_sel;//�˳����������У���/�޷��ų�/������ѡ��
	//wire [2:0] BH_sel;//LB,LH,LBU,LHU��LW��ѡ���ź�
	//wire [1:0] DM_W_BH;//SW,SH,SB�Ĵ�������DMEM
	wire LO_W;//д��LO�Ĵ�����д�źţ��ߵ�ƽ��Ч��ʱ���½���д��
	wire HI_W;//д��HI�Ĵ�����д�źţ��ߵ�ƽ��Ч��ʱ���½���д��
	wire MFC0;
	wire MTC0;

	//�ӿڣ��źŶ���///////////////////////////////////
	//���ָ��instruction
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] rsc;//Rsc
	wire [4:0] rtc;//Rtc
	wire [4:0] rdc;
	wire [4:0] r31=5'b11111;
	wire [31:0] rs;
	wire [31:0] rt;
	wire [4:0] shamt;//5λ��offset
	wire [15:0] immediate;//16λ������
	wire [17:0]immediate_tmp;//immediate||00
	wire [25:0] j_addr;//J,Jalָ���е�address

	//PC��·ѡ����������Դ
	wire [31:0]next_pc;
	wire [31:0]pc4;//PC+4
	wire [31:0]pc4offset;//pc+4+offset||00
	wire [31:0]pc4offset_tmp;
	wire [31:0]pc4addr00;//(pc+4)[31:28]||address||00
	wire [31:0]pc4addr00_tmp;
	wire [31:0]pcrs;

	wire [31:0] rf_wdata;//д��dataram������

	//ALU�������뼰�����־
    wire [31:0] alu_a;
    wire [31:0] alu_b;
    wire [31:0] alu_r;
    wire zero;    //�ж��������Ƿ�Ϊ0
    wire carry;    //�ж��Ƿ��λ
    wire negative;//�жϽ���Ƿ�Ϊ��
    wire overflow;//�жϽ���Ƿ����

    wire [31:0] zero_null;//������
    wire [31:0] zero_num; //ǰ��0�ĸ���
    wire [31:0] LO_out;//LO�Ĵ�����ȡ������
    wire [31:0] LO_in;
    wire [31:0] HI_in;
    wire [31:0] HI_out;//HI�Ĵ�����ȡ������
    wire [31:0] cpr_out;//��CP0����Ĵ����Ѷ�ȡ������

    wire EXCEPTION;
    wire ERET;
    wire [4:0] CAUSE;
    wire [31:0] status;
    wire [31:0] exc_addr;
    
    wire [31:0] q;
    wire [31:0] r;
    
   // wire [31:0] dram_data_out;
    wire [31:0] res; //�ӳ˳��������������result�ĵ�32λд��regfile
    //wire [31:0] addr;
	///////////////////////////////////////////////////



	//ʵ����������
	control_unit_54 cu54(op,rsc,rs,rt,func,busy,zero,negative,RF_W,CPR_W,M0,M1,M2,M3,M4,M5,M7,M10,M11,PC_SOURCE,ALUC,DM_W,DM_R,SEXT,IS_JAL,DIV_MUL_RST,DIV_MUL_START,DIVMUL_sel,BH_sel,DM_W_BH,LO_W,HI_W,MFC0,MTC0,EXCEPTION,ERET,CAUSE);
	//����д���ַ��rtc��rdc���֣�����Ҫ�Ⱦ���mux7
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
	assign immediate_tmp ={immediate,{2'b00}} ;//�ڼ���pc+4+offset||00ʱ��Ҫ��


	
	//ʱ�������ؿ���PC�ĸ��£���next_pc����PC������next_pc�Ѿ�����������Դѡ����
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

	//ʵ����ָ��Ĵ���
	//wire im_ena=1'b1;
	//instmem instmen_inst(im_ena,pc[9:0],instruction);
    //iram iram_inst(pc,in)
	//ѡ��Rdc
	mux5x21 mux7(rtc,rdc_tmp1,M7,rdc_tmp0);
	mux5x21 mux8(rdc_tmp0,r31,IS_JAL,rdc);

	//ѡ��rf_wdata
	
	wire [31:0] pc4_jal;
	//assign pc4_jal = pc4+32'h0040_0000;
	assign pc4_jal=pc4;
	//�����߸�������Դ�У�����ѡ���ź�M0-M2����ѡ�񣬵õ�rf_wdata
	mux32x81 mux2(alu_r,dram_data_out,pc4_jal,zero_num,LO_out,HI_out,cpr_out,res,M0,M1,M2,rf_wdata);
	//ʵ����regfiles
	regfile cpu_ref(clk_in,reset,RF_W,rsc,rtc,rdc,rf_wdata,rs,rt);


	//ʵ����ALU����
	

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


	//ʵ����countZero����
	countZero cz(rs,zero_num);

    //ʵ�����˳�����
    divmul divm(rs,rt,DIV_MUL_START,DIVMUL_sel,clk_in,DIV_MUL_RST,q,r,res,busy);
	//ʵ����LO����
	mux32x21 mux11(rs,q,M11,LO_in);
	HILOreg LO(LO_in,LO_W,clk_in,LO_out);
	//ʵ����HI����
	mux32x21 mux10(r,rs,M10,HI_in);
	HILOreg HI(HI_in,HI_W,clk_in,HI_out);

	//ʵ����CP0��������Ĵ�����
	CP0 cp0(clk_in,reset,CPR_W,MFC0,MTC0,pc,rdc_tmp1,rt,EXCEPTION,ERET,CAUSE,cpr_out,status,exc_addr);
	
	//ʵ����dmem,֮���ó�CPU
	//wire [31:0] addr;
	//assign addr=alu_r-32'h10010000;
	assign addr=alu_r;
	assign wdata=rt;
	//dram dm(clk_in,reset,DM_W,DM_W_BH,BH_sel,addr,wdata,dram_data_out);
	//dram dm(clk_in,DM_W,DM_W_BH,BH_sel,alu_r[9:0],rt,dram_data_out);
	//dram dm(clk_in,DM_W,alu_r[9:0],rt,dram_data_out);
endmodule
