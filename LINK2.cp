#line 1 "C:/Users/fethiye/Desktop/mikroc/IRlýnk kullanýmý-3/LINK2.c"






 unsigned int i=0,j=0;
 void repeat(){
 PWM1_Start();
 delay_us(8000);
 PWM1_Stop();
 delay_us(8000);
 }
 send_data_byte(unsigned char dattt){
 PWM1_init(36000);
 PWM1_Set_Duty(127);
 for(j=0;j<8;j++){
 PWM1_Start();
 delay_us(562);
 PWM1_Stop();
 if(dattt & 0x01){
 delay_us(1687);
 dattt=dattt>>1;
 }
 else
 {
 delay_us(562);
 dattt=dattt>>1;
 }
 }
 PWM1_Stop();
 }
 void send_data_command(unsigned char dat){
 PWM1_init(36000);
 PWM1_Set_Duty(127);
 PWM1_Start();
 delay_us(9000);
 PWM1_Stop();
 delay_us(4500);
 send_data_byte(dat);
 repeat();
 }
 void main() {
 ADCON1=0x0F;
 CMCON=7;
 TRISA.F0=1;
 TRISA.F1=1;
 TRISA.F2=1;
 TRISA.F3=1;
 TRISC.F2=0;

 PORTC.F2=0;
 while(1){
 if(PORTA.F0==0){
 send_data_command( 0x81 );
 while(PORTA.F0==0){
 repeat();
 }
 }
 if(PORTA.F1==0){
 send_data_command( 0x42 );
 while(PORTA.F1==0){
 repeat();
 }
 }
 if(PORTA.F2==0){
 send_data_command( 0xC3 );
 while(PORTA.F2==0){
 repeat();
 }
 }
 if(PORTA.F3==0){
 send_data_command( 0x24 );
 while(PORTA.F3==0){
 repeat();
 }
 }
 }
 }
