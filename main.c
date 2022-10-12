#include <stm8_header.h>
#include <timer2_pwm_3channels.h>
#include <adc.h>
#include <timer1_overflow.h>

void rim(void){
	#pragma asm
	RIM					//uninterruptable
	#pragma endasm
}
void sim(void){
	#pragma asm
	SIM
	#pragma endasm
}

 void InitClock ( void )
 {
    CLK_ICKR = CLK_ICKR | CLK_ICKR_HSIEN;
    while ( ! (CLK_ICKR & CLK_ICKR_HSIRDY)) ; 
    CLK_CKDIVR = 0x00 ;
 }
void InitGPIO(void)
{
	//-----------------output for motor----------------------//	
	PC_DDR = PC_DDR | (1 << 1); PC_CR1 = PC_CR1 | (1 << 1);	//18
	PC_DDR = PC_DDR | (1 << 2); PC_CR1 = PC_CR1 | (1 << 2);	//19
	PC_DDR = PC_DDR | (1 << 3); PC_CR1 = PC_CR1 | (1 << 3);	//20
	PC_DDR = PC_DDR | (1 << 4); PC_CR1 = PC_CR1 | (1 << 4);	//21
	PC_DDR = PC_DDR | (1 << 5); PC_CR1 = PC_CR1 | (1 << 5);	//22
	PC_DDR = PC_DDR | (1 << 6); PC_CR1 = PC_CR1 | (1 << 6);	//23
	//--------------output for analog input selection--------//	
	PA_DDR = PA_DDR | (1 << 2); PA_CR1 = PA_CR1 | (1 << 2);	//3
	PA_DDR = PA_DDR | (1 << 3); PA_CR1 = PA_CR1 | (1 << 3);	//7
	PF_DDR = PF_DDR | (1 << 4); PF_CR1 = PF_CR1 | (1 << 4);	//8
	PB_DDR = PB_DDR | (1 << 7); PB_CR1 = PB_CR1 | (1 << 7);	//9
	PB_DDR = PB_DDR | (1 << 6); PB_CR1 = PB_CR1 | (1 << 6);	//10
	//====================	EN1 EN2	=========================//
	PE_DDR = PE_DDR | (1 << 5);
	PE_CR1 = PE_CR1 | (1 << 5);
	PE_ODR = PE_ODR | (1 << 5);	//17  EN1
	
	PC_DDR = PC_DDR | (1 << 7);
	PC_CR1 = PC_CR1 | (1 << 7);
	PC_ODR = PC_ODR | (1 << 7);	//24	EN2
	//=============WARNING===========//
	pwmx	=0;//both can't be 1 togather
	pwmxx	=0;
	//
	pwmy	=0;//both can't be 1 togather
	pwmyy	=0;
	//
	pwmz	=0;
	pwmzz	=0;//both can't be 1 togather
	//=============WARNING===========//
}
int startroutine(int desired,int old)
{
	if (start < (desired-old))
		{old=old+start;}
	else
		{old = desired;}
	return old;
}
int stoproutine(int desired,int old)
{
	if (stop < (old-desired))
		{old = old - stop;}
	else
		{old = desired;}	
	return old;
}
int iteration(int desired,int old)
{	
	//both are -ve (acceleration/retardation)
	if ((desired <= 0)&&(old <= 0))
			{
				if( desired < old)// desired is more -ve
					old = 0 - startroutine(-desired,-old);
				else
					old = 0- stoproutine(-desired,-old);
			}
	//both are +ve (acceleration/retardation)
	else if((desired >= 0)&&(old >= 0))
			{
				if (desired < old)
					old = stoproutine(desired,old);	
				else
					old = startroutine(desired,old);
			}
	//opposite quadrants (retardation)
	else
			{
				if (old<0)//ie, desired in other quadrant
					old = 0 - stoproutine(0x0000,-old);//old	<	0
				else
					old = stoproutine(0x0000,old);//desired < 0
			}
	return old;
}	
void main()
{
	int temp;
	int oldx=0,oldy=0,oldz=0;
	int desiredx=0,desiredy=0,desiredz=0;
	sim();	
	InitClock();
	InitGPIO();
	SetupADC();
	SetupTimer2PWM3();
	SetupTimer1();
	rim();
	while (1)
	{
//***********************************//	0 < accx < 1023
		desiredx=ainx*((float)accx/900);// -511< ainx <=512
		if (desiredx > 512)
			{desiredx = 512;}
		if (desiredx <- 511)
			{desiredx = -511;}			
		//**********************************//
		desiredy=ainy*((float)accy/900);
		if (desiredy>512)
			{desiredy=512;}
		if (desiredy<-511)
			{desiredy=-511;}		
	//************************************//
		desiredz=ainz*((float)accz/900);
		if (desiredz>512)
			{desiredz=512;}
		if (desiredz<-511)
			{desiredz=-511;}
	//***********************************//
	if (GO==1)
		{
			GO=0;
			oldx = iteration(desiredx,oldx);
			temp = oldx;
			
			if (temp < 0)
				{temp = 0-temp;left=1;}
			else
				{left=0;}
				
				
			if(temp==0)
				{temp=1;}
				
				
						
			TIM2_CCR1H = ((temp & 0xFF00)>>8);
			TIM2_CCR1L = (temp & 0x00FF);
			//==============================================//
			oldy = iteration(desiredy,oldy);		
			temp=oldy;
					
			if (temp<0)
				{temp=0-temp;up=1;}
			else
				{up=0;}
				
				
			if(temp==0)
				{temp=1;}
				
				
			TIM2_CCR2H = ((temp & 0xFF00)>>8);
			TIM2_CCR2L = (temp & 0x00FF);		
			//==============================================//
			oldz = iteration(desiredz,oldz);
			temp=oldz;
			
			if (temp<0)
				{temp=0-temp;forward=1;}
			else
				{forward=0;}
								
			if(temp==0)
				{temp=1;}								
							
			TIM2_CCR3H = ((temp & 0xFF00)>>8);
			TIM2_CCR3L = (temp & 0x00FF);		
			//==============================================//
		}
	}
}