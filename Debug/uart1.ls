   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  15                     	bsct
  16  0000               L3_counter:
  17  0000 00            	dc.b	0
  58                     ; 6  @far @interrupt void uart1_tx_isr(void)
  58                     ; 7 {
  59                     	switch	.text
  60  0000               f_uart1_tx_isr:
  64                     ; 9 	UART1_DR = uartTXbuffer[counter];
  66  0000 b600          	ld	a,L3_counter
  67  0002 5f            	clrw	x
  68  0003 97            	ld	xl,a
  69  0004 e600          	ld	a,(_uartTXbuffer,x)
  70  0006 c75231        	ld	21041,a
  71                     ; 10 	counter++;
  73  0009 3c00          	inc	L3_counter
  74                     ; 11 	if (counter==bufferlen)
  76  000b b600          	ld	a,L3_counter
  77  000d a106          	cp	a,#6
  78  000f 2602          	jrne	L13
  79                     ; 12 		{counter=0;}
  81  0011 3f00          	clr	L3_counter
  82  0013               L13:
  83                     ; 13 	UART1_SR = UART1_SR & (!UART_SR_TC);
  85  0013 725f5230      	clr	21040
  86                     ; 14 }
  89  0017 80            	iret
 111                     ; 15  @far @interrupt void uart1_rx_isr(void)
 111                     ; 16  {}
 112                     	switch	.text
 113  0018               f_uart1_rx_isr:
 120  0018 80            	iret
 143                     ; 18  void InitUART1TX ( void )
 143                     ; 19  {
 145                     	switch	.text
 146  0019               _InitUART1TX:
 150                     ; 20    UART1_BRR2 = 0x1B ;//2400bps
 152  0019 351b5233      	mov	21043,#27
 153                     ; 21    UART1_BRR1 = 0xA0 ;
 155  001d 35a05232      	mov	21042,#160
 156                     ; 22 	UART1_CR2	= UART1_CR2 | UART_CR2_TEN;
 158  0021 72165235      	bset	21045,#3
 159                     ; 23 	UART1_CR2 = UART1_CR2 | UART_CR2_TCIEN;
 161  0025 721c5235      	bset	21045,#6
 162                     ; 24 	 uartTXbuffer[0]='0';
 164  0029 35300000      	mov	_uartTXbuffer,#48
 165                     ; 25 	 uartTXbuffer[1]='1';
 167  002d 35310001      	mov	_uartTXbuffer+1,#49
 168                     ; 26 	 uartTXbuffer[2]='2';
 170  0031 35320002      	mov	_uartTXbuffer+2,#50
 171                     ; 27 	 uartTXbuffer[3]='3';
 173  0035 35330003      	mov	_uartTXbuffer+3,#51
 174                     ; 28 	 uartTXbuffer[4]=CR;
 176  0039 350d0004      	mov	_uartTXbuffer+4,#13
 177                     ; 29 	 uartTXbuffer[5]=LF;
 179  003d 350a0005      	mov	_uartTXbuffer+5,#10
 180                     ; 31  }
 183  0041 81            	ret
 206                     ; 32  void InitUART1RX ( void )
 206                     ; 33  {
 207                     	switch	.text
 208  0042               _InitUART1RX:
 212                     ; 34    UART1_BRR2 = 0x1B ;//2400bps
 214  0042 351b5233      	mov	21043,#27
 215                     ; 35    UART1_BRR1 = 0xA0 ;
 217  0046 35a05232      	mov	21042,#160
 218                     ; 36    UART1_CR2 = UART1_CR2 | UART1_CR2_REN;
 220  004a 72145235      	bset	21045,#2
 221                     ; 37    UART1_CR2 = UART1_CR2 | UART1_CR2_RIEN;
 223  004e 721a5235      	bset	21045,#5
 224                     ; 38  }
 227  0052 81            	ret
 252                     	xdef	_InitUART1RX
 253                     	xdef	_InitUART1TX
 254                     	xdef	f_uart1_rx_isr
 255                     	xdef	f_uart1_tx_isr
 256                     	switch	.ubsct
 257  0000               _uartTXbuffer:
 258  0000 000000000000  	ds.b	6
 259                     	xdef	_uartTXbuffer
 279                     	end
