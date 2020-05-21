#include <RH_ASK.h>   // Include the RH_ASK library
#include <SPI.h>      // Not actually used but needed to compile the RH_ASK library

char inData[500];
int newmessage = 0;


RH_ASK radio(2000, 11, 12);
// Speed of 2000 bits per second
// Use pin 11 for reception
// Use pin 12 for transmission

void setup(){
// put your setup code here, to run once:
Serial.begin(9600);   // Use this for debugging

if (!radio.init()) {
  Serial.println("Radio module failed to initialize");
}
}
void loop() {
  // put your main code here, to run repeatedly:
  char inChar;
  byte index = 0;
  char msg[200];
  while (Serial.available() >= 1) {
    if (index < 499) {
      delay(50);
      inChar = Serial.read();
      inData[index] = inChar;
      index++;
      inData[index] = '\0';
    }
    newmessage = 1;
  }
  if (newmessage == 1) {
    sprintf(msg, "%s", inData);// Conversão de caracteres para string
    radio.send((uint8_t*)msg, strlen(msg));//Enviando pacotes
    radio.waitPacketSent();//Esperando a transferencia completa
    Serial.print("You: ");
    Serial.println(msg);
    delay(600);
    newmessage = 0; // Indicate that there is no new message to wait for the new one
  }
  // Create a char buffer
  uint8_t buf[RH_ASK_MAX_MESSAGE_LEN];
  uint8_t buflen = sizeof(buf);
  ///Reciever Msg
   if (radio.recv(buf, &buflen)){
    Serial.print("Friend: ");
     for (int i = 0; i < buflen; i++) {
      Serial.write(buf[i]);
    }
    Serial.println();         
  }

}
