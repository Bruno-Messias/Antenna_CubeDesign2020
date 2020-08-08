# Antenna CubeDesign2020/21

Repository of devenloping an antenna for CubeDesign2020


 ## Antenna
 
 ### Overview: 
* Impedâcia casada em 50 Ohms
* Conector SMA e cabos coaxiais
* Antena:
  * Dipolo de 1/4 de Onda - Antena de 17cm
  
* Sistema de deploy:
  * Alimentação:
    * 3.3V e 90mA
  * Conexões
    * 1XGPIO - opção de utilizar um relê para quiemar o fio de deploy
---
## Diagram:

![](https://github.com/Bruno-Messias/Antenna_CubeDesign2020/blob/master/Documents/Overview_TT%26C/diagrams/Systeam.png)

---
## Adaptação das bilbiotecas:

* `<RF4463.h>`

- [ ] init()
    - [x] spiInit()
    - [x] pinInit()
    - [ ] powerOnReset()
      - [ ]spiWriteBuf(uint8_t writeLen,uint8_t* writeBuf)
        - [ ] spiByte(uint8_t writeData)

- [ ] checkDevice()
- [ ] txPacket(uint8_t* sendbuf,uint8_t sendLen)
- [ ] enterStandbyMode()
- [ ] rxinit()
- [ ] waitIRQ()
- [ ] rxPacket(uint8_t* recvbuf)
- [ ] setGPIOMode(uint8_t GPIO0Mode,uint8_t GPIO1Mode)
- [ ] setPreambleLen(uint8_t len)
- [ ] setSyncWords(uint8_t * syncWords,uint8_t len)
- [ ] setTxPower(uint8_t power)
- [ ] setCommand(uint8_t length,uint8_t command,uint8_t* paraBuf)
- [ ] getCommand(uint8_t length,uint8_t command,uint8_t* paraBuf)
- [ ] setProperties(uint16_t startProperty, uint8_t length ,uint8_t* paraBuf)
- [ ] getProperties(uint16_t startProperty, uint8_t length ,uint8_t* paraBuf)
- [ ] clrInterrupts()



- [ ] enterTxMode()
- [ ] enterRxMode()
- [ ] setConfig(const uint8_t* parameters,uint16_t paraLen)
- [ ] writeTxFifo(uint8_t* databuf,uint8_t length)
- [ ] ReadRxFifo(uint8_t* databuf)
- [ ] fifoReset()
- [ ] setTxInterrupt()
- [ ] setRxInterrupt()
- [ ] checkCTS()
- [ ] spiWriteBuf(uint8_t writeLen,uint8_t* writeBuf)
- [ ] spiReadBuf(uint8_t readLen,uint8_t* readBuf)

---
Using WiringPi mirror: [link](https://github.com/WiringPi/WiringPi)



