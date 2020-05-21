#include <VirtualWire.h>
char inData[500];
int newmessage = 0;

void setup() {
  vw_setup(2000);
  vw_set_tx_pin(12); //pin 12 = transmitter
  vw_rx_start(); //pin 11 = reciever
  Serial.begin(9600);
}

void loop() {
  char inChar;
  byte index = 0;
  char mss[200];
  while (Serial.available() >= 1) {
    if (index < 499) {
      inChar = Serial.read();
      inData[index] = inChar;
      index++;
      inData[index] = '\0';
      delay(100);
    }
    newmessage = 1;
  }

  if (newmessage == 1) {
    sprintf(mss, "%s", inData);
    vw_send((uint8_t *)mss, strlen(mss));
    vw_wait_tx();
    Serial.print("You: ");
    Serial.println(mss);
    delay(600);
    newmessage = 0; // Indicate that there is no new message to wait for the new one
  }

  byte message[VW_MAX_MESSAGE_LEN];
  byte messageLength = VW_MAX_MESSAGE_LEN;
  if (vw_get_message(message, &messageLength)) {
    Serial.print("Friend: ");
    for (int i = 0; i < messageLength; i++) {
      Serial.write(message[i]);
    }
    Serial.println();
  }
}
