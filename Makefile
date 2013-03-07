NAME = gitignorer

CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)

SDIR = src
TDIR = test
ODIR = obj

MAIN = $(SDIR)/main.cc
SRCS = 
OBJS = main.o
OTHER_FILES = Makefile \
			  README.md \
			  LICENSE.md

VERSION = $(shell command | sed -n 's/^\#define VERSION //p' $(MAIN))

all: $(NAME) clean

$(NAME) : $(OBJS)
	$(CC) $(CFLAGS) -o $@ ${OBJS}

clean:
	rm -rf *.o core *.core

.cc.o :
	$(CC) $(CFLAGS) -c %<

tar:
	echo "Creating $(VERSION)-$(NAME).tar.gz"
	mkdir $(VERSION)
	mkdir $(VERSION)/$(SDIR)
	cp $(MAIN) $(VERSION)/$(SDIR)
	mkdir $(VERSION)/$(TDIR)
	cp $(OTHER_FILES) $(VERSION)
	tar cfv $(VERSION)-$(NAME).tar $(VERSION)
	rm -rf $(VERSION)
