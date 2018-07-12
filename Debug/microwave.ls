   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3253                     ; 3 void MicrowaveGPIO_Config(void)
3253                     ; 4 {
3255                     	switch	.text
3256  0000               _MicrowaveGPIO_Config:
3260                     ; 5 	PB_DDR &= ~(0x01 << 4);
3262  0000 72195007      	bres	_PB_DDR,#4
3263                     ; 6 	PB_CR1 &= ~(0x01 << 4);
3265  0004 72195008      	bres	_PB_CR1,#4
3266                     ; 7 	PB_CR2 |= 0x01 << 4;
3268  0008 72185009      	bset	_PB_CR2,#4
3269                     ; 9 	EXTI_CR1 = 0x08;//down triger
3271  000c 350850a0      	mov	_EXTI_CR1,#8
3272                     ; 10 }
3275  0010 81            	ret
3299                     ; 12 void Microwave_Init(void)
3299                     ; 13 {
3300                     	switch	.text
3301  0011               _Microwave_Init:
3305                     ; 14 	MicrowaveGPIO_Config();
3307  0011 aded          	call	_MicrowaveGPIO_Config
3309                     ; 15 }
3312  0013 81            	ret
3325                     	xdef	_Microwave_Init
3326                     	xdef	_MicrowaveGPIO_Config
3345                     	end
