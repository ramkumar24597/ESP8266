led = 0
process_pin = 8

gpio.mode(led,gpio.OUTPUT)
gpio.mode(process_pin,gpio.INPUT)

dofile("main.lua")
