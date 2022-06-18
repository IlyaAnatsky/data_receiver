
CXX=/usr/bin/g++-7

CFLAGS = -c -std=c++11
LFLAGS = -o

LIBS = -lpthread -lboost_filesystem -lboost_system

SOURCES = data_receiver.cpp

OBJECTS = $(SOURCES:.cpp=.o)

EXECUTABLE = data_receiver

PREFIX = ./bin

all: uninstall clean $(EXECUTABLE) install start_test

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LFLAGS) $(EXECUTABLE) $(OBJECTS) $(LIBS)

.cpp.o:
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
