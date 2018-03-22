import socket
from textblob import TextBlob
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host="localhost"
port=1012
s.bind((host,port))
print ('Server Started')
while True:
        s.listen(1)
        conn, addr=s.accept()
        print ('Connected by ',addr)
        rdata=""
        while True:
                line="".join(iter(lambda:conn.recv(1),"\n"))
                if line.find("-9999")==-1:
                        rdata+=line+"\n"
                if line.find("-9999")!=-1:
                        break
                print(rdata)
                analysis=TextBlob(rdata)
                conn.sendall(repr(analysis.sentiment.polarity))
                print(analysis.sentiment.polarity)
        print ('Done Receiving')
        conn.close()
