local pin = 0

local i = 0

gpio.mode(pin,gpio.OUTPUT)

repeat
    i = i+1 
    print("value of i is "..i)
    gpio.write(pin,gpio.LOW)
    tmr.delay(1000000)
    print("high")
    gpio.write(pin,gpio.HIGH)
    tmr.delay(1000000)
    print("low")
until(i == 5)
