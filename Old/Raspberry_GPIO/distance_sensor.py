import RPI.GPIO as GPIO
import time

GPIO.setwarnings(False)
GPIO.cleanup()

#Broadcom SOC channel - numbers before GPIO name in diagrams
GPIO.setmode(GPIO.BCM)

TRIG = 4
ECHO = 18

GPIO.setup(TRIG, GPIO.OUT)
GPIO.setup(ECHO, GPIO.IN)

def get_distance():
    GPIO.output(TRIG, True)
    time.sleep(0.0001)
    GPIO.output(TRIG, False)

    while GPIO.input(ECHO) == False:
        start = time.time()

    while GPIO.input(ECHO) == True:
        end = time.time()

    sig_time = end-start

    #cm:
    distance = sig_time/ 0.000058 #inches: 0.000148

    print('Distance: {} cm'.format(distance))
    return distance

while True:
    distance = get_distance()
    time.sleep(0.05)




GPIO.cleanup()



