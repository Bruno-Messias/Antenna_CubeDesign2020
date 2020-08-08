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
#include <SdFat.h>

RF4463 rf4463;
unsigned char tx_buf[]={"Hello World"};
unsigned char test_buf[20];
unsigned char val;
unsigned char flag=0;    //  flag of rx mode

SdFat sdCard;
SdFile meuArquivo;
 
// Pino ligado ao CS do modulo
const int chipSelect = 4;

void setup() {
  Serial.begin(9600);
  if(!rf4463.init())
  {
     Serial.println("Init fail!");
  }
  
  if(!sdCard.begin(chipSelect,SPI_HALF_SPEED))sdCard.initErrorHalt();
  // Abre o arquivo packet_bin
  if (!meuArquivo.open("packet_bin.txt", O_RDWR | O_CREAT | O_AT_END))
  {
    sdCard.errorHalt("Erro na abertura do arquivo LER_POT.TXT!");
  }
}
   rf4463.enterStandbyMode();
}
void loop() 
{
    val=Serial.read();  // please make sure serial is OK befor runing this code
    if(val=='t')    // tx a packet if receive "T"
    {
       rf4463.txPacket(tx_buf,sizeof(tx_buf));
       receivedVal = SPI.transfer(tx_buf) -
       meuArquivo.println(receivedVal);
       rf4463.enterStandbyMode();
       Serial.println("tx");
       meuArquivo.close();
    }
}
