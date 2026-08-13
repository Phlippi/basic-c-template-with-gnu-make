CC=clang++
CFLAGS=-Wall -Wextra
BUILDDIR=build
SRCDIR=src
HEADERINCLUDE=include/header
INCLUDEOBJDIR=include/object
INCLUDEOBJS=$(wildcard $(INCLUDEOBJDIR)/*.o)
OUTFILE=$(BUILDDIR)/out
SRCS=$(wildcard $(SRCDIR)/*.cpp)
OBJS=$(patsubst $(SRCDIR)/%.cpp, $(BUILDDIR)/%.o, $(SRCS))

all: $(OBJS) $(INCLUDEOBJDIR)
	$(CC) $(CFLAGS) $(OBJS) $(INCLUDEOBJS) -o $(OUTFILE)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp $(HEADERINCLUDE) $(BUILDDIR)
	$(CC) $(CFLAGS) -I$(HEADERINCLUDE) -c $< -o $@

run: all
	@echo
	@echo "running program..."
	./$(OUTFILE)

clean:
	rm -rf $(BUILDDIR)

# tasks for creating folders

$(BUILDDIR):
	mkdir -p $@

$(HEADERINCLUDE):
	mkdir -p $@

$(INCLUDEOBJDIR):
	mkdir -p $@

