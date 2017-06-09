#
#
#
COMPILER = gcc
CFLAGS   = -fPIC -shared
# CFLAGS   = -Wall
LIBS     =
LDFLAGS  = 
INCLUDE  = -I./include -I./include/linux
TARGET   = ./lib/JniSample.so
LIBDIR   = ./lib
SRCDIR   = ./source
SOURCES  = $(wildcard $(SRCDIR)/*.c)
OBJDIR   = ./obj
OBJECTS  = $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.cpp=.o)))
# DEPENDS  = $(OBJECTS:.o=.d)

$(TARGET): $(SOURCES)
	-mkdir -p $(LIBDIR)
	$(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ $<

all: clean $(TARGET)

clean:
	-rm -f $(TARGET)

# -include $(DEPENDS)
