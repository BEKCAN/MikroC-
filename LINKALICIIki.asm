
_timer_routin:

;LINKALICIIki.c,6 :: 		void timer_routin(){
;LINKALICIIki.c,7 :: 		count++;
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;LINKALICIIki.c,8 :: 		if(count>0xFF){
	MOVLW       0
	MOVWF       R0 
	MOVF        _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timer_routin30
	MOVF        _count+0, 0 
	SUBLW       255
L__timer_routin30:
	BTFSC       STATUS+0, 0 
	GOTO        L_timer_routin0
;LINKALICIIki.c,9 :: 		count=0;
	CLRF        _count+0 
	CLRF        _count+1 
;LINKALICIIki.c,10 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;LINKALICIIki.c,11 :: 		}
L_timer_routin0:
;LINKALICIIki.c,12 :: 		}
L_end_timer_routin:
	RETURN      0
; end of _timer_routin

_interrupt:

;LINKALICIIki.c,14 :: 		void interrupt()
;LINKALICIIki.c,16 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;LINKALICIIki.c,17 :: 		timer_routin();
	CALL        _timer_routin+0, 0
;LINKALICIIki.c,18 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;LINKALICIIki.c,19 :: 		}
L_interrupt1:
;LINKALICIIki.c,20 :: 		if(INTCON.INT0IF){
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
;LINKALICIIki.c,22 :: 		xr=count;
	MOVF        _count+0, 0 
	MOVWF       _xr+0 
	MOVF        _count+1, 0 
	MOVWF       _xr+1 
;LINKALICIIki.c,23 :: 		count=0;
	CLRF        _count+0 
	CLRF        _count+1 
;LINKALICIIki.c,24 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;LINKALICIIki.c,25 :: 		if(i<0){ i=7; }
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt33
	MOVLW       0
	SUBWF       _i+0, 0 
L__interrupt33:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt3
	MOVLW       7
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_interrupt3:
;LINKALICIIki.c,26 :: 		if(xr==3){ // you may use if(xr==3||xr==4||xr==2){...}
	MOVLW       0
	XORWF       _xr+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt34
	MOVLW       3
	XORWF       _xr+0, 0 
L__interrupt34:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;LINKALICIIki.c,27 :: 		val[i]='0';
	MOVLW       _val+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_val+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       48
	MOVWF       POSTINC1+0 
;LINKALICIIki.c,28 :: 		i--;
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
;LINKALICIIki.c,29 :: 		if(i<0){ i=7; }
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt35
	MOVLW       0
	SUBWF       _i+0, 0 
L__interrupt35:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt5
	MOVLW       7
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_interrupt5:
;LINKALICIIki.c,30 :: 		}
	GOTO        L_interrupt6
L_interrupt4:
;LINKALICIIki.c,31 :: 		else if(xr==6){  // you may use if(xr==5||xr==6||xr==7){...}
	MOVLW       0
	XORWF       _xr+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt36
	MOVLW       6
	XORWF       _xr+0, 0 
L__interrupt36:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt7
;LINKALICIIki.c,32 :: 		val[i]='1';
	MOVLW       _val+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_val+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       49
	MOVWF       POSTINC1+0 
;LINKALICIIki.c,33 :: 		i--;
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
;LINKALICIIki.c,34 :: 		if(i<0){ i=7; }
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt37
	MOVLW       0
	SUBWF       _i+0, 0 
L__interrupt37:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt8
	MOVLW       7
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_interrupt8:
;LINKALICIIki.c,35 :: 		}
	GOTO        L_interrupt9
L_interrupt7:
;LINKALICIIki.c,38 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;LINKALICIIki.c,39 :: 		i=7;
	MOVLW       7
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
;LINKALICIIki.c,40 :: 		count=0;
	CLRF        _count+0 
	CLRF        _count+1 
;LINKALICIIki.c,41 :: 		}
L_interrupt9:
L_interrupt6:
;LINKALICIIki.c,42 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;LINKALICIIki.c,43 :: 		}
L_interrupt2:
;LINKALICIIki.c,44 :: 		}
L_end_interrupt:
L__interrupt32:
	RETFIE      1
; end of _interrupt

_main:

;LINKALICIIki.c,45 :: 		void main() {
;LINKALICIIki.c,46 :: 		ADCON1=0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;LINKALICIIki.c,47 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;LINKALICIIki.c,48 :: 		TRISB=0x01;
	MOVLW       1
	MOVWF       TRISB+0 
;LINKALICIIki.c,49 :: 		PORTB.F6=0;
	BCF         PORTB+0, 6 
;LINKALICIIki.c,50 :: 		PORTB.F5=0;
	BCF         PORTB+0, 5 
;LINKALICIIki.c,51 :: 		PORTB.F4=0;
	BCF         PORTB+0, 4 
;LINKALICIIki.c,52 :: 		PORTB.F3=0;
	BCF         PORTB+0, 3 
;LINKALICIIki.c,53 :: 		T0CON=0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;LINKALICIIki.c,54 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;LINKALICIIki.c,55 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;LINKALICIIki.c,56 :: 		INTCON.PEIE=1;
	BSF         INTCON+0, 6 
;LINKALICIIki.c,57 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;LINKALICIIki.c,58 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;LINKALICIIki.c,59 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;LINKALICIIki.c,60 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;LINKALICIIki.c,61 :: 		INTCON2.RBPU=1; // DISABLE PULUP REGISTER
	BSF         INTCON2+0, 7 
;LINKALICIIki.c,62 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;LINKALICIIki.c,63 :: 		while(1){
L_main10:
;LINKALICIIki.c,64 :: 		if(val[7]==val[0]){
	MOVF        _val+7, 0 
	XORWF       _val+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;LINKALICIIki.c,65 :: 		txt[7]=val[7];
	MOVF        _val+7, 0 
	MOVWF       _txt+7 
;LINKALICIIki.c,66 :: 		}
L_main12:
;LINKALICIIki.c,67 :: 		if(val[6]==val[1]){
	MOVF        _val+6, 0 
	XORWF       _val+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;LINKALICIIki.c,68 :: 		txt[6]=val[6];
	MOVF        _val+6, 0 
	MOVWF       _txt+6 
;LINKALICIIki.c,69 :: 		}
L_main13:
;LINKALICIIki.c,70 :: 		if(val[5]==val[2]){
	MOVF        _val+5, 0 
	XORWF       _val+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;LINKALICIIki.c,71 :: 		txt[5]=val[5];
	MOVF        _val+5, 0 
	MOVWF       _txt+5 
;LINKALICIIki.c,72 :: 		}
L_main14:
;LINKALICIIki.c,73 :: 		if(val[4]==val[3]){
	MOVF        _val+4, 0 
	XORWF       _val+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;LINKALICIIki.c,74 :: 		txt[4]=val[4];
	MOVF        _val+4, 0 
	MOVWF       _txt+4 
;LINKALICIIki.c,75 :: 		}
L_main15:
;LINKALICIIki.c,76 :: 		if(txt[4]=='0' && txt[5]=='0' && txt[6]=='0' && txt[7]=='1') {
	MOVF        _txt+4, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _txt+5, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _txt+6, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _txt+7, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
L__main28:
;LINKALICIIki.c,78 :: 		PORTB.F4=0;
	BCF         PORTB+0, 4 
;LINKALICIIki.c,79 :: 		PORTB.F3=0;
	BCF         PORTB+0, 3 
;LINKALICIIki.c,80 :: 		}
L_main18:
;LINKALICIIki.c,81 :: 		if(txt[4]=='0' && txt[5]=='0' && txt[6]=='1' && txt[7]=='0') {
	MOVF        _txt+4, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _txt+5, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _txt+6, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _txt+7, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
L__main27:
;LINKALICIIki.c,83 :: 		PORTB.F4=0;
	BCF         PORTB+0, 4 
;LINKALICIIki.c,84 :: 		PORTB.F3=1;
	BSF         PORTB+0, 3 
;LINKALICIIki.c,85 :: 		}
	GOTO        L_main22
L_main21:
;LINKALICIIki.c,89 :: 		PORTB.F4=1;
	BSF         PORTB+0, 4 
;LINKALICIIki.c,90 :: 		PORTB.F3=0;
	BCF         PORTB+0, 3 
;LINKALICIIki.c,91 :: 		}
L_main22:
;LINKALICIIki.c,92 :: 		if(PORTA.F2) if (duty_cycle_orani < 255) duty_cycle_orani++;
	BTFSS       PORTA+0, 2 
	GOTO        L_main23
	MOVLW       255
	SUBWF       _duty_cycle_orani+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main24
	INCF        _duty_cycle_orani+0, 1 
L_main24:
L_main23:
;LINKALICIIki.c,93 :: 		if(PORTA.F3) if (duty_cycle_orani > 0  ) duty_cycle_orani--;
	BTFSS       PORTA+0, 3 
	GOTO        L_main25
	MOVF        _duty_cycle_orani+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main26
	DECF        _duty_cycle_orani+0, 1 
L_main26:
L_main25:
;LINKALICIIki.c,94 :: 		PWM1_Set_Duty(duty_cycle_orani);
	MOVF        _duty_cycle_orani+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;LINKALICIIki.c,95 :: 		}
	GOTO        L_main10
;LINKALICIIki.c,96 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
