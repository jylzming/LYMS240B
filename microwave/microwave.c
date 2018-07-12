#include "microwave.h"

void MicrowaveGPIO_Config(void)
{
	PB_DDR &= ~(0x01 << 4);
	PB_CR1 &= ~(0x01 << 4);
	PB_CR2 |= 0x01 << 4;
	
	EXTI_CR1 = 0x08;//down triger
}

void Microwave_Init(void)
{
	MicrowaveGPIO_Config();
}

