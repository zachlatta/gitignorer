NAME = gitignorer

OBJS = main.o
CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)

SDIR = src
TDIR = test
ODIR = obj

MAIN_CC = $(SDIR)/main.cc
OTHER_FILES = Makefile \
			  README.md \
			  LICENSE.md

VERSION = $(shell command | grep '^#define VERSION ' $(MAIN_CC) | sed 's/^define VERSION //')

$(NAME) : $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o $(gitignorer)

$(ODIR)/%.o : %.cc
	$(CC) $(CFLAGS) $(MAIN_CC) $(MOD_CC)

clean:
	rm -rf $(ODIR)

tar:
	echo "Creating $(VERSION)-$(NAME).tar.gz"
	mkdir $(VERSION)
	mkdir $(VERSION)/$(SDIR)
	cp $(MAIN_CC) $(VERSION)/$(SDIR)
	mkdir $(VERSION)/$(TDIR)
	cp $(OTHER_FILES) $(VERSION)
	tar cfv $(VERSION)-$(NAME).tar $(VERSION)
	rm -rf $(VERSION)
