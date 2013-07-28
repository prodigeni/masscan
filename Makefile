
LIBS = -lrt -lpcap -lm
INCLUDES = -I.
DEFINES = 
CC = gcc
CFLAGS = -g $(INCLUDES) $(DEFINES) -Wall -Wstrict-aliasing=2 -O3 -rdynamic
.SUFFIXES: .c .cpp

tmp/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

SRC = $(wildcard src/*.c)
OBJ = $(addprefix tmp/, $(notdir $(addsuffix .o, $(basename $(SRC))))) 

bin/masscan: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) -lm $(LIBS) -lstdc++

clean:
	rm tmp/*.o
	rm bin/masscan

default: bin/masscan
