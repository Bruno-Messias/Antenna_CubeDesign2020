#include <RH_ASK.h>
#include <SPI.h> // Not actualy used but needed to compile
 
RH_ASK radio;
 
void setup()
{
    Serial.begin(9600);   // Use this for debugging
 
    // Speed of 2000 bits per second
    // Use pin 11 for reception
    // Use pin 12 for transmission
    
    if (!radio.init())
    {
         Serial.println("Radio module failed to initialize");
    }
}
 
void loop()
{
  // Create a 32 byte char buffer
  uint8_t receive_buffer[32];
  uint8_t buflen = sizeof(receive_buffer);
 
  // If data is available, print it
  if (radio.recv(receive_buffer, &buflen))
  {
    Serial.print("Message: ");
    Serial.println((char*)receive_buffer);         
  }
}
