function app()

gpio.write(led,gpio.LOW)
tmr.delay(1000000)
print("low")
gpio.write(led,gpio.HIGH)
tmr.delay(1000000)
print("high")
end

-- program main
repeat

v = gpio.read(process_pin)
print("value of v is "..v)
app()
print(node.heap())

until(v == 1)
