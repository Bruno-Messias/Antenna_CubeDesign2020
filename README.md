# Antenna_CubeDesign2020

Repository of devenloping an antenna for CubeDesign2020


## TT&C

### Overview :
* Alimentação:

  * 3.3V e 30 mA - para o microcontrolador(apenas necessário para o beacon)
  * 5V para alimentação do módulo de transmissão

* Conexões:

  * Conector PC104
  * 2x SPI Bus - para Dados da Raspberry e para Beacon
  * 2x UART bus - para dados da EPS - telemetria no beacon outro para debug
  * 2xI2C para o módulo da antenna e para a operação do Raspberry
  * 5xGPIO para controles gerais da radio

* Frequência de operação: 437MHz - 438MHz(NGHam protocol) - pesquisar
* Modulacçao dos dados: GFSK(BT= 0.5)

 ---
 
 ## Antenna
 
 ### Overview: 
* Impedâcia casada em 50 Ohms
* Conector SMA e cabos coaxiais
* ...

