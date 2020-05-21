// rf4463_sleep.pde

// Caution:RF4463 can only work under 3.3V
// please make sure the supply of you board is under 3.3V
// 5v supply will destroy RF4463 module!!

// This code runs in sleep mode

#include<RF4463.h>
#include <SPI.h>
#include <SoftwareSerial.h>
RF4463 rf4463;
void setup() {
  Serial.begin(9600);
  if(!rf4463.init())
  {
     Serial.println("Init fail!");
  }
  // enter sleep mode
   rf4463.enterStandbyMode();
}

void loop() 
{

}
