#include <RH_ASK.h>   // Include the RH_ASK library
#include <SPI.h>      // Not actually used but needed to compile the RH_ASK library

char inData[500];
int newmessage = 0;

 
RH_ASK radio(2000, 11, 12);
    // Speed of 2000 bits per second
    // Use pin 11 for reception
    // Use pin 12 for transmission

void setup() 
  // put your setup code here, to run once:
   Serial.begin(9600);   // Use this for debugging

   if (!radio.init()) 
    {
         Serial.println("Radio module failed to initialize");
    }
  
}

void loop() {
  // put your main code here, to run repeatedly:
   char inChar;
  byte index = 0;
  char mss[200];
  while (Serial.available() >= 1) {
    if (index < 499) {
      delay(100);
      inChar = Serial.read();
      inData[index] = inChar;
      index++;
      inData[index] = '\0';
    }
    newmessage = 1;
}
    if (newmessage == 1) {
      sprintf(mss, "%s", inData); //oq é? mudar??
      vw_send((uint8_t *)mss, strlen(mss));//mudar
      vw_wait_tx();//mudar
      Serial.print("You: "); //mudar
      Serial.println(mss); //mudar
      delay(1000); //mudar
      newmessage = 0; // Indicate that there is no new message to wait for the new one
    }
-------------------------
   // Send our message
    radio.send((uint8_t*)msg, strlen(msg));
 
    // Wait until the data has been sent
    radio.waitPacketSent();
 
    // Delay since we dont want to send a trillion packets 
    delay(1000);
 
    // Also inform the serial port that we are done!
    Serial.println("Data Sent");
---------------------------


    
