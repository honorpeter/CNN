`timescale 1ns / 1ps

module Test_benes32;




reg clk;
reg [31:0] in1,in2,in3,in4;
reg[31:0] w1,w2,w3;

reg [31:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
reg [31:0] x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31;

wire [31:0] y0,y1,y2,y3;


wire y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;
wire [31:0] y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y30,y31;



reg [31:0] RAMX [0:65025]; 
reg [31:0] RAMW [0:65025];
 reg [31:0] OUT [0:47];

integer i,j;

reg stop_clk , reset ;
wire [31:0] n_clk_cycles;

reg [31:0] total_time;

always #10 clk=~clk;


reg [8:0] s_tb;

reg [9:0] s_n [0:7];

benes32#(19,32,9,7) b(
.clk(clk),


.xin1(x0),.xin17(x16), 
.xin2(x1),.xin18(x17), 
.xin3(x2),.xin19(x18), 
.xin4(x3),.xin20(x19), 
.xin5(x4),.xin21(x20), 
.xin6(x5),.xin22(x21), 
.xin7(x6),.xin23(x22), 
.xin8(x7),.xin24(x23), 
.xin9(x8),.xin25(x24), 
.xin10(x9),.xin26(x25), 
.xin11(x10),.xin27(x26), 
.xin12(x11),.xin28(x27), 
.xin13(x12),.xin29(x28), 
.xin14(x13),.xin30(x29), 
.xin15(x14),.xin31(x30), 
.xin16(x15),.xin32(x31),


.yin1(y0),.yin17(y16), 
.yin2(y1),.yin18(y17), 
.yin3(y2),.yin19(y18), 
.yin4(y3),.yin20(y19), 
.yin5(y4),.yin21(y20), 
.yin6(y5),.yin22(y21), 
.yin7(y6),.yin23(y22), 
.yin8(y7),.yin24(y23), 
.yin9(y8),.yin25(y24), 
.yin10(y9),.yin26(y25), 
.yin11(y10),.yin27(y26), 
.yin12(y11),.yin28(y27), 
.yin13(y12),.yin29(y28), 
.yin14(y13),.yin30(y29), 
.yin15(y14),.yin31(y30), 
.yin16(y15),.yin32(y31),

//.x1(x0),.x17(x16), 
//.x2(x1),.x18(x17), 
//.x3(x2),.x19(x18), 
//.x4(x3),.x20(x19), 
//.x5(x4),.x21(x20), 
//.x6(x5),.x22(x21), 
//.x7(x6),.x23(x22), 
//.x8(x7),.x24(x23), 
//.x9(x8),.x25(x24), 
//.x10(x9),.x26(x25), 
//.x11(x10),.x27(x26), 
//.x12(x11),.x28(x27), 
//.x13(x12),.x29(x28), 
//.x14(x13),.x30(x29), 
//.x15(x14),.x31(x30), 
//.x16(x15),.x32(x31),
////
//
//.y1(y0),.y17(y16), 
//.y2(y1),.y18(y17), 
//.y3(y2),.y19(y18), 
//.y4(y3),.y20(y19), 
//.y5(y4),.y21(y20), 
//.y6(y5),.y22(y21), 
//.y7(y6),.y23(y22), 
//.y8(y7),.y24(y23), 
//.y9(y8),.y25(y24), 
//.y10(y9),.y26(y25), 
//.y11(y10),.y27(y26), 
//.y12(y11),.y28(y27), 
//.y13(y12),.y29(y28), 
//.y14(y13),.y30(y29), 
//.y15(y14),.y31(y30), 
//.y16(y15),.y32(y31),

.s(s_tb)

);

time_counter t1 (

.clk(clk),
.rst(reset),
.stop(stop_clk),
.ticks(n_clk_cycles)

);

initial begin
	#10 clk=0;
	stop_clk=0;
	reset=1;
	#10 reset=0;
	
	
	s_n[0]=9'b000000000;
	s_n[1]=9'b000000100;
	s_n[2]=9'b000001000;
	s_n[3]=9'b000001100;
	s_n[4]=9'b000010000;
	s_n[5]=9'b000010100;
	s_n[6]=9'b000011000;
	s_n[7]=9'b000011100;

	i=0;
	//f0= $fopen("out.dat","w");
  $readmemh("C:/Users/aaansari/Documents/Asilomar_2017/CNN/data.dat", RAMX);
  $readmemh("C:/Users/aaansari/Documents/Asilomar_2017/CNN/w.dat",RAMW);
  
    in1=RAMX[1]; in2=RAMX[2]; in3=RAMX[3]; in4=RAMX[4]; 
		w1=RAMW[1]; w2=RAMW[2]; w3=RAMW[3]; 
   
  end 
  
	
  
   always @(posedge clk & i < 32) begin 
	
	
		
		s_tb= s_n[0];
		
		x0=in1;x1=in2;
		x2=in3; 
		x3=in4;
		
		x4=32'b0;x5=32'b0;
		x6=32'b0;x7=32'b0;
		x8=32'b0;x9=32'b0;
		x10=32'b0;x11=32'b0;	
		x12=32'b0;x13=32'b0;
		x14=32'b0;x15=32'b0;
		x16=32'b0;x17=32'b0;
		x18=32'b0;x19=32'b0;
		x20=32'b0;x21=32'b0;
		x22=32'b0;x23=32'b0;
		x24=32'b0;x25=32'b0;
		x26=32'b0;x27=32'b0;	
		x28=32'b0;x29=32'b0;
		x30=32'b0;x31=32'b0;

		OUT[0]=y0;OUT[1]=y1;
		OUT[2]=y2;OUT[3]=y3;
		OUT[4]=y4;OUT[5]=y5;
		OUT[6]=y6;OUT[7]=y7;
		OUT[8]=y8;OUT[9]=y9;
		OUT[10]=y10;OUT[11]=y11;
		OUT[12]=y12;OUT[13]=y13;
		OUT[14]=y14;OUT[15]=y15;
		OUT[16]=y16;OUT[17]=y17;
		OUT[18]=y18;OUT[19]=y19;
		OUT[20]=y20;OUT[21]=y21;
		OUT[22]=y22;OUT[23]=y23;
		OUT[24]=y24;OUT[25]=y25;
		OUT[26]=y26;OUT[27]=y27;
		OUT[28]=y28;OUT[29]=y29;
		OUT[30]=y30;OUT[31]=y31;
			
           
  end
  
  
  endmodule