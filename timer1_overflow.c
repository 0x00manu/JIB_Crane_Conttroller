#include <stm8_header.h>
#include <adc.h>
_Bool GO=0;
void SetupTimer1(void)
{
	TIM1_PSCRH = 0x01;	//first load PSCRH then PSCRL
	TIM1_PSCRL = 0x00;  //  0x06
	TIM1_ARRH = 0x00;   //  0x18
	TIM1_ARRL = 0xE7;   //  40ms
	TIM1_IER = TIM1_IER | 0x01;//UIE=1,CC1IE=1,CC2IE=1,CC3I3=1;
	TIM1_CR1 = TIM1_CR1 | TIM_CR1_CEN;//Counter Enable (Run)
}
		
@far @interrupt void TIM1_OVF(void)
	{	
		GO=1;
		TIM1_SR1 = TIM1_SR1 & ~TIM_SR1_UIF;
	}