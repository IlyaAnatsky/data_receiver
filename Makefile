
CC=gcc

CFLAGS = -c
LFLAGS = -o

LIBS = -lpthread -lboost_filesystem -lboost_system

SOURCES = data_receiver.cpp

OBJECTS = $(SOURCES:.cpp=.o)

EXECUTABLE = data_receiver

PREFIX = ./bin

all: uninstall clean $(EXECUTABLE) install start_test

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LFLAGS) $(EXECUTABLE) $(OBJECTS) $(LIBS)

.c.o:
	$(CXX) $(CFLAGS) $< -o $@

clean: 
	rm -rf $(EXECUTABLE) *.o
	
install:
	test -d $(PREFIX) || mkdir $(PREFIX) 
	mv -f ./$(EXECUTABLE) $(PREFIX)
			
uninstall:
	rm -rf $(PREFIX)/$(EXECUTABLE) 

start_test:
	test -f $(PREFIX)/$(EXECUTABLE) && $(PREFIX)/$(EXECUTABLE)
