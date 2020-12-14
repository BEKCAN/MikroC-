
_repeat:

;LINK2.c,8 :: 		void repeat(){
;LINK2.c,9 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;LINK2.c,10 :: 		delay_us(8000);
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_repeat0:
	DECFSZ      R13, 1, 1
	BRA         L_repeat0
	DECFSZ      R12, 1, 1
	BRA         L_repeat0
	NOP
	NOP
;LINK2.c,11 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;LINK2.c,12 :: 		delay_us(8000);
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_repeat1:
	DECFSZ      R13, 1, 1
	BRA         L_repeat1
	DECFSZ      R12, 1, 1
	BRA         L_repeat1
	NOP
	NOP
;LINK2.c,13 :: 		}
L_end_repeat:
	RETURN      0
; end of _repeat

_send_data_byte:

;LINK2.c,14 :: 		send_data_byte(unsigned char dattt){
;LINK2.c,15 :: 		PWM1_init(36000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       82
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;LINK2.c,16 :: 		PWM1_Set_Duty(127);
	MOVLW       127
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;LINK2.c,17 :: 		for(j=0;j<8;j++){
	CLRF        _j+0 
	CLRF        _j+1 
L_send_data_byte2:
	MOVLW       0
	SUBWF       _j+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__send_data_byte28
	MOVLW       8
	SUBWF       _j+0, 0 
L__send_data_byte28:
	BTFSC       STATUS+0, 0 
	GOTO        L_send_data_byte3
;LINK2.c,18 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;LINK2.c,19 :: 		delay_us(562);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       47
	MOVWF       R13, 0
L_send_data_byte5:
	DECFSZ      R13, 1, 1
	BRA         L_send_data_byte5
	DECFSZ      R12, 1, 1
	BRA         L_send_data_byte5
;LINK2.c,20 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;LINK2.c,21 :: 		if(dattt & 0x01){
	BTFSS       FARG_send_data_byte_dattt+0, 0 
	GOTO        L_send_data_byte6
;LINK2.c,22 :: 		delay_us(1687);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       145
	MOVWF       R13, 0
L_send_data_byte7:
	DECFSZ      R13, 1, 1
	BRA         L_send_data_byte7
	DECFSZ      R12, 1, 1
	BRA         L_send_data_byte7
	NOP
;LINK2.c,23 :: 		dattt=dattt>>1;
	RRCF        FARG_send_data_byte_dattt+0, 1 
	BCF         FARG_send_data_byte_dattt+0, 7 
;LINK2.c,24 :: 		}
	GOTO        L_send_data_byte8
L_send_data_byte6:
;LINK2.c,27 :: 		delay_us(562);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       47
	MOVWF       R13, 0
L_send_data_byte9:
	DECFSZ      R13, 1, 1
	BRA         L_send_data_byte9
	DECFSZ      R12, 1, 1
	BRA         L_send_data_byte9
;LINK2.c,28 :: 		dattt=dattt>>1;
	RRCF        FARG_send_data_byte_dattt+0, 1 
	BCF         FARG_send_data_byte_dattt+0, 7 
;LINK2.c,29 :: 		}
L_send_data_byte8:
;LINK2.c,17 :: 		for(j=0;j<8;j++){
	INFSNZ      _j+0, 1 
	INCF        _j+1, 1 
;LINK2.c,30 :: 		}
	GOTO        L_send_data_byte2
L_send_data_byte3:
;LINK2.c,31 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;LINK2.c,32 :: 		}
L_end_send_data_byte:
	RETURN      0
; end of _send_data_byte

_send_data_command:

;LINK2.c,33 :: 		void send_data_command(unsigned char dat){
;LINK2.c,34 :: 		PWM1_init(36000);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       82
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;LINK2.c,35 :: 		PWM1_Set_Duty(127);
	MOVLW       127
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;LINK2.c,36 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;LINK2.c,37 :: 		delay_us(9000);
	MOVLW       36
	MOVWF       R12, 0
	MOVLW       15
	MOVWF       R13, 0
L_send_data_command10:
	DECFSZ      R13, 1, 1
	BRA         L_send_data_command10
	DECFSZ      R12, 1, 1
	BRA         L_send_data_command10
;LINK2.c,38 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;LINK2.c,39 :: 		delay_us(4500);
	MOVLW       18
	MOVWF       R12, 0
	MOVLW       135
	MOVWF       R13, 0
L_send_data_command11:
	DECFSZ      R13, 1, 1
	BRA         L_send_data_command11
	DECFSZ      R12, 1, 1
	BRA         L_send_data_command11
;LINK2.c,40 :: 		send_data_byte(dat);
	MOVF        FARG_send_data_command_dat+0, 0 
	MOVWF       FARG_send_data_byte_dattt+0 
	CALL        _send_data_byte+0, 0
;LINK2.c,41 :: 		repeat();
	CALL        _repeat+0, 0
;LINK2.c,42 :: 		}
L_end_send_data_command:
	RETURN      0
; end of _send_data_command

_main:

;LINK2.c,43 :: 		void main() {
;LINK2.c,44 :: 		ADCON1=0x0F;  // disable ADC converter
	MOVLW       15
	MOVWF       ADCON1+0 
;LINK2.c,45 :: 		CMCON=7; // to disable comparator
	MOVLW       7
	MOVWF       CMCON+0 
;LINK2.c,46 :: 		TRISA.F0=1;
	BSF         TRISA+0, 0 
;LINK2.c,47 :: 		TRISA.F1=1;
	BSF         TRISA+0, 1 
;LINK2.c,48 :: 		TRISA.F2=1;
	BSF         TRISA+0, 2 
;LINK2.c,49 :: 		TRISA.F3=1;
	BSF         TRISA+0, 3 
;LINK2.c,50 :: 		TRISC.F2=0;
	BCF         TRISC+0, 2 
;LINK2.c,52 :: 		PORTC.F2=0;
	BCF         PORTC+0, 2 
;LINK2.c,53 :: 		while(1){
L_main12:
;LINK2.c,54 :: 		if(PORTA.F0==0){
	BTFSC       PORTA+0, 0 
	GOTO        L_main14
;LINK2.c,55 :: 		send_data_command(command_2);
	MOVLW       129
	MOVWF       FARG_send_data_command_dat+0 
	CALL        _send_data_command+0, 0
;LINK2.c,56 :: 		while(PORTA.F0==0){
L_main15:
	BTFSC       PORTA+0, 0 
	GOTO        L_main16
;LINK2.c,57 :: 		repeat();
	CALL        _repeat+0, 0
;LINK2.c,58 :: 		}
	GOTO        L_main15
L_main16:
;LINK2.c,59 :: 		}
L_main14:
;LINK2.c,60 :: 		if(PORTA.F1==0){
	BTFSC       PORTA+0, 1 
	GOTO        L_main17
;LINK2.c,61 :: 		send_data_command(command_3);
	MOVLW       66
	MOVWF       FARG_send_data_command_dat+0 
	CALL        _send_data_command+0, 0
;LINK2.c,62 :: 		while(PORTA.F1==0){
L_main18:
	BTFSC       PORTA+0, 1 
	GOTO        L_main19
;LINK2.c,63 :: 		repeat();
	CALL        _repeat+0, 0
;LINK2.c,64 :: 		}
	GOTO        L_main18
L_main19:
;LINK2.c,65 :: 		}
L_main17:
;LINK2.c,66 :: 		if(PORTA.F2==0){
	BTFSC       PORTA+0, 2 
	GOTO        L_main20
;LINK2.c,67 :: 		send_data_command(command_4);
	MOVLW       195
	MOVWF       FARG_send_data_command_dat+0 
	CALL        _send_data_command+0, 0
;LINK2.c,68 :: 		while(PORTA.F2==0){
L_main21:
	BTFSC       PORTA+0, 2 
	GOTO        L_main22
;LINK2.c,69 :: 		repeat();
	CALL        _repeat+0, 0
;LINK2.c,70 :: 		}
	GOTO        L_main21
L_main22:
;LINK2.c,71 :: 		}
L_main20:
;LINK2.c,72 :: 		if(PORTA.F3==0){
	BTFSC       PORTA+0, 3 
	GOTO        L_main23
;LINK2.c,73 :: 		send_data_command(command_5);
	MOVLW       36
	MOVWF       FARG_send_data_command_dat+0 
	CALL        _send_data_command+0, 0
;LINK2.c,74 :: 		while(PORTA.F3==0){
L_main24:
	BTFSC       PORTA+0, 3 
	GOTO        L_main25
;LINK2.c,75 :: 		repeat();
	CALL        _repeat+0, 0
;LINK2.c,76 :: 		}
	GOTO        L_main24
L_main25:
;LINK2.c,77 :: 		}
L_main23:
;LINK2.c,78 :: 		}
	GOTO        L_main12
;LINK2.c,79 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
