   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
3251                     ; 19 main()
3251                     ; 20 {
3253                     	switch	.text
3254  0000               _main:
3258                     ; 21 	Microwave_Init();
3260  0000 cd0000        	call	_Microwave_Init
3262                     ; 22 	Rly_GPIO_Config();
3264  0003 cd0000        	call	_Rly_GPIO_Config
3266                     ; 23 	TIM1_Init();
3268  0006 cd0000        	call	_TIM1_Init
3270  0009               L1122:
3271                     ; 24 	while (1);
3273  0009 20fe          	jra	L1122
3311                     ; 28 @far @interrupt void TIM1_UPD_IRQHandler(void)
3311                     ; 29 {
3313                     	switch	.text
3314  000b               f_TIM1_UPD_IRQHandler:
3317       00000001      OFST:	set	1
3318  000b 88            	push	a
3321                     ; 30 	unsigned char i = 0;
3323  000c 0f01          	clr	(OFST+0,sp)
3324                     ; 31 	TIM1_SR1 &= 0xFE;//clear interrupt label
3326  000e 72115255      	bres	_TIM1_SR1,#0
3327                     ; 32 	second++;
3329  0012 be06          	ldw	x,_second
3330  0014 1c0001        	addw	x,#1
3331  0017 bf06          	ldw	_second,x
3332                     ; 33 	if(second == 3600)/***********???????????????***************/
3334  0019 be06          	ldw	x,_second
3335  001b a30e10        	cpw	x,#3600
3336  001e 260a          	jrne	L3322
3337                     ; 35 		second = 0;
3339  0020 5f            	clrw	x
3340  0021 bf06          	ldw	_second,x
3341                     ; 36 		hour += 1;
3343  0023 be04          	ldw	x,_hour
3344  0025 1c0001        	addw	x,#1
3345  0028 bf04          	ldw	_hour,x
3346  002a               L3322:
3347                     ; 40 }
3350  002a 84            	pop	a
3351  002b 80            	iret
3375                     ; 43 @far @interrupt void EXTI1_IRQHandler(void)
3375                     ; 44 {
3376                     	switch	.text
3377  002c               f_EXTI1_IRQHandler:
3380  002c 3b0002        	push	c_x+2
3381  002f be00          	ldw	x,c_x
3382  0031 89            	pushw	x
3383  0032 3b0002        	push	c_y+2
3384  0035 be00          	ldw	x,c_y
3385  0037 89            	pushw	x
3388                     ; 45 	LIGHT = ON; 
3390  0038 721b500a      	bres	_PC_ODR_5
3391                     ; 46 	Delay();
3393  003c cd0000        	call	_Delay
3395                     ; 47 	LIGHT = OFF;
3397  003f 721a500a      	bset	_PC_ODR_5
3398                     ; 48 }
3401  0043 85            	popw	x
3402  0044 bf00          	ldw	c_y,x
3403  0046 320002        	pop	c_y+2
3404  0049 85            	popw	x
3405  004a bf00          	ldw	c_x,x
3406  004c 320002        	pop	c_x+2
3407  004f 80            	iret
3498                     	xdef	f_EXTI1_IRQHandler
3499                     	xdef	f_TIM1_UPD_IRQHandler
3500                     	xdef	_main
3501                     	xref	_Microwave_Init
3502                     	switch	.ubsct
3503  0000               _relayStat:
3504  0000 00            	ds.b	1
3505                     	xdef	_relayStat
3506  0001               _timeChanged:
3507  0001 00            	ds.b	1
3508                     	xdef	_timeChanged
3509  0002               _isDimmingConfiged:
3510  0002 00            	ds.b	1
3511                     	xdef	_isDimmingConfiged
3512  0003               _brightness:
3513  0003 00            	ds.b	1
3514                     	xdef	_brightness
3515  0004               _hour:
3516  0004 0000          	ds.b	2
3517                     	xdef	_hour
3518  0006               _second:
3519  0006 0000          	ds.b	2
3520                     	xdef	_second
3521                     	xref	_TIM1_Init
3522                     	xref	_Delay
3523                     	xref	_Rly_GPIO_Config
3524                     	xref.b	c_x
3525                     	xref.b	c_y
3545                     	end
