# Antenna CubeDesign2020/21

Repository of devenloping an antenna for CubeDesign2020


## TT&C

### Overview :
* Alimentação:

  * 3.3V e 30 mA - para o microcontrolador
  * 5V para alimentação do módulo de transmissão

* Conexões:

  * Conector PC104
  * 1x SPI Bus 3 - Para telemetria do EPS(2kbps)
  * 1x SPI Bus 4 - Para as imagens da rasp(8Mbps)
  * 1xI2C para o módulo da antenna a partir da rasp(deploy da antena) - *(possivelmente opcional)*
  * 4xGPIO para controles gerais da radio
  
  Obs: Possibilidade de usar o beacon para a telemetria das baterias e sensoriamento ADCS pelo Beacon -> necessidade da antena de 51 cm

* Frequência de operação: 437MHz - 438MHz(NGHam protocol) - pesquisar
* Modulacçao dos dados: GFSK(BT= 0.5)
 ---
 ## Antenna
 
 ### Overview: 
* Impedâcia casada em 50 Ohms
* Conector SMA e cabos coaxiais
* Antena:
  * Dipolo de 1/4 de Onda:
     * Antena Radio: 17 cm
     * Antena Beacon: 51 cm
* Sistema de deploy:
  * Alimentaçõa:
    * 3.3V e 90mA
  * Conexões
    * 1x I2C - para controle de abertura from TT&C
    * !x JTAG da TT&C
    
     

