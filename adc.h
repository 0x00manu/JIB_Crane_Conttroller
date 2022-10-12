//adc.h
extern @far @interrupt  void ADC1_EOC_IRQHandler(void);
extern void SetupADC(void);
//--------------------------//
extern int ainx,ainy,ainz;//pin 16,15,14
extern unsigned int accx,accy,accz,start,stop;// pin 13
