#
#
#
COMPILER = gcc
CFLAGS   = -g -MMD -MP -Wall -Wextra -Winit-self -Wno-missing-field-initializers -fPIC -shared
# CFLAGS   = -Wall
LIBS     =
LDFLAGS  = 
INCLUDE  = -I./include -I./include/linux
TARGET   = ./lib/libJniSample.so
SRCDIR   = ./source
SOURCES  = $(wildcard $(SRCDIR)/*.c)
OBJDIR   = ./obj
OBJECTS  = $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.cpp=.o)))
DEPENDS  = $(OBJECTS:.o=.d)

$(TARGET): $(SOURCES)
	$(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ $<

all: clean $(TARGET)

clean:
	-rm -f $(DEPENDS) $(TARGET)

-include $(DEPENDS)
