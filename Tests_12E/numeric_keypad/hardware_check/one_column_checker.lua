row1 = 1
row2 = 2
row3 = 3
row4 = 0
col1 = 5
col2 = 6
col3 = 7
process_pin = 8

gpio.mode(row1,gpio.INPUT)
gpio.mode(row2,gpio.INPUT)
gpio.mode(row3,gpio.INPUT)
gpio.mode(row4,gpio.INPUT)
gpio.mode(col1,gpio.OUTPUT)
gpio.mode(col2,gpio.OUTPUT)
gpio.mode(col3,gpio.OUTPUT)
gpio.mode(process_pin,gpio.INPUT)

function reader()

-- first column
gpio.write(col1,gpio.HIGH)
gpio.write(col2,gpio.LOW)
gpio.write(col3,gpio.LOW)

r1 = gpio.read(row1)
r2 = gpio.read(row2)
r3 = gpio.read(row3)
r4 = gpio.read(row4)

print(r1.."\t"..r2.."\t"..r3.."\t"..r4)

tmr.delay(100000)

end

repeat
value = gpio.read(process_pin)
print("value is "..value)
reader()

until(value == 1)
