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

function read_char()

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

function collecting_data()

str = "#"

repeat 
ch = read_char()
tmr.delay(250000)
print(ch)

if(ch ~= "t") then
str = str..ch
print(str)
end
until(ch == "#")

end

repeat 

print("Reading_values")
collecting_data()
print(node.heap())
print("sending_data_to the data_base")
value = gpio.read(process_pin)

until(value == 1)
