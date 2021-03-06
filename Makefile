SOURCES := $(filter-out winKeyLogger.cpp,$(wildcard *.cpp))
#SOURCES := $(wildcard *.cpp)
OBJECTS := $(SOURCES:.cpp=.o)
HEADERS := $(wildcard *.h)
TARGET  := main

COMMON   := -O2 -Wall -DNDEBUG
CFLAGS   := $(CFLAGS) $(COMMON)
CC       := g++
LD       := $(CC)

all : $(TARGET)
.PHONY : all

# {{{ for debugging
debug : CFLAGS += -g -DDEBUG=1 -U NDEBUG
debug : $(TARGETS)
.PHONY : debug
# }}}

$(OBJECTS) : %.o : %.cpp $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET) : $(OBJECTS)
	$(LD) -o $@ $^

.PHONY : clean
clean :
	rm -f $(OBJECTS) $(TARGET) output
