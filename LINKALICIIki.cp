#line 1 "C:/Users/fethiye/Desktop/mikroc/IRlýnk kullanýmý-3/LINKALICIIki.c"
unsigned short duty_cycle_orani = 128;
unsigned int count=0,sgnal=0;
 int i=7,j=0,xr=0;
 char txt[]="........";
 char val[]="........";
 void timer_routin(){
 count++;
 if(count>0xFF){
 count=0;
 TMR0L=0;
 }
 }

 void interrupt()
 {
 if(INTCON.TMR0IF){
 timer_routin();
 INTCON.TMR0IF=0;
 }
 if(INTCON.INT0IF){

 xr=count;
 count=0;
 TMR0L=0;
 if(i<0){ i=7; }
 if(xr==3){
 val[i]='0';
 i--;
 if(i<0){ i=7; }
 }
 else if(xr==6){
 val[i]='1';
 i--;
 if(i<0){ i=7; }
 }
 else{

 TMR0L=0;
 i=7;
 count=0;
 }
 INTCON.INT0IF=0;
 }
 }
void main() {
ADCON1=0x0F;
 CMCON=7;
 TRISB=0x01;
 PORTB.F6=0;
 PORTB.F5=0;
 PORTB.F4=0;
 PORTB.F3=0;
 T0CON=0xC1;
 TMR0L=0;
 INTCON.GIE=1;
 INTCON.PEIE=1;
 INTCON.TMR0IE=1;
 INTCON.INT0IE=1;
 INTCON.TMR0IF=0;
 INTCON.INT0IF=0;
 INTCON2.RBPU=1;
 INTCON2.INTEDG0=0;
 while(1){
 if(val[7]==val[0]){
 txt[7]=val[7];
 }
 if(val[6]==val[1]){
 txt[6]=val[6];
 }
 if(val[5]==val[2]){
 txt[5]=val[5];
 }
 if(val[4]==val[3]){
 txt[4]=val[4];
 }
 if(txt[4]=='0' && txt[5]=='0' && txt[6]=='0' && txt[7]=='1') {

 PORTB.F4=0;
 PORTB.F3=0;
 }
 if(txt[4]=='0' && txt[5]=='0' && txt[6]=='1' && txt[7]=='0') {

 PORTB.F4=0;
 PORTB.F3=1;
 }
 else
 {

 PORTB.F4=1;
 PORTB.F3=0;
 }
 if(PORTA.F2) if (duty_cycle_orani < 255) duty_cycle_orani++;
 if(PORTA.F3) if (duty_cycle_orani > 0 ) duty_cycle_orani--;
 PWM1_Set_Duty(duty_cycle_orani);
 }
 }
