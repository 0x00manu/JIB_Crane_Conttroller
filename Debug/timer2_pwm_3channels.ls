   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  37                     .bit:	section	.data,bit
  38  0000               _left:
  39  0000 00            	dc.b	0
  40  0001               _up:
  41  0001 00            	dc.b	0
  42  0002               _forward:
  43  0002 00            	dc.b	0
  86                     ; 19 @far @interrupt void TIM2_UPD_OVF(void)
  86                     ; 20 	{
  87                     	switch	.text
  88  0000               f_TIM2_UPD_OVF:
  92                     ; 21 		if (left==1)
  94                     	btst	_left
  95  0005 240a          	jruge	L12
  96                     ; 22 				{pwmx=1;pwmxx=0;}
  98  0007 7212500a      	bset	_pwmx
 101  000b 7215500a      	bres	_pwmxx
 103  000f 2008          	jra	L32
 104  0011               L12:
 105                     ; 24 				{pwmx=0;pwmxx=1;}			
 107  0011 7213500a      	bres	_pwmx
 110  0015 7214500a      	bset	_pwmxx
 111  0019               L32:
 112                     ; 25 		if (up==1)
 114                     	btst	_up
 115  001e 240a          	jruge	L52
 116                     ; 26 				{pwmy=1;pwmyy=0;}
 118  0020 7216500a      	bset	_pwmy
 121  0024 7219500a      	bres	_pwmyy
 123  0028 2008          	jra	L72
 124  002a               L52:
 125                     ; 28 				{pwmy=0;pwmyy=1;}			
 127  002a 7217500a      	bres	_pwmy
 130  002e 7218500a      	bset	_pwmyy
 131  0032               L72:
 132                     ; 29 		if (forward==1)
 134                     	btst	_forward
 135  0037 240a          	jruge	L13
 136                     ; 30 				{pwmz=1;pwmzz=0;}
 138  0039 721a500a      	bset	_pwmz
 141  003d 721d500a      	bres	_pwmzz
 143  0041 2008          	jra	L33
 144  0043               L13:
 145                     ; 32 				{pwmz=0;pwmzz=1;}			
 147  0043 721b500a      	bres	_pwmz
 150  0047 721c500a      	bset	_pwmzz
 151  004b               L33:
 152                     ; 33 		UIF=0;CC1IF=0;CC2IF=0;CC3IF=0;
 154  004b 72115304      	bres	_UIF
 157  004f 72135304      	bres	_CC1IF
 160  0053 72155304      	bres	_CC2IF
 163  0057 72175304      	bres	_CC3IF
 164                     ; 34 	}
 167  005b 80            	iret
 209                     ; 35 @far @interrupt void TIM2_CAPCOM(void)
 209                     ; 36 {
 210                     	switch	.text
 211  005c               f_TIM2_CAPCOM:
 213       00000001      OFST:	set	1
 214  005c 88            	push	a
 217                     ; 37 	unsigned char temp = TIM2_SR1 & 0X0E;
 219  005d c65304        	ld	a,21252
 220  0060 a40e          	and	a,#14
 221  0062 6b01          	ld	(OFST+0,sp),a
 222                     ; 38 	switch (temp)
 224  0064 7b01          	ld	a,(OFST+0,sp)
 226                     ; 48 								pwmxx=0;pwmyy=0;pwmzz=0;
 227  0066 a002          	sub	a,#2
 228  0068 273e          	jreq	L53
 229  006a a002          	sub	a,#2
 230  006c 2748          	jreq	L73
 231  006e a002          	sub	a,#2
 232  0070 2760          	jreq	L34
 233  0072 a002          	sub	a,#2
 234  0074 274e          	jreq	L14
 235  0076 a002          	sub	a,#2
 236  0078 2772          	jreq	L54
 237  007a a002          	sub	a,#2
 238  007c 2604ac060106  	jreq	L74
 239  0082               L15:
 240                     ; 47 			default 	:CC1IF=0;CC2IF=0;CC3IF=0;pwmx=0;pwmy=0;pwmz=0;
 242  0082 72135304      	bres	_CC1IF
 245  0086 72155304      	bres	_CC2IF
 248  008a 72175304      	bres	_CC3IF
 251  008e 7213500a      	bres	_pwmx
 254  0092 7217500a      	bres	_pwmy
 257  0096 721b500a      	bres	_pwmz
 258                     ; 48 								pwmxx=0;pwmyy=0;pwmzz=0;
 260  009a 7215500a      	bres	_pwmxx
 263  009e 7219500a      	bres	_pwmyy
 266  00a2 721d500a      	bres	_pwmzz
 267  00a6 2076          	jra	L37
 268  00a8               L53:
 269                     ; 40 			case 0x02:CC1IF=0;pwmx=0;pwmxx=0;break;
 271  00a8 72135304      	bres	_CC1IF
 274  00ac 7213500a      	bres	_pwmx
 277  00b0 7215500a      	bres	_pwmxx
 280  00b4 2068          	jra	L37
 281  00b6               L73:
 282                     ; 41 			case 0x04:CC2IF=0;pwmy=0;pwmyy=0;break;
 284  00b6 72155304      	bres	_CC2IF
 287  00ba 7217500a      	bres	_pwmy
 290  00be 7219500a      	bres	_pwmyy
 293  00c2 205a          	jra	L37
 294  00c4               L14:
 295                     ; 42 			case 0x08:CC3IF=0;pwmz=0;pwmzz=0; break;
 297  00c4 72175304      	bres	_CC3IF
 300  00c8 721b500a      	bres	_pwmz
 303  00cc 721d500a      	bres	_pwmzz
 306  00d0 204c          	jra	L37
 307  00d2               L34:
 308                     ; 44 			case 0x06:CC2IF=0;pwmy=0;pwmyy=0;CC1IF=0;pwmx=0;pwmxx=0;break;
 310  00d2 72155304      	bres	_CC2IF
 313  00d6 7217500a      	bres	_pwmy
 316  00da 7219500a      	bres	_pwmyy
 319  00de 72135304      	bres	_CC1IF
 322  00e2 7213500a      	bres	_pwmx
 325  00e6 7215500a      	bres	_pwmxx
 328  00ea 2032          	jra	L37
 329  00ec               L54:
 330                     ; 45 			case 0x0A:CC3IF=0;pwmz=0;pwmzz=0;CC1IF=0;pwmx=0;pwmxx=0;break;
 332  00ec 72175304      	bres	_CC3IF
 335  00f0 721b500a      	bres	_pwmz
 338  00f4 721d500a      	bres	_pwmzz
 341  00f8 72135304      	bres	_CC1IF
 344  00fc 7213500a      	bres	_pwmx
 347  0100 7215500a      	bres	_pwmxx
 350  0104 2018          	jra	L37
 351  0106               L74:
 352                     ; 46 			case 0x0C:CC3IF=0;pwmz=0;pwmzz=0;CC2IF=0;pwmy=0;pwmyy=0;break;
 354  0106 72175304      	bres	_CC3IF
 357  010a 721b500a      	bres	_pwmz
 360  010e 721d500a      	bres	_pwmzz
 363  0112 72155304      	bres	_CC2IF
 366  0116 7217500a      	bres	_pwmy
 369  011a 7219500a      	bres	_pwmyy
 372  011e               L37:
 373                     ; 50 }
 376  011e 84            	pop	a
 377  011f 80            	iret
 399                     ; 52 void SetupTimer2PWM3(void)
 399                     ; 53 {
 401                     	switch	.text
 402  0120               _SetupTimer2PWM3:
 406                     ; 55 	TIM2_PSCR = 0x07;   //  Prescaler = 2^4=16; 16e6/16 = 1MHz
 408  0120 3507530e      	mov	21262,#7
 409                     ; 56 	TIM2_ARRH = 0x01;   //  0x01FF = 511
 411  0124 3501530f      	mov	21263,#1
 412                     ; 57 	TIM2_ARRL = 0xFF;   //  511+1 =  512
 414  0128 35ff5310      	mov	21264,#255
 415                     ; 59 			TIM2_CCR1H = 0x00;//CCR1H is 
 417  012c 725f5311      	clr	21265
 418                     ; 60 			TIM2_CCR1L = 0x00;//compared with ARRH-ARRL
 420  0130 725f5312      	clr	21266
 421                     ; 63 			TIM2_CCR2H = 0x00;//Capture Compare Register 2 Higner
 423  0134 725f5313      	clr	21267
 424                     ; 64 			TIM2_CCR2L = 0x00;//Capture Compare Register 2 Lower
 426  0138 725f5314      	clr	21268
 427                     ; 67 			TIM2_CCR3H = 0x00;//Capture Compare Register 3 Higher
 429  013c 725f5315      	clr	21269
 430                     ; 68 			TIM2_CCR3L = 0x00;//Capture Compare Register 3 Lower
 432  0140 725f5316      	clr	21270
 433                     ; 71 	TIM2_IER = TIM2_IER | 0x0F;//UIE=1,CC1IE=1,CC2IE=1,CC3I3=1;
 435  0144 c65303        	ld	a,21251
 436  0147 aa0f          	or	a,#15
 437  0149 c75303        	ld	21251,a
 438                     ; 72 	TIM2_CR1 = TIM2_CR1 | TIM2_CR1_CEN;//Counter Enable (Run)
 440  014c 72105300      	bset	21248,#0
 441                     ; 73 }
 444  0150 81            	ret
 589                     	xdef	_SetupTimer2PWM3
 590                     	xdef	f_TIM2_CAPCOM
 591                     	xdef	f_TIM2_UPD_OVF
 592                     	xdef	_forward
 593                     	xdef	_up
 594                     	xdef	_left
 613                     	end
