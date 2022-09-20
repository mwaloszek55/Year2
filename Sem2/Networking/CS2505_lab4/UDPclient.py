from socket import *


hostname = gethostname()
#local_ip = gethostbyname(hostname)
msg       = "Hello UDP Server" #whatever msg you want the server to receive, could be manually inputted by doing msg = input("Write something here")
bytesToSend         = str.encode(msg)
serverAddressPort   = (hostname, 6789) #the server address could be whatever, since im using 1 machine it's just binded to MY hostname/domainname
buffer          = 1024  


# Creating of UDP socket (client)

sock = socket(family=AF_INET, type=SOCK_DGRAM)

# Sending bytes to server

sock.sendto(bytesToSend, serverAddressPort) #sending encoded msg to specific server

#msg received BACK from the server.
msgFromServer = sock.recvfrom(buffer)

#decoding and printing msg received from server.
print(msgFromServer[0].decode())