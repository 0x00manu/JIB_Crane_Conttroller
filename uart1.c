				//UART1
#include <stm8_header.h>
#define bufferlen 6
char uartTXbuffer[bufferlen];

 @far @interrupt void uart1_tx_isr(void)
{
	static unsigned char counter=0;
	UART1_DR = uartTXbuffer[counter];
	counter++;
	if (counter==bufferlen)
		{counter=0;}
	UART1_SR = UART1_SR & (!UART_SR_TC);
}
 @far @interrupt void uart1_rx_isr(void)
 {}
 
 void InitUART1TX ( void )
 {
   UART1_BRR2 = 0x1B ;//2400bps
   UART1_BRR1 = 0xA0 ;
	UART1_CR2	= UART1_CR2 | UART_CR2_TEN;
	UART1_CR2 = UART1_CR2 | UART_CR2_TCIEN;
	 uartTXbuffer[0]='0';
	 uartTXbuffer[1]='1';
	 uartTXbuffer[2]='2';
	 uartTXbuffer[3]='3';
	 uartTXbuffer[4]=CR;
	 uartTXbuffer[5]=LF;
	 
 }
 void InitUART1RX ( void )
 {
   UART1_BRR2 = 0x1B ;//2400bps
   UART1_BRR1 = 0xA0 ;
   UART1_CR2 = UART1_CR2 | UART1_CR2_REN;
   UART1_CR2 = UART1_CR2 | UART1_CR2_RIEN;
 }