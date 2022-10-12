//timer2_pwm_3channels
#include <stm8_header.h>
#include <adc.h>
_Bool UIF 	@0x5304:0;	//update flag 
_Bool CC1IF @0x5304:1;	//compare flag channel-1
_Bool CC2IF @0x5304:2;	//compare flag channel-2
_Bool CC3IF @0x5304:3;	//compare flag channel-3

_Bool pwmx	@0x500A:1;//18
_Bool pwmxx @0x500A:2;//19
_Bool pwmy	@0x500A:3;//20
_Bool pwmyy	@0x500A:4;//21
_Bool pwmz	@0x500A:5;//22
_Bool pwmzz	@0x500A:6;//23


_Bool left=0,up=0,forward=0;

@far @interrupt void TIM2_UPD_OVF(void)
	{
		if (left==1)
				{pwmx=1;pwmxx=0;}
		else
				{pwmx=0;pwmxx=1;}			
		if (up==1)
				{pwmy=1;pwmyy=0;}
		else
				{pwmy=0;pwmyy=1;}			
		if (forward==1)
				{pwmz=1;pwmzz=0;}
		else
				{pwmz=0;pwmzz=1;}			
		UIF=0;CC1IF=0;CC2IF=0;CC3IF=0;
	}
@far @interrupt void TIM2_CAPCOM(void)
{
	unsigned char temp = TIM2_SR1 & 0X0E;
	switch (temp)
		{
			case 0x02:CC1IF=0;pwmx=0;pwmxx=0;break;
			case 0x04:CC2IF=0;pwmy=0;pwmyy=0;break;
			case 0x08:CC3IF=0;pwmz=0;pwmzz=0; break;
			
			case 0x06:CC2IF=0;pwmy=0;pwmyy=0;CC1IF=0;pwmx=0;pwmxx=0;break;
			case 0x0A:CC3IF=0;pwmz=0;pwmzz=0;CC1IF=0;pwmx=0;pwmxx=0;break;
			case 0x0C:CC3IF=0;pwmz=0;pwmzz=0;CC2IF=0;pwmy=0;pwmyy=0;break;
			default 	:CC1IF=0;CC2IF=0;CC3IF=0;pwmx=0;pwmy=0;pwmz=0;
								pwmxx=0;pwmyy=0;pwmzz=0;
		}
}

void SetupTimer2PWM3(void)
{
						//PWM frequency//
	TIM2_PSCR = 0x07;   //  Prescaler = 2^4=16; 16e6/16 = 1MHz
	TIM2_ARRH = 0x01;   //  0x01FF = 511
	TIM2_ARRL = 0xFF;   //  511+1 =  512
	//==================== channel_1 =======================//
			TIM2_CCR1H = 0x00;//CCR1H is 
			TIM2_CCR1L = 0x00;//compared with ARRH-ARRL
			//TIM2_CCMR1 = TIM2_CCMR1 | 0X70;//CAPCOM mode   
	//==================== channel_2 =======================//
			TIM2_CCR2H = 0x00;//Capture Compare Register 2 Higner
			TIM2_CCR2L = 0x00;//Capture Compare Register 2 Lower
			//TIM2_CCMR2 = TIM2_CCMR2 | 0X70;//0x60  
	//==================== channel_2 =======================//
			TIM2_CCR3H = 0x00;//Capture Compare Register 3 Higher
			TIM2_CCR3L = 0x00;//Capture Compare Register 3 Lower
			//TIM2_CCMR3 = 	TIM2_CCMR3 | 0X70;//0x60
	/********************* Interrupt ************************/
	TIM2_IER = TIM2_IER | 0x0F;//UIE=1,CC1IE=1,CC2IE=1,CC3I3=1;
	TIM2_CR1 = TIM2_CR1 | TIM2_CR1_CEN;//Counter Enable (Run)
}
