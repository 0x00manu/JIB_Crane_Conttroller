@far @interrupt void TIM2_UPD_OVF(void);
@far @interrupt void TIM2_CAPCOM(void);
void SetupTimer2PWM3(void);
extern _Bool pwmx		@0x500A:1;//18
extern _Bool pwmxx	@0x500A:2;//19
extern _Bool pwmy		@0x500A:3;//20
extern _Bool pwmyy	@0x500A:4;//21
extern _Bool pwmz		@0x500A:5;//22
extern _Bool pwmzz	@0x500A:6;//23
extern _Bool left,up,forward;	