   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 137                     ; 6 void rim(void){
 139                     	switch	.text
 140  0000               _rim:
 144                     ; 8 	RIM					//uninterruptable
 147  0000 9a            RIM					//uninterruptable
 149                     ; 10 }
 152  0001 81            	ret
 175                     ; 11 void sim(void){
 176                     	switch	.text
 177  0002               _sim:
 181                     ; 13 	SIM
 184  0002 9b            SIM
 186                     ; 15 }
 189  0003 81            	ret
 212                     ; 17  void InitClock ( void )
 212                     ; 18  {
 213                     	switch	.text
 214  0004               _InitClock:
 218                     ; 19     CLK_ICKR = CLK_ICKR | CLK_ICKR_HSIEN;
 220  0004 721050c0      	bset	20672,#0
 222  0008               L301:
 223                     ; 20     while ( ! (CLK_ICKR & CLK_ICKR_HSIRDY)) ; 
 225  0008 c650c0        	ld	a,20672
 226  000b a502          	bcp	a,#2
 227  000d 27f9          	jreq	L301
 228                     ; 21     CLK_CKDIVR = 0x00 ;
 230  000f 725f50c6      	clr	20678
 231                     ; 22  }
 234  0013 81            	ret
 263                     ; 23 void InitGPIO(void)
 263                     ; 24 {
 264                     	switch	.text
 265  0014               _InitGPIO:
 269                     ; 26 	PC_DDR = PC_DDR | (1 << 1); PC_CR1 = PC_CR1 | (1 << 1);	//18
 271  0014 7212500c      	bset	20492,#1
 274  0018 7212500d      	bset	20493,#1
 275                     ; 27 	PC_DDR = PC_DDR | (1 << 2); PC_CR1 = PC_CR1 | (1 << 2);	//19
 277  001c 7214500c      	bset	20492,#2
 280  0020 7214500d      	bset	20493,#2
 281                     ; 28 	PC_DDR = PC_DDR | (1 << 3); PC_CR1 = PC_CR1 | (1 << 3);	//20
 283  0024 7216500c      	bset	20492,#3
 286  0028 7216500d      	bset	20493,#3
 287                     ; 29 	PC_DDR = PC_DDR | (1 << 4); PC_CR1 = PC_CR1 | (1 << 4);	//21
 289  002c 7218500c      	bset	20492,#4
 292  0030 7218500d      	bset	20493,#4
 293                     ; 30 	PC_DDR = PC_DDR | (1 << 5); PC_CR1 = PC_CR1 | (1 << 5);	//22
 295  0034 721a500c      	bset	20492,#5
 298  0038 721a500d      	bset	20493,#5
 299                     ; 31 	PC_DDR = PC_DDR | (1 << 6); PC_CR1 = PC_CR1 | (1 << 6);	//23
 301  003c 721c500c      	bset	20492,#6
 304  0040 721c500d      	bset	20493,#6
 305                     ; 33 	PA_DDR = PA_DDR | (1 << 2); PA_CR1 = PA_CR1 | (1 << 2);	//3
 307  0044 72145002      	bset	20482,#2
 310  0048 72145003      	bset	20483,#2
 311                     ; 34 	PA_DDR = PA_DDR | (1 << 3); PA_CR1 = PA_CR1 | (1 << 3);	//7
 313  004c 72165002      	bset	20482,#3
 316  0050 72165003      	bset	20483,#3
 317                     ; 35 	PF_DDR = PF_DDR | (1 << 4); PF_CR1 = PF_CR1 | (1 << 4);	//8
 319  0054 7218501b      	bset	20507,#4
 322  0058 7218501c      	bset	20508,#4
 323                     ; 36 	PB_DDR = PB_DDR | (1 << 7); PB_CR1 = PB_CR1 | (1 << 7);	//9
 325  005c 721e5007      	bset	20487,#7
 328  0060 721e5008      	bset	20488,#7
 329                     ; 37 	PB_DDR = PB_DDR | (1 << 6); PB_CR1 = PB_CR1 | (1 << 6);	//10
 331  0064 721c5007      	bset	20487,#6
 334  0068 721c5008      	bset	20488,#6
 335                     ; 39 	PE_DDR = PE_DDR | (1 << 5);
 337  006c 721a5016      	bset	20502,#5
 338                     ; 40 	PE_CR1 = PE_CR1 | (1 << 5);
 340  0070 721a5017      	bset	20503,#5
 341                     ; 41 	PE_ODR = PE_ODR | (1 << 5);	//17  EN1
 343  0074 721a5014      	bset	20500,#5
 344                     ; 43 	PC_DDR = PC_DDR | (1 << 7);
 346  0078 721e500c      	bset	20492,#7
 347                     ; 44 	PC_CR1 = PC_CR1 | (1 << 7);
 349  007c 721e500d      	bset	20493,#7
 350                     ; 45 	PC_ODR = PC_ODR | (1 << 7);	//24	EN2
 352  0080 721e500a      	bset	20490,#7
 353                     ; 47 	pwmx	=0;//both can't be 1 togather
 355  0084 7213500a      	bres	_pwmx
 356                     ; 48 	pwmxx	=0;
 358  0088 7215500a      	bres	_pwmxx
 359                     ; 50 	pwmy	=0;//both can't be 1 togather
 361  008c 7217500a      	bres	_pwmy
 362                     ; 51 	pwmyy	=0;
 364  0090 7219500a      	bres	_pwmyy
 365                     ; 53 	pwmz	=0;
 367  0094 721b500a      	bres	_pwmz
 368                     ; 54 	pwmzz	=0;//both can't be 1 togather
 370  0098 721d500a      	bres	_pwmzz
 371                     ; 56 }
 374  009c 81            	ret
 418                     ; 57 int startroutine(int desired,int old)
 418                     ; 58 {
 419                     	switch	.text
 420  009d               _startroutine:
 422  009d 89            	pushw	x
 423       00000000      OFST:	set	0
 426                     ; 59 	if (start < (desired-old))
 428  009e 72f005        	subw	x,(OFST+5,sp)
 429  00a1 b300          	cpw	x,_start
 430  00a3 230a          	jrule	L141
 431                     ; 60 		{old=old+start;}
 433  00a5 1e05          	ldw	x,(OFST+5,sp)
 434  00a7 72bb0000      	addw	x,_start
 435  00ab 1f05          	ldw	(OFST+5,sp),x
 437  00ad 2004          	jra	L341
 438  00af               L141:
 439                     ; 62 		{old = desired;}
 441  00af 1e01          	ldw	x,(OFST+1,sp)
 442  00b1 1f05          	ldw	(OFST+5,sp),x
 443  00b3               L341:
 444                     ; 63 	return old;
 446  00b3 1e05          	ldw	x,(OFST+5,sp)
 449  00b5 5b02          	addw	sp,#2
 450  00b7 81            	ret
 494                     ; 65 int stoproutine(int desired,int old)
 494                     ; 66 {
 495                     	switch	.text
 496  00b8               _stoproutine:
 498  00b8 89            	pushw	x
 499       00000000      OFST:	set	0
 502                     ; 67 	if (stop < (old-desired))
 504  00b9 1e05          	ldw	x,(OFST+5,sp)
 505  00bb 72f001        	subw	x,(OFST+1,sp)
 506  00be b300          	cpw	x,_stop
 507  00c0 230a          	jrule	L761
 508                     ; 68 		{old = old - stop;}
 510  00c2 1e05          	ldw	x,(OFST+5,sp)
 511  00c4 72b00000      	subw	x,_stop
 512  00c8 1f05          	ldw	(OFST+5,sp),x
 514  00ca 2004          	jra	L171
 515  00cc               L761:
 516                     ; 70 		{old = desired;}	
 518  00cc 1e01          	ldw	x,(OFST+1,sp)
 519  00ce 1f05          	ldw	(OFST+5,sp),x
 520  00d0               L171:
 521                     ; 71 	return old;
 523  00d0 1e05          	ldw	x,(OFST+5,sp)
 526  00d2 5b02          	addw	sp,#2
 527  00d4 81            	ret
 572                     ; 73 int iteration(int desired,int old)
 572                     ; 74 {	
 573                     	switch	.text
 574  00d5               _iteration:
 576  00d5 89            	pushw	x
 577       00000000      OFST:	set	0
 580                     ; 76 	if ((desired <= 0)&&(old <= 0))
 582  00d6 9c            	rvf
 583  00d7 a30000        	cpw	x,#0
 584  00da 2c2c          	jrsgt	L512
 586  00dc 9c            	rvf
 587  00dd 1e05          	ldw	x,(OFST+5,sp)
 588  00df 2c27          	jrsgt	L512
 589                     ; 78 				if( desired < old)// desired is more -ve
 591  00e1 9c            	rvf
 592  00e2 1e01          	ldw	x,(OFST+1,sp)
 593  00e4 1305          	cpw	x,(OFST+5,sp)
 594  00e6 2e10          	jrsge	L712
 595                     ; 79 					old = 0 - startroutine(-desired,-old);
 597  00e8 1e05          	ldw	x,(OFST+5,sp)
 598  00ea 50            	negw	x
 599  00eb 89            	pushw	x
 600  00ec 1e03          	ldw	x,(OFST+3,sp)
 601  00ee 50            	negw	x
 602  00ef adac          	call	_startroutine
 604  00f1 5b02          	addw	sp,#2
 605  00f3 50            	negw	x
 606  00f4 1f05          	ldw	(OFST+5,sp),x
 608  00f6 205b          	jra	L322
 609  00f8               L712:
 610                     ; 81 					old = 0- stoproutine(-desired,-old);
 612  00f8 1e05          	ldw	x,(OFST+5,sp)
 613  00fa 50            	negw	x
 614  00fb 89            	pushw	x
 615  00fc 1e03          	ldw	x,(OFST+3,sp)
 616  00fe 50            	negw	x
 617  00ff adb7          	call	_stoproutine
 619  0101 5b02          	addw	sp,#2
 620  0103 50            	negw	x
 621  0104 1f05          	ldw	(OFST+5,sp),x
 622  0106 204b          	jra	L322
 623  0108               L512:
 624                     ; 84 	else if((desired >= 0)&&(old >= 0))
 626  0108 9c            	rvf
 627  0109 1e01          	ldw	x,(OFST+1,sp)
 628  010b 2f27          	jrslt	L522
 630  010d 9c            	rvf
 631  010e 1e05          	ldw	x,(OFST+5,sp)
 632  0110 2f22          	jrslt	L522
 633                     ; 86 				if (desired < old)
 635  0112 9c            	rvf
 636  0113 1e01          	ldw	x,(OFST+1,sp)
 637  0115 1305          	cpw	x,(OFST+5,sp)
 638  0117 2e0d          	jrsge	L722
 639                     ; 87 					old = stoproutine(desired,old);	
 641  0119 1e05          	ldw	x,(OFST+5,sp)
 642  011b 89            	pushw	x
 643  011c 1e03          	ldw	x,(OFST+3,sp)
 644  011e ad98          	call	_stoproutine
 646  0120 5b02          	addw	sp,#2
 647  0122 1f05          	ldw	(OFST+5,sp),x
 649  0124 202d          	jra	L322
 650  0126               L722:
 651                     ; 89 					old = startroutine(desired,old);
 653  0126 1e05          	ldw	x,(OFST+5,sp)
 654  0128 89            	pushw	x
 655  0129 1e03          	ldw	x,(OFST+3,sp)
 656  012b cd009d        	call	_startroutine
 658  012e 5b02          	addw	sp,#2
 659  0130 1f05          	ldw	(OFST+5,sp),x
 660  0132 201f          	jra	L322
 661  0134               L522:
 662                     ; 94 				if (old<0)//ie, desired in other quadrant
 664  0134 9c            	rvf
 665  0135 1e05          	ldw	x,(OFST+5,sp)
 666  0137 2e0f          	jrsge	L532
 667                     ; 95 					old = 0 - stoproutine(0x0000,-old);//old	<	0
 669  0139 1e05          	ldw	x,(OFST+5,sp)
 670  013b 50            	negw	x
 671  013c 89            	pushw	x
 672  013d 5f            	clrw	x
 673  013e cd00b8        	call	_stoproutine
 675  0141 5b02          	addw	sp,#2
 676  0143 50            	negw	x
 677  0144 1f05          	ldw	(OFST+5,sp),x
 679  0146 200b          	jra	L322
 680  0148               L532:
 681                     ; 97 					old = stoproutine(0x0000,old);//desired < 0
 683  0148 1e05          	ldw	x,(OFST+5,sp)
 684  014a 89            	pushw	x
 685  014b 5f            	clrw	x
 686  014c cd00b8        	call	_stoproutine
 688  014f 5b02          	addw	sp,#2
 689  0151 1f05          	ldw	(OFST+5,sp),x
 690  0153               L322:
 691                     ; 99 	return old;
 693  0153 1e05          	ldw	x,(OFST+5,sp)
 696  0155 5b02          	addw	sp,#2
 697  0157 81            	ret
 803                     ; 101 void main()
 803                     ; 102 {
 804                     	switch	.text
 805  0158               _main:
 807  0158 5210          	subw	sp,#16
 808       00000010      OFST:	set	16
 811                     ; 104 	int oldx=0,oldy=0,oldz=0;
 813  015a 5f            	clrw	x
 814  015b 1f05          	ldw	(OFST-11,sp),x
 817  015d 5f            	clrw	x
 818  015e 1f07          	ldw	(OFST-9,sp),x
 821  0160 5f            	clrw	x
 822  0161 1f09          	ldw	(OFST-7,sp),x
 823                     ; 105 	int desiredx=0,desiredy=0,desiredz=0;
 829                     ; 106 	sim();	
 831  0163 cd0002        	call	_sim
 833                     ; 107 	InitClock();
 835  0166 cd0004        	call	_InitClock
 837                     ; 108 	InitGPIO();
 839  0169 cd0014        	call	_InitGPIO
 841                     ; 109 	SetupADC();
 843  016c cd0000        	call	_SetupADC
 845                     ; 110 	SetupTimer2PWM3();
 847  016f cd0000        	call	_SetupTimer2PWM3
 849                     ; 111 	SetupTimer1();
 851  0172 cd0000        	call	_SetupTimer1
 853                     ; 112 	rim();
 855  0175 cd0000        	call	_rim
 857  0178               L703:
 858                     ; 116 		desiredx=ainx*((float)accx/900);// -511< ainx <=512
 860  0178 be00          	ldw	x,_ainx
 861  017a cd0000        	call	c_itof
 863  017d 96            	ldw	x,sp
 864  017e 1c0001        	addw	x,#OFST-15
 865  0181 cd0000        	call	c_rtol
 867  0184 be00          	ldw	x,_accx
 868  0186 cd0000        	call	c_uitof
 870  0189 ae0000        	ldw	x,#L713
 871  018c cd0000        	call	c_fdiv
 873  018f 96            	ldw	x,sp
 874  0190 1c0001        	addw	x,#OFST-15
 875  0193 cd0000        	call	c_fmul
 877  0196 cd0000        	call	c_ftoi
 879  0199 1f0f          	ldw	(OFST-1,sp),x
 880                     ; 117 		if (desiredx > 512)
 882  019b 9c            	rvf
 883  019c 1e0f          	ldw	x,(OFST-1,sp)
 884  019e a30201        	cpw	x,#513
 885  01a1 2f05          	jrslt	L323
 886                     ; 118 			{desiredx = 512;}
 888  01a3 ae0200        	ldw	x,#512
 889  01a6 1f0f          	ldw	(OFST-1,sp),x
 890  01a8               L323:
 891                     ; 119 		if (desiredx <- 511)
 893  01a8 9c            	rvf
 894  01a9 1e0f          	ldw	x,(OFST-1,sp)
 895  01ab a3fe01        	cpw	x,#65025
 896  01ae 2e05          	jrsge	L523
 897                     ; 120 			{desiredx = -511;}			
 899  01b0 aefe01        	ldw	x,#65025
 900  01b3 1f0f          	ldw	(OFST-1,sp),x
 901  01b5               L523:
 902                     ; 122 		desiredy=ainy*((float)accy/900);
 904  01b5 be00          	ldw	x,_ainy
 905  01b7 cd0000        	call	c_itof
 907  01ba 96            	ldw	x,sp
 908  01bb 1c0001        	addw	x,#OFST-15
 909  01be cd0000        	call	c_rtol
 911  01c1 be00          	ldw	x,_accy
 912  01c3 cd0000        	call	c_uitof
 914  01c6 ae0000        	ldw	x,#L713
 915  01c9 cd0000        	call	c_fdiv
 917  01cc 96            	ldw	x,sp
 918  01cd 1c0001        	addw	x,#OFST-15
 919  01d0 cd0000        	call	c_fmul
 921  01d3 cd0000        	call	c_ftoi
 923  01d6 1f0b          	ldw	(OFST-5,sp),x
 924                     ; 123 		if (desiredy>512)
 926  01d8 9c            	rvf
 927  01d9 1e0b          	ldw	x,(OFST-5,sp)
 928  01db a30201        	cpw	x,#513
 929  01de 2f05          	jrslt	L723
 930                     ; 124 			{desiredy=512;}
 932  01e0 ae0200        	ldw	x,#512
 933  01e3 1f0b          	ldw	(OFST-5,sp),x
 934  01e5               L723:
 935                     ; 125 		if (desiredy<-511)
 937  01e5 9c            	rvf
 938  01e6 1e0b          	ldw	x,(OFST-5,sp)
 939  01e8 a3fe01        	cpw	x,#65025
 940  01eb 2e05          	jrsge	L133
 941                     ; 126 			{desiredy=-511;}		
 943  01ed aefe01        	ldw	x,#65025
 944  01f0 1f0b          	ldw	(OFST-5,sp),x
 945  01f2               L133:
 946                     ; 128 		desiredz=ainz*((float)accz/900);
 948  01f2 be00          	ldw	x,_ainz
 949  01f4 cd0000        	call	c_itof
 951  01f7 96            	ldw	x,sp
 952  01f8 1c0001        	addw	x,#OFST-15
 953  01fb cd0000        	call	c_rtol
 955  01fe be00          	ldw	x,_accz
 956  0200 cd0000        	call	c_uitof
 958  0203 ae0000        	ldw	x,#L713
 959  0206 cd0000        	call	c_fdiv
 961  0209 96            	ldw	x,sp
 962  020a 1c0001        	addw	x,#OFST-15
 963  020d cd0000        	call	c_fmul
 965  0210 cd0000        	call	c_ftoi
 967  0213 1f0d          	ldw	(OFST-3,sp),x
 968                     ; 129 		if (desiredz>512)
 970  0215 9c            	rvf
 971  0216 1e0d          	ldw	x,(OFST-3,sp)
 972  0218 a30201        	cpw	x,#513
 973  021b 2f05          	jrslt	L333
 974                     ; 130 			{desiredz=512;}
 976  021d ae0200        	ldw	x,#512
 977  0220 1f0d          	ldw	(OFST-3,sp),x
 978  0222               L333:
 979                     ; 131 		if (desiredz<-511)
 981  0222 9c            	rvf
 982  0223 1e0d          	ldw	x,(OFST-3,sp)
 983  0225 a3fe01        	cpw	x,#65025
 984  0228 2e05          	jrsge	L533
 985                     ; 132 			{desiredz=-511;}
 987  022a aefe01        	ldw	x,#65025
 988  022d 1f0d          	ldw	(OFST-3,sp),x
 989  022f               L533:
 990                     ; 134 	if (GO==1)
 992                     	btst	_GO
 993  0234 2503          	jrult	L42
 994  0236 cc0178        	jp	L703
 995  0239               L42:
 996                     ; 136 			GO=0;
 998  0239 72110000      	bres	_GO
 999                     ; 137 			oldx = iteration(desiredx,oldx);
1001  023d 1e05          	ldw	x,(OFST-11,sp)
1002  023f 89            	pushw	x
1003  0240 1e11          	ldw	x,(OFST+1,sp)
1004  0242 cd00d5        	call	_iteration
1006  0245 5b02          	addw	sp,#2
1007  0247 1f05          	ldw	(OFST-11,sp),x
1008                     ; 138 			temp = oldx;
1010  0249 1e05          	ldw	x,(OFST-11,sp)
1011  024b 1f0f          	ldw	(OFST-1,sp),x
1012                     ; 140 			if (temp < 0)
1014  024d 9c            	rvf
1015  024e 1e0f          	ldw	x,(OFST-1,sp)
1016  0250 2e0b          	jrsge	L143
1017                     ; 141 				{temp = 0-temp;left=1;}
1019  0252 1e0f          	ldw	x,(OFST-1,sp)
1020  0254 50            	negw	x
1021  0255 1f0f          	ldw	(OFST-1,sp),x
1024  0257 72100000      	bset	_left
1026  025b 2004          	jra	L343
1027  025d               L143:
1028                     ; 143 				{left=0;}
1030  025d 72110000      	bres	_left
1031  0261               L343:
1032                     ; 146 			if(temp==0)
1034  0261 1e0f          	ldw	x,(OFST-1,sp)
1035  0263 2605          	jrne	L543
1036                     ; 147 				{temp=1;}
1038  0265 ae0001        	ldw	x,#1
1039  0268 1f0f          	ldw	(OFST-1,sp),x
1040  026a               L543:
1041                     ; 151 			TIM2_CCR1H = ((temp & 0xFF00)>>8);
1043  026a 7b0f          	ld	a,(OFST-1,sp)
1044  026c 97            	ld	xl,a
1045  026d 7b10          	ld	a,(OFST+0,sp)
1046  026f 9f            	ld	a,xl
1047  0270 a4ff          	and	a,#255
1048  0272 97            	ld	xl,a
1049  0273 4f            	clr	a
1050  0274 02            	rlwa	x,a
1051  0275 4f            	clr	a
1052  0276 01            	rrwa	x,a
1053  0277 01            	rrwa	x,a
1054  0278 c75311        	ld	21265,a
1055  027b 02            	rlwa	x,a
1056                     ; 152 			TIM2_CCR1L = (temp & 0x00FF);
1058  027c 7b10          	ld	a,(OFST+0,sp)
1059  027e a4ff          	and	a,#255
1060  0280 c75312        	ld	21266,a
1061                     ; 154 			oldy = iteration(desiredy,oldy);		
1063  0283 1e07          	ldw	x,(OFST-9,sp)
1064  0285 89            	pushw	x
1065  0286 1e0d          	ldw	x,(OFST-3,sp)
1066  0288 cd00d5        	call	_iteration
1068  028b 5b02          	addw	sp,#2
1069  028d 1f07          	ldw	(OFST-9,sp),x
1070                     ; 155 			temp=oldy;
1072  028f 1e07          	ldw	x,(OFST-9,sp)
1073  0291 1f0f          	ldw	(OFST-1,sp),x
1074                     ; 157 			if (temp<0)
1076  0293 9c            	rvf
1077  0294 1e0f          	ldw	x,(OFST-1,sp)
1078  0296 2e0b          	jrsge	L743
1079                     ; 158 				{temp=0-temp;up=1;}
1081  0298 1e0f          	ldw	x,(OFST-1,sp)
1082  029a 50            	negw	x
1083  029b 1f0f          	ldw	(OFST-1,sp),x
1086  029d 72100000      	bset	_up
1088  02a1 2004          	jra	L153
1089  02a3               L743:
1090                     ; 160 				{up=0;}
1092  02a3 72110000      	bres	_up
1093  02a7               L153:
1094                     ; 163 			if(temp==0)
1096  02a7 1e0f          	ldw	x,(OFST-1,sp)
1097  02a9 2605          	jrne	L353
1098                     ; 164 				{temp=1;}
1100  02ab ae0001        	ldw	x,#1
1101  02ae 1f0f          	ldw	(OFST-1,sp),x
1102  02b0               L353:
1103                     ; 167 			TIM2_CCR2H = ((temp & 0xFF00)>>8);
1105  02b0 7b0f          	ld	a,(OFST-1,sp)
1106  02b2 97            	ld	xl,a
1107  02b3 7b10          	ld	a,(OFST+0,sp)
1108  02b5 9f            	ld	a,xl
1109  02b6 a4ff          	and	a,#255
1110  02b8 97            	ld	xl,a
1111  02b9 4f            	clr	a
1112  02ba 02            	rlwa	x,a
1113  02bb 4f            	clr	a
1114  02bc 01            	rrwa	x,a
1115  02bd 01            	rrwa	x,a
1116  02be c75313        	ld	21267,a
1117  02c1 02            	rlwa	x,a
1118                     ; 168 			TIM2_CCR2L = (temp & 0x00FF);		
1120  02c2 7b10          	ld	a,(OFST+0,sp)
1121  02c4 a4ff          	and	a,#255
1122  02c6 c75314        	ld	21268,a
1123                     ; 170 			oldz = iteration(desiredz,oldz);
1125  02c9 1e09          	ldw	x,(OFST-7,sp)
1126  02cb 89            	pushw	x
1127  02cc 1e0f          	ldw	x,(OFST-1,sp)
1128  02ce cd00d5        	call	_iteration
1130  02d1 5b02          	addw	sp,#2
1131  02d3 1f09          	ldw	(OFST-7,sp),x
1132                     ; 171 			temp=oldz;
1134  02d5 1e09          	ldw	x,(OFST-7,sp)
1135  02d7 1f0f          	ldw	(OFST-1,sp),x
1136                     ; 173 			if (temp<0)
1138  02d9 9c            	rvf
1139  02da 1e0f          	ldw	x,(OFST-1,sp)
1140  02dc 2e0b          	jrsge	L553
1141                     ; 174 				{temp=0-temp;forward=1;}
1143  02de 1e0f          	ldw	x,(OFST-1,sp)
1144  02e0 50            	negw	x
1145  02e1 1f0f          	ldw	(OFST-1,sp),x
1148  02e3 72100000      	bset	_forward
1150  02e7 2004          	jra	L753
1151  02e9               L553:
1152                     ; 176 				{forward=0;}
1154  02e9 72110000      	bres	_forward
1155  02ed               L753:
1156                     ; 178 			if(temp==0)
1158  02ed 1e0f          	ldw	x,(OFST-1,sp)
1159  02ef 2605          	jrne	L163
1160                     ; 179 				{temp=1;}								
1162  02f1 ae0001        	ldw	x,#1
1163  02f4 1f0f          	ldw	(OFST-1,sp),x
1164  02f6               L163:
1165                     ; 181 			TIM2_CCR3H = ((temp & 0xFF00)>>8);
1167  02f6 7b0f          	ld	a,(OFST-1,sp)
1168  02f8 97            	ld	xl,a
1169  02f9 7b10          	ld	a,(OFST+0,sp)
1170  02fb 9f            	ld	a,xl
1171  02fc a4ff          	and	a,#255
1172  02fe 97            	ld	xl,a
1173  02ff 4f            	clr	a
1174  0300 02            	rlwa	x,a
1175  0301 4f            	clr	a
1176  0302 01            	rrwa	x,a
1177  0303 01            	rrwa	x,a
1178  0304 c75315        	ld	21269,a
1179  0307 02            	rlwa	x,a
1180                     ; 182 			TIM2_CCR3L = (temp & 0x00FF);		
1182  0308 7b10          	ld	a,(OFST+0,sp)
1183  030a a4ff          	and	a,#255
1184  030c c75316        	ld	21270,a
1185  030f ac780178      	jpf	L703
1198                     	xdef	_main
1199                     	xdef	_iteration
1200                     	xdef	_stoproutine
1201                     	xdef	_startroutine
1202                     	xdef	_InitGPIO
1203                     	xdef	_InitClock
1204                     	xdef	_sim
1205                     	xdef	_rim
1206                     	xbit	_GO
1207                     	xref	_SetupTimer1
1208                     	xref.b	_stop
1209                     	xref.b	_start
1210                     	xref.b	_accz
1211                     	xref.b	_accy
1212                     	xref.b	_accx
1213                     	xref.b	_ainz
1214                     	xref.b	_ainy
1215                     	xref.b	_ainx
1216                     	xref	_SetupADC
1217                     	xbit	_forward
1218                     	xbit	_up
1219                     	xbit	_left
1220                     	xref	_SetupTimer2PWM3
1221                     .const:	section	.text
1222  0000               L713:
1223  0000 44610000      	dc.w	17505,0
1224                     	xref.b	c_x
1244                     	xref	c_ftoi
1245                     	xref	c_fmul
1246                     	xref	c_rtol
1247                     	xref	c_itof
1248                     	xref	c_fdiv
1249                     	xref	c_uitof
1250                     	end
