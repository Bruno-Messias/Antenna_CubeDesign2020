// rf4463_slave.pde

// Caution:RF4463 module can only work under 3.3V
// please make sure the supply of you board is under 3.3V
// lora supply will destroy RF4463 module!!

// This code runs in slave mode and  works with rf_4463_master.pde 
// Flow:receive packet from master->print to serial->reply
// data of packet is "swwxABCDEFGHIm"

#include<RF4463.h>
#include <SPI.h>
#include <SoftwareSerial.h>
RF4463 rf4463;
unsigned char tx_buf[]={"swwxABCDEFGHIm"};
unsigned char val;
unsigned char flag=1;    //  flag of rx mode
unsigned char rx_len;
unsigned char rx_buf[20];

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
    if(flag==0)    // tx a packet if receive a packet
    {
       rf4463.txPacket(tx_buf,sizeof(tx_buf));
       rf4463.rxInit();    // turn to rx mode to wait for reply of slave
       flag=1;             // enable rx flag
       Serial.println("tx");
    }
    else            // if(flag==1)
    {
        if(rf4463.waitnIRQ())    // wait for PACKET_RX interrupt
      {
            flag=0;                          // clear rx flag
            rf4463.clrInterrupts();
            rx_len=rf4463.rxPacket(rx_buf);  // read rx data
            Serial.write(rx_buf,rx_len);    // print out by serial
            Serial.println();
            rf4463.enterStandbyMode();      // go to sleep till next tx
      }
    }

}
