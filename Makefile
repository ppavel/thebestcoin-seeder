dnsseed: dns.o bitcoin.o netbase.o protocol.o db.o main.o
	g++ -pthread -lcrypto -o dnsseed dns.o bitcoin.o netbase.o protocol.o db.o main.o

%.o: %.cpp bitcoin.h netbase.h protocol.h db.h serialize.h uint256.h util.h
	g++ -pthread -O2 -ggdb3 -march=nocona -Wno-invalid-offsetof -c -o $@ $<

dns.o: dns.c
	gcc -pthread -std=c99 -O2 -ggdb3 -march=nocona dns.c -c -o dns.o

%.o: %.cpp
