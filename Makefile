CC=clang++
# The base compiler flagsd that will alway be used
CFLAGS=-Wall -Wextra -std=c++20
RELEASECFLAGS=-O2
DEBUGCFLAGS=-O0 -g
BUILDDIR=build
SRCDIR=src
HEADERINCLUDE=include/header
INCLUDEOBJDIR=include/object
OUTFILE=$(BUILDDIR)/out
DEPSDIR=$(BUILDDIR)/deps
INCLUDEOBJS=$(wildcard $(INCLUDEOBJDIR)/*.o)
SRCS=$(wildcard $(SRCDIR)/*.cpp)
DEPS=$(wildcard $(BUILDDIR)/*.d)
OBJS=$(patsubst $(SRCDIR)/%.cpp, $(BUILDDIR)/%.o, $(SRCS))

debug: CFLAGS:=$(CFLAGS) $(DEBUGCFLAGS)
debug: $(OUTFILE)

release: CFLAGS:=$(CFLAGS) $(RELEASECFLAGS)
release: clean $(OUTFILE)

$(OUTFILE): $(OBJS) $(INCLUDEOBJDIR)
	$(CC) $(CFLAGS) $(OBJS) $(INCLUDEOBJS) -o $(OUTFILE)

-include $(DEPS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR) $(HEADERINCLUDE)
	@echo "compiling $@"
	$(CC) $(CFLAGS) -MMD -I$(HEADERINCLUDE) -c $< -o $@


run: $(OUTFILE)
	@echo
	@echo "running program..."
	./$(OUTFILE)

clean:
	@echo "cleaning build folder..."
	rm -rf $(BUILDDIR)/*

# task for creating folders
$(BUILDDIR) $(HEADERINCLUDE) $(INCLUDEOBJDIR) $(DEPSDIR):
	mkdir -p $@