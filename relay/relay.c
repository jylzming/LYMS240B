#include "relay.h"
//#include "global.h"

void Rly_GPIO_Config(void)
{
	PC_DDR |= 0x01 << 5;//PC5 IO������Ϊ�������
	PC_CR1 |= 0x01 << 5;
	PC_CR2 |= 0x01 << 5;
}
