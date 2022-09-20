from socket import *
import sys
import time
import math
sequence_number = 1
udp_seq = int(sys.argv[1])
server_host = sys.argv[2]
port = 12000
print("\nPING %s\n\n" % (server_host))
serverAddressPort = (server_host, port)
times = []
serverSocket = socket(family=AF_INET, type=SOCK_DGRAM)
sent = 0

while True:
    try:

        if sequence_number < (udp_seq + 1):
            t1 = time.time()
            msg = "Ping %d %s" % (sequence_number, t1)
            serverSocket.sendto(msg.encode(), serverAddressPort)
            serverSocket.settimeout(1)

            data , addr = serverSocket.recvfrom(1024)
            t2 = time.time()
            Atime = t2-t1
            Atime = str(Atime * 1000)
            times.append(float(Atime))
            print("message from {0}: udp_seq: {1:.2f} time= {2} ms".format(addr, sequence_number, Atime))
            sequence_number=sequence_number+1
            sent += 1
        else:
            if sent / udp_seq == 1:
                loss = 0
            elif sent > 0:
                lost = sent - udp_seq
                loss = lost / udp_seq
                loss = abs(loss * 100)
            else:
                loss = 100
            print("--- ping statistics for: ", server_host, " ---")
            print("{0} packets transmitted, {1} packets received, {2} % packet loss".format(udp_seq, sent, loss))
            newTimes = []
            if times:
                avg = sum(times) / len(times)
                if len(times) > 1:
                    for num in times:
                        newNum = (num - avg)
                        newNum = newNum ** 2
                        newTimes.append(newNum)
                    SDavg = sum(newTimes) / len(newTimes)
                    standarddeviation = math.sqrt(SDavg)    
                else:
                    standarddeviation = 0
            else:
                avg = 0
                standarddeviation = 0
            print("round-trip min/avg/max/stddev = {0:.2f}/{1:.2f}/{2:.2f}/{3:.2f}\n\n".format(min(times), avg, max(times), standarddeviation))
            break

    except timeout:
        sequence_number=sequence_number+1
        print("Request timed out.")
        if sequence_number == (udp_seq + 1):
            if sent / udp_seq == 1:
                loss = 0
            elif sent > 0:
                loss = sent / udp_seq
                loss = abs(loss * 100)
            else:
                loss = 100
            print("\n\n--- ping statistics for: ", server_host, " ---")
            print("{0:.2f} packets transmitted, {1:.2f} packets received, {2:.2f} % packet loss".format(udp_seq, sent, loss))
            newTimes = []
            if times:
                avg = sum(times) / len(times)
                if len(times) > 1:
                    for num in times:
                        newNum = (num - avg)
                        newNum = newNum ** 2
                        newTimes.append(newNum)
                    SDavg = sum(newTimes) / len(newTimes)
                    standarddeviation = math.sqrt(SDavg)   
                else: 
                    standarddeviation = 0
            else:
                avg = 0
                standarddeviation = 0
            print("round-trip min/avg/max/stddev = {0:.2f}/{1:.2f}/{2:.2f}/{3:.2f}\n\n".format(min(times), avg, max(times), standarddeviation))
            break