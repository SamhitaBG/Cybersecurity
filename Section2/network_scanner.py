import socket
import time

ip = input("Enter IP: ")
ports = input("Enter ports (comma separated): ").split(",")

start = time.time()

f = open("scan_results.txt", "w")

for p in ports:
    s = socket.socket()
    result = s.connect_ex((ip, int(p)))

    if result == 0:
        print("Port", p, "OPEN")
        f.write("Port " + p + " OPEN\n")
    else:
        print("Port", p, "CLOSED")
        f.write("Port " + p + " CLOSED\n")

    s.close()

end = time.time()

print("Scan time:", end - start)
f.write("Scan time: " + str(end - start))

f.close()
