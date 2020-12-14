#define address  0xff
  #define command_1 0xFF
  #define command_2 0x81
  #define command_3 0x42
  #define command_4 0xC3
  #define command_5 0x24
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
 ADCON1=0x0F;  // disable ADC converter
 CMCON=7; // to disable comparator
 TRISA.F0=1;
 TRISA.F1=1;
 TRISA.F2=1;
 TRISA.F3=1;
 TRISC.F2=0;

  PORTC.F2=0;
 while(1){
  if(PORTA.F0==0){
 send_data_command(command_2);
 while(PORTA.F0==0){
 repeat();
 }
  }
  if(PORTA.F1==0){
 send_data_command(command_3);
 while(PORTA.F1==0){
 repeat();
 }
  }
   if(PORTA.F2==0){
 send_data_command(command_4);
 while(PORTA.F2==0){
 repeat();
 }
  }
    if(PORTA.F3==0){
 send_data_command(command_5);
 while(PORTA.F3==0){
 repeat();
 }
  }
 }
 }
