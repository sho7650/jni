#
#
#
COMPILER = gcc
CFLAGS   = -fPIC -Wall -Werror
# CFLAGS   = -Wall
LIBS     =
LDFLAGS  = -shared
INCLUDE  = -I./include -I./include/linux
TARGET   = ./lib/libJniSample.so
LIBDIR   = ./lib
SRCDIR   = ./source
SOURCES  = $(wildcard $(SRCDIR)/*.c)
OBJDIR   = ./obj
OBJECTS  = $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))
DEPENDS  = $(OBJECTS:.o=.d)

$(TARGET): $(OBJECTS) $(LIBS)
	-mkdir -p $(LIBDIR)
	$(COMPILER) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	-mkdir -p $(OBJDIR)
	$(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ -c $<

all: clean $(TARGET)

clean:
	-rm -f $(TARGET) $(OBJECTS) $(DEPENDS)

-include $(DEPENDS)
