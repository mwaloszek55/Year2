# from the socket module import all
from socket import *
import sys
#input command line arguments to be used as variables throughout the client script.
filename = sys.argv[1]
server_host = sys.argv[2]
server_port = sys.argv[3]
#import sys
# Create a TCP server socket
#(AF_INET is used for IPv4 protocols)
#(SOCK_STREAM is used for TCP)
sock = socket(AF_INET, SOCK_STREAM)
# set values for host 'localhost' - meaning this machine and port number 10000
# the machine address and port number have to be the same as the server is using.
# changing type of server_port to int because it's currently in string format
server_address = (server_host, int(server_port))
# output to terminal some info on the address details
# Connect the socket to the host and port
sock.connect(server_address)
try:
    # send HTTP GET request using the TCP connection
    message = "GET /%s HTTP/1.1\r\nHost:%s:%s\r\n\r\n" % (filename, server_host, server_port)
    sock.sendall(message.encode())
    
    # receive the server's response output
    response = b""
    while True:
        received = sock.recv(4096)
        if len(received) == 0:
            break
        response = response + received

    #print and decode the response from the server in full
    print(response.decode())
    
    
finally:
        print('closing socket')
        sock.close()