# Antenna CubeDesign2020/21

Repository of devenloping an antenna for CubeDesign2020


## TT&C

### Overview :
* Objetivos:
  * Implementar  toda a comunicação do satélite com a *GroundStation* via RF
     * Envio de telemetrias  das baterias periodicament
     * Envio  de dados de altitude do ADCS via telecomando
     * Envio das imagens adquiridas via telecomando
  * Receber telecomandos da *GroundStation*, como o deploy da antena

* Conexões:

  * 1x SPI Bus - para o envio de pacotes de dados e recepção de telecomandos
  * 6xGPIO
    * 4xGPIO - Para controles gerais do radio
    * 1xGPIO - Para o deploy da Antena
    * 1xGPIO - Para controle de alimentaçã para transmissão

* Frequência de operação: 437MHz - 438MHz(NGHam protocol)
* Modulacçao dos dados: GFSK(BT= 0.5)
 ---
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
- [ ] spiInit()
- [ ] pinInit()
- [ ] powerOnReset()
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




