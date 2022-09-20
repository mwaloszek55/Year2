from socket import *
from datetime import datetime

hostname = gethostname()
#local_ip = gethostbyname(hostname)

localPort   = 6789
buffer  = 1024

# creating UDP Socket (server)

sock = socket(family=AF_INET, type=SOCK_DGRAM)

#  binding UDP socket to local IP and given port

sock.bind((hostname, localPort))

# filler message
print("UDP server up and listening....")

# listening for incoming client messages
try:
    while(True):
        text_file = open("something.txt", "a") #opens file
        dt = datetime.now().strftime("%H:%M:%S") #gets time

        bytesAddressPair = sock.recvfrom(buffer)
        message = bytesAddressPair[0]   #actual msg from client
        address = bytesAddressPair[1]   #address & client port


        # sending a reply back to client

        message = message.decode()  #decodes msg
        messageUpper = message.upper()  #changes to all uppercase
        messageFromClient = ("Message:%s\t Data Received At %s\n" % (messageUpper, dt))
        msgToClient = messageFromClient.encode()    #encodes it again before sending

        sock.sendto(msgToClient, address)#sends encrypted data to client

        text_file.write(messageFromClient) #writing altered client message to file

        print("Client Message: %s" % message)   #printing client message
        print("IP Address and Port: %s" % str(address)) #printing client address and port
    
except:
    sock.close()


