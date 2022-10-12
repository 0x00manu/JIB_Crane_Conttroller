								//stm8_header.h//
#define CR 0x0D
#define LF 0x0A
#define		CLK_DIVR	*(unsigned char*)0x0050C6								
#define CLK_PCKENR1 *(unsigned char*)0x0050C7 
#define STM8S003
#pragma once
#ifndef __STM8L_H__
#define __STM8L_H__

typedef unsigned char U8;
typedef unsigned char uint8_t;
typedef unsigned int U16;
typedef unsigned long U32;
#define NULL (void*)0

/* GPIO */
#define PA_ODR *(unsigned char*)0x5000
#define PA_IDR *(unsigned char*)0x5001
#define PA_DDR *(unsigned char*)0x5002
#define PA_CR1 *(unsigned char*)0x5003
#define PA_CR2 *(unsigned char*)0x5004
#define PB_ODR *(unsigned char*)0x5005
#define PB_IDR *(unsigned char*)0x5006
#define PB_DDR *(unsigned char*)0x5007
#define PB_CR1 *(unsigned char*)0x5008
#define PB_CR2 *(unsigned char*)0x5009
#define PC_ODR *(unsigned char*)0x500A
#define PC_IDR *(unsigned char*)0x500B
#define PC_DDR *(unsigned char*)0x500C
#define PC_CR1 *(unsigned char*)0x500D
#define PC_CR2 *(unsigned char*)0x500E
#define PD_ODR *(unsigned char*)0x500F
#define PD_IDR *(unsigned char*)0x5010
#define PD_DDR *(unsigned char*)0x5011
#define PD_CR1 *(unsigned char*)0x5012
#define PD_CR2 *(unsigned char*)0x5013
#define PE_ODR *(unsigned char*)0x5014
#define PE_IDR *(unsigned char*)0x5015
#define PE_DDR *(unsigned char*)0x5016
#define PE_CR1 *(unsigned char*)0x5017
#define PE_CR2 *(unsigned char*)0x5018
#define PF_ODR *(unsigned char*)0x5019
#define PF_IDR *(unsigned char*)0x501A
#define PF_DDR *(unsigned char*)0x501B
#define PF_CR1 *(unsigned char*)0x501C
#define PF_CR2 *(unsigned char*)0x501D

																								#ifdef STM8S105
																										#define PG_ODR *(unsigned char*)0x501E
																										#define PG_IDR *(unsigned char*)0x501F
																										#define PG_DDR *(unsigned char*)0x5020
																										#define PG_CR1 *(unsigned char*)0x5021
																										#define PG_CR2 *(unsigned char*)0x5022
																										
																										#define PH_ODR *(unsigned char*)0x5023
																										#define PH_IDR *(unsigned char*)0x5024
																										#define PH_DDR *(unsigned char*)0x5025
																										#define PH_CR1 *(unsigned char*)0x5026
																										#define PH_CR2 *(unsigned char*)0x5027
																										
																										#define PI_ODR *(unsigned char*)0x5028
																										#define PI_IDR *(unsigned char*)0x5029
																										#define PI_DDR *(unsigned char*)0x502A
																										#define PI_CR1 *(unsigned char*)0x502B
																										#define PI_CR2 *(unsigned char*)0x502C
																								#endif // STM8S105

/* GPIO bits */
#define GPIO_PIN0		(1 << 0)
#define GPIO_PIN1		(1 << 1)
#define GPIO_PIN2		(1 << 2)
#define GPIO_PIN3		(1 << 3)
#define GPIO_PIN4		(1 << 4)
#define GPIO_PIN5		(1 << 5)
#define GPIO_PIN6		(1 << 6)
#define GPIO_PIN7		(1 << 7)

/* -------------------- FLASH/EEPROM -------------------- */
#define FLASH_CR1	*(unsigned char*)0x505A
#define FLASH_CR2	*(unsigned char*)0x505B
#define FLASH_NCR2	*(unsigned char*)0x505C
#define FLASH_FPR	*(unsigned char*)0x505D
#define FLASH_NFPR	*(unsigned char*)0x505E
#define FLASH_IAPSR	*(unsigned char*)0x505F
#define FLASH_PUKR	*(unsigned char*)0x5062 // progmem unprotection
#define FLASH_DUKR	*(unsigned char*)0x5064 // EEPROM unprotection

#define EEPROM_KEY1		0xAE  // keys to manage EEPROM's write access
#define EEPROM_KEY2		0x56
#define EEPROM_START_ADDR  (unsigned char*)0x4000

/* ------------------- interrupts ------------------- */
#define EXTI_CR1	*(unsigned char*)0x50A0
#define EXTI_CR2	*(unsigned char*)0x50A1
#define INTERRUPT_HANDLER(fn, num)		void fn() __interrupt(num)
#define INTERRUPT_DEFINITION(fn, num)	extern void fn() __interrupt(num)

// Reset status register
#define RST_SR		*(unsigned char*)0x50B3

/* ------------------- CLOCK ------------------- */
#define CLK_ICKR		*(unsigned char*)0x50C0
#define CLK_ECKR		*(unsigned char*)0x50C1
#define CLK_CMSR		*(unsigned char*)0x50C3
#define CLK_SWR			*(unsigned char*)0x50C4
#define CLK_SWCR		*(unsigned char*)0x50C5
#define CLK_CKDIVR		*(unsigned char*)0x50C6
#define CLK_SPCKENR1	*(unsigned char*)0x50C7
#define CLK_CSSR		*(unsigned char*)0x50C8
#define CLK_CCOR		*(unsigned char*)0x50C9
#define CLK_PCKENR2		*(unsigned char*)0x50CA
#define CLK_HSITRIMR	*(unsigned char*)0x50CC
#define CLK_SWIMCCR		*(unsigned char*)0x50CD

/* ------------------- Watchdog ------------------ */
#define WWDG_CR			*(unsigned char*)0x50D1
#define WWDG_WR			*(unsigned char*)0x50D2
#define IWDG_KR			*(unsigned char*)0x50E0
#define IWDG_PR			*(unsigned char*)0x50E1
#define IWDG_RLR		*(unsigned char*)0x50E2

/* ------------------- AWU, BEEP ------------------- */
#define AWU_CSR1		*(unsigned char*)0x50F0
#define AWU_APR			*(unsigned char*)0x50F1
#define AWU_TBR			*(unsigned char*)0x50F2
#define BEEP_CSR		*(unsigned char*)0x50F3

/* ------------------- SPI ------------------- */
#define SPI_CR1			*(unsigned char*)0x5200
#define SPI_CR2			*(unsigned char*)0x5201
#define SPI_ICR			*(unsigned char*)0x5202
#define SPI_SR			*(unsigned char*)0x5203
#define SPI_DR			*(unsigned char*)0x5204
#define SPI_CRCPR		*(unsigned char*)0x5205
#define SPI_RXCRCR		*(unsigned char*)0x5206
#define SPI_TXCRCR		*(unsigned char*)0x5207

/* ------------------- I2C ------------------- */
#define I2C_CR1			*(unsigned char*)0x5210
#define I2C_CR2			*(unsigned char*)0x5211
#define I2C_FREQR		*(unsigned char*)0x5212
#define I2C_OARL		*(unsigned char*)0x5213
#define I2C_OARH		*(unsigned char*)0x5214
#define I2C_DR			*(unsigned char*)0x5216
#define I2C_SR1			*(unsigned char*)0x5217
#define I2C_SR2			*(unsigned char*)0x5218
#define I2C_SR3			*(unsigned char*)0x5219
#define I2C_ITR			*(unsigned char*)0x521A
#define I2C_CCRL		*(unsigned char*)0x521B
#define I2C_CCRH		*(unsigned char*)0x521C
#define I2C_TRISER		*(unsigned char*)0x521D
#define I2C_PECR		*(unsigned char*)0x521E

/* ------------------- UART ------------------- */
#ifdef STM8S003
		#define UART1_SR	*(unsigned char*)0x5230
		#define UART1_DR	*(unsigned char*)0x5231
		#define UART1_BRR1	*(unsigned char*)0x5232
		#define UART1_BRR2	*(unsigned char*)0x5233
		#define UART1_CR1	*(unsigned char*)0x5234
		#define UART1_CR2	*(unsigned char*)0x5235
		#define UART1_CR3	*(unsigned char*)0x5236
		#define UART1_CR4	*(unsigned char*)0x5237
		#define UART1_CR5	*(unsigned char*)0x5238
		#define UART1_GTR	*(unsigned char*)0x5239
		#define UART1_PSCR	*(unsigned char*)0x523A
#endif // STM8S003
																									#ifdef STM8S105
																										#define UART2_SR	*(unsigned char*)0x5240
																										#define UART2_DR	*(unsigned char*)0x5241
																										#define UART2_BRR1	*(unsigned char*)0x5242
																										#define UART2_BRR2	*(unsigned char*)0x5243
																										#define UART2_CR1	*(unsigned char*)0x5244
																										#define UART2_CR2	*(unsigned char*)0x5245
																										#define UART2_CR3	*(unsigned char*)0x5246
																										#define UART2_CR4	*(unsigned char*)0x5247
																										#define UART2_CR5	*(unsigned char*)0x5248
																										#define UART2_CR6	*(unsigned char*)0x5249
																										#define UART2_GTR	*(unsigned char*)0x524A
																										#define UART2_PSCR	*(unsigned char*)0x524B
																									#endif // STM8S105

/* UART_CR1 bits */
#define UART_CR1_R8 (1 << 7)
#define UART_CR1_T8 (1 << 6)
#define UART_CR1_UARTD (1 << 5)
#define UART_CR1_M (1 << 4)
#define UART_CR1_WAKE (1 << 3)
#define UART_CR1_PCEN (1 << 2)
#define UART_CR1_PS (1 << 1)
#define UART_CR1_PIEN (1 << 0)

/* UART_CR2 bits */
#define UART_CR2_TIEN (1 << 7)
#define UART_CR2_TCIEN (1 << 6)
#define UART_CR2_RIEN (1 << 5)
#define UART_CR2_ILIEN (1 << 4)
#define UART_CR2_TEN (1 << 3)
#define UART_CR2_REN (1 << 2)
#define UART_CR2_RWU (1 << 1)
#define UART_CR2_SBK (1 << 0)

/* USART_CR3 bits */
#define UART_CR3_LINEN (1 << 6)
#define UART_CR3_STOP2 (1 << 5)
#define UART_CR3_STOP1 (1 << 4)
#define UART_CR3_CLKEN (1 << 3)
#define UART_CR3_CPOL (1 << 2)
#define UART_CR3_CPHA (1 << 1)
#define UART_CR3_LBCL (1 << 0)

/* UART_SR bits */
#define UART_SR_TXE (1 << 7)
#define UART_SR_TC (1 << 6)
#define UART_SR_RXNE (1 << 5)
#define UART_SR_IDLE (1 << 4)
#define UART_SR_OR (1 << 3)
#define UART_SR_NF (1 << 2)
#define UART_SR_FE (1 << 1)
#define UART_SR_PE (1 << 0)


/* ------------------- TIMERS ------------------- */
/* TIM1 */
#define TIM1_CR1	*(unsigned char*)0x5250
#define TIM1_CR2	*(unsigned char*)0x5251
#define TIM1_SMCR	*(unsigned char*)0x5252
#define TIM1_ETR	*(unsigned char*)0x5253
#define TIM1_IER	*(unsigned char*)0x5254
#define TIM1_SR1	*(unsigned char*)0x5255
#define TIM1_SR2	*(unsigned char*)0x5256
#define TIM1_EGR	*(unsigned char*)0x5257
#define TIM1_CCMR1	*(unsigned char*)0x5258
#define TIM1_CCMR2	*(unsigned char*)0x5259
#define TIM1_CCMR3	*(unsigned char*)0x525A
#define TIM1_CCMR4	*(unsigned char*)0x525B
#define TIM1_CCER1	*(unsigned char*)0x525C
#define TIM1_CCER2	*(unsigned char*)0x525D
#define TIM1_CNTRH	*(unsigned char*)0x525E
#define TIM1_CNTRL	*(unsigned char*)0x525F
#define TIM1_PSCRH	*(unsigned char*)0x5260
#define TIM1_PSCRL	*(unsigned char*)0x5261
#define TIM1_ARRH	*(unsigned char*)0x5262
#define TIM1_ARRL	*(unsigned char*)0x5263
#define TIM1_RCR	*(unsigned char*)0x5264
#define TIM1_CCR1H	*(unsigned char*)0x5265
#define TIM1_CCR1L	*(unsigned char*)0x5266
#define TIM1_CCR2H	*(unsigned char*)0x5267
#define TIM1_CCR2L	*(unsigned char*)0x5268
#define TIM1_CCR3H	*(unsigned char*)0x5269
#define TIM1_CCR3L	*(unsigned char*)0x526A
#define TIM1_CCR4H	*(unsigned char*)0x526B
#define TIM1_CCR4L	*(unsigned char*)0x526C
#define TIM1_BKR	*(unsigned char*)0x526D
#define TIM1_DTR	*(unsigned char*)0x526E
#define TIM1_OISR	*(unsigned char*)0x526F


/* TIM_IER bits */
#define TIM_IER_BIE (1 << 7)
#define TIM_IER_TIE (1 << 6)
#define TIM_IER_COMIE (1 << 5)
#define TIM_IER_CC4IE (1 << 4)
#define TIM_IER_CC3IE (1 << 3)
#define TIM_IER_CC2IE (1 << 2)
#define TIM_IER_CC1IE (1 << 1)
#define TIM_IER_UIE (1 << 0)

/* TIM_CR1 bits */
#define TIM_CR1_APRE (1 << 7)
#define TIM_CR1_CMSH (1 << 6)
#define TIM_CR1_CMSL (1 << 5)
#define TIM_CR1_DIR (1 << 4)
#define TIM_CR1_OPM (1 << 3)
#define TIM_CR1_URS (1 << 2)
#define TIM_CR1_UDIS (1 << 1)
#define TIM_CR1_CEN (1 << 0)

/* TIM_SR1 bits */
#define TIM_SR1_BIF (1 << 7)
#define TIM_SR1_TIF (1 << 6)
#define TIM_SR1_COMIF (1 << 5)
#define TIM_SR1_CC4IF (1 << 4)
#define TIM_SR1_CC3IF (1 << 3)
#define TIM_SR1_CC2IF (1 << 2)
#define TIM_SR1_CC1IF (1 << 1)
#define TIM_SR1_UIF (1 << 0)

/* TIM2 */
#define TIM2_CR1	*(unsigned char*)0x5300
#if defined STM8S105 || defined STM8S103
#define TIM2_IER	*(unsigned char*)0x5301
#define TIM2_SR1	*(unsigned char*)0x5302
#define TIM2_SR2	*(unsigned char*)0x5303
#define TIM2_EGR	*(unsigned char*)0x5304
#define TIM2_CCMR1	*(unsigned char*)0x5305
#define TIM2_CCMR2	*(unsigned char*)0x5306
#define TIM2_CCMR3	*(unsigned char*)0x5307
#define TIM2_CCER1	*(unsigned char*)0x5308
#define TIM2_CCER2	*(unsigned char*)0x5309
#define TIM2_CNTRH	*(unsigned char*)0x530A
#define TIM2_CNTRL	*(unsigned char*)0x530B
#define TIM2_PSCR	*(unsigned char*)0x530C
#define TIM2_ARRH	*(unsigned char*)0x530D
#define TIM2_ARRL	*(unsigned char*)0x530E
#define TIM2_CCR1H	*(unsigned char*)0x530F
#define TIM2_CCR1L	*(unsigned char*)0x5310
#define TIM2_CCR2H	*(unsigned char*)0x5311
#define TIM2_CCR2L	*(unsigned char*)0x5312
#define TIM2_CCR3H	*(unsigned char*)0x5313
#define TIM2_CCR3L	*(unsigned char*)0x5314
#elif defined STM8S003
#define TIM2_IER	*(unsigned char*)0x5303
#define TIM2_SR1	*(unsigned char*)0x5304
#define TIM2_SR2	*(unsigned char*)0x5305
#define TIM2_EGR	*(unsigned char*)0x5306
#define TIM2_CCMR1	*(unsigned char*)0x5307
#define TIM2_CCMR2	*(unsigned char*)0x5308
#define TIM2_CCMR3	*(unsigned char*)0x5309
#define TIM2_CCER1	*(unsigned char*)0x530A
#define TIM2_CCER2	*(unsigned char*)0x530B
#define TIM2_CNTRH	*(unsigned char*)0x530C
#define TIM2_CNTRL	*(unsigned char*)0x530D
#define TIM2_PSCR	*(unsigned char*)0x530E
#define TIM2_ARRH	*(unsigned char*)0x530F
#define TIM2_ARRL	*(unsigned char*)0x5310
#define TIM2_CCR1H	*(unsigned char*)0x5311
#define TIM2_CCR1L	*(unsigned char*)0x5312
#define TIM2_CCR2H	*(unsigned char*)0x5313
#define TIM2_CCR2L	*(unsigned char*)0x5314
#define TIM2_CCR3H	*(unsigned char*)0x5315
#define TIM2_CCR3L	*(unsigned char*)0x5316
#endif
/*CR1*/
#define TIM2_CR1_ARPE    ((uint8_t)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM2_CR1_OPM     ((uint8_t)0x08) /*!< One Pulse Mode mask. */
#define TIM2_CR1_URS     ((uint8_t)0x04) /*!< Update Request Source mask. */
#define TIM2_CR1_UDIS    ((uint8_t)0x02) /*!< Update DIsable mask. */
#define TIM2_CR1_CEN     ((uint8_t)0x01) /*!< Counter Enable mask. */
/*IER*/
#define TIM2_IER_CC3IE   ((uint8_t)0x08) /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM2_IER_CC2IE   ((uint8_t)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM2_IER_CC1IE   ((uint8_t)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM2_IER_UIE     ((uint8_t)0x01) /*!< Update Interrupt Enable mask. */
/*SR1*/
#define TIM2_SR1_CC3IF   ((uint8_t)0x08) /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM2_SR1_CC2IF   ((uint8_t)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM2_SR1_CC1IF   ((uint8_t)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM2_SR1_UIF     ((uint8_t)0x01) /*!< Update Interrupt Flag mask. */
/*SR2*/
#define TIM2_SR2_CC3OF   ((uint8_t)0x08) /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM2_SR2_CC2OF   ((uint8_t)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM2_SR2_CC1OF   ((uint8_t)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */
/*EGR*/
#define TIM2_EGR_CC3G    ((uint8_t)0x08) /*!< Capture/Compare 3 Generation mask. */
#define TIM2_EGR_CC2G    ((uint8_t)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM2_EGR_CC1G    ((uint8_t)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM2_EGR_UG      ((uint8_t)0x01) /*!< Update Generation mask. */
/*CCMR*/
#define TIM2_CCMR_ICxPSC ((uint8_t)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM2_CCMR_ICxF   ((uint8_t)0xF0) /*!< Input Capture x Filter mask. */
#define TIM2_CCMR_OCM    ((uint8_t)0x70) /*!< Output Compare x Mode mask. */
#define TIM2_CCMR_OCxPE  ((uint8_t)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM2_CCMR_CCxS   ((uint8_t)0x03) /*!< Capture/Compare x Selection mask. */
/*CCER1*/
#define TIM2_CCER1_CC2P  ((uint8_t)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM2_CCER1_CC2E  ((uint8_t)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM2_CCER1_CC1P  ((uint8_t)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM2_CCER1_CC1E  ((uint8_t)0x01) /*!< Capture/Compare 1 output enable mask. */
/*CCER2*/
#define TIM2_CCER2_CC3P  ((uint8_t)0x02) /*!< Capture/Compare 3 output Polarity mask. */
#define TIM2_CCER2_CC3E  ((uint8_t)0x01) /*!< Capture/Compare 3 output enable mask. */
/*CNTR*/
#define TIM2_CNTRH_CNT   ((uint8_t)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM2_CNTRL_CNT   ((uint8_t)0xFF) /*!< Counter Value (LSB) mask. */
/*PSCR*/
#define TIM2_PSCR_PSC    ((uint8_t)0xFF) /*!< Prescaler Value (MSB) mask. */
/*ARR*/
#define TIM2_ARRH_ARR    ((uint8_t)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM2_ARRL_ARR    ((uint8_t)0xFF) /*!< Autoreload Value (LSB) mask. */
/*CCR1*/
#define TIM2_CCR1H_CCR1  ((uint8_t)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM2_CCR1L_CCR1  ((uint8_t)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */
/*CCR2*/
#define TIM2_CCR2H_CCR2  ((uint8_t)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM2_CCR2L_CCR2  ((uint8_t)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */
/*CCR3*/
#define TIM2_CCR3H_CCR3  ((uint8_t)0xFF) /*!< Capture/Compare 3 Value (MSB) mask. */
#define TIM2_CCR3L_CCR3  ((uint8_t)0xFF) /*!< Capture/Compare 3 Value (LSB) mask. */


/* TIM3 */
																								#if defined STM8S105 || defined STM8S103
																										#define TIM3_CR1	*(unsigned char*)0x5320
																										#define TIM3_IER	*(unsigned char*)0x5321
																										#define TIM3_SR1	*(unsigned char*)0x5322
																										#define TIM3_SR2	*(unsigned char*)0x5323
																										#define TIM3_EGR	*(unsigned char*)0x5324
																										#define TIM3_CCMR1	*(unsigned char*)0x5325
																										#define TIM3_CCMR2	*(unsigned char*)0x5326
																										#define TIM3_CCER1	*(unsigned char*)0x5327
																										#define TIM3_CNTRH	*(unsigned char*)0x5328
																										#define TIM3_CNTRL	*(unsigned char*)0x5329
																										#define TIM3_PSCR	*(unsigned char*)0x532A
																										#define TIM3_ARRH	*(unsigned char*)0x532B
																										#define TIM3_ARRL	*(unsigned char*)0x532C
																										#define TIM3_CCR1H	*(unsigned char*)0x532D
																										#define TIM3_CCR1L	*(unsigned char*)0x532E
																										#define TIM3_CCR2H	*(unsigned char*)0x532F
																										#define TIM3_CCR2L	*(unsigned char*)0x5330
																										#endif

/* TIM4 */
#define TIM4_CR1	*(unsigned char*)0x5340
																								#if defined STM8S105 || defined STM8S103
																									#define TIM4_IER	*(unsigned char*)0x5341
																									#define TIM4_SR		*(volatile unsigned char *)0x5342
																									#define TIM4_EGR	*(unsigned char*)0x5343
																									#define TIM4_CNTR	*(volatile unsigned char *)0x5344
																									#define TIM4_PSCR	*(unsigned char*)0x5345
																									#define TIM4_ARR	*(unsigned char*)0x5346
#elif defined STM8S003
#define TIM4_IER	*(unsigned char*)0x5343
#define TIM4_SR		*(unsigned char*)0x5344
#define TIM4_EGR	*(unsigned char*)0x5345
#define TIM4_CNTR	*(unsigned char*)0x5346
#define TIM4_PSCR	*(unsigned char*)0x5347
#define TIM4_ARR	*(unsigned char*)0x5348
#endif

/* ------------------- ADC ------------------- */
#define ADC_DB0RH	*(unsigned char*)0x53E0
#define ADC_DB0RL	*(unsigned char*)0x53E1
#define ADC_DB1RH	*(unsigned char*)0x53E2
#define ADC_DB1RL	*(unsigned char*)0x53E3
#define ADC_DB2RH	*(unsigned char*)0x53E4
#define ADC_DB2RL	*(unsigned char*)0x53E5
#define ADC_DB3RH	*(unsigned char*)0x53E6
#define ADC_DB3RL	*(unsigned char*)0x53E7
#define ADC_DB4RH	*(unsigned char*)0x53E8
#define ADC_DB4RL	*(unsigned char*)0x53E9
#define ADC_DB5RH	*(unsigned char*)0x53EA
#define ADC_DB5RL	*(unsigned char*)0x53EB
#define ADC_DB6RH	*(unsigned char*)0x53EC
#define ADC_DB6RL	*(unsigned char*)0x53ED
#define ADC_DB7RH	*(unsigned char*)0x53EE
#define ADC_DB7RL	*(unsigned char*)0x53EF
#define ADC_DB8RH	*(unsigned char*)0x53F0
#define ADC_DB8RL	*(unsigned char*)0x53F1
#define ADC_DB9RH	*(unsigned char*)0x53F2
#define ADC_DB9RL	*(unsigned char*)0x53F3
#define ADC_CSR		*(unsigned char*)0x5400
#define ADC_CR1		*(unsigned char*)0x5401
#define ADC_CR2		*(unsigned char*)0x5402
#define ADC_CR3		*(unsigned char*)0x5403
#define ADC_DRH		*(unsigned char*)0x5404
#define ADC_DRL		*(unsigned char*)0x5405
#define ADC_TDRH	*(unsigned char*)0x5406
#define ADC_TDRL	*(unsigned char*)0x5407
#define ADC_HTRH	*(unsigned char*)0x5408
#define ADC_HTRL	*(unsigned char*)0x5409
#define ADC_LTRH	*(unsigned char*)0x540A
#define ADC_LTRL	*(unsigned char*)0x540B
#define ADC_AWSRH	*(unsigned char*)0x540C
#define ADC_AWSRL	*(unsigned char*)0x540D
#define ADC_AWCRH	*(unsigned char*)0x540E
#define ADC_AWCRL	*(unsigned char*)0x540F

/* ------------------- swim control ------------------- */
#define CFG_GCR			*(unsigned char*)0x7F60
#define SWIM_CSR		*(unsigned char*)0x7F80

/* ------------------- ITC ------------------- */
#define ITC_SPR1		*(unsigned char*)0x7F70
#define ITC_SPR2		*(unsigned char*)0x7F71
#define ITC_SPR3		*(unsigned char*)0x7F72
#define ITC_SPR4		*(unsigned char*)0x7F73
#define ITC_SPR5		*(unsigned char*)0x7F74
#define ITC_SPR6		*(unsigned char*)0x7F75
#define ITC_SPR7		*(unsigned char*)0x7F76
#define ITC_SPR8		*(unsigned char*)0x7F77


/* -------------------- UNIQUE ID -------------------- */
#if defined STM8S105 || defined STM8S103 // maybe some other MCU have this too???
#define U_ID00		(unsigned char*)0x48CD		
#define U_ID01		(unsigned char*)0x48CE
#define U_ID02		(unsigned char*)0x48CF
#define U_ID03		(unsigned char*)0x48D0
#define U_ID04		(unsigned char*)0x48D1
#define U_ID05		(unsigned char*)0x48D2
#define U_ID06		(unsigned char*)0x48D3
#define U_ID07		(unsigned char*)0x48D4
#define U_ID08		(unsigned char*)0x48D5
#define U_ID09		(unsigned char*)0x48D6
#define U_ID10		(unsigned char*)0x48D7
#define U_ID11		(unsigned char*)0x48D8
#endif // defined STM8S105 || defined STM8S103
// CCR REGISTER: bits 3&5 should be 1 if you wanna change EXTI_CRx
#define CCR			*(unsigned char*)0x7F0A
#endif // __STM8L_H__


//==========================================================

#define CLK_ICKR_RESET_VALUE     ((uint8_t)0x01)
#define CLK_ECKR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_CMSR_RESET_VALUE     ((uint8_t)0xE1)
#define CLK_SWR_RESET_VALUE      ((uint8_t)0xE1)
#define CLK_SWCR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_CKDIVR_RESET_VALUE   ((uint8_t)0x18)
#define CLK_PCKENR1_RESET_VALUE  ((uint8_t)0xFF)
#define CLK_PCKENR2_RESET_VALUE  ((uint8_t)0xFF)
#define CLK_CSSR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_CCOR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_HSITRIMR_RESET_VALUE ((uint8_t)0x00)
#define CLK_SWIMCCR_RESET_VALUE  ((uint8_t)0x00)


#define CLK_ICKR_SWUAH       ((uint8_t)0x20) /*!< Slow Wake-up from Active Halt/Halt modes */
#define CLK_ICKR_LSIRDY      ((uint8_t)0x10) /*!< Low speed internal oscillator ready */
#define CLK_ICKR_LSIEN       ((uint8_t)0x08) /*!< Low speed internal RC oscillator enable */
#define CLK_ICKR_FHWU        ((uint8_t)0x04) /*!< Fast Wake-up from Active Halt/Halt mode */
#define CLK_ICKR_HSIRDY      ((uint8_t)0x02) /*!< High speed internal RC oscillator ready */
#define CLK_ICKR_HSIEN       ((uint8_t)0x01) /*!< High speed internal RC oscillator enable */

#define CLK_ECKR_HSERDY      ((uint8_t)0x02) /*!< High speed external crystal oscillator ready */
#define CLK_ECKR_HSEEN       ((uint8_t)0x01) /*!< High speed external crystal oscillator enable */

#define CLK_CMSR_CKM         ((uint8_t)0xFF) /*!< Clock master status bits */

#define CLK_SWR_SWI          ((uint8_t)0xFF) /*!< Clock master selection bits */

#define CLK_SWCR_SWIF        ((uint8_t)0x08) /*!< Clock switch interrupt flag */
#define CLK_SWCR_SWIEN       ((uint8_t)0x04) /*!< Clock switch interrupt enable */
#define CLK_SWCR_SWEN        ((uint8_t)0x02) /*!< Switch start/stop */
#define CLK_SWCR_SWBSY       ((uint8_t)0x01) /*!< Switch busy flag*/

#define CLK_CKDIVR_HSIDIV    ((uint8_t)0x18) /*!< High speed internal clock prescaler */
#define CLK_CKDIVR_CPUDIV    ((uint8_t)0x07) /*!< CPU clock prescaler */

#define CLK_PCKENR1_TIM1     ((uint8_t)0x80) /*!< Timer 1 clock enable */ 
#define CLK_PCKENR1_TIM3     ((uint8_t)0x40) /*!< Timer 3 clock enable */
#define CLK_PCKENR1_TIM2     ((uint8_t)0x20) /*!< Timer 2 clock enable */
#define CLK_PCKENR1_TIM5     ((uint8_t)0x20) /*!< Timer 5 clock enable */
#define CLK_PCKENR1_TIM4     ((uint8_t)0x10) /*!< Timer 4 clock enable */
#define CLK_PCKENR1_TIM6     ((uint8_t)0x10) /*!< Timer 6 clock enable */
#define CLK_PCKENR1_UART3    ((uint8_t)0x08) /*!< UART3 clock enable */
#define CLK_PCKENR1_UART2    ((uint8_t)0x08) /*!< UART2 clock enable */
#define CLK_PCKENR1_UART1    ((uint8_t)0x04) /*!< UART1 clock enable */
#define CLK_PCKENR1_SPI      ((uint8_t)0x02) /*!< SPI clock enable */
#define CLK_PCKENR1_I2C      ((uint8_t)0x01) /*!< I2C clock enable */

#define CLK_PCKENR2_CAN      ((uint8_t)0x80) /*!< CAN clock enable */
#define CLK_PCKENR2_ADC      ((uint8_t)0x08) /*!< ADC clock enable */
#define CLK_PCKENR2_AWU      ((uint8_t)0x04) /*!< AWU clock enable */

#define CLK_CSSR_CSSD        ((uint8_t)0x08) /*!< Clock security system detection */
#define CLK_CSSR_CSSDIE      ((uint8_t)0x04) /*!< Clock security system detection interrupt enable */
#define CLK_CSSR_AUX         ((uint8_t)0x02) /*!< Auxiliary oscillator connected to master clock */
#define CLK_CSSR_CSSEN       ((uint8_t)0x01) /*!< Clock security system enable */

#define CLK_CCOR_CCOBSY      ((uint8_t)0x40) /*!< Configurable clock output busy */
#define CLK_CCOR_CCORDY      ((uint8_t)0x20) /*!< Configurable clock output ready */
#define CLK_CCOR_CCOSEL      ((uint8_t)0x1E) /*!< Configurable clock output selection */
#define CLK_CCOR_CCOEN       ((uint8_t)0x01) /*!< Configurable clock output enable */

#define CLK_HSITRIMR_HSITRIM ((uint8_t)0x07) /*!< High speed internal oscillator trimmer */

#define CLK_SWIMCCR_SWIMDIV  ((uint8_t)0x01) /*!< SWIM Clock Dividing Factor */


		#define UART1_SR	*(unsigned char*)0x5230
		#define UART1_DR	*(unsigned char*)0x5231
		#define UART1_BRR1	*(unsigned char*)0x5232
		#define UART1_BRR2	*(unsigned char*)0x5233
		#define UART1_CR1	*(unsigned char*)0x5234
		#define UART1_CR2	*(unsigned char*)0x5235
		#define UART1_CR3	*(unsigned char*)0x5236
		#define UART1_CR4	*(unsigned char*)0x5237
		#define UART1_CR5	*(unsigned char*)0x5238
		#define UART1_GTR	*(unsigned char*)0x5239
		#define UART1_PSCR	*(unsigned char*)0x523A

#define UART1_SR_RESET_VALUE   ((uint8_t)0xC0)
#define UART1_BRR1_RESET_VALUE ((uint8_t)0x00)
#define UART1_BRR2_RESET_VALUE ((uint8_t)0x00)
#define UART1_CR1_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR2_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR3_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR4_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR5_RESET_VALUE  ((uint8_t)0x00)
#define UART1_GTR_RESET_VALUE  ((uint8_t)0x00)
#define UART1_PSCR_RESET_VALUE ((uint8_t)0x00)

#define UART1_SR_TXE   ((uint8_t)0x80) /*!< Transmit Data Register Empty mask */
#define UART1_SR_TC    ((uint8_t)0x40) /*!< Transmission Complete mask */
#define UART1_SR_RXNE  ((uint8_t)0x20) /*!< Read Data Register Not Empty mask */
#define UART1_SR_IDLE  ((uint8_t)0x10) /*!< IDLE line detected mask */
#define UART1_SR_OR   ((uint8_t)0x08) /*!< OverRun error mask */
#define UART1_SR_NF    ((uint8_t)0x04) /*!< Noise Flag mask */
#define UART1_SR_FE    ((uint8_t)0x02) /*!< Framing Error mask */
#define UART1_SR_PE    ((uint8_t)0x01) /*!< Parity Error mask */

#define UART1_BRR1_DIVM  ((uint8_t)0xFF) /*!< LSB mantissa of UART1DIV [7:0] mask */

#define UART1_BRR2_DIVM  ((uint8_t)0xF0) /*!< MSB mantissa of UART1DIV [11:8] mask */
#define UART1_BRR2_DIVF  ((uint8_t)0x0F) /*!< Fraction bits of UART1DIV [3:0] mask */

#define UART1_CR1_R8      ((uint8_t)0x80) /*!< Receive Data bit 8 */
#define UART1_CR1_T8      ((uint8_t)0x40) /*!< Transmit data bit 8 */
#define UART1_CR1_UARTD   ((uint8_t)0x20) /*!< UART1 Disable (for low power consumption) */
#define UART1_CR1_M       ((uint8_t)0x10) /*!< Word length mask */
#define UART1_CR1_WAKE    ((uint8_t)0x08) /*!< Wake-up method mask */
#define UART1_CR1_PCEN    ((uint8_t)0x04) /*!< Parity Control Enable mask */
#define UART1_CR1_PS      ((uint8_t)0x02) /*!< UART1 Parity Selection */
#define UART1_CR1_PIEN    ((uint8_t)0x01) /*!< UART1 Parity Interrupt Enable mask */

#define UART1_CR2_TIEN    ((uint8_t)0x80) /*!< Transmitter Interrupt Enable mask */
#define UART1_CR2_TCIEN   ((uint8_t)0x40) /*!< Transmission Complete Interrupt Enable mask */
#define UART1_CR2_RIEN    ((uint8_t)0x20) /*!< Receiver Interrupt Enable mask */
#define UART1_CR2_ILIEN   ((uint8_t)0x10) /*!< IDLE Line Interrupt Enable mask */
#define UART1_CR2_TEN     ((uint8_t)0x08) /*!< Transmitter Enable mask */
#define UART1_CR2_REN     ((uint8_t)0x04) /*!< Receiver Enable mask */
#define UART1_CR2_RWU     ((uint8_t)0x02) /*!< Receiver Wake-Up mask */
#define UART1_CR2_SBK     ((uint8_t)0x01) /*!< Send Break mask */

#define UART1_CR3_LINEN   ((uint8_t)0x40) /*!< Alternate Function output mask */
#define UART1_CR3_STOP    ((uint8_t)0x30) /*!< STOP bits [1:0] mask */
#define UART1_CR3_CKEN    ((uint8_t)0x08) /*!< Clock Enable mask */
#define UART1_CR3_CPOL    ((uint8_t)0x04) /*!< Clock Polarity mask */
#define UART1_CR3_CPHA    ((uint8_t)0x02) /*!< Clock Phase mask */
#define UART1_CR3_LBCL    ((uint8_t)0x01) /*!< Last Bit Clock pulse mask */

#define UART1_CR4_LBDIEN  ((uint8_t)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define UART1_CR4_LBDL    ((uint8_t)0x20) /*!< LIN Break Detection Length mask */
#define UART1_CR4_LBDF    ((uint8_t)0x10) /*!< LIN Break Detection Flag mask */
#define UART1_CR4_ADD     ((uint8_t)0x0F) /*!< Address of the UART1 node mask */

#define UART1_CR5_SCEN    ((uint8_t)0x20) /*!< Smart Card Enable mask */
#define UART1_CR5_NACK    ((uint8_t)0x10) /*!< Smart Card Nack Enable mask */
#define UART1_CR5_HDSEL   ((uint8_t)0x08) /*!< Half-Duplex Selection mask */
#define UART1_CR5_IRLP    ((uint8_t)0x04) /*!< Irda Low Power Selection mask */
#define UART1_CR5_IREN    ((uint8_t)0x02) /*!< Irda Enable mask */



/** @addtogroup ADC1_Registers_Reset_Value
  * @{
  */
 #define  ADC1_CSR_RESET_VALUE    ((uint8_t)0x00)
 #define  ADC1_CR1_RESET_VALUE    ((uint8_t)0x00)
 #define  ADC1_CR2_RESET_VALUE    ((uint8_t)0x00)
 #define  ADC1_CR3_RESET_VALUE    ((uint8_t)0x00)
 #define  ADC1_TDRL_RESET_VALUE   ((uint8_t)0x00)
 #define  ADC1_TDRH_RESET_VALUE   ((uint8_t)0x00)
 #define  ADC1_HTRL_RESET_VALUE   ((uint8_t)0x03)
 #define  ADC1_HTRH_RESET_VALUE   ((uint8_t)0xFF)
 #define  ADC1_LTRH_RESET_VALUE   ((uint8_t)0x00)
 #define  ADC1_LTRL_RESET_VALUE   ((uint8_t)0x00)
 #define  ADC1_AWCRH_RESET_VALUE  ((uint8_t)0x00)
 #define  ADC1_AWCRL_RESET_VALUE  ((uint8_t)0x00)
/**
  * @}
  */

/** @addtogroup ADC1_Registers_Bits_Definition
  * @{
  */
 #define ADC1_CSR_EOC     ((uint8_t)0x80) /*!< End of Conversion mask */
 #define ADC1_CSR_AWD     ((uint8_t)0x40) /*!< Analog Watch Dog Status mask */
 #define ADC1_CSR_EOCIE   ((uint8_t)0x20) /*!< Interrupt Enable for EOC mask */
 #define ADC1_CSR_AWDIE   ((uint8_t)0x10) /*!< Analog Watchdog interrupt enable mask */
 #define ADC1_CSR_CH      ((uint8_t)0x0F) /*!< Channel selection bits mask */

 #define ADC1_CR1_SPSEL   ((uint8_t)0x70) /*!< Prescaler selection mask */
 #define ADC1_CR1_CONT    ((uint8_t)0x02) /*!< Continuous conversion mask */
 #define ADC1_CR1_ADON    ((uint8_t)0x01) /*!< A/D Converter on/off mask */

 #define ADC1_CR2_EXTTRIG ((uint8_t)0x40) /*!< External trigger enable mask */
 #define ADC1_CR2_EXTSEL  ((uint8_t)0x30) /*!< External event selection mask */
 #define ADC1_CR2_ALIGN   ((uint8_t)0x08) /*!< Data Alignment mask */
 #define ADC1_CR2_SCAN    ((uint8_t)0x02) /*!< Scan mode mask */

 #define ADC1_CR3_DBUF    ((uint8_t)0x80) /*!< Data Buffer Enable mask */
 #define ADC1_CR3_OVR     ((uint8_t)0x40) /*!< Overrun Status Flag mask */