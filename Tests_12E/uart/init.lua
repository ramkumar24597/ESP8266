uart.setup(1,9600,uart.PARITY_NONE, uart.STOPBITS_1,1)  -- setup UART1 i.e. pin GPIO2
dofile("send_data.lua")
