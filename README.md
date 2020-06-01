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
    * 2xGPIO - Para o deploy da Antena

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

