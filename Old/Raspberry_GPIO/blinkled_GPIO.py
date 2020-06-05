import RPI.GPIO as GPIO
import time

#Broadcom SOC channel - numbers before GPIO name in diagrams
GPIO.setmode(GPIO.BCM)

#Setando pino 18 como saida
GPIO.setup(18, GPIO.OUT)

#Ligando o led 
GPIO.output(18, GPIO.HIGH)

#Delay do led ligado
time.sleep(5) 
#desligando o led
GPIO.output(18, GPIO.LOW)
#Clear all ports that was used
GPIO.cleanup()