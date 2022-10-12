   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  15                     .bit:	section	.data,bit
  16  0000               _GO:
  17  0000 00            	dc.b	0
  46                     ; 4 void SetupTimer1(void)
  46                     ; 5 {
  48                     	switch	.text
  49  0000               _SetupTimer1:
  53                     ; 6 	TIM1_PSCRH = 0x01;	//first load PSCRH then PSCRL
  55  0000 35015260      	mov	21088,#1
  56                     ; 7 	TIM1_PSCRL = 0x00;  //  0x06
  58  0004 725f5261      	clr	21089
  59                     ; 8 	TIM1_ARRH = 0x00;   //  0x18
  61  0008 725f5262      	clr	21090
  62                     ; 9 	TIM1_ARRL = 0xE7;   //  40ms
  64  000c 35e75263      	mov	21091,#231
  65                     ; 10 	TIM1_IER = TIM1_IER | 0x01;//UIE=1,CC1IE=1,CC2IE=1,CC3I3=1;
  67  0010 72105254      	bset	21076,#0
  68                     ; 11 	TIM1_CR1 = TIM1_CR1 | TIM_CR1_CEN;//Counter Enable (Run)
  70  0014 72105250      	bset	21072,#0
  71                     ; 12 }
  74  0018 81            	ret
  98                     ; 14 @far @interrupt void TIM1_OVF(void)
  98                     ; 15 	{	
 100                     	switch	.text
 101  0019               f_TIM1_OVF:
 105                     ; 16 		GO=1;
 107  0019 72100000      	bset	_GO
 108                     ; 17 		TIM1_SR1 = TIM1_SR1 & ~TIM_SR1_UIF;
 110  001d 72115255      	bres	21077,#0
 111                     ; 18 	}
 114  0021 80            	iret
 138                     	xdef	f_TIM1_OVF
 139                     	xdef	_SetupTimer1
 140                     	xdef	_GO
 159                     	end
