/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "STM8S001J3.h"
#include "stm8s_bit.h"
#include "relay.h"
#include "delay.h"
#include "global.h"
#include "microwave.h"

unsigned int second;
unsigned int hour;
unsigned char brightness;
bool isDimmingConfiged;
bool timeChanged;
bool relayStat;

main()
{
	Microwave_Init();
	Rly_GPIO_Config();
	TIM1_Init();
	while (1);
}

/****************************************************/
@far @interrupt void TIM1_UPD_IRQHandler(void)
{
	unsigned char i = 0;
	TIM1_SR1 &= 0xFE;//clear interrupt label
	second++;
	if(second == 3600)/***********???????????????***************/
	{
		second = 0;
		hour += 1;
		if(hour > 65536)
			hour = 0;
	}
}


@far @interrupt void EXTI1_IRQHandler(void)
{
	LIGHT = ON; 
	Delay();
	LIGHT = OFF;
}