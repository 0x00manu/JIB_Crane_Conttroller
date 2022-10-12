   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 122                     .const:	section	.text
 123  0000               _table:
 124  0000 01            	dc.b	1
 125  0001 02            	dc.b	2
 126  0002 03            	dc.b	3
 127  0003 04            	dc.b	4
 128  0004 05            	dc.b	5
 129  0005 06            	dc.b	6
 130  0006 07            	dc.b	7
 131  0007 08            	dc.b	8
 132  0008 09            	dc.b	9
 133  0009 0a            	dc.b	10
 134  000a 0b            	dc.b	11
 135  000b 0c            	dc.b	12
 136  000c 0d            	dc.b	13
 137  000d 0e            	dc.b	14
 138  000e 0f            	dc.b	15
 139  000f 10            	dc.b	16
 140  0010 11            	dc.b	17
 141  0011 12            	dc.b	18
 142  0012 13            	dc.b	19
 143  0013 14            	dc.b	20
 144  0014 15            	dc.b	21
 145  0015 16            	dc.b	22
 146  0016 17            	dc.b	23
 147  0017 18            	dc.b	24
 148  0018 19            	dc.b	25
 149  0019 32            	dc.b	50
 150  001a 40            	dc.b	64
 151  001b 60            	dc.b	96
 152  001c 80            	dc.b	128
 153  001d 00            	dc.b	0
 154  001e ff            	dc.b	255
 155  001f ff            	dc.b	255
 156                     	bsct
 157  0000               _channel:
 158  0000 00            	dc.b	0
 159  0001               _ainx:
 160  0001 0000          	dc.w	0
 161  0003               _ainy:
 162  0003 0000          	dc.w	0
 163  0005               _ainz:
 164  0005 0000          	dc.w	0
 165  0007               _accx:
 166  0007 0000          	dc.w	0
 167  0009               _accy:
 168  0009 0000          	dc.w	0
 169  000b               _accz:
 170  000b 0000          	dc.w	0
 171  000d               _start:
 172  000d 0000          	dc.w	0
 173  000f               _stop:
 174  000f 0000          	dc.w	0
 219                     ; 22 @far @interrupt  void ADC1_EOC_IRQHandler(void)
 219                     ; 23 { 
 220                     	switch	.text
 221  0000               f_ADC1_EOC_IRQHandler:
 225                     ; 24 	switch (channel)
 227  0000 b600          	ld	a,_channel
 229                     ; 98 						break;
 230  0002 4d            	tnz	a
 231  0003 2731          	jreq	L34
 232  0005 4a            	dec	a
 233  0006 2761          	jreq	L54
 234  0008 4a            	dec	a
 235  0009 2604ac9c009c  	jreq	L74
 236  000f 4a            	dec	a
 237  0010 2604          	jrne	L21
 238  0012 accf00cf      	jpf	L15
 239  0016               L21:
 240  0016 4a            	dec	a
 241  0017 2604          	jrne	L41
 242  0019 ac140114      	jpf	L35
 243  001d               L41:
 244  001d 4a            	dec	a
 245  001e 2604          	jrne	L61
 246  0020 ac590159      	jpf	L55
 247  0024               L61:
 248  0024 4a            	dec	a
 249  0025 2604          	jrne	L02
 250  0027 ac8d018d      	jpf	L75
 251  002b               L02:
 252  002b 4a            	dec	a
 253  002c 2604          	jrne	L22
 254  002e acc501c5      	jpf	L16
 255  0032               L22:
 256  0032 acf501f5      	jpf	L301
 257  0036               L34:
 258                     ; 26 		case 0:	//channel-3
 258                     ; 27 						knobx=0;knoby=1;										
 260  0036 72155000      	bres	_knobx
 263  003a 72165000      	bset	_knoby
 264                     ; 28 						accx = ADC_DB3RH;
 266  003e c653e6        	ld	a,21478
 267  0041 5f            	clrw	x
 268  0042 97            	ld	xl,a
 269  0043 bf07          	ldw	_accx,x
 270                     ; 29 						accx = accx << 8;
 272  0045 b608          	ld	a,_accx+1
 273  0047 b707          	ld	_accx,a
 274  0049 3f08          	clr	_accx+1
 275                     ; 30 						accx = accx | ADC_DB3RL;
 277  004b c653e7        	ld	a,21479
 278  004e 5f            	clrw	x
 279  004f 97            	ld	xl,a
 280  0050 01            	rrwa	x,a
 281  0051 ba08          	or	a,_accx+1
 282  0053 01            	rrwa	x,a
 283  0054 ba07          	or	a,_accx
 284  0056 01            	rrwa	x,a
 285  0057 bf07          	ldw	_accx,x
 286                     ; 31 						ADC_CSR = ADC_CSR & 0xF0;//AIN0
 288  0059 c65400        	ld	a,21504
 289  005c a4f0          	and	a,#240
 290  005e c75400        	ld	21504,a
 291                     ; 32 						channel = 1;
 293  0061 35010000      	mov	_channel,#1
 294                     ; 33 						break;
 296  0065 acf501f5      	jpf	L301
 297  0069               L54:
 298                     ; 34 		case 1:	//channel-3
 298                     ; 35 						knoby=0;knobz=1;		
 300  0069 72175000      	bres	_knoby
 303  006d 72185019      	bset	_knobz
 304                     ; 36 						accy = ADC_DB3RH;
 306  0071 c653e6        	ld	a,21478
 307  0074 5f            	clrw	x
 308  0075 97            	ld	xl,a
 309  0076 bf09          	ldw	_accy,x
 310                     ; 37 						accy  = accy << 8;
 312  0078 b60a          	ld	a,_accy+1
 313  007a b709          	ld	_accy,a
 314  007c 3f0a          	clr	_accy+1
 315                     ; 38 						accy = accy  | ADC_DB3RL;
 317  007e c653e7        	ld	a,21479
 318  0081 5f            	clrw	x
 319  0082 97            	ld	xl,a
 320  0083 01            	rrwa	x,a
 321  0084 ba0a          	or	a,_accy+1
 322  0086 01            	rrwa	x,a
 323  0087 ba09          	or	a,_accy
 324  0089 01            	rrwa	x,a
 325  008a bf09          	ldw	_accy,x
 326                     ; 39 						ADC_CSR = ADC_CSR & 0xF0;//AIN0
 328  008c c65400        	ld	a,21504
 329  008f a4f0          	and	a,#240
 330  0091 c75400        	ld	21504,a
 331                     ; 40 						channel = 2;
 333  0094 35020000      	mov	_channel,#2
 334                     ; 41 						break;
 336  0098 acf501f5      	jpf	L301
 337  009c               L74:
 338                     ; 42 		case 2:	//channel-3
 338                     ; 43 						knobz=0;knobstart=1;		
 340  009c 72195019      	bres	_knobz
 343  00a0 721e5005      	bset	_knobstart
 344                     ; 44 						accz = ADC_DB3RH;
 346  00a4 c653e6        	ld	a,21478
 347  00a7 5f            	clrw	x
 348  00a8 97            	ld	xl,a
 349  00a9 bf0b          	ldw	_accz,x
 350                     ; 45 						accz = accz << 8;
 352  00ab b60c          	ld	a,_accz+1
 353  00ad b70b          	ld	_accz,a
 354  00af 3f0c          	clr	_accz+1
 355                     ; 46 						accz = accz | ADC_DB3RL;
 357  00b1 c653e7        	ld	a,21479
 358  00b4 5f            	clrw	x
 359  00b5 97            	ld	xl,a
 360  00b6 01            	rrwa	x,a
 361  00b7 ba0c          	or	a,_accz+1
 362  00b9 01            	rrwa	x,a
 363  00ba ba0b          	or	a,_accz
 364  00bc 01            	rrwa	x,a
 365  00bd bf0b          	ldw	_accz,x
 366                     ; 47 						ADC_CSR = ADC_CSR & 0xF0;//AIN0
 368  00bf c65400        	ld	a,21504
 369  00c2 a4f0          	and	a,#240
 370  00c4 c75400        	ld	21504,a
 371                     ; 48 						channel = 3;
 373  00c7 35030000      	mov	_channel,#3
 374                     ; 49 						break;
 376  00cb acf501f5      	jpf	L301
 377  00cf               L15:
 378                     ; 50 		case 3:	//channel-3
 378                     ; 51 						knobstart=0;knobstop=1;		
 380  00cf 721f5005      	bres	_knobstart
 383  00d3 721c5005      	bset	_knobstop
 384                     ; 52 						start = ADC_DB3RH;
 386  00d7 c653e6        	ld	a,21478
 387  00da 5f            	clrw	x
 388  00db 97            	ld	xl,a
 389  00dc bf0d          	ldw	_start,x
 390                     ; 53 						start = start << 8;
 392  00de b60e          	ld	a,_start+1
 393  00e0 b70d          	ld	_start,a
 394  00e2 3f0e          	clr	_start+1
 395                     ; 54 						start = start | ADC_DB3RL;  
 397  00e4 c653e7        	ld	a,21479
 398  00e7 5f            	clrw	x
 399  00e8 97            	ld	xl,a
 400  00e9 01            	rrwa	x,a
 401  00ea ba0e          	or	a,_start+1
 402  00ec 01            	rrwa	x,a
 403  00ed ba0d          	or	a,_start
 404  00ef 01            	rrwa	x,a
 405  00f0 bf0d          	ldw	_start,x
 406                     ; 55 						start=start >> 5;
 408  00f2 a605          	ld	a,#5
 409  00f4               L6:
 410  00f4 340d          	srl	_start
 411  00f6 360e          	rrc	_start+1
 412  00f8 4a            	dec	a
 413  00f9 26f9          	jrne	L6
 414                     ; 56 						start=table[start];
 416  00fb be0d          	ldw	x,_start
 417  00fd d60000        	ld	a,(_table,x)
 418  0100 5f            	clrw	x
 419  0101 97            	ld	xl,a
 420  0102 bf0d          	ldw	_start,x
 421                     ; 57 						ADC_CSR = ADC_CSR & 0xF0;//AIN0
 423  0104 c65400        	ld	a,21504
 424  0107 a4f0          	and	a,#240
 425  0109 c75400        	ld	21504,a
 426                     ; 58 						channel = 4;
 428  010c 35040000      	mov	_channel,#4
 429                     ; 59 						break;
 431  0110 acf501f5      	jpf	L301
 432  0114               L35:
 433                     ; 60 		case 4:	
 433                     ; 61 						knobstop=0;		
 435  0114 721d5005      	bres	_knobstop
 436                     ; 62 						stop = ADC_DB3RH;
 438  0118 c653e6        	ld	a,21478
 439  011b 5f            	clrw	x
 440  011c 97            	ld	xl,a
 441  011d bf0f          	ldw	_stop,x
 442                     ; 63 						stop = stop << 8;
 444  011f b610          	ld	a,_stop+1
 445  0121 b70f          	ld	_stop,a
 446  0123 3f10          	clr	_stop+1
 447                     ; 64 						stop = stop | ADC_DB3RL;
 449  0125 c653e7        	ld	a,21479
 450  0128 5f            	clrw	x
 451  0129 97            	ld	xl,a
 452  012a 01            	rrwa	x,a
 453  012b ba10          	or	a,_stop+1
 454  012d 01            	rrwa	x,a
 455  012e ba0f          	or	a,_stop
 456  0130 01            	rrwa	x,a
 457  0131 bf0f          	ldw	_stop,x
 458                     ; 65 						stop = stop >> 5;
 460  0133 a605          	ld	a,#5
 461  0135               L01:
 462  0135 340f          	srl	_stop
 463  0137 3610          	rrc	_stop+1
 464  0139 4a            	dec	a
 465  013a 26f9          	jrne	L01
 466                     ; 66 						stop = table[stop];
 468  013c be0f          	ldw	x,_stop
 469  013e d60000        	ld	a,(_table,x)
 470  0141 5f            	clrw	x
 471  0142 97            	ld	xl,a
 472  0143 bf0f          	ldw	_stop,x
 473                     ; 67 						ADC_CSR = ADC_CSR & 0xF0;
 475  0145 c65400        	ld	a,21504
 476  0148 a4f0          	and	a,#240
 477  014a c75400        	ld	21504,a
 478                     ; 68 						ADC_CSR = ADC_CSR | 1;	//AIN1
 480  014d 72105400      	bset	21504,#0
 481                     ; 69 						channel = 5;
 483  0151 35050000      	mov	_channel,#5
 484                     ; 70 						break;
 486  0155 acf501f5      	jpf	L301
 487  0159               L55:
 488                     ; 72 		case 5:
 488                     ; 73 						ainx = ADC_DB0RH;
 490  0159 c653e0        	ld	a,21472
 491  015c 5f            	clrw	x
 492  015d 97            	ld	xl,a
 493  015e bf01          	ldw	_ainx,x
 494                     ; 74 						ainx = ainx << 8;
 496  0160 b602          	ld	a,_ainx+1
 497  0162 b701          	ld	_ainx,a
 498  0164 3f02          	clr	_ainx+1
 499                     ; 75 						ainx = ainx | ADC_DB0RL;
 501  0166 c653e1        	ld	a,21473
 502  0169 5f            	clrw	x
 503  016a 97            	ld	xl,a
 504  016b 01            	rrwa	x,a
 505  016c ba02          	or	a,_ainx+1
 506  016e 01            	rrwa	x,a
 507  016f ba01          	or	a,_ainx
 508  0171 01            	rrwa	x,a
 509  0172 bf01          	ldw	_ainx,x
 510                     ; 76 						ainx = ainx - 511;// [-511, 512]
 512  0174 be01          	ldw	x,_ainx
 513  0176 1d01ff        	subw	x,#511
 514  0179 bf01          	ldw	_ainx,x
 515                     ; 77 						ADC_CSR = ADC_CSR & 0xF0;
 517  017b c65400        	ld	a,21504
 518  017e a4f0          	and	a,#240
 519  0180 c75400        	ld	21504,a
 520                     ; 78 						ADC_CSR = ADC_CSR | 2;	//AIN2
 522  0183 72125400      	bset	21504,#1
 523                     ; 79 						channel = 6;
 525  0187 35060000      	mov	_channel,#6
 526                     ; 80 						break;
 528  018b 2068          	jra	L301
 529  018d               L75:
 530                     ; 81 		case 6:	
 530                     ; 82 						ainy = ADC_DB1RH;
 532  018d c653e2        	ld	a,21474
 533  0190 5f            	clrw	x
 534  0191 97            	ld	xl,a
 535  0192 bf03          	ldw	_ainy,x
 536                     ; 83 						ainy = ainy << 8;
 538  0194 b604          	ld	a,_ainy+1
 539  0196 b703          	ld	_ainy,a
 540  0198 3f04          	clr	_ainy+1
 541                     ; 84 						ainy  = ainy | ADC_DB1RL;	
 543  019a c653e3        	ld	a,21475
 544  019d 5f            	clrw	x
 545  019e 97            	ld	xl,a
 546  019f 01            	rrwa	x,a
 547  01a0 ba04          	or	a,_ainy+1
 548  01a2 01            	rrwa	x,a
 549  01a3 ba03          	or	a,_ainy
 550  01a5 01            	rrwa	x,a
 551  01a6 bf03          	ldw	_ainy,x
 552                     ; 85 						ainy = ainy - 511;// [-511, 512]
 554  01a8 be03          	ldw	x,_ainy
 555  01aa 1d01ff        	subw	x,#511
 556  01ad bf03          	ldw	_ainy,x
 557                     ; 86 						ADC_CSR = ADC_CSR & 0xF0;
 559  01af c65400        	ld	a,21504
 560  01b2 a4f0          	and	a,#240
 561  01b4 c75400        	ld	21504,a
 562                     ; 87 						ADC_CSR = ADC_CSR | 3;	//AIN3
 564  01b7 c65400        	ld	a,21504
 565  01ba aa03          	or	a,#3
 566  01bc c75400        	ld	21504,a
 567                     ; 88 						channel = 7;
 569  01bf 35070000      	mov	_channel,#7
 570                     ; 89 						break;
 572  01c3 2030          	jra	L301
 573  01c5               L16:
 574                     ; 90 		case 7:	
 574                     ; 91 						knobx=1;
 576  01c5 72145000      	bset	_knobx
 577                     ; 92 						ainz = ADC_DB2RH;
 579  01c9 c653e4        	ld	a,21476
 580  01cc 5f            	clrw	x
 581  01cd 97            	ld	xl,a
 582  01ce bf05          	ldw	_ainz,x
 583                     ; 93 						ainz = ainz << 8;
 585  01d0 b606          	ld	a,_ainz+1
 586  01d2 b705          	ld	_ainz,a
 587  01d4 3f06          	clr	_ainz+1
 588                     ; 94 						ainz = ainz | ADC_DB2RL;
 590  01d6 c653e5        	ld	a,21477
 591  01d9 5f            	clrw	x
 592  01da 97            	ld	xl,a
 593  01db 01            	rrwa	x,a
 594  01dc ba06          	or	a,_ainz+1
 595  01de 01            	rrwa	x,a
 596  01df ba05          	or	a,_ainz
 597  01e1 01            	rrwa	x,a
 598  01e2 bf05          	ldw	_ainz,x
 599                     ; 95 						ainz = ainz - 511;// [-511, 512]
 601  01e4 be05          	ldw	x,_ainz
 602  01e6 1d01ff        	subw	x,#511
 603  01e9 bf05          	ldw	_ainz,x
 604                     ; 96 						ADC_CSR = ADC_CSR & 0xF0;	//AIN0
 606  01eb c65400        	ld	a,21504
 607  01ee a4f0          	and	a,#240
 608  01f0 c75400        	ld	21504,a
 609                     ; 97 						channel = 0;
 611  01f3 3f00          	clr	_channel
 612                     ; 98 						break;
 614  01f5               L301:
 615                     ; 101 	ADC_CSR = ADC_CSR & (~ADC1_CSR_EOC);
 617  01f5 721f5400      	bres	21504,#7
 618                     ; 102 }
 621  01f9 80            	iret
 649                     ; 104 void SetupADC(void)
 649                     ; 105 {
 651                     	switch	.text
 652  01fa               _SetupADC:
 656                     ; 106 	knobx=1;knobstop=0;knobstart=0;knobz=0;knoby=0;
 658  01fa 72145000      	bset	_knobx
 661  01fe 721d5005      	bres	_knobstop
 664  0202 721f5005      	bres	_knobstart
 667  0206 72195019      	bres	_knobz
 670  020a 72175000      	bres	_knoby
 671                     ; 107 	channel = 0;
 673  020e 3f00          	clr	_channel
 674                     ; 108 	ADC_CSR = ADC_CSR & 0xF0;
 676  0210 c65400        	ld	a,21504
 677  0213 a4f0          	and	a,#240
 678  0215 c75400        	ld	21504,a
 679                     ; 109 	ADC_CR1 = ADC_CR1 | 0x70;//clock devider
 681  0218 c65401        	ld	a,21505
 682  021b aa70          	or	a,#112
 683  021d c75401        	ld	21505,a
 684                     ; 110 	ADC_CR1 = ADC_CR1 | ADC1_CR1_CONT;//Continuous conversion
 686  0220 72125401      	bset	21505,#1
 687                     ; 111   ADC_CR3 = ADC_CR3 | ADC1_CR3_DBUF;
 689  0224 721e5403      	bset	21507,#7
 690                     ; 112 	ADC_CR2 = ADC_CR2 | ADC1_CR2_ALIGN;//Data is right aligned.
 692  0228 72165402      	bset	21506,#3
 693                     ; 113 	ADC_CSR = ADC_CSR | ADC1_CSR_EOCIE;//Enable the interrupt after conversion completed.
 695  022c 721a5400      	bset	21504,#5
 696                     ; 114 	ADC_CR1 = ADC_CR1 | ADC1_CR1_ADON;
 698  0230 72105401      	bset	21505,#0
 699                     ; 115 	ADC_CR1 = ADC_CR1 | ADC1_CR1_ADON;
 701  0234 72105401      	bset	21505,#0
 702                     ; 116 }
 705  0238 81            	ret
 861                     	xdef	_SetupADC
 862                     	xdef	f_ADC1_EOC_IRQHandler
 863                     	xdef	_stop
 864                     	xdef	_start
 865                     	xdef	_accz
 866                     	xdef	_accy
 867                     	xdef	_accx
 868                     	xdef	_ainz
 869                     	xdef	_ainy
 870                     	xdef	_ainx
 871                     	xdef	_channel
 872                     	xdef	_table
 891                     	end
