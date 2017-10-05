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
gpio.mode(process_pin,gpio.INPUT)
gpio.mode(col1,gpio.OUTPUT)
gpio.mode(col2,gpio.OUTPUT)
gpio.mode(col3,gpio.OUTPUT)


function character_read()

-- first column
gpio.write(col1,gpio.HIGH)
gpio.write(col2,gpio.LOW)
gpio.write(col3,gpio.LOW)

r1 = gpio.read(row1)
r2 = gpio.read(row2)
r3 = gpio.read(row3)
r4 = gpio.read(row4)

if(r1 == 1) then
return '1'
elseif(r2 == 1) then
return '4'
elseif(r3 == 1) then
return '7'
elseif(r4 == 1) then
return '*'
end

-- second column
gpio.write(col1,gpio.LOW)
gpio.write(col2,gpio.HIGH)
gpio.write(col3,gpio.LOW)

r1 = gpio.read(row1)
r2 = gpio.read(row2)
r3 = gpio.read(row3)
r4 = gpio.read(row4)

if(r1 == 1) then
return '2'
elseif(r2 == 1) then
return '5'
elseif(r3 == 1) then
return '8'
elseif(r4 == 1) then
return '0'
end

-- third column
gpio.write(col1,gpio.LOW)
gpio.write(col2,gpio.LOW)
gpio.write(col3,gpio.HIGH)

r1 = gpio.read(row1)
r2 = gpio.read(row2)
r3 = gpio.read(row3)
r4 = gpio.read(row4)

if(r1 == 1) then
return '3'
elseif(r2 == 1) then
return '6'
elseif(r3 == 1) then
return '9'
elseif(r4 == 1) then
return '#'
end

return 't'

end

repeat 

value = gpio.read(process_pin)
print("value of process_pin is "..value)
ch = character_read()
tmr.delay(260000)
print(node.heap())
print(ch)

until(value == 1)
