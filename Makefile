CC=clang++
CFLAGS=-Wall -Wextra
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

$(OUTFILE): $(OBJS) $(INCLUDEOBJDIR)
	$(CC) $(CFLAGS) $(OBJS) $(INCLUDEOBJS) -o $(OUTFILE)

-include $(DEPS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR) $(HEADERINCLUDE)
	$(CC) $(CFLAGS) -MMD -I$(HEADERINCLUDE) -c $< -o $@


run: $(OUTFILE)
	@echo
	@echo "running program..."
	./$(OUTFILE)

clean:
	rm -rf $(BUILDDIR)

# task for creating folders
$(BUILDDIR) $(HEADERINCLUDE) $(INCLUDEOBJDIR) $(DEPSDIR):
	mkdir -p $@