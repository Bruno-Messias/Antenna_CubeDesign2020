// rf4463_tx.pde

// Caution:RF4463 can only work under 3.3V
// please make sure the supply of you board is under 3.3V
// 5v supply will destroy RF4463 module!!

// This code runs in tx mode and  works with rf4463_rx.pde 
// Flow:receive "T" from serial->send a packet
// data of packet is "swwxABCDEFGHIm"

#include<RF4463.h>
#include <SPI.h>
#include <SoftwareSerial.h>
RF4463 rf4463;
unsigned char tx_buf[]={"swwxABCDEFGHIm"};
unsigned char test_buf[20];
unsigned char val;
unsigned char flag=0;    //  flag of rx mode
void setup() {
  Serial.begin(9600);
  if(!rf4463.init())
  {
     Serial.println("Init fail!");
  }
   rf4463.enterStandbyMode();
}
void loop() 
{
    val=Serial.read();  // please make sure serial is OK befor runing this code
    if(val=='T')    // tx a packet if receive "T"
    {
       rf4463.txPacket(tx_buf,sizeof(tx_buf));
       rf4463.enterStandbyMode();
       Serial.println("tx");
    }
}
