#include <stm8_header.h>
#include <timer2_pwm_3channels.h>
//----------------------//
_Bool	knobx 		@0x5000:2;//PA2 pin-3
_Bool	knoby 		@0x5000:3;//PA3 pin-7
_Bool	knobz 		@0x5019:4;//PF4	pin-8
_Bool	knobstart @0x5005:7;//PB7 pin-9
_Bool	knobstop 	@0x5005:6;//PB6 pin-10

//--------------------------//
#pragma section const {} 
	const unsigned char table[]={//ACTIVE HIGH//
	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,
	18,19,20,21,22,23,24,25,50,64,96,128,256,511,511
	};
#pragma section const{}

unsigned char channel= 0;				
int ainx=0,ainy=0,ainz=0;
unsigned int accx=0,accy=0,accz=0,start=0,stop=0;// pin 13

@far @interrupt  void ADC1_EOC_IRQHandler(void)
{ 
	switch (channel)
		{					
		case 0:	//channel-3
						knobx=0;knoby=1;										
						accx = ADC_DB3RH;
						accx = accx << 8;
						accx = accx | ADC_DB3RL;
						ADC_CSR = ADC_CSR & 0xF0;//AIN0
						channel = 1;
						break;
		case 1:	//channel-3
						knoby=0;knobz=1;		
						accy = ADC_DB3RH;
						accy  = accy << 8;
						accy = accy  | ADC_DB3RL;
						ADC_CSR = ADC_CSR & 0xF0;//AIN0
						channel = 2;
						break;
		case 2:	//channel-3
						knobz=0;knobstart=1;		
						accz = ADC_DB3RH;
						accz = accz << 8;
						accz = accz | ADC_DB3RL;
						ADC_CSR = ADC_CSR & 0xF0;//AIN0
						channel = 3;
						break;
		case 3:	//channel-3
						knobstart=0;knobstop=1;		
						start = ADC_DB3RH;
						start = start << 8;
						start = start | ADC_DB3RL;  
						start=start >> 5;
						start=table[start];
						ADC_CSR = ADC_CSR & 0xF0;//AIN0
						channel = 4;
						break;
		case 4:	
						knobstop=0;		
						stop = ADC_DB3RH;
						stop = stop << 8;
						stop = stop | ADC_DB3RL;
						stop = stop >> 5;
						stop = table[stop];
						ADC_CSR = ADC_CSR & 0xF0;
						ADC_CSR = ADC_CSR | 1;	//AIN1
						channel = 5;
						break;
		//======================================//
		case 5:
						ainx = ADC_DB0RH;
						ainx = ainx << 8;
						ainx = ainx | ADC_DB0RL;
						ainx = ainx - 511;// [-511, 512]
						ADC_CSR = ADC_CSR & 0xF0;
						ADC_CSR = ADC_CSR | 2;	//AIN2
						channel = 6;
						break;
		case 6:	
						ainy = ADC_DB1RH;
						ainy = ainy << 8;
						ainy  = ainy | ADC_DB1RL;	
						ainy = ainy - 511;// [-511, 512]
						ADC_CSR = ADC_CSR & 0xF0;
						ADC_CSR = ADC_CSR | 3;	//AIN3
						channel = 7;
						break;
		case 7:	
						knobx=1;
						ainz = ADC_DB2RH;
						ainz = ainz << 8;
						ainz = ainz | ADC_DB2RL;
						ainz = ainz - 511;// [-511, 512]
						ADC_CSR = ADC_CSR & 0xF0;	//AIN0
						channel = 0;
						break;
		//======================================//							
		}	
	ADC_CSR = ADC_CSR & (~ADC1_CSR_EOC);
}

void SetupADC(void)
{
	knobx=1;knobstop=0;knobstart=0;knobz=0;knoby=0;
	channel = 0;
	ADC_CSR = ADC_CSR & 0xF0;
	ADC_CR1 = ADC_CR1 | 0x70;//clock devider
	ADC_CR1 = ADC_CR1 | ADC1_CR1_CONT;//Continuous conversion
  ADC_CR3 = ADC_CR3 | ADC1_CR3_DBUF;
	ADC_CR2 = ADC_CR2 | ADC1_CR2_ALIGN;//Data is right aligned.
	ADC_CSR = ADC_CSR | ADC1_CSR_EOCIE;//Enable the interrupt after conversion completed.
	ADC_CR1 = ADC_CR1 | ADC1_CR1_ADON;
	ADC_CR1 = ADC_CR1 | ADC1_CR1_ADON;
}
